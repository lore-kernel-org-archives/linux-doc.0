Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9626D41A922
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 09:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785229864; cv=none; b=Ge4CzwjqkA4Db/xJ1WiW3uJ53PPMT2jgkL9igyvpp/dlsgJxyJXzaIWt7fbRpLFWC6PIBlFpDKz4vys1FX21oBS+LUAk9hZO74PzIQk3IirQlfrV2R+n/Vor7txGxrOTjJejlVwKySlnANMs1id9lcp7y1n35JkAgQrGgrUqHmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785229864; c=relaxed/simple;
	bh=qTosm79cWGx/xZu1IUKZP/RRw/vijNcIGvCeRo4txCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cmd8ftubg1cHRXGT6ZLxNcyUfRQj1GyFSFASK2xOODPNVflUj10wwq7xvu8PqdRl5MgjvmhH0fjgl9xmz1Dw5DQlpHe5Zws+LtEX1sHIEAI4NefZNGm6qpt6ZVgRBWZIzfrh21PfDU63kz8CctztqLWYsTb/Ovh+FhbsGZAKAgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CtPfICpD; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CtPfICpD"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84e2061eed9so42778b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 02:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785229862; x=1785834662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jYj1VAkofWDfGkZ1E0vCpYN3EfbzZ4jLbWzMJUTuNOY=;
        b=CtPfICpD8heHpmGqW0UdcYR878pIk9lOGgAN9YVHnE/F7xLBsqOF3W6V4Xugwbxvpk
         UoEEgDNgv2vGfuwk8v2fbMoyQtR6B14X2duKUKA8kvH/ZIWL6wxM2D7ndXK9XnDwt9PM
         p3vFca1xrGHD2RbRQT8qJoynaGs93VYwprxDGaPN1HwXi3swyjo8X8bDScsCQB1xUJuO
         uBXQXASOs/AmPCocFvt4DSiUF16IzNfT8WIRWd2DAWma+BXUbiFfkHzHo5frv5HY2CCP
         yo2q6LQzKszUGAnHQdeSRqccPe6H7nfTjQV9gvZY7SN4H+SqiG7dx1Wwnl312Q8JC8+p
         u0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785229862; x=1785834662;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jYj1VAkofWDfGkZ1E0vCpYN3EfbzZ4jLbWzMJUTuNOY=;
        b=soNk6q3Cu2nWYRxBPILhopzStwgzt6hqff1OkXs+jKnI5uTQEYWMMIjCLwlR+l6jY5
         taesCDkv4B13xGPbD2Q59YdCppnLQFa2DsXO8e6/C0Hq/fRMq9RyigunV9yCaNPRLPCF
         iRKDNFRfjDvO065ppNz9bGl6yl/SxAt7CY2O8+TvxjN/R0shKhPbP6k74tMnq3BPnYXd
         NcrlcWYGQXvLYL5+d7P/D8g3CkFPXNB2sA962e7r0yrEx9+5c1yAQTl8HuGalyicjr9p
         0TWiDRvGhyrFUU0aZ7VU0EuoeB2wsFYcvNmKxVc+2VMS/qdxY3MPb/l/1OX9cc4TUwHi
         K4vQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpc2KYCoXSht3AwN8FXOSi9mrzbwfD3HVx6z08tVZzrQ93uK0l+EDtlJMSj8wliXUkdBSY+CicYnsg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2o0VSV73dpw4PqIe+T4V9VqFHlV/7Fy0z0Vwrcxcpj7qV9BUP
	ZlABesS3Fmrv+gK3zZdprDstxwj5D+MFpZ8SQNZ9bTUHuefSCW2ADhe9
