Return-Path: <SRS0=C3TA=EC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CCD3C388F9
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 09:52:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B5B82240C
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 09:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603792326;
	bh=usL7gfHFc4G7AnespRehxUU27ojrrvGixrlv+aC7DDs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Ryr4tMqGF5F9gXdmgzxqyDXW8fSzvZKmRyjh+JFqp2MGEhx+zRTiSBdRTMS2sZycD
	 sAUlVqzRAx5w2aX2ztslxPz2wS8D3SWb4OJHTnsirWiGRoRn4c7NWcvur71gU1kdk2
	 XPTPwby+Mz1EstX6Wnc5wuHjaWooKMmzaYAlJti4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409044AbgJ0JwE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Oct 2020 05:52:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:42484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896068AbgJ0Jvo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 27 Oct 2020 05:51:44 -0400
Received: from mail.kernel.org (ip5f5ad5af.dynamic.kabel-deutschland.de [95.90.213.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 34D9622456;
        Tue, 27 Oct 2020 09:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603792302;
        bh=usL7gfHFc4G7AnespRehxUU27ojrrvGixrlv+aC7DDs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Jo1MXYuyDI9/cIaonUOADyY1fh508oFpKFCMeh4RjuMpdp8gxiL9kAgecwzUdunsZ
         rtkhtAibZ4Z6ysJGWA4u9v0AdJS0msUcgP8umvRjBa1bEeqJJrVFo8xt6I/GsDpC22
         nPEjTUPwcPFRUO+JWtR7b9SWrMl15xSUSeaosWkE=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kXLdj-003FFi-Td; Tue, 27 Oct 2020 10:51:39 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Alexander Monakov <amonakov@ispras.ru>,
        Aurabindo Pillai <aurabindo.pillai@amd.com>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, Eryk Brol <eryk.brol@amd.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Leo Li <sunpeng.li@amd.com>,
        Mikita Lipski <mikita.lipski@amd.com>,
        Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        Stylon Wang <stylon.wang@amd.com>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        hersen wu <hersenxs.wu@amd.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 28/32] drm: amdgpu_dm: fix a typo
Date:   Tue, 27 Oct 2020 10:51:32 +0100
Message-Id: <9de495fa791596609eb2e73ba71cea99e09b2689.1603791716.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603791716.git.mchehab+huawei@kernel.org>
References: <cover.1603791716.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

	dm_comressor_info -> dm_compressor_info

The kernel-doc markup is right, but the struct itself
and their references contain a typo.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index e2b23486ba4c..373b8481f76c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -583,7 +583,7 @@ static void amdgpu_dm_fbc_init(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
-	struct dm_comressor_info *compressor = &adev->dm.compressor;
+	struct dm_compressor_info *compressor = &adev->dm.compressor;
 	struct amdgpu_dm_connector *aconn = to_amdgpu_dm_connector(connector);
 	struct drm_display_mode *mode;
 	unsigned long max_size = 0;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 34f6369bf51f..a8a0e8cb1a11 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -86,7 +86,7 @@ struct irq_list_head {
  * @bo_ptr: Pointer to the buffer object
  * @gpu_addr: MMIO gpu addr
  */
-struct dm_comressor_info {
+struct dm_compressor_info {
 	void *cpu_addr;
 	struct amdgpu_bo *bo_ptr;
 	uint64_t gpu_addr;
@@ -148,7 +148,7 @@ struct amdgpu_dm_backlight_caps {
  * @soc_bounding_box: SOC bounding box values provided by gpu_info FW
  * @cached_state: Caches device atomic state for suspend/resume
  * @cached_dc_state: Cached state of content streams
- * @compressor: Frame buffer compression buffer. See &struct dm_comressor_info
+ * @compressor: Frame buffer compression buffer. See &struct dm_compressor_info
  * @force_timing_sync: set via debugfs. When set, indicates that all connected
  *		       displays will be forced to synchronize.
  */
@@ -324,7 +324,7 @@ struct amdgpu_display_manager {
 	struct drm_atomic_state *cached_state;
 	struct dc_state *cached_dc_state;
 
-	struct dm_comressor_info compressor;
+	struct dm_compressor_info compressor;
 
 	const struct firmware *fw_dmcu;
 	uint32_t dmcu_fw_version;
-- 
2.26.2

