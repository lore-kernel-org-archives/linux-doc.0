Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B293485CD2
	for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2026 18:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040456; cv=none; b=BLPLRt7C/H1J9g7I55H0DYhHlxANJNvn68KOUY1hDynPn/BodDZl8tneoPZs+GYAuPNOEco3VEf9+T9Ry8Q676+4oZEnWE1f1RdPwx4ODlunwx7DTqvYOfXn1mUpTtYIzOud2gIiApQyPgmauXj2bN0Ne/PxLmnnTpykiiwKzO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040456; c=relaxed/simple;
	bh=5jOfTXYjCa3pkNTaeOFicUOCZ/7ka16L2SJKZdlZXe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mS71IMvgySea4pNmGbU/mm/3ceVUB9eiHXT4wVB9gEOMVihNor1EKU1g065/5dUhQH2ol86LwYd9K3Zf6W5GB7Muh3xtQFmsltOLDP/Mj7tCEKiZYaZ00fLbQLhKiKdQigEvClvPrDPbJ0JadCsukTdvYvYY2/7o+TDLUAONml0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGGHQH0A; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGGHQH0A"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38ecc48b3deso276996a91.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Aug 2026 11:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786040446; x=1786645246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lVGXbSGhsYFLJELVc+b8oUkrLR6RPgR12n+ghuJm0/A=;
        b=bGGHQH0APMMMObksdtqGup3qzK4HvN5KEq+PohrOp3GBGTE2mA3HuoTPOUSMnTLKs6
         kwrBouGJ7QbhbZswhBlRo37epYyLPBIpaS2kPGzzxV1mOWxq7V6evINhlZjv1U8qQ24A
         K0yF77c41xexDdxadK1ggqkLmrDDiNOzrMa5o6h9wQYmjFhz6kAMwiLkhsEfnOa0+aBr
         wOvaHIvlY2yo6/XfM72DVdB8OGKgMqIoJ+QPbf/3LHWmGxlGvDriikscHiZO9bUoQS4c
         2iEh+4Z6zbZkp2EUIfsypBlWzfE2omqgOHXf4vpwF3HKgw+LFLejwqIkNrW0eNpZ/xt2
         Xjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786040446; x=1786645246;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lVGXbSGhsYFLJELVc+b8oUkrLR6RPgR12n+ghuJm0/A=;
        b=adyxFVqThc2jVA7X9MbAFhaAUDkUOz2axi0rMkLhC9XGVlh9ocs+Pk3nlvlaDNt0jL
         811H9XT0IjTNqeUk+EHv+gqbYEnULZg9uQmvt58ICvnun/bVSj+hr2eHDQ0b2QKTzEKz
         dItv0IpO6eEwCHWX5uHsDsZVVizToFLhWap9XKFBPqjAl8i2rLPy8rCaUN2s5Eapl7sN
         MGHfNDYBcJdwsei0FIcq16N7yJlrsAKRgndTnu6RYJxk3f3mxBle/troN7YM3S8pZBFo
         Hq39H6+7qaoUc+s/caFC9wh45V3anSlC0BiDdMM7RZW4eOHpznfHK0Ld4wUv/1kzy7cr
         IL+A==
X-Forwarded-Encrypted: i=1; AHgh+RqloFE8gjrj+tFmGu6EnVrM7HEB9n8gtVVv+K2SI181v8ZNxyNvDMM2F+xzXxbVTcj6qwfV0cf9vQI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4ubCxaBs+mIqbr+xmnIqWrhsHE6V/ZI0zBKjsa0Bj1XXFkp3v
	se9PYKkwt66QeBmnRrTpiGEn6WUoITOticez9A0Is2n8dGwjWufdOeny
