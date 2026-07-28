Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F6341BA98
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 09:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785229877; cv=none; b=k6Hvnl7ujHwPxrHQ+dxr5+XbQ5ODpPwz3Ta3KMv5Mjp9u3PmLFE9g5KSblvbvKaCdYpNpGMemcY8slgtrpyYcgPxHNKjBALiwfn4CgbIQPp60knfvLvgEZ/Rwz5/TGCCIOb2fqJwE0dDpicH0XqMr9blChze/xcdhFtabHgsC68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785229877; c=relaxed/simple;
	bh=15VU4cSjCCipwXSkDRebUcIUQVqDwo6tAnc4uewnWKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Epe02i3Rm4hkfaCAZB5LfJYF0yJKxhgzzwKM/UPI1b8OjLCOd5RKo/k6chfCS0X2qqV2899/X72+xtaOeNVRd4Zqh9/3UbvJkwuMvzNJHuWN/clFJZzWG+RkkZ/CMTsMIE6NW3g6zFj/6UFwkYK+7Y45Thmhe/oVCss9df5EjLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dPlflnAk; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPlflnAk"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca5b707b78aso265768a12.0
        for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 02:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785229873; x=1785834673; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pUKgpOoFW3446F1Ew8CDh4iwSOp6PhPvuWBWckmzen4=;
        b=dPlflnAkUuAPadJeYnSN3pTvWjXN8LIJoTdTxcRhb8NJsM6e1govvhl99GEB24Uwma
         WBWXg8ruUUMXOYa1fWUVT0QaloAvuRCa7OlYFqbAOxRxfKfEFt5DEucXrdehGFAdWCq7
         JkMctaOZUp/g6wzsMnYyvWuNdAXF20o8eLTljkzZNcVVg0WgUoUHSFvnPo2ZGq2zgMsb
         1eeyQDXQZynS2LxoKFqT81HP8gvNpOdlzYEYEQTdU4E12W1UxLowr1jJ/bUmXUs9ghpD
         g/A/MXWLjduTn3c/caOGeC8AVrnQV6NXAPVaivJ6NDnsNCjm5pOD1PhFSVkZBs6xTDnx
         g/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785229873; x=1785834673;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pUKgpOoFW3446F1Ew8CDh4iwSOp6PhPvuWBWckmzen4=;
        b=QZ4TG/iT69mV0V74I03w3RGDdfOguhXmIfgmcJ5fEnxhd7uuoK9dpfGvtrkzXvt5jx
         FLZrPIT6cQjNrhH9M7xp53NAxcJVfJ1XguunrmFmxGHFVkxqE7ULTFr1O7BA3KNbLglR
         5B6mMOGfdhPwWxjOxiNciJa6g+w4kqS6V7SyXXoZT0S7dYcN53JY5qWHGN0JhiosRKsO
         3TzfOCXZ0OI5eOgiX7U8gbvfbQQoLSipphaNYd0C62Nh57wsAJUTuc09GviR4TZIJRpo
         CEZvJWGc/JoDTNmE5BxhoVbNv5bUbEb6CojTAquK3Sjt3cHrwXbi01YB9E8u/151JyxV
         JcMg==
X-Forwarded-Encrypted: i=1; AHgh+RoK9aJh3XF38amuqK4UkXRxJp3B//0fVVOYxB1TrkeEHL2A8xF6ePY9rEjumuTsk7up+nHjRgUWytA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbVDjYTXn0U8zskK1ZzgPG8DgIdStT3LFKSr6zR0nGl7evDgVv
	byQW5M+M5SsuWVOqg1d5HZ2mt0L9JUdZQZsQxGMiGpLw/8Dd5zsktpxl
X-Gm-Gg: AR+sD11/Vdo5XxnIyGM4X6f7HSoBZMI8mqs3VIkoUsjZUPWDavXQVXGtyXQANpsu49D
	8BxLe2R5WaWC1ggh5J3KaXwJqRE+PnHNFoMg4YpErhAE68D7tzMhvp+STA4Y3+PFuPFSC0nJalm
	VK5cPaX3llfEz1I730CXsFZ7xATpFfDHJ1f0lYlTaf4qIhYv16T0QmIXMY3MGPa/8eVg8OtGs5t
	42VmUmmmKhON1ytNVCTPd8yOyP8PnNnsh6XkaybxBK11qts0QQN9tnVQkI5gO8iO/aJOJSjBvLB
	a+yXKgWcxvTfLbY5vGUkamkADulijd+/lwnE3XLv6S5I5uqrAZTuaJAjatzcED5YXz2BfJFiFQ5
	StKjyDgaEPoLBadQjVDpukJPYZMvK1r4wyakhyi+6Ldlxih8DMHXT3cv0Gb26Tin1SzpemikUv8
	rTsu9UH3+IaXO9o13frJcX6A5Qvc7/yF3UNNYHjh6aWPFe1MZhqrB5r1LMlrYSQkC3i7VGdsxVm
	27XlvBNQpCGSswj9k4OikK9O9FgCq8hvltPm9dl
X-Received: by 2002:a05:6a00:3c81:b0:83e:f208:b11d with SMTP id d2e1a72fcca58-84e9334f628mr1212145b3a.6.1785229873367;
        Tue, 28 Jul 2026 02:11:13 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5328180dsm4099303b3a.23.2026.07.28.02.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:11:12 -0700 (PDT)
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
Subject: [PATCH v2 06/16] docs/zh_TW: process: localize terminology in programming-language.rst
Date: Tue, 28 Jul 2026 17:10:28 +0800
Message-ID: <20260728091038.171033-7-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728091038.171033-1-chenyou910331@gmail.com>
References: <20260728091038.171033-1-chenyou910331@gmail.com>
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

update to commit 47cb33cedf47 ("docs: clarify wording in
programming-language.rst")

Reviewed-by: Weijie Yuan <wy@wyuan.org>
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

