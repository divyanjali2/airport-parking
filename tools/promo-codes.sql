-- Run against the application's airport--parking database.
-- amount is a percentage for 'percentage', or LKR for 'fixed'.
-- Dates are inclusive and use the site's Asia/Colombo timezone.
CREATE TABLE IF NOT EXISTS `promo_codes` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(150) NOT NULL,
    `code` VARCHAR(64) NOT NULL,
    `discount_type` ENUM('percentage', 'fixed') NOT NULL DEFAULT 'fixed',
    `amount` DECIMAL(10,2) NOT NULL,
    `free_shuttle` TINYINT(1) NOT NULL DEFAULT 0,
    `valid_from` DATE DEFAULT NULL,
    `valid_until` DATE DEFAULT NULL,
    `is_active` TINYINT(1) NOT NULL DEFAULT 1,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `promo_codes_code_unique` (`code`),
    CONSTRAINT `promo_codes_amount_valid` CHECK (
        `amount` >= 0 AND (`discount_type` <> 'percentage' OR `amount` <= 100)
    ),
    CONSTRAINT `promo_codes_dates_valid` CHECK (
        `valid_from` IS NULL OR `valid_until` IS NULL OR `valid_until` >= `valid_from`
    )
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Preserve any edits to an existing promotion when running this script again.
INSERT INTO `promo_codes`
    (`name`, `code`, `discount_type`, `amount`, `free_shuttle`, `valid_from`, `valid_until`, `is_active`)
SELECT 'Black Friday 2026', 'BLACKFRIDAY10FREE', 'percentage', 10.00, 1,
       '2026-11-13', '2026-11-30', 1
WHERE NOT EXISTS (
    SELECT 1 FROM `promo_codes` WHERE `code` = 'BLACKFRIDAY10FREE'
);
