Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964960;
	b=q4WCBOtx4uWR8yp0KZGlPAOd8yXZajT+La2u76tcwm+6IGeKOd0x6gl2H7rHmvyWcUbn
	 zzCOSMFusD/HrLeI9uJ+op3gTLS+7XAKcGRLsBmP+nP+xZWWKMvg7+67syo293scFx7Gv
	 YLmzMcP3ikHcxZkzmpYQM/OU7MGiSXas0EFKmI7rT8k0S6eQu0RNoaKn5D7h/mUYVUF4c
	 v9e4cNAWikDl2RBQ3j5tTQmdhgfXhr7GC2+m0hv1zgPPpsVamWcyap3v2xdhWb9HeCDZN
	 0TbpdC3vH6UgX/UrJtfpLj68oyAQlQFXo1/aRV6t/xDsvDEK4xbp3kBhTTgnjht2jww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=UBi8ffpUVq2DEgCD2ok6KZJXbr+tM2D+x6SEBDyvQ8I=;
	b=bFs5hxVBTQE4rqTelaI2QKAJdcsLCaa8jtY3CNiFmCCu5fO0IHBccm5pOdUBz+DIevny
	 O1xZ6/aa5m9JyCPFsosrwtUIdwBZ/1AfD6twbZx8WRjJVJ6okrZ49b679XVGlPPEqtoBA
	 Vwfz6wAP8q1h0jsRLcs5w0ifO3MPeuxJYjLLxWGmwbnHc+DDZxpeIRrPp4ZyOPB6voxPZ
	 i4rcFPkdMl5+R4MGSm+KoTbPstrjFRJvx3wcyW8xwvPAK6TntDSrCMB7pszHk+u+Jai+7
	 m4puJ/8JeO6ImmR2sDbwnN8BETv/IksJjM6K+LMnmXk4j2NxBY5Re1qzX53VLt1N1VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KVE+rTo6;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CF0606A936
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 11:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47CF0606A936
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KVE+rTo6
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ac847f9d78so35449a91.1
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 03:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964960; x=1794569760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UBi8ffpUVq2DEgCD2ok6KZJXbr+tM2D+x6SEBDyvQ8I=;
        b=KVE+rTo6tFVrX8H68rZ7ABTTwe0S1hEiRBkcGKIF+b3QKC0YOgNp/nwZnKKYU46gxt
         7UumY8PEOJmNb70kM5DEc/oWvZX7ibjRpruuogWq+Y2c/+75lvolXYNrtxWuRdXnnzAx
         q1p4Bix0khyBQY3sTJc7BGbGzod3i6BYXevyBbLLQKI7KkzNpm22WlQI6Tk8t7/ifnot
         Mp0EHwuL0bsdMXncvjBS3E+UcyDS5Dc3EA4twECOo4ia8/4qlwmf07xGlu/LufUWxsHB
         kcAZ8koWiYj6I4G9W3r9ZUbuaQVHjfZ/W4CHUi79a/Y5PyfJowWZ/vjsyTn0TTRyarbx
         ZONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964960; x=1794569760;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UBi8ffpUVq2DEgCD2ok6KZJXbr+tM2D+x6SEBDyvQ8I=;
        b=Vi7f0PO/0FXtnU/kLYpYEsfoeQC+W8UpgnFjeZ6ACIHP5rkkYzPmCFDt3RaWQ7T41x
         Ks4Yg/25lr1YVUHnu2bWfy+cYaPbqD94OL//0N7lnU1miMvahOEUnHpqlySurjM5GEgd
         8JvdUYmL9w/gNuNkYONpvCH/rwCS4UeHMwgryFmBGeuKtQb3xQxPIQ9lNRFtVo3J0k0p
         EtzPRlbhDaY8uvI4+45rzRv1X6OWv4otk+ta00Obg3+v53yX93HMZCRuVeGmEKIXcPkx
         2i2Ejd2ey6IIDQ7Yuh0sqDZjtEnLJh2l3EzuNmbs5RmHEKOoofrmn2/BDkubmt0fYVvs
         xdpA==
X-Forwarded-Encrypted: i=1; AL+hErGsV3F7T4PHK8YzWpiRc83yubvmc+RfRwBTk/aSCHs0SuclBveyMLWWjNc4OYmOiHK/C7w1xtsG7N4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aQz/ii/9tNwK9I46xUuknOSdwWjjguZ1Av5QFcbj6qjyQ0uRv
	Cn3fRcStDUjq3FSvQUeFzwvB5LGxLgT59Tpnl6uBzCbeQlPs8/ikUqNq
