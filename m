Return-Path: <SRS0=aoLA=42=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F03C10DCE
	for <linux-doc@archiver.kernel.org>; Mon,  9 Mar 2020 00:24:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A9A9206D5
	for <linux-doc@archiver.kernel.org>; Mon,  9 Mar 2020 00:24:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgCIAYO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 8 Mar 2020 20:24:14 -0400
Received: from balrog.mythic-beasts.com ([46.235.227.24]:47971 "EHLO
        balrog.mythic-beasts.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726556AbgCIAYN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 8 Mar 2020 20:24:13 -0400
X-Greylist: delayed 1185 seconds by postgrey-1.27 at vger.kernel.org; Sun, 08 Mar 2020 20:24:13 EDT
Received: from [146.90.33.204] (port=46398 helo=slartibartfast.quignogs.org.uk)
        by balrog.mythic-beasts.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <peter@bikeshed.quignogs.org.uk>)
        id 1jB5uF-0002mU-Ra; Mon, 09 Mar 2020 00:04:27 +0000
From:   peter@bikeshed.quignogs.org.uk
To:     linux-doc@vger.kernel.org
Cc:     Peter Lister <peter@bikeshed.quignogs.org.uk>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 1/1] Changed double colon to single colon at the ends of two paragraphs preceding ".. code-block:: c".
Date:   Mon,  9 Mar 2020 00:04:21 +0000
Message-Id: <20200309000421.9397-1-peter@bikeshed.quignogs.org.uk>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BlackCat-Spam-Score: 50
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Peter Lister <peter@bikeshed.quignogs.org.uk>

This makes the documentation build a little happier and removes
"Unexpected indentation" warnings.

Signed-off-by: Peter Lister <peter@bikeshed.quignogs.org.uk>
---
 Documentation/driver-api/gpio/driver.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
index 871922529332..9809f593c0ab 100644
--- a/Documentation/driver-api/gpio/driver.rst
+++ b/Documentation/driver-api/gpio/driver.rst
@@ -416,7 +416,7 @@ The preferred way to set up the helpers is to fill in the
 struct gpio_irq_chip inside struct gpio_chip before adding the gpio_chip.
 If you do this, the additional irq_chip will be set up by gpiolib at the
 same time as setting up the rest of the GPIO functionality. The following
-is a typical example of a cascaded interrupt handler using gpio_irq_chip::
+is a typical example of a cascaded interrupt handler using gpio_irq_chip:
 
 .. code-block:: c
 
@@ -453,7 +453,7 @@ is a typical example of a cascaded interrupt handler using gpio_irq_chip::
   return devm_gpiochip_add_data(dev, &g->gc, g);
 
 The helper support using hierarchical interrupt controllers as well.
-In this case the typical set-up will look like this::
+In this case the typical set-up will look like this:
 
 .. code-block:: c
 
-- 
2.24.1

