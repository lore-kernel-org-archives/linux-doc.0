Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432014;
	b=29nSbYuKNBB+587YRbMl+HrL+zRgwOxldPYTzcu/PsUXxE9HuI0PXDcisQZR6tpfnb39
	 uY2BKbLCXHHFD3ueaxtAYDET8XOa2o3tq3+72J8pSfZAOUWrBnbFlPHSZxVUICeCXvTQI
	 9r/GtiTYKQIjJqW+n9wKq0f9+YgxCZ+0IUoUk/+Vq7DtMV2h7H0dW5edPIfi1z6O2kitH
	 KqH5om+97GdhZKUmWX5jcsGJYFoVO6AWAvdTr+9t0VgRaT3wfXpAoarwWT1KItr+k3x8f
	 f9+AZV5L7yWzJm7txGMy6SXJBtuNq76Qw8MLA1LeadRyv3rUgZ7rjzc/IUlGq8SnkXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=UBi8ffpUVq2DEgCD2ok6KZJXbr+tM2D+x6SEBDyvQ8I=;
	b=aat/ytk2BRRE0QRcQVYUSFozMilje4D/j4A4v185myjiEdYdcbAnyOjaomwHQHz9Sn5Y
	 FwC2Q4ezheI2UJB6G5MNJybBEa1Gw675MsUXIsJBzIFWvGjQp0Cp5UGEmI6SNLi666iwA
	 tRMd9cNJDpxlfv5v/SwywPEikCfm1z/fH8zJOs8KrA1v8IFcRsx6HFhbNsMPpLhMGP7E8
	 8UYDI7teX+7DsLcK63ft8YUtepyUb8pm5fm09Avs5OE+BUSj7LrAi8yDry2G+H+Csw+Pj
	 qdotmtWDWbHH06WyQnvrUK8g8Jk24IDM+hLKTUsr/FEP7fugiwHb7clAGYUv4tQrHEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=npPsxfuU;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA011606A32C
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 11:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA011606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=npPsxfuU
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-384d74c9dfdso403876eec.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 03:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432013; x=1796036813; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UBi8ffpUVq2DEgCD2ok6KZJXbr+tM2D+x6SEBDyvQ8I=;
        b=npPsxfuUfB/QADMEfbU32ob8DsR8Gj3f34w93KOGb44pG8C7IHpoDNmeXLS+dQYR5b
         ds3igzdDaweJHJ392GIfiaBqkqQuryBzqufIlOu/yJvXLfyqoHvi/QWMV2WRplkY0hP6
         LbvSx4eOVuSV7Nal+U9yFp9z2of7s1lbDr+F4OeXVHBMyCWaMNdrqNVw7XIFDqBCdfDf
         X43AokV3wMEpkonTXdOS86bseVR8C1FuNN9mWYo82oRGGiyJ9W2GA5u4Yd5Lg3expUqP
         Cay8z1cWGjFnRywCOahhzPMuIfiJpmkVY/MdHlPcPAp/35+DL6X21VVd2/rJuBkpHz8P
         hF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432013; x=1796036813;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UBi8ffpUVq2DEgCD2ok6KZJXbr+tM2D+x6SEBDyvQ8I=;
        b=wVuKyBWtS/KEpgYkG6NB2DDO+0tSVbeGjSvUpvVgMLklP84SkmHrPMscp9ibHVtOR/
         RuX1PauXxFzpJmd3OQ3DcmRsrMR3DGtHASCnTSHvR9VxjUP7Z4iCa+DYiBzAPALU7zGH
         67wVDkkWZFbY0bqnQZEuNTWxBWkxiibGKFdTzO/+0lp5gItoqwlXY8O4h8DnUkzyhcIr
         ybI0evR3AzGQuuvNNQi+HI+CN0Vw2HbEXRA3BFFeJMLXUVW4+UZRAeLu7Bo8YPmM8Bbx
         BgoQHxgcIlJq1meEl/a1UjHme/8hy/nXwz8j6TXtdWhzqSD9wLpIH96WVaEx+fpqX2Ix
         yuTw==
X-Forwarded-Encrypted: i=1; AL+hErFuUUthJIaCLDM+AlbGs7RNvRkeGg4TxunDwt0R9NT0i+EHwxlHCBW6D2A6pm1MdCt+jWiyPrZA9yE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Qif0qAnNE/DnD8PEDttukplM8+dCvDIjTrCNCqtW1ryCHg44i
	8EPOmxguc+/IVuYNPCW4706HRKeMU8Q385vCkxTJaHga7dZRmWyEzVoY
X-Gm-Gg: AZFdTZcKVVEUI4TG1Cim1YN9qLJjBP9sp+FtgrlX8AOHftWRZjJm5mcw0fS98U4/1NL
	+HwdKjzwH/H7uUKdvydgapo0iqaxVgKXk2vf937uoHYse38Byl2YL8bdra2XUByy5pqPowao+qW
	O0EvsZfyPabSqMtqm8WdwCUtL7lh9rMZiZZS5tw5gMJn7iC0EQ1t4BQyO5E/riXGrTWLyy3YGBD
	Yo2vSq5DRi+W9zOX0sIhROGeCBKOoSAb2RK580s+uDr3D5Zrxl8SiUOhA7qJ2rqDDjfvLIxUTb1
	wPMA2wI1FI44odlPseyHukLk2m+p5TBlSXXUIg+htocdvVF9xe6Kzg+vF0M3QI9PeS5QQgKbtlu
	iHXKwFT10l//ScR9HymQX7zDEA8XrWU3cRqFGB/WMGyhY4AcVCZXWhhDOr9M+8vfofw93TBh4gb
	AMHKdL5L6AeDffgoDEVwcrleiIU3G7JA9ZDSnxuYsWaKy3U8llfZz/Iem3dUoUK1zFcFYwWuGEU
	KSEi+dAhP84doyuny7RNGbALF/rRbRnS/nmY/qWf8bi79QBBTCNds3ygdizWiKYBxTK3jwS2boX
	T7fTuYCm8tm5F/hNjbz9pxq2Ky+gF/0urnzXddNNZlJaOFvEvrDEHUCpv7n/U+KcJ8dmxX4+yu3
	BejSmvUrysM78vVBqosxWZhRBUPge5ohR38eA8/0HvufgHQ==
X-Received: by 2002:a05:701b:4554:10b0:1b5:4596:8371 with SMTP id a92af1059eb24-1b5566e72c7mr16919931c88.0.1795432012763;
        Mon, 23 Nov 2026 03:06:52 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm30054074c88.6.2026.11.23.03.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:06:52 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: alexs@kernel.org,
	corbet@lwn.net
Cc: wy@wyuan.org,
	dzm91@hust.edu.cn,
	si.yanteng@linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 02/13] docs/zh_TW: process: add cve.rst translation
Date: Mon, 23 Nov 2026 19:06:25 +0800
Message-ID: <20261123110637.172045-3-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123110637.172045-1-chenyou910331@gmail.com>
References: <20261123110637.172045-1-chenyou910331@gmail.com>
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

