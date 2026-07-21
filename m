Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707C8437111
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 21:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784671026; cv=none; b=iuSKenY5/m8I+oNo/5Iqq3hxJ8UvxJ09OPkfZZX/wU0FbjrrmjVnRgoBE408oGcEo3D2//YARst1Hbevwa34OAwPBU8hq3xGzqY1MKhHeWZP+Vxr/P2x3F808t82lZVPq9Pci4+POu9wD2HAAGqN1J64b/62MhYTymu3lsx2rkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784671026; c=relaxed/simple;
	bh=MkWwzskM+F0Vu1QL+lizumFtMmug+bFQMdFU8TwBksA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Th5ZVtDgNbpLBCvs/p0JgjEpgL85/IEO9B1T6/ABQE6C+npHICGYp9SV6XvS7V9cK7IWXDXsJCMSPwbLeTnJaqQh/DoFBtInKRdOT+XztmgAJn8S0aUMUsucUf1hPLt06ZMIu6A4rMFyKG+IbdRqXrPkLdaqbNMzcrN22nHMcxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RtkneDvW; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtkneDvW"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ccdce28edeso19577435ad.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 14:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784671023; x=1785275823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YxyNZAmgmpeyhWaC72segR/33zLmkiXKK7rMVQI3s+0=;
        b=RtkneDvWuLwsZlY4KULJ/sQ1N6MUnOGi6MCRxWNYvKPq+sWTmaGwJBbchbqSNsm5rf
         VQBGkPtJsqEGGbVSSyts6bV/1VfcF+DfBNk2uortnpEJRMsmfiddk2SCexKYQILKzEaD
         IxwqAczBTQT0tBmAbk6QQaZa175F2Mc7LCS/ufZpDsU9dq+O4cDdcyvprkyGeZz8Fqga
         qBIMeaKFENRjTYA8lg+eEr3+cmuWLIsvkKu2aqifBIk+/TsUzS5q7etOnRU4hi/FbRnq
         LVfSk7FWIyXlg84DDxeYYm+hiwzTi7ZDps27gVuRLUWePnmbnftM/hHwZeLnb5PpG76z
         VE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784671023; x=1785275823;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YxyNZAmgmpeyhWaC72segR/33zLmkiXKK7rMVQI3s+0=;
        b=SUQ8KBd1t0hIkuJtXdqNvOnvpEijK5HRSedg+gb0iHKSoJ0UyL0LPmq+B6EHiwtO5P
         63oQe+I+hFHcpnV2aRu1lfBrx2s7OiySlx9B2PjPSoWFbmzldI+9Rq9FOIQrngqVTPjJ
         aLT0TQJnjwzeHyfWw87QHsEbIqDYxABd6g8Ce0L7wwm6Iyj5R4mQ5Zn7YjZ1cetnBQmR
         T/nyJShv5jx4UCkcfDLMMwGRI/UiATgbbBFp5N1uP5JTNSRj3E6pdVf4l2OQgNTxUv74
         XzThaLZ0u+58X1ucb/Bk+w1wK8fUqZ0MP05kwTmGuPYKVHoaUSUKzKfhMRtMaSKDbIYW
         dT/g==
X-Forwarded-Encrypted: i=1; AHgh+Rr1N7mBxKnWRBwq/n1qpg7zOKBD7x+VTHeNamnwG8ztf4N5UHMKunpd0Yzb45wpsr9E1NPZDMn5t9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDZY5n5C1fc6IUQ7eiPQCHFciWa3ATqYP6elS6EuEVLDsNNDVf
	Zw9TMitkZAowz+qJnRfkTJllho9LWkPz4o6UnQiOYAFxGfBlSx2sG3WX
X-Gm-Gg: AR+sD10EkIQJfhiuPBt48cFFpHC+i1+B7DEunxavMVYxWAeebBTwqz3pZTsKSsRMNMh
	DI/zgJ7m8MHYrQVlJ5B2gS2kPAJf1rJhym5SkRFS9dEiR9v62jMMkxweSmPK1QlhgNPI8v3B/9J
	+OWIw/RnrZAKTR4OThgBL7KrCyIYkOJcz+Pu4heS7o0bxz6xrOQK6QR8gFRafVpCUJoB7I3Ewo2
	W7iUOqnnkWYceo6T50NXLRZcKNCXi0/PMBK01ujen5uRVbRSJYzZ2BUdZpxMCKVoIK+vVWPG4wi
	GgSXwsEUSPpYT2/sc9R7uJHpop0lVG8osJ3JkdHeyHBENYf+Pv/1M06o601fvLgwv0eVgD5BV4W
	UPMj3S7ofoL0KD2ICNSOUbG5vVkTzykeuu3HQLWqKmrG7XGA2iiN4Bs+tTHRgjtFn0NapMToE+B
	l8pxN4PY99nlqUuTOiRT07caZRkGGNL/mr6Aa7hl5TYaIlcgDDICAYOYGPP+2hV6l3juGXzp7Tb
	uJIRYvdC8ugK4bDKMOGbytGzZMMxi/zgeqV8i85
