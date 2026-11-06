Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964753;
	b=qHNfPXFHe/FGxTFsNk5mMTs7vq7kxEuqZ1NE9ciEUsmYomI+d4vk6uM8bmyw3dJkTw75
	 PNRbAm1x2sZW5pcZdrFo7hcrzLc6zkbGsONJEOcZj+VfLA5QaaSh6F+u1YlMzkFqDjCJG
	 Grpyd/uUnQ6wfmgZgz3tRFAxw0AWs2KrUXyicRnC4xOrR2GxZ4Hp7xiA+oHOE8UPh5K3S
	 AfmZAwJQMcZ8aCknjRIJrWhiJsIYrE1UxYysYv9lo6iY+0q7weo9A07Dg8mtfMlv0saih
	 882du1hG418/nVa122fnzKvTwjU7eGE5oURbhvbokMwdhgCR9hjzxqhrkYKHcDPoGXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=EaKFFFlfaV8jbaqUSy6SWPaxBjzsfTT5mqLbST2f1FE=;
	b=nsLn7Zil8Yk4cm/tfao6Xp8iA7UcmoinXrHuGKDU7OPe4KMgISMi+/4sm/kAsHkOo/jt
	 kmqWM8gTiND7wrby4qUTAiEzN72YfaMm6HEbOInB4RHKv78FgXkaUqghydJY2mPToCJ9P
	 dqdFT0WXmOc+JFWiVQwqbjX9m5xpmkYET+pt1Le93betRyHYQ7gMuHWUB0qWP9a6pneO3
	 9BO6jIBblbOgmoN6P8O3cJXS7IW/7GAbvU+J5V5dxCgJ7owUWT8/mATuF1l76EX/nm4oN
	 HXRlAo+55N56pYPvoiw87DTBjQKBoQZl0t36Cp4DJPEAm5wEbJ7K5sZPALO1Wt7wfGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dN9IVw4U;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B8260A2629
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 11:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0B8260A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dN9IVw4U
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ae1a9e187aso73887a91.3
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 03:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964751; x=1794569551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EaKFFFlfaV8jbaqUSy6SWPaxBjzsfTT5mqLbST2f1FE=;
        b=dN9IVw4UsPxC9LgPzR3qvvnSK16L//w1EychtMDKeKJ07MAh7eCA0rd8oieE4u3jdi
         OwHlH6TCcKp8r7utXnp6K2wHHJxOyRgma5SqNUXDNjOiHrCwwAwU4V0c7nrJPwmr+nWW
         HTbdNVv2oMPnkg5OpYksGwwgxfY28PFubTZt1eeEga9c+ZC+bfWCGSTf+NSXRe8tFYHd
         bG6YPm3Av5rKZFj+75eHW66U3nFcoSDRVtCqnYrQVtb2pgRg6YQZlv9MeQG3x10e4QdF
         dq0OTX0Fm49vstNbjqgOHPjO7LpdW+nwqV+FmnmVVNRcF9Y1ZyUl17hwUzTA2vV+qCkg
         4XwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964751; x=1794569551;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EaKFFFlfaV8jbaqUSy6SWPaxBjzsfTT5mqLbST2f1FE=;
        b=kyY7cR462zVOMQmSg5D3VP9mA3f65LsjfkDEHOzhcNcZRCNIkvcmRXhmS9AZutJKSl
         FunB4ztE0lzq6yopWZ4ETvyDFj8tYS1tCPHDeaCQTMO4yS9LlGxFII4jZQP+hW3ddj7d
         VYnYbR6CMCczYHhsPDIX3XUGOgktK+nd9YBeGvXOl+KFX9H2sLyHOFicGUHdJXd0Iv36
         uoGoAhcXPM5E1YoY1FWzjh1BV8FWh7x8tlxovFZ+IFGeDiZrQe7F1KlaK/TmOnpGZoUW
         HtzAYFqVjgQAPrZdz0z1Mj60e4kP2hKxwyWM4bHjXZhLwQhSeSgoBckCrOJ/POi8665j
         +LpQ==
X-Forwarded-Encrypted: i=1; AL+hErH2Lss+anCRX0ZDB1Q9LgJpgjdeyuWufjp+bfzU4yF8P7PgH+wqZWf1AJdYM3KQIO0BJF4OvPCepe0=@vger.kernel.org
X-Gm-Message-State: APuU4Z94GMP0xYS/Z//wl9TK/qD1KMPZrx4akeY9grfreA+S42Qy2NuC
	P85X/cLGR4XSTgTdNMmONzAMSbFHXN7GnzC34HQHf+PaUqQeDYCFbslVlccxOw9x