X-Gm-Gg: AR+sD12pqK/eu0wFzM9tPyyVgqsij9/Zhh/ugXzN4vOVxiD5JpVopBq+Yz6+Rd6zBeI
	7XK1IdFOsQxksN0SmmUeob2NceGzfeOGSj+psBi0Li4OyREp49/p8GQbLaTkONuId0k6X8ZOuLi
	GFHddfbfUCZKjFQrJU86bEtt05GAYvoeQi7Kd/IDSiFfon/CpycbWB03DeSVuMqmrDD1+r+oU25
	1CxP8cdvqohkTXXZPIHt7M9Ka6XIyZf784An7Jpj/runQ5HD29bDgBV+tubW33/W3ccudbyHd5K
	4DCd7ppLlU7OQlm3vFTMnyfdzEXMug2SeMxLMU3ubV3bdrIHrUfWGXJJrlcvFuGQWW0VAdz8AId
	i9HCBNMeXyiweYZKeATVcpfAFortK9c6Aog75e66egFfMFVrCd9BepbaeUTFpl7h5TS7swplxnI
	YipVtSNjQKyAELW+Bw+HPDmm6NGNUxBg967xfBB2KcTKhEJj9ty/CpsDHs2NGaPnTAfbTsWsWAW
	mp4EgnhHFUaEOQSOSRxcC7U+pupNRf0447BZKfK
X-Received: by 2002:aa7:8888:0:b0:847:8498:7bcf with SMTP id d2e1a72fcca58-84e93036b8cmr2121180b3a.0.1785229861435;
        Tue, 28 Jul 2026 02:11:01 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5328180dsm4099303b3a.23.2026.07.28.02.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:11:00 -0700 (PDT)
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
Subject: [PATCH v2 03/16] docs/zh_TW: process: localize terminology in code-of-conduct-interpretation.rst
Date: Tue, 28 Jul 2026 17:10:25 +0800
Message-ID: <20260728091038.171033-4-chenyou910331@gmail.com>
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

