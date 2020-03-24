Return-Path: <SRS0=tsXf=5J=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D1EC54FCE
	for <linux-doc@archiver.kernel.org>; Tue, 24 Mar 2020 13:43:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E40182073E
	for <linux-doc@archiver.kernel.org>; Tue, 24 Mar 2020 13:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585057425;
	bh=F8p/ub/kl1GPEtJH80f/2Zq9thwe8Qbz3WN8Z13xJRo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Jy+QA01UGvzTPY0fiBnYthdYPfKDncAayRFLPqCyGprXLhsnAvLAM/YsIu6FfreXL
	 dQ+IhtCCncwMmHGiDeuEzz3E3UkatM09IwI9Z/jneGg+YxxIbc2zz7ayFU8WPsiwda
	 4nfTzeAj360tTX10j44lxpwkFU+fzByye6oeOAmw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727522AbgCXNnU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 24 Mar 2020 09:43:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:39134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727905AbgCXNnU (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 24 Mar 2020 09:43:20 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CA8212137B;
        Tue, 24 Mar 2020 13:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585057399;
        bh=F8p/ub/kl1GPEtJH80f/2Zq9thwe8Qbz3WN8Z13xJRo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BMzcU5yBjgS1Ut0sJB3NWMmdUL7UCZjHjJJBsbMJ2Jp4L9p7PPQAwNwhYP0MnNQ/j
         dR29bS61hIV3Uc4FcycXHEL2pvR7qhkNW0NCuNiyqjY32T1DjHJmVvMR9ysrGRw/pv
         s17ubRue3xQhNnF9/A37EWw0NpvCB6V08f3TuPRA=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jGjpt-0025rp-1g; Tue, 24 Mar 2020 14:43:17 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 15/20] media: Kconfig: move media controller core select to main Kconfig
Date:   Tue, 24 Mar 2020 14:43:08 +0100
Message-Id: <84ab3635bd37b47fc01197e1024bbb0287a1f264.1585057134.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1585057134.git.mchehab+huawei@kernel.org>
References: <cover.1585057134.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Let's place the main API selections at the media/Kconfig file,
as this way we can better organize things.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/Kconfig    | 9 +++++++++
 drivers/media/mc/Kconfig | 9 ---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index 54daeba339b7..86cf4f12a70d 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -140,6 +140,15 @@ config VIDEO_DEV
 	depends on MEDIA_SUPPORT
 	default MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT || V4L_PLATFORM_DRIVERS
 
+config MEDIA_CONTROLLER
+	bool "Media Controller API"
+	depends on MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT
+	help
+	  Enable the media controller API used to query media devices internal
+	  topology and configure it dynamically.
+
+	  This API is mostly used by camera interfaces in embedded platforms.
+
 source "drivers/media/v4l2-core/Kconfig"
 
 #
diff --git a/drivers/media/mc/Kconfig b/drivers/media/mc/Kconfig
index 3b9795cfcb36..b3579d6c9e32 100644
--- a/drivers/media/mc/Kconfig
+++ b/drivers/media/mc/Kconfig
@@ -3,15 +3,6 @@
 #	Selectable only for webcam/grabbers, as other drivers don't use it
 #
 
-config MEDIA_CONTROLLER
-	bool "Media Controller API"
-	depends on MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT
-	help
-	  Enable the media controller API used to query media devices internal
-	  topology and configure it dynamically.
-
-	  This API is mostly used by camera interfaces in embedded platforms.
-
 config MEDIA_CONTROLLER_DVB
 	bool "Enable Media controller for DVB (EXPERIMENTAL)"
 	depends on MEDIA_CONTROLLER && DVB_CORE
-- 
2.24.1