X-Received: by 2002:a17:902:d2c8:b0:2ca:11ee:b002 with SMTP id d9443c01a7336-2cf904c8742mr5152125ad.5.1784671022302;
        Tue, 21 Jul 2026 14:57:02 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8edea703sm3697115ad.0.2026.07.21.14.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:57:01 -0700 (PDT)
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
Subject: [PATCH 05/16] docs/zh_TW: process: localize terminology in email-clients.rst
Date: Wed, 22 Jul 2026 05:55:31 +0800
Message-ID: <20260721215542.98435-6-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721215542.98435-1-chenyou910331@gmail.com>
References: <20260721215542.98435-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Localize mainland terms to Taiwanese Mandarin (文本→文字, 菜單→選單,
設置→設定, 鼠標→滑鼠, ...) and sync with the English original: mention
the Thunderbird "Toggle Line Wrap" extension as an alternative to
editing mailnews.wraplength.

update to commit 4971ca2007e3 ("docs: process: email-client: add Thunderbird "Toggle Line Wrap" extension")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/email-clients.rst           | 184 +++++++++---------
 1 file changed, 96 insertions(+), 88 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/email-clients.rst b/Documentation/translations/zh_TW/process/email-clients.rst
index 4543c447d797..dbe93571883f 100644
--- a/Documentation/translations/zh_TW/process/email-clients.rst
+++ b/Documentation/translations/zh_TW/process/email-clients.rst
@@ -16,87 +16,88 @@
  - Xiaochen Wang <wangxiaochen0@gmail.com>
  - yaxinsn <yaxinsn@163.com>
  - Hu Haowen <2023002089@link.tyut.edu.cn>
+ - Chen-Yu Yeh <chenyou910331@gmail.com>
 
-Linux郵件客戶端配置信息
+Linux郵件客戶端設定資訊
 =======================
 
 Git
 ---
 
 現在大多數開發人員使用 ``git send-email`` 而不是常規的電子郵件客戶端。這方面
-的手冊非常好。在接收端，維護人員使用 ``git am`` 加載補丁。
+的手冊非常好。在接收端，維護人員使用 ``git am`` 載入補丁。
 
-如果你是 ``git`` 新手，那麼把你的第一個補丁發送給你自己。將其保存爲包含所有
-標題的原始文本。運行 ``git am raw_email.txt`` ，然後使用 ``git log`` 查看更
+如果你是 ``git`` 新手，那麼把你的第一個補丁發送給你自己。將其保存為包含所有
+標題的原始文字。執行 ``git am raw_email.txt`` ，然後使用 ``git log`` 查看更
 改日誌。如果工作正常，再將補丁發送到相應的郵件列表。
 
 
-通用配置
+通用設定
 --------
 
-Linux內核補丁是通過郵件被提交的，最好把補丁作爲郵件體的內嵌文本。有些維護者
+Linux核心補丁是透過郵件被提交的，最好把補丁作為郵件體的內嵌文字。有些維護者
 接收附件，但是附件的內容格式應該是"text/plain"。然而，附件一般是不贊成的，
-因爲這會使補丁的引用部分在評論過程中變的很困難。
+因為這會使補丁的引用部分在評論過程中變得很困難。
 
-同時也強烈建議在補丁或其他郵件的正文中使用純文本格式。https://useplaintext.email
-有助於瞭解如何配置你喜歡的郵件客戶端，並在您還沒有首選的情況下列出一些推薦的
+同時也強烈建議在補丁或其他郵件的正文中使用純文字格式。https://useplaintext.email
+有助於瞭解如何設定你喜歡的郵件客戶端，並在您還沒有首選的情況下列出一些推薦的
 客戶端。
 
-用來發送Linux內核補丁的郵件客戶端在發送補丁時應該處於文本的原始狀態。例如，
+用來發送Linux核心補丁的郵件客戶端在發送補丁時應該處於文字的原始狀態。例如，
 他們不能改變或者刪除製表符或者空格，甚至是在每一行的開頭或者結尾。
 
