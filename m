Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7522B7DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Apr 2018 20:30:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752735AbeDJUaf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Apr 2018 16:30:35 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:39371 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752676AbeDJUae (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Apr 2018 16:30:34 -0400
Received: by mail-wm0-f68.google.com with SMTP id b21so865007wme.4
        for <linux-doc@vger.kernel.org>; Tue, 10 Apr 2018 13:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=1iA6JjR9+Xj0ssL5elFvcuDsqAzqqDlolJkK7OihIYI=;
        b=OgxQMgfObpNCRF0BIfVsETXxdmvLx/5oODkJey2YCbawIklDQdXl92yjzLckjzFFVC
         uOH1FON2+OPi3aQmC2JCcRff+C/SPRF+NnB3wlm+MGEvQG3QcHwLwZr7V6WWP+KdR4dD
         Y43vanSABQO2MCX+lEzjv8J4CSdKVTBFwAlLODoQNzx+0u/7BGEaX0LSf0D2FMW0bTwM
         Urwf0pAWgzJSATFR3QUB5c2xqdNCFmNS4H/q6+Q/KRARfAHVp9KIThoH0Y9PO/4c1a2u
         8Z1k88WIVxtlSZQL+WRGbjedsl0eBx414JrO1FvTYc6FTHqhMbstKs6u1zv5adKyhjpE
         /HxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1iA6JjR9+Xj0ssL5elFvcuDsqAzqqDlolJkK7OihIYI=;
        b=ZkbXlf6Pe5B5ALdI9Bk/Tkw0GRpW0jwofvSo8g1H9I2/wrcG36SxnAhalkduyH8Jj0
         tr+FrSodbOopFOWrhmsXncjFuecciNs4IFfbgsSVU2dF89dBrUyTE7CegkQBQqkVt8S0
         TiIB7Zk7IanY42JgqEu0aQyAiAWPsEacC4t9c0XZEvWNdsSdLFF8yIkHED64KPBoGq2C
         hMejJr6aMZ1YqKFp94ho0m8Rg75L4n8VxQXPLqPrxPFvxMnR1BMfHyWKgyAgNCc5AXdt
         /dZOU9QxGER4anuSmSRH7aTlqLHqsGy57TPuV4XV5s+SfRR/eZA9gV/YImEnXYjEo0Z0
         /7zg==
X-Gm-Message-State: ALQs6tDxy5HCvZFhb8C95NfphtnX90KNQIwC0Ol5tkyycBuqFMITSw8Z
        XlsSz3aInXLX1QCMLuDNK5BoZQ==
X-Google-Smtp-Source: AIpwx4+WoF7i35wc57TvPWTUra0GvoSUvYPiCrcWmDgWVywKpiR4qW3tynM5IyBMhzqu3hVrItghIQ==
X-Received: by 10.28.32.210 with SMTP id g201mr657601wmg.9.1523392233171;
        Tue, 10 Apr 2018 13:30:33 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
        by smtp.gmail.com with ESMTPSA id j8sm764309wri.22.2018.04.10.13.30.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Apr 2018 13:30:32 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2] gpiolib: add hogs support for machine code
Date:   Tue, 10 Apr 2018 22:30:28 +0200
Message-Id: <20180410203028.11412-1-brgl@bgdev.pl>
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
v1 -> v2:
- kbuild bot complains about enum gpiod_flags having incomplete type
  although it builds fine for me locally: change the type of dflags
  to int

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
index b2f2dc638463..daa44eac9241 100644
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
+	int dflags;
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
