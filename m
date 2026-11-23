Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431810;
	b=cheOKUnPpPebjkw9ErU/NgOKVA4U9XF1RXVBRSVp9SzP/o1Rq2XPsiZcC+HpOnj/TYkZ
	 gJ9JUwhwRRg6/bUg6QAu7jHfMQ+2XS7tVI70Y+dTB25xaDtgcjHUjuaarLEDXUKMwuiSm
	 Vw1fvHAxj8AbAn9TQmbSD5H3sTPW5W4ZZxLxj004HOYkIMUIlhCkQUsSSOK8fJ2AaYR86
	 QK8UePBYV5VlTGIMasXgs0c3/J85+TwYA9oZXCEKs4reSdkUslVVa8/WACvdtI2RsNz7Q
	 1PxMVQ37mZtoGcoNXOsa7iAe1MzuPEhqJRTmIqqcDHkYQ9baSufxcqyzZbOpaI+e79g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431810;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=e2nLHgGNTDdAL2XIOX5N0Mh4udkl5d1c7iimjxNWb5c=;
	b=O6PyaRWSQsCXDsMSaXLImt2dSECWaOT8z9wb/A4Kxs0NPAG9PkYof0xOVD2o9xNUGLA+
	 vaGGDhf6d/N9Dh39LqLbVkvAKxtT7/O1jGQC7+ggfKWTLsmHZHQ/J1Teusrg4RKK7zB3s
	 g/d0Phyl/hGkAkRymRUZC7bMBg1//HWbTCoPpYgVyGJC5jIwP7vGzIY6rDpMzfrUSCVrL
	 R1I3vkV/8Lb3ZdKO3eRoqWyA8+LzeD2yDb9jny7eLFZVodOA9f/quK7TD1C/gOmzkDaib
	 JgTQbZM1HPQZ27GrVBSxjvDV9T/Jee6hK/q+mBVezlsu1pACbUx/10UPnV6rRDoqdlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZE8mDutE;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB5F606A699
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 11:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CB5F606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZE8mDutE
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f02ec4e3c1so1683505ad.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 03:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795431809; x=1796036609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e2nLHgGNTDdAL2XIOX5N0Mh4udkl5d1c7iimjxNWb5c=;
        b=ZE8mDutE4nrrAWABmkE3tGTAbcGqZ590vhMwDYqxzWrq5AvdwCqUIRtkoxwjlapX3j
         1j9piz75RySiTtgBeenJ6YoHav2+lauTNXA8UfSC5s319H0/0i/OZ4NBA/PWriWVFH2+
         3HgGZ0V/wWjveOTuQGz49K0BWzEPK8BbL2szp15Uw5B680PwMaa8MaEt7BJu07wyJYjH
         x4+NKCh0eZ/koaS9u/Rea9xKmiW+zpZiveri0CmyOQHYZcw+ynPHlqE3/oQW9sIqch6E
         JOtRbi6hFHsv0FTTgze9sS3LZjcDW7EGkIGywO9b8Zuc0+HSnHKWoxu9YQqETikBnjSL
         XMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431809; x=1796036609;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e2nLHgGNTDdAL2XIOX5N0Mh4udkl5d1c7iimjxNWb5c=;
        b=NdwSyZQWn27X+SXpntVXYLSRhMf5NqycIdbXc8IJ0vhxp86noukLqC6XuXLApjvaD5
         v77ffluxpvpkCgLtVttaV934nleBbsGRWExHlE9YkQdT8xcpMO2Lzp7bUPRDLl0JQFj4
         seGTr1Vq/55hB/b3ZqZ8SNakxcEEl6BV5knxsNQ8GZmfYnRC8H9C0SFIUaSdmqjI3QKM
         v78SkDXR7mq6x/+M5CwJeUhAWr1dNSxke7tG3wZQx9o3jWYXL5rGXwjz6s2fJo9QggZH
         1SgOY/L822BFT9iqe2CObcBGL/8BSU8iz5HzstkhOAYboUkBiCt/SZiHV1UsxpooUW9x
         NSww==
X-Forwarded-Encrypted: i=1; AL+hErG3XvoIGKtk81UymOUgKAez5sTYA4Lkpg3QUmafqXvAxkZ/tj1tjDV1xsNJ8f+P6wuQuRrNxVGZcSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NMPLttaI3NVV2YRtJ7TOtMljP3+Bx+i9X80xNXuZf4DbHpAsW
	HVjyaclHqcSGuf/o2qNRO9Y4WFON9XZYNMyOf0y6ugt8RVh03pbayVHH
