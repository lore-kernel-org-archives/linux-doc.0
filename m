Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 944D9C433DB
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 16:34:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49EBB235F8
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 16:34:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727682AbhAMQeG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Jan 2021 11:34:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727484AbhAMQeG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Jan 2021 11:34:06 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6468C061794
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 08:33:25 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id e25so2184014wme.0
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 08:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NGCZdsFKJWiEc3OQrxZt2hriTeRVybh3qyvM4UrUMLU=;
        b=x3xpkOkvIcybs/NjofIbtLA2wckcmEtmgx28mmK4aHpHBI1BXWLI8pZz0WzZzEGFCt
         lqb9OIvHhexUD4mfWZkNC9HKNG4u8r61+UT7vidDQ0USw4CtFRv7wOoZ6yawwktboz0B
         DtZnuCRPZssp9KwlxS+mZqPDoMk3HNCYWYXoCcDCC0uwRKeUH+uxsfeVFkIRv535v65r
         JAimaSzUkpIbn6vCwFp6MtfvJKog/6oDVS9WPVbk3Sx20lonky2prbv4H+zmmIwdifH4
         oUK4UcIyPRBNGtnj4urBndpJEoWpqfaFyPIZ9E9d9mnjVf/crprAtUUS58FUdvTa3dcG
         1ydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NGCZdsFKJWiEc3OQrxZt2hriTeRVybh3qyvM4UrUMLU=;
        b=t0yR6Maoxu7cLJR/wDcCteO7gBpR66k7Wo8FAg8KGMW5uCndx0XAmHfegB/RCtJuRh
         ADQUcmLMtjrzdJ0HIMwYllBonPnYf//YWQe40MAmvChgwxyC/AOHLzfn71fDLHwmCrAc
         zB7jfoV3OkF35gT7LmCDnyiknswvUOdYOzryy1f73SGwP53iElT62YU0zf2DDh04ck2+
         bKgtItRE1/HWBsR7vEukY6C8OGPFUvEAD9WkbLxHMHbmgmOgbiSn/+mZsF5m29rbgXAW
         4ccbpr6FOLJAeVR1i7JQ13hXs/g0rxLpSXa9cxpwzKw79Lr9Vp2ZS5GJiBrmIO+sKnfo
         J/xA==
X-Gm-Message-State: AOAM533xb+28vYAsliTielvWa4IB84386UxxMw8fVtXwHFKDUO2iTCQK
        ObIfpTXkKMj+c5DHWasxXvrnYQ==
X-Google-Smtp-Source: ABdhPJw2UGtEIs7agh31VQ/lw0viAuHQ+FpVDBi2NZ21ev+oHKJCh93ldbkuXql/kl2iO9+0gcM2mw==
X-Received: by 2002:a7b:cc8e:: with SMTP id p14mr70691wma.69.1610555604648;
        Wed, 13 Jan 2021 08:33:24 -0800 (PST)
Received: from dell.default ([91.110.221.229])
        by smtp.gmail.com with ESMTPSA id q7sm3843912wrx.62.2021.01.13.08.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 08:33:23 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v2 1/1] docs: submitting-patches: Emphasise the requirement to Cc: stable when using Fixes: tag
Date:   Wed, 13 Jan 2021 16:33:15 +0000
Message-Id: <20210113163315.1331064-1-lee.jones@linaro.org>
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
v2:
 - Link to the 'stable-kernel-rules' document as per Greg's request

 Documentation/process/submitting-patches.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 7c97ad580e7d0..7f48cccc75cdf 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -556,6 +556,11 @@ which stable kernel versions should receive your fix. This is the preferred
 method for indicating a bug fixed by the patch. See :ref:`describe_changes`
 for more details.
 
+Note: Attaching a Fixes: tag does not subvert the stable kernel rules
+process nor the requirement to Cc: stable@vger.kernel.org on all stable 
+patch candidates. For more information, please read
+:ref:`Documentation/process/stable-kernel-rules.rst <stable_kernel_rules>`
+     
 .. _the_canonical_patch_format:
 
 The canonical patch format
-- 
2.25.1

