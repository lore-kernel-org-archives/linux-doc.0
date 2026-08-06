Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0DC48C8A5
	for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2026 18:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040440; cv=none; b=Y6LrrM1KKE3GOQk60LUbFRamJK9b9yjYtez+jnlUJ9t2X38GGyH2hX/LSeDtUEBykSPJlAu3JkkffEH+Z4Lo40iT3Zwvt76S9rCihwLFUVuNPa8J29A3fl/iPGZwzSE1beT2sCTDxZa47g9SNZwtsdYLt0Ywwy4ZwuAuDRiXmsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040440; c=relaxed/simple;
	bh=+MpQDrd5JodRX2o31QxyigaFGBjBSgjaJCIzClMHQAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q4FSaanxD9UQnrqr6TJoZp3dXn+vs4Wht9pjHwp4B0D1auC94YP0v6rfvinhANor10DV/Q7IQiT82XTfxU3Z0vbZW95S+Dyn5jhmMbkkLieBbng2cB3eSkaycp9A0Nvd4yplPfiHkOMg3IM5SioHd/cWodR4UrhlD83vvgo4gBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jcDu+pF6; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcDu+pF6"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-381f03d7be0so250735a91.1
        for <linux-doc@vger.kernel.org>; Thu, 06 Aug 2026 11:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786040435; x=1786645235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fp5QWjuhYHXv3QDu/Ae8vDK0Mo82ZSoKyOQ+CowSz64=;
        b=jcDu+pF6R7c8+ZMxO5FEG3D/yU23PS37j4gCxBd+ZNXATJNwTDYY0If+xo5wFv4YGu
         nTKoLm//P5BnPRktcZ5lxgqgH5NT6Qyw3+5MV5++7inS7j4UZyyAewXD1hytbFMAifLD
         DO89cVUeKNdHA4DGQwRMjsWf2OCDHcZr7QEU3xsiP40TMWd7Z5edd9h/EeeOBpviC+fd
         r1sO5yDJpXqUS6lt7uUmnvfUf41oRp43gdTIIo87rdBJkBrmnfQLF4ktNyxLMbegr2L5
         D/h0wGRZTWcvba98Nw4K1gKgVi91RIu1FfLJm7V5fzEAeM1zrFblGmXEEdjnBVh+jdnC
         5q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786040435; x=1786645235;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fp5QWjuhYHXv3QDu/Ae8vDK0Mo82ZSoKyOQ+CowSz64=;
        b=siJfOUlA3TGVcIJCR1yhrs/1jIx0h8jFm8Z+kARKNirP20mlZq0lvZHveSpQFsVTER
         pKI8LU/VOS0Q1yAxM0t7+PZ+b0z2bMs9WiSRp8KE+m9Br8Bg6eI0Y9ReGcJ8ijOenjwe
         90LwRZdfYERytWDZrvMWQhj6yR1D/tJ5aF0AMLSNf+IapNGfkgTJH+Ahu/QKWPm77UVr
         oY0sYUGtVHIQPf2oHCcOmEK7IAOAuc6tDowILEaN8Yh5I4R8b1qFVLba5WmwFBxITN56
         8SLi8axo9XDRZTbBOv1VQjOF3k20HEDijmqri7qY2C/H6OJ5SOXHhNcvtxofRqnmZkXI
         kSjA==
X-Forwarded-Encrypted: i=1; AHgh+RpdB+nEMN1jii8JNnkPHw9TEBSZyy46zaD6JlmFWbkycVxHuN1pZZFOUBAj8QzyjfAv/cykBIhO9PQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCXjFO7VxY9Lz/SLZ4l9j5jpVTxvxWrmTneSjuRisboLHx0swX
	qzk5jfutVpN5DhZVl/b4D3qn/tcxpjVWGPhATpBDsPwgQBHWxEFpw6+U