-不要通過"format=flowed"模式發送補丁。這樣會引起不可預期以及有害的斷行。
+不要透過"format=flowed"模式發送補丁。這樣會引起不可預期以及有害的斷行。
 
 不要讓你的郵件客戶端進行自動換行。這樣也會破壞你的補丁。
 
-郵件客戶端不能改變文本的字符集編碼方式。要發送的補丁只能是ASCII或者UTF-8編碼
-方式，如果你使用UTF-8編碼方式發送郵件，那麼你將會避免一些可能發生的字符集問題。
+郵件客戶端不能改變文字的字元集編碼方式。要發送的補丁只能是ASCII或者UTF-8編碼
+方式，如果你使用UTF-8編碼方式發送郵件，那麼你將會避免一些可能發生的字元集問題。
 
-郵件客戶端應該生成並且保持“References:”或者“In-Reply-To:”郵件頭，這樣郵件會話
+郵件客戶端應該產生並且保持“References:”或者“In-Reply-To:”郵件頭，這樣郵件會話
 就不會中斷。
 
-複製粘帖(或者剪貼粘帖)通常不能用於補丁，因爲製表符會轉換爲空格。使用xclipboard,
-xclip或者xcutsel也許可以，但是最好測試一下或者避免使用複製粘帖。
+複製貼上(或者剪貼貼上)通常不能用於補丁，因為製表符會轉換為空格。使用xclipboard,
+xclip或者xcutsel也許可以，但是最好測試一下或者避免使用複製貼上。
 
 不要在使用PGP/GPG簽名的郵件中包含補丁。這樣會使得很多腳本不能讀取和適用於你的
 補丁。（這個問題應該是可以修復的）
 
-在給內核郵件列表發送補丁之前，給自己發送一個補丁是個不錯的主意，保存接收到的
-郵件，將補丁用'patch'命令打上，如果成功了，再給內核郵件列表發送。
+在給核心郵件列表發送補丁之前，給自己發送一個補丁是個不錯的主意，保存接收到的
+郵件，將補丁用'patch'命令打上，如果成功了，再給核心郵件列表發送。
 
 
 一些郵件客戶端提示
 ------------------
 
-這裏給出一些詳細的MUA配置提示，可以用於給Linux內核發送補丁。這些並不意味是
-所有的軟件包配置總結。
+這裡給出一些詳細的MUA設定提示，可以用於給Linux核心發送補丁。這些並不意味是
+所有的軟體套件設定總結。
 
 說明：
 
-- TUI = 以文本爲基礎的用戶接口
-- GUI = 圖形界面用戶接口
+- TUI = 以文字為基礎的使用者介面
+- GUI = 圖形介面使用者介面
 
 Alpine (TUI)
 ************
 
-配置選項：
+設定選項：
 
-在 :menuselection:`Sending Preferences` 菜單：
+在 :menuselection:`Sending Preferences` 選單：
 
-- :menuselection:`Do Not Send Flowed Text` 必須開啓
+- :menuselection:`Do Not Send Flowed Text` 必須開啟
 - :menuselection:`Strip Whitespace Before Sending` 必須關閉
 
-當寫郵件時，光標應該放在補丁會出現的地方，然後按下 `CTRL-R` 組合鍵，使指
-定的補丁文件嵌入到郵件中。
+當寫郵件時，游標應該放在補丁會出現的地方，然後按下 `CTRL-R` 組合鍵，使指
+定的補丁檔案嵌入到郵件中。
 
 Claws Mail (GUI)
 ****************
 
 可以用，有人用它成功地發過補丁。
 
-用 :menuselection:`Message-->Insert File` (`CTRL-I`) 或外置編輯器插入補丁。
+用 :menuselection:`Message-->Insert File` (`CTRL-I`) 或外部編輯器插入補丁。
 
-若要在Claws編輯窗口重修改插入的補丁，需關閉
+若要在Claws編輯視窗重修改插入的補丁，需關閉
 :menuselection:`Configuration-->Preferences-->Compose-->Wrapping`
 的 `Auto wrapping` 。
 
@@ -107,49 +108,49 @@ Evolution (GUI)
 
 撰寫郵件時：
 從 :menuselection:`格式-->段落樣式-->預格式化` (`CTRL-7`)
-或工具欄選擇 :menuselection:`預格式化` ；
+或工具列選擇 :menuselection:`預格式化` ；
 
 然後使用：
