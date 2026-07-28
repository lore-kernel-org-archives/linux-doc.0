Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8A241BA98
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 09:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785229869; cv=none; b=RAG9NtQRFx1/u3E0RtEIrOBKNCV43xmxln2SFPM6QBKP0OXJZowKPzb6UhJzTmQaZljJ8S16Z0grZsfn+e6os1ULBDHlU1O9gnKj0TZfMVfmX2Dbtr9c+qMEQbARM+uI+ePPouERlKeC96o9JEZgZbJAlr9cBEFxhE4BCHEXYlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785229869; c=relaxed/simple;
	bh=chYojF1fY1+ZWMNSDCiAB1sCMvCC+1Wt3GIDOpF0ZV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FvfjwUQzYi0nlV05DVGfCP2tXoEGYp7GOYhMv0oSvwINlQhJOUCoRyloPXDFZSDPT2WTetBYpP/J7CyitrpySoXI7ji8WXJ9zkgcuczhj1Dlia8dbPHqI6JhtfZeUdUZWMfMkfaf7cyly6TbQXL2E4N0aZbEXc4/asr3IxDdkhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lh2W92fZ; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lh2W92fZ"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cb2513ec378so436670a12.3
        for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 02:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785229866; x=1785834666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pa5eGQLyzrbVgKpkC+EmZphUkfean/99e6vB2DOPCHk=;
        b=Lh2W92fZ5LKHmuymvfY62GMET68SSMgvHWPFAZmqBih4DBNWfc8ZcpCa+ygrn+pmEA
         FYnJiF5mKvL9Mcb/tcsTqJp1imVu60D0W0E9YctOMI3fGdujWeg4MKQMMrpvFTTBoUxJ
         WlmSpjR4nZRN3CMqozTpRnvvr2mzGebSGSeiavdsc167peQ+bYbLh771fj+QAtfqrYCW
         edMjlho7tTIDkNEzuREMoUincEY7pZW10a7xGsrguj3B/jaKsFZ5tm62QMlhBWmGYVpT
         MgjD6fQiMK+I5FZZd99FffK5zZVJBMCkaO1tYBym/lMQeCTlhBViVdJhM0t64W+XYcx1
         HTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785229866; x=1785834666;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pa5eGQLyzrbVgKpkC+EmZphUkfean/99e6vB2DOPCHk=;
        b=Lk6QglhOCdrDjU1gKTxBIAXeoFpM6FM1yAE+DcsQuB6IA10HlheEuEn4V2cICrCH/i
         e126pSUboO+svZM79y7oNXhX2CLNp34NRf+ZRdZksYXxSKvfUrtTQFzL6yn/HvUizzQr
         d4K/uZMLtgQe54oeBfvd2NTcmokRZi35B0YR6C9xsJQy209eDht4GwMlNUAT9OP2xQBn
         e76mKoA7WMSIZrws/2PZpweVQRw1L6+ykDxoCduFNloMmVOYKUxeldr96Q1jR5xc9A16
         XV54NpNWYXIrB3+UXxiImJe7ZIBYQsRKMHlHvYjhVnCmaW1Sm0J8NZ7xNvUa4nyuvcQz
         ohvw==
X-Forwarded-Encrypted: i=1; AHgh+RqWiseG3GglDI+bUxLa3oVr2yD6Xai3x6H7uYquCG4rFn4ft5dmg6GiB8nZV802bfVJxC+bXNKcynw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUQsUPBJ8rAeRDaeNZ6PrRBFcdfCr2lBrMC8JNExgOFTG75HsQ
	UolFhjlH1diB3b+rPqtIK48QGSnwAK1EuoYiVFy9UMx4vKDSxEU4lNXe
