-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NULL,
    `PhoneNo` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `User_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Refferees` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NULL,
    `PhoneNo` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Refferees_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Reffers` (
    `ReffererId` INTEGER NOT NULL,
    `ReffereeId` INTEGER NOT NULL,

    UNIQUE INDEX `Reffers_ReffereeId_key`(`ReffereeId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Reffers` ADD CONSTRAINT `Reffers_ReffererId_fkey` FOREIGN KEY (`ReffererId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Reffers` ADD CONSTRAINT `Reffers_ReffereeId_fkey` FOREIGN KEY (`ReffereeId`) REFERENCES `Refferees`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