Localize mainland terms to Taiwanese Mandarin (內核→核心, 社區→社群,
軟件→軟體, ...) and sync with the English original: rewrite the
enforcement section to match the current committee/TAB wording and add
the "Enforcement for Unacceptable Behavior" section introduced by
commit c818d5c64c9a ("Documentation/CoC: spell out enforcement for
unacceptable behaviors").

update to commit 04c4bb90ae6e ("Documentation/CoC: Spell out the TAB
role in enforcement decisions")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../code-of-conduct-interpretation.rst        | 162 ++++++++++++------
 1 file changed, 113 insertions(+), 49 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst b/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
index fbe66b001322..5ffd7adbf652 100644
--- a/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
+++ b/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
@@ -5,108 +5,172 @@
 :Original: :ref:`Documentation/process/code-of-conduct-interpretation.rst <code_of_conduct_interpretation>`
 :Translator: Alex Shi <alex.shi@linux.alibaba.com>
              Hu Haowen <2023002089@link.tyut.edu.cn>
+             Chen-Yu Yeh <chenyou910331@gmail.com>
 
 .. _tw_code_of_conduct_interpretation:
 
-Linux內核貢獻者契約行爲準則解釋
+Linux核心貢獻者契約行為準則解釋
 ===============================
 
-:ref:`tw_code_of_conduct` 準則是一個通用文檔，旨在爲幾乎所有開源社區提供一套規則。
-每個開源社區都是獨一無二的，Linux內核也不例外。因此，本文描述了Linux內核社區中
-如何解釋它。我們也不希望這種解釋隨着時間的推移是靜態的，並將根據需要進行調整。
+:ref:`tw_code_of_conduct` 準則是一個通用文件，旨在為幾乎所有開源社群提供一套規則。
+每個開源社群都是獨一無二的，Linux核心也不例外。因此，本文描述了Linux核心社群中
+如何解釋它。我們也不希望這種解釋隨著時間的推移是靜態的，並將根據需要進行調整。
 
-與開發軟件的“傳統”方法相比，Linux內核開發工作是一個非常個人化的過程。你的貢獻
+與開發軟體的“傳統”方法相比，Linux核心開發工作是一個非常個人化的過程。你的貢獻
 和背後的想法將被仔細審查，往往導致批判和批評。審查將幾乎總是需要改進，材料才
-能包括在內核中。要知道這是因爲所有相關人員都希望看到Linux整體成功的最佳解決方
-案。這個開發過程已經被證明可以創建有史以來最健壯的操作系統內核，我們不想做任何
-事情來導致提交質量和最終結果的下降。
+能包括在核心中。要知道這是因為所有相關人員都希望看到Linux整體成功的最佳解決方
+案。這個開發過程已經被證明可以建立有史以來最強健的作業系統核心，我們不想做任何
+事情來導致提交品質和最終結果的下降。
 
 維護者
 ------
 
-行爲準則多次使用“維護者”一詞。在內核社區中，“維護者”是負責子系統、驅動程序或
-文件的任何人，並在內核源代碼樹的維護者文件中列出。
+行為準則多次使用“維護者”一詞。在核心社群中，“維護者”是負責子系統、驅動程式或
+文件的任何人，並在核心原始程式碼樹的維護者文件中列出。
 
 責任
 ----
 
-《行爲準則》提到了維護人員的權利和責任，這需要進一步澄清。
+《行為準則》提到了維護人員的權利和責任，這需要進一步澄清。
 
-首先，最重要的是，有一個合理的期望是由維護人員通過實例來領導。
+首先，最重要的是，有一個合理的期望是由維護人員透過實例來領導。
 
-也就是說，我們的社區是廣闊的，對維護者沒有新的要求，他們單方面處理其他人在
-他們活躍的社區的行爲。這一責任由我們所有人承擔，最終《行爲準則》記錄了最終的
-上訴路徑，以防有關行爲問題的問題懸而未決。
+也就是說，我們的社群是廣闊的，對維護者沒有新的要求，他們單方面處理其他人在
+他們活躍的社群的行為。這一責任由我們所有人承擔，最終《行為準則》記錄了最終的
+上訴路徑，以防有關行為問題的問題懸而未決。
 
-維護人員應該願意在出現問題時提供幫助，並在需要時與社區中的其他人合作。如果您
+維護人員應該願意在出現問題時提供幫助，並在需要時與社群中的其他人合作。如果您
 不確定如何處理出現的情況，請不要害怕聯繫技術諮詢委員會（TAB）或其他維護人員。
-除非您願意，否則不會將其視爲違規報告。如果您不確定是否該聯繫TAB 或任何其他維
+除非您願意，否則不會將其視為違規報告。如果您不確定是否該聯繫TAB 或任何其他維
 護人員，請聯繫我們的衝突調解人 Mishi Choudhary <mishi@linux.com>。
 
-最後，“善待對方”纔是每個人的最終目標。我們知道每個人都是人，有時我們都會失敗，
-但我們所有人的首要目標應該是努力友好地解決問題。執行行爲準則將是最後的選擇。
+最後，“善待對方”才是每個人的最終目標。我們知道每個人都是人，有時我們都會失敗，
+但我們所有人的首要目標應該是努力友好地解決問題。執行行為準則將是最後的選擇。
 
-我們的目標是創建一個強大的、技術先進的操作系統，以及所涉及的技術複雜性，這自
+我們的目標是建立一個強大的、技術先進的作業系統，以及所涉及的技術複雜性，這自
 然需要專業知識和決策。
 
 所需的專業知識因貢獻領域而異。它主要由上下文和技術複雜性決定，其次由貢獻者和
 維護者的期望決定。
 
-專家的期望和決策都要經過討論，但在最後，爲了取得進展，必須能夠做出決策。這一
-特權掌握在維護人員和項目領導的手中，預計將善意使用。
+專家的期望和決策都要經過討論，但在最後，為了取得進展，必須能夠做出決策。這一
+特權掌握在維護人員和專案領導的手中，預計將善意使用。
 
-因此，設定專業知識期望、作出決定和拒絕不適當的貢獻不被視爲違反行爲準則。
+因此，設定專業知識期望、作出決定和拒絕不適當的貢獻不被視為違反行為準則。
 
 雖然維護人員一般都歡迎新來者，但他們幫助（新）貢獻者克服障礙的能力有限，因此
-他們必須確定優先事項。這也不應被視爲違反了行爲準則。內核社區意識到這一點，並
+他們必須確定優先事項。這也不應被視為違反了行為準則。核心社群意識到這一點，並
 以各種形式提供入門級節目，如 kernelnewbies.org 。
 
 範圍
 ----
 
-Linux內核社區主要在一組公共電子郵件列表上進行交互，這些列表分佈在由多個不同
-公司或個人控制的多個不同服務器上。所有這些列表都在內核源代碼樹中的
-MAINTAINERS 文件中定義。發送到這些郵件列表的任何電子郵件都被視爲包含在行爲
+Linux核心社群主要在一組公共電子郵件列表上進行交互，這些列表分佈在由多個不同
+公司或個人控制的多個不同伺服器上。所有這些列表都在核心原始程式碼樹中的
+MAINTAINERS 文件中定義。發送到這些郵件列表的任何電子郵件都被視為包含在行為
 準則中。
 
-使用 kernel.org bugzilla和其他子系統bugzilla 或bug跟蹤工具的開發人員應該遵循
-行爲準則的指導原則。Linux內核社區沒有“官方”項目電子郵件地址或“官方”社交媒體
-地址。使用kernel.org電子郵件帳戶執行的任何活動必須遵循爲kernel.org發佈的行爲
+使用 kernel.org bugzilla和其他子系統bugzilla 或bug追蹤工具的開發人員應該遵循
+行為準則的指導原則。Linux核心社群沒有“官方”專案電子郵件地址或“官方”社交媒體
+地址。使用kernel.org電子郵件帳戶執行的任何活動必須遵循為kernel.org發布的行為
 準則，就像任何使用公司電子郵件帳戶的個人必須遵循該公司的特定規則一樣。
 
-行爲準則並不禁止在郵件列表消息、內核更改日誌消息或代碼註釋中繼續包含名稱、
-電子郵件地址和相關注釋。
+行為準則並不禁止在郵件列表消息、核心更改日誌消息或程式碼註解中繼續包含名稱、
+電子郵件地址和相關註解。
 
-其他論壇中的互動包括在適用於上述論壇的任何規則中，通常不包括在行爲準則中。
+其他論壇中的互動包括在適用於上述論壇的任何規則中，通常不包括在行為準則中。
 除了在極端情況下可考慮的例外情況。
 
-提交給內核的貢獻應該使用適當的語言。在行爲準則之前已經存在的內容現在不會被
-視爲違反。然而，不適當的語言可以被視爲一個bug；如果任何相關方提交補丁，
-這樣的bug將被更快地修復。當前屬於用戶/內核API的一部分的表達式，或者反映已
-發佈標準或規範中使用的術語的表達式，不被視爲bug。
+提交給核心的貢獻應該使用適當的語言。在行為準則之前已經存在的內容現在不會被
+視為違反。然而，不適當的語言可以被視為一個bug；如果任何相關方提交補丁，
+這樣的bug將被更快地修復。當前屬於使用者/核心API的一部分的表達式，或者反映已
+發布標準或規範中使用的術語的表達式，不被視為bug。
 
 執行
 ----
 
-行爲準則中列出的地址屬於行爲準則委員會。https://kernel.org/code-of-conduct.html
-列出了在任何給定時間接收這些電子郵件的確切成員。成員不能訪問在加入委員會之前
+行為準則中列出的地址屬於行為準則委員會。https://kernel.org/code-of-conduct.html
+列出了在任何給定時間接收這些電子郵件的確切成員。成員不能存取在加入委員會之前
 或離開委員會之後所做的報告。
 
-最初的行爲準則委員會由TAB的志願者以及作爲中立第三方的專業調解人組成。委員會
-的首要任務是建立文件化的流程，並將其公開。
+行為準則委員會由TAB任命的社群志願者成員以及作為中立第三方的專業調解人組成。
+行為準則委員會處理報告所使用的流程各不相同，將取決於個別情況，但本文件可
+作為其所使用之一般流程的說明。
 
 如果報告人不希望將整個委員會納入投訴或關切，可直接聯繫委員會的任何成員，包括
 調解人。
 
-行爲準則委員會根據流程審查案例（見上文），並根據需要和適當與TAB協商，例如請求
-和接收有關內核社區的信息。
+行為準則委員會根據流程審查案例（見上文），並根據需要和適當與TAB協商，例如請求
+和接收有關核心社群的資訊。
 
-委員會做出的任何決定都將提交到表中，以便在必要時與相關維護人員一起執行。行爲
-準則委員會的決定可以通過三分之二的投票推翻。
+任何有關執法建議的決定都將提交給TAB，以便在必要時與相關維護人員一起實施
+執法。一旦TAB以參與表決成員的三分之二多數批准了禁令範圍中列出的一項或多項
+措施，行為準則委員會將執行TAB批准的措施。任何同時在TAB任職的行為準則委員會
+成員不參與對這些措施的表決。
 
-每季度，行爲準則委員會和標籤將提供一份報告，概述行爲準則委員會收到的匿名報告
-及其狀態，以及任何否決決定的細節，包括完整和可識別的投票細節。
+每季度，行為準則委員會和TAB將提供一份報告，概述行為準則委員會收到的匿名
+報告及其狀態，以及任何TAB批准之決定的細節，包括完整和可識別的投票細節。
 
-我們希望在啓動期之後爲行爲準則委員會人員配備建立一個不同的流程。發生此情況時，
-將使用該信息更新此文檔。
+由於我們對行為準則的解釋和執行會隨著時間演變，本文件將在必要時更新，以反映
+任何變化。
+
+不可接受行為之行為準則違規的執法
+--------------------------------
+
+行為準則委員會致力於確保我們的社群持續具有包容性，促進多元的討論和觀點，並
+致力於隨著時間改進這些特質。行為準則委員會收到的大多數報告，源於對開發過程
+以及維護者的角色、責任及其對程式碼接受與否的決定權的錯誤理解。這些報告透過
+澄清開發過程和行為準則的範圍來解決。
+
+不可接受的行為可能在短時間內中斷相互尊重的協作，並對社群的健康造成長期的
+負面影響。當個人在違規發生的場合承認自己的行為並作出彌補時，不可接受的行為
+通常就能得到解決。
+
+當不可接受的行為未能透過社群討論解決時，行為準則委員會會收到相關報告。當
+不可接受的行為對相互尊重的協作關係造成負面影響時，行為準則委員會會採取措施
+恢復有成效且相互尊重的協作。
+
+行為準則委員會有義務對報告和報告者的資訊保密。報告可能來自受害方，也可能
+來自目睹不可接受行為的社群成員。行為準則委員會有責任與所有相關方合作，調查
+並解決這些報告。
+
+行為準則委員會與當事人合作，促使其理解以下事項的重要性：修復其行為對受害方
+造成的傷害，以及對社群的長期負面影響。
+
+目標是達成所有各方都能接受的解決方案。如果與當事人的合作未能達到預期的結果，
+行為準則委員會將評估其他措施，例如要求公開道歉以修復傷害。
+
+要求為違規行為公開道歉
+~~~~~~~~~~~~~~~~~~~~~~
+
+行為準則委員會在違規發生的場合公開指出該行為，要求為違規行為公開道歉。
+
+為違規行為公開道歉是重建信任的第一步。信任對於一個以信任和尊重運作的社群的
+持續成功和健康至關重要。
+
+若未為違規行為公開道歉的補救措施
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+行為準則委員會透過向TAB建議補救措施以供批准，決定恢復健康協作的下一步行動。
+
+- 禁止違規者參與核心開發過程，期限最長可達一個完整的核心開發週期。行為準則
+  委員會可以要求公開道歉作為解除禁令的條件。
+
+一段時間內禁令的範圍可能包括：
+
+    a. 拒絕其補丁貢獻和拉取請求
+    b. 透過忽略其貢獻和/或封鎖其電子郵件帳戶，暫停與違規者的協作
+    c. 限制其透過kernel.org平臺（如郵件列表和社交媒體網站）進行交流的能力
+
+一旦TAB以參與表決成員的三分之二多數批准了禁令範圍中列出的一項或多項措施，
+行為準則委員會將與社群、維護人員、子維護人員和kernel.org管理員合作，執行
+TAB批准的措施。任何同時在TAB任職的行為準則委員會成員不參與對這些措施的表決。
+
+行為準則委員會深知要求公開道歉和實施禁令可能對個人造成的負面影響。它也深知
+在發生此類嚴重的公開違規行為時不採取行動可能對社群造成的長期傷害。
+
+TAB批准的補救措施的有效性，取決於社群、維護人員、子維護人員和kernel.org
+管理員在執行這些措施時的信任與合作。
+
+行為準則委員會衷心希望，需要要求公開道歉的不可接受行為，在未來仍然極為罕見。
 
-- 
2.43.0

