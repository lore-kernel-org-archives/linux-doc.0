Return-Path: <SRS0=C3TA=EC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B919C388F9
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 09:52:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DAC7821D24
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 09:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603792337;
	bh=uJSSG/eHQ/7Yt418cauF5nfTZkD5Ajkmn89PolHO9VE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=P3iSzKlQjPXAr/LT1mgfeOmAksw07cy+vtM8VPfwKR3CLzsfx8UDJ9aB7LsLgljo0
	 ASfJlpZ0JQu54tFLLUT90Xr/IESOUN2luZB8kcWHGhX1fjHxNhubykeLGr+FrKT0GV
	 mj+st/I7hjik1CEoh40ut/AhRSt+mVi+PgEitonc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409158AbgJ0JwF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Oct 2020 05:52:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:42606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896070AbgJ0Jvo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 27 Oct 2020 05:51:44 -0400
Received: from mail.kernel.org (ip5f5ad5af.dynamic.kabel-deutschland.de [95.90.213.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D1CA424689;
        Tue, 27 Oct 2020 09:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603792303;
        bh=uJSSG/eHQ/7Yt418cauF5nfTZkD5Ajkmn89PolHO9VE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AzY3Rqi+zb2lbemBdw4pIaQPg/ytCLzu+W6llyiTQt0ZgnTkjoC/OturT9KP/7+91
         6csmBHykn1XH4lCgOdYBE+bZikt+sEPxSXvQndb62Wat+3LhEDdzGxKvkin6J6ki+o
         uM3DGbscw/WE8PFFI5tH71hEwgPYpCwbtExnRy/I=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kXLdj-003FFg-Sg; Tue, 27 Oct 2020 10:51:39 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 27/32] drm: kernel-doc: drm_dp_helper.h: fix a typo
Date:   Tue, 27 Oct 2020 10:51:31 +0100
Message-Id: <2a615cb38e951215bb1bddc2481ad323c9cf3fc9.1603791716.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603791716.git.mchehab+huawei@kernel.org>
References: <cover.1603791716.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Right now, kernel-doc generates a warning:
	./include/drm/drm_dp_helper.h:1786: warning: Function parameter or member 'hbr2_reset' not described in 'drm_dp_phy_test_params'

This is due to a typo:

	@hb2_reset -> @hbr2_reset

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 include/drm/drm_dp_helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index da53aebb7230..a53243abd945 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1836,7 +1836,7 @@ static inline void drm_dp_cec_unset_edid(struct drm_dp_aux *aux)
  * @link_rate: Requested Link rate from DPCD 0x219
  * @num_lanes: Number of lanes requested by sing through DPCD 0x220
  * @phy_pattern: DP Phy test pattern from DPCD 0x248
- * @hb2_reset: DP HBR2_COMPLIANCE_SCRAMBLER_RESET from DCPD 0x24A and 0x24B
+ * @hbr2_reset: DP HBR2_COMPLIANCE_SCRAMBLER_RESET from DCPD 0x24A and 0x24B
  * @custom80: DP Test_80BIT_CUSTOM_PATTERN from DPCDs 0x250 through 0x259
  * @enhanced_frame_cap: flag for enhanced frame capability.
  */
-- 
2.26.2

