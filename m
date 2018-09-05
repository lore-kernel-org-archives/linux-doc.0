Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D60227DE7B
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Sep 2018 09:24:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728230AbeIENwv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Sep 2018 09:52:51 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:39214 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728154AbeIENwu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Sep 2018 09:52:50 -0400
Received: from ramsan.of.borg ([84.194.111.163])
        by albert.telenet-ops.be with bizsmtp
        id XlPU1y00P3XaVaC06lPUaK; Wed, 05 Sep 2018 11:23:29 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.86_2)
        (envelope-from <geert@linux-m68k.org>)
        id 1fxU24-0006p3-CP; Wed, 05 Sep 2018 11:23:28 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1fxTlB-0002aW-52; Wed, 05 Sep 2018 11:06:01 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Laura Abbott <labbott@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] gpio: Restore indentation of continued lines
Date:   Wed,  5 Sep 2018 11:05:55 +0200
Message-Id: <20180905090555.9888-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180905090555.9888-1-geert+renesas@glider.be>
References: <20180905090555.9888-1-geert+renesas@glider.be>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fixes: 3027743f83f867d8 ("gpio: Remove VLA from gpiolib")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpiolib.c        | 12 ++++++------
 drivers/gpio/gpiolib.h        |  6 +++---
 include/linux/gpio/consumer.h | 11 +++++------
 3 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b8486e204b9e8c69..e95aac19ab6a0a2a 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3025,9 +3025,9 @@ static void gpio_chip_set_multiple(struct gpio_chip *chip,
 }
 
 int gpiod_set_array_value_complex(bool raw, bool can_sleep,
-				   unsigned int array_size,
-				   struct gpio_desc **desc_array,
-				   int *value_array)
+				  unsigned int array_size,
+				  struct gpio_desc **desc_array,
+				  int *value_array)
 {
 	int i = 0;
 
@@ -3163,7 +3163,7 @@ EXPORT_SYMBOL_GPL(gpiod_set_value);
  * complain if the GPIO chip functions potentially sleep.
  */
 int gpiod_set_raw_array_value(unsigned int array_size,
-			 struct gpio_desc **desc_array, int *value_array)
+			      struct gpio_desc **desc_array, int *value_array)
 {
 	if (!desc_array)
 		return -EINVAL;
@@ -3503,8 +3503,8 @@ EXPORT_SYMBOL_GPL(gpiod_set_value_cansleep);
  * This function is to be called from contexts that can sleep.
  */
 int gpiod_set_raw_array_value_cansleep(unsigned int array_size,
-					struct gpio_desc **desc_array,
-					int *value_array)
+				       struct gpio_desc **desc_array,
+				       int *value_array)
 {
 	might_sleep_if(extra_checks);
 	if (!desc_array)
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index a7e49fef73d41de2..5fc5aa9f84b33fc4 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -189,9 +189,9 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 				  struct gpio_desc **desc_array,
 				  int *value_array);
 int gpiod_set_array_value_complex(bool raw, bool can_sleep,
-				   unsigned int array_size,
-				   struct gpio_desc **desc_array,
-				   int *value_array);
+				  unsigned int array_size,
+				  struct gpio_desc **desc_array,
+				  int *value_array);
 
 /* This is just passed between gpiolib and devres */
 struct gpio_desc *gpiod_get_from_of_node(struct device_node *node,
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 54ca52f67e8cf38b..e60e2085d48ce995 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -114,8 +114,7 @@ int gpiod_get_raw_array_value(unsigned int array_size,
 			      int *value_array);
 void gpiod_set_raw_value(struct gpio_desc *desc, int value);
 int gpiod_set_raw_array_value(unsigned int array_size,
-			       struct gpio_desc **desc_array,
-			       int *value_array);
+			      struct gpio_desc **desc_array, int *value_array);
 
 /* Value get/set from sleeping context */
 int gpiod_get_value_cansleep(const struct gpio_desc *desc);
@@ -132,8 +131,8 @@ int gpiod_get_raw_array_value_cansleep(unsigned int array_size,
 				       int *value_array);
 void gpiod_set_raw_value_cansleep(struct gpio_desc *desc, int value);
 int gpiod_set_raw_array_value_cansleep(unsigned int array_size,
-					struct gpio_desc **desc_array,
-					int *value_array);
+				       struct gpio_desc **desc_array,
+				       int *value_array);
 
 int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce);
 int gpiod_set_transitory(struct gpio_desc *desc, bool transitory);
@@ -369,8 +368,8 @@ static inline void gpiod_set_raw_value(struct gpio_desc *desc, int value)
 	WARN_ON(1);
 }
 static inline int gpiod_set_raw_array_value(unsigned int array_size,
-					     struct gpio_desc **desc_array,
-					     int *value_array)
+					    struct gpio_desc **desc_array,
+					    int *value_array)
 {
 	/* GPIO can never have been requested */
 	WARN_ON(1);
-- 
2.17.1

