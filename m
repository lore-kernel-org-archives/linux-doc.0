Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893E1418A58
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 21:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784671028; cv=none; b=BE3XGJDI0namGCcFYzw5CVsr9Wsjc3k9oPfigK2Wg3tl38vJJOtQwD+O/+HQ9DAVh/+i9PxwNoWD3Qp88Mk411hJmCElQ9hUGxddD+NFoqrptplaZXr72GK/9GZEqON2zKhNltvPcXeMIGWZBXX2b+9v4rE6u4PS5sMMoKCpxC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784671028; c=relaxed/simple;
	bh=Ru/QelLsDkRb23WgPQWEsPplgV5viOSodk0OD5E0kfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RbJ28dXIY6oJKzcwFjITQ+hpbyw8Krk9Pc3AP4avcHQCH/XwdEho/pYku7lj5ngx6w3hWdKsSp8gACKIwzl8qWkCP6o0osysCcblMMFwmS0nUeT4qKew5fqUWvDK+RpsqFbWYZigpW5SaCVWKi8BgZ3u0zhz88GCumLvxgl/sc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNwsKkeZ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNwsKkeZ"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cad85b7b5aso15386425ad.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 14:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784671026; x=1785275826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wv4ak6OVT4a8lorzYZXZ2e8Wutyku24XZii8fc8ewk0=;
        b=jNwsKkeZwdSqFf6Uvb/EH8RoqW9nc2QTsSO1irR+HvZdXydT/b9CJwqrE3zhx0E9S6
         0jhqjae1KjTReyIVoSvM1y8zumfn8+JZVOpibgV0nIlJnG+YibXOW7BD4LKXa98w4yh6
         Ea/25Xzg+w9rtGay2c9BBwM+WDYhZU1hosjSCIApw6Rak15bEwlM9hI3B4ialBTZ8oT+
         sLYh5EtneLt3VXAyJjhEI3HUCDCUf60rTlTIkkDeFyAOin+9b2O0a634t/9Ng/yZudVg
         Lzq/OJ2qEl9prbCG4r+JrKhICE0hS4Jr4yN7J+oGQHN5h3ZK6axo9Glm+0UCFlbIBX1x
         Jq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784671026; x=1785275826;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wv4ak6OVT4a8lorzYZXZ2e8Wutyku24XZii8fc8ewk0=;
        b=rsmbQTSHBRKKV4gLfg/3KkFE9XY41u2LeKY149XsTBnnBzz8lgHYSJIveEgDFc87g4
         Db8ZIfnjghAwvS3hSovisHN2nk5fLbks8IPZkxvE5x/UPkIAcLg4ncTwpcaT8hCCRW28
         Zy2E6yzEUn0/i7fWPV2Xv49ICnLOxa/yGj7WkDR6MRadIyEoDh7JZ0hmndlez5cfHmy1
         BWPGpF+Fys5+6qIA46+3Lw/EnMVfEirbPALGtZTJ/XHuc39twJFpIC1Iub1mmQEEyat5
         /rwC2Vo2XstbB1AAF4VihGExEm4p0hMwAO2WjjroKaQAOZaORwHqfdIP1g7hW04YMeAJ
         w5jQ==
X-Forwarded-Encrypted: i=1; AHgh+RpfJdPVQy/lDrSPRnvO/a9GviRBpvWSorC7GCGN/IELHF5BnYMuJk5djIPuMXM9tm7tIef8pjiNMSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS4wFwH6J11rv+Td9alpArwa3MyvQEyyQWQUfReKVUZPyWyU+G
	RD7SuoYSyebhQn6u2jSt0W6bh253mauEpXdnFR+z8tRXF/6N1lE6qx/x
