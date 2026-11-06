Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964741;
	b=3cc680Qz4fpkqj9AwXEKODqo3RNL1aQYF8MztgI0q0uDh38cowDT622AfnaPpnXbjNAa
	 p9ku7aLvYw0EVIKbWzybU4UzkyoETsAqJmtdrKnqLoU0ACM/+M330vDad49BOqUO9d2lI
	 SCOjtcT6TLx52k3q6fa3C2vEA9YMW4eDAdExfyqGvB1DnU6KdXy7xGnuSxnKu5sWo8+pX
	 J1ypZ/YGVTd4JrwKewfLlS5y2u2p3338KnzzgsVGcHqDfGnI0RTUUzlqb8QtlZ2r8Cjvz
	 xNcHGlSI3o267yaIlXPWWO7CIr79EOXEqT5ki8iqFx1e/LHkhzIyIcaUtmJzfpIp0JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wqx+iIyAhe2d4XXXu3h+vmHZKd4T7+bh2chBWG5DneU=;
	b=jUQLAEp9TEhvrI6jdxA1Qcd9c0GvY00DphumhYqPFM8zKM6g+qzCe+EbJF5etFNYfk0J
	 DodhOZVHS4znWqmBK93etuNTXqG37EPUUfdYONUdtm54HMoeVMjHLhyDV2nbZshrAEZY+
	 Rq/cGCU2r1DNOWLjeQ5pCjduZzmVbOpPsFRF44SAR7Zn7Fnynyyyh7+sAhcTFVlwy8o2Z
	 w/ikT90GKre87XCGZvWctFs55yST0nbkvZMX8JdowMZGagV9KxF37iaqKVLMt5kggA66+
	 2ol+gCUIbf4gCsah6vm9Oj5QotQ6YjCVGxbhaXQlJnKoEic6z8aYJb5621+kCRE67EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CU0dryeT;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B60860A3832
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 11:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B60860A3832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CU0dryeT
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd15c885bdaso67175a12.1
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 03:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964740; x=1794569540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wqx+iIyAhe2d4XXXu3h+vmHZKd4T7+bh2chBWG5DneU=;
        b=CU0dryeTC6lyXLymhzM5DT1SOXzOPDhu1a0UL/VtqOglmhsKyBkm1zIng7+dt3qeYg
         LXs7FqZI1dKTLhBcddXk+R+2vGeVeHF1LsM6oWYixgCw37yqG6YSp1j2VXxRjd9bVLMZ
         3FyyXFhsdENixE56kNvJtYCOR7NmZNENKFNbWNrZmeDkYho3iVu5pgBwA8dSXx+E7uEX
         DTNrT6IRlOjzjkH5joRK4fN4+AXpkac9XGE4mcX29T4EdLW4v87jj0ExaIbvx8Ia5gdY
         HEbXR+YSg702Lr1drhh9I3YWHedYnzSjCMM4f/Y74yNoWqfv0N1WDv8PtN+wDMR4d/8v
         J4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964740; x=1794569540;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wqx+iIyAhe2d4XXXu3h+vmHZKd4T7+bh2chBWG5DneU=;
        b=IL0X6ygwfZW9Udfh6B5NH1vMxM6QqMXjSS4SY8xIp2ICXyBL4QvJgxU2fYrNzHj888
         UXR/Jz1kYDwGcqSThNQVa0rR6zq0zkjbrU2NyvLT6p88PNSJnQRPVRDU1yEJ8Ze5kVAT
         XenR5YrxRZ5gyylZfm6JL8oKXu+LQCyRxo+eQdmK/N9cddIVplwnGpCeL92GnfPXppW6
         T0jkdSpqV6lorRwXbUET4qz4zW4gDAAWnOIibIGKU8f8tb0oQrFE/Cp8PDkP+ZwdyRdZ
         CEAfJWYgAwcZD/Md185CQzkSbkCYchUmwRSChceh/rrb0w/O+flm1GqWYgYpewj/Xzhh
         Lvkw==
X-Forwarded-Encrypted: i=1; AL+hErGrejNjnlR5EiaEd+jo6kgpk9AI/YtnUcCB3XdHtcMkbklQ0pODJdtHToMOHwuJGn2SowSpmnlCH6M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nfttgR66sQUfHsdhGr1bYxPr8MSuYpt4uLCH4s862rzmNg1f2
	b/Ldxwx5KCwrYxQoXNtqT/cevry5Uiw5OcpOqXtExme2m40HEvkhIXJc
