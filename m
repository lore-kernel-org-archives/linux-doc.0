Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFD7C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 08:01:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9098F60295
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 08:01:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhINICg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Sep 2021 04:02:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbhINICH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Sep 2021 04:02:07 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27A64C061764
        for <linux-doc@vger.kernel.org>; Tue, 14 Sep 2021 01:00:50 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id f3-20020a17090a638300b00199097ddf1aso1536180pjj.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Sep 2021 01:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k7xMZdNTa6phNixmcofxKMHXjTC8EieiHnbTo118lfc=;
        b=WCLGSXhdNpBcpBxyP1yx6Nda7ojrql4KR4FU8f6wzGsjmRvqyOoewYESO4e93/8Ipp
         sDHEYoKehqtB+HHB1RU1ectAXqgeFrGGAAfcC+gpe8RIE0hWxD+zNcFHTBkf8LPm/3Dg
         MPsmMszAxfzBIsupWYvbMbEru9dW3qH0zBeORpRMa3ZSzf/jgV7tOZeJ9jQa4P3bO2m0
         cL/ig4Go4cwie+WxDIEyg3FodozJO5dbilseeJaW2BqQPiUaXPYvD/sVuZ/9+7Q3bLxx
         CWbT/r1yg2FQpXT+Xc/gGLBU0nM10yYEtSkIvdHjAPPssRfdtCujuTPOHZ/fUFvT3o3l
         oGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k7xMZdNTa6phNixmcofxKMHXjTC8EieiHnbTo118lfc=;
        b=i8K3/D3uDB1IFTRivN2z0KIo96nmBXWesW1aSbuZvn/4XAu3fSUA7UW0aL2B+Q6C2m
         E1Sjm+07ifs12n/f7aZPIC4rpmV+0Ylc3a9CQpml4m01QKWxgG8fQkBimaCoXsx0sTEo
         WZXebtI0kYuB007Eoyh2LsVuPJbwuNeuj39QmmAMuFEB773UNFwlANcdcEmFYS2G2s9g
         TuHr+4jfE1T168ZBDNpe5GPkBtX2jMc+u+teOY0uMwZUhXgCTnb5z9c/bIfADZEvv6Gy
         /0kV/MyKuvMTOSWGr1ihFKubuaTrcyd0sI4pIbeYUyIlWJcT38MYXgylBUgjkF99xIBN
         9G5A==
X-Gm-Message-State: AOAM532OvcJzYX1EP0ismHH2M8iGYwAZh7vp9qw4Rv/xUQ5uX0+el83M
        dalZRlW4dGJ8406HAP5gv0M=
X-Google-Smtp-Source: ABdhPJyTGZgKL3DMcd1zeeye5Kq21RHejGbBc015OVEXaVwozSApfSS2kyjprJ+gUUG8ieCFXQGhlg==
X-Received: by 2002:a17:903:41d0:b0:138:8d81:95d5 with SMTP id u16-20020a17090341d000b001388d8195d5mr13914662ple.67.1631606449695;
        Tue, 14 Sep 2021 01:00:49 -0700 (PDT)
Received: from localhost.localdomain ([8.47.69.162])
        by smtp.gmail.com with ESMTPSA id w11sm10226721pgf.5.2021.09.14.01.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 01:00:49 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH 3/3] docs/zh_CN: modify some words
Date:   Tue, 14 Sep 2021 15:59:49 +0800
Message-Id: <4a5927bd26e35b989520b4bb2c6a23a8431711be.1631605791.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1631605791.git.siyanteng@loongson.cn>
References: <cover.1631605791.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

commit message in English, we better not give the Chinese readers a wrong guidance.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/process/submitting-patches.rst         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/submitting-patches.rst b/Documentation/translations/zh_CN/process/submitting-patches.rst
index 4fc6d16f5196..3296b8f7bedf 100644
--- a/Documentation/translations/zh_CN/process/submitting-patches.rst
+++ b/Documentation/translations/zh_CN/process/submitting-patches.rst
@@ -127,8 +127,8 @@
 URL来查找补丁描述并将其放入补丁中。也就是说，补丁（系列）及其描述应该是独立的。
 这对维护人员和审查人员都有好处。一些评审者可能甚至没有收到补丁的早期版本。
 
-描述你在命令语气中的变化，例如“make xyzzy do frotz”而不是“[这个补丁]make
-xyzzy do frotz”或“[我]changed xyzzy to do frotz”，就好像你在命令代码库改变
+描述你在命令语气中的变化，例如“make xyzzy do frotz”而不是“[This patch]make
+xyzzy do frotz”或“[I]changed xyzzy to do frotz”，就好像你在命令代码库改变
 它的行为一样。
 
 如果修补程序修复了一个记录的bug条目，请按编号和URL引用该bug条目。如果补丁来
-- 
2.27.0