-:menuselection:`插入-->文本文件...` (`ALT-N x`) 插入補丁文件。
+:menuselection:`插入-->文字檔...` (`ALT-N x`) 插入補丁檔案。
 
 你還可以 ``diff -Nru old.c new.c | xclip`` ，選擇 :menuselection:`預格式化` ，
-然後使用鼠標中鍵進行粘帖。
+然後使用滑鼠中鍵進行貼上。
 
 Kmail (GUI)
 ***********
 
 一些開發者成功的使用它發送補丁。
 
-默認撰寫設置禁用HTML格式是合適的；不要啓用它。
+預設撰寫設定禁用HTML格式是合適的；不要啟用它。
 
 當書寫一封郵件的時候，在選項下面不要選擇自動換行。唯一的缺點就是你在郵件中輸
-入的任何文本都不會被自動換行，因此你必須在發送補丁之前手動換行。最簡單的方法
-就是啓用自動換行來書寫郵件，然後把它保存爲草稿。一旦你在草稿中再次打開它，它
+入的任何文字都不會被自動換行，因此你必須在發送補丁之前手動換行。最簡單的方法
+就是啟用自動換行來書寫郵件，然後把它保存為草稿。一旦你在草稿中再次開啟它，它
 已經全部自動換行了，那麼你的郵件雖然沒有選擇自動換行，但是還不會失去已有的自
 動換行。
 
-在郵件的底部，插入補丁之前，放上常用的補丁定界符：三個連字符(``---``)。
+在郵件的底部，插入補丁之前，放上常用的補丁定界符：三個連字元(``---``)。
 
-然後在 :menuselection:`信件` 菜單，選擇 :menuselection:`插入文本文件` ，接
-着選取你的補丁文件。還有一個額外的選項，你可以通過它配置你的創建新郵件工具欄，
-加上 :menuselection:`插入文本文件` 圖標。
+然後在 :menuselection:`信件` 選單，選擇 :menuselection:`插入文字檔` ，接
+著選取你的補丁檔案。還有一個額外的選項，你可以透過它設定你的建立新郵件工具列，
+加上 :menuselection:`插入文字檔` 圖示。
 
-將編輯器窗口拉到足夠寬避免折行。對於KMail 1.13.5 (KDE 4.5.4)，它會在發送郵件
-時對編輯器窗口中顯示折行的地方自動換行。在選項菜單中取消自動換行仍不能解決。
-因此，如果你的補丁中有非常長的行，必須在發送之前把編輯器窗口拉得非常寬。
+將編輯器視窗拉到足夠寬避免折行。對於KMail 1.13.5 (KDE 4.5.4)，它會在發送郵件
+時對編輯器視窗中顯示折行的地方自動換行。在選項選單中取消自動換行仍不能解決。
+因此，如果你的補丁中有非常長的行，必須在發送之前把編輯器視窗拉得非常寬。
 參見：https://bugs.kde.org/show_bug.cgi?id=174034
 
-你可以安全地用GPG簽名附件，但是內嵌補丁最好不要使用GPG簽名它們。作爲內嵌文本
+你可以安全地用GPG簽名附件，但是內嵌補丁最好不要使用GPG簽名它們。作為內嵌文字
 插入的簽名補丁將使其難以從7-bit編碼中提取。
 
 如果你非要以附件的形式發送補丁，那麼就右鍵點擊附件，然後選擇
-:menuselection:`屬性` ，打開 :menuselection:`建議自動顯示` ，使附件內聯更容
+:menuselection:`屬性` ，開啟 :menuselection:`建議自動顯示` ，使附件內聯更容
 易讓讀者看到。
 
-當你要保存將要發送的內嵌文本補丁，你可以從消息列表窗格選擇包含補丁的郵件，然
-後右鍵選擇 :menuselection:`另存爲` 。如果整個電子郵件的組成正確，您可直接將
-其作爲補丁使用。電子郵件以當前用戶可讀寫權限保存，因此您必須 ``chmod`` ，以
-使其在複製到別處時用戶組和其他人可讀。
+當你要保存將要發送的內嵌文字補丁，你可以從訊息列表窗格選擇包含補丁的郵件，然
+後右鍵選擇 :menuselection:`另存新檔` 。如果整個電子郵件的組成正確，您可直接將
+其作為補丁使用。電子郵件以當前使用者可讀寫權限保存，因此您必須 ``chmod`` ，以
+使其在複製到別處時使用者組和其他人可讀。
 
 Lotus Notes (GUI)
 *****************
