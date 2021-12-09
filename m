Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74BC9C433EF
	for <linux-doc@archiver.kernel.org>; Thu,  9 Dec 2021 09:09:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232371AbhLIJMp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Dec 2021 04:12:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232214AbhLIJMo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Dec 2021 04:12:44 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1983C0617A1
        for <linux-doc@vger.kernel.org>; Thu,  9 Dec 2021 01:09:11 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id p18-20020a17090ad31200b001a78bb52876so6390291pju.3
        for <linux-doc@vger.kernel.org>; Thu, 09 Dec 2021 01:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LARLyfqBjEq7ffC/K2vACX3o1DVlTbRye2PHHFfvuzQ=;
        b=kMfUThgjLuw/3wsnFlqIDEDSnyOCxdmRHzqDwRcxD13Uvhl05BhpOU5lun3iZwRrEe
         qngogbpLMvTojIFf0RbAPW9qcga2gAAcPzvLhLifytkbBkyP3R8f37adv4ibgv6hVVXe
         hs5XbC+0f0M4i9niosNpaqkk5iqN21ZPEkPRFeWp4r5jlHBg+o1sBX1PdqzI4G0t89k4
         BRxO+IdiPAWujRjKYmIQ+RUWQZU7Ke4mVmn58qwZ3ZU4ggcoCnsqfCkaTV7hV4wdE1CG
         2TG3bmW7QisLRMhNwBO/uSqWxm1hNndPtiQj3fB9ZaMqHFCljE+UrbQ+mEBt/aASYuB+
         v3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LARLyfqBjEq7ffC/K2vACX3o1DVlTbRye2PHHFfvuzQ=;
        b=iUfvGGoWSACDj1rcagxwXMgPJ4+y1yuA3hsJWcmCiNQjY52vKwZbAJ7d0a3gZwUGEe
         FsRXdMqT0wl39gVUPRHOyxy5mDgkObBh/uKXCR1S/pXGKMTpjZF3yZ9idMR1NwB07+OU
         JeftKVYdMuaOXB4FgIKaoRPPYdTUlzR+izlSwdc7ucCwow2pHc2cr9uZ4H6k+ziKg/Va
         lfaAEFI3xsKCrcXuG0icvFPfNse8MGYC23iWtL+tYxqFOK2O2K6B2Hx29DMCHST+Tvh4
         6LXD9iU+VEylA4mI89LlOsDCxBae3JITELOtRbvkuXqBNbLHOgTKFZQq1FvX+HuW/5sT
         Lj4g==
X-Gm-Message-State: AOAM532ZSOCUXgSq5jmMDpzjdi6QhF1TlfMp1NdwmdSZu8OrK6hCVA0s
        wKezopUVcWhgKWZK0XspTD8=
X-Google-Smtp-Source: ABdhPJztPpPn5+LXMxgNz4HiP33bwq05YuzTHeJouF7fzmuUuSyxPIdtongzlrslUGd3ecgQJO/z/A==
X-Received: by 2002:a17:902:7003:b0:143:c009:89f9 with SMTP id y3-20020a170902700300b00143c00989f9mr67726011plk.11.1639040951293;
        Thu, 09 Dec 2021 01:09:11 -0800 (PST)
Received: from localhost.localdomain ([8.31.2.21])
        by smtp.gmail.com with ESMTPSA id u12sm6627926pfk.71.2021.12.09.01.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 01:09:10 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     grantseltzer@gmail.com
Cc:     andrii@kernel.org, daniel@iogearbox.net, corbet@lwn.net,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH] docs/bpf: Add libbpf into index/bpf
Date:   Thu,  9 Dec 2021 17:07:44 +0800
Message-Id: <20211209090744.544938-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since f42cfb469f9b ("bpf: Add documentation for libbpf including API autogen") which
introduced a warning:

linux/Documentation/bpf/libbpf/index.rst

Add it into index/bpf.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/bpf/index.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/bpf/index.rst b/Documentation/bpf/index.rst
index 610450f59e05..bdf66f57f910 100644
--- a/Documentation/bpf/index.rst
+++ b/Documentation/bpf/index.rst
@@ -17,6 +17,11 @@ libbpf
 
 Documentation/bpf/libbpf/index.rst is a userspace library for loading and interacting with bpf programs.
 
+.. toctree::
+   :maxdepth: 1
+
+   libbpf/index
+
 BPF Type Format (BTF)
 =====================
 
-- 
2.27.0

