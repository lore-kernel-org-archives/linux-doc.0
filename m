Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0447388E6F
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 14:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787151520; cv=none; b=PARoZLZDCRzYy1e9HxtEtUkCR2BpX6E0n1rorsJ00PaR+c7UDGzPadLWcVhXhBRz9mZ7l92EegMC/6/4HBTylGERYe9Ipkrt+niWxSt8wnah35XKZiN5Ze8BbONMnEtuDy9iaTwL3x6lo1wQEbEPnQk02z+MA3PisWlnjlS5c2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787151520; c=relaxed/simple;
	bh=5AF088bgC29qR8rpPtZ2l13+2rTAOZ5Sjci7WmCUqbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CHhB+tpMa1PxHB8NAOVyC6zY32AzsRIChdt191Nr1HfHl7Hf7F1e9UKHKWl7E2hQn+ZVd/AjgZmM4QACo0KT7UvCmDrlbLzcZM+P7fXUmRlEH41xzqZ2mllUe2DgG/npJ3OZx+9mILf5cxHb8wy1SLCbBaUYapROAvil8GyXTtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kbEhvscO; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kbEhvscO"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d30c22b1eeso1107425ad.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 07:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787151508; x=1787756308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x1CBeKwQBEhhDroPaeZi/RaysGBzpAkdO20qQiJvruQ=;
        b=kbEhvscOjbVevnE/a3NcZ4nd0jrioqEoiZvGynMMc7Jy5huJg7NgPIHBMjShYi0cI/
         EZIzzCWxBJ2MyYV4/hM28yQCcRk6qo40RWMLw1Z61cPBlpkOKpXahvtgnHiPGcE/nF9S
         Rus8Xt9b3Bze9qfa9cohKAzbyMH5eo4a9/olB8Z/ZOD/kNanzKiWLwDK4vGsGczBoCyT
         R4RCKRe4Bytg5LVGq7OuOsHSuhO1LCFH8amOmWnxhNEdkonJlnC+rHq8iA197cnfFMMX
         sSsGtv1/SVXdfx+XeIqQKnWw/c3BTK4SRe4aG7Y1P7HJs4qWurY4g3jZVgmiToZck12q
         2GrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787151508; x=1787756308;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x1CBeKwQBEhhDroPaeZi/RaysGBzpAkdO20qQiJvruQ=;
        b=cE1lh44x7/KJATvr0XrTd0+o167OxYaVcgdMHdelQf05/65hh2ZUbdlki3H6S3rrNd
         vnlGj51yMd/GECgakQka5no9fZYFt1gB/22crUYq4S1JZKNGiTVZ9nEDlf9Y+wnZ5Pn4
         bkz28466E1BJ8nT8Ff5kcysH07WMw7Elr2R6/MBALfNtq5Yktmjvg7OwioMwM8zibGdX
         13eIn5fWtZWD6fjufpL+nXEtlY5DoD6DF71vuJf2+2KjfDTUO1odB8WHPhyjQ7g8a3/U
         jS8Yha3pY33R3tuMxWonGnsZn+0uZ0uLary50L6afJlgQ7+/EsclJ/zXKGFt9EgYfZ/x
         UdfA==
X-Forwarded-Encrypted: i=1; AHgh+RpII79k+5Vt+O+QuZqtjosPO1yHW/rEZyyy3hBmujYmEJMrLOTHd9nSGGHhkjV+h74aQN/csOKrXno=@vger.kernel.org
X-Gm-Message-State: AFuF++na5G86IFgrNq5v3rfrvB7ILEP/TGJYeNpyn4PoRNZOIjfLU1dq
	1ZW1Lhcl1SEMG+0+Rs4A2v0UPeC0UHTZh5F3Eo0vf49aHuQs1i+2wfVI5EeVEw==