X-Gm-Gg: AR+sD13kH5P3/C2Y+q63BwsSmKFxwu8ex/CtDGqVoIOq6fb18/aEKokoaL+MEBTDyTe
	4eSBVAd//7awfK0kuNyVbJO4RYZ0W7m1Nc303u1f2saz8f8XfwZJByeqKX+/sum3oYKTMMnoVIA
	Tua40zSX7Zr1dzf6zVQe3o+Ol4cKVUlOI5uRD41/vHRAKBa6e8s+tU9tSd9dfZBuz937c6vjeSF
	cfdy6sU1B3VdBJBIHcKZJtYoJGOzk+4l8OUv4Y+oikgAgVg2eukUf0oATnQeLK93JwU6C4bgT0E
	XwC3PskiUCXi5PFyNiU4cz2l2DRFWgDUaKnBWLFpcsDf3EC+IFe7jti4zUfgKqYmrfYMTqa7lsH
	7yO+Scx7jnYL3W5zHhmHNlYuti0HnquWYeebBTQA7SqgFLwOH88JbOWmu/R4/EcppYW1sZiBP8m
	SSxlQyh6So+jKwgjRi+VMegBWGEzFPX0i+lzOSQkx1t6dUsvfvrgVxJk0XE92ZLctzB8P2euDcJ
	ihD50LJbcu80a5chAfShWBL/8OYmlb2P3QtRcoAYxO6Ep7OSrU=
X-Received: by 2002:a05:6a00:92a3:b0:843:468d:780d with SMTP id d2e1a72fcca58-84e93323593mr1282152b3a.3.1785229865706;
        Tue, 28 Jul 2026 02:11:05 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5328180dsm4099303b3a.23.2026.07.28.02.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:11:04 -0700 (PDT)
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
Subject: [PATCH v2 04/16] docs/zh_TW: process: localize terminology in license-rules.rst
Date: Tue, 28 Jul 2026 17:10:26 +0800
Message-ID: <20260728091038.171033-5-chenyou910331@gmail.com>
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