X-Gm-Gg: AYBFou0HeHVmjrXk7fltBmImTRrMdXo7yD8YZsB9hKMCyLxlg09H+fPDgcGnyUdzEyp
	yKivzw9UBqXAvcCASVGRU7fQ4uGnjOx1qPxheDwIgAOOzmWGtWPb6ymJABWZ2pXhpofkZ5I59F9
	nhURjhCibjAMbuDqYBBZNdJj9pnTptmLhFrAg/cW1ax89TEAQenCCAHIbS7TB6HqNA7JbD2cDjD
	+KQ5vwJjXeK5MQtb7x+FAFFuc5Ioge4VC+1q5S3STSNTz66YjD8sF/0IvSHlKN7DGSjqSQhfLHt
	UxSCs5GxtIYXjOolG1yutkIuNj2yBDhiWwwxHITHUBfR3EF6gRoGswolYdOoJEki4UPOZ2kFJ5e
	Zq3bYMyvtsn+jFXIPtwb5HewsnqEDH/H3kOV8gjOGG07gP/rxR5u4fvmjchPZUADl2AoBxJIx5R
	gPugC096LgVfbsCLEZ2eIpLvIhK53ZbtHOvt8Z8Kwkd0G19vrzEpfvxYfdeyhzZ021m4oYN/IxQ
	2LQFxPzcCzb9KOL92UWSi7dOnzfZslaBm1jArxlGYvbbbm4m8BbMbWlwv4RzOEBSWGQKkrBlbot
	47xDTTaZrqW2ZE4k7VdRHv9pucRta8NLxEKHZ6wirOU6PvPGQCXLjGYdBOD07d77fwi5ksRheMO
	7Fk89KCNFf6ujexJ191y+qnZa
X-Received: by 2002:a17:90b:3c0a:b0:3b0:9e2c:9b55 with SMTP id 98e67ed59e1d1-3b0db60d73cmr3383069a91.2.1793964959573;
        Fri, 06 Nov 2026 03:35:59 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32b6507sm8343173a91.16.2026.11.06.03.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:35:58 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 02/13] docs/zh_TW: process: add cve.rst translation
Date: Fri,  6 Nov 2026 19:35:33 +0800
Message-ID: <20261106113545.708896-3-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106113545.708896-1-chenyou910331@gmail.com>
References: <20261106113545.708896-1-chenyou910331@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate Documentation/process/cve.rst into Traditional Chinese from
the current English text.  The zh_CN translation was consulted for
wording only.

List the new file in the toctree of process/index.rst, after
security-bugs as in the English index, and drop it from the TODOList.

