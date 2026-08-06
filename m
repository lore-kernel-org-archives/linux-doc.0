Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277FB48A8C1
	for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2026 18:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040436; cv=none; b=UTSCRMwQgB/McDjf6KXr7t5lU153U/d0kBiczQCcrYO1GFR0uk3Ym6oUU4Oy40C0DNNQA9P4Bj1psFvZAkoTox6bjsPfUs3ibOS7jRdZw/Mz6dUY575an7yUB/V6oDA16UD0tWEHfI8uBqUEtN6+n6VWbwar7wIoFMa33bw2HCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040436; c=relaxed/simple;
	bh=6PTvdpTOcqbpIi4KtdaLSY/fCLk3mU8tyMObv9PTh6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YDTc4dYEyU0E03IrL/H4YJPNo2IgUPxGcyfgNARrf9FqxiN1rJQAIuGfVntExjSg/hSenDkiDaE22+6ZFd5X3YpcNBY3szSPqLsfoFmQENvNpgOy1x5JuUmM1+L911Kgssz8/wNd1lrCnN41Wo4F3quZeUl9FTeMyPfHiGzUnp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8qyODYC; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8qyODYC"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38f0f3c8da5so328341a91.3
        for <linux-doc@vger.kernel.org>; Thu, 06 Aug 2026 11:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786040430; x=1786645230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pR5fYCk0X8hN/eOrWpXVmvoDvhwwi8kseySEtQ/l7/c=;
        b=N8qyODYClcF78YtriXqEGF6tQA1oohl7FP5OmKFZTxKD0CO4rExfcScZk3SCfY/Gjd
         77Yg4Ytof0G2jrCU6i7SXEmf4svTMPOrSSVqYPfj1VV+ndEcJEZB6laRmxNb4GM3iCHY
         GSXs092BKQ9W4aJ1Yq5EqG0v/nqoQKPFlMBsSD7BCX4P99TwpzMOtzxbX9WoS3DcM3JM
         0XIysrMoR2ch9JerIZ+rrlSSbvnOkAoEnbPGvO/3zwMsIPtK5cKWS8M80xRsaLzdrmb8
         YL13OJcD1sJwjrbieNLCahD//zGHMLPemK7hSUoHaiDW9z16VBimJsRTTWKzBfBBjy9i
         6jmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786040430; x=1786645230;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pR5fYCk0X8hN/eOrWpXVmvoDvhwwi8kseySEtQ/l7/c=;
        b=MQj/cSpSr3M053Qvpqy4fWOrPfcjfdwe+gM1E4BSqVXl0UXkMSeFTY0+euTIpDrygb
         ljymFkTiYiOl79pr2Gpqa9rbS0UD/XrmzWqn9OInlsxa3f2MpeVez73RW2vOzIAWf1Ec
         RmwpVrW+2DPMNndsNZ1Tz0HB8UnMWnnaE1yKGXcgdeyUZGA/dMP4qG+ue20ipI+7rlLE
         qNPIsletAVVA8fYADKA6/FSI8iqobLBdjTEfulUnpUz2OKNOS2CjsQMiayMYWR0ABEDb
         TbT0AjflXAO11VUgSevRL6fqMl1nbwcuJfzZOxQk+HbMivtzJW+fKtX9Jmsuojf1YizO
         mNtg==
X-Forwarded-Encrypted: i=1; AHgh+RowwbU836O0XmBsEePGLT6DwLGjY8oTlanAM8NwfJZ+T1xyyhRvYQ413v9mt8dZ6WXkYH+QuTeK2g0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG4KOIHbV0qPIbzeqX8aetw8NzCNLkPMn0FvrylHD81pSoPdUS
	BmSfZna0jR4nwo/eqOCHHerSyLH1mAM9RW630sCS0WUDRnDO+Ik55lVE
