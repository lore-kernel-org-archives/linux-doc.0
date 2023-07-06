Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21DE2EB64DA
	for <linux-doc@archiver.kernel.org>; Thu,  6 Jul 2023 03:32:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232538AbjGFDcr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 5 Jul 2023 23:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232483AbjGFDcq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Jul 2023 23:32:46 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8B831BCA
        for <linux-doc@vger.kernel.org>; Wed,  5 Jul 2023 20:32:45 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3a337ddff16so331853b6e.0
        for <linux-doc@vger.kernel.org>; Wed, 05 Jul 2023 20:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688614365; x=1691206365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XxTwOa0EQc8HVnTEnAPW/0MSWwIJGSBSzfzkOm95n/4=;
        b=pTo/jZz2asIn2mN4BMuhUQhZx+/Nzya/YDfH9W10BGp968x0CAKUF2McN3MzJQaaK2
         WQSgkciJvDPeQgSBn6eBr4j2c7s6HbHNk3Jt/5jpL1fP3Z9JkpvAhQkL/o+71nJBXyTm
         8p68DcuMsOQECRnEWQtBsn+WvtS8vAl4QnHdsTGCXhNx5gxSquRv3ir46aXdi+wvEG61
         YKZhUN/zhJc6+mRDN5ywdGVwxQ/y2+Kmj6hyt4BJ/Qid4NNR+IbgFL8KrOfXo8T8opAk
         dlS5UkMeN4qkegIs7q2ENd/BFmKYBjBE8jQRKjAa8wmF4LHmzz2fA2Q9II37Itb3bOJu
         DPAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688614365; x=1691206365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XxTwOa0EQc8HVnTEnAPW/0MSWwIJGSBSzfzkOm95n/4=;
        b=jyu0UElWghGcqBTHiho1V28tQ90hmE0QBKOKe1RF8ekpBASFRXFa3yH/EoiH74YKFq
         q3owrmOPPAE9kw5vvvOUMqZlB+JcsPN1A/6zQv5VjryCXK/F7Nmr9WA7QVkUnfm6kccQ
         4uRc9XztCRHsPajB+CYFoCEERV8Y4gMiN7xd95ICoBlWHx4ikbOOTS8Wc15ogOfMxzsW
         L7Ze5TMpEfjDX/4sV7Mn2KZjbzWsY9c2yyonztZa0P6HfGcAAjEMnHwJ+80hJsQrM3r7
         bvltCqN7BMjSIHquBpk/qn0BgxcAWmQIKMJ43wHfy1sgEoOPMUTT0EkkpO/oO+3Ho9Cb
         57BA==
X-Gm-Message-State: ABy/qLbPzkZCqZXPWpU8AHadsoqgLGoF0jMGELrXgdXvUA38SPsynrLW
        eilsIy2n+ULKPNUTCEqjmrJ0dQ==
X-Google-Smtp-Source: APBJJlHP9M1ZsGfe2ZMFJKx1Re86VXljfxshm/0iSUnfVW+jY4f6zbrqlQcsob+xxdVkFNGI9KOTpA==
X-Received: by 2002:a54:488e:0:b0:39e:d59a:8275 with SMTP id r14-20020a54488e000000b0039ed59a8275mr502807oic.25.1688614365284;
        Wed, 05 Jul 2023 20:32:45 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id fk13-20020a056a003a8d00b006589cf6d88bsm239785pfb.145.2023.07.05.20.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 20:32:44 -0700 (PDT)
From:   Charlie Jenkins <charlie@rivosinc.com>
Date:   Wed, 05 Jul 2023 20:30:19 -0700
Subject: [PATCH 3/3] RISC-V: Include documentation for hwprobe vendor
 extensions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230705-thead_vendor_extensions-v1-3-ad6915349c4d@rivosinc.com>
References: <20230705-thead_vendor_extensions-v1-0-ad6915349c4d@rivosinc.com>
In-Reply-To: <20230705-thead_vendor_extensions-v1-0-ad6915349c4d@rivosinc.com>
To:     linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Jonathan Corbet <corbet@lwn.net>, charlie@rivosinc.com,
        evan@rivosinc.com, heiko@sntech.de, linux-doc@vger.kernel.org
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Document available vendor extensions.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/riscv/hwprobe.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index 19165ebd82ba..167fd3e25632 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -97,3 +97,20 @@ The following keys are defined:
 
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned accesses are
     not supported at all and will generate a misaligned address fault.
+
+RISC-V Hardware Probing Interface Vendor Extensions
+---------------------------------------------------
+
+All vendor extensions live at and beyond
+:c:macro:`RISCV_HWPROBE_VENDOR_EXTENSION_SPACE`. Each vendor can specify vendor
+extensions at any value above or equal to
+:c:macro:`RISCV_HWPROBE_VENDOR_EXTENSION_SPACE` without worrying about
+conflicting with values from other vendors. Only extensions from the vendor of
+the cpus passed into riscv_hwprobe will be matched.
+
+T-HEAD
+~~~~~~
+
+* :c:macro:`THEAD_ISA_EXT0`: Contains all of the EXT0 extensions
+
+  * :c:macro:`THEAD_ISA_EXT0_V0_7_1`: Vector extension V0.7.1 is supported

-- 
2.41.0

