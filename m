Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 818D77E22E
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Apr 2018 12:40:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752919AbeDJMkh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Apr 2018 08:40:37 -0400
Received: from mail-wr0-f193.google.com ([209.85.128.193]:43917 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752752AbeDJMkg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Apr 2018 08:40:36 -0400
Received: by mail-wr0-f193.google.com with SMTP id p53so12647202wrc.10
        for <linux-doc@vger.kernel.org>; Tue, 10 Apr 2018 05:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=q12/hDkHVJwSuGlEoxifeRXDZnsYu4E440ExNmEBQ6w=;
        b=sn0/HRUPhIqZA3hjfbL4jzPl+qQhH5JtCDZMR0SlQuflCeOQpq4TkmJ3IGJj1cpqcP
         cR2BkXGrtGqFagwxtNrc4ri35gemHdIYjWzYJAoCR4dSQsyR1HOk5wODFojETy5gUi6k
         hucqlkAdBIflIcV28M6D531+mYH1lBNuxBx7dT2OUmXCI4p0iayi+HoOjQPxzgvBitRu
         j21VwD6Ef7DsQKm4RbEvAVW4irx0worVyTCHECL3nNZ8w7oxLxx3FfweCn1jmasr/SOw
         QZ+pMV8wQ3P2KOLt3YmlH/L7EXSkuWZeM1XvhxcdWe1Ij5KYOczbrHGYmLDT94atoNef
         shrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=q12/hDkHVJwSuGlEoxifeRXDZnsYu4E440ExNmEBQ6w=;
        b=A5uXROiqr2WKEV2psfOOXg8uR6vmFneZkBNx6cC/yg7LzuUY7MZFDGMFmlOmo7vQZv
         tuOrNq4/mW+BGecFaf7VNppmSXmV/OoLZU+m78NpBV3MSdFXREUJRDOEARUdenlEDayM
         /QvGx0LYiMB01bpxAKLQNvB8He65o33x4kI3jPjE2j/E6bkbHQrocoQXiIIGZUGK7DO5
         qKfBtmbeKIpH1FxFfOnP9rQPO5XmtOroBMWoVZ20DefXOBzkhiuK5OZy329pINmhIeAy
         yr+7ul5DKmxUi0vSVcW8h5CCvsi7aT+wMbZVvf4LXcVlE+KQg2e66gfvJ77nwbv/HM53
         ADTA==
X-Gm-Message-State: ALQs6tALQiYViqPdGHcNRaNFriSJ+ROc9LXkRKngRI0pPnJnsWUuQnlu
        vSGlccdEaaX0V3kEoq/mBIg+zQ==
X-Google-Smtp-Source: AIpwx48VuQElpuYNy1ouubJzV2ubp1fGlb23+lP76eXN9CHvLD0R0/T+DBLkWHRSeeqeQ686ePiudA==
X-Received: by 10.223.130.246 with SMTP id 109mr196258wrc.45.1523364034999;
        Tue, 10 Apr 2018 05:40:34 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-1-7086-217.w90-116.abo.wanadoo.fr. [90.116.254.217])
        by smtp.gmail.com with ESMTPSA id 11sm2010107wmd.1.2018.04.10.05.40.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Apr 2018 05:40:34 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] gpiolib: add hogs support for machine code
Date:   Tue, 10 Apr 2018 14:40:29 +0200
Message-Id: <20180410124029.2915-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.17.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Board files constitute a significant part of the users of the legacy
GPIO framework. In many cases they only export a line and set its
desired value. We could use GPIO hogs for that like we do for DT and
ACPI but there's no support for that in machine code.

This patch proposes to extend the machine.h API with support for
registering hog tables in board files.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 Documentation/driver-api/gpio/board.rst | 16 ++++++
 drivers/gpio/gpiolib.c                  | 67 +++++++++++++++++++++++++
 include/linux/gpio/machine.h            | 31 ++++++++++++
 3 files changed, 114 insertions(+)

diff --git a/Documentation/driver-api/gpio/board.rst b/Documentation/driver-api/gpio/board.rst
index 25d62b2e9fd0..2c112553df84 100644
--- a/Documentation/driver-api/gpio/board.rst
+++ b/Documentation/driver-api/gpio/board.rst
@@ -177,3 +177,19 @@ mapping and is thus transparent to GPIO consumers.
 
 A set of functions such as gpiod_set_value() is available to work with
 the new descriptor-oriented interface.
+
+Boards using platform data can also hog GPIO lines by defining GPIO hog tables.
+
+.. code-block:: c
+
+        struct gpiod_hog gpio_hog_table[] = {
+                GPIO_HOG("gpio.0", 10, "foo", GPIO_ACTIVE_LOW, GPIOD_OUT_HIGH),
+                { }
+        };
+
+And the table can be added to the board code as follows::
+
+        gpiod_add_hogs(gpio_hog_table);
+
+The line will be hogged as soon as the gpiochip is created or - in case the
+chip was created earlier - when the hog table is registered.
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 43aeb07343ec..547adc149b62 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -71,6 +71,9 @@ static DEFINE_MUTEX(gpio_lookup_lock);
 static LIST_HEAD(gpio_lookup_list);
 LIST_HEAD(gpio_devices);
 
+static DEFINE_MUTEX(gpio_machine_hogs_mutex);
+static LIST_HEAD(gpio_machine_hogs);
+
 static void gpiochip_free_hogs(struct gpio_chip *chip);
 static int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
 				struct lock_class_key *lock_key,
@@ -1171,6 +1174,41 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
 	return status;
 }
 