X-Gm-Gg: AR+sD12O2nbCn5FXE2xxKUFqGSTUjzKSPQofEKaGjs5mYVjEt3FmahOukNXbnBYCrxJ
	IHcjVDLAY3wJWYs9nxjY1apO24wnVZzjkKS205fMYzAv6EHif4ao9KivSI5ywmrnc/sbqsBD3W8
	6ZV/UIM24njNsCFiOoEr+Nnuonv4D1pXSW8ryJ/TyUFOd+nIABA1ZTuupxTHEwz9X3/Q8ujADHY
	qlo0JkdU1DIhsAZDmjWy46y4tCRq4yNK3+veaDnVo9LDVTpJ5D/HzNGbY71emPJIuSZQICgPPwh
	PFXEc+zpTwah2we+jZZLOi9K9pH53j3s0GgZk4A+JSj8KQaZ5W+OEEspdvRoVyM2SIEQzrjCObn
	uLXkQ5SjQAsWHazlStLP0jb1UkUQWoS7QOlZD7CSgDkwvVzME8lagjTdCz24qrmzFsmTaDr+fq4
	3fupyam1AiIeYHTOwZ0sLF74Bk7lWoyOjY0/YoQWMe3Jg5vpRbXdnvEt+Xc66xv6B1D3923jofa
	75eg9ZcqhcPlQm0Q0hzhwtJJNgfcI5o0pjxuPtmyGTFFFRzMsjGp+yXH9nszk0evpuS8U83Zt6M
	ZKqZcCNEuZacDgKD24hcaeo=
X-Received: by 2002:a17:90b:5448:b0:390:3936:8760 with SMTP id 98e67ed59e1d1-3903bb0cf4amr12946316a91.0.1786040430267;
        Thu, 06 Aug 2026 11:20:30 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085f2b2easm2003356a91.11.2026.08.06.11.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 11:20:29 -0700 (PDT)
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
Subject: [PATCH v3 08/16] docs/zh_TW: process: localize terminology in stable-kernel-rules.rst
Date: Fri,  7 Aug 2026 02:19:41 +0800
Message-ID: <20260806181949.65648-9-chenyou910331@gmail.com>
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

Retranslate from the current English text, which was heavily
restructured upstream (three submission options, stable tag variants,
tree list), and localize mainland terms to Taiwanese Mandarin
(內核→核心, 隊列→佇列, 數據→資料, ...).

