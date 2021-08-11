Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF1BC4338F
	for <linux-doc@archiver.kernel.org>; Wed, 11 Aug 2021 07:43:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93E7D6056B
	for <linux-doc@archiver.kernel.org>; Wed, 11 Aug 2021 07:43:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235037AbhHKHnq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Aug 2021 03:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233182AbhHKHnp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Aug 2021 03:43:45 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44BA1C061765
        for <linux-doc@vger.kernel.org>; Wed, 11 Aug 2021 00:43:22 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id u1so1284721wmm.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Aug 2021 00:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VMBx2f2ryRnJij4HtLsN4bhexipr1N0Fd89Und7jmKI=;
        b=OHS+HDA/+vtY1W2F4658aQ5/aftHc5fos2EiMnnlnm3ilKAedbXnd1UT8E4MPPExeg
         5FcsVkg/QGNCxiUyJH/DX1pCzK5OtXQO0W90j9G2vOh5gzXE0X0SezisX+0wnhkibw60
         XEKJWbtZSb/y9Zw89h+DZZNjurTz2vy59REoBKzcUm/MyqJ7JhTOtQwknsbAlmYKK8I6
         16deGiUypBSWja/CkdRcrSyglq701sm9dSwLD5ic+pcnVCQSArSDu6oJ4dS7/g9Jh9Sq
         gjviwFVBh9HVt0JU3a5oUG2Ep3Jin1jtkcvuBD4vb+UemavZFH+ukzRLnxmzo6LT0/X2
         Zy2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VMBx2f2ryRnJij4HtLsN4bhexipr1N0Fd89Und7jmKI=;
        b=XMQBHJ9+ZYyJejVgbygStvtYCc/2/CxV+gYqg3guV3kXFyg1vpyE7b9L2FXYF5QNT3
         YBNYPoquLZyR10bIQRK8ZAhk9TnfwKSxlsR3T2EwwM0F5+8LF+2XMuPeSx4vCouefxee
         WFJxjIWxbT3VHr96fttcoANj4ILQU8doGog0lD6gY0B/P+o/Uo1R6+2WVidXjIBxlxYc
         R6QBYSqMp6srr4tnQ1ebon1rNYHWALZYUfNabdmldrmXxGqiH06Lcii3G2cpPUyDPgWb
         rGTAJ2GlvpbDtn+uSWFECNUDpTfu5aLMCph7d6GrGnKvi0MLhQ3CpwsfiPEpLwOspdkA
         M63Q==
X-Gm-Message-State: AOAM5334FISM9mtlcwhl7HYsQO+/6KBnsYkDDpwlN8XSNiqOmT2wcjrt
        OGRfiWTTBW44ybzUtlUtwOOllg==
X-Google-Smtp-Source: ABdhPJyG8267tX3nOVt0WHe1OYMAOORenF0eZsNc5CO6sBxjMZ0l2qi1hLB2Kr9hVjp+qCU+aH/6KQ==
X-Received: by 2002:a05:600c:3653:: with SMTP id y19mr26494417wmq.147.1628667800522;
        Wed, 11 Aug 2021 00:43:20 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
        by smtp.gmail.com with ESMTPSA id d9sm15348592wrw.26.2021.08.11.00.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 00:43:20 -0700 (PDT)
From:   Markus Schneider-Pargmann <msp@baylibre.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     linux-doc@vger.kernel.org,
        Markus Schneider-Pargmann <msp@baylibre.com>,
        Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH] doc: gpu: drm-internals: Create reference to DRM mm
Date:   Wed, 11 Aug 2021 09:42:54 +0200
Message-Id: <20210811074254.1707991-1-msp@baylibre.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This short sentence references nothing for details about memory manager.
Replace it with the documentation file for DRM memory management.

Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 Documentation/gpu/drm-internals.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
index 06af044c882f..bdcdfc4ede04 100644
--- a/Documentation/gpu/drm-internals.rst
+++ b/Documentation/gpu/drm-internals.rst
@@ -126,8 +126,8 @@ Memory Manager Initialization
 Every DRM driver requires a memory manager which must be initialized at
 load time. DRM currently contains two memory managers, the Translation
 Table Manager (TTM) and the Graphics Execution Manager (GEM). This
-document describes the use of the GEM memory manager only. See ? for
-details.
+document describes the use of the GEM memory manager only. See
+Documentation/gpu/drm-mm.rst for details.
 
 Miscellaneous Device Configuration
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.32.0

