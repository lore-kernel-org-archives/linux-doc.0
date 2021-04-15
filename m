Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 136F0C43470
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 08:53:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E455461264
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 08:53:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231653AbhDOIyA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Apr 2021 04:54:00 -0400
Received: from mx2.suse.de ([195.135.220.15]:60102 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231840AbhDOIx4 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 15 Apr 2021 04:53:56 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 79E76B1C8;
        Thu, 15 Apr 2021 08:53:33 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@linux.ie,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        kraxel@redhat.com, corbet@lwn.net, lgirdwood@gmail.com,
        broonie@kernel.org, sam@ravnborg.org, robh@kernel.org,
        emil.l.velikov@gmail.com, geert+renesas@glider.be,
        hdegoede@redhat.com, bluescreen_avenger@verizon.net,
        gregkh@linuxfoundation.org
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 6/9] drm/simpledrm: Initialize framebuffer data from device-tree node
Date:   Thu, 15 Apr 2021 10:53:23 +0200
Message-Id: <20210415085326.8824-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415085326.8824-1-tzimmermann@suse.de>
References: <20210415085326.8824-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A firmware framebuffer might also be specified via device-tree files. If
no device platform data is given, try the DT device node.

v2:
	* add Device Tree match table
	* clean-up parser wrappers

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: nerdopolis <bluescreen_avenger@verizon.net>
---
 drivers/gpu/drm/tiny/simpledrm.c | 89 ++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 64e8a8581d9a..53d6bec7d0b2 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -114,6 +114,74 @@ simplefb_get_format_pd(struct drm_device *dev,
 	return simplefb_get_validated_format(dev, pd->format);
 }
 
+static int
+simplefb_read_u32_of(struct drm_device *dev, struct device_node *of_node,
+		     const char *name, u32 *value)
+{
+	int ret = of_property_read_u32(of_node, name, value);
+
+	if (ret)
+		drm_err(dev, "simplefb: cannot parse framebuffer %s: error %d\n",
+			name, ret);
+	return ret;
+}
+
+static int
+simplefb_read_string_of(struct drm_device *dev, struct device_node *of_node,
+			const char *name, const char **value)
+{
+	int ret = of_property_read_string(of_node, name, value);
+
+	if (ret)
+		drm_err(dev, "simplefb: cannot parse framebuffer %s: error %d\n",
+			name, ret);
+	return ret;
+}
+
+static int
+simplefb_get_width_of(struct drm_device *dev, struct device_node *of_node)
+{
+	u32 width;
+	int ret = simplefb_read_u32_of(dev, of_node, "width", &width);
+
+	if (ret)
+		return ret;
+	return simplefb_get_validated_int0(dev, "width", width);
+}
+
+static int
+simplefb_get_height_of(struct drm_device *dev, struct device_node *of_node)
+{
+	u32 height;
+	int ret = simplefb_read_u32_of(dev, of_node, "height", &height);
+
+	if (ret)
+		return ret;
+	return simplefb_get_validated_int0(dev, "height", height);
+}
+
+static int
+simplefb_get_stride_of(struct drm_device *dev, struct device_node *of_node)
+{
+	u32 stride;
+	int ret = simplefb_read_u32_of(dev, of_node, "stride", &stride);
+
+	if (ret)
+		return ret;
+	return simplefb_get_validated_int(dev, "stride", stride);
+}
+
+static const struct drm_format_info *
+simplefb_get_format_of(struct drm_device *dev, struct device_node *of_node)
+{
+	const char *format;
+	int ret = simplefb_read_string_of(dev, of_node, "format", &format);
+
+	if (ret)
+		return ERR_PTR(ret);
+	return simplefb_get_validated_format(dev, format);
+}
+
 /*
  * Simple Framebuffer device
  */
@@ -166,6 +234,7 @@ static int simpledrm_device_init_fb(struct simpledrm_device *sdev)
 	struct drm_device *dev = &sdev->dev;
 	struct platform_device *pdev = sdev->pdev;
 	const struct simplefb_platform_data *pd = dev_get_platdata(&pdev->dev);
+	struct device_node *of_node = pdev->dev.of_node;
 
 	if (pd) {
 		width = simplefb_get_width_pd(dev, pd);
@@ -180,6 +249,19 @@ static int simpledrm_device_init_fb(struct simpledrm_device *sdev)
 		format = simplefb_get_format_pd(dev, pd);
 		if (IS_ERR(format))
 			return PTR_ERR(format);
+	} else if (of_node) {
+		width = simplefb_get_width_of(dev, of_node);
+		if (width < 0)
+			return width;
+		height = simplefb_get_height_of(dev, of_node);
+		if (height < 0)
+			return height;
+		stride = simplefb_get_stride_of(dev, of_node);
+		if (stride < 0)
+			return stride;
+		format = simplefb_get_format_of(dev, of_node);
+		if (IS_ERR(format))
+			return PTR_ERR(format);
 	} else {
 		drm_err(dev, "no simplefb configuration found\n");
 		return -ENODEV;
@@ -534,9 +616,16 @@ static int simpledrm_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id simpledrm_of_match_table[] = {
+	{ .compatible = "simple-framebuffer", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, simpledrm_of_match_table);
+
 static struct platform_driver simpledrm_platform_driver = {
 	.driver = {
 		.name = "simple-framebuffer", /* connect to sysfb */
+		.of_match_table = simpledrm_of_match_table,
 	},
 	.probe = simpledrm_probe,
 	.remove = simpledrm_remove,
-- 
2.31.1