X-Gm-Gg: AR+sD10PYE9ntUWmRq1zfMnz9yRUb/dCbjUbd3DBqrK3wO5SCD3tGGx3Y7Z4kXiEsxa
	sCXQqkJANRdQcF/Ltb7Mxzm/bBWeIUWlW/W7OC8fyFAE9eIUNj2l7fKWM7MgEHehTJsKgd/VGAv
	n/MV367KBJtRdWkz2FYVi2wfpC2iDubSnm/HQkd36r9W7Gl+9XWpJttcETwkyAsiJry32bP1lhl
	rlu8R+PrUkPKOlwiX/UFH1KKC8y3jw8HrJODW0RyIHBGNvTAvmah70LVLTrQciulbkmttEB4cJb
	PJUlOdAcK7aXY5uzr7WEvdQycSEvG8D3P7SMG5r4KhYeV/HY81Ef3R+X7dSkTyeljzEcHgmt1ne
	T7zgtvAnirdnu+zdhxh9aUbI5EkqY9KY+DUY5gm2lDRBLVMmIe58SiZOs2yacnmkPLw6ZvMXzGc
	cr1utu6N0YTThmqGcrFxaJOmKMtf/VjaGWrk0lYVghgJ8UUBdEVmWP9gb3Ui8GGtcsvC8JvlDIb
	aWDt4iK6CsCd70DAo/XV8h8LVlkOtPK/55tqzVO
X-Received: by 2002:a17:903:286:b0:2cc:e648:7e0c with SMTP id d9443c01a7336-2cf9055eb9dmr5775965ad.7.1784671025862;
        Tue, 21 Jul 2026 14:57:05 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8edea703sm3697115ad.0.2026.07.21.14.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:57:05 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>