X-Gm-Gg: AR+sD12b7VADJn5BY0RfHf184fpL6saJSjtykm3QnS5nky2FHOr+ICp7Jw77Zf+HZ4C
	7u8myqnqo2fveZi/zgpuxrn5EChAC9bZqwbsn4ffMIFBUJM5atlOGNJo/kK3LlV2Jvvbl4KvHBU
	8HDM6lqSEkLXGthK0vgeCmiaAMVJMqEnMGLNkForuNihZLmEmDnAGrVXprAMdbte9TT4KfNl7ST
	ktpYzIVPtEBPky1f/AuOW4rO9SxWskKKSHgqIyG7v/nUezONwB8PYgSpcTJurFFI65Fj8I9PDEI
	MhRaJETnbgjJ3Mi9Nl3/aZfRIdkxahMcwWa3BaD1zFv8RMjHlVpHr0ebW8I2lVrjRgskfC7tHX8
	zvk6B1BBhd4QIGpM8ydkHIzb6cVpl8/duGdovrDR2s4N6ol8r1XzHtVNfT9XudryeT7smcYCx0o
	zJWWa5XHOG93o8n/OTbYC1fKkkZH8mI5EnN+1N1EcsZf4H4czFi8SYUBfOeb0ip5nfnqhIbKUX2
	s2vrSJ2Zra6WnRQCxT2exihQ6Fl0B2TnNZzYVzq+NL2N+pjzQ==
X-Received: by 2002:a17:903:8cc:b0:2c9:e846:a582 with SMTP id d9443c01a7336-2d5fd33191fmr54372455ad.0.1787151507978;
        Wed, 19 Aug 2026 07:58:27 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e528b3sm25429145ad.46.2026.08.19.07.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:58:27 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>
Cc: Dongliang Mu <dzm91@hust.edu.cn>,
	Weijie Yuan <wy@wyuan.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <srcres258@furdevs.cn>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 3/7] docs/zh_TW: arch: remove maintainer contact information
Date: Wed, 19 Aug 2026 22:58:02 +0800
Message-ID: <20260819145808.291567-4-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819145808.291567-1-chenyou910331@gmail.com>
References: <20260819145808.291567-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The zh_TW translations duplicate, in every file, contact information
that MAINTAINERS already records.  Those addresses have been churned
repeatedly: the listed zh_TW maintainer address alone appears in 58
files and there have now been three attempts to update it across the
tree.  Jon Corbet's conclusion in the MAINTAINERS discussion was that,
rather than rewriting all of them again, the best thing is simply to
remove them.

Most of the names in the credit blocks belong to the zh_CN translators:
the zh_TW tree was produced by converting zh_CN, so the credits came
across with the text.  Of the addresses removed here, nearly all also
appear in Documentation/translations/zh_CN/, several in more than a
hundred files.  They credit the simplified-Chinese translation, not
zh_TW work.

Remove the :Translator:/:翻譯:/:校譯:/:譯者: credit blocks and the
"please contact the ... maintainer" prose that introduces them, and
drop the maintainer metadata lines (M:, zh_CN:, zh_TW:, Maintainer:,
Chinese maintainer:, Traditional Chinese maintainer:) from the legacy
headers.  The translated bodies of the legacy files, including their
own credit lines, are left untouched.

Attribution for past work is preserved in the git history.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 Documentation/translations/zh_TW/arch/arm/Booting     |  7 -------
 .../zh_TW/arch/arm/kernel_user_helpers.txt            | 10 ----------
 Documentation/translations/zh_TW/arch/arm64/amu.rst   |  3 ---
 .../translations/zh_TW/arch/arm64/booting.txt         |  8 --------
 .../translations/zh_TW/arch/arm64/elf_hwcaps.rst      |  3 ---
 .../translations/zh_TW/arch/arm64/hugetlbpage.rst     |  3 ---
 Documentation/translations/zh_TW/arch/arm64/index.rst |  2 --
 .../zh_TW/arch/arm64/legacy_instructions.txt          | 11 -----------
 .../translations/zh_TW/arch/arm64/memory.txt          |  9 ---------
 Documentation/translations/zh_TW/arch/arm64/perf.rst  |  3 ---
 .../translations/zh_TW/arch/arm64/silicon-errata.txt  |  8 --------
 .../translations/zh_TW/arch/arm64/tagged-pointers.txt |  9 ---------
 .../translations/zh_TW/arch/loongarch/booting.rst     |  4 ----
 .../translations/zh_TW/arch/loongarch/features.rst    |  1 -
 .../translations/zh_TW/arch/loongarch/index.rst       |  1 -
 .../zh_TW/arch/loongarch/introduction.rst             |  1 -
 .../zh_TW/arch/loongarch/irq-chip-model.rst           |  1 -
 .../translations/zh_TW/arch/mips/booting.rst          |  4 ----
 .../translations/zh_TW/arch/mips/features.rst         |  4 ----
 Documentation/translations/zh_TW/arch/mips/index.rst  |  4 ----
 .../translations/zh_TW/arch/mips/ingenic-tcu.rst      |  4 ----
 .../translations/zh_TW/arch/openrisc/index.rst        |  4 ----
 .../zh_TW/arch/openrisc/openrisc_port.rst             |  4 ----
 .../translations/zh_TW/arch/openrisc/todo.rst         |  4 ----
 .../translations/zh_TW/arch/parisc/debugging.rst      |  4 ----
 .../translations/zh_TW/arch/parisc/index.rst          |  4 ----
 .../translations/zh_TW/arch/parisc/registers.rst      |  4 ----
 27 files changed, 124 deletions(-)