update to commit 10466b17af65 ("docs: stable-kernel-rules: fix typo
sent->send")

Reviewed-by: Weijie Yuan <wy@wyuan.org>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/stable-kernel-rules.rst     | 256 ++++++++++++++----
 1 file changed, 208 insertions(+), 48 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/stable-kernel-rules.rst b/Documentation/translations/zh_TW/process/stable-kernel-rules.rst
index 2f8f064f8629..7d286ad54f2e 100644
--- a/Documentation/translations/zh_TW/process/stable-kernel-rules.rst
+++ b/Documentation/translations/zh_TW/process/stable-kernel-rules.rst
@@ -6,7 +6,7 @@
 
 :Original: :ref:`Documentation/process/stable-kernel-rules.rst <stable_kernel_rules>`
 
-如果想評論或更新本文的內容，請直接聯繫原文檔的維護者。如果你使用英文
+如果想評論或更新本文的內容，請直接聯繫原文件的維護者。如果你使用英文
 交流有困難的話，也可以向中文版維護者求助。如果本翻譯更新不及時或者翻
 譯存在問題，請聯繫中文版維護者::
 
@@ -16,53 +16,213 @@
             - 李陽  Li Yang <leoyang.li@nxp.com>
             - Kangkai Yin <e12051@motorola.com>
             - 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+            - 葉宸佑 Chen-Yu Yeh <chenyou910331@gmail.com>
 
-所有你想知道的事情 - 關於linux穩定版發佈
-========================================
-
-關於Linux 2.6穩定版發佈，所有你想知道的事情。
-
-關於哪些類型的補丁可以被接收進入穩定版代碼樹，哪些不可以的規則：
-----------------------------------------------------------------
-
-  - 必須是顯而易見的正確，並且經過測試的。
-  - 連同上下文，不能大於100行。
-  - 必須只修正一件事情。
-  - 必須修正了一個給大家帶來麻煩的真正的bug（不是“這也許是一個問題...”
-    那樣的東西）。
-  - 必須修正帶來如下後果的問題：編譯錯誤（對被標記爲CONFIG_BROKEN的例外），
-    內核崩潰，掛起，數據損壞，真正的安全問題，或者一些類似“哦，這不
-    好”的問題。簡短的說，就是一些致命的問題。
-  - 沒有“理論上的競爭條件”，除非能給出競爭條件如何被利用的解釋。
-  - 不能存在任何的“瑣碎的”修正（拼寫修正，去掉多餘空格之類的）。
-  - 必須被相關子系統的維護者接受。
-  - 必須遵循Documentation/translations/zh_CN/process/submitting-patches.rst裏的規則。
-
-向穩定版代碼樹提交補丁的過程：
-------------------------------
-
-  - 在確認了補丁符合以上的規則後，將補丁發送到stable@vger.kernel.org。
-  - 如果補丁被接受到隊列裏，發送者會收到一個ACK回覆，如果沒有被接受，收
-    到的是NAK回覆。回覆需要幾天的時間，這取決於開發者的時間安排。
-  - 被接受的補丁會被加到穩定版本隊列裏，等待其他開發者的審查。
-  - 安全方面的補丁不要發到這個列表，應該發送到security@kernel.org。
-
-審查週期：
-----------
+所有你想知道的事情 - 關於Linux -stable 版本發布
+===============================================
+
+關於哪些類型的補丁會被接收進入 "-stable" 樹、哪些不會被接收的規則：
+
+- 該補丁或一個等效的修復必須已經存在於Linux主線（上游）。
+- 它必須是顯而易見正確的，並且經過測試的。
+- 連同上下文，它不能大於100行。
+- 它必須遵循
+  :ref:`Documentation/process/submitting-patches.rst <submittingpatches>`
+  裡的規則。
+- 它必須要麼修復一個困擾人們的真實的缺陷，要麼只是添加一個裝置ID。
+  對於前者，詳細來說：
+
+  - 它修復的問題，像是oops、當機、資料損壞、真實的安全問題、硬體怪癖
+    （hardware quirk）、建置錯誤（但不包括標記為CONFIG_BROKEN的東西），
+    或者一些“喔，這可不好”之類的問題。
+  - 發行版核心的使用者所報告的嚴重問題，如果修復的是顯著的效能或互動性
+    問題，也可以被考慮。由於這些修復不那麼顯而易見，並且有較高的風險引入
+    不易察覺的迴歸，它們應該只由發行版核心的維護者提交，並附上補充說明，
+    給出指向bugzilla條目（如果存在）的連結，以及關於使用者可見影響的額外
+    資訊。
+  - 不接受“這可能是一個問題...”之類的東西，比如“理論上的競爭條件”，除非
+    同時提供了缺陷如何被利用的解釋。
+  - 不接受對使用者沒有好處的“瑣碎”修復（拼寫更改、空白清理等）。
+
+
+向 -stable 樹提交補丁的流程
+---------------------------
+
+.. note::
+
+   安全補丁不應（只）由 -stable 審查流程處理，而應遵循
+   :ref:`Documentation/process/security-bugs.rst <securitybugs>`
+   的流程。
+
+要向 -stable 樹提交更改，有三個選項：
+
+1. 在你隨後提交到主線的補丁的描述中，加上一個“stable標籤”。
+2. 請求穩定版團隊撿取一個已經合併到主線的補丁。
+3. 向穩定版團隊提交一個與已合併到主線的更改等效的補丁。
+
+以下小節更詳細地描述每個選項。
+
+:ref:`tw_option_1` 是 **強烈** 推薦的做法，它最簡單也最常見。
+:ref:`tw_option_2` 主要用於提交時沒有考慮向後移植的更改。 :ref:`tw_option_3`
+是前兩個選項之外的替代方案，用於已合併到主線的補丁需要調整才能套用到較舊系列
+的情況（例如由於API變化）。
+
+使用選項2或3時，可以要求將你的更改包含到特定的穩定版系列中。這麼做時，要確保
+該修復或等效修復適用於、已提交到、或已經存在於所有仍在維護的較新穩定版樹中。
+這是為了防止使用者日後更新時可能遇到的迴歸，例如一個合併於5.19-rc1的修復被
+向後移植到5.10.y，卻沒有移植到5.15.y。
+
+.. _tw_option_1:
+
+選項1
+*****
+
+要讓你提交到主線的補丁之後被自動撿取到穩定版樹，請在簽署（sign-off）區加上
+這個標籤::
+
+  Cc: stable@vger.kernel.org
+
+當修復未公開的漏洞時，請改用 ``Cc: stable@kernel.org``：它可以降低透過
+'git send-email' 意外將修復公開的機會，因為發送到該地址的郵件不會被投遞到
+任何地方。
+
+補丁合併到主線後，它將被套用到穩定版樹，而無需作者或子系統維護者再做任何
+事情。
+
+要向穩定版團隊發送額外的指示，可使用shell風格的行內註解來傳遞任意的或預定義
+的備註：
+
+* 指明揀選（cherry pick）所需的額外補丁前置條件::
+
+    Cc: <stable@vger.kernel.org> # 3.3.x: a1f84a3: sched: Check for idle
+    Cc: <stable@vger.kernel.org> # 3.3.x: 1b9508f: sched: Rate-limit newidle
+    Cc: <stable@vger.kernel.org> # 3.3.x: fd21073: sched: Fix affinity logic
+    Cc: <stable@vger.kernel.org> # 3.3.x
+    Signed-off-by: Ingo Molnar <mingo@elte.hu>
+
+  上面標籤序列的含義為::
+
+    git cherry-pick a1f84a3
+    git cherry-pick 1b9508f
+    git cherry-pick fd21073
+    git cherry-pick <this commit>
+
+  注意，對於一個補丁系列，你不必把系列中已有的補丁列為前置條件。例如，如果
+  你有如下補丁系列::
+
+    patch1
+    patch2
+
+  其中patch2依賴patch1，如果你已經把patch1標記為穩定版收錄，就不必再把它列
+  為patch2的前置條件。
+
+* 指出核心版本的前置條件::
+
+    Cc: <stable@vger.kernel.org> # 3.3.x
+
+  該標籤的含義為::
+
+    git cherry-pick <this commit>
+
+  對每個從指定版本開始的“-stable”樹執行。
+
+  注意，如果穩定版團隊可以從Fixes:標籤推導出適當的版本，則無需這樣標記。
+
+* 延遲補丁的撿取::
 
-  - 當穩定版的維護者決定開始一個審查週期，補丁將被髮送到審查委員會，以
-    及被補丁影響的領域的維護者（除非提交者就是該領域的維護者）並且抄送
-    到linux-kernel郵件列表。
-  - 審查委員會有48小時的時間，用來決定給該補丁回覆ACK還是NAK。
-  - 如果委員會中有成員拒絕這個補丁，或者linux-kernel列表上有人反對這個
-    補丁，並提出維護者和審查委員會之前沒有意識到的問題，補丁會從隊列中
-    丟棄。
-  - 在審查週期結束的時候，那些得到ACK回應的補丁將會被加入到最新的穩定版
-    發佈中，一個新的穩定版發佈就此產生。
-  - 安全性補丁將從內核安全小組那裏直接接收到穩定版代碼樹中，而不是通過
-    通常的審查週期。請聯繫內核安全小組以獲得關於這個過程的更多細節。
-
-審查委員會：
-------------
-  - 由一些自願承擔這項任務的內核開發者，和幾個非志願的組成。
+    Cc: <stable@vger.kernel.org> # after -rc3
+
+* 指出已知的問題::
+
+    Cc: <stable@vger.kernel.org> # see patch description, needs adjustments for <= 6.3
+
+此外，stable標籤還有一種變體，可以讓穩定版團隊的向後移植工具（例如AUTOSEL
+或尋找含有'Fixes:'標籤的提交的腳本）忽略一個更改::
+
+     Cc: <stable+noautosel@kernel.org> # reason goes here, and must be present
+
+.. _tw_option_2:
+
+選項2
+*****
+
+如果補丁已經合併到主線，請發送一封電子郵件到stable@vger.kernel.org，內容
+包含補丁的標題、提交ID、你認為它應該被套用的原因，以及你希望它被套用到哪些
+核心版本。
+
+.. _tw_option_3:
+
+選項3
+*****
+
+在確認補丁符合上述規則後，將補丁發送到stable@vger.kernel.org，並註明你希望
+它被套用到的核心版本。這麼做時，你必須在你所提交補丁的更改日誌中註明上游的
+提交ID，並在提交說明文字上方以單獨一行標註，像這樣::
+
+  commit <sha1> upstream.
+
+或者::
+
+  [ Upstream commit <sha1> ]
+
+如果提交的補丁與原始的上游補丁有出入（例如因為需要為較舊的API調整），則必須
+在補丁描述中非常清楚地記錄並說明理由。
+
+
+提交之後
+--------
+
+當補丁被接受進入佇列後，發送者會收到一個ACK；如果補丁被拒絕，則會收到NAK。
+這個回覆可能需要幾天時間，取決於穩定版團隊成員的日程安排。
+
+如果被接受，補丁將被加入 -stable 佇列，供其他開發人員和相關子系統維護者
+審查。
+
+
+審查週期
+--------
+
+- 當 -stable 維護者決定進行審查週期時，補丁將被發送到審查委員會，以及補丁
+  影響領域的維護者（除非提交者就是該領域的維護者），並抄送到linux-kernel
+  郵件列表。
+- 審查委員會有48小時的時間對補丁作出ACK或NAK。
+- 如果補丁被委員會成員拒絕，或者linux-kernel列表上的成員反對這個補丁並提出
+  了維護者和委員會成員沒有意識到的問題，補丁將從佇列中移除。
+- 通過ACK的補丁將作為釋出候選（-rc）版本的一部分再次發布，以供開發人員和
+  測試人員測試。
+- 通常只會產生一個 -rc 版本，然而如果存在未解決的問題，某些補丁可能會被修改
+  或移除，或者有額外的補丁進入佇列。此後會發布更多的 -rc 版本並加以測試，
+  直到不再發現問題為止。
+- 可以在郵件列表上發送帶有任何所需測試資訊的“Tested-by:”郵件來回覆 -rc
+  版本。“Tested-by:”標籤將被收集並加入到發布提交中。
+- 在審查週期結束時，新的 -stable 版本將被發布，其中包含所有排隊的、經過測試
+  的補丁。
+- 安全補丁將由核心安全團隊直接接受進入 -stable 樹，而不經過正常的審查週期。
+  關於這一流程的更多細節，請聯繫核心安全團隊。
+
+
+樹
+--
+
+- 已完成版本和進行中版本的補丁佇列可以在以下位置找到：
+
+    https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git
+
+- 所有穩定版核心的最終定版並打上標籤的版本，可以在以下位置的每個版本各自的
+  分支中找到：
+
+    https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
+
+- 所有穩定版核心版本的釋出候選版本可以在以下位置找到：
+
+    https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/
+
+  .. warning::
+     -stable-rc 樹是stable-queue樹在某個時間點的快照，會頻繁變動，因此會經常
+     被rebase。它只應被用於測試目的（例如供CI系統使用）。
+
+
+審查委員會
+----------
 
+- 審查委員會由一些自願承擔這項任務的核心開發人員組成，還有幾位不是自願的。
-- 
2.43.0