X-Gm-Gg: AYBFou0CKqbaZxkqapCXCnhTsklNV4HYgtmVXb6ORosOO7MK+FDNhiuoyCJ6FujcIMY
	d7577AE2kjO30oceyzoVBYi4gl+f1fY/xnoMpgnkiQGRzZMketJthB6aghMFWDGNQJqQRUzBOsz
	O4b9s0EAKZQCt1vBZmwZy/PltokBDsufON45u2KpwXe6g9lYQLYH4BLQwaVFvn3J7d4N1JPtzXq
	GyMkJSRp0l4Xbw2LC2AIkJygLNKe3dEg9LyauTXZav8s5dAGk6tMkjyAHd+YQKKzoprhc4L5i1U
	xoSMzKUVGeuvb2Qkws1JDMxinzatwBK6Hk2i3SofwiCDSIEkHL8Ll6mjqOjCEXZNXctLWsPIKdp
	Jp3jMr/lI4i12j+u7xgmZBC7roc1utpxiP4DKFj9fePnIJ7QiYuCrsbei3tzvUucSmjRqNYqHHY
	7poIuzWtJjrEIIFexbl7lSnBioR9f8kZ6vy3ml6WuWE/1xUPUCISYJZjPAtXDGkBeC/VOxSGf4T
	HN48RU9nnK+p8hKwKy+u3xwPsaE4u7TECN5jV8jqzJo0OInSoi2QYlqw3Os8Ag6bRsaBeB5spnr
	8FTRAt0p0urE31IA36SiWYhRGts1BCjZWc2rzeoCco8W1DUpQtahvrwDpODj9TYtlnhscslir1v
	al4Q3hgR1HSQkezR8vTuULWFO
X-Received: by 2002:a17:90b:448f:b0:3ac:a11a:7c88 with SMTP id 98e67ed59e1d1-3b0db6af9e6mr3352954a91.3.1793964740373;
        Fri, 06 Nov 2026 03:32:20 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7ca4b03sm3116477a91.14.2026.11.06.03.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:32:19 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 09/25] docs/zh_TW: process: sync code-of-conduct.rst with the English original
Date: Fri,  6 Nov 2026 19:31:24 +0800
Message-ID: <20261106113142.706783-10-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106113142.706783-1-chenyou910331@gmail.com>
References: <20261106113142.706783-1-chenyou910331@gmail.com>
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