diff --git a/Documentation/translations/zh_TW/arch/arm/Booting b/Documentation/translations/zh_TW/arch/arm/Booting
index a5375f262de2..4d60be5401c1 100644
--- a/Documentation/translations/zh_TW/arch/arm/Booting
+++ b/Documentation/translations/zh_TW/arch/arm/Booting
@@ -6,8 +6,6 @@ communicating in English you can also ask the Chinese maintainer for
 help.  Contact the Chinese maintainer if this translation is outdated
 or if there is a problem with the translation.
 
-Maintainer: Russell King <linux@arm.linux.org.uk>
-Chinese maintainer: Fu Wei <tekkamanninja@gmail.com>
 ---------------------------------------------------------------------
 Documentation/arch/arm/booting.rst 的中文翻譯
 
@@ -15,11 +13,6 @@ Documentation/arch/arm/booting.rst 的中文翻譯
 交流有困難的話，也可以向中文版維護者求助。如果本翻譯更新不及時或者翻
 譯存在問題，請聯繫中文版維護者。
 
-英文版維護者： Russell King <linux@arm.linux.org.uk>
-中文版維護者： 傅煒  Fu Wei <tekkamanninja@gmail.com>
-中文版翻譯者： 傅煒  Fu Wei <tekkamanninja@gmail.com>
-中文版校譯者： 傅煒  Fu Wei <tekkamanninja@gmail.com>
-
 以下爲正文
 ---------------------------------------------------------------------
 
diff --git a/Documentation/translations/zh_TW/arch/arm/kernel_user_helpers.txt b/Documentation/translations/zh_TW/arch/arm/kernel_user_helpers.txt
index 4c0bff97af31..fd7fcc361d23 100644
--- a/Documentation/translations/zh_TW/arch/arm/kernel_user_helpers.txt
+++ b/Documentation/translations/zh_TW/arch/arm/kernel_user_helpers.txt
@@ -6,22 +6,12 @@ communicating in English you can also ask the Chinese maintainer for
 help.  Contact the Chinese maintainer if this translation is outdated
 or if there is a problem with the translation.
 
-Maintainer: Nicolas Pitre <nicolas.pitre@linaro.org>
-		Dave Martin <dave.martin@linaro.org>
-Chinese maintainer: Fu Wei <tekkamanninja@gmail.com>
 ---------------------------------------------------------------------
 Documentation/arch/arm/kernel_user_helpers.rst 的中文翻譯
 
 如果想評論或更新本文的內容，請直接聯繫原文檔的維護者。如果你使用英文
 交流有困難的話，也可以向中文版維護者求助。如果本翻譯更新不及時或者翻
 譯存在問題，請聯繫中文版維護者。
-英文版維護者： Nicolas Pitre <nicolas.pitre@linaro.org>
-		Dave Martin <dave.martin@linaro.org>
-中文版維護者： 傅煒 Fu Wei <tekkamanninja@gmail.com>
-中文版翻譯者： 傅煒 Fu Wei <tekkamanninja@gmail.com>
-中文版校譯者： 宋冬生 Dongsheng Song <dongshneg.song@gmail.com>
-		傅煒 Fu Wei <tekkamanninja@gmail.com>
-
 
 以下爲正文
 ---------------------------------------------------------------------