update to commit 5928d411557e ("Documentation: Document the Linux
Kernel CVE process")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../translations/zh_TW/process/cve.rst        | 90 +++++++++++++++++++
 .../translations/zh_TW/process/index.rst      |  2 +-
 2 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_TW/process/cve.rst

diff --git a/Documentation/translations/zh_TW/process/cve.rst b/Documentation/translations/zh_TW/process/cve.rst
new file mode 100644
index 000000000000..186cd47f5474
--- /dev/null
+++ b/Documentation/translations/zh_TW/process/cve.rst
@@ -0,0 +1,90 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_TW.rst
+
+:Original: Documentation/process/cve.rst
+
+====
+CVEs
+====
+
+Common Vulnerabilities and Exposure（CVE®）編號的設計初衷，是提供一種
+明確的方式，來識別、定義與編錄公開披露的安全漏洞。隨著時間推移，CVE 編號
+對核心專案的用處逐漸降低，而且經常以不恰當的方式、出於不恰當的理由被分配。
+因此，核心開發社群一向傾向迴避它們。然而，要求分配 CVE 及其他形式安全識別
+碼的壓力持續不斷，加上核心社群以外的個人與公司持續濫用，已經清楚顯示核心
+社群應該掌控這些分配。
+
+Linux 核心開發團隊確實有能力為潛在的 Linux 核心安全問題分配 CVE。這項分配
+獨立於 :doc:`一般的 Linux 核心安全缺陷回報流程 <../process/security-bugs>`。
+
+所有已分配給 Linux 核心的 CVE 列表，可以在 linux-cve 郵件列表的存檔中找到，
+見 https://lore.kernel.org/linux-cve-announce/ 。若要收到已分配 CVE 的
+通知，請 `訂閱 <https://subspace.kernel.org/subscribing.html>`_ 該郵件列表。
+
+流程
+====
+
+作為一般穩定版發布流程的一部分，可能構成安全問題的核心變更，會由負責 CVE
+編號分配的開發者辨識出來，並自動為其分配 CVE 編號。這些分配會以公告的形式，
+頻繁地發布在 linux-cve-announce 郵件列表上。
+
+注意，由於 Linux 核心在系統中所處的層級，幾乎任何缺陷都可能被利用來危害
+核心的安全性，但在修復缺陷時，被利用的可能性往往並不明顯。因此，CVE 分配
+團隊採取過度謹慎的做法，會為他們辨識出的任何缺陷修復分配 CVE 編號。這也
+說明了為什麼 Linux 核心團隊發布的 CVE 數量看起來如此之多。
+
+如果 CVE 分配團隊漏掉了某個特定的修復，而任何使用者認為它應該被分配 CVE，
+請寄送電子郵件至 <cve@kernel.org>，那裡的團隊會與你一起處理。請注意，任何
+潛在的安全問題都不應寄到這個信箱，它「僅」用於為已經進入已發布核心樹的修復
+分配 CVE。如果你認為自己發現了一個尚未修復的安全問題，請依照
+:doc:`一般的 Linux 核心安全缺陷回報流程 <../process/security-bugs>` 處理。
+
+Linux 核心中尚未修復的安全問題不會被自動分配 CVE；只有在修復已經可用並套用
+到穩定核心樹之後，才會自動進行分配，並以原始修復的 git commit id 來追蹤。
+如果有人希望在問題透過提交解決之前就分配 CVE，請聯絡核心 CVE 分配團隊
+<cve@kernel.org>，從他們保留的一批識別碼中取得一個。
+
+對於 Stable/LTS 核心團隊目前未積極支援的核心版本中發現的任何問題，都不會
+分配 CVE。目前支援的核心分支列表可在 https://kernel.org/releases.html 找到。
+
+對已分配 CVE 的爭議
+===================
+
+對特定核心變更所分配的 CVE 提出爭議或加以修改的權限，僅屬於受影響的相關
+子系統的維護者。這項原則確保了漏洞回報的高度準確性與可問責性。只有對該子
+系統具備深厚專業知識與深入了解的人，才能有效評估所回報漏洞的有效性與範圍，
+並判定其適當的 CVE 認定。任何在此指定權限之外修改或爭議 CVE 的嘗試，都可
+能導致混亂、不準確的回報，最終危及系統。
+
+無效的 CVE
+==========
+
+如果某個安全問題出現在僅由某個 Linux 發行版支援的 Linux 核心中，原因是該
+發行版所做的變更，或是該發行版支援的核心版本已不再屬於 kernel.org 支援的
+版本之一，那麼 Linux 核心 CVE 團隊無法分配 CVE，必須向該 Linux 發行版本身
+申請。
+
+任何由核心 CVE 分配團隊以外的團體，針對積極支援中的核心版本分配給 Linux
+核心的 CVE，都不應被視為有效的 CVE。請通知核心 CVE 分配團隊
+<cve@kernel.org>，讓他們能透過 CNA 補救流程使這類條目失效。
+
+特定 CVE 的適用性
+=================
+
+由於 Linux 核心可以用許多不同的方式使用，外部使用者存取它的方式也有很多種，
+甚至完全無法存取，因此任何特定 CVE 的適用性應由 Linux 的使用者自行判斷，
+而不是由 CVE 分配團隊決定。請不要聯絡我們，試圖確認任何特定 CVE 的適用性。
+
+此外，由於原始程式碼樹非常龐大，而任何一個系統都只會使用其中一小部分，所有
+Linux 使用者都應該了解，大量已分配的 CVE 與他們的系統並不相關。
+
+簡而言之，我們不知道你的使用情境，也不知道你使用了核心的哪些部分，因此我們
+無從判斷特定的 CVE 是否與你的系統相關。
+
+一如既往，最好採用所有已發布的核心變更，因為它們是由許多社群成員作為一個
+統一的整體一起測試過的，而不是一個個單獨挑選（cherry-pick）出來的變更。
+另外也請注意，對於許多缺陷來說，整體問題的解決方案並不在單一變更中，而是
+由許多層層疊加的修復共同構成。理想情況下，所有問題的所有修復都會被分配
+CVE，但有時我們會沒有注意到某些修復，因此請假設某些沒有分配 CVE 的變更
+也可能值得採用。
diff --git a/Documentation/translations/zh_TW/process/index.rst b/Documentation/translations/zh_TW/process/index.rst
index fd53103aeb33..80fff2203e55 100644
--- a/Documentation/translations/zh_TW/process/index.rst
+++ b/Documentation/translations/zh_TW/process/index.rst
@@ -90,13 +90,13 @@ TODOList:
 
    debugging/index
    security-bugs
+   cve
    embargoed-hardware-issues
 
 TODOList:
 
 * handling-regressions
 * threat-model
-* cve
 
 維護者資訊
 ----------
-- 
2.43.0