X-Gm-Gg: AR+sD12ajT/xqF5QXjjS+Vbwdmkp2Ct/3ykatAWaYYBzVscX/gNe48Rhh/fLEl4lQpZ
	G6ncfTTyeBF0dubi4J2745OunajNrllzlrUqHmtIFmbM3PDxNBCNfOAnkAHLV8N+CkDX2UOn9B7
	0p+7gvYg++kHKCnaZkkugVwlv+pJ8s52rFsdJw1H++2edX6ldmXWZvg3fgtWixDst+xgpQuLGGj
	wLoh2eMmuGChovVRerLl5ze6wLYVsTdLw0l7T3epwLdCK3hz+ZEyHqieHiiSwFMX3I2EQ+8Jsg9
	Q5vUiYhWfMqrBgxNjRUc4hKSTh3HwGk/6xBPBmrW58UVYVHrKdkrmVAnDv1xCfonPIXs3PMoFGg
	5VUYRrNioTJQnuwSVw5w98n2/CcDpmFOA5tHVRsZh4kf+5Qb1sLsu6KstLqnmzr0+rT3Ca/Zb8z
	1vC20fCi12r1cyM70Kr2KTKl9a2M/BZ8JfbGBxN+MLpt/hLLhyqb2kifvqXt2xX/vHDv+GQKG6I
	pgm4jlm+Tch65YtOEg8L/PGM8PalzpQdEmJ3Bvo/kGh+4tfvq29gRXOMzdiQbl81gC2+lkPuCC+
	iRPZTqWL4ztGt4ty2KH1rvsU+IWJ/5n68A==
X-Received: by 2002:a17:90b:1848:b0:381:77cd:38ca with SMTP id 98e67ed59e1d1-3903c7395b1mr12633259a91.4.1786040433997;
        Thu, 06 Aug 2026 11:20:33 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085f2b2easm2003356a91.11.2026.08.06.11.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 11:20:33 -0700 (PDT)
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
Subject: [PATCH v3 09/16] docs/zh_TW: process: localize terminology in 5.Posting.rst
Date: Fri,  7 Aug 2026 02:19:42 +0800
Message-ID: <20260806181949.65648-10-chenyou910331@gmail.com>
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

Localize mainland terms to Taiwanese Mandarin (內核→核心, 代碼→程式碼,
通過→透過, ...) and sync with the English original: add the testing/
KUnit advice, the Fixes:/Link:/Closes: tag paragraphs, the Suggested-by:
tag, and the updated rules about tagging other people.
Also point cross-references at the zh_TW translations instead of
zh_CN.

