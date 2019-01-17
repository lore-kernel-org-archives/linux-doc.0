Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A42947D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 17 Jan 2019 10:14:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726966AbfAQKOG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 17 Jan 2019 05:14:06 -0500
Received: from sauhun.de ([88.99.104.3]:38640 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726493AbfAQKOG (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 17 Jan 2019 05:14:06 -0500
Received: from localhost (p54B33243.dip0.t-ipconnect.de [84.179.50.67])
        by pokefinder.org (Postfix) with ESMTPSA id 7AF602C3F83;
        Thu, 17 Jan 2019 11:14:03 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: gpio: driver: fix wire name for I2C
Date:   Thu, 17 Jan 2019 11:13:21 +0100
Message-Id: <20190117101321.2164-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Typo: the data line is called "SDA" not "SCA".

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/driver-api/gpio/driver.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
index a92d8837b62b..3043167fc557 100644
--- a/Documentation/driver-api/gpio/driver.rst
+++ b/Documentation/driver-api/gpio/driver.rst
@@ -135,7 +135,7 @@ This configuration is normally used as a way to achieve one of two things:
 - inverse wire-OR on an I/O line, for example a GPIO line, making it possible
   for any driving stage on the line to drive it low even if any other output
   to the same line is simultaneously driving it high. A special case of this
-  is driving the SCL and SCA lines of an I2C bus, which is by definition a
+  is driving the SCL and SDA lines of an I2C bus, which is by definition a
   wire-OR bus.
 
 Both usecases require that the line be equipped with a pull-up resistor. This
-- 
2.11.0

