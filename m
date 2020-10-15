Return-Path: <SRS0=MgSu=DW=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5B9C433E7
	for <linux-doc@archiver.kernel.org>; Thu, 15 Oct 2020 06:23:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E635622247
	for <linux-doc@archiver.kernel.org>; Thu, 15 Oct 2020 06:23:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=csie-ntu-edu-tw.20150623.gappssmtp.com header.i=@csie-ntu-edu-tw.20150623.gappssmtp.com header.b="uH9p+ldi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728702AbgJOGXz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Oct 2020 02:23:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728086AbgJOGXz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Oct 2020 02:23:55 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4791CC061755
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2020 23:23:55 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id n9so1236522pgf.9
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2020 23:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=csie-ntu-edu-tw.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=rOybbcG2gzRHb5Bvm5WG6KUjxX79ZyS3rQJBpiyljFo=;
        b=uH9p+ldiS0oDncC2bwZRnT3A6Ev/GJNL626t90SqFCGv+rK8+O2TF3TfmDy/nBTUHd
         rBLxXzPbuUsxIzvVeK6KT4IeA/iBkq9p+kEOxcHLeKAKebLY/RUo5sh0kd7s+Y+MPJlz
         3D7sviFfgC4s7dyJWiNYvGYWcNpwFlu12uRpoB84X2mwEcOIYXH8AgAi8DJ5vEyJPnm4
         F3moBcG7VSlkCux3fX9LkR8rws1YvC4ObQXhMNxjbLk6jhzSEWWnq3IA+eLZ80+Nx6ta
         OlZRqCiLHOz13KXBbt98Xb5+LFE70BFiPSm6J1Hr7TEpmWFNGxDbclEJCKLyGRFC+uYC
         Wl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=rOybbcG2gzRHb5Bvm5WG6KUjxX79ZyS3rQJBpiyljFo=;
        b=sotiUErRGQATmi5sNcL7izG8mLYF+zHxFqexU25x4Ac7FJ4qN1Aq5XfZ17FTwlv38y
         DyMXjLThb1L+uqqBbpmGZm+UjULlWFvRoBxoDNFmCoMnz8aE+PeiuyUWWJjwJkbRk0nh
         d1qvMouK1SKcGCee/mbTHpqXZ8dmyYnf4uAbc8mJSuCF3F2SRKxr4+apYb9UgC3Uub1r
         PjWcG5FWRErDfS3FzwYCL8gzenPDnL8IVZRNRwEslBqvmpTqjTJ85ttkf2JIvjp1vjAj
         BX1+SfDpCxR6dXqKT+8/oYFYnuvd8tdH9eA7XgVdHHyNhDGq2RItBQHsjxcR02VPhCLT
         q81g==
X-Gm-Message-State: AOAM530ThI4ivn0PkCb2GjWZ/uDKL8nX8XtG+FVTf0oBEiFUr2Boqada
        abkKZTCb2XCJeeg83GiTAKUllszE1+vd/i0T4WyqEUrha5/V5ER1z0N3mkaRIDh4wZF5ZwIcyBT
        JLNgiYWjATilLx+XLlgusstpqFTjMO57KGs3p3Hnmj1/9wgFeb1rlWBT13BvlzneQPimcEm1g7r
        mQDNFCy79eRNYQklgf33W7CZk=
X-Google-Smtp-Source: ABdhPJwv6rRAJ77SdeNtpkBHlMRfLSwZQZSBPwXGuDk/FwwmlCigBkmh/ALTQyhN+00BMiFkHBx0HA==
X-Received: by 2002:a63:d80e:: with SMTP id b14mr2139631pgh.114.1602743034692;
        Wed, 14 Oct 2020 23:23:54 -0700 (PDT)
Received: from localhost.localdomain (2001-b011-3803-1d24-853c-8d4c-9ff6-b9e6.dynamic-ip6.hinet.net. [2001:b011:3803:1d24:853c:8d4c:9ff6:b9e6])
        by smtp.gmail.com with ESMTPSA id x23sm1787195pfc.47.2020.10.14.23.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 23:23:54 -0700 (PDT)
From:   Wei Lin Chang <r09922117@csie.ntu.edu.tw>
To:     corbet@lwn.net
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Wei Lin Chang <r09922117@csie.ntu.edu.tw>
Subject: [PATCH] Documentation: x86: fix a missing word in x86_64/mm.rst.
Date:   Thu, 15 Oct 2020 14:22:42 +0800
Message-Id: <20201015062242.26296-1-r09922117@csie.ntu.edu.tw>
X-Mailer: git-send-email 2.17.1
X-Gm-Spam: 0
X-Gm-Phishy: 0
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch adds a missing word in x86/x86_64/mm.rst, without which
the note reads awkwardly.

Signed-off-by: Wei Lin Chang <r09922117@csie.ntu.edu.tw>
---
 Documentation/x86/x86_64/mm.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/x86/x86_64/mm.rst b/Documentation/x86/x86_64/mm.rst
index e5053404a..ede187571 100644
--- a/Documentation/x86/x86_64/mm.rst
+++ b/Documentation/x86/x86_64/mm.rst
@@ -19,7 +19,7 @@ Complete virtual memory map with 4-level page tables
    Note that as we get closer to the top of the address space, the notation changes
    from TB to GB and then MB/KB.
 
- - "16M TB" might look weird at first sight, but it's an easier to visualize size
+ - "16M TB" might look weird at first sight, but it's an easier way to visualize size
    notation than "16 EB", which few will recognize at first sight as 16 exabytes.
    It also shows it nicely how incredibly large 64-bit address space is.
 
-- 
2.17.1