+static void gpiochip_machine_hog(struct gpio_chip *chip, struct gpiod_hog *hog)
+{
+	struct gpio_desc *desc;
+	int rv;
+
+	desc = gpiochip_get_desc(chip, hog->chip_hwnum);
+	if (IS_ERR(desc)) {
+		pr_err("%s: unable to get GPIO desc: %ld\n",
+		       __func__, PTR_ERR(desc));
+		return;
+	}
+
+	if (desc->flags & FLAG_IS_HOGGED)
+		return;
+
+	rv = gpiod_hog(desc, hog->line_name, hog->lflags, hog->dflags);
+	if (rv)
+		pr_err("%s: unable to hog GPIO line (%s:%u): %d\n",
+		       __func__, chip->label, hog->chip_hwnum, rv);
+}
+
+static void machine_gpiochip_add(struct gpio_chip *chip)
+{
+	struct gpiod_hog *hog;
+
+	mutex_lock(&gpio_machine_hogs_mutex);
+
+	list_for_each_entry(hog, &gpio_machine_hogs, list) {
+		if (!strcmp(chip->label, hog->chip_label))
+			gpiochip_machine_hog(chip, hog);
+	}
+
+	mutex_unlock(&gpio_machine_hogs_mutex);
+}
+
 static void gpiochip_setup_devs(void)
 {
 	struct gpio_device *gdev;
@@ -1326,6 +1364,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 
 	acpi_gpiochip_add(chip);
 
+	machine_gpiochip_add(chip);
+
 	/*
 	 * By first adding the chardev, and then adding the device,
 	 * we get a device node entry in sysfs under
@@ -3462,6 +3502,33 @@ void gpiod_remove_lookup_table(struct gpiod_lookup_table *table)
 }
 EXPORT_SYMBOL_GPL(gpiod_remove_lookup_table);
 
+/**
+ * gpiod_add_hogs() - register a set of GPIO hogs from machine code
+ * @hogs: table of gpio hog entries with a zeroed sentinel at the end
+ */
+void gpiod_add_hogs(struct gpiod_hog *hogs)
+{
+	struct gpio_chip *chip;
+	struct gpiod_hog *hog;
+
+	mutex_lock(&gpio_machine_hogs_mutex);
+
+	for (hog = &hogs[0]; hog->chip_label; hog++) {
+		list_add_tail(&hog->list, &gpio_machine_hogs);
+
+		/*
+		 * The chip may have been registered earlier, so check if it
+		 * exists and, if so, try to hog the line now.
+		 */
+		chip = find_chip_by_name(hog->chip_label);
+		if (chip)
+			gpiochip_machine_hog(chip, hog);
+	}
+
+	mutex_unlock(&gpio_machine_hogs_mutex);
+}
+EXPORT_SYMBOL_GPL(gpiod_add_hogs);
+
 static struct gpiod_lookup_table *gpiod_find_lookup_table(struct device *dev)
 {
 	const char *dev_id = dev ? dev_name(dev) : NULL;
diff --git a/include/linux/gpio/machine.h b/include/linux/gpio/machine.h
index b2f2dc638463..517957d6b168 100644
--- a/include/linux/gpio/machine.h
+++ b/include/linux/gpio/machine.h
@@ -39,6 +39,23 @@ struct gpiod_lookup_table {
 	struct gpiod_lookup table[];
 };
 
+/**
+ * struct gpiod_hog - GPIO line hog table
+ * @chip_label: name of the chip the GPIO belongs to
+ * @chip_hwnum: hardware number (i.e. relative to the chip) of the GPIO
+ * @line_name: consumer name for the hogged line
+ * @lflags: mask of GPIO lookup flags
+ * @dflags: GPIO flags used to specify the direction and value
+ */
+struct gpiod_hog {
+	struct list_head list;
+	const char *chip_label;
+	u16 chip_hwnum;
+	const char *line_name;
+	enum gpio_lookup_flags lflags;
+	enum gpiod_flags dflags;
+};
+
 /*
  * Simple definition of a single GPIO under a con_id
  */
@@ -59,10 +76,23 @@ struct gpiod_lookup_table {
 	.flags = _flags,                                                  \
 }
 
+/*
+ * Simple definition of a single GPIO hog in an array.
+ */
+#define GPIO_HOG(_chip_label, _chip_hwnum, _line_name, _lflags, _dflags)  \
+{                                                                         \
+	.chip_label = _chip_label,                                        \
+	.chip_hwnum = _chip_hwnum,                                        \
+	.line_name = _line_name,                                          \
+	.lflags = _lflags,                                                \
+	.dflags = _dflags,                                                \
+}
+
 #ifdef CONFIG_GPIOLIB
 void gpiod_add_lookup_table(struct gpiod_lookup_table *table);
 void gpiod_add_lookup_tables(struct gpiod_lookup_table **tables, size_t n);
 void gpiod_remove_lookup_table(struct gpiod_lookup_table *table);
+void gpiod_add_hogs(struct gpiod_hog *hogs);
 #else
 static inline
 void gpiod_add_lookup_table(struct gpiod_lookup_table *table) {}
@@ -70,6 +100,7 @@ static inline
 void gpiod_add_lookup_tables(struct gpiod_lookup_table **tables, size_t n) {}
 static inline
 void gpiod_remove_lookup_table(struct gpiod_lookup_table *table) {}
+static inline void gpiod_add_hogs(struct gpiod_hog *hogs) {}
 #endif
 
 #endif /* __LINUX_GPIO_MACHINE_H */
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