X-Gm-Gg: AZFdTZfjSZlhuCGZLXzf3mJ2liEETfKMoniyk7Cv6NBS17kaHUDgEh8Qfh1Mypq31Y3
	Vt5OW331FvvNwW04SJUSu3OHjOGvUeqL5LNKJ7NK1V/F1AUkQl0y2ir5c/4qwAS3hfKP7cjzKbi
	8WUQEhU92BLiDaWgeANSiRKSTfuHCNxEEdftigHKPSC1ScyK1VZFN5+U2SguA4JUsCHYLGs9l8Z
	N+k3rKXAMC3XhLc5vBrwAUwL+/6bpAuPPqytdUZ0luDOnfW7TxS9JK6FTLvE2/v2WI2Th5CSgs0
	wMVAHPmggGJi4X03q7X5n7rVZaSTv90HC1LvX+DFi1cGuAJ6THMIQJkaQYaZ4DjJz3nhHtegBCM
	1wffrWqfj6ANfERi8QXA5vsBBsJv60XX/J4Nojmm4VfgOzNkcYG+JmDi9c04aUy2FS0QZTgt+23
	EaqYv6rNbyfEd5ZLJXWC33C/w+p6r/UhY6oHAZhoH7y5Af2tXD9mlpykAK/hLNUWpuGhIXNTuVa
	JQyj3V5rb9nPXiVvQnAv7z10jFKKWrS20AEef8RFFOw+ya4HgUwmw2qGrNvUaKxDSl6KwDiupT0
	LZC/q0JffQHiPKo9iU/0KXdNELjcKe0Y6VehgyvpzB5dEkyNkUtiCkLlSyLryE0uUKJbjhmEWFc
	bAunRO829sSvAOB6OKNnQiU4w
X-Received: by 2002:a17:903:b4f:b0:2dd:b95a:e1db with SMTP id d9443c01a7336-2f03f1c9cd7mr179159665ad.3.1795431809282;
        Mon, 23 Nov 2026 03:03:29 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1aa3sm50380785ad.21.2026.11.23.03.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:03:28 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: alexs@kernel.org,
	corbet@lwn.net
Cc: wy@wyuan.org,
	dzm91@hust.edu.cn,
	si.yanteng@linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 20/25] docs/zh_TW: process: sync embargoed-hardware-issues.rst with the English original
Date: Mon, 23 Nov 2026 19:02:11 +0800
Message-ID: <20261123110217.170025-21-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123110217.170025-1-chenyou910331@gmail.com>
References: <20261123110217.170025-1-chenyou910331@gmail.com>
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

The translation is marked "update to commit cead34ac1ce1 ("MAINTAINERS:
update ndesaulniers")", but a comparison against the current English
text shows it never picked up parts of two earlier changes:

- from commit 39fef15b5f2d ("Documentation:
  embargoed-hardware-issues.rst: Clarify prenotifaction"): the team only
  develops fixes, the security officers help coordinate a fix, and the
  incident list is used for coordination of fixes
- from commit a2e4bdca2c36 ("Documentation:
  embargoed-hardware-issues.rst: minor cleanups and fixes"): the
  coordinated release paragraph, including the "no pre-notification
  process" sentence, the "acknowledges or resolves an objection"
  wording, "potential experts" in the subscription paragraph and
  "subscription to incident-specific lists"
- capitalize Git as in commit 4a0be1a25d98 ("Documentation: process:
  Capitalize Git, Quilt, and Mercurial consistently")

Also retranslate sentences whose meaning had drifted: "listed entity"
(rendered as a publicly listed company), "involved developers"
(rendered as vendors), "well-connected" (rendered as easy to contact),
the response team validating the subscription request, and the emails
rather than the list being signed.  Fix the 證書籤名 typo and localize
a few terms (通信→通訊, 行業→產業, 連接→連線, 客戶端→用戶端, 聯繫方式→聯絡方式).

Refer to the zh_TW security-bugs.rst by its path instead of the stale
"Documentation/admin-guide/" :ref: copied from the English text.

update to commit 4a0be1a25d98 ("Documentation: process: Capitalize Git,
Quilt, and Mercurial consistently")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../process/embargoed-hardware-issues.rst     | 53 ++++++++++---------
 1 file changed, 27 insertions(+), 26 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/embargoed-hardware-issues.rst b/Documentation/translations/zh_TW/process/embargoed-hardware-issues.rst
index f5096b9de1a8..97efb4495741 100644
--- a/Documentation/translations/zh_TW/process/embargoed-hardware-issues.rst
+++ b/Documentation/translations/zh_TW/process/embargoed-hardware-issues.rst
@@ -24,15 +24,15 @@
 
 Linux核心硬體安全小組獨立於普通的Linux核心安全小組。
 
-該小組只負責協調被限制的硬體安全問題。Linux核心中純軟體安全漏洞的報告不由
+該小組只負責為被限制的硬體安全問題開發修復。Linux 核心中純軟體安全漏洞的報告不由
 該小組處理，報告者將被引導至常規Linux核心安全小組(
-:ref:`Documentation/admin-guide/<securitybugs>`)聯繫。
+Documentation/translations/zh_TW/process/security-bugs.rst)聯繫。
 
 可以透過電子郵件 <hardware-security@kernel.org> 與小組聯繫。這是一份私密的安全
-官名單，他們將幫助您根據我們的文件化流程協調問題。
+官名單，他們將幫助您根據我們的文件化流程協調修復。
 
 郵件列表是加密的，發送到列表的電子郵件可以透過PGP或S/MIME加密，並且必須使
-用報告者的PGP密鑰或S/MIME證書籤名。該列表的PGP密鑰和S/MIME證書可從以下URL
+用報告者的PGP密鑰或S/MIME證書簽名。該列表的PGP密鑰和S/MIME證書可從以下URL
 獲得：
 
   - PGP: https://www.kernel.org/static/files/hardware-security.asc
@@ -80,29 +80,29 @@ Linux核心社群有一個專門的硬體安全小組負責初始聯繫，並監
 硬體安全小組確定開發人員（領域專家），他們將組成特定問題的初始響應小組。最初
 的響應小組可以引入更多的開發人員（領域專家）以最佳的技術方式解決這個問題。
 
-所有相關開發商承諾遵守限制規定，並對收到的資訊保密。違反承諾將導致立即從當前
+所有相關開發人員承諾遵守限制規定，並對收到的資訊保密。違反承諾將導致立即從當前
 問題中排除，並從所有相關郵件列表中刪除。此外，硬體安全小組還將把違反者排除在
 未來的問題之外。這一後果的影響在我們社群是一種非常有效的威懾。如果發生違規
 情況，硬體安全小組將立即通知相關方。如果您或任何人發現潛在的違規行為，請立即
-向硬體安全人員報告。
+向硬體安全官報告。
 
 流程
 ^^^^
 
 由於Linux核心開發的全球分散式特性，面對面的會議幾乎不可能解決硬體安全問題。
 由於時區和其他因素，電話會議很難協調，只能在絕對必要時使用。加密電子郵件已被
-證明是解決此類問題的最有效和最安全的通信方法。
+證明是解決此類問題的最有效和最安全的通訊方法。
 
 開始披露
 """"""""
 
-披露首先按照上述聯繫方式一節，透過電子郵件聯繫Linux核心硬體安全小組。此
+披露首先按照上述聯絡方式一節，透過電子郵件聯繫Linux核心硬體安全小組。此
 初始聯繫應包含問題的描述和任何已知受影響晶片的列表。如果您的組織製造或分發
 受影響的硬體，我們建議您也考慮哪些其他硬體可能會受到影響。披露方有責任及時
 聯繫受影響的晶片供應商。
 
 硬體安全小組將提供一個特定於事件的加密郵件列表，用於與報告者進行初步討論、
-進一步披露和協調。
+進一步披露和協調修復。
 
 硬體安全小組將向披露方提供一份開發人員（領域專家）名單，在與開發人員確認他們
 將遵守本諒解備忘錄和文件化流程後，應首先告知開發人員有關該問題的資訊。這些開發
@@ -114,12 +114,12 @@ Linux核心社群有一個專門的硬體安全小組負責初始聯繫，並監
 
 披露方應提供已經或應該被告知該問題的所有其他實體的聯繫人名單。這有幾個目的:
 
-  - 披露的實體列表允許跨行業通信，例如其他作業系統供應商、硬體供應商等。
+  - 披露的實體列表允許跨產業通訊，例如其他作業系統供應商、硬體供應商等。
 
   - 可聯繫已披露的實體，指定應參與緩解措施開發的專家。
 
-  - 如果需要處理某一問題的專家受僱於某一上市實體或某一上市實體的成員，則響應
-    小組可要求該實體披露該專家。這確保專家也是實體反應小組的一部分。
+  - 如果需要處理某一問題的專家受僱於某一列出的實體或某一列出的實體的成員，則
+    響應小組可要求該實體披露該專家。這確保專家也是該實體響應小組的一部分。
 
 披露
 """"
@@ -138,8 +138,9 @@ Linux核心社群有一個專門的硬體安全小組負責初始聯繫，並監
 問題開發緩解措施。
 
 郵件列表的操作方式與正常的Linux開發相同。發布、討論和審查修補程式，如果同意，
-則應用於非公共git儲存庫，參與開發人員只能透過安全連接存取該儲存庫。儲存庫包含
-針對主線核心的主開發分支，並根據需要為穩定的核心版本提供向後移植分支。
+則套用到非公開的 Git 儲存庫，參與開發人員只能透過安全連線存取該儲存庫。
+儲存庫包含針對主線核心的主開發分支，並根據需要為穩定的核心版本提供向後
+移植分支。
 
 最初的響應小組將根據需要從Linux核心開發人員社群中確定更多的專家。任何相關
 方都可以建議增補專家，每位專家都須符合上述相同的要求。
@@ -152,7 +153,7 @@ Linux核心社群有一個專門的硬體安全小組負責初始聯繫，並監
 如果披露方有令人信服的理由提出異議，則必須在五個工作日內提出異議，並立即與事件
 小組解決。如果披露方在五個工作日內未作出回應，則視為默許。
 
-在確認或解決異議後，專家由事件小組披露，並進入開發過程。
+在事件小組確認或解決異議後，專家即被披露，並進入開發過程。
 
 列表參與者不得在私有郵件列表之外交流該問題。列表參與者在處理補丁時不得使用
 任何共享資源（例如僱主的建置農場、CI系統等）。
@@ -182,8 +183,8 @@ Linux核心社群有一個專門的硬體安全小組負責初始聯繫，並監
 協調發布
 """"""""
 
-有關各方將協商限制結束的日期和時間。此時，準備好的緩解措施整合到相關的核心樹中
-併發布。
+有關各方將協商限制結束的日期和時間。屆時，準備好的緩解措施將發布到相關的
+核心樹中。沒有任何預先通知流程：緩解措施會公開發布，所有人同時取得。
 
 雖然我們理解硬體安全問題需要協調限制時間，但限制時間應限制在所有有關各方制定、
 測試和準備緩解措施所需的最短時間內。人為地延長限制時間以滿足會議討論日期或其他
@@ -229,12 +230,12 @@ CVE分配
   ============= ========================================================
 
 如果要將您的組織添加到專使名單中，請與硬體安全小組聯繫。被提名的專使必須完全
-理解和支援我們的過程，並且在Linux核心社群中很容易聯繫。
+理解和支援我們的過程，並且最好在 Linux 核心社群中有良好的人脈。
 
 加密郵件列表
 ------------
 
-我們使用加密郵件列表進行通信。這些列表的工作原理是，發送到列表的電子郵件使用
+我們使用加密郵件列表進行通訊。這些列表的工作原理是，發送到列表的電子郵件使用
 列表的PGP密鑰或列表的S/MIME證書進行加密。郵件列表軟體對電子郵件進行解密，並
 使用訂閱者的PGP密鑰或S/MIME證書為每個訂閱者分別對其進行重新加密。有關郵件列表
 軟體和用於確保列表安全和資料保護的設定的詳細資訊，請見：
@@ -249,16 +250,16 @@ S/MIME證書透過特定列表發送的電子郵件傳遞給訂閱者。
 訂閱事件特定列表
 ^^^^^^^^^^^^^^^^
 
-訂閱由響應小組處理。希望參與通信的披露方將潛在訂戶的列表發送給響應組，以便
-響應組可以驗證訂閱請求。
+事件特定列表的訂閱由響應小組處理。希望參與通訊的披露方將潛在專家的列表
+發送給響應小組，以便響應小組可以驗證訂閱請求。
 
 每個訂戶都需要透過電子郵件向響應小組發送訂閱請求。電子郵件必須使用訂閱者
-的PGP密鑰或S/MIME證書籤名。如果使用PGP密鑰，則必須從公鑰伺服器獲得該密鑰，
+的PGP密鑰或S/MIME證書簽名。如果使用PGP密鑰，則必須從公鑰伺服器獲得該密鑰，
 並且理想情況下該密鑰連接到Linux核心的PGP信任網。另請參見:
 https://www.kernel.org/signature.html.
 
-響應小組驗證訂閱者，並將訂閱者添加到列表中。訂閱後，訂閱者將收到來自郵件列
-表的電子郵件，該郵件列表使用列表的PGP密鑰或列表的S/MIME證書籤名。訂閱者的
-電子郵件客戶端可以從簽名中提取PGP密鑰或S/MIME證書，以便訂閱者可以向列表發
-送加密電子郵件。
+響應小組確認訂閱請求有效後，將訂閱者添加到列表中。訂閱後，訂閱者將收到
+來自郵件列表的電子郵件，這些郵件使用列表的PGP密鑰或列表的S/MIME證書簽名。
+訂閱者的電子郵件用戶端可以從簽名中提取PGP密鑰或S/MIME證書，以便訂閱者可以
+向列表發送加密電子郵件。
 
-- 
2.43.0

