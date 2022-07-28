Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C60C04A68
	for <linux-doc@archiver.kernel.org>; Thu, 28 Jul 2022 21:07:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbiG1VHp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 28 Jul 2022 17:07:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232353AbiG1VHm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Jul 2022 17:07:42 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A96917820D
        for <linux-doc@vger.kernel.org>; Thu, 28 Jul 2022 14:07:40 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id g12so2966063pfb.3
        for <linux-doc@vger.kernel.org>; Thu, 28 Jul 2022 14:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc;
        bh=20zO2FT2JEdVmGgde/EIUF8PTTirUHSwEDYNPZ44Pgg=;
        b=p5F2+1uekipyQTSPfAX9HTNnh+s8rs4JzMcbfmP2rciMhLOLs/BJ1lT1wlNCW75IaJ
         TeGKO8/VEM62witITuWamrO7mM80bTZFgorffYUiNIT63txY3XDLKmKOGb4ODk8UxcIB
         SAoyzVUd3k8qRJNDBkq+fqiZkEtHAYtOyeRY0uGQAQZLyiu1nv4K1m89/k9M2o/jo2xQ
         UZcoLSRsTl082ii08jfcUVbn8LlcgSLA12uEkLPClKzvZP9R+grPWetSS3FndjOUut3s
         Cbz+RZAsKPZJuTL2dB1V3AOsaKBUOyVqUSlcJXeYHikSzjXltwt9b9gwoiczKJ/zjfwC
         RkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc;
        bh=20zO2FT2JEdVmGgde/EIUF8PTTirUHSwEDYNPZ44Pgg=;
        b=ezMnPlhYOwVzQhS7/wJa35/GZvXcYqVO+B1Sw+ZL7ushPMQjOoQW2tJzOYGUkUU8VQ
         SkFeip/WTxxEFigsrU1fuYc+itwRF3592zzV2L0sDFEznvKoy5E6OycSZhCnm6gUC6Qq
         37FrzT16I0Ph9xwy4Hd86vH9/tGQwEfzbukY7+zAZAbuXfKNJYtA5j8iej099Y9xdfZp
         jN8BnVZ0mGrANg26mJcbTqTzFW4eE0jOYEKciwm0stTg6qah96x8lTfVBx31GWUBEK1w
         698UtzFORiXSHFbgzOUubNddTvOZmvylVHyQ9ZihwWEHHFnbzCh4zNt8v+wkSwqLfd7U
         135A==
X-Gm-Message-State: AJIora/WH2HAzqQhUPD+J8H+qKOboJAXN9Kp4yd+jk43fbruXTQf9Lny
        Pnm5uTCxJTvu16q5TZFCX1tw3Q==
X-Google-Smtp-Source: AGRyM1v2M7Q1YpIsy9H18azfAtgYtbvNwBK7Xc1E6c9U2gGjQ5VCipBScMYENZ2vwWNXuW8n8/ceiA==
X-Received: by 2002:a65:5a05:0:b0:41a:ea25:a631 with SMTP id y5-20020a655a05000000b0041aea25a631mr495385pgs.46.1659042460013;
        Thu, 28 Jul 2022 14:07:40 -0700 (PDT)
Received: from localhost ([50.221.140.186])
        by smtp.gmail.com with ESMTPSA id n3-20020a1709026a8300b0016b81679c31sm1704066plk.213.2022.07.28.14.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 14:07:38 -0700 (PDT)
Subject: [PATCH] doc: RISC-V: Document that misaligned accesses are supported
Date:   Thu, 28 Jul 2022 14:07:15 -0700
Message-Id: <20220728210715.17214-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
        bagasdotme@gmail.com, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>
From:   Palmer Dabbelt <palmer@rivosinc.com>
To:     corbet@lwn.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Palmer Dabbelt <palmer@rivosinc.com>

The RISC-V ISA manual used to mandate that misaligned accesses were
supported in user mode, but that requirement was removed in 2018 via
riscv-isa-manual commit 61cadb9 ("Provide new description of misaligned
load/store behavior compatible with privileged architecture.").  Since
the Linux uABI was already frozen at that point it's just been demoted
to part of the uABI, but that was never written down.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

---

We currently rely on either hardware or M-mode to support misaligned
accesses.  It's probably worth supporting the PR_SET_UNALIGN so
userspace can opt out of the emulation routines, but we can't break the
uABI so we're stuck with defaulting to them on for now.  Doing so would
also require some way of informing M-mode that unsupported accesses
shouldn't be emulated.
---
 Documentation/riscv/index.rst | 1 +
 Documentation/riscv/uabi.rst  | 6 ++++++
 2 files changed, 7 insertions(+)
 create mode 100644 Documentation/riscv/uabi.rst

diff --git a/Documentation/riscv/index.rst b/Documentation/riscv/index.rst
index e23b876ad6eb..2e5b18fbb145 100644
--- a/Documentation/riscv/index.rst
+++ b/Documentation/riscv/index.rst
@@ -8,6 +8,7 @@ RISC-V architecture
     boot-image-header
     vm-layout
     patch-acceptance
+    uabi
 
     features
 
diff --git a/Documentation/riscv/uabi.rst b/Documentation/riscv/uabi.rst
new file mode 100644
index 000000000000..21a82cfb6c4d
--- /dev/null
+++ b/Documentation/riscv/uabi.rst
@@ -0,0 +1,6 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+RISC-V Linux User ABI
+=====================
+
+Misaligned accesses are supported in userspace, but they may perform poorly.
-- 
2.34.1

