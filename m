Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B785ECAAD5
	for <linux-doc@archiver.kernel.org>; Fri,  9 Sep 2022 07:39:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231372AbiIIHjS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Sep 2022 03:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231656AbiIIHiS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Sep 2022 03:38:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBF0C11B031;
        Fri,  9 Sep 2022 00:35:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 115E561ED3;
        Fri,  9 Sep 2022 07:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D5BC43140;
        Fri,  9 Sep 2022 07:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662708901;
        bh=9fXBrTMJ1wXXR0UrdCCLpV7JpHoOhB0DFcPSM5RzJGE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BPX44/kJhMGXyeX8jeg/B9rw3SMukb3f5M9SvlDX9Xdjr0PGhg2YO/rd0rrJPrjdf
         MHjNF5zUFycId8EgEphiYrLRlmCgnftn+1o74S70IJ63p2S4ZUxCnh2iDZ9XEbSYjp
         AN8bbyOhwNybXuXo3y08iFs2DgOQ1v+nGQgAEnRYWnru+CRtl8tsgEm+1mV15l5wId
         Z3vqrLREoV0TJyt4c2o3kAA7X59qq3GUO4jOcxTzs2zK+4iHbw/y4YRWXC+OyjqyUK
         T2OIc+CGO+Bao7BwaGVgt9gsq6k8WJVyMZPPwWyM/gKcYUDZeJf0b9Cy+4ogbxToR4
         wNrKJoj9+boXQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
        (envelope-from <mchehab@kernel.org>)
        id 1oWYXH-007FHv-Mh;
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
Subject: [PATCH v3 36/37] drm/i915: add GuC functions to the documentation
Date:   Fri,  9 Sep 2022 09:34:43 +0200
Message-Id: <c65f75ea7aee177a2df93add4138240cf2f529da.1662708705.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1662708705.git.mchehab@kernel.org>
References: <cover.1662708705.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently, functions inside GuC aren't presented as part of the
GuC documentation.

Add them.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v3 00/37] at: https://lore.kernel.org/all/cover.1662708705.git.mchehab@kernel.org/

 Documentation/gpu/i915.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index 59c532fe0332..b71e9720a1ac 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -759,6 +759,9 @@ GuC
 
 .. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc.h
 
+.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc.c
+   :internal:
+
 .. kernel-doc:: drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
 
 .. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
-- 
2.37.3

