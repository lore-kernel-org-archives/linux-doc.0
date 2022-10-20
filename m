Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F1CC433FE
	for <linux-doc@archiver.kernel.org>; Thu, 20 Oct 2022 13:39:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230238AbiJTNjT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Oct 2022 09:39:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230111AbiJTNjS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Oct 2022 09:39:18 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A695B1A6527
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 06:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666273152; x=1697809152;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2ljMdWx0ncfHHf9/cuviQrmrpgKp4U9CBBJ+FsQph8Y=;
  b=jLcPerw7xo8RxEe1LgplkhLq7qC6vEuGUxSlBStnNWlvPzbQjB/QNJ7i
   FYmJarvHj/zlXLz+AFC+YK2EAZ9HU0RU3p62YW/C6SjP2RO/ZX/QM4kIL
   LYFLOYCEs9pWA9EthsXXHrVgmhgH70hKSSW5pjhBFryjn2ckUL5S2xWQH
   3AHeXUSDlWPeXrTrFR2kUrFCzAgJQzB8zHD+hd/rKJsGEINXGgjzX68p8
   TFJ6lVCxa697WoZkDa7SL6YCABHH99Ry14xmJ9r1MzY4wnNscHqOqqO4W
   6mbU/EJex895Cmd2euJwVv2sVFvqEEi0LjrrL0N48vGVUU6s2okOydz3n
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="307806045"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; 
   d="scan'208";a="307806045"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 06:39:00 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="719064678"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; 
   d="scan'208";a="719064678"
Received: from gna-nuc-dev34.igk.intel.com ([10.102.80.34])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 06:38:56 -0700
From:   "Kwapulinski, Maciej" <maciej.kwapulinski@intel.com>
To:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
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
Subject: [PATCH v4 10/10] gna: add open and close operations on GNA device
Date:   Thu, 20 Oct 2022 15:35:25 +0200
Message-Id: <20221020133525.1810728-11-maciej.kwapulinski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020133525.1810728-1-maciej.kwapulinski@intel.com>
References: <20221020133525.1810728-1-maciej.kwapulinski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydzial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-316 | Kapital zakladowy 200.000 PLN.
Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu ustawy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w transakcjach handlowych.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by others is strictly prohibited.