X-Gm-Gg: AR+sD12krSrqtPkLCfr2eMIpNJXst79V/TJvwBMR8WsLPyk1Wl3vdh7NLkpGPWrxZFw
	vqSLs1oPwQywznh2uQJFzhHAr+Z2Z/M6MpvHbQGBOQ/RIvGiCYPN02Jef7y9MpNd0oojYuLAxCb
	IqqAlzcHKQKSo09LO+K71kpLHY9rI8hTpKSHWllzeqh2751WwTlWLRz5HsY94ldT7WzQZ1QGU5u
	UPvKCT3ArVA4t/N0+ukD31xQZqJGqyeYfoF7esHfkpPvcA/0jhi7yHHBdOF11wqOXnyjJq9VjGi
	riBRKUOseQ5XKbLDMl/EWyjI8cQWHxoJ5s/hkExDy0ooHdY9NLkdWJIZBmSQdOS62UuaACL3ktW
	riyhU7SCsq8bmF6BepXenU0KHeeKuo1RFjts9xUtXxrTiM4K+3WpPhHWaqLklPhYeRAz5Kk+wPQ
	Ipmh2zk00QdV2bj9Evt/UbpLwJbt/3ZvsOcT5t3S8NvcC2KxHPf8vrSMlWK2ochVJsl4Fg6cNvp
	ZrlS/S1Lb53diKqluTYq+OSnb/tWaZgA2UN15SVLiThkvwLXEfZ1DGqn6TW07JbMUJZtU3EBfDd
	T0eUf/5fG7JY9QB++0k/iVs=
X-Received: by 2002:a17:90b:3a81:b0:381:2788:a437 with SMTP id 98e67ed59e1d1-3903c541ec7mr11882773a91.1.1786040446190;
        Thu, 06 Aug 2026 11:20:46 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085f2b2easm2003356a91.11.2026.08.06.11.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 11:20:45 -0700 (PDT)
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
Subject: [PATCH v3 12/16] docs/zh_TW: process: localize terminology in embargoed-hardware-issues.rst
Date: Fri,  7 Aug 2026 02:19:45 +0800
Message-ID: <20260806181949.65648-13-chenyou910331@gmail.com>
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

Localize mainland terms to Taiwanese Mandarin (內核→核心, 硬件→硬體,
信息→資訊, ...) and sync with the English original: silicon-vendor
wording, real PGP/S/MIME key URLs, updated Linux Foundation IT
paragraph, disclosing-party responsibilities, shared-resources rule,
the new "Early access" section, and the current process ambassadors
list. Also fix the broken zh_Contact cross reference.

update to commit cead34ac1ce1 ("MAINTAINERS: update ndesaulniers")

Reviewed-by: Weijie Yuan <wy@wyuan.org>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../process/embargoed-hardware-issues.rst     | 209 ++++++++++--------
 1 file changed, 122 insertions(+), 87 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/embargoed-hardware-issues.rst b/Documentation/translations/zh_TW/process/embargoed-hardware-issues.rst
index 93d21fd88910..611247c816f4 100644
--- a/Documentation/translations/zh_TW/process/embargoed-hardware-issues.rst
+++ b/Documentation/translations/zh_TW/process/embargoed-hardware-issues.rst
@@ -5,115 +5,119 @@
 :Original: :ref:`Documentation/process/embargoed-hardware-issues.rst <embargoed_hardware_issues>`
 :Translator: Alex Shi <alex.shi@linux.alibaba.com>
              Hu Haowen <2023002089@link.tyut.edu.cn>
+             Chen-Yu Yeh <chenyou910331@gmail.com>
 
-被限制的硬件問題
+被限制的硬體問題
 ================
 
 範圍
 ----
 
-導致安全問題的硬件問題與隻影響Linux內核的純軟件錯誤是不同的安全錯誤類別。
+導致安全問題的硬體問題與只影響Linux核心的純軟體錯誤是不同的安全錯誤類別。
 
-必須區別對待諸如熔燬(Meltdown)、Spectre、L1TF等硬件問題，因爲它們通常會影響
-所有操作系統（“OS”），因此需要在不同的OS供應商、發行版、硬件供應商和其他各方
-之間進行協調。對於某些問題，軟件緩解可能依賴於微碼或固件更新，這需要進一步的
-協調。
+必須區別對待諸如熔毀(Meltdown)、Spectre、L1TF等硬體問題，因為它們通常會影
+響所有作業系統（“OS”），因此需要在不同的OS供應商、發行版、晶片供應商、硬體
+整合商和其他各方之間進行協調。對於某些問題，軟體緩解可能依賴於微碼或韌體更
+新，這需要進一步的協調。
 
 .. _tw_Contact:
 
 接觸
 ----
 