X-Gm-Gg: AYBFou0d8L8HFxE9v0MuwoV1mUu5E0U9TqguFPHnVoknYbISHMhahDAVwwABeyfZuWC
	EIDOk4hsRmyqfYKJiYHPzs8uQFLVl43ooZBYIumQ/VT3O9aMgMM8fZLfnbBW8pAaycnrF1pO1eM
	lW2gwDujtAwEWUNjtFTqf52ikfPAYF/YLASmSltYp6tNCxuCdTAwpHjgfY4oTnrK5/ARje0V2Om
	1lMfBnU/TAzHghOUzbthPXK7lJpVcmjVso9JMvwcG/48VKs4tdSV3B5SKys5sTRCz0K3FpcrVBF
	i3Td4mZJSes6NeS7huBMbykkDK5WAbiwSM/YrD7KLjB2mO+3rKn5ed0Qiwpyzp2uSeD4meWtKQi
	D/QrWLfrcnfZESsGBf2XfRsP7HQ5Wukn9EszPDzQnFbuTAU396kXpVqOuZtCm6e1bbzGtD0Imae
	PU4hkJ5ZkGbDhR257VwyI0NbqMfhCR57qqd8IsXPkQUgXYpcT43iAwOh1DY1kdJW78X/BHcKxbU
	kbZAWAqr1HkXsZoWD6RqBbhFarwWC6BLkbclRdr+loYC7NuOXUAbiP+dpq3bDn7uerJRyyfBPN/
	UGX9yCmoiBrTi1wvs1O0mpHMNuJ2jUPZ5/ggxqZYOXJmCHkW95Xb8VWui7lxuyiG7xLebRta+aB
	FzxepsL9g3CoSzjHgVzjwF72g
X-Received: by 2002:a17:90b:2248:b0:3a6:e1d1:e511 with SMTP id 98e67ed59e1d1-3b0db6db6f3mr3429036a91.4.1793964750639;
        Fri, 06 Nov 2026 03:32:30 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7ca4b03sm3116477a91.14.2026.11.06.03.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:32:29 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 12/25] docs/zh_TW: process: sync email-clients.rst with the English original
Date: Fri,  6 Nov 2026 19:31:27 +0800
Message-ID: <20261106113142.706783-13-chenyou910331@gmail.com>
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

