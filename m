Return-Path: <SRS0=C3TA=EC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE3BC4363A
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 10:02:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E80F20732
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 10:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603792949;
	bh=4Bu6akfKjaahqyWEGXpzqa8kviAzcp1lUCJxl8zFrWQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=OD2x1sYIlRzfAj8w28SRs8qxOSvGP7/mFEaOHHE1yRliUFmNGjpFGzi1EM5n6Kv76
	 bdOrzvU3UzowMyTveUKn+alflXRyrryVrGfpM1igV3Gj9MC8vLYwYsKnn1eh8ubAkr
	 AGU9hceMjZRchPQkgmj/Xa1sV7j+O2iRhcKkHirQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896888AbgJ0KCS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Oct 2020 06:02:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:42516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896031AbgJ0Jvm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 27 Oct 2020 05:51:42 -0400
Received: from mail.kernel.org (ip5f5ad5af.dynamic.kabel-deutschland.de [95.90.213.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 49ADD223AB;
        Tue, 27 Oct 2020 09:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603792301;
        bh=4Bu6akfKjaahqyWEGXpzqa8kviAzcp1lUCJxl8zFrWQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vntfPDjZdT2gTCYKiegEGjUfFDRECf8mdyMsr1tqgA0lruUT8kyHr6xO4C/cZFEEk
         GvZtryzyEdBNjQsBhau+bn/DlTHMjAq9d0tt6F4ltEadnvHmVoS3fTPoE7O5GOfnKD
         NhT4fVuELY20BAiin4QgPu5X9l/8TMu9l/1vil1Y=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kXLdj-003FEr-8B; Tue, 27 Oct 2020 10:51:39 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Emil Velikov <emil.velikov@collabora.com>,
        Jeevan B <jeevan.b@intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Oleg Vasilev <oleg.vasilev@intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/32] drm: kernel-doc: document drm_dp_set_subconnector_property() params
Date:   Tue, 27 Oct 2020 10:51:14 +0100
Message-Id: <0870be85a77bea4ba5cf1715010834289a4e10b1.1603791716.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603791716.git.mchehab+huawei@kernel.org>
References: <cover.1603791716.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changeset e5b92773287c ("drm: report dp downstream port type as a subconnector property")
added a new function to the kAPI, but didn't add any documentation
for the parameters for drm_dp_set_subconnector_property().

Fixes: e5b92773287c ("drm: report dp downstream port type as a subconnector property")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/gpu/drm/drm_dp_helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 90807a6b415c..b1c71af88579 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -1028,7 +1028,8 @@ EXPORT_SYMBOL(drm_dp_downstream_debug);
 
 /**
  * drm_dp_subconnector_type() - get DP branch device type
- *
+ * @dpcd: DisplayPort configuration data
+ * @port_cap: port capabilities
  */
 enum drm_mode_subconnector
 drm_dp_subconnector_type(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
@@ -1079,6 +1080,10 @@ EXPORT_SYMBOL(drm_dp_subconnector_type);
 
 /**
  * drm_mode_set_dp_subconnector_property - set subconnector for DP connector
+ * @connector: connector to set property on
+ * @status: connector status
+ * @dpcd: DisplayPort configuration data
+ * @port_cap: port capabilities
  *
  * Called by a driver on every detect event.
  */
-- 
2.26.2