-Linux內核硬件安全小組獨立於普通的Linux內核安全小組。
+Linux核心硬體安全小組獨立於普通的Linux核心安全小組。
 
-該小組只負責協調被限制的硬件安全問題。Linux內核中純軟件安全漏洞的報告不由該
-小組處理，報告者將被引導至常規Linux內核安全小組(:ref:`Documentation/admin-guide/
-<securitybugs>`)聯繫。
+該小組只負責協調被限制的硬體安全問題。Linux核心中純軟體安全漏洞的報告不由
+該小組處理，報告者將被引導至常規Linux核心安全小組(
+:ref:`Documentation/admin-guide/<securitybugs>`)聯繫。
 
-可以通過電子郵件 <hardware-security@kernel.org> 與小組聯繫。這是一份私密的安全
-官名單，他們將幫助您根據我們的文檔化流程協調問題。
+可以透過電子郵件 <hardware-security@kernel.org> 與小組聯繫。這是一份私密的安全
+官名單，他們將幫助您根據我們的文件化流程協調問題。
 
-郵件列表是加密的，發送到列表的電子郵件可以通過PGP或S/MIME加密，並且必須使用報告
-者的PGP密鑰或S/MIME證書籤名。該列表的PGP密鑰和S/MIME證書可從
-https://www.kernel.org/.... 獲得。
+郵件列表是加密的，發送到列表的電子郵件可以透過PGP或S/MIME加密，並且必須使
+用報告者的PGP密鑰或S/MIME證書籤名。該列表的PGP密鑰和S/MIME證書可從以下URL
+獲得：
 
-雖然硬件安全問題通常由受影響的硬件供應商處理，但我們歡迎發現潛在硬件缺陷的研究
+  - PGP: https://www.kernel.org/static/files/hardware-security.asc
+  - S/MIME: https://www.kernel.org/static/files/hardware-security.crt
+
+雖然硬體安全問題通常由受影響的晶片供應商處理，但我們歡迎發現潛在硬體缺陷的研究
 人員或個人與我們聯繫。
 
-硬件安全官
+硬體安全官
 ^^^^^^^^^^
 
-目前的硬件安全官小組:
+目前的硬體安全官小組:
 
   - Linus Torvalds（Linux基金會院士）
-  - Greg Kroah Hartman（Linux基金會院士）
+  - Greg Kroah-Hartman（Linux基金會院士）
   - Thomas Gleixner（Linux基金會院士）
 
 郵件列表的操作
 ^^^^^^^^^^^^^^
 
-處理流程中使用的加密郵件列表託管在Linux Foundation的IT基礎設施上。通過提供這項
-服務，Linux基金會的IT基礎設施安全總監在技術上有能力訪問被限制的信息，但根據他
-的僱傭合同，他必須保密。Linux基金會的IT基礎設施安全總監還負責 kernel.org 基礎
-設施。
+處理流程中使用的加密郵件列表託管在Linux基金會的IT基礎設施上。透過提供這項
+服務，Linux基金會IT營運人員在技術上有能力存取被限制的資訊，但根據其僱傭
+合約必須保密。Linux基金會的IT人員還負責營運和管理kernel.org的其餘基礎設施。
 
-Linux基金會目前的IT基礎設施安全總監是 Konstantin Ryabitsev。
+Linux基金會目前的IT專案基礎設施總監是 Konstantin Ryabitsev。
 
 保密協議
 --------
 
-Linux內核硬件安全小組不是正式的機構，因此無法簽訂任何保密協議。核心社區意識到
+Linux核心硬體安全小組不是正式的機構，因此無法簽訂任何保密協議。核心社群意識到
 這些問題的敏感性，並提供了一份諒解備忘錄。
 
 諒解備忘錄
 ----------
 