@@ -167,9 +168,9 @@ Mutt (TUI)
 很多Linux開發人員使用mutt客戶端，這證明它肯定工作得非常漂亮。
 
 Mutt不自帶編輯器，所以不管你使用什麼編輯器，不自動斷行就行。大多數編輯器都有
-:menuselection:`插入文件` 選項，它可以在不改變文件內容的情況下插入文件。
+:menuselection:`插入檔案` 選項，它可以在不改變檔案內容的情況下插入檔案。
 
-用 ``vim`` 作爲mutt的編輯器::
+用 ``vim`` 作為mutt的編輯器::
 
   set editor="vi"
 
@@ -181,21 +182,21 @@ Mutt不自帶編輯器，所以不管你使用什麼編輯器，不自動斷行
 
   :r filename
 
-把補丁插入爲內嵌文本。
-在未設置  ``set paste`` 時(a)ttach工作的很好。
+把補丁插入為內嵌文字。
+在未設定  ``set paste`` 時(a)ttach工作的很好。
 
-你可以通過 ``git format-patch`` 生成補丁，然後用 Mutt發送它們::
+你可以透過 ``git format-patch`` 產生補丁，然後用 Mutt發送它們::
 
     $ mutt -H 0001-some-bug-fix.patch
 
-配置選項：
+設定選項：
 
-它應該以默認設置的形式工作。
-然而，把 ``send_charset`` 設置一下也是一個不錯的主意::
+它應該以預設設定的形式工作。
+然而，把 ``send_charset`` 設定一下也是一個不錯的主意::
 
   set send_charset="us-ascii:utf-8"
 
-Mutt 是高度可配置的。 這裏是個使用mutt通過 Gmail 發送的補丁的最小配置::
+Mutt 是高度可設定的。 這裡是個使用mutt透過 Gmail 發送的補丁的最小設定::
 
   # .muttrc
   # ================  IMAP ====================
@@ -222,7 +223,7 @@ Mutt 是高度可配置的。 這裏是個使用mutt通過 Gmail 發送的補丁
   set from = "username@gmail.com"
   set use_from = yes
 
-Mutt文檔含有更多信息：
+Mutt文件含有更多資訊：
 
     https://gitlab.com/muttmua/mutt/-/wikis/UseCases/Gmail
 
@@ -235,7 +236,7 @@ Pine過去有一些空格刪減問題，但是這些現在應該都被修復了
 
 如果可以，請使用alpine（pine的繼承者）。
 
-配置選項：
+設定選項：
 
 - 最近的版本需要 ``quell-flowed-text``
 - ``no-strip-whitespace-before-send`` 選項也是需要的。
@@ -244,23 +245,23 @@ Pine過去有一些空格刪減問題，但是這些現在應該都被修復了
 Sylpheed (GUI)
 **************
 
-- 內嵌文本可以很好的工作（或者使用附件）。
+- 內嵌文字可以很好的工作（或者使用附件）。
 - 允許使用外部的編輯器。
 - 收件箱較多時非常慢。
-- 如果通過non-SSL連接，無法使用TLS SMTP授權。
-- 撰寫窗口的標尺很有用。
+- 如果透過non-SSL連接，無法使用TLS SMTP授權。
+- 撰寫視窗的標尺很有用。
 - 將地址添加到通訊簿時無法正確理解顯示的名稱。
 
 Thunderbird (GUI)
 *****************
 
-Thunderbird是Outlook的克隆版本，它很容易損壞文本，但也有一些方法強制修正。
+Thunderbird是Outlook的翻版，它很容易損壞文字，但也有一些方法強制修正。
 
-在完成修改後（包括安裝擴展），您需要重新啓動Thunderbird。
+在完成修改後（包括安裝擴展），您需要重新啟動Thunderbird。
 
 - 允許使用外部編輯器：
 
-  使用Thunderbird發補丁最簡單的方法是使用擴展來打開您最喜歡的外部編輯器。
+  使用Thunderbird發補丁最簡單的方法是使用擴展來開啟您最喜歡的外部編輯器。
 
   下面是一些能夠做到這一點的擴展樣例。
 
@@ -270,43 +271,50 @@ Thunderbird是Outlook的克隆版本，它很容易損壞文本，但也有一
 
     https://addons.thunderbird.net/en-GB/thunderbird/addon/external-editor-revived/
 
