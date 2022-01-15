Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B63BFC433EF
	for <linux-doc@archiver.kernel.org>; Sat, 15 Jan 2022 22:30:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233820AbiAOWao (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 15 Jan 2022 17:30:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbiAOWan (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 15 Jan 2022 17:30:43 -0500
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32082C061574
        for <linux-doc@vger.kernel.org>; Sat, 15 Jan 2022 14:30:43 -0800 (PST)
Received: by mail-vk1-xa36.google.com with SMTP id b77so8018343vka.11
        for <linux-doc@vger.kernel.org>; Sat, 15 Jan 2022 14:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hunterchasens-com.20210112.gappssmtp.com; s=20210112;
        h=from:date:to:subject:message-id:mime-version:content-disposition;
        bh=kuLjpvgeUM8wedmMKGC/FllXT3eWr7g/NrDXYNHsZiI=;
        b=IfYq2byjgo9pZbjEqL8Kag0+vXeJn1K6j44u/W32BScVEsRo3Z75XDuTbMkEUVpgZY
         q99esg8PEyLzF0XRF1AYMfk4dTuB3IfLuRwUOBJ2QBGI985UyHVz2MHtvIl4EI3qEgF4
         KekTeIS3uKL7TpveR2VTXtHH9g0PXZkv0lc1vH8fOCMAsMC0KPVio8jRi1hPCaLdSP6x
         KI1xXfEx48k3N+lyTlMoyWkP4pV6naA8oOZrHjVSwa4tqsYKnQ5dKQgmjbFxKoVDznFz
         Jf34mxr2ZEoqkyzAM36Q/p9ul5+0BQ+t58RzB2hCkRIMtquBtJLlDzZCsLwcqK8nAi29
         YstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:subject:message-id:mime-version
         :content-disposition;
        bh=kuLjpvgeUM8wedmMKGC/FllXT3eWr7g/NrDXYNHsZiI=;
        b=6tfKsphFbGwyh7GdvaHg34uhLku1jK5a3hdIAGQ+gR4nlJzrQI5wQe9NdC9hyw8AgJ
         AigTFiB+dKcizTRTQ/1sgl9PPG7TyEC4T4W3z2UKW+Sgr+P0m+8Ah5bbZsMk44sX6SGa
         BMOdIynhBH3CWA2NSN7EblNTwueVXaOwiPt8BUWFfoVf+cW7o+Na15GF6dw82eoco94l
         DIHrKe33Q/ERw8ZOzu2PZWqASg8WrEla+CeuUS+c5JBkyQVwrF8is9R5O4Uma5b2G7VY
         0mGlJFGzjkCXx24LEZvRCcM8dFho59ImL91DBDmQKQlwXCuLHwSqr7Fbbvom9LuH7Uzh
         ernA==
X-Gm-Message-State: AOAM530SnJ2Axja2CGaAIJVhI1HzqUBIMGmOj0BATJMnbQVTTsoYYoy3
        RPnnbhICOZaUnRB0m4SiHY6VIfLPDhmmtVx5
X-Google-Smtp-Source: ABdhPJwL7gpi6mkPmrhoU3ZHf9jWm1Po9uutE4ZkdyHre2oDg0tmdv6eN8trElateXbYlk7xIj29Lw==
X-Received: by 2002:a05:6122:178a:: with SMTP id o10mr1905199vkf.25.1642285841811;
        Sat, 15 Jan 2022 14:30:41 -0800 (PST)
Received: from gaming1-ncf-edu ([199.167.103.89])
        by smtp.gmail.com with ESMTPSA id k77sm528009vka.20.2022.01.15.14.30.41
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 14:30:41 -0800 (PST)
From:   Hunter Chasens <admin@hunterchasens.com>
X-Google-Original-From: Hunter Chasens <hunter.chasens18@ncf.edu>
Date:   Sat, 15 Jan 2022 17:30:40 -0500
To:     linux-doc@vger.kernel.org
Subject: [PATCH] docs: process/2.Process.rst: fixes five general grammatical
 errors
Message-ID: <20220115223040.GA2414610@gaming1-ncf-edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Hunter Chasens <hunter.chasens18@ncf.edu>
---
 Documentation/process/2.Process.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/process/2.Process.rst b/Documentation/process/2.Process.rst
index e05fb1b8f..31e370073 100644
--- a/Documentation/process/2.Process.rst
+++ b/Documentation/process/2.Process.rst
@@ -68,7 +68,7 @@ As fixes make their way into the mainline, the patch rate will slow over
 time.  Linus releases new -rc kernels about once a week; a normal series
 will get up to somewhere between -rc6 and -rc9 before the kernel is
 considered to be sufficiently stable and the final release is made.
-At that point the whole process starts over again.
+At that point, the whole process starts over again.
 
 As an example, here is how the 5.4 development cycle went (all dates in
 2019):
@@ -166,7 +166,7 @@ The stages that a patch goes through are, generally:
  - Design.  This is where the real requirements for the patch - and the way
    those requirements will be met - are laid out.  Design work is often
    done without involving the community, but it is better to do this work
-   in the open if at all possible; it can save a lot of time redesigning
+   in the open, if at all possible; it can save a lot of time redesigning
    things later.
 
  - Early review.  Patches are posted to the relevant mailing list, and
@@ -174,12 +174,12 @@ The stages that a patch goes through are, generally:
    process should turn up any major problems with a patch if all goes
    well.
 
- - Wider review.  When the patch is getting close to ready for mainline
+ - Wider review.  When the patch is getting close to being ready for mainline
    inclusion, it should be accepted by a relevant subsystem maintainer -
    though this acceptance is not a guarantee that the patch will make it
    all the way to the mainline.  The patch will show up in the maintainer's
    subsystem tree and into the -next trees (described below).  When the
-   process works, this step leads to more extensive review of the patch and
+   process works, this step leads to a more extensive review of the patch and
    the discovery of any problems resulting from the integration of this
    patch with work being done by others.
 
@@ -408,7 +408,7 @@ There are lists hosted elsewhere, though; a number of them are at
 redhat.com/mailman/listinfo.
 
 The core mailing list for kernel development is, of course, linux-kernel.
-This list is an intimidating place to be; volume can reach 500 messages per
+This list is an intimidating place to be; the volume can reach 500 messages per
 day, the amount of noise is high, the conversation can be severely
 technical, and participants are not always concerned with showing a high
 degree of politeness.  But there is no other place where the kernel
-- 
2.25.1

