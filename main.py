

import random
import math

import pygame
from pygame import mixer
from pygame import font

#initialization
pygame.init()
pygame.font.init()

# myFont = pygame.font.SysFont("Times New Roman", 30)
screen = pygame.display.set_mode((800, 600))

#caption
pygame.display.set_caption("Space Invader")

#toseticon
icon1 = pygame.image.load('image_asset/ufo.png')
pygame.display.set_icon(icon1)

# player
playerimg = pygame.image.load('image_asset/player.png')
playerX = 370
playerY = 480
playerX_ch = 0

# bullet
bulletimg = pygame.image.load("image_asset/bullet.png")
bulletX = 0
bulletY = 480
bulletX_ch = 0
bulletY_ch = 10
bullet_state = 'ready'
score_value = 0

font1 = pygame.font.SysFont("freesansbold.tff", 32)
textX = 10
textY = 10

# gameover
gameover_font = pygame.font.SysFont("freesansbold.ttf", 70)


def gameover_text():
    gameover_text = gameover_font.render("GAME OVER", True, (255, 255, 255))
    screen.blit(gameover_text, (200, 250))


# score
def show_score(x, y):
    score = font1.render("SCORE: " + str(score_value), True, (255, 255, 255))
    screen.blit(score, (x, y))


# enemy
enemyImg = []
enemyX = []
enemyY = []
enemyX_ch = []
enemyY_ch = []
enemy_no = 6
for i in range(enemy_no):
    enemyImg.append(pygame.image.load('image_asset/enemy (1).png'))
    enemyX.append(random.randint(0, 800-64))
    enemyY.append(random.randint(50, 150))
    enemyX_ch.append(3)
    enemyY_ch.append(40)

# background
backgroundImg = pygame.image.load('image_asset/background (1).png')
mixer.music.load('image_asset/background.wav')
mixer.music.play(-1)


# collision f(n)
def isCollision(enemyX, enemyY, bulletX, bulletY):
    dist = math.sqrt(math.pow(enemyX - bulletX, 2) + math.pow(enemyY - bulletY, 2))
    if dist < 27:
        return True
    else:
        return False


# bullet fire
def fire_bullet(x, y):
    global bullet_state
    bullet_state = 'fire'
    screen.blit(bulletimg, (x + 16, y + 10))


# player f(n)
def player(x, y):
    screen.blit(playerimg, (x, y))


# enemy f(n)
def enemy(x, y, i):
    screen.blit(enemyImg[i], (x, y))


# gamewindow

running = True
while running:
    screen.fill((0, 0, 0))
    screen.blit(backgroundImg, (0, 0))

    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_LEFT:
                playerX_ch = -4

            if event.key == pygame.K_RIGHT:
                playerX_ch = 4

            if event.key == pygame.K_SPACE:
                if bullet_state == 'ready':
                    bulletsound = mixer.Sound('image_asset/laser.wav')
                    bulletsound.play()
                    bulletX = playerX
                    fire_bullet(bulletX, bulletY)

        if event.type == pygame.KEYUP:
            if event.key == pygame.K_a or event.key == pygame.K_d:
                player_ch = 0

    playerX += playerX_ch
    if playerX <= 0:
        playerX = 0

    elif playerX >= 736:
        playerX = 736

    # BULLET MOVEMENT
    if bulletY <= 0:
        bulletY = 480
        bullet_state = 'ready'

    if bullet_state == 'fire':
        fire_bullet(bulletX, bulletY)
        bulletY -= bulletY_ch
        bulletX += playerX_ch

    # enemy movement
    for i in range(enemy_no):

        # Game Over
        if enemyY[i] > 440:
            for j in range(enemy_no):
                enemyY[j] = 2000
            gameover_text()
            break

        enemyX[i] += enemyX_ch[i]
        if enemyX[i] <= 0:
            enemyX_ch[i] = 4
            enemyY[i] += enemyY_ch[i]
        elif enemyX[i] >= 736:
            enemyX_ch[i] = -4
            enemyY[i] += enemyY_ch[i]

        collision = isCollision(enemyX[i], enemyY[i], bulletX, bulletY)
        if collision:
            explosionsound = mixer.Sound("image_asset/explosion.wav")
            explosionsound.play()
            bulletY = 480
            bullet_state = 'ready'
            score_value += 1
            enemyX[i] = random.randint(0, 735)
            enemyY[i] = random.randint(50, 150)
        enemy(enemyX[i], enemyY[i], i)

    player(playerX, playerY)
    show_score(textX, textY)
    pygame.display.update()