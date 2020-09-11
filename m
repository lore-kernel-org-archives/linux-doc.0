Return-Path: <SRS0=2AiA=CU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21CD2C433E2
	for <linux-doc@archiver.kernel.org>; Fri, 11 Sep 2020 08:26:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4374221E5
	for <linux-doc@archiver.kernel.org>; Fri, 11 Sep 2020 08:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599812806;
	bh=7FJMCORFg0/KCKvPeDlFiaOcGKgC/E9aswSVRtNr12o=;
	h=Subject:To:From:Date:List-ID:From;
	b=V/SMCrLbKXGpRd5q+68gjEFln+KzI8SQhkBBTNG5l0orwqJ5asSJ1BTamhlVJnQ2J
	 U04n3Cr5/cDNWK29dZwYpENV0p9elzZhJEO3FCTC12yB2IcyJsqGgECwTJUIDXfqG/
	 34auzeZ+w3Iex0kbmh5rEEo4fS4ZJCjappQwuVFs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbgIKI0q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Sep 2020 04:26:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:33240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725854AbgIKI0p (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 11 Sep 2020 04:26:45 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A90BD221E3;
        Fri, 11 Sep 2020 08:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599812805;
        bh=7FJMCORFg0/KCKvPeDlFiaOcGKgC/E9aswSVRtNr12o=;
        h=Subject:To:From:Date:From;
        b=ZcwvXWXh1WHZ6mKCzsO404MZ970JvzSxOkUucsBfZmJbnekKnOYazu8eaWnag97w6
         InEhkDZpo3AsD7pLlFlGkOW51f3ivKyT/Hs+sraBHs4cWc4msC0ATMJ9Wu347ADeCe
         TmvlkuPOTFFWwLTf6TC+oXG/5ny51DobBLZn9A3w=
Subject: patch "driver core: platform: Document return type of more functions" added to driver-core-next
To:     swboyd@chromium.org, gregkh@linuxfoundation.org,
        linux-doc@vger.kernel.org
From:   <gregkh@linuxfoundation.org>
Date:   Fri, 11 Sep 2020 10:26:51 +0200
Message-ID: <1599812811172133@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


This is a note to let you know that I've just added the patch titled

    driver core: platform: Document return type of more functions

to my driver-core git tree which can be found at
    git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
in the driver-core-next branch.

The patch will show up in the next release of the linux-next tree
(usually sometime within the next 24 hours during the week.)

The patch will also be merged in the next major kernel release
during the merge window.

If you have any questions about this process, please let me know.


From 0c7a6b91d2276b09ade6e09766600f809f5a529a Mon Sep 17 00:00:00 2001
From: Stephen Boyd <swboyd@chromium.org>
Date: Wed, 9 Sep 2020 23:04:40 -0700
Subject: driver core: platform: Document return type of more functions

I can't always remember the return values of these functions, and so I
usually jump to the function to read the kernel-doc and see that it
doesn't tell me. Then I have to spend more time reading the code to jump
to the function that actually tells me the return values. Let's document
it here so that we don't all have to spend time digging through the code
to understand the return values.

Cc: <linux-doc@vger.kernel.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Link: https://lore.kernel.org/r/20200910060440.2302925-1-swboyd@chromium.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/base/platform.c | 14 ++++++++++++++
 lib/devres.c            | 18 ++++++++++++------
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index e5d8a0503b4f..4b3dc6813714 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -45,6 +45,8 @@ EXPORT_SYMBOL_GPL(platform_bus);
  * @dev: platform device
  * @type: resource type
  * @num: resource index
+ *
+ * Return: a pointer to the resource or NULL on failure.
  */
 struct resource *platform_get_resource(struct platform_device *dev,
 				       unsigned int type, unsigned int num)
@@ -70,6 +72,9 @@ EXPORT_SYMBOL_GPL(platform_get_resource);
  *        resource management
  * @index: resource index
  * @res: optional output parameter to store a pointer to the obtained resource.
+ *
+ * Return: a pointer to the remapped memory or an ERR_PTR() encoded error code
+ * on failure.
  */
 void __iomem *
 devm_platform_get_and_ioremap_resource(struct platform_device *pdev,
@@ -91,6 +96,9 @@ EXPORT_SYMBOL_GPL(devm_platform_get_and_ioremap_resource);
  * @pdev: platform device to use both for memory resource lookup as well as
  *        resource management
  * @index: resource index
+ *
+ * Return: a pointer to the remapped memory or an ERR_PTR() encoded error code
+ * on failure.
  */
 void __iomem *devm_platform_ioremap_resource(struct platform_device *pdev,
 					     unsigned int index)
@@ -106,6 +114,9 @@ EXPORT_SYMBOL_GPL(devm_platform_ioremap_resource);
  * @pdev: platform device to use both for memory resource lookup as well as
  *        resource management
  * @index: resource index
+ *
+ * Return: a pointer to the remapped memory or an ERR_PTR() encoded error code
+ * on failure.
  */
 void __iomem *devm_platform_ioremap_resource_wc(struct platform_device *pdev,
 						unsigned int index)
@@ -124,6 +135,9 @@ void __iomem *devm_platform_ioremap_resource_wc(struct platform_device *pdev,
  * @pdev: platform device to use both for memory resource lookup as well as
  *	  resource management
  * @name: name of the resource
+ *
+ * Return: a pointer to the remapped memory or an ERR_PTR() encoded error code
+ * on failure.
  */
 void __iomem *
 devm_platform_ioremap_resource_byname(struct platform_device *pdev,
diff --git a/lib/devres.c b/lib/devres.c
index 8bd3ed450614..2a4ff5d64288 100644
--- a/lib/devres.c
+++ b/lib/devres.c
@@ -162,13 +162,15 @@ __devm_ioremap_resource(struct device *dev, const struct resource *res,
  * region and ioremaps it. All operations are managed and will be undone
  * on driver detach.
  *
- * Returns a pointer to the remapped memory or an ERR_PTR() encoded error code
- * on failure. Usage example:
+ * Usage example:
  *
  *	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
  *	base = devm_ioremap_resource(&pdev->dev, res);
  *	if (IS_ERR(base))
  *		return PTR_ERR(base);
+ *
+ * Return: a pointer to the remapped memory or an ERR_PTR() encoded error code
+ * on failure.
  */
 void __iomem *devm_ioremap_resource(struct device *dev,
 				    const struct resource *res)
@@ -183,8 +185,8 @@ EXPORT_SYMBOL(devm_ioremap_resource);
  * @dev: generic device to handle the resource for
  * @res: resource to be handled
  *
- * Returns a pointer to the remapped memory or an ERR_PTR() encoded error code
- * on failure. Usage example:
+ * Return: a pointer to the remapped memory or an ERR_PTR() encoded error code
+ * on failure.
  */
 void __iomem *devm_ioremap_resource_wc(struct device *dev,
 				       const struct resource *res)
@@ -207,8 +209,8 @@ void __iomem *devm_ioremap_resource_wc(struct device *dev,
  * @node:       The device-tree node where the resource resides
  * @index:	index of the MMIO range in the "reg" property
  * @size:	Returns the size of the resource (pass NULL if not needed)
- * Returns a pointer to the requested and mapped memory or an ERR_PTR() encoded
- * error code on failure. Usage example:
+ *
+ * Usage example:
  *
  *	base = devm_of_iomap(&pdev->dev, node, 0, NULL);
  *	if (IS_ERR(base))
@@ -219,6 +221,8 @@ void __iomem *devm_ioremap_resource_wc(struct device *dev,
  * two drivers try to map the same memory, the of_iomap() function will succeed
  * but the devm_of_iomap() function will return -EBUSY.
  *
+ * Return: a pointer to the requested and mapped memory or an ERR_PTR() encoded
+ * error code on failure.
  */
 void __iomem *devm_of_iomap(struct device *dev, struct device_node *node, int index,
 			    resource_size_t *size)
@@ -256,6 +260,8 @@ static int devm_ioport_map_match(struct device *dev, void *res,
  *
  * Managed ioport_map().  Map is automatically unmapped on driver
  * detach.
+ *
+ * Return: a pointer to the remapped memory or NULL on failure.
  */
 void __iomem *devm_ioport_map(struct device *dev, unsigned long port,
 			       unsigned int nr)
-- 
2.28.0


