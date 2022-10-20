Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2315C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 20 Oct 2022 17:57:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbiJTR5p (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Oct 2022 13:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbiJTR5n (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Oct 2022 13:57:43 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABA31199F50
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 10:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666288662; x=1697824662;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9EUhpbmFxPe3OIDE8FCrOeUxv0Nh3hIGi4wVmTDTcYM=;
  b=l+/Ro2UgI76F6QlViLzAe9vmulS95x71ddwcUgeRT7d+ZV4oWHYnzwvf
   kbLmxnttNriOdmw3ZhyEcFRfbHiFWq9rrX7wRpx/Bn/m5KHh6kHJc8QG9
   op/xUJPwP1BO9eO6IY28+XwAuJRe+oWA0UxY10Jy9eNNc/3zw9ZVKdoD6
   Z1nFibChBBwMdPEBPWB+mZymWRQt1KcvWGi+QASEIvQ96JMPU39v9gOX0
   /KtkSYFC7LeLEnYf8SSDbrRTEUldRxOejDjTSeTcGDJrAM7YUFoBjcf8B
   qnEtGhsJocanefGlp/0EV8M3IyN7cFozUuIg4jJ3JTRNSLJpP5Fp+NBy5
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="286510980"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; 
   d="scan'208";a="286510980"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 10:57:42 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="772517093"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; 
   d="scan'208";a="772517093"
Received: from gna-nuc-dev34.igk.intel.com ([10.102.80.34])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 10:57:38 -0700
From:   Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
To:     Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Olof Johansson <olof@lixom.net>
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
        Tomasz Jankowski <tomasz1.jankowski@intel.com>,
        Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
        Jianxun Zhang <jianxun.zhang@linux.intel.com>
Subject: [PATCH v5 10/10] gna: add open and close operations on GNA device
Date:   Thu, 20 Oct 2022 19:53:34 +0200
Message-Id: <20221020175334.1820519-11-maciej.kwapulinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tomasz Jankowski <tomasz1.jankowski@intel.com>

Signed-off-by: Tomasz Jankowski <tomasz1.jankowski@intel.com>
Tested-by: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>
Co-developed-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Co-developed-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Signed-off-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
---
 drivers/gpu/drm/gna/gna_device.c | 46 ++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/gna/gna_device.c b/drivers/gpu/drm/gna/gna_device.c
index aee409e3b4ea..4ce08bf313c3 100644
--- a/drivers/gpu/drm/gna/gna_device.c
+++ b/drivers/gpu/drm/gna/gna_device.c
@@ -58,6 +58,49 @@ const struct dev_pm_ops __maybe_unused gna_pm = {
 	SET_RUNTIME_PM_OPS(gna_runtime_suspend, gna_runtime_resume, NULL)
 };
 
+static int gna_open(struct drm_device *dev, struct drm_file *file)
+{
+	struct gna_device *gna_priv;
+
+	gna_priv = to_gna_device(dev);
+
+	file->driver_priv = gna_priv;
+
+	return 0;
+}
+
+static void gna_delete_file_requests(struct drm_file *file, struct gna_device *gna_priv)
+{
+	struct gna_request *req, *temp_req;
+	struct list_head *reqs_list;
+
+	mutex_lock(&gna_priv->reqlist_lock);
+
+	reqs_list = &gna_priv->request_list;
+	if (!list_empty(reqs_list)) {
+		list_for_each_entry_safe(req, temp_req, reqs_list, node) {
+			if (req->drm_f == file) {
+				bool is_pending;
+
+				list_del_init(&req->node);
+				is_pending = cancel_work_sync(&req->work);
+				if (is_pending)
+					atomic_dec(&gna_priv->enqueued_requests);
+				kref_put(&req->refcount, gna_request_release);
+				break;
+			}
+		}
+	}
+
+	mutex_unlock(&gna_priv->reqlist_lock);
+}
+
+static void gna_close(struct drm_device *dev, struct drm_file *file)
+{
+	struct gna_device *gna_priv = (struct gna_device *)file->driver_priv;
+
+	gna_delete_file_requests(file, gna_priv);
+}
 
 static void gna_drm_dev_fini(struct drm_device *dev, void *ptr)
 {
@@ -136,6 +179,9 @@ static struct drm_gem_object *gna_create_gem_object(struct drm_device *dev,
 
 static const struct drm_driver gna_drm_driver = {
 	.driver_features = DRIVER_GEM | DRIVER_RENDER,
+	.open = gna_open,
+	.postclose = gna_close,
+
 	.gem_create_object = gna_create_gem_object,
 
 	.ioctls = gna_drm_ioctls,
-- 
2.25.1

