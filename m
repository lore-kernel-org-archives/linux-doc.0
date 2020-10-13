Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E044C4363A
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 11:55:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23CFD20870
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 11:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602590146;
	bh=YmKVL+6rXgGYIixlxi4+UihRuUUuG7UxvwUheXsFnBg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=PVno3y0TmIjoQL6beEQ12bcLfuErav/N+ySsqjRunxPw46tfa3N9diVEVRqOI2+uX
	 KVp8mN2qRXg8ywupB8G9haV6iNTSIIOMTBaAqB27j3MsTo+aAYmAJSZjDwIsP+C9DA
	 YCW+GSl+hf2nny+U9JHrjYz52DQhoUAY+agWCqCo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727810AbgJMLzV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 07:55:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:57414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727780AbgJMLzP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Oct 2020 07:55:15 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 96DE422AAA;
        Tue, 13 Oct 2020 11:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602590081;
        bh=YmKVL+6rXgGYIixlxi4+UihRuUUuG7UxvwUheXsFnBg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=donI3o2TKUOh6/x/0WLG/TZU4gYa7+sYWKXkAm/sj6x40RhPqLiTFJHUr8kq0A1tN
         KjeqUZ0mv8RyT/NjHMRKm+FLtB96C0FkmY7SyW2FVLtwqGwgLlEX+4LIgF0mPgVNNV
         SPGbV5h6H3cwJxtDQzQwCLWY2tkPBZ6bsRZ04GSE=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kSIt5-006CWE-HV; Tue, 13 Oct 2020 13:54:39 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 65/80] docs: amdgpu: fix a warning when building the documentation
Date:   Tue, 13 Oct 2020 13:54:20 +0200
Message-Id: <6e511c1938e4b5e312474ea50bdde964770c1e44.1602589096.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602589096.git.mchehab+huawei@kernel.org>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As reported by Sphinx:

	Documentation/gpu/amdgpu.rst:200: WARNING: Inline emphasis start-string without end-string.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/gpu/amdgpu.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/amdgpu.rst b/Documentation/gpu/amdgpu.rst
index 17112352f605..4ed8ecf1cd86 100644
--- a/Documentation/gpu/amdgpu.rst
+++ b/Documentation/gpu/amdgpu.rst
@@ -197,8 +197,8 @@ pp_power_profile_mode
 .. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
    :doc: pp_power_profile_mode
 
-*_busy_percent
-~~~~~~~~~~~~~~
+\*_busy_percent
+~~~~~~~~~~~~~~~
 
 .. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
    :doc: gpu_busy_percent
-- 
2.26.2