-Linux內核社區深刻理解在不同操作系統供應商、發行商、硬件供應商和其他各方之間
-進行協調時，保持硬件安全問題處於限制狀態的要求。
+Linux核心社群深刻理解在不同作業系統供應商、發行商、晶片供應商和其他各方之間
+進行協調時，保持硬體安全問題處於限制狀態的要求。
 
-Linux內核社區在過去已經成功地處理了硬件安全問題，並且有必要的機制允許在限制
-限制下進行符合社區的開發。
+Linux核心社群在過去已經成功地處理了硬體安全問題，並且有必要的機制允許在限制
+限制下進行符合社群的開發。
 
-Linux內核社區有一個專門的硬件安全小組負責初始聯繫，並監督在限制規則下處理
+Linux核心社群有一個專門的硬體安全小組負責初始聯繫，並監督在限制規則下處理
 此類問題的過程。
 
-硬件安全小組確定開發人員（領域專家），他們將組成特定問題的初始響應小組。最初
+硬體安全小組確定開發人員（領域專家），他們將組成特定問題的初始響應小組。最初
 的響應小組可以引入更多的開發人員（領域專家）以最佳的技術方式解決這個問題。
 
-所有相關開發商承諾遵守限制規定，並對收到的信息保密。違反承諾將導致立即從當前
-問題中排除，並從所有相關郵件列表中刪除。此外，硬件安全小組還將把違反者排除在
-未來的問題之外。這一後果的影響在我們社區是一種非常有效的威懾。如果發生違規
-情況，硬件安全小組將立即通知相關方。如果您或任何人發現潛在的違規行爲，請立即
-向硬件安全人員報告。
+所有相關開發商承諾遵守限制規定，並對收到的資訊保密。違反承諾將導致立即從當前
+問題中排除，並從所有相關郵件列表中刪除。此外，硬體安全小組還將把違反者排除在
+未來的問題之外。這一後果的影響在我們社群是一種非常有效的威懾。如果發生違規
+情況，硬體安全小組將立即通知相關方。如果您或任何人發現潛在的違規行為，請立即
+向硬體安全人員報告。
 
 流程
 ^^^^
 
-由於Linux內核開發的全球分佈式特性，面對面的會議幾乎不可能解決硬件安全問題。
+由於Linux核心開發的全球分散式特性，面對面的會議幾乎不可能解決硬體安全問題。
 由於時區和其他因素，電話會議很難協調，只能在絕對必要時使用。加密電子郵件已被
 證明是解決此類問題的最有效和最安全的通信方法。
 
 開始披露
 """"""""
 
-披露內容首先通過電子郵件聯繫Linux內核硬件安全小組。此初始聯繫人應包含問題的
-描述和任何已知受影響硬件的列表。如果您的組織製造或分發受影響的硬件，我們建議
-您也考慮哪些其他硬件可能會受到影響。
+披露首先按照上述聯繫方式一節，透過電子郵件聯繫Linux核心硬體安全小組。此
+初始聯繫應包含問題的描述和任何已知受影響晶片的列表。如果您的組織製造或分發
+受影響的硬體，我們建議您也考慮哪些其他硬體可能會受到影響。披露方有責任及時
+聯繫受影響的晶片供應商。
 
-硬件安全小組將提供一個特定於事件的加密郵件列表，用於與報告者進行初步討論、
+硬體安全小組將提供一個特定於事件的加密郵件列表，用於與報告者進行初步討論、
 進一步披露和協調。
 
-硬件安全小組將向披露方提供一份開發人員（領域專家）名單，在與開發人員確認他們
-將遵守本諒解備忘錄和文件化流程後，應首先告知開發人員有關該問題的信息。這些開發
-人員組成初始響應小組，並在初始接觸後負責處理問題。硬件安全小組支持響應小組，
+硬體安全小組將向披露方提供一份開發人員（領域專家）名單，在與開發人員確認他們
+將遵守本諒解備忘錄和文件化流程後，應首先告知開發人員有關該問題的資訊。這些開發
+人員組成初始響應小組，並在初始接觸後負責處理問題。硬體安全小組支援響應小組，
 但不一定參與緩解開發過程。
 
