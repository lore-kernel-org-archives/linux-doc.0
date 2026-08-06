Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B927B37AA92
	for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2026 18:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040425; cv=none; b=T6gRRrHUwH1ZTBS5mPHBS8QpBadm4lRDBkbnyGzM65nHSBCChS8hFhBJ+FZd+ReyaphsbWchqG42fqRMMlRfE2C3wR9FPfvxgEOiOfGsj7d722v51eWgA/FAnfwaRmyBR/tw5XM2PY7hCr74x7b768t/jUUvThpnT2qXWJPvPrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040425; c=relaxed/simple;
	bh=/f9/5GGXIUQkvdk49kibGgzHXXrr6qEKlvKkyocfMCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TuVIHhIOkCl/K0yOMK/nON3P1lLgeFabSDmIqarDfokhbupZAHNufsm7ovX4OjVzHVM0KHCLWn8HndIiGxbrH+Ot3WlqL+XgAN5ZDvQ6239we5D5GzP9rJhKstZybunrZckvhUygAsLiAt2HtcYWW4KFWt6JDxA1H8UWFG2LOhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJgBUsAW; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJgBUsAW"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-384caf7b168so373354a91.1
        for <linux-doc@vger.kernel.org>; Thu, 06 Aug 2026 11:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786040423; x=1786645223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1W2+qMszB4xYpnkWp1PSWbU92sofYK0zgl14lTmgSeo=;
        b=nJgBUsAWYfeWC9iGoz9F8PodbR32v5lp0zosPxnwJxO+jP9sGztpDc/ACXukhjOQhr
         LiNMY7+YTdNdyF7D8IrrSCCeIGYWaFeBjFVEf7CG9HU8fWR8CbFhG7/2zoFzNnBjwIw4
         rqJ2h+9oryLjOC67WdHVart5STOMmCkCPj5QTMpJeFqzdVeY4S1j8kGqUExbtgdk7NTL
         3RlfjRmOnJAlDHl17hceU+VgnyxVP3ZTPkrR4Ri84kseAsc2heW+zwtVNSZrJeTeB6P5
         4nQ/r51yydbG7wIIxaz4FXsQbrwjQVCLLqTMY/SL04HkOc/FjtZVsaPl/7AmTwoJNl0C
         KFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786040423; x=1786645223;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1W2+qMszB4xYpnkWp1PSWbU92sofYK0zgl14lTmgSeo=;
        b=FWvQbLGcGIpXkcO/ppsqELdfBdjhziKmE+8xomNoLwjkXODbB6ofkMAx8U34+nor/v
         Vf6yBi5jbpgIDheKDy1YOh7ivIoRbDsCFwWL+12tYloUnbh+ctBhoUq246wZwgasgVI7
         fEaiZGEDsuc+X7UNcGpqOMgUBEphthnQdNObHIFzrv5leSjtAYCYrmyvLWsMpKaS6AvU
         VhY24UfTdiZnHevkEo/oLIBYdWIAX2VpjK1Sfw4PgPfTd3KEx8C96O5K8iO77y52upgk
         yz+ens7i5ZqsJYy0r0BAXT3NhkEuih+jif9ZxGNR+ZimKyLQrnoazQOYuTelYY2o0Zsi
         TF0g==
X-Forwarded-Encrypted: i=1; AHgh+Ro+9Sr8EcZA1Q8lUuYUjuvT2djAeqPcyEOihoXHvPVZyIUVAuafOxdEe14z4lCUFD9fOrqhrBQm55E=@vger.kernel.org
X-Gm-Message-State: AOJu0YygNOXcqqWhpSRgk+qHQKncgDmAkoddRnVNYpHndu7IMaNmkw49
	sLLj/L+iwqJmeIXKW0tmKkSPnToCCZeFxytE7dL3WV0UZXdUipu19PY0