diff --git a/Documentation/translations/zh_TW/arch/arm64/amu.rst b/Documentation/translations/zh_TW/arch/arm64/amu.rst
index 3726c1671ab6..edea336b323d 100644
--- a/Documentation/translations/zh_TW/arch/arm64/amu.rst
+++ b/Documentation/translations/zh_TW/arch/arm64/amu.rst
@@ -4,9 +4,6 @@
 
 :Original: :ref:`Documentation/arch/arm64/amu.rst <amu_index>`
 
-Translator: Bailu Lin <bailu.lin@vivo.com>
-            Hu Haowen <2023002089@link.tyut.edu.cn>
-
 ==================================
 AArch64 Linux 中擴展的活動監控單元
 ==================================
diff --git a/Documentation/translations/zh_TW/arch/arm64/booting.txt b/Documentation/translations/zh_TW/arch/arm64/booting.txt
index f1ac96370ace..2972d10562db 100644
--- a/Documentation/translations/zh_TW/arch/arm64/booting.txt
+++ b/Documentation/translations/zh_TW/arch/arm64/booting.txt
@@ -8,9 +8,6 @@ communicating in English you can also ask the Chinese maintainer for
 help.  Contact the Chinese maintainer if this translation is outdated
 or if there is a problem with the translation.
 
-M:	Will Deacon <will.deacon@arm.com>
-zh_CN:	Fu Wei <wefu@redhat.com>
-zh_TW:	Hu Haowen <2023002089@link.tyut.edu.cn>
 C:	55f058e7574c3615dea4615573a19bdb258696c6
 ---------------------------------------------------------------------
 Documentation/arch/arm64/booting.rst 的中文翻譯
@@ -19,11 +16,6 @@ Documentation/arch/arm64/booting.rst 的中文翻譯
 交流有困難的話，也可以向中文版維護者求助。如果本翻譯更新不及時或者翻
 譯存在問題，請聯繫中文版維護者。
 
-英文版維護者： Will Deacon <will.deacon@arm.com>
-中文版維護者： 傅煒  Fu Wei <wefu@redhat.com>
-中文版翻譯者： 傅煒  Fu Wei <wefu@redhat.com>
-中文版校譯者： 傅煒  Fu Wei <wefu@redhat.com>
-繁體中文版校譯者： 胡皓文  Hu Haowen <2023002089@link.tyut.edu.cn>
 本文翻譯提交時的 Git 檢出點爲： 55f058e7574c3615dea4615573a19bdb258696c6
 
 以下爲正文
diff --git a/Documentation/translations/zh_TW/arch/arm64/elf_hwcaps.rst b/Documentation/translations/zh_TW/arch/arm64/elf_hwcaps.rst
index cada25303e8d..66b7c6f8ef39 100644
--- a/Documentation/translations/zh_TW/arch/arm64/elf_hwcaps.rst
+++ b/Documentation/translations/zh_TW/arch/arm64/elf_hwcaps.rst
@@ -4,9 +4,6 @@
 
 :Original: :ref:`Documentation/arch/arm64/elf_hwcaps.rst <elf_hwcaps_index>`
 
-Translator: Bailu Lin <bailu.lin@vivo.com>
-            Hu Haowen <2023002089@link.tyut.edu.cn>
-
 ================
 ARM64 ELF hwcaps
 ================
diff --git a/Documentation/translations/zh_TW/arch/arm64/hugetlbpage.rst b/Documentation/translations/zh_TW/arch/arm64/hugetlbpage.rst
index b6849935e028..ad747f9e1916 100644
--- a/Documentation/translations/zh_TW/arch/arm64/hugetlbpage.rst
+++ b/Documentation/translations/zh_TW/arch/arm64/hugetlbpage.rst
@@ -4,9 +4,6 @@
 
 :Original: :ref:`Documentation/arch/arm64/hugetlbpage.rst <hugetlbpage_index>`
 
-Translator: Bailu Lin <bailu.lin@vivo.com>
-            Hu Haowen <2023002089@link.tyut.edu.cn>
-
 =====================
 ARM64中的 HugeTLBpage
 =====================
