Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4790FC433E9
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 14:24:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25FAF233FC
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 14:24:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbhAMOYh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Jan 2021 09:24:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbhAMOYh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Jan 2021 09:24:37 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED19CC061786
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 06:23:56 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id a6so1771097wmc.2
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 06:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Td/hCZTImHCFfn7I9NMHTC6SnVd0rI2LHAoKiSHSGRI=;
        b=fbUDkDP/slYttuIBNGNx8xoUSvoR+GMLiLuH2zv7hH5Lz6XJ5uxT9Rdgo+baCX7UB7
         /ZtFGVuBLNBh+WGpl2RheTIAbcAeAo1eRavxM4TiOD791jlkjeJ0EAMY1pFO0jJWp4Tx
         Q5V9Jvz2nw60MpFa21p8RLn1ixt4K3x5pz6P56FpuKjgugBYYvTqZNK3fdJvesfmkGa8
         iCsiGzaKotvl7w0/y9w0ELTSz7xUDVd+VjmtflpPc0SL0TTXfG9yPXWtZAx1G7jAkrsl
         GG0f2ZqICZkBltMPuQFWSUZYhdt7lhHay7x0Nxnc4Ouff+joHuZVDlBhufN1JyZmWtLT
         ssZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Td/hCZTImHCFfn7I9NMHTC6SnVd0rI2LHAoKiSHSGRI=;
        b=jouMSzdzoLu9v9PwlXERBND8NOmfdVh4PrjfpTc8X1x/iwTO4j8lA3TuJVxDwfCRYC
         2wL1J66h809Q6TedDgoZGiR2kV8mcPUPslysAjEm+5HA/xcp6Ld1n3HDTE+EKJ7asYB7
         0r1WVTKe50JOnxwUdFnMpjarVyyJU7UgD3584O9C+mjhfBadXH0TUfgUlYzj1iDhE5RU
         G/GeDXufV9gCUCYO9ioVRrJqSp+U+4ob+zRhhl1u+LQmcdSGOmTi7cuJ5TB/0efDyXIZ
         Hf5vAgqfuuHUkH6N+5cU46mmL8Ltg1mzS7wJeuBIJTVPN3r+SaAV6J7xxz8wxASGdHGt
         4t7w==
X-Gm-Message-State: AOAM530+DrAn+Qb6ssbq0VWujKcrSgkiEqKEkckCOO8hkeOmnOrmiTEx
        lDNmgAH2sOb5z6gkrihjOI0ieA==
X-Google-Smtp-Source: ABdhPJzf6LUGgt0M3eLLOrgKTAxF2rSt7rUSZxEbwj/IsnQ0A/emTAD1L+zAf9mwLdeCF3eSZczSaA==
X-Received: by 2002:a1c:bc41:: with SMTP id m62mr2487304wmf.46.1610547835745;
        Wed, 13 Jan 2021 06:23:55 -0800 (PST)
Received: from dell.default ([91.110.221.229])
        by smtp.gmail.com with ESMTPSA id b9sm3636523wmd.32.2021.01.13.06.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 06:23:55 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 1/1] docs: submitting-patches: Emphasise the requirement to Cc: stable when using Fixes: tag
Date:   Wed, 13 Jan 2021 14:23:47 +0000
Message-Id: <20210113142347.1263024-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Clear-up any confusion surrounding the Fixes: tag with regards to the
need to Cc: the stable mailing list when submitting stable patch
candidates.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 Documentation/process/submitting-patches.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 7c97ad580e7d0..636ef067c1565 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -554,7 +554,8 @@ is used to make it easy to determine where a bug originated, which can help
 review a bug fix. This tag also assists the stable kernel team in determining
 which stable kernel versions should receive your fix. This is the preferred
 method for indicating a bug fixed by the patch. See :ref:`describe_changes`
-for more details.
+for more details. Attaching a Fixes: tag does not replace the requirement to
+Cc: stable@vger.kernel.org on all stable patch candidates.
 
 .. _the_canonical_patch_format:
 
-- 
2.25.1