X-Gm-Gg: AR+sD13dygL59MzUq4TGO+Yaj0No1I8cwo9d6rTdxNHBkzfwHYhX5GN8/zLBXJJxgaT
	opP5dn+OSIRNhDSOFxNd9pCyNMN0lQcH8qvHBja2vIgA1PQ8DoyKhST3azdxDN23mRcf1QaXRpI
	pRH6xAG1dHGhQZpjiBMMnyvPE2vCUK7VQ8ZEf9otBK4tqLMJV8UVXDOgxffaPsPUaFa5ur6wjsK
	wZrTfr2xrMur85JrSD4FMSpcf+JziobVo9rNkWSoo7o1POxJpmE9O/MzSa3+j4M0hQE4glDzcS7
	6JW0XhGdq6ZG78InYOm/GNcsJVGFHbDD9pgy2JKAl54u5L7b+/XHzsogYEhMI3dkTsalQ4Ez3zU
	ojALApMgeyX7l3qK9tLLRDZOJTCjXGlcS1KN1zPedsc/zKrHM1N6YEfCHz//dQ2xKWkwekbRYyF
	bTfxN76J3Sg4SJ2/C41vA+8Z5W+KreRkuIEE/qGoog6yaFI8Zbp6mJDahrmUmvQMOc5aPL7tSdF
	szMB/QV+gMIaGpRP745aNKIcviTGuNqGas38X6liXbXJSIPuzbMP2+JEtuXKTSH+hd9K2YJWjBQ
	ZSf0TsvRf7KHVkZm2pIYXCac
X-Received: by 2002:a17:90b:3f48:b0:383:5a16:bd67 with SMTP id 98e67ed59e1d1-3903c783fc7mr12114266a91.4.1786040423057;
        Thu, 06 Aug 2026 11:20:23 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085f2b2easm2003356a91.11.2026.08.06.11.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 11:20:22 -0700 (PDT)
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
Subject: [PATCH v3 06/16] docs/zh_TW: process: localize terminology in programming-language.rst
Date: Fri,  7 Aug 2026 02:19:39 +0800
Message-ID: <20260806181949.65648-7-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806181949.65648-1-chenyou910331@gmail.com>
References: <20260806181949.65648-1-chenyou910331@gmail.com>
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

update to commit 26a4cfaff82a ("Merge tag 'docs-7.0-2' of
 git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux")

Reviewed-by: Weijie Yuan <wy@wyuan.org>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/programming-language.rst    | 98 ++++++++-----------
 1 file changed, 43 insertions(+), 55 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/programming-language.rst b/Documentation/translations/zh_TW/process/programming-language.rst
index d2c64a5599e8..a5466047b90c 100644
--- a/Documentation/translations/zh_TW/process/programming-language.rst
+++ b/Documentation/translations/zh_TW/process/programming-language.rst
@@ -5,71 +5,59 @@
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
+Linux核心是用C程式語言 [zh_tw_c-language]_ 編寫的。更準確地說，核心通常使
+用``gcc`` [zh_tw_gcc]_ 編譯，並且使用 ``-std=gnu11``
+[zh_tw_gcc-c-dialect-options]_：這是 ISO C11 的 GNU 方言。``clang``
+[zh_tw_clang]_ 也得到了支援，詳見文件：
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
-
-在某些情況下，屬性是可選的（即不支持這些屬性的編譯器仍然應該生成正確的代碼，
-即使其速度較慢或執行的編譯時檢查/診斷次數不夠）
-
-內核定義了僞關鍵字（例如， ``pure`` ），而不是直接使用GNU屬性語法（例如,
-``__attribute__((__pure__))`` ），以檢測可以使用哪些關鍵字和/或縮短代碼, 具體
-請參閱 ``include/linux/compiler_attributes.h``
-
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
+在整個核心中使用的一個常見擴展是屬性（attributes）
+[zh_tw_gcc-attribute-syntax]_。屬性允許將實作定義的語義引入語言實體（如變
+數、函式或型別），而無需對語言進行重大的語法更改（例如添加新關鍵字）
+[zh_tw_n2049]_。
 
-.. _tw_icc:
+在某些情況下，屬性是可選的（即不支援這些屬性的編譯器仍然應該產生正確的程式碼，
+即使其速度較慢或執行的編譯時檢查/診斷次數不夠）。
 
-icc
-   https://software.intel.com/en-us/c-compilers
+核心定義了偽關鍵字（例如， ``__pure`` ），而不是直接使用GNU屬性語法（例如,
+``__attribute__((__pure__))`` ），以檢測可以使用哪些關鍵字和/或縮短程式碼，
+具體請參閱 ``include/linux/compiler_attributes.h``
 
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