-    它需要安裝“本地消息主機（native messaging host）”。
-    參見以下文檔:
+    它需要安裝“本地訊息主機（native messaging host）”。
+    參見以下文件:
     https://github.com/Frederick888/external-editor-revived/wiki
 
   - “External Editor”
 
     https://github.com/exteditor/exteditor
 
-    下載並安裝此擴展，然後打開 :menuselection:`新建消息` 窗口, 用
-    :menuselection:`查看-->工具欄-->自定義...` 給它增加一個按鈕，直接點擊此
-    按鈕即可使用外置編輯器。
+    下載並安裝此擴展，然後開啟 :menuselection:`新增訊息` 視窗, 用
+    :menuselection:`查看-->工具列-->自訂...` 給它增加一個按鈕，直接點擊此
+    按鈕即可使用外部編輯器。
 
     請注意，“External Editor”要求你的編輯器不能fork，換句話說，編輯器必須在
-    關閉前不返回。你可能需要傳遞額外的參數或修改編輯器設置。最值得注意的是，
-    如果您使用的是gvim，那麼您必須將 :menuselection:`external editor` 設置的
-    編輯器字段設置爲 ``/usr/bin/gvim --nofork"`` （假設可執行文件在
+    關閉前不返回。你可能需要傳遞額外的參數或修改編輯器設定。最值得注意的是，
+    如果您使用的是gvim，那麼您必須將 :menuselection:`external editor` 設定的
+    編輯器欄位設定為 ``/usr/bin/gvim --nofork"`` （假設可執行檔在
     ``/usr/bin`` ），以傳遞 ``-f`` 參數。如果您正在使用其他編輯器，請閱讀其
     手冊瞭解如何處理。
 
 若要修正內部編輯器，請執行以下操作：
 
-- 修改你的Thunderbird設置，不要使用 ``format=flowed`` ！
-  回到主窗口，按照
-  :menuselection:`主菜單-->首選項-->常規-->配置編輯器...`
-  打開Thunderbird的配置編輯器。
+- 修改你的Thunderbird設定，不要使用 ``format=flowed`` ！
+  回到主視窗，按照
+  :menuselection:`主選單-->偏好設定-->常規-->設定編輯器...`
+  開啟Thunderbird的設定編輯器。
 
-  - 將 ``mailnews.send_plaintext_flowed`` 設爲 ``false``
+  - 將 ``mailnews.send_plaintext_flowed`` 設為 ``false``
 
-  - 將 ``mailnews.wraplength`` 從 ``72`` 改爲 ``0``
+  - 將 ``mailnews.wraplength`` 從 ``72`` 改為 ``0`` ，**或者** 安裝
+    “Toggle Line Wrap”擴展
+
+    https://github.com/jan-kiszka/togglelinewrap
+
+    https://addons.thunderbird.net/thunderbird/addon/toggle-line-wrap
+
+    以便即時控制此設定項。
 
 - 不要寫HTML郵件！
-  回到主窗口，打開
-  :menuselection:`主菜單-->賬戶設置-->你的@郵件.地址-->通訊錄/編寫&地址簿` ，
-  關掉 ``以HTML格式編寫消息`` 。
+  回到主視窗，開啟
+  :menuselection:`主選單-->帳戶設定-->你的@郵件.地址-->通訊錄/編寫&地址簿` ，
+  關掉 ``以HTML格式編寫訊息`` 。
 
-- 只用純文本格式查看郵件！
-  回到主窗口， :menuselection:`主菜單-->查看-->消息體爲-->純文本` ！
+- 只用純文字格式查看郵件！
+  回到主視窗， :menuselection:`主選單-->查看-->訊息體為-->純文字` ！
 
 TkRat (GUI)
 ***********
@@ -318,12 +326,12 @@ Gmail (Web GUI)
 
 不要使用它發送補丁。
 
-Gmail網頁客戶端自動地把製表符轉換爲空格。
+Gmail網頁客戶端自動地把製表符轉換為空格。
 
-雖然製表符轉換爲空格問題可以被外部編輯器解決，但它同時還會使用回車換行把每行
-拆分爲78個字符。
+雖然製表符轉換為空格問題可以被外部編輯器解決，但它同時還會使用回車換行把每行
+拆分為78個字元。
 
-另一個問題是Gmail還會把任何含有非ASCII的字符的消息改用base64編碼，如歐洲人的
+另一個問題是Gmail還會把任何含有非ASCII的字元的訊息改用base64編碼，如歐洲人的
 名字。
 
 
-- 
2.43.0