Cc: Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	Weijie Yuan <wy@wyuan.org>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 06/16] docs/zh_TW: process: localize terminology in programming-language.rst
Date: Wed, 22 Jul 2026 05:55:32 +0800
Message-ID: <20260721215542.98435-7-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721215542.98435-1-chenyou910331@gmail.com>
References: <20260721215542.98435-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Localize mainland terms to Taiwanese Mandarin (內核→核心, 變量→變數,
函數→函式, ...) and sync with the English original: drop the stale
icc/architecture paragraph, switch to footnote-style references as in
the English text, and add the Rust section, which now states Rust is
supported (no longer experimental) per commit 9fa7153c31a3 ("rust:
conclude the Rust experiment").

update to commit 47cb33cedf47 ("docs: clarify wording in programming-language.rst")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/programming-language.rst    | 94 ++++++++-----------
 1 file changed, 40 insertions(+), 54 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/programming-language.rst b/Documentation/translations/zh_TW/process/programming-language.rst
index d2c64a5599e8..ed2fa22db985 100644
--- a/Documentation/translations/zh_TW/process/programming-language.rst
+++ b/Documentation/translations/zh_TW/process/programming-language.rst
@@ -5,71 +5,57 @@
 :Original: :ref:`Documentation/process/programming-language.rst <programming_language>`
 :Translator: Alex Shi <alex.shi@linux.alibaba.com>
              Hu Haowen <2023002089@link.tyut.edu.cn>
+             Chen-Yu Yeh <chenyou910331@gmail.com>
 
 .. _tw_programming_language:
 
-程序設計語言
-============
+程式語言
+========
 
-內核是用C語言 :ref:`c-language <tw_c-language>` 編寫的。更準確地說，內核通常是用 :ref:`gcc <tw_gcc>`
-在 ``-std=gnu11`` :ref:`gcc-c-dialect-options <tw_gcc-c-dialect-options>` 下編譯的：ISO C11的 GNU 方言
+Linux核心是用C程式語言 [zh_tw_c-language]_ 編寫的。更準確地說，核心通常使用
+``gcc`` [zh_tw_gcc]_ 編譯，並且使用 ``-std=gnu11`` [zh_tw_gcc-c-dialect-options]_：
+這是 ISO C11 的 GNU 方言。``clang`` [zh_tw_clang]_ 也得到了支援，詳見文件：
+:ref:`使用 Clang/LLVM 建置 Linux <kbuild_llvm>`。
 
-這種方言包含對語言 :ref:`gnu-extensions <tw_gnu-extensions>` 的許多擴展，當然，它們許多都在內核中使用。
-
-對於一些體系結構，有一些使用 :ref:`clang <tw_clang>` 和 :ref:`icc <tw_icc>` 編譯內核
-的支持，儘管在編寫此文檔時還沒有完成，仍需要第三方補丁。
+這種方言包含對C語言的許多擴展 [zh_tw_gnu-extensions]_，當然，它們許多都在核心
+中使用。
 
 屬性
 ----
 
-在整個內核中使用的一個常見擴展是屬性（attributes） :ref:`gcc-attribute-syntax <tw_gcc-attribute-syntax>`
-屬性允許將實現定義的語義引入語言實體（如變量、函數或類型），而無需對語言進行
-重大的語法更改（例如添加新關鍵字） :ref:`n2049 <tw_n2049>`
+在整個核心中使用的一個常見擴展是屬性（attributes） [zh_tw_gcc-attribute-syntax]_。
+屬性允許將實作定義的語義引入語言實體（如變數、函式或型別），而無需對語言進行
+重大的語法更改（例如添加新關鍵字） [zh_tw_n2049]_。
 
-在某些情況下，屬性是可選的（即不支持這些屬性的編譯器仍然應該生成正確的代碼，
-即使其速度較慢或執行的編譯時檢查/診斷次數不夠）
+在某些情況下，屬性是可選的（即不支援這些屬性的編譯器仍然應該產生正確的程式碼，
+即使其速度較慢或執行的編譯時檢查/診斷次數不夠）。
 
-內核定義了僞關鍵字（例如， ``pure`` ），而不是直接使用GNU屬性語法（例如,
-``__attribute__((__pure__))`` ），以檢測可以使用哪些關鍵字和/或縮短代碼, 具體
+核心定義了偽關鍵字（例如， ``__pure`` ），而不是直接使用GNU屬性語法（例如,
+``__attribute__((__pure__))`` ），以檢測可以使用哪些關鍵字和/或縮短程式碼，具體
 請參閱 ``include/linux/compiler_attributes.h``
 
-.. _tw_c-language:
-
-c-language
-   http://www.open-std.org/jtc1/sc22/wg14/www/standards
-
-.. _tw_gcc:
-
-gcc
-   https://gcc.gnu.org
-
-.. _tw_clang:
-
-clang
-   https://clang.llvm.org
-
-.. _tw_icc:
-
-icc
-   https://software.intel.com/en-us/c-compilers
-
-.. _tw_gcc-c-dialect-options:
-
-c-dialect-options
-   https://gcc.gnu.org/onlinedocs/gcc/C-Dialect-Options.html
-
-.. _tw_gnu-extensions:
-
-gnu-extensions
-   https://gcc.gnu.org/onlinedocs/gcc/C-Extensions.html
-
-.. _tw_gcc-attribute-syntax:
-
-gcc-attribute-syntax
-   https://gcc.gnu.org/onlinedocs/gcc/Attribute-Syntax.html
-
-.. _tw_n2049:
-
-n2049
-   http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2049.pdf
+Rust
+----
 
+核心支援 Rust 程式語言 [zh_tw_rust-language]_，並可以透過設定選項
+``CONFIG_RUST`` 來啟用。Rust 程式碼使用 ``rustc`` [zh_tw_rustc]_ 編譯器在
+``--edition=2021`` [zh_tw_rust-editions]_ 選項下進行編譯。版本（Editions）是
+一種在語言中引入非後向相容的小型變更的方式。
+
+除此之外，核心中還使用了一些不穩定的特性 [zh_tw_rust-unstable-features]_。
+這些不穩定的特性將來可能會發生變化，因此，一個重要的目標是達到僅使用穩定特性
+的程度。
+
+具體請參閱 Documentation/rust/index.rst
+
+.. [zh_tw_c-language] http://www.open-std.org/jtc1/sc22/wg14/www/standards
+.. [zh_tw_gcc] https://gcc.gnu.org
+.. [zh_tw_clang] https://clang.llvm.org
+.. [zh_tw_gcc-c-dialect-options] https://gcc.gnu.org/onlinedocs/gcc/C-Dialect-Options.html
+.. [zh_tw_gnu-extensions] https://gcc.gnu.org/onlinedocs/gcc/C-Extensions.html
+.. [zh_tw_gcc-attribute-syntax] https://gcc.gnu.org/onlinedocs/gcc/Attribute-Syntax.html
+.. [zh_tw_n2049] http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2049.pdf
+.. [zh_tw_rust-language] https://www.rust-lang.org
+.. [zh_tw_rustc] https://doc.rust-lang.org/rustc/
+.. [zh_tw_rust-editions] https://doc.rust-lang.org/edition-guide/editions/
+.. [zh_tw_rust-unstable-features] https://github.com/Rust-for-Linux/linux/issues/2
-- 
2.43.0

