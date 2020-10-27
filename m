Return-Path: <SRS0=C3TA=EC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D68E7C4363A
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 10:01:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92CB622282
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 10:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603792892;
	bh=64A7EVfDlXLbjve/Xc7YXb+7i96EZIpaeNvqEPZFM6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=U5HY1siS642ZlcPConVpB5UwKIltCh0a8fKCNBhWSJrQLqahG/3SeV8sRKGUZRLr7
	 Xbl57B1d9jPGsouLmcPV2u8K7R8/zNbYGkOEtd/AhLR6Gy3rxJAZFJ4TdVHBtDfys7
	 CpKH+DWCX26WaE75Btz+B3fUXdxSlt+aQWo9DhWM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896064AbgJ0Jvn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Oct 2020 05:51:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:42608 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896035AbgJ0Jvn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 27 Oct 2020 05:51:43 -0400
Received: from mail.kernel.org (ip5f5ad5af.dynamic.kabel-deutschland.de [95.90.213.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5B7BD2242B;
        Tue, 27 Oct 2020 09:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603792301;
        bh=64A7EVfDlXLbjve/Xc7YXb+7i96EZIpaeNvqEPZFM6Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ugc5YPlRgxzutZ+xamDxawGWBYXMPKcu8mZd4C4ze7MyhqprJVYGGQnj2IMTE1S9z
         M6kVNrRlAhLQUVZupcEbMiAH9WY3uYZJdLxs1/LgaWQoi61y8nWiqGxaYJ6yZuOwyO
         JzfsF2zF5l3zo5bT+R0uD5mJsxeWKFrXImGgyumw=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kXLdj-003FEv-A6; Tue, 27 Oct 2020 10:51:39 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, Lyude Paul <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 12/32] drm/dp: fix a kernel-doc issue at drm_edid.c
Date:   Tue, 27 Oct 2020 10:51:16 +0100
Message-Id: <7f4d6c3ff6df63ebd006eb90a5108006c23e2168.1603791716.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603791716.git.mchehab+huawei@kernel.org>
References: <cover.1603791716.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The name of the argument is different, causing those warnings:

	./drivers/gpu/drm/drm_edid.c:3754: warning: Function parameter or member 'video_code' not described in 'drm_display_mode_from_cea_vic'
	./drivers/gpu/drm/drm_edid.c:3754: warning: Excess function parameter 'vic' description in 'drm_display_mode_from_cea_vic'

Fixes: 7af655bce275 ("drm/dp: Add drm_dp_downstream_mode()")
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/gpu/drm/drm_edid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index a82f37d44258..631125b46e04 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3741,7 +3741,7 @@ drm_add_cmdb_modes(struct drm_connector *connector, u8 svd)
 /**
  * drm_display_mode_from_cea_vic() - return a mode for CEA VIC
  * @dev: DRM device
- * @vic: CEA VIC of the mode
+ * @video_code: CEA VIC of the mode
  *
  * Creates a new mode matching the specified CEA VIC.
  *
-- 
2.26.2