update to commit 0a83293322fd ("doc: development-process: add notice on
testing")

Reviewed-by: Weijie Yuan <wy@wyuan.org>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../translations/zh_TW/process/5.Posting.rst  | 235 ++++++++++--------
 1 file changed, 136 insertions(+), 99 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/5.Posting.rst b/Documentation/translations/zh_TW/process/5.Posting.rst
index 38f3a6d618eb..698cde5cd06d 100644
--- a/Documentation/translations/zh_TW/process/5.Posting.rst
+++ b/Documentation/translations/zh_TW/process/5.Posting.rst
@@ -12,73 +12,78 @@
 
  吳想成 Wu XiangCheng <bobwxc@email.cn>
  胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+ 葉宸佑 Chen-Yu Yeh <chenyou910331@gmail.com>
 
 .. _tw_development_posting:
 
-發佈補丁
+發布補丁
 ========
 
-您的工作遲早會準備好提交給社區進行審查，並最終包含到主線內核中。毫不稀奇，
-內核開發社區已經發展出一套用於發佈補丁的約定和過程；遵循這些約定和過程將使
-參與其中的每個人的生活更加輕鬆。本文檔試圖描述這些約定的部分細節；更多信息
-也可在以下文檔中找到
-:ref:`Documentation/translations/zh_CN/process/submitting-patches.rst <tw_submittingpatches>`
-和 :ref:`Documentation/translations/zh_CN/process/submit-checklist.rst <tw_submitchecklist>`。
+您的工作遲早會準備好提交給社群進行審查，並最終包含到主線核心中。毫不稀奇，
+核心開發社群已經發展出一套用於發布補丁的約定和過程；遵循這些約定和過程將使
+參與其中的每個人的生活更加輕鬆。本文件試圖描述這些約定的部分細節；更多資訊
+也可在以下文件中找到
+:ref:`Documentation/translations/zh_TW/process/submitting-patches.rst <tw_submittingpatches>`
+和
+:ref:`Documentation/translations/zh_TW/process/submit-checklist.rst <tw_submitchecklist>`。
 
 何時寄送
 --------
 
-在補丁完全“準備好”之前，避免發佈補丁是一種持續的誘惑。對於簡單的補丁，這
-不是問題。但是如果正在完成的工作很複雜，那麼在工作完成之前從社區獲得反饋就
-可以獲得很多好處。因此，您應該考慮發佈正在進行的工作，甚至維護一個可用的Git
+在補丁完全“準備好”之前，避免發布補丁是一種持續的誘惑。對於簡單的補丁，這
+不是問題。但是如果正在完成的工作很複雜，那麼在工作完成之前從社群獲得反饋就
+可以獲得很多好處。因此，您應該考慮發布正在進行的工作，甚至維護一個可用的Git
 樹，以便感興趣的開發人員可以隨時趕上您的工作。
 
-當發佈中有尚未準備好被包含的代碼，最好在發佈中說明。還應提及任何有待完成的
-主要工作和任何已知問題。很少有人會願意看那些被認爲是半生不熟的補丁，但是
-那些願意的人會帶着他們的點子來一起幫助你把工作推向正確的方向。
+當發布中有尚未準備好被包含的程式碼，最好在發布中說明。還應提及任何有待完成的
+主要工作和任何已知問題。很少有人會願意看那些被認為是半生不熟的補丁，但是
+那些願意的人會帶著他們的點子來一起幫助你把工作推向正確的方向。
 
-創建補丁之前
+建立補丁之前
 ------------
 
-在考慮將補丁發送到開發社區之前，有許多事情應該做。包括：
+在考慮將補丁發送到開發社群之前，有許多事情應該做。包括：
 
- - 儘可能地測試代碼。利用內核的調試工具，確保內核使用了所有可能的配置選項組合
-   進行構建，使用交叉編譯器爲不同的體系結構進行構建等。
+ - 儘可能地測試程式碼。利用核心的除錯工具，確保核心使用了所有可能的設定選
+   項組合進行建置，使用交叉編譯器為不同的架構進行建置等。添加測試，最好使
+   用現有的測試框架（如KUnit），並將其作為補丁系列中單獨的一員（關於補丁系
+   列，見下一節）。注意，對某些子系統而言這可能是強制性的。例如，函式庫函
+   式（位於lib/下）幾乎在所有地方被廣泛使用，應當有適當的測試。
 
- - 確保您的代碼符合內核代碼風格指南。
+ - 確保您的程式碼符合核心程式碼風格指南。
 
- - 您的更改是否具有性能影響？如果是這樣，您應該運行基準測試來顯示您的變更的
+ - 您的更改是否具有效能影響？如果是這樣，您應該執行基準測試來顯示您的變更的
    影響（或好處）；結果的摘要應該包含在補丁中。
 
- - 確保您有權發佈代碼。如果這項工作是爲僱主完成的，僱主對這項工作具有所有權，
-   並且必須同意根據GPL對其進行發佈。
+ - 確保您有權發布程式碼。如果這項工作是為僱主完成的，僱主對這項工作具有所
+   有權，並且必須同意根據GPL對其進行發布。
 
-一般來說，在發佈代碼之前進行一些額外的思考，幾乎總是能在短時間內得到回報。
+一般來說，在發布程式碼之前進行一些額外的思考，幾乎總是能在短時間內得到回報。
 
 補丁準備
 --------
 
-準備補丁發佈的工作量可能很驚人，但在此嘗試節省時間通常是不明智的，即使在短期
+準備補丁發布的工作量可能很驚人，但在此嘗試節省時間通常是不明智的，即使在短期
 內亦然。
 
-必須針對內核的特定版本準備補丁。一般來說，補丁應該基於Linus的Git樹中的當前
-主線。當以主線爲基礎時，請從一個衆所周知的發佈點開始——如穩定版本或 -rc
-版本發佈點——而不是在一個任意的主線分支點。
+必須針對核心的特定版本準備補丁。一般來說，補丁應該基於Linus的Git樹中的當前
+主線。當以主線為基礎時，請從一個衆所周知的發布點開始——如穩定版本或 -rc
+版本發布點——而不是在一個任意的主線分支點。
 
-也可能需要針對-mm、linux-next或子系統樹生成版本，以便於更廣泛的測試和審查。
+也可能需要針對-mm、linux-next或子系統樹產生版本，以便於更廣泛的測試和審查。
 根據補丁的區域以及其他地方的情況，針對其他樹建立的補丁可能需要大量的工作來
 解決衝突和處理API更改。
 
-只有最簡單的更改才應格式化爲單個補丁；其他所有更改都應作爲一系列邏輯更改進行。
-分割補丁是一門藝術；一些開發人員花了很長時間來弄清楚如何按照社區期望的方式來
+只有最簡單的更改才應格式化為單個補丁；其他所有更改都應作為一系列邏輯更改進行。
+分割補丁是一門藝術；一些開發人員花了很長時間來弄清楚如何按照社群期望的方式來
 分割。不過，這些經驗法則也許有幫助：
 
- - 您發佈的補丁系列幾乎肯定不會是開發過程中版本控制系統中的一系列更改。相反，
+ - 您發布的補丁系列幾乎肯定不會是開發過程中版本控制系統中的一系列更改。相反，
    需要對您所做更改的最終形式加以考慮，然後以有意義的方式進行拆分。開發人員對
    離散的、自包含的更改感興趣，而不是您創造這些更改的原始路徑。
 
- - 每個邏輯上獨立的變更都應該格式化爲單獨的補丁。這些更改可以是小的（如“向
-   此結構體添加字段”）或大的（如添加一個重要的新驅動程序），但它們在概念上
+ - 每個邏輯上獨立的變更都應該格式化為單獨的補丁。這些更改可以是小的（如“向
+   此結構體添加欄位”）或大的（如添加一個重要的新驅動程式），但它們在概念上
    應該是小的，並且可以在一行內簡述。每個補丁都應該做一個特定的、可以單獨
    檢查並驗證它所做的事情的更改。
 
@@ -86,132 +91,164 @@
    一個補丁修復了一個關鍵的安全漏洞，又重新排列了一些結構，還重新格式化了代
    碼，那麼它很有可能會被忽略，從而導致重要的修復丟失。
 
- - 每個補丁都應該能創建一個可以正確地構建和運行的內核；如果補丁系列在中間被
-   斷開，那麼結果仍應是一個正常工作的內核。部分應用一系列補丁是使用
-   “git bisct”工具查找回歸的一個常見場景；如果結果是一個損壞的內核，那麼將使
-   那些從事追蹤問題的高尚工作的開發人員和用戶的生活更加艱難。
+ - 每個補丁都應該能建立一個可以正確地建置和執行的核心；如果補丁系列在中間被
+   斷開，那麼結果仍應是一個正常工作的核心。部分應用一系列補丁是使用
+   “git bisct”工具查找回歸的一個常見場景；如果結果是一個損壞的核心，那麼將使
+   那些從事追蹤問題的高尚工作的開發人員和使用者的生活更加艱難。
 
- - 不要過分分割。一位開發人員曾經將一組針對單個文件的編輯分成500個單獨的補丁
-   發佈，這並沒有使他成爲內核郵件列表中最受歡迎的人。一個補丁可以相當大，
+ - 不要過分分割。一位開發人員曾經將一組針對單一檔案的編輯分成500個單獨的補丁
+   發布，這並沒有使他成為核心郵件列表中最受歡迎的人。一個補丁可以相當大，
    只要它仍然包含一個單一的 *邏輯* 變更。
 
- - 用一系列補丁添加一個全新的基礎設施，但是該設施在系列中的最後一個補丁啓用
+ - 用一系列補丁添加一個全新的基礎設施，但是該設施在系列中的最後一個補丁啟用
    整個變更之前不能使用，這看起來很誘人。如果可能的話，應該避免這種誘惑；
    如果這個系列增加了迴歸，那麼二分法將指出最後一個補丁是導致問題的補丁，
-   即使真正的bug在其他地方。只要有可能，添加新代碼的補丁程序應該立即激活該
-   代碼。
+   即使真正的bug在其他地方。只要有可能，添加新程式碼的補丁程式應該立即激活該
+   程式碼。
 
-創建完美補丁系列的工作可能是一個令人沮喪的過程，在完成“真正的工作”之後需要
+建立完美補丁系列的工作可能是一個令人沮喪的過程，在完成“真正的工作”之後需要
 花費大量的時間和思考。但是如果做得好，花費的時間就是值得的。
 
 補丁格式和更改日誌
 ------------------
 
-所以現在你有了一系列完美的補丁可以發佈，但是這項工作還沒有完成。每個補丁都
-需要被格式化成一條消息，以快速而清晰地將其目的傳達到世界其他地方。爲此，
+所以現在你有了一系列完美的補丁可以發布，但是這項工作還沒有完成。每個補丁都
+需要被格式化成一條訊息，以快速而清晰地將其目的傳達到世界其他地方。為此，
 每個補丁將由以下部分組成：
 
- - 可選的“From”行，表明補丁作者。只有當你通過電子郵件發送別人的補丁時，這一行
-   纔是必須的，但是爲防止疑問加上它也不會有什麼壞處。
+ - 可選的“From”行，表明補丁作者。只有當你透過電子郵件發送別人的補丁時，這一行
+   才是必須的，但是為防止疑問加上它也不會有什麼壞處。
 
- - 一行描述，說明補丁的作用。對於在沒有其他上下文的情況下看到該消息的讀者來說，
-   該消息應足以確定修補程序的範圍；此行將顯示在“short form（簡短格式）”變更
-   日誌中。此消息通常需要先加上子系統名稱前綴，然後是補丁的目的。例如：
+ - 一行描述，說明補丁的作用。對於在沒有其他上下文的情況下看到該訊息的讀者
+   來說，該訊息應足以確定修補程式的範圍；此行將顯示在“short form（簡短格式）”
+   變更日誌中。此訊息通常需要先加上子系統名稱前綴，然後是補丁的目的。例如：
 
    ::
 
         gpio: fix build on CONFIG_GPIO_SYSFS=n
 
- - 一行空白，後接補丁內容的詳細描述。此描述可以是任意需要的長度；它應該說明補丁
-   的作用以及爲什麼它應該應用於內核。
+ - 一行空白，後接補丁內容的詳細描述。此描述可以是任意需要的長度；它應該說
+   明補丁的作用以及為什麼它應該應用於核心。
 
  - 一個或多個標記行，至少有一個由補丁作者的 Signed-off-by 簽名。標記將在下面
    詳細描述。
 
-上面的項目一起構成補丁的變更日誌。寫一則好的變更日誌是一門至關重要但常常被
+上面的專案一起構成補丁的變更日誌。寫一則好的變更日誌是一門至關重要但常常被
 忽視的藝術；值得花一點時間來討論這個問題。當你編寫變更日誌時，你應該記住有
 很多不同的人會讀你的話。其中包括子系統維護人員和審查人員，他們需要決定是否
-應該合併補丁，分銷商和其他維護人員試圖決定是否應該將補丁反向移植到其他內核，
-缺陷搜尋人員想知道補丁是否導致他們正在追查的問題，以及想知道內核如何變化的
-用戶等等。一個好的變更日誌以最直接和最簡潔的方式向所有這些人傳達所需的信息。
+應該合併補丁，分銷商和其他維護人員試圖決定是否應該將補丁反向移植到其他核心，
+缺陷搜尋人員想知道補丁是否導致他們正在追查的問題，以及想知道核心如何變化的
+使用者等等。一個好的變更日誌以最直接和最簡潔的方式向所有這些人傳達所需的資訊。
 
 在結尾，總結行應該描述變更的影響和動機，以及在一行約束條件下可能發生的變化。
-然後，詳細的描述可以詳述這些主題，並提供任何需要的附加信息。如果補丁修復了
+然後，詳細的描述可以詳述這些主題，並提供任何需要的附加資訊。如果補丁修復了
 一個缺陷，請引用引入該缺陷的提交（如果可能，請在引用提交時同時提供其 id 和
 標題）。如果某個問題與特定的日誌或編譯器輸出相關聯，請包含該輸出以幫助其他
-人搜索同一問題的解決方案。如果更改是爲了支持以後補丁中的其他更改，那麼應當
+人搜索同一問題的解決方案。如果更改是為了支援以後補丁中的其他更改，那麼應當
 說明。如果更改了內部API，請詳細說明這些更改以及其他開發人員應該如何響應。
-一般來說，你越把自己放在每個閱讀你變更日誌的人的位置上，變更日誌（和內核
-作爲一個整體）就越好。
+一般來說，你越把自己放在每個閱讀你變更日誌的人的位置上，變更日誌（和核心
+作為一個整體）就越好。
 
-不需要說，變更日誌是將變更提交到版本控制系統時使用的文本。接下來將是：
+不需要說，變更日誌是將變更提交到版本控制系統時使用的文字。接下來將是：
 
- - 補丁本身，採用統一的（“-u”）補丁格式。使用“-p”選項來diff將使函數名與
+ - 補丁本身，採用統一的（“-u”）補丁格式。使用“-p”選項來diff將使函式名與
    更改相關聯，從而使結果補丁更容易被其他人讀取。
 
-上面提到的標籤（tag）用於描述各種開發人員如何與這個補丁的開發相關聯。
-:ref:`Documentation/translations/zh_CN/process/submitting-patches.rst <tw_submittingpatches>`
-文檔中對它們進行了詳細描述；下面是一個簡短的總結。每一行的格式如下：
+前面已簡要提到的標籤（tag）用於提供補丁如何產生的線索。
+:ref:`Documentation/translations/zh_TW/process/submitting-patches.rst <tw_submittingpatches>`
+文件中對它們進行了詳細描述；下面是一個簡短的總結。
 
-::
+有一種標籤用於引用引入了本補丁所修復問題的較早提交::
+
+	Fixes: 1f2e3d4c5b6a ("The first line of the commit specified by the first 12 characters of its SHA-1 ID")
+
+另一種標籤用於連結帶有額外背景或細節的網頁，例如導致此補丁的較早討論，或
+一份由此補丁實作的規格文件::
+
+	Link: https://example.com/somewhere.html  optional-other-stuff
+
+依照企鵝老大（Chief Penguin）的指導，只有當Link:標籤指向的有用資訊無法在
+提交本身中找到時，才應該把它加到提交中。
+
+如果URL指向此補丁所修復的公開缺陷報告，請改用“Closes:”標籤::
+
+	Closes: https://example.com/issues/1234  optional-other-stuff
+
+一些缺陷追蹤系統能夠在帶有此類標籤的提交被套用時自動關閉問題。一些監控
+郵件列表的機器人也會追蹤這類標籤並採取相應動作。私有缺陷追蹤系統和無效
+的URL是被禁止的。
+
+另一種標籤用於記錄誰參與了補丁的開發。它們每個都使用如下格式::
 
 	tag: Full Name <email address>  optional-other-stuff
 
 常用的標籤有：
 
- - Signed-off-by: 這是一個開發人員的證明，證明他或她有權提交補丁以包含到內核
-   中。這表明同意開發者來源認證協議，其全文見
-   :ref:`Documentation/translations/zh_CN/process/submitting-patches.rst <tw_submittingpatches>`
+ - Signed-off-by: 這是一個開發人員的證明，證明他或她有權提交補丁以包含到核
+   心中。這表明同意開發者來源認證協議，其全文見
+   :ref:`Documentation/translations/zh_TW/process/submitting-patches.rst <tw_submittingpatches>`
    如果沒有合適的簽字，則不能合併到主線中。
 
- - Co-developed-by: 聲明補丁是由多個開發人員共同創建的；當幾個人在一個補丁上
-   工作時，它用於給出共同作者（除了 From: 所給出的作者之外）。由於
-   Co-developed-by: 表示作者身份，所以每個共同開發人，必須緊跟在相關合作作者
-   的Signed-off-by之後。具體內容和示例見以下文件
-   :ref:`Documentation/translations/zh_CN/process/submitting-patches.rst <tw_submittingpatches>`
+ - Co-developed-by: 聲明補丁是由多個開發人員共同建立的；當幾個人在一個補丁
+   上工作時，它用於給出共同作者（除了 From: 所給出的作者之外）。由於
+   Co-developed-by: 表示作者身份，所以每個共同開發人，必須緊跟在相關合作作
+   者的Signed-off-by之後。具體內容和範例見以下文件
+   :ref:`Documentation/translations/zh_TW/process/submitting-patches.rst <tw_submittingpatches>`
 
- - Acked-by: 表示另一個開發人員（通常是相關代碼的維護人員）同意補丁適合包含
-   在內核中。
+ - Acked-by: 表示另一個開發人員（通常是相關程式碼的維護人員）同意補丁適合包含
+   在核心中。
 
  - Tested-by: 聲明某人已經測試了補丁並確認它可以工作。
 
- - Reviewed-by: 表示某開發人員已經審查了補丁的正確性；有關詳細信息，請參閱
-   :ref:`Documentation/translations/zh_CN/process/submitting-patches.rst <tw_submittingpatches>`
+ - Reviewed-by: 表示某開發人員已經審查了補丁的正確性；有關詳細資訊，請參閱
+   :ref:`Documentation/translations/zh_TW/process/submitting-patches.rst <tw_submittingpatches>`
+
+ - Reported-by: 指定報告此補丁修復的問題的使用者；此標籤用於向測試我們的
+   程式碼並在發現問題時告知我們的人們（他們常常沒有得到應有的重視）表示
+   感謝。注意，此標籤後面應跟隨指向該報告的Closes:標籤，除非該報告無法在
+   網路上取得。如果補丁只修復了所報告問題的一部分，可以用Link:標籤代替
+   Closes:。
 
- - Reported-by: 指定報告此補丁修復的問題的用戶；此標記用於表示感謝。
+ - Suggested-by: 標籤表明補丁的想法是由被指名者建議的，確保其想法獲得
+   讚譽。希望這能激勵他們在未來繼續幫助我們。
 
  - Cc：指定某人收到了補丁的副本，並有機會對此發表評論。
 
-在補丁中添加標籤時要小心：只有Cc:才適合在沒有指定人員明確許可的情況下添加。
+在補丁中添加上述標籤時要小心：除了Cc:、Reported-by:和Suggested-by:之外，
+所有標籤都需要被指名者的明確許可。對於這三個標籤，如果根據lore存檔或提交
+歷史，該人曾以該名字和電子郵件地址對Linux核心做出過貢獻，那麼隱含的許可
+就足夠了——並且對於Reported-by:和Suggested-by:，報告或建議必須是公開作出
+的。注意，就此而言bugzilla.kernel.org是公開場所，但其中使用的電子郵件地址
+是私密的；因此不要在標籤中暴露它們，除非該人在先前的貢獻中使用過。
 
 寄送補丁
 --------
 
 在寄送補丁之前，您還需要注意以下幾點：
 
- - 您確定您的郵件發送程序不會損壞補丁嗎？被郵件客戶端更改空白或修飾了行的補丁
+ - 您確定您的郵件發送程式不會損壞補丁嗎？被郵件客戶端更改空白或修飾了行的補丁
    無法被另一端接受，並且通常不會進行任何詳細檢查。如果有任何疑問，先把補丁寄
    給你自己，讓你自己確定它是完好無損的。
 
-   :ref:`Documentation/translations/zh_CN/process/email-clients.rst <tw_email_clients>`
+   :ref:`Documentation/translations/zh_TW/process/email-clients.rst <tw_email_clients>`
    提供了一些有用的提示，可以讓特定的郵件客戶端正常發送補丁。
 
- - 你確定你的補丁沒有荒唐的錯誤嗎？您應該始終通過scripts/checkpatch.pl檢查
-   補丁程序，並解決它提出的問題。請記住，checkpatch.pl，雖然體現了對內核補丁
+ - 你確定你的補丁沒有荒唐的錯誤嗎？您應該始終透過scripts/checkpatch.pl檢查
+   補丁程式，並解決它提出的問題。請記住，checkpatch.pl，雖然體現了對核心補丁
    應該是什麼樣的大量思考，但它並不比您聰明。如果修復checkpatch.pl給的問題會
-   使代碼變得更糟，請不要這樣做。
+   使程式碼變得更糟，請不要這樣做。
 
-補丁應始終以純文本形式發送。請不要將它們作爲附件發送；這使得審閱者在答覆中更難
-引用補丁的部分。相反，只需將補丁直接放到您的消息中。
+補丁應始終以純文字形式發送。請不要將它們作為附件發送；這使得審閱者在答覆中更難
+引用補丁的部分。相反，只需將補丁直接放到您的訊息中。
 
-寄出補丁時，重要的是將副本發送給任何可能感興趣的人。與其他一些項目不同，內核
-鼓勵人們甚至錯誤地發送過多的副本；不要假定相關人員會看到您在郵件列表中的發佈。
+寄出補丁時，重要的是將副本發送給任何可能感興趣的人。與其他一些專案不同，核心
+鼓勵人們甚至錯誤地發送過多的副本；不要假定相關人員會看到您在郵件列表中的發布。
 尤其是，副本應發送至：
 
- - 受影響子系統的維護人員。如前所述，維護人員文件是查找這些人員的首選地方。
+ - 受影響子系統的維護人員。如前所述，MAINTAINERS檔案是查找這些人員的首選地方。
 
- - 其他在同一領域工作的開發人員，尤其是那些現在可能在那裏工作的開發人員。使用
-   git查看還有誰修改了您正在處理的文件，這很有幫助。
+ - 其他在同一領域工作的開發人員，尤其是那些現在可能在那裡工作的開發人員。使用
+   git查看還有誰修改了您正在處理的檔案，這很有幫助。
 
  - 如果您對某錯誤報告或功能請求做出響應，也可以抄送原始發送人。
 
@@ -221,9 +258,9 @@
    補丁副本也應發到stable@vger.kernel.org 。另外，在補丁本身的標籤中添加一個
    “Cc: stable@vger.kernel.org”；這將使穩定版團隊在修復進入主線時收到通知。
 
-當爲一個補丁選擇接收者時，最好清楚你認爲誰最終會接受這個補丁並將其合併。雖然
+當為一個補丁選擇接收者時，最好清楚你認為誰最終會接受這個補丁並將其合併。雖然
 可以將補丁直接發給Linus Torvalds並讓他合併，但通常情況下不會這樣做。Linus很
-忙，並且有子系統維護人員負責監視內核的特定部分。通常您會希望維護人員合併您的
+忙，並且有子系統維護人員負責監視核心的特定部分。通常您會希望維護人員合併您的
 補丁。如果沒有明顯的維護人員，Andrew Morton通常是最後的補丁接收者。
 
 補丁需要好的主題行。補丁主題行的規範格式如下：
@@ -235,12 +272,12 @@
 其中“nn”是補丁的序號，“mm”是系列中補丁的總數，“subsys”是受影響子系統的
 名稱。當然，一個單獨的補丁可以省略nn/mm。
 
-如果您有一系列重要的補丁，那麼通常發送一個簡介作爲第〇部分。不過，這個約定
-並沒有得到普遍遵循；如果您使用它，請記住簡介中的信息不會進入內核變更日誌。
-因此，請確保補丁本身具有完整的變更日誌信息。
+如果您有一系列重要的補丁，那麼通常發送一個簡介作為第〇部分。不過，這個約定
+並沒有得到普遍遵循；如果您使用它，請記住簡介中的資訊不會進入核心變更日誌。
+因此，請確保補丁本身具有完整的變更日誌資訊。
 
-一般來說，多部分補丁的第二部分和後續部分應作爲對第一部分的回覆發送，以便它們
-在接收端都連接在一起。像git和coilt這樣的工具有命令，可以通過適當的線程發送
+一般來說，多部分補丁的第二部分和後續部分應作為對第一部分的回覆發送，以便它們
+在接收端都連接在一起。像git和coilt這樣的工具有命令，可以透過適當的執行緒發送
 一組補丁。但是，如果您有一長串補丁，並正使用git，請不要使用–-chain-reply-to
-選項，以避免創建過深的嵌套。
+選項，以避免建立過深的嵌套。
 
-- 
2.43.0

