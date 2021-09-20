Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DBBBC433FE
	for <linux-doc@archiver.kernel.org>; Mon, 20 Sep 2021 10:13:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07CC560ED8
	for <linux-doc@archiver.kernel.org>; Mon, 20 Sep 2021 10:13:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233629AbhITKPL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Sep 2021 06:15:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbhITKPK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Sep 2021 06:15:10 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC2A5C061574
        for <linux-doc@vger.kernel.org>; Mon, 20 Sep 2021 03:13:43 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id t8so21003774wri.1
        for <linux-doc@vger.kernel.org>; Mon, 20 Sep 2021 03:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9IID+4ZYdzA+GPVBMk9JaAemfSAyR0y4mgBJx0dcvPc=;
        b=c8v5DvE0T/wU5KZj2Q8+H+Plb8oX3Re3WnHDJHJEb0X4YKb+kAhKMsEdpXZyPNOyuL
         MockirkGIfbYgmz6icgYaYc2KwGTGGUNVkxLi69o0fcTxs1f1ZLPsoIdlAvZRM2gBHTR
         GQ7O/DYbyR3ZTWah7w62NL4Lyc3F8SIcf0SdC/qiJFCjkRPPnBu9Tr4iEzeA9Sch4xRa
         CehJg+MpjczpK42Yy0EBaBl9RTJggLed0ILf/GIPV8Bzgjj8IGf6Crl01fbQeY8bvxLj
         O23Jk334eg43u4QqWfWFW4pZQWtzFPVvpekjqu9AtpR4thk5T0RHl9MfTaIxrqu+6/zn
         02kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9IID+4ZYdzA+GPVBMk9JaAemfSAyR0y4mgBJx0dcvPc=;
        b=g3j3E1jPPGB7OKbGFtOhx1FsDoR0PhgeDQf+IJBzQePJdxBWfx/A7Io+cA7pMn77EQ
         kfcFjav+ljW6w3WvZkYAX1l+muUOuZL94PcHFVlVrFrfd3S9m6a5FfwzDqgPiBZodMxx
         rN9J8qY51FU030QWmyuyi3v9dPeNb3Brx0iFGxXH4nbyQi2o9ofk/yCIo9AbtkWJTj2y
         RIM3y3WD8hkRZydPwfXd5T+wvC+uAf3UOSPWwKq6ixI7CMnNcM/i7avIsayITsEg3jcU
         eKyCNiiniOrJbZyVUzE7W+XZw7keGlJDtpq0bn9tmcpygt23YcDMTDVO/ihzBOh4glxZ
         x5Dw==
X-Gm-Message-State: AOAM5332mZFR8TOdqNgxbB42HzL9ez3zHj4O5PoDCGBLUW254qkjBAsf
        FEwxoviwL4kKO6RIYfY+t4jW5A==
X-Google-Smtp-Source: ABdhPJx52c1b/hmainXqgHq8wgwAhy7PHzhwn0hCaVaoGZfL4zn2dyqZf998lB22yZPnhryglgUL5Q==
X-Received: by 2002:a05:600c:2057:: with SMTP id p23mr28666589wmg.25.1632132822489;
        Mon, 20 Sep 2021 03:13:42 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
        by smtp.gmail.com with ESMTPSA id 20sm20225528wme.46.2021.09.20.03.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 03:13:42 -0700 (PDT)
From:   Markus Schneider-Pargmann <msp@baylibre.com>
To:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Markus Schneider-Pargmann <msp@baylibre.com>,
        Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH] doc: gpu: drm-internals: Create reference to DRM mm
Date:   Mon, 20 Sep 2021 12:13:34 +0200
Message-Id: <20210920101334.249832-1-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
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
2.33.0

