Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD1F0ECAAA1
	for <linux-doc@archiver.kernel.org>; Fri,  9 Sep 2022 07:38:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbiIIHiC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Sep 2022 03:38:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231356AbiIIHgo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Sep 2022 03:36:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 945E01269DA;
        Fri,  9 Sep 2022 00:35:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1A8DB61ECF;
        Fri,  9 Sep 2022 07:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5929DC43140;
        Fri,  9 Sep 2022 07:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662708895;
        bh=LEEwLA3HnTZzfr9zSHnNeeHw98aU6/L5pK0OTNVwtts=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=f7UGACSNbEtGu64yyT3G5y2LBC1n7hfW6Ujyc55KReD5ZTT/nOqEfjXURmybSPY3k
         AWF85KCDB5yLRHpEbhFvLwFJ2e767UOC4m6n8DRfjr00HAB41wkMXhnS9Z2ojMmC6D
         J0bZl/hCJfJYQGBgyGmLLkx3vn8hgJg3mNuUXHpq/kY524pHPi3+JOpcKxqvFr0zLk
         bZWTaEwhP9I6Wz1qi+6POuyC9AsQWI/fmS4oW1KYHjOwN//HzVFUdcLDB6GCUCMgJY
         yNJCHPeoPwHEI2fqjdYI/hYDAwmQ+sk+iLKCVTartfAwYj1AI+wZgFO01L2yA73wG3
         Cq1Q1UDLHGluA==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
        (envelope-from <mchehab@kernel.org>)
        id 1oWYXH-007FHb-Cz;
        Fri, 09 Sep 2022 09:34:47 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 31/37] docs: gpu: i915.rst: GEM/TTM: add more kernel-doc markups
Date:   Fri,  9 Sep 2022 09:34:38 +0200
Message-Id: <6b781d1506f1ac63869b0274893656ed5ba0e620.1662708705.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1662708705.git.mchehab@kernel.org>
References: <cover.1662708705.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are several documented GEM/TTM kAPI that aren't currently part
of the docs. Add them, as this allows identifying issues with
badly-formatted tags.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v3 00/37] at: https://lore.kernel.org/all/cover.1662708705.git.mchehab@kernel.org/

 Documentation/gpu/i915.rst | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index 4ce04a457ccc..545fe630557a 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -612,6 +612,44 @@ Protected Objects
 
 .. kernel-doc:: drivers/gpu/drm/i915/pxp/intel_pxp_types.h
 
+Table Manager (TTM)
+-------------------
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_ttm.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+
+Graphics Execution Manager (GEM)
+--------------------------------
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_create.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_domain.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_internal.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_lmem.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_mman.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_object.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_object.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_region.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_region.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_wait.c
+
 Microcontrollers
 ================
 
-- 
2.37.3