diff --git a/Documentation/translations/zh_TW/arch/arm64/index.rst b/Documentation/translations/zh_TW/arch/arm64/index.rst
index 86014346792e..279873b25a25 100644
--- a/Documentation/translations/zh_TW/arch/arm64/index.rst
+++ b/Documentation/translations/zh_TW/arch/arm64/index.rst
@@ -3,8 +3,6 @@
 .. include:: ../../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/arch/arm64/index.rst <arm64_index>`
-:Translator: Bailu Lin <bailu.lin@vivo.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
 
 .. _tw_arm64_index:
 
diff --git a/Documentation/translations/zh_TW/arch/arm64/legacy_instructions.txt b/Documentation/translations/zh_TW/arch/arm64/legacy_instructions.txt
index 5c664555a71a..722205848431 100644
--- a/Documentation/translations/zh_TW/arch/arm64/legacy_instructions.txt
+++ b/Documentation/translations/zh_TW/arch/arm64/legacy_instructions.txt
@@ -8,10 +8,6 @@ communicating in English you can also ask the Chinese maintainer for
 help.  Contact the Chinese maintainer if this translation is outdated
 or if there is a problem with the translation.
 
-Maintainer: Punit Agrawal <punit.agrawal@arm.com>
-            Suzuki K. Poulose <suzuki.poulose@arm.com>
-Chinese maintainer: Fu Wei <wefu@redhat.com>
-Traditional Chinese maintainer: Hu Haowen <2023002089@link.tyut.edu.cn>
 ---------------------------------------------------------------------
 Documentation/arch/arm64/legacy_instructions.rst 的中文翻譯
 
@@ -21,13 +17,6 @@ Documentation/arch/arm64/legacy_instructions.rst 的中文翻譯
 
 本文翻譯提交時的 Git 檢出點爲： bc465aa9d045feb0e13b4a8f32cc33c1943f62d6
 
-英文版維護者： Punit Agrawal <punit.agrawal@arm.com>
-            Suzuki K. Poulose <suzuki.poulose@arm.com>
-中文版維護者： 傅煒  Fu Wei <wefu@redhat.com>
-中文版翻譯者： 傅煒  Fu Wei <wefu@redhat.com>
-中文版校譯者： 傅煒  Fu Wei <wefu@redhat.com>
-繁體中文版校譯者：胡皓文  Hu Haowen <2023002089@link.tyut.edu.cn>
-
 以下爲正文
 ---------------------------------------------------------------------
 Linux 內核在 arm64 上的移植提供了一個基礎框架，以支持構架中正在被淘汰或已廢棄指令的模擬執行。
diff --git a/Documentation/translations/zh_TW/arch/arm64/memory.txt b/Documentation/translations/zh_TW/arch/arm64/memory.txt
index 6ee2239c293f..a606f856bcee 100644
--- a/Documentation/translations/zh_TW/arch/arm64/memory.txt
+++ b/Documentation/translations/zh_TW/arch/arm64/memory.txt
@@ -8,9 +8,6 @@ communicating in English you can also ask the Chinese maintainer for
 help.  Contact the Chinese maintainer if this translation is outdated
 or if there is a problem with the translation.
 
-Maintainer: Catalin Marinas <catalin.marinas@arm.com>
-Chinese maintainer: Fu Wei <wefu@redhat.com>
-Traditional Chinese maintainer: Hu Haowen <2023002089@link.tyut.edu.cn>
 ---------------------------------------------------------------------
 Documentation/arch/arm64/memory.rst 的中文翻譯
 
@@ -20,12 +17,6 @@ Documentation/arch/arm64/memory.rst 的中文翻譯
 
 本文翻譯提交時的 Git 檢出點爲： bc465aa9d045feb0e13b4a8f32cc33c1943f62d6
 
-英文版維護者： Catalin Marinas <catalin.marinas@arm.com>
-中文版維護者： 傅煒  Fu Wei <wefu@redhat.com>
-中文版翻譯者： 傅煒  Fu Wei <wefu@redhat.com>
-中文版校譯者： 傅煒  Fu Wei <wefu@redhat.com>
-繁體中文版校譯者： 胡皓文  Hu Haowen <2023002089@link.tyut.edu.cn>
-
 以下爲正文
 ---------------------------------------------------------------------
 		     Linux 在 AArch64 中的內存佈局
diff --git a/Documentation/translations/zh_TW/arch/arm64/perf.rst b/Documentation/translations/zh_TW/arch/arm64/perf.rst
index ce083ba63872..a91d43e69b49 100644
--- a/Documentation/translations/zh_TW/arch/arm64/perf.rst
+++ b/Documentation/translations/zh_TW/arch/arm64/perf.rst
@@ -4,9 +4,6 @@
 
 :Original: :ref:`Documentation/arch/arm64/perf.rst <perf_index>`
 
-Translator: Bailu Lin <bailu.lin@vivo.com>
-            Hu Haowen <2023002089@link.tyut.edu.cn>
-
 =============
 Perf 事件屬性
 =============
diff --git a/Documentation/translations/zh_TW/arch/arm64/silicon-errata.txt b/Documentation/translations/zh_TW/arch/arm64/silicon-errata.txt
index 16d73b6c309f..4b1c9cb8e019 100644
--- a/Documentation/translations/zh_TW/arch/arm64/silicon-errata.txt
+++ b/Documentation/translations/zh_TW/arch/arm64/silicon-errata.txt
@@ -8,9 +8,6 @@ communicating in English you can also ask the Chinese maintainer for
 help.  Contact the Chinese maintainer if this translation is outdated
 or if there is a problem with the translation.
 
-M:	Will Deacon <will.deacon@arm.com>
-zh_CN:	Fu Wei <wefu@redhat.com>
-zh_TW:	Hu Haowen <2023002089@link.tyut.edu.cn>
 C:	1926e54f115725a9248d0c4c65c22acaf94de4c4
 ---------------------------------------------------------------------
 Documentation/arch/arm64/silicon-errata.rst 的中文翻譯
@@ -19,11 +16,6 @@ Documentation/arch/arm64/silicon-errata.rst 的中文翻譯
 交流有困難的話，也可以向中文版維護者求助。如果本翻譯更新不及時或者翻
 譯存在問題，請聯繫中文版維護者。
 
-英文版維護者： Will Deacon <will.deacon@arm.com>
-中文版維護者： 傅煒  Fu Wei <wefu@redhat.com>
-中文版翻譯者： 傅煒  Fu Wei <wefu@redhat.com>
-中文版校譯者： 傅煒  Fu Wei <wefu@redhat.com>
-繁體中文版校譯者： 胡皓文  Hu Haowen <2023002089@link.tyut.edu.cn>
 本文翻譯提交時的 Git 檢出點爲： 1926e54f115725a9248d0c4c65c22acaf94de4c4
 
 以下爲正文
diff --git a/Documentation/translations/zh_TW/arch/arm64/tagged-pointers.txt b/Documentation/translations/zh_TW/arch/arm64/tagged-pointers.txt
index e86ffa893ef6..3779858b065f 100644
--- a/Documentation/translations/zh_TW/arch/arm64/tagged-pointers.txt
+++ b/Documentation/translations/zh_TW/arch/arm64/tagged-pointers.txt
@@ -8,9 +8,6 @@ communicating in English you can also ask the Chinese maintainer for
 help.  Contact the Chinese maintainer if this translation is outdated
 or if there is a problem with the translation.
 
-Maintainer: Will Deacon <will.deacon@arm.com>
-Chinese maintainer: Fu Wei <wefu@redhat.com>
-Traditional Chinese maintainer: Hu Haowen <2023002089@link.tyut.edu.cn>
 ---------------------------------------------------------------------
 Documentation/arch/arm64/tagged-pointers.rst 的中文翻譯
 
@@ -18,12 +15,6 @@ Documentation/arch/arm64/tagged-pointers.rst 的中文翻譯
 交流有困難的話，也可以向中文版維護者求助。如果本翻譯更新不及時或者翻
 譯存在問題，請聯繫中文版維護者。
 
-英文版維護者： Will Deacon <will.deacon@arm.com>
-中文版維護者： 傅煒  Fu Wei <wefu@redhat.com>
-中文版翻譯者： 傅煒  Fu Wei <wefu@redhat.com>
-中文版校譯者： 傅煒  Fu Wei <wefu@redhat.com>
-繁體中文版校譯者： 胡皓文  Hu Haowen <2023002089@link.tyut.edu.cn>
-
 以下爲正文
 ---------------------------------------------------------------------
 		Linux 在 AArch64 中帶標記的虛擬地址
diff --git a/Documentation/translations/zh_TW/arch/loongarch/booting.rst b/Documentation/translations/zh_TW/arch/loongarch/booting.rst
index 88291090cea1..cc9610322742 100644
--- a/Documentation/translations/zh_TW/arch/loongarch/booting.rst
+++ b/Documentation/translations/zh_TW/arch/loongarch/booting.rst
@@ -4,10 +4,6 @@
 
 :Original: Documentation/arch/loongarch/booting.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
 ====================
 啓動 Linux/LoongArch
 ====================
diff --git a/Documentation/translations/zh_TW/arch/loongarch/features.rst b/Documentation/translations/zh_TW/arch/loongarch/features.rst
index c2175fd32b54..667f33030430 100644
--- a/Documentation/translations/zh_TW/arch/loongarch/features.rst
+++ b/Documentation/translations/zh_TW/arch/loongarch/features.rst
@@ -3,7 +3,6 @@
 .. include:: ../../disclaimer-zh_TW.rst
 
 :Original: Documentation/arch/loongarch/features.rst
-:Translator: Huacai Chen <chenhuacai@loongson.cn>
 
 .. kernel-feat:: features loongarch
 
diff --git a/Documentation/translations/zh_TW/arch/loongarch/index.rst b/Documentation/translations/zh_TW/arch/loongarch/index.rst
index 7281e050fe1c..7371f35326c1 100644
--- a/Documentation/translations/zh_TW/arch/loongarch/index.rst
+++ b/Documentation/translations/zh_TW/arch/loongarch/index.rst
@@ -3,7 +3,6 @@
 .. include:: ../../disclaimer-zh_TW.rst
 
 :Original: Documentation/arch/loongarch/index.rst
-:Translator: Huacai Chen <chenhuacai@loongson.cn>
 
 =================
 LoongArch體系結構
diff --git a/Documentation/translations/zh_TW/arch/loongarch/introduction.rst b/Documentation/translations/zh_TW/arch/loongarch/introduction.rst
index a5603f9b0a1b..1184bae117d7 100644
--- a/Documentation/translations/zh_TW/arch/loongarch/introduction.rst
+++ b/Documentation/translations/zh_TW/arch/loongarch/introduction.rst
@@ -3,7 +3,6 @@
 .. include:: ../../disclaimer-zh_TW.rst
 
 :Original: Documentation/arch/loongarch/introduction.rst
-:Translator: Huacai Chen <chenhuacai@loongson.cn>
 
 =============
 LoongArch介紹
diff --git a/Documentation/translations/zh_TW/arch/loongarch/irq-chip-model.rst b/Documentation/translations/zh_TW/arch/loongarch/irq-chip-model.rst
index dbe9595bbf16..89f4facc1a12 100644
--- a/Documentation/translations/zh_TW/arch/loongarch/irq-chip-model.rst
+++ b/Documentation/translations/zh_TW/arch/loongarch/irq-chip-model.rst
@@ -3,7 +3,6 @@
 .. include:: ../../disclaimer-zh_TW.rst
 
 :Original: Documentation/arch/loongarch/irq-chip-model.rst
-:Translator: Huacai Chen <chenhuacai@loongson.cn>
 
 ==================================
 LoongArch的IRQ芯片模型（層級關係）
diff --git a/Documentation/translations/zh_TW/arch/mips/booting.rst b/Documentation/translations/zh_TW/arch/mips/booting.rst
index 7e104abf5a51..43958df77efe 100644
--- a/Documentation/translations/zh_TW/arch/mips/booting.rst
+++ b/Documentation/translations/zh_TW/arch/mips/booting.rst
@@ -4,10 +4,6 @@
 
 :Original: Documentation/arch/mips/booting.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
 .. _tw_booting:
 
 BMIPS設備樹引導
diff --git a/Documentation/translations/zh_TW/arch/mips/features.rst b/Documentation/translations/zh_TW/arch/mips/features.rst
index 3d3906c4d08e..d5f2d3129614 100644
--- a/Documentation/translations/zh_TW/arch/mips/features.rst
+++ b/Documentation/translations/zh_TW/arch/mips/features.rst
@@ -4,10 +4,6 @@
 
 :Original: Documentation/arch/mips/features.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
 .. _tw_features:
 
 .. kernel-feat:: features mips
diff --git a/Documentation/translations/zh_TW/arch/mips/index.rst b/Documentation/translations/zh_TW/arch/mips/index.rst
index 4b7d28806489..832a5e9ee413 100644
--- a/Documentation/translations/zh_TW/arch/mips/index.rst
+++ b/Documentation/translations/zh_TW/arch/mips/index.rst
@@ -4,10 +4,6 @@
 
 :Original: Documentation/arch/mips/index.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
 ===========================
 MIPS特性文檔
 ===========================
diff --git a/Documentation/translations/zh_TW/arch/mips/ingenic-tcu.rst b/Documentation/translations/zh_TW/arch/mips/ingenic-tcu.rst
index 4385c0f3e9cd..fc74f474593d 100644
--- a/Documentation/translations/zh_TW/arch/mips/ingenic-tcu.rst
+++ b/Documentation/translations/zh_TW/arch/mips/ingenic-tcu.rst
@@ -4,10 +4,6 @@
 
 :Original: Documentation/arch/mips/ingenic-tcu.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
 .. _tw_ingenic-tcu:
 
 ===============================================
diff --git a/Documentation/translations/zh_TW/arch/openrisc/index.rst b/Documentation/translations/zh_TW/arch/openrisc/index.rst
index 7585960783fc..7d852d37cc4e 100644
--- a/Documentation/translations/zh_TW/arch/openrisc/index.rst
+++ b/Documentation/translations/zh_TW/arch/openrisc/index.rst
@@ -4,10 +4,6 @@
 
 :Original: Documentation/arch/openrisc/index.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
 .. _tw_openrisc_index:
 
 =================
diff --git a/Documentation/translations/zh_TW/arch/openrisc/openrisc_port.rst b/Documentation/translations/zh_TW/arch/openrisc/openrisc_port.rst
index a1e4517dc601..7d6dcf29eb7d 100644
--- a/Documentation/translations/zh_TW/arch/openrisc/openrisc_port.rst
+++ b/Documentation/translations/zh_TW/arch/openrisc/openrisc_port.rst
@@ -2,10 +2,6 @@
 
 :Original: Documentation/arch/openrisc/openrisc_port.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
 .. _tw_openrisc_port:
 
 ==============
diff --git a/Documentation/translations/zh_TW/arch/openrisc/todo.rst b/Documentation/translations/zh_TW/arch/openrisc/todo.rst
index df261b9e3002..89bb852c5d00 100644
--- a/Documentation/translations/zh_TW/arch/openrisc/todo.rst
+++ b/Documentation/translations/zh_TW/arch/openrisc/todo.rst
@@ -2,10 +2,6 @@
 
 :Original: Documentation/arch/openrisc/todo.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
 .. _tw_openrisc_todo.rst:
 
 ========
diff --git a/Documentation/translations/zh_TW/arch/parisc/debugging.rst b/Documentation/translations/zh_TW/arch/parisc/debugging.rst
index c9ee804aebbd..a58cf3aa534a 100644
--- a/Documentation/translations/zh_TW/arch/parisc/debugging.rst
+++ b/Documentation/translations/zh_TW/arch/parisc/debugging.rst
@@ -2,10 +2,6 @@
 
 :Original: Documentation/arch/parisc/debugging.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
 .. _tw_parisc_debugging:
 
 =================
diff --git a/Documentation/translations/zh_TW/arch/parisc/index.rst b/Documentation/translations/zh_TW/arch/parisc/index.rst
index 35941bf68c88..a08e0329383d 100644
--- a/Documentation/translations/zh_TW/arch/parisc/index.rst
+++ b/Documentation/translations/zh_TW/arch/parisc/index.rst
@@ -3,10 +3,6 @@
 
 :Original: Documentation/arch/parisc/index.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
 .. _tw_parisc_index:
 
 ====================
diff --git a/Documentation/translations/zh_TW/arch/parisc/registers.rst b/Documentation/translations/zh_TW/arch/parisc/registers.rst
index 695acb21134a..ea9b8df9314d 100644
--- a/Documentation/translations/zh_TW/arch/parisc/registers.rst
+++ b/Documentation/translations/zh_TW/arch/parisc/registers.rst
@@ -2,10 +2,6 @@
 
 :Original: Documentation/arch/parisc/registers.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
 .. _tw_parisc_registers:
 
 =========================
-- 
2.43.0

