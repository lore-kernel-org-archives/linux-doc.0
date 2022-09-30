Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEE5C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 30 Sep 2022 06:47:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbiI3GrI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Sep 2022 02:47:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbiI3Gqs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Sep 2022 02:46:48 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A486F208550
        for <linux-doc@vger.kernel.org>; Thu, 29 Sep 2022 23:46:35 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id n40-20020a05600c3ba800b003b49aefc35fso1748829wms.5
        for <linux-doc@vger.kernel.org>; Thu, 29 Sep 2022 23:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=L/8n41IpmfxMmQ3lf5X530nNE0M2sxxt0fpOlbTYxL0=;
        b=YHgw2jsOf2tW4yAD4cWPD/zRNaai+Adb1JoPQptP39eUNgjm4rHNu2v2JCm+AqMW66
         Ajks3ylBSo9SRrTvdhEiR9uCbNWyNmrW7pCRNDHUzwW2cTLrOozDe0Uc4Ocp5IwqEprN
         YKRp4yfoqJL3JdvLZSZ9Qi2YMj5qdCtNJB2kPZQq5c9oa9/5LQgJ7PoueF4gkBzVzKxd
         k7edx8jg2YKMLMuES3jYe+sOS2gUHmy+n5uAwaJGYny6bLZpb+uPUobPUGJZjLM5v0ZV
         7SAe1hHewGnCzT7iEOwTxaqb1bFdUbSN4+UP0ij/bGFsD/MqBHsgJKdnld2dc3jkURTg
         r/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=L/8n41IpmfxMmQ3lf5X530nNE0M2sxxt0fpOlbTYxL0=;
        b=bCGZBn5VgT6I8wpNaH7iNsUyvq572PdMWJEu4PTFTv0Yby+wMnuZJ8COclAZ9f5pcp
         NZfnRN/9VB7zvYloJGNZRWVykWc5ekYyj92c+P3WeYpvSHlvhq86AVv1SXFbRpZfrdm9
         npE5Be4MvnqxoAfF1KxSXg4snxr5c1rmG8qrtiq87KuSrotlVpgpvvidW6J+xndxpYrN
         478CHGeiIcCNY2mOMVWNfaelCFV53IM0r1N4gsINTdILZF/N2+JudFSun05hLZ0eGjGB
         W/JtJOfcAWmOojB8aEgJMAT4T/36eYtemdIYHPInV9oX4pZTjWbWT+ZL6sMRaYLfrS9S
         50Cw==
X-Gm-Message-State: ACrzQf1GoKJqEZBUPWWSxugfMGnzeSaZtYtxnzmWPRzfsN3JF0ZTkLDG
        MHKBtbXCDNmPr9TQoAyafLbafGagkUvQzw==
X-Google-Smtp-Source: AMsMyM7bbAdFXi/LQXK72xIm9SeNUlkXbyNcqr/VEgMwdIalOO+JsR1raQl36c6WqNMK0liAZaqEpg==
X-Received: by 2002:a05:600c:3d8a:b0:3b4:a4e1:8661 with SMTP id bi10-20020a05600c3d8a00b003b4a4e18661mr4804216wmb.30.1664520394158;
        Thu, 29 Sep 2022 23:46:34 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p8-20020a05600c05c800b003b332a7b898sm1154818wmd.45.2022.09.29.23.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 23:46:33 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     corbet@lwn.net, linux@leemhuis.info,
        konstantin@linuxfoundation.org, krzysztof.kozlowski@linaro.org,
        tytso@mit.edu, linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v3] Documentation/process: Add text to indicate supporters should be mailed
Date:   Fri, 30 Sep 2022 07:46:29 +0100
Message-Id: <20220930064629.329514-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220930064629.329514-1-bryan.odonoghue@linaro.org>
References: <20220930064629.329514-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Recently when submitting a yaml change I found that I had omitted the
maintainer whose tree the change needed to go through.

The reason for that is the path in MAINTAINERS is marked as Supported not
Maintained. Reading MAINTAINERS we see quote:

           Supported:   Someone is actually paid to look after this.
           Maintained:  Someone actually looks after it.

The current submitting-patches.rst only says to mail maintainers though not
supporters. When we run scripts/get_maintainer.pl anybody who is denoted a
paid maintainer will appear as a supporter.

Add text to state that every mail address returned by get_maintainer.pl
--nogit-fallback should be included when submitting a patch, giving an
example of the same.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/process/submitting-patches.rst | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index be49d8f2601b4..18a1f52e0563a 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -227,9 +227,15 @@ You should always copy the appropriate subsystem maintainer(s) on any patch
 to code that they maintain; look through the MAINTAINERS file and the
 source code revision history to see who those maintainers are.  The
 script scripts/get_maintainer.pl can be very useful at this step (pass paths to
-your patches as arguments to scripts/get_maintainer.pl).  If you cannot find a
-maintainer for the subsystem you are working on, Andrew Morton
-(akpm@linux-foundation.org) serves as a maintainer of last resort.
+your patches as arguments to scripts/get_maintainer.pl).  You should mail every
+email address returned by `scripts/get_maintainer.pl --nogit-fallback` when
+submitting a patch.
+For example::
+
+    $ scripts/get_maintainer.pl --nogit-fallback -f submitting-patches.rst
+    Jonathan Corbet <corbet@lwn.net> (maintainer:DOCUMENTATION)
+    linux-doc@vger.kernel.org (open list:DOCUMENTATION)
+    linux-kernel@vger.kernel.org (open list)
 
 You should also normally choose at least one mailing list to receive a copy
 of your patch set.  linux-kernel@vger.kernel.org should be used by default
-- 
2.37.3