-雖然個別開發人員可能通過其僱主受到保密協議的保護，但他們不能以Linux內核開發
-人員的身份簽訂個別保密協議。但是，他們將同意遵守這一書面程序和諒解備忘錄。
+雖然個別開發人員可能透過其僱主受到保密協議的保護，但他們不能以Linux核心開發
+人員的身份簽訂個別保密協議。但是，他們將同意遵守這一書面程式和諒解備忘錄。
 
 披露方應提供已經或應該被告知該問題的所有其他實體的聯繫人名單。這有幾個目的:
 
-  - 披露的實體列表允許跨行業通信，例如其他操作系統供應商、硬件供應商等。
+  - 披露的實體列表允許跨行業通信，例如其他作業系統供應商、硬體供應商等。
 
   - 可聯繫已披露的實體，指定應參與緩解措施開發的專家。
 
@@ -123,67 +127,97 @@ Linux內核社區有一個專門的硬件安全小組負責初始聯繫，並監
 披露
 """"
 
-披露方通過特定的加密郵件列表向初始響應小組提供詳細信息。
+披露方透過特定的加密郵件列表向初始響應小組提供詳細資訊。
 
-根據我們的經驗，這些問題的技術文檔通常是一個足夠的起點，最好通過電子郵件進行
+根據我們的經驗，這些問題的技術文件通常是一個足夠的起點，最好透過電子郵件進行
 進一步的技術澄清。
 
 緩解開發
 """"""""
 
-初始響應小組設置加密郵件列表，或在適當的情況下重新修改現有郵件列表。
+初始響應小組設定加密郵件列表，或在適當的情況下重新修改現有郵件列表。
 
-使用郵件列表接近於正常的Linux開發過程，並且在過去已經成功地用於爲各種硬件安全
+使用郵件列表接近於正常的Linux開發過程，並且在過去已經成功地用於為各種硬體安全
 問題開發緩解措施。
 
-郵件列表的操作方式與正常的Linux開發相同。發佈、討論和審查修補程序，如果同意，
-則應用於非公共git存儲庫，參與開發人員只能通過安全連接訪問該存儲庫。存儲庫包含
-針對主線內核的主開發分支，並根據需要爲穩定的內核版本提供向後移植分支。
+郵件列表的操作方式與正常的Linux開發相同。發布、討論和審查修補程式，如果同意，
+則應用於非公共git儲存庫，參與開發人員只能透過安全連接存取該儲存庫。儲存庫包含
+針對主線核心的主開發分支，並根據需要為穩定的核心版本提供向後移植分支。
+
+最初的響應小組將根據需要從Linux核心開發人員社群中確定更多的專家。任何相關
+方都可以建議增補專家，每位專家都須符合上述相同的要求。
 
-最初的響應小組將根據需要從Linux內核開發人員社區中確定更多的專家。引進專家可以
-在開發過程中的任何時候發生，需要及時處理。
+引進專家可以在開發過程中的任何時候發生，需要及時處理。
 
 如果專家受僱於披露方提供的披露清單上的實體或其成員，則相關實體將要求其參與。
 
 否則，披露方將被告知專家參與的情況。諒解備忘錄涵蓋了專家，要求披露方確認參與。
 如果披露方有令人信服的理由提出異議，則必須在五個工作日內提出異議，並立即與事件
-小組解決。如果披露方在五個工作日內未作出回應，則視爲默許。
+小組解決。如果披露方在五個工作日內未作出回應，則視為默許。
 
 在確認或解決異議後，專家由事件小組披露，並進入開發過程。
 
+列表參與者不得在私有郵件列表之外交流該問題。列表參與者在處理補丁時不得使用
+任何共享資源（例如僱主的建置農場、CI系統等）。
+
+提前取得
+""""""""
+
+在列表上討論和開發的補丁，既不能分發給任何非響應小組成員的個人，也不能分發
+給任何其他組織。
+
+為了讓受影響的晶片供應商能夠與其內部團隊和產業夥伴合作進行測試、驗證和
+後勤工作，提供了以下例外：
+
+	受影響晶片供應商的指定代表可以在任何時候將補丁移交給該晶片供應商
+	的響應小組。該代表必須將移交一事通知核心響應小組。受影響的晶片
+	供應商必須為與其響應小組共享的任何補丁，制定並維護自己的、與本
+	政策一致的文件化安全流程。
+
+	晶片供應商的響應小組可以依照該晶片供應商的文件化安全流程，將這些
+	補丁分發給其產業夥伴及其內部團隊。來自產業夥伴的反饋會回到晶片
+	供應商，並由晶片供應商轉達給核心響應小組。
+
+	移交給晶片供應商的響應小組後，因晶片供應商的內部團隊或產業夥伴的
+	參與而發生的過早披露，核心響應小組不再承擔任何責任或義務。晶片
+	供應商透過同意本流程來保證這一責任免除。
+
 協調發布
 """"""""
 
-有關各方將協商限制結束的日期和時間。此時，準備好的緩解措施集成到相關的內核樹中
+有關各方將協商限制結束的日期和時間。此時，準備好的緩解措施整合到相關的核心樹中
 併發布。
 
-雖然我們理解硬件安全問題需要協調限制時間，但限制時間應限制在所有有關各方制定、
-測試和準備緩解措施所需的最短時間內。人爲地延長限制時間以滿足會議討論日期或其他
-非技術原因，會給相關的開發人員和響應小組帶來了更多的工作和負擔，因爲補丁需要
-保持最新，以便跟蹤正在進行的上游內核開發，這可能會造成衝突的更改。
+雖然我們理解硬體安全問題需要協調限制時間，但限制時間應限制在所有有關各方制定、
+測試和準備緩解措施所需的最短時間內。人為地延長限制時間以滿足會議討論日期或其他
+非技術原因，會給相關的開發人員和響應小組帶來了更多的工作和負擔，因為補丁需要
+保持最新，以便追蹤正在進行的上游核心開發，這可能會造成衝突的更改。
 
 CVE分配
 """""""
 
-硬件安全小組和初始響應小組都不分配CVE，開發過程也不需要CVE。如果CVE是由披露方
-提供的，則可用於文檔中。
+硬體安全小組和初始響應小組都不分配CVE，開發過程也不需要CVE。如果CVE是由披露方
+提供的，則可用於文件記錄目的。
 
 流程專使
 --------
 
-爲了協助這一進程，我們在各組織設立了專使，他們可以回答有關報告流程和進一步處理
+為了協助這一流程，我們在各組織設立了專使，他們可以回答有關報告流程和進一步處理
 的問題或提供指導。專使不參與特定問題的披露，除非響應小組或相關披露方提出要求。
 現任專使名單:
 
   ============= ========================================================
-  ARM
   AMD		Tom Lendacky <thomas.lendacky@amd.com>
-  IBM
+  Ampere	Darren Hart <darren@os.amperecomputing.com>
+  ARM		Catalin Marinas <catalin.marinas@arm.com>
+  IBM Power	Madhavan Srinivasan <maddy@linux.ibm.com>
+  IBM Z		Christian Borntraeger <borntraeger@de.ibm.com>
   Intel		Tony Luck <tony.luck@intel.com>
   Qualcomm	Trilok Soni <quic_tsoni@quicinc.com>
+  RISC-V	Palmer Dabbelt <palmer@dabbelt.com>
+  Samsung	Javier González <javier.gonz@samsung.com>
 
-  Microsoft	Sasha Levin <sashal@kernel.org>
-  VMware
+  Microsoft	James Morris <jamorris@linux.microsoft.com>
   Xen		Andrew Cooper <andrew.cooper3@citrix.com>
 
   Canonical	John Johansen <john.johansen@canonical.com>
@@ -192,27 +226,28 @@ CVE分配
   Red Hat	Josh Poimboeuf <jpoimboe@redhat.com>
   SUSE		Jiri Kosina <jkosina@suse.cz>
 
-  Amazon
   Google	Kees Cook <keescook@chromium.org>
+
+  LLVM		Nick Desaulniers <ndesaulniers@google.com>
   ============= ========================================================
 
-如果要將您的組織添加到專使名單中，請與硬件安全小組聯繫。被提名的專使必須完全
-理解和支持我們的過程，並且在Linux內核社區中很容易聯繫。
+如果要將您的組織添加到專使名單中，請與硬體安全小組聯繫。被提名的專使必須完全
+理解和支援我們的過程，並且在Linux核心社群中很容易聯繫。
 
 加密郵件列表
 ------------
 
 我們使用加密郵件列表進行通信。這些列表的工作原理是，發送到列表的電子郵件使用
-列表的PGP密鑰或列表的/MIME證書進行加密。郵件列表軟件對電子郵件進行解密，並
-使用訂閱者的PGP密鑰或S/MIME證書爲每個訂閱者分別對其進行重新加密。有關郵件列表
-軟件和用於確保列表安全和數據保護的設置的詳細信息，請訪問:
-https://www.kernel.org/....
+列表的PGP密鑰或列表的S/MIME證書進行加密。郵件列表軟體對電子郵件進行解密，並
+使用訂閱者的PGP密鑰或S/MIME證書為每個訂閱者分別對其進行重新加密。有關郵件列表
+軟體和用於確保列表安全和資料保護的設定的詳細資訊，請見：
+https://korg.wiki.kernel.org/userdoc/remail.
 
-關鍵點
-^^^^^^
+列表密鑰
+^^^^^^^^
 
-初次接觸見 :ref:`zh_Contact`. 對於特定於事件的郵件列表，密鑰和S/MIME證書通過
-特定列表發送的電子郵件傳遞給訂閱者。
+初次接觸見上面的 :ref:`tw_Contact` 一節。 對於特定於事件的郵件列表，密鑰和
+S/MIME證書透過特定列表發送的電子郵件傳遞給訂閱者。
 
 訂閱事件特定列表
 ^^^^^^^^^^^^^^^^
@@ -220,13 +255,13 @@ https://www.kernel.org/....
 訂閱由響應小組處理。希望參與通信的披露方將潛在訂戶的列表發送給響應組，以便
 響應組可以驗證訂閱請求。
 
-每個訂戶都需要通過電子郵件向響應小組發送訂閱請求。電子郵件必須使用訂閱服務器
-的PGP密鑰或S/MIME證書籤名。如果使用PGP密鑰，則必須從公鑰服務器獲得該密鑰，
-並且理想情況下該密鑰連接到Linux內核的PGP信任網。另請參見:
+每個訂戶都需要透過電子郵件向響應小組發送訂閱請求。電子郵件必須使用訂閱者
+的PGP密鑰或S/MIME證書籤名。如果使用PGP密鑰，則必須從公鑰伺服器獲得該密鑰，
+並且理想情況下該密鑰連接到Linux核心的PGP信任網。另請參見:
 https://www.kernel.org/signature.html.
 
-響應小組驗證訂閱者，並將訂閱者添加到列表中。訂閱後，訂閱者將收到來自郵件列表
-的電子郵件，該郵件列表使用列表的PGP密鑰或列表的/MIME證書籤名。訂閱者的電子郵件
-客戶端可以從簽名中提取PGP密鑰或S/MIME證書，以便訂閱者可以向列表發送加密電子
-郵件。
+響應小組驗證訂閱者，並將訂閱者添加到列表中。訂閱後，訂閱者將收到來自郵件列
+表的電子郵件，該郵件列表使用列表的PGP密鑰或列表的S/MIME證書籤名。訂閱者的
+電子郵件客戶端可以從簽名中提取PGP密鑰或S/MIME證書，以便訂閱者可以向列表發
+送加密電子郵件。
 
-- 
2.43.0