The translation is marked "update to commit 4971ca2007e3 ("docs:
process: email-client: add Thunderbird "Toggle Line Wrap" extension")",
but it never picked up commit 7fe7de7be828 ("Docs/process/email-clients:
Document HacKerMaiL") or the IMAP comment alignment from
commit 91031ca349ee ("docs: improve comment consistency in .muttrc
example configuration").  A comparison against the current English text
brings it in line with the full current original:

- add the missing HacKerMaiL (TUI) section
- restore the omitted "find the button for your main dropdown menu"
  step in the Thunderbird section
- keep text/plain, format=flowed, enabled/disabled, mutt and the
  youracc@server.something placeholder as literals, as in the original
- align the "IMAP" comment in the .muttrc example with the original
- fix mistranslations: "apply" (適用於→套用), "does not work" for
  Gmail, "graphical user interface" and a typo in the Claws section
- localize terminology (保存→儲存, 擴展→擴充套件, 點擊→點選, 禁用→停用,
  連接→連線, 查看→檢視, 會話→討論串, 內聯→行內, 回車換行→CRLF)

update to commit 4971ca2007e3 ("docs: process: email-client: add
Thunderbird "Toggle Line Wrap" extension")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/email-clients.rst           | 78 ++++++++++---------
 1 file changed, 42 insertions(+), 36 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/email-clients.rst b/Documentation/translations/zh_TW/process/email-clients.rst
index 272e3073521d..b3d97e9e83c0 100644
--- a/Documentation/translations/zh_TW/process/email-clients.rst
+++ b/Documentation/translations/zh_TW/process/email-clients.rst
@@ -15,8 +15,8 @@ Git
 現在大多數開發人員使用 ``git send-email`` 而不是常規的電子郵件客戶端。這方面
 的手冊非常好。在接收端，維護人員使用 ``git am`` 載入補丁。
 
-如果你是 ``git`` 新手，那麼把你的第一個補丁發送給你自己。將其保存為包含所有
-標題的原始文字。執行 ``git am raw_email.txt`` ，然後使用 ``git log`` 查看更
+如果你是 ``git`` 新手，那麼把你的第一個補丁發送給你自己。將其儲存為包含所有
+標題的原始文字。執行 ``git am raw_email.txt`` ，然後使用 ``git log`` 檢視更
 改日誌。如果工作正常，再將補丁發送到相應的郵件列表。
 
 
@@ -24,7 +24,7 @@ Git
 --------
 
 Linux核心補丁是透過郵件被提交的，最好把補丁作為郵件體的內嵌文字。有些維護者
-接收附件，但是附件的內容格式應該是"text/plain"。然而，附件一般是不贊成的，
+接收附件，但是附件的內容格式應該是 ``text/plain`` 。然而，附件一般是不贊成的，
 因為這會使補丁的引用部分在評論過程中變得很困難。
 
 同時也強烈建議在補丁或其他郵件的正文中使用純文字格式。https://useplaintext.email
@@ -34,7 +34,7 @@ Linux核心補丁是透過郵件被提交的，最好把補丁作為郵件體的
 用來發送Linux核心補丁的郵件客戶端在發送補丁時應該處於文字的原始狀態。例如，
 他們不能改變或者刪除製表符或者空格，甚至是在每一行的開頭或者結尾。
 
-不要透過"format=flowed"模式發送補丁。這樣會引起不可預期以及有害的斷行。
+不要透過 ``format=flowed`` 模式發送補丁。這樣會引起不可預期以及有害的斷行。
 
 不要讓你的郵件客戶端進行自動換行。這樣也會破壞你的補丁。
 
@@ -42,16 +42,16 @@ Linux核心補丁是透過郵件被提交的，最好把補丁作為郵件體的
 碼方式，如果你使用UTF-8編碼方式發送郵件，那麼你將會避免一些可能發生的字元
 集問題。
 
-郵件客戶端應該產生並且保持“References:”或者“In-Reply-To:”郵件頭，這樣郵件會話
+郵件客戶端應該產生並且保持“References:”或者“In-Reply-To:”郵件頭，這樣郵件討論串
 就不會中斷。
 
 複製貼上(或者剪貼貼上)通常不能用於補丁，因為製表符會轉換為空格。使用
 xclipboard,xclip或者xcutsel也許可以，但是最好測試一下或者避免使用複製貼上。
 
-不要在使用PGP/GPG簽名的郵件中包含補丁。這樣會使得很多腳本不能讀取和適用於你的
+不要在使用PGP/GPG簽名的郵件中包含補丁。這樣會使得很多腳本不能讀取和套用你的
 補丁。（這個問題應該是可以修復的）
 
-在給核心郵件列表發送補丁之前，給自己發送一個補丁是個不錯的主意，保存接收到的
+在給核心郵件列表發送補丁之前，給自己發送一個補丁是個不錯的主意，儲存接收到的
 郵件，將補丁用'patch'命令打上，如果成功了，再給核心郵件列表發送。
 
 
@@ -64,7 +64,7 @@ xclipboard,xclip或者xcutsel也許可以，但是最好測試一下或者避免
 說明：
 
 - TUI = 以文字為基礎的使用者介面
-- GUI = 圖形介面使用者介面
+- GUI = 圖形使用者介面
 
 Alpine (TUI)
 ************
@@ -73,8 +73,8 @@ Alpine (TUI)
 
 在 :menuselection:`Sending Preferences` 選單：
 
-- :menuselection:`Do Not Send Flowed Text` 必須開啟
-- :menuselection:`Strip Whitespace Before Sending` 必須關閉
+- :menuselection:`Do Not Send Flowed Text` 必須設為 ``enabled``
+- :menuselection:`Strip Whitespace Before Sending` 必須設為 ``disabled``
 
 當寫郵件時，游標應該放在補丁會出現的地方，然後按下 `CTRL-R` 組合鍵，使指
 定的補丁檔案嵌入到郵件中。
@@ -86,7 +86,7 @@ Claws Mail (GUI)
 
 用 :menuselection:`Message-->Insert File` (`CTRL-I`) 或外部編輯器插入補丁。
 
-若要在Claws編輯視窗重修改插入的補丁，需關閉
+若要在Claws編輯視窗中修改插入的補丁，需關閉
 :menuselection:`Configuration-->Preferences-->Compose-->Wrapping`
 的 `Auto wrapping` 。
 
@@ -110,11 +110,11 @@ Kmail (GUI)
 
 一些開發者成功的使用它發送補丁。
 
-預設撰寫設定禁用HTML格式是合適的；不要啟用它。
+預設撰寫設定停用HTML格式是合適的；不要啟用它。
 
 當書寫一封郵件的時候，在選項下面不要選擇自動換行。唯一的缺點就是你在郵件中輸
 入的任何文字都不會被自動換行，因此你必須在發送補丁之前手動換行。最簡單的方法
-就是啟用自動換行來書寫郵件，然後把它保存為草稿。一旦你在草稿中再次開啟它，它
+就是啟用自動換行來書寫郵件，然後把它儲存為草稿。一旦你在草稿中再次開啟它，它
 已經全部自動換行了，那麼你的郵件雖然沒有選擇自動換行，但是還不會失去已有的自
 動換行。
 
@@ -132,13 +132,13 @@ Kmail (GUI)
 你可以安全地用GPG簽名附件，但是內嵌補丁最好不要使用GPG簽名它們。作為內嵌文字
 插入的簽名補丁將使其難以從7-bit編碼中提取。
 
-如果你非要以附件的形式發送補丁，那麼就右鍵點擊附件，然後選擇
-:menuselection:`屬性` ，開啟 :menuselection:`建議自動顯示` ，使附件內聯更容
-易讓讀者看到。
+如果你非要以附件的形式發送補丁，那麼就右鍵點選附件，然後選擇
+:menuselection:`屬性` ，開啟 :menuselection:`建議自動顯示` ，使附件以行內方式
+顯示，更容易讓讀者看到。
 
-當你要保存將要發送的內嵌文字補丁，你可以從訊息列表窗格選擇包含補丁的郵件，然
+當你要儲存以內嵌文字發送的補丁，你可以從訊息列表窗格選擇包含補丁的郵件，然
 後右鍵選擇 :menuselection:`另存新檔` 。如果整個電子郵件的組成正確，您可直接將
-其作為補丁使用。電子郵件以當前使用者可讀寫權限保存，因此您必須 ``chmod`` ，以
+其作為補丁使用。電子郵件以當前使用者可讀寫權限儲存，因此您必須 ``chmod`` ，以
 使其在複製到別處時使用者組和其他人可讀。
 
 Lotus Notes (GUI)
@@ -154,7 +154,7 @@ IBM Verse (Web GUI)
 Mutt (TUI)
 **********
 
-很多Linux開發人員使用mutt客戶端，這證明它肯定工作得非常漂亮。
+很多Linux開發人員使用 ``mutt`` 客戶端，這證明它肯定工作得非常漂亮。
 
 Mutt不自帶編輯器，所以不管你使用什麼編輯器，不自動斷行就行。大多數編輯器都有
 :menuselection:`插入檔案` 選項，它可以在不改變檔案內容的情況下插入檔案。
@@ -188,7 +188,7 @@ Mutt不自帶編輯器，所以不管你使用什麼編輯器，不自動斷行
 Mutt 是高度可設定的。 這裡是個使用mutt透過 Gmail 發送的補丁的最小設定::
 
   # .muttrc
-  # ================  IMAP ====================
+  # ================  IMAP  ====================
   set imap_user = 'yourusername@gmail.com'
   set imap_pass = 'yourpassword'
   set spoolfile = imaps://imap.gmail.com/INBOX
@@ -237,7 +237,7 @@ Sylpheed (GUI)
 - 內嵌文字可以很好的工作（或者使用附件）。
 - 允許使用外部的編輯器。
 - 收件箱較多時非常慢。
-- 如果透過non-SSL連接，無法使用TLS SMTP授權。
+- 如果透過non-SSL連線，無法使用TLS SMTP授權。
 - 撰寫視窗的標尺很有用。
 - 將地址添加到通訊簿時無法正確理解顯示的名稱。
 
@@ -246,13 +246,13 @@ Thunderbird (GUI)
 
 Thunderbird是Outlook的翻版，它很容易損壞文字，但也有一些方法強制修正。
 
-在完成修改後（包括安裝擴展），您需要重新啟動Thunderbird。
+在完成修改後（包括安裝擴充套件），您需要重新啟動Thunderbird。
 
 - 允許使用外部編輯器：
 
-  使用Thunderbird發補丁最簡單的方法是使用擴展來開啟您最喜歡的外部編輯器。
+  使用Thunderbird發補丁最簡單的方法是使用擴充套件來開啟您最喜歡的外部編輯器。
 
-  下面是一些能夠做到這一點的擴展樣例。
+  下面是一些能夠做到這一點的擴充套件樣例。
 
   - “External Editor Revived”
 
@@ -268,8 +268,8 @@ Thunderbird是Outlook的翻版，它很容易損壞文字，但也有一些方
 
     https://github.com/exteditor/exteditor
 
-    下載並安裝此擴展，然後開啟 :menuselection:`新增訊息` 視窗, 用
-    :menuselection:`查看-->工具列-->自訂...` 給它增加一個按鈕，直接點擊此
+    下載並安裝此擴充套件，然後開啟 :menuselection:`新增訊息` 視窗, 用
+    :menuselection:`檢視-->工具列-->自訂...` 給它增加一個按鈕，直接點選此
     按鈕即可使用外部編輯器。
 
     請注意，“External Editor”要求你的編輯器不能fork，換句話說，編輯器必須在
@@ -282,14 +282,14 @@ Thunderbird是Outlook的翻版，它很容易損壞文字，但也有一些方
 若要修正內部編輯器，請執行以下操作：
 
 - 修改你的Thunderbird設定，不要使用 ``format=flowed`` ！
-  回到主視窗，按照
-  :menuselection:`主選單-->偏好設定-->常規-->設定編輯器...`
+  回到主視窗，找到主下拉選單的按鈕，按照
+  :menuselection:`主選單-->偏好設定-->一般-->設定編輯器...`
   開啟Thunderbird的設定編輯器。
 
   - 將 ``mailnews.send_plaintext_flowed`` 設為 ``false``
 
   - 將 ``mailnews.wraplength`` 從 ``72`` 改為 ``0`` ，**或者** 安裝
-    “Toggle Line Wrap”擴展
+    “Toggle Line Wrap”擴充套件
 
     https://github.com/jan-kiszka/togglelinewrap
 
@@ -299,11 +299,11 @@ Thunderbird是Outlook的翻版，它很容易損壞文字，但也有一些方
 
 - 不要寫HTML郵件！
   回到主視窗，開啟
-  :menuselection:`主選單-->帳戶設定-->你的@郵件.地址-->通訊錄/編寫&地址簿` ，
-  關掉 ``以HTML格式編寫訊息`` 。
+  :menuselection:`主選單-->帳戶設定-->youracc@server.something-->撰寫與定址`
+  ，在那裡關掉 ``以HTML格式編寫訊息`` 選項。
 
-- 只用純文字格式查看郵件！
-  回到主視窗， :menuselection:`主選單-->查看-->訊息體為-->純文字` ！
+- 只用純文字格式檢視郵件！
+  回到主視窗， :menuselection:`主選單-->檢視-->訊息體為-->純文字` ！
 
 TkRat (GUI)
 ***********
@@ -313,14 +313,20 @@ TkRat (GUI)
 Gmail (Web GUI)
 ***************
 
-不要使用它發送補丁。
+無法用來發送補丁。
 
 Gmail網頁客戶端自動地把製表符轉換為空格。
 
-雖然製表符轉換為空格問題可以被外部編輯器解決，但它同時還會使用回車換行把每行
-拆分為78個字元。
+雖然製表符轉換為空格問題可以被外部編輯器解決，但它同時還會用CRLF形式的換行把
+每行拆分為78個字元。
 
 另一個問題是Gmail還會把任何含有非ASCII的字元的訊息改用base64編碼，如歐洲人的
 名字。
 
+HacKerMaiL (TUI)
+****************
 
+HacKerMaiL（hkml）是一個以public-inbox為基礎的簡易郵件管理工具，不需要訂閱郵件
+列表。它由DAMON維護者開發與維護，目標是支援DAMON及一般核心子系統的簡易開發流程。
+詳情請參閱README：
+https://github.com/sjp38/hackermail/blob/master/README.md
-- 
2.43.0