The translation carried no "update to commit" marker.  A
section-by-section comparison against the current English text shows
that every section is present, including the conduct@kernel.org contact
from commit f3f76d640141 ("Code of Conduct: Change the contact email
address") and the Interpretation section from commit f7e585843217 ("Code
of Conduct: Provide links between the two documents"), but the text was
still a mechanical conversion of zh_CN:

- fix leftover mainland terms (內核, 社區, 項目, 代碼, 信息, 文檔, 通過,
  在線/離線, 帳戶) and use 為 instead of 爲
- retranslate items whose meaning had drifted: "commits" (承諾),
  "ethnicity" (rendered as 種族 like "race"), "socio-economic status"
  (split into two items), "empathy", "unwelcome sexual attention or
  advances", "physical address", "official" project e-mail address and
  social media account, and "online or offline event"
- restore "appropriate to the circumstances" in the Enforcement section
- restructure the Responsibilities sentence so that "inappropriate,
  threatening, offensive, or harmful" qualifies the behaviors for which
  a contributor may be banned

update to commit f3f76d640141 ("Code of Conduct: Change the contact
email address")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/code-of-conduct.rst         | 54 +++++++++----------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/code-of-conduct.rst b/Documentation/translations/zh_TW/process/code-of-conduct.rst
index 0266cd74a0b1..d6b253d3bac6 100644
--- a/Documentation/translations/zh_TW/process/code-of-conduct.rst
+++ b/Documentation/translations/zh_TW/process/code-of-conduct.rst
@@ -6,69 +6,69 @@
 
 .. _tw_code_of_conduct:
 
-貢獻者契約行爲準則
+貢獻者契約行為準則
 ++++++++++++++++++
 
 我們的誓言
 ==========
 
-爲了營造一個開放、友好的環境，我們作爲貢獻者和維護人承諾，讓我們的社區和參
-與者，擁有一個無騷擾的體驗，無論年齡、體型、殘疾、種族、性別特徵、性別認同
-和表達、經驗水平、教育程度、社會狀況，經濟地位、國籍、個人外貌、種族、宗教
-或性身份和取向。
+為了營造一個開放、友好的環境，我們作為貢獻者和維護人員承諾，讓參與我們的專案
+和社群成為每個人都不受騷擾的體驗，無論年齡、體型、身心障礙、族裔、性別特徵、
+性別認同和表達、經驗水平、教育程度、社會經濟地位、國籍、個人外貌、種族、宗教
+或性認同和性取向。
 
 我們的標準
 ==========
 
-有助於創造積極環境的行爲包括：
+有助於創造積極環境的行為包括：
 
 * 使用歡迎和包容的語言
 * 尊重不同的觀點和經驗
 * 優雅地接受建設性的批評
-* 關注什麼對社區最有利
-* 對其他社區成員表示同情
+* 關注什麼對社群最有利
+* 對其他社群成員展現同理心
 
-參與者的不可接受行爲包括：
+參與者的不可接受行為包括：
 
-* 使用性意味的語言或意象以及不受歡迎的性注意或者更過分的行爲
-* 煽動、侮辱/貶損評論以及個人或政治攻擊
+* 使用帶有性意味的語言或圖像，以及不受歡迎的性關注或性挑逗
+* 惡意挑釁、侮辱/貶損的評論以及人身或政治攻擊
 * 公開或私下騷擾
-* 未經明確許可，發佈他人的私人信息，如物理或電子地址。
-* 在專業場合被合理認爲不適當的其他行爲
+* 未經明確許可，公開他人的私人資訊，如實體或電子地址
+* 在專業場合中可被合理認為不適當的其他行為
 
 我們的責任
 ==========
 
-維護人員負責澄清可接受行爲的標準，並應針對任何不可接受行爲採取適當和公平的
+維護人員負責澄清可接受行為的標準，並應針對任何不可接受行為採取適當和公平的
 糾正措施。
 
-維護人員有權和責任刪除、編輯或拒絕與本行爲準則不一致的評論、承諾、代碼、
-wiki編輯、問題和其他貢獻，或暫時或永久禁止任何貢獻者從事他們認爲不適當、
-威脅、冒犯或有害的其他行爲。
+維護人員有權利和責任刪除、編輯或拒絕與本行為準則不一致的評論、提交、程式碼、
+wiki 編輯、問題和其他貢獻，或暫時或永久禁止任何從事他們認為不適當、威脅、
+冒犯或有害之其他行為的貢獻者。
 
 範圍
 ====
 
-當個人代表項目或其社區時，本行爲準則既適用於項目空間，也適用於公共空間。
-代表一個項目或社區的例子包括使用一個正式的項目電子郵件地址，通過一個正式
-的社交媒體帳戶發佈，或者在在線或離線事件中擔任指定的代表。項目維護人員可以
-進一步定義和澄清項目的表示。
+當個人代表專案或其社群時，本行為準則既適用於專案空間，也適用於公共空間。
+代表一個專案或社群的例子包括使用專案的官方電子郵件地址、透過官方社群媒體帳號
+發佈內容，或者在線上或線下活動中擔任指定的代表。專案維護人員可以進一步定義和
+澄清專案的代表方式。
 
 執行
 ====
 
-如有濫用、騷擾或其他不可接受的行爲，可聯繫行爲準則委員會<conduct@kernel.org>。
-所有投訴都將接受審查和調查，並將得到必要和適當的答覆。行爲準則委員會有義務
-對事件報告人保密。具體執行政策的進一步細節可單獨公佈。
+如有濫用、騷擾或其他不可接受的行為，可聯繫行為準則委員會 <conduct@kernel.org>。
+所有投訴都將接受審查和調查，並將得到視情況認為必要和適當的回應。行為準則委員會
+有義務對事件報告人保密。具體執行政策的進一步細節可另行公佈。
 
 歸屬
 ====
 
-本行爲準則改編自《貢獻者契約》，版本1.4，可從
+本行為準則改編自《貢獻者契約》，版本 1.4，可從
 https://www.contributor-covenant.org/version/1/4/code-of-conduct.html 獲取。
 
 解釋
 ====
 
-有關Linux內核社區如何解釋此文檔，請參閱 :ref:`tw_code_of_conduct_interpretation`
-
+有關 Linux 核心社群將如何解釋此文件，請參閱
+:ref:`tw_code_of_conduct_interpretation` 。
-- 
2.43.0

