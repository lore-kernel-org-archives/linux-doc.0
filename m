Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C07CF7D2EF
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 Jan 2019 09:22:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbfA2JWC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 Jan 2019 04:22:02 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:47021 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbfA2JWC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Jan 2019 04:22:02 -0500
Received: by mail-wr1-f65.google.com with SMTP id l9so21096520wrt.13
        for <linux-doc@vger.kernel.org>; Tue, 29 Jan 2019 01:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AT1pMHI7CS7L1GDQ1CdeCVHhSeyLceYxSMxlS/ZwinY=;
        b=d4+OnPTOogcl0JqiSYwkTiQW+Q40cvQ2srmn39Gx0B+TBOTs5Z777ZKTrx0HDVVAfF
         gScRakUelxGfuFWq7TPypx2i07wN/6UoJNd7QMWW2pvrJ8biFwKLVLxLvbC4w2cutex1
         tLX1o2t26k2/k2zdRWVmxyogNrjpvdlguJhCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AT1pMHI7CS7L1GDQ1CdeCVHhSeyLceYxSMxlS/ZwinY=;
        b=d5CJD5hG0P8+4StuScNMRj7OL/mfx6Jvhbh8UHGUfJM8CLXnYicP0aTvFz8DEKR/e1
         FEYj2n/oIiMa3iskKTi9+edp6yVG+1Sm9J9ak0goem+BF4wWv/Z7LFdxUaznJCFq5Hd2
         MJu7fcEIfamAHwRmtLjbrkmYZWKralwz+EqNYHcrhxEOFMLR31k9Iwy88/fBbCrORBgZ
         TQaYB5rOm2op0E6YqN5vGzNsTKX0xMlDKaS6foMdJ07x+9sdLtgoZ17Tzv/+PWmkzVBh
         ueTT3IaoHSr5lq6MT66WLyxSSc/9Xcm4IaQiMbdY0fmWozyQLvbUMGht6D6GzLi9UDaf
         fi0w==
X-Gm-Message-State: AJcUukeWHSgbvRRKly6VJGKzJJFlvGhrKwR5g4ypf22jQtMqUi6kLr7T
        XcCI0+j95ETc6vB1RI2+koaX/A==
X-Google-Smtp-Source: ALg8bN7tKJi45OsTipSflBUM61b41FfWGEJNiJiOczJQE5lTOkFLF+dG0YHdxUhACK+FJ2udExhPfQ==
X-Received: by 2002:adf:8c09:: with SMTP id z9mr21352570wra.301.1548753720184;
        Tue, 29 Jan 2019 01:22:00 -0800 (PST)
Received: from sudo.home ([2a01:cb1d:112:6f00:61d3:a2fc:db63:aa38])
        by smtp.gmail.com with ESMTPSA id x1sm28751755wru.34.2019.01.29.01.21.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Jan 2019 01:21:59 -0800 (PST)
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
To:     linux-efi@vger.kernel.org
Cc:     Ard Biesheuvel <ard.biesheuvel@linaro.org>, corbet@lwn.net,
        leif.lindholm@linaro.org, graeme.gregory@linaro.org,
        mingo@redhat.com, tglx@linutronix.de, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, agraf@suse.de,
        pjones@redhat.com
Subject: [PATCH v2 1/2] x86: make ARCH_USE_MEMREMAP_PROT a generic Kconfig symbol
Date:   Tue, 29 Jan 2019 10:21:49 +0100
Message-Id: <20190129092150.15184-2-ard.biesheuvel@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190129092150.15184-1-ard.biesheuvel@linaro.org>
References: <20190129092150.15184-1-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Turn ARCH_USE_MEMREMAP_PROT into a generic Kconfig symbol, and fix the
dependency expression to reflect that AMD_MEM_ENCRYPT depends on it,
instead of the other way around. This will permit ARCH_USE_MEMREMAP_PROT
to be selected by other architectures.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 arch/Kconfig     | 3 +++
 arch/x86/Kconfig | 5 +----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 4cfb6de48f79..9f0213213da8 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -885,6 +885,9 @@ config HAVE_ARCH_PREL32_RELOCATIONS
 	  architectures, and don't require runtime relocation on relocatable
 	  kernels.
 
+config ARCH_USE_MEMREMAP_PROT
+	bool
+
 source "kernel/gcov/Kconfig"
 
 source "scripts/gcc-plugins/Kconfig"
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 26387c7bf305..c0e9a77dc089 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1510,6 +1510,7 @@ config AMD_MEM_ENCRYPT
 	bool "AMD Secure Memory Encryption (SME) support"
 	depends on X86_64 && CPU_SUP_AMD
 	select DYNAMIC_PHYSICAL_MASK
+	select ARCH_USE_MEMREMAP_PROT
 	---help---
 	  Say yes to enable support for the encryption of system memory.
 	  This requires an AMD processor that supports Secure Memory
@@ -1529,10 +1530,6 @@ config AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT
 	  If set to N, then the encryption of system memory can be
 	  activated with the mem_encrypt=on command line option.
 
-config ARCH_USE_MEMREMAP_PROT
-	def_bool y
-	depends on AMD_MEM_ENCRYPT
-
 # Common NUMA Features
 config NUMA
 	bool "Numa Memory Allocation and Scheduler Support"
-- 
2.20.1