Localize mainland terms to Taiwanese Mandarin (內核→核心, 文件→檔案,
標識符→識別碼, 加載→載入, ...) and sync with the English original:
mention SPDX-FileCopyrightText lines and the clarified "Proprietary"
MODULE_LICENSE wording from commit d8c949c577b5 ("docs/licensing:
Clarify wording about "GPL" and "Proprietary"").

update to commit ebf1bafd0907 ("LICENSES: Explicitly allow
SPDX-FileCopyrightText")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/license-rules.rst           | 203 +++++++++---------
 1 file changed, 105 insertions(+), 98 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/license-rules.rst b/Documentation/translations/zh_TW/process/license-rules.rst
index 594255856b68..d9054cff505c 100644
--- a/Documentation/translations/zh_TW/process/license-rules.rst
+++ b/Documentation/translations/zh_TW/process/license-rules.rst
@@ -5,21 +5,22 @@
 :Original: :ref:`Documentation/process/license-rules.rst <kernel_licensing>`
 :Translator: Alex Shi <alex.shi@linux.alibaba.com>
              Hu Haowen <2023002089@link.tyut.edu.cn>
+             Chen-Yu Yeh <chenyou910331@gmail.com>
 
 .. _tw_kernel_licensing:
 
-Linux內核許可規則
+Linux核心許可規則
 =================
 
-Linux內核根據LICENSES/preferred/GPL-2.0中提供的GNU通用公共許可證版本2
+Linux核心根據LICENSES/preferred/GPL-2.0中提供的GNU通用公共許可證版本2
 （GPL-2.0）的條款提供，並在LICENSES/exceptions/Linux-syscall-note中顯式
-描述了例外的系統調用，如COPYING文件中所述。
+描述了例外的系統呼叫，如COPYING檔案中所述。
 
-此文檔文件提供瞭如何對每個源文件進行註釋以使其許可證清晰明確的說明。
-它不會取代內核的許可證。
+本文件提供了如何對每個原始檔進行註解以使其許可證清晰明確的說明。
+它不會取代核心的許可證。
 
-內核源代碼作爲一個整體適用於COPYING文件中描述的許可證，但是單個源文件可以
-具有不同的與GPL-20兼容的許可證::
+核心原始程式碼作為一個整體適用於COPYING檔案中描述的許可證，但是單個原始檔可以
+具有不同的與GPL-2.0相容的許可證::
 
     GPL-1.0+ : GNU通用公共許可證v1.0或更高版本
     GPL-2.0+ : GNU通用公共許可證v2.0或更高版本
@@ -28,43 +29,47 @@ Linux內核根據LICENSES/preferred/GPL-2.0中提供的GNU通用公共許可證
     LGPL-2.1 : 僅限GNU寬通用公共許可證v2.1
     LGPL-2.1+: GNU寬通用公共許可證v2.1或更高版本
 
-除此之外，個人文件可以在雙重許可下提供，例如一個兼容的GPL變體，或者BSD，
+除此之外，個人檔案可以在雙重許可下提供，例如一個相容的GPL變體，或者BSD，
 MIT等許可。
 
-用戶空間API（UAPI）頭文件描述了用戶空間程序與內核的接口，這是一種特殊情況。
-根據內核COPYING文件中的註釋，syscall接口是一個明確的邊界，它不會將GPL要求
-擴展到任何使用它與內核通信的軟件。由於UAPI頭文件必須包含在創建在Linux內核
-上運行的可執行文件的任何源文件中，因此此例外必須記錄在特別的許可證表述中。
+使用者空間API（UAPI）標頭檔描述了使用者空間程式與核心的介面，這是一種特殊
+情況。根據核心COPYING檔案中的註解，syscall介面是一個明確的邊界，它不會將
+GPL要求擴展到任何使用它與核心通信的軟體。由於UAPI標頭檔必須包含在建立在
+Linux核心上執行的可執行檔案的任何原始檔中，因此此例外必須記錄在特別的許可
+證表述中。
 
-表達源文件許可證的常用方法是將匹配的樣板文本添加到文件的頂部註釋中。由於
-格式，拼寫錯誤等，這些“樣板”很難通過那些在上下文中使用的驗證許可證合規性
+表達原始檔許可證的常用方法是將匹配的樣板文本添加到檔案的頂部註解中。由於
+格式，拼寫錯誤等，這些“樣板”很難透過那些在上下文中使用的驗證許可證合規性
 的工具。
 
-樣板文本的替代方法是在每個源文件中使用軟件包數據交換（SPDX）許可證標識符。
-SPDX許可證標識符是機器可解析的，並且是用於提供文件內容的許可證的精確縮寫。
-SPDX許可證標識符由Linux 基金會的SPDX 工作組管理，並得到了整個行業，工具
-供應商和法律團隊的合作伙伴的一致同意。有關詳細信息，請參閱
+樣板文本的替代方法是在每個原始檔中使用軟體套件資料交換（SPDX）許可證識別碼。
+SPDX許可證識別碼是機器可解析的，並且是用於提供檔案內容的許可證的精確縮寫。
+SPDX許可證識別碼由Linux 基金會的SPDX 工作組管理，並得到了整個行業，工具
+供應商和法律團隊的合作夥伴的一致同意。有關詳細資訊，請參閱
 https://spdx.org/
 
-Linux內核需要所有源文件中的精確SPDX標識符。內核中使用的有效標識符在
-`許可標識符`_ 一節中進行了解釋，並且已可以在
+Linux核心需要所有原始檔中的精確SPDX識別碼。核心中使用的有效識別碼在
+`許可識別碼`_ 一節中進行了解釋，並且已可以在
 https://spdx.org/licenses/ 上的官方SPDX許可證列表中檢索，並附帶許可證
 文本。
 
-許可標識符語法
+許可識別碼語法
 --------------
 
 1.安置:
 
-   內核文件中的SPDX許可證標識符應添加到可包含註釋的文件中的第一行。對於大多
-   數文件，這是第一行，除了那些在第一行中需要'#!PATH_TO_INTERPRETER'的腳本。
-   對於這些腳本，SPDX標識符進入第二行。
+   核心檔案中的SPDX許可證識別碼應添加到可包含註解的檔案中的第一行。對於大多
+   數檔案，這是第一行，除了那些在第一行中需要'#!PATH_TO_INTERPRETER'的腳本。
+   對於這些腳本，SPDX許可證識別碼進入第二行。
+
+   如有需要，許可證識別碼行之後可以接上一行或多行SPDX-FileCopyrightText
+   行。
 
 |
 
 2. 風格:
 
-   SPDX許可證標識符以註釋的形式添加。註釋樣式取決於文件類型::
+   SPDX許可證識別碼以註解的形式添加。註解樣式取決於檔案類型::
 
       C source:	// SPDX-License-Identifier: <SPDX License Expression>
       C header:	/* SPDX-License-Identifier: <SPDX License Expression> */
@@ -73,44 +78,44 @@ https://spdx.org/licenses/ 上的官方SPDX許可證列表中檢索，並附帶
       .rst:	.. SPDX-License-Identifier: <SPDX License Expression>
       .dts{i}:	// SPDX-License-Identifier: <SPDX License Expression>
 
-   如果特定工具無法處理標準註釋樣式，則應使用工具接受的相應註釋機制。這是在
-   C 頭文件中使用“/\*\*/”樣式註釋的原因。過去在使用生成的.lds文件中觀察到
-   構建被破壞，其中'ld'無法解析C++註釋。現在已經解決了這個問題，但仍然有較
-   舊的彙編程序工具無法處理C++樣式的註釋。
+   如果特定工具無法處理標準註解樣式，則應使用工具接受的相應註解機制。這是在
+   C 標頭檔中使用“/\*\*/”樣式註解的原因。過去在使用產生的.lds檔案中觀察到
+   建置被破壞，其中'ld'無法解析C++註解。現在已經解決了這個問題，但仍然有較
+   舊的組譯器工具無法處理C++樣式的註解。
 
 |
 
 3. 句法:
 
-   <SPDX許可證表達式>是SPDX許可證列表中的SPDX短格式許可證標識符，或者在許可
-   證例外適用時由“WITH”分隔的兩個SPDX短格式許可證標識符的組合。當應用多個許
+   <SPDX許可證表達式>是SPDX許可證列表中的SPDX短格式許可證識別碼，或者在許可
+   證例外適用時由“WITH”分隔的兩個SPDX短格式許可證識別碼的組合。當應用多個許
    可證時，表達式由分隔子表達式的關鍵字“AND”，“OR”組成，並由“（”，“）”包圍。
 
-   帶有“或更高”選項的[L]GPL等許可證的許可證標識符通過使用“+”來表示“或更高”
-   選項來構建。::
+   帶有“或更高”選項的[L]GPL等許可證的許可證識別碼透過使用“+”來表示“或更高”
+   選項來建置。::
 
       // SPDX-License-Identifier: GPL-2.0+
       // SPDX-License-Identifier: LGPL-2.1+
 
-   當需要修正的許可證時，應使用WITH。 例如，linux內核UAPI文件使用表達式::
+   當需要修正的許可證時，應使用WITH。 例如，linux核心UAPI檔案使用表達式::
 
       // SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
       // SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note
 
-   其它在內核中使用WITH例外的事例如下::
+   其它在核心中使用WITH例外的事例如下::
 
       // SPDX-License-Identifier: GPL-2.0 WITH mif-exception
       // SPDX-License-Identifier: GPL-2.0+ WITH GCC-exception-2.0
 
-   例外只能與特定的許可證標識符一起使用。有效的許可證標識符列在異常文本文件
-   的標記中。有關詳細信息，請參閱 `許可標識符`_ 一章中的 `例外`_ 。
+   例外只能與特定的許可證識別碼一起使用。有效的許可證識別碼列在異常文本檔案
+   的標記中。有關詳細資訊，請參閱 `許可識別碼`_ 一章中的 `例外`_ 。
 
-   如果文件是雙重許可且只選擇一個許可證，則應使用OR。例如，一些dtsi文件在雙
+   如果檔案是雙重許可且只選擇一個許可證，則應使用OR。例如，一些dtsi檔案在雙
    許可下可用::
 
       // SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
 
-   內核中雙許可文件中許可表達式的示例::
+   核心中雙許可檔案中許可表達式的範例::
 
       // SPDX-License-Identifier: GPL-2.0 OR MIT
       // SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
@@ -119,8 +124,8 @@ https://spdx.org/licenses/ 上的官方SPDX許可證列表中檢索，並附帶
       // SPDX-License-Identifier: (GPL-2.0 WITH Linux-syscall-note) OR MIT
       // SPDX-License-Identifier: GPL-1.0+ OR BSD-3-Clause OR OpenSSL
 
-   如果文件具有多個許可證，其條款全部適用於使用該文件，則應使用AND。例如，
-   如果代碼是從另一個項目繼承的，並且已經授予了將其放入內核的權限，但原始
+   如果檔案具有多個許可證，其條款全部適用於使用該檔案，則應使用AND。例如，
+   如果程式碼是從另一個專案繼承的，並且已經授予了將其放入核心的權限，但原始
    許可條款需要保持有效::
 
       // SPDX-License-Identifier: (GPL-2.0 WITH Linux-syscall-note) AND MIT
@@ -129,20 +134,20 @@ https://spdx.org/licenses/ 上的官方SPDX許可證列表中檢索，並附帶
 
       // SPDX-License-Identifier: GPL-1.0+ AND LGPL-2.1+
 
-許可標識符
+許可識別碼
 ----------
 
-當前使用的許可證以及添加到內核的代碼許可證可以分解爲：
+當前使用的許可證以及添加到核心的程式碼許可證可以分解為：
 
 1. _`優先許可`:
 
-   應儘可能使用這些許可證，因爲它們已知完全兼容並廣泛使用。這些許可證在內核
+   應儘可能使用這些許可證，因為它們已知完全相容並廣泛使用。這些許可證在核心
    目錄::
 
       LICENSES/preferred/
 
-   此目錄中的文件包含完整的許可證文本和 `元標記`_ 。文件名與SPDX許可證標識
-   符相同，後者應用於源文件中的許可證。
+   此目錄中的檔案包含完整的許可證文本和 `元標記`_ 。檔名與SPDX許可證識別碼
+   相同，後者應用於原始檔中的許可證。
 
    例如::
 
@@ -156,28 +161,28 @@ https://spdx.org/licenses/ 上的官方SPDX許可證列表中檢索，並附帶
 
    _`元標記`:
 
-   許可證文件中必須包含以下元標記：
+   許可證檔案中必須包含以下元標記：
 
    - Valid-License-Identifier:
 
-     一行或多行, 聲明那些許可標識符在項目內有效, 以引用此特定許可的文本。通
-     常這是一個有效的標識符，但是例如對於帶有'或更高'選項的許可證，兩個標識
+     一行或多行, 聲明那些許可識別碼在專案內有效, 以引用此特定許可的文本。通
+     常這是一個有效的識別碼，但是例如對於帶有'或更高'選項的許可證，兩個識別碼
      符都有效。
 
    - SPDX-URL:
 
-     SPDX頁面的URL，其中包含與許可證相關的其他信息.
+     SPDX頁面的URL，其中包含與許可證相關的其他資訊.
 
    - Usage-Guidance:
 
-     使用建議的自由格式文本。該文本必須包含SPDX許可證標識符的正確示例，因爲
-     它們應根據 `許可標識符語法`_ 指南放入源文件中。
+     使用建議的自由格式文本。該文本必須包含SPDX許可證識別碼的正確範例，因為
+     它們應根據 `許可識別碼語法`_ 指南放入原始檔中。
 
    - License-Text:
 
-     此標記之後的所有文本都被視爲原始許可文本
+     此標記之後的所有文本都被視為原始許可文本
 
-   文件格式示例::
+   檔案格式範例::
 
       Valid-License-Identifier: GPL-2.0
       Valid-License-Identifier: GPL-2.0+
@@ -209,12 +214,12 @@ https://spdx.org/licenses/ 上的官方SPDX許可證列表中檢索，並附帶
 
 2. 不推薦的許可證:
 
-   這些許可證只應用於現有代碼或從其他項目導入代碼。這些許可證在內核目錄::
+   這些許可證只應用於現有程式碼或從其他專案導入程式碼。這些許可證在核心目錄::
 
       LICENSES/other/
 
-   此目錄中的文件包含完整的許可證文本和 `元標記`_ 。文件名與SPDX許可證標識
-   符相同，後者應用於源文件中的許可證。
+   此目錄中的檔案包含完整的許可證文本和 `元標記`_ 。檔名與SPDX許可證識別碼
+   相同，後者應用於原始檔中的許可證。
 
    例如::
 
@@ -230,7 +235,7 @@ https://spdx.org/licenses/ 上的官方SPDX許可證列表中檢索，並附帶
 
    “其他”許可證的元標籤要求與 `優先許可`_ 的要求相同。
 
-   文件格式示例::
+   檔案格式範例::
 
       Valid-License-Identifier: ISC
       SPDX-URL: https://spdx.org/licenses/ISC.html
@@ -250,50 +255,50 @@ https://spdx.org/licenses/ 上的官方SPDX許可證列表中檢索，並附帶
 3. _`例外`:
 
    某些許可證可以修改，並允許原始許可證不具有的某些例外權利。這些例外在
-   內核目錄::
+   核心目錄::
 
       LICENSES/exceptions/
 
-   此目錄中的文件包含完整的例外文本和所需的 `例外元標記`_ 。
+   此目錄中的檔案包含完整的例外文本和所需的 `例外元標記`_ 。
 
    例如::
 
       LICENSES/exceptions/Linux-syscall-note
 
-   包含Linux內核的COPYING文件中記錄的Linux系統調用例外，該文件用於UAPI
-   頭文件。例如::
+   包含Linux核心的COPYING檔案中記錄的Linux系統呼叫例外，該檔案用於UAPI
+   標頭檔。例如::
 
       LICENSES/exceptions/GCC-exception-2.0
 
-   包含GCC'鏈接例外'，它允許獨立於其許可證的任何二進制文件與標記有此例外的
-   文件的編譯版本鏈接。這是從GPL不兼容源代碼創建可運行的可執行文件所必需的。
+   包含GCC'連結例外'，它允許獨立於其許可證的任何二進位檔案與標記有此例外的
+   檔案的編譯版本連結。這是從GPL不相容原始程式碼建立可執行的可執行檔案所必需的。
 
    _`例外元標記`:
 
-   以下元標記必須在例外文件中可用：
+   以下元標記必須在例外檔案中可用：
 
    - SPDX-Exception-Identifier:
 
-     一個可與SPDX許可證標識符一起使用的例外標識符。
+     一個可與SPDX許可證識別碼一起使用的例外識別碼。
 
    - SPDX-URL:
 
-     SPDX頁面的URL，其中包含與例外相關的其他信息。
+     SPDX頁面的URL，其中包含與例外相關的其他資訊。
 
    - SPDX-Licenses:
 
-     以逗號分隔的例外可用的SPDX許可證標識符列表。
+     以逗號分隔的例外可用的SPDX許可證識別碼列表。
 
    - Usage-Guidance:
 
-     使用建議的自由格式文本。必須在文本後面加上SPDX許可證標識符的正確示例，
-     因爲它們應根據 `許可標識符語法`_ 指南放入源文件中。
+     使用建議的自由格式文本。必須在文本後面加上SPDX許可證識別碼的正確範例，
+     因為它們應根據 `許可識別碼語法`_ 指南放入原始檔中。
 
    - Exception-Text:
 
-     此標記之後的所有文本都被視爲原始異常文本
+     此標記之後的所有文本都被視為原始異常文本
 
-   文件格式示例::
+   檔案格式範例::
 
       SPDX-Exception-Identifier: Linux-syscall-note
       SPDX-URL: https://spdx.org/licenses/Linux-syscall-note.html
@@ -324,49 +329,51 @@ https://spdx.org/licenses/ 上的官方SPDX許可證列表中檢索，並附帶
         Full exception text
 
 
-所有SPDX許可證標識符和例外都必須在LICENSES子目錄中具有相應的文件。這是允許
+所有SPDX許可證識別碼和例外都必須在LICENSES子目錄中具有相應的檔案。這是允許
 工具驗證（例如checkpatch.pl）以及準備好從源讀取和提取許可證所必需的, 這是
 各種FOSS組織推薦的，例如 `FSFE REUSE initiative <https://reuse.software/>`_.
 
-_`模塊許可`
+_`模組許可`
 -----------------
 
-   可加載內核模塊還需要MODULE_LICENSE（）標記。此標記既不替代正確的源代碼
-   許可證信息（SPDX-License-Identifier），也不以任何方式表示或確定提供模塊
-   源代碼的確切許可證。
+   可載入核心模組還需要MODULE_LICENSE（）標記。此標記既不替代正確的原始程式碼
+   許可證資訊（SPDX-License-Identifier），也不以任何方式表示或確定提供模組
+   原始程式碼的確切許可證。
 
-   此標記的唯一目的是提供足夠的信息，該模塊是否是自由軟件或者是內核模塊加
-   載器和用戶空間工具的專有模塊。
+   此標記的唯一目的是提供足夠的資訊，該模組是否是自由軟體或者是核心模組加
+   載器和使用者空間工具的專有模組。
 
-   MODULE_LICENSE（）的有效許可證字符串是:
+   MODULE_LICENSE（）的有效許可證字串是:
 
     ============================= =============================================
-    "GPL"			  模塊是根據GPL版本2許可的。這並不表示僅限於
+    "GPL"			  模組是根據GPL版本2許可的。這並不表示僅限於
                                   GPL-2.0或GPL-2.0或更高版本之間的任何區別。
-                                  最正確許可證信息只能通過相應源文件中的許可證
-                                  信息來確定
+                                  最正確許可證資訊只能透過相應原始檔中的許可證
+                                  資訊來確定
 
-    "GPL v2"			  和"GPL"相同，它的存在是因爲歷史原因。
+    "GPL v2"			  和"GPL"相同，它的存在是因為歷史原因。
 
-    "GPL and additional rights"   表示模塊源在GPL v2變體和MIT許可下雙重許可的
-                                  歷史變體。請不要在新代碼中使用。
+    "GPL and additional rights"   表示模組源在GPL v2變體和MIT許可下雙重許可的
+                                  歷史變體。請不要在新程式碼中使用。
 
-    "Dual MIT/GPL"		  表達該模塊在GPL v2變體或MIT許可證選擇下雙重
+    "Dual MIT/GPL"		  表達該模組在GPL v2變體或MIT許可證選擇下雙重
                                   許可的正確方式。
 
-    "Dual BSD/GPL"		  該模塊根據GPL v2變體或BSD許可證選擇進行雙重
-                                  許可。 BSD許可證的確切變體只能通過相應源文件
-                                  中的許可證信息來確定。
+    "Dual BSD/GPL"		  該模組根據GPL v2變體或BSD許可證選擇進行雙重
+                                  許可。 BSD許可證的確切變體只能透過相應原始檔
+                                  中的許可證資訊來確定。
 
-    "Dual MPL/GPL"		  該模塊根據GPL v2變體或Mozilla Public License
+    "Dual MPL/GPL"		  該模組根據GPL v2變體或Mozilla Public License
                                   （MPL）選項進行雙重許可。 MPL許可證的確切變體
-                                  只能通過相應的源文件中的許可證信息來確定。
-
-    "Proprietary"		  該模塊屬於專有許可。此字符串僅用於專有的第三
-                                  方模塊，不能用於在內核樹中具有源代碼的模塊。
-                                  以這種方式標記的模塊在加載時會使用'P'標記污
-                                  染內核，並且內核模塊加載器拒絕將這些模塊鏈接
-                                  到使用EXPORT_SYMBOL_GPL（）導出的符號。
+                                  只能透過相應的原始檔中的許可證資訊來確定。
+
+    "Proprietary"		  該模組屬於非GPL2相容的許可。“Proprietary
+                                  （專有）”應僅理解為“該許可證與GPLv2不相容”。
+                                  此字串僅用於非GPL2相容的第三方模組，不能用
+                                  於在核心樹中具有原始程式碼的模組。以這種方式
+                                  標記的模組在載入時會使用'P'標記污染核心，並
+                                  且核心模組載入器拒絕將這些模組連結到使用
+                                  EXPORT_SYMBOL_GPL（）匯出的符號。
     ============================= =============================================
 
 
-- 
2.43.0

