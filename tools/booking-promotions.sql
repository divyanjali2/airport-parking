-- Keep the applied discount on each booking even if its promo changes later.
ALTER TABLE `reserved_slots`
    ADD COLUMN IF NOT EXISTS `promo_code` VARCHAR(64) DEFAULT NULL,
    ADD COLUMN IF NOT EXISTS `promo_discount` DECIMAL(10,2) NOT NULL DEFAULT 0,
    ADD COLUMN IF NOT EXISTS `shuttle_discount` DECIMAL(10,2) NOT NULL DEFAULT 0,
    ADD COLUMN IF NOT EXISTS `subtotal_before_discount` DECIMAL(10,2) DEFAULT NULL;
