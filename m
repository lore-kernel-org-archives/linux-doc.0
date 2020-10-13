Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D82B4C433E7
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 12:16:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8AC18222E8
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 12:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602591404;
	bh=7ZXF3P5p4MjWkObrbAOtTL+8XlJ9hHimuQqgAGSiEFc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=iE61QPQ241Jutzk/B4f+JKAjM5MX1swB90qyXZs8m7LwVjwAAShjeMAqDvgWDi3EF
	 UfqwA84Aj1KexlOVEdObKe+J2JpQn+/Crn1XMlbh8uSdTC4ZP40CwxpUUDZnlo7GHt
	 Hc34L6P0OP6NV5xm5AnBnVKNgIFtSjPmK5j9SDtM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbgJMMQl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 08:16:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:41126 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726893AbgJMMO4 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Oct 2020 08:14:56 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 07BCB2225F;
        Tue, 13 Oct 2020 12:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602591295;
        bh=7ZXF3P5p4MjWkObrbAOtTL+8XlJ9hHimuQqgAGSiEFc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hvKLPVk5uOkGbXS+3CQHvUclvnNC86uaO8lEvUhb33IUuixzNWEyC7Pq20TUbBHBg
         UUKaQObwdzFXQ2ZxdpiafdOwqjWNUSo5R5N8R4jovvxvSh14a1IiHX0wLWAlPedyn0
         +4wxcL2h1Sk81E8mKBkYPaEfNKtIVBvkee5VgDmc=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kSJCe-006CoD-Vq; Tue, 13 Oct 2020 14:14:52 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, Lyude Paul <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/24] drm/dp: fix kernel-doc warnings at drm_dp_helper.c
Date:   Tue, 13 Oct 2020 14:14:38 +0200
Message-Id: <c7b13b7f9dae481fe552e3b8382841469bb993f0.1602590106.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602590106.git.mchehab+huawei@kernel.org>
References: <cover.1602590106.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As warned by kernel-doc:

	./drivers/gpu/drm/drm_dp_helper.c:385: warning: Function parameter or member 'type' not described in 'drm_dp_downstream_is_type'
	./drivers/gpu/drm/drm_dp_helper.c:886: warning: Function parameter or member 'dev' not described in 'drm_dp_downstream_mode'

Some function parameters weren't documented.

Fixes: 38784f6f8805 ("drm/dp: Add helpers to identify downstream facing port types")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/gpu/drm/drm_dp_helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index b1c71af88579..deeed73f4ed6 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -374,6 +374,10 @@ static bool is_edid_digital_input_dp(const struct edid *edid)
  * drm_dp_downstream_is_type() - is the downstream facing port of certain type?
  * @dpcd: DisplayPort configuration data
  * @port_cap: port capabilities
+ * @type: port type to be checked. Can be:
+ * 	  %DP_DS_PORT_TYPE_DP, %DP_DS_PORT_TYPE_VGA, %DP_DS_PORT_TYPE_DVI,
+ * 	  %DP_DS_PORT_TYPE_HDMI, %DP_DS_PORT_TYPE_NON_EDID,
+ *	  %DP_DS_PORT_TYPE_DP_DUALMODE or %DP_DS_PORT_TYPE_WIRELESS.
  *
  * Caveat: Only works with DPCD 1.1+ port caps.
  *
@@ -870,6 +874,7 @@ EXPORT_SYMBOL(drm_dp_downstream_444_to_420_conversion);
 
 /**
  * drm_dp_downstream_mode() - return a mode for downstream facing port
+ * @dev: DRM device
  * @dpcd: DisplayPort configuration data
  * @port_cap: port capabilities
  *
-- 
2.26.2

