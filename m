Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431759;
	b=gMKBDIfWxpz1FY2T/phS4jFKIO3S+gazvioXL3lv56qX85Rc1tQmY08Rs7Dk7Pn0lMeb
	 FW/78Vz3W/AZ5VLjpPgNqxOqKIbWpIFNVe1VQJ0UuI98ibON/2180IzIOEybeGTx/9SFB
	 oH3Fug0782tyvqFVa3EuZnxD1ybRNoASl64avl9m53IwfJMUScS+NVw68XA3GL8C1DsE3
	 j+lauNLYJxSRhy7gKiOL8wDKdj/zzVoErY7yOgjGjF08Ag8KPujAbSnnzp+R1gU4Flpd5
	 8EiSsCpW17C8VtxSmNG0gH5zesRCg3U8jIGU9tUNKpeldzWtzz+XDOwFpT5nrti5YZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=rxzjLhCsNN862cM21MXt3d0Spna8BJJrGy3ZLaxqHFE=;
	b=CuJG7FSYWtXGcCAwfew+8Tb7KUvirDWbmLgTiINH/1p96pd4r5pPZ51OROiWe6QbMRsj
	 eOACQAr47kbAnZBxn4++GXefweHNnDJCP6FF0MhJUqHqzvkjUMb+Xq9eS8RYZZZVO+6Y2
	 mheAUCRm16dGVoqf2+IA4d9f6RidkoBQ/r0rqtjJZRf/XXhKSQOMzpK6mcQjA/z1kuURL
	 2bvL0CecVGGyhgRCTXh6bPo3RdCkamfDoIpOUZ2DZUXVdNOKtKJUypuqJaJuIyEY4emFv
	 fJsKWwPwpcIjnlpEBW/kvhHdypU8ugzbipL21p+wGN9m9/rN90GHoW35N7mE38uzUIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="aRsMC/B/";
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F338606A321
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 11:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F338606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aRsMC/B/
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2efb772d4c0so2371625ad.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 03:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795431758; x=1796036558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rxzjLhCsNN862cM21MXt3d0Spna8BJJrGy3ZLaxqHFE=;
        b=aRsMC/B/KDQmltcD4sovCAUONF2jo+YSB5PAOfLb3djMoPvfRllmnLNG/JuWosRg7n
         aVLCXJfh/TU+LoCiFjg6je08MsVFmxerG0Xb+xZl4VUXR/SV+A2U76v6qdr0tbsDQ4r7
         dNbikURWLitYLbHFYZvbFs0cyQgbWBbQICRFpIuQN2IYGmIqEjH522wEss8fyF+67gjW
         DDs5AAvGtoMMwhYLZohFfbldYPjU8nqm6h7Szb0DaydnxJT40qZCD9IZt4Muyf2shuCE
         TYGPezmkSx2C3NY0PzZBqsOdvzaznH5OJ/p2OnbAaXqxnZJZltZLLJM2kf/9kLlox2Fr
         j1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431758; x=1796036558;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rxzjLhCsNN862cM21MXt3d0Spna8BJJrGy3ZLaxqHFE=;
        b=kTJu9dwxD6VlUl2PBa175DsH8ebiZAi04d+WoMSN7F3atYYCI29GZ/FNzgUt7V6unf
         y3FFC68rv/eYQ3FxC9Jgps3nZVpufgKpDOCsgiWfJvAGPT4lxQuvSUrOW+bWYJMztAYi
         9qws8c1DVUqDFLp8rGsThyAnRbLY5QsIGjfTabJ69wl/6FG/ab/biWO1q3Y7l9CG0EQw
         HoIyeS8PWZGrU6NMx479tMRWwuWFU/YbK43Y0L6tunJftuENZJiIwWw5hlONvsXKUsCc
         C4blVhb2kT9f4ioMj1Hm+vhcASvJPsvZvdBQFdS3PAqmVJhBL8h0/DS1K36GaX2XrLZb
         qihw==
X-Forwarded-Encrypted: i=1; AL+hErEsIfK641Gtkk2nNYKJxaqs4mgyAhfxs192U/eoAy4lC9RJ0FsDP64sGJgztYIG1USroRJhfymKbC8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IoiF6KyIkGCKCv1FVaCQkpv1QdAUgXFFKml1aEAOsPVrrv1C/
	sEukAkiti+MyUfFY1rUVgH92m/lGinMzVN1PS+kCrfQz//KM6IYc3dId
X-Gm-Gg: AZFdTZeOQbyOyWcwqBoPeYmGeuiymvSRCLkEqvS0n73AbXet1MUG8m2zn4S+wtc2kU6
	mTYzAyyJ5wqz1x7fYNud4eq+99tCmQFFIxUvE+EzB9Zzm8Sbcw3zDhhtrsdE+/E06mrFIvfRll7
	uQcA2nBATSs/7ddSdYXVJs8q2FZdhvS/yUNYNRFGzYOpevwEYXmhsplPvUTsijwEKJTiK+RtawO
	++gSRRlLESjHuzVKYxLFbHjxvu5UDGalvQxP8NLwKHQYUJoa5C4w/scoOdEGjCdLYiDN4prABG3
	Virwl6nQIC8GdYRt/wPGq9kA24fCwOPCJW56Asie+nDA0omXeKFixFwxluFoZQ4dBxpa0PS0qDf
	pFgdo2xpLM/0vlXUxEU/TqOa5LJAL/oa0AAIdKevJEM7EIXvMAzDStHPKUIuFdcH3rO5/kvjI6Q
	bBR2WngZL0v+IdHyz9JHoaQKuS/ZKT14Ml5qqIGKjvVxTpgQ0/qlP0DOVrv5bgHxQLA0zVjzyB4
	T38xW2qEjKK+FeW9LBr4n1aoVBulZgPPomyV0ComU9wxsbx8fBx5WcHfD8r8qsKnM0m71QaVfxF
	hpKTjOVbCGQxgkFl/67ue8AnMIOgLBYmq2+Xaz4Ut7YGC2xffyeF8aH4NTPqITGKbxIevgm6CQQ
	VbZIDgL8ymhp31pIOqY3Eho7n
X-Received: by 2002:a17:902:e847:b0:2e9:6468:2005 with SMTP id d9443c01a7336-2f03f117acfmr171682845ad.2.1795431757372;
        Mon, 23 Nov 2026 03:02:37 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1aa3sm50380785ad.21.2026.11.23.03.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:02:36 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: alexs@kernel.org,
	corbet@lwn.net
Cc: wy@wyuan.org,
	dzm91@hust.edu.cn,
	si.yanteng@linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 04/25] docs/zh_TW: process: sync 5.Posting.rst with the English original
Date: Mon, 23 Nov 2026 19:01:55 +0800
Message-ID: <20261123110217.170025-5-chenyou910331@gmail.com>
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

The translation claims to be up to date with commit 0a83293322fd ("doc:
development-process: add notice on testing"), but a section-by-section
comparison against the current English text shows it still carried
wording from an older original and mistranslated a number of sentences.
Bring it in line with the full current original:

- drop the "since "Co-developed-by:" denotes authorship" clause that is
  no longer in the original, and fix the order it gave: a
  "Signed-off-by:" must follow each "Co-developed-by:", not the other
  way round
- add the missing reference to the reviewer's statement under
  "Reviewed-by:"
- use gender-neutral wording for "Signed-off-by:", following the English
- capitalize Git and Quilt when they name the tools, and fix the
  "git bisct" and "coilt" typos
- retranslate sentences whose meaning had drifted (reasonable detail,
  half-baked patches, reasonable configuration combinations, the
  employer "likely" owning the work, branching off at an arbitrary spot,
  the summary line, adding the From line when in doubt, gratuitous
  white-space changes, erring on the side of too many copies, copying
  the original poster, and mail threading, which was rendered as
  execution threads)
- replace mainland terms with Taiwanese usage (代碼, 激活, 響應, 嵌套,
  分銷商, 專案 for "items", ...)
- show English paths in the :ref: links to submitting-patches.rst,
  submit-checklist.rst and email-clients.rst, as the other synced files
  do, which keeps the lines within 80 columns
- replace the en dash in --chain-reply-to and the full-width colon
  after Cc

update to commit fdd100ee60a0 ("docs: process: use gender-neutral
pronouns")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../translations/zh_TW/process/5.Posting.rst  | 121 +++++++++---------
 1 file changed, 61 insertions(+), 60 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/5.Posting.rst b/Documentation/translations/zh_TW/process/5.Posting.rst
index d54b16364474..288d5b4ffca4 100644
--- a/Documentation/translations/zh_TW/process/5.Posting.rst
+++ b/Documentation/translations/zh_TW/process/5.Posting.rst
@@ -11,8 +11,8 @@
 
 您的工作遲早會準備好提交給社群進行審查，並最終包含到主線核心中。毫不稀奇，
 核心開發社群已經發展出一套用於發布補丁的約定和過程；遵循這些約定和過程將使
-參與其中的每個人的生活更加輕鬆。本文件試圖描述這些約定的部分細節；更多資訊
-也可在以下文件中找到
+參與其中的每個人的生活更加輕鬆。本文件試圖以相當程度的細節描述這些期望；更多
+資訊也可在以下文件中找到
 :ref:`Documentation/translations/zh_TW/process/submitting-patches.rst <tw_submittingpatches>`
 和
 :ref:`Documentation/translations/zh_TW/process/submit-checklist.rst <tw_submitchecklist>`。
@@ -22,20 +22,20 @@
 
 在補丁完全“準備好”之前，避免發布補丁是一種持續的誘惑。對於簡單的補丁，這
 不是問題。但是如果正在完成的工作很複雜，那麼在工作完成之前從社群獲得反饋就
-可以獲得很多好處。因此，您應該考慮發布正在進行的工作，甚至維護一個可用的Git
+可以獲得很多好處。因此，您應該考慮發布正在進行的工作，甚至公開一個可用的Git
 樹，以便感興趣的開發人員可以隨時趕上您的工作。
 
 當發布中有尚未準備好被包含的程式碼，最好在發布中說明。還應提及任何有待完成的
-主要工作和任何已知問題。很少有人會願意看那些被認為是半生不熟的補丁，但是
-那些願意的人會帶著他們的點子來一起幫助你把工作推向正確的方向。
+主要工作和任何已知問題。願意看那些已知是半成品的補丁的人會比較少，但是那些
+願意看的人，會抱著能幫助你把工作推向正確方向的想法而來。
 
 建立補丁之前
 ------------
 
 在考慮將補丁發送到開發社群之前，有許多事情應該做。包括：
 
- - 儘可能地測試程式碼。利用核心的除錯工具，確保核心使用了所有可能的設定選
-   項組合進行建置，使用交叉編譯器為不同的架構進行建置等。添加測試，最好使
+ - 儘可能地測試程式碼。利用核心的除錯工具，確保核心在所有合理的設定選項組合
+   下都能建置，使用交叉編譯器為不同的架構進行建置等。添加測試，最好使
    用現有的測試框架（如KUnit），並將其作為補丁系列中單獨的一員（關於補丁系
    列，見下一節）。注意，對某些子系統而言這可能是強制性的。例如，函式庫函
    式（位於lib/下）幾乎在所有地方被廣泛使用，應當有適當的測試。
@@ -45,20 +45,20 @@
  - 您的更改是否具有效能影響？如果是這樣，您應該執行基準測試來顯示您的變更的
    影響（或好處）；結果的摘要應該包含在補丁中。
 
- - 確保您有權發布程式碼。如果這項工作是為僱主完成的，僱主對這項工作具有所
-   有權，並且必須同意根據GPL對其進行發布。
+ - 確保您有權發布程式碼。如果這項工作是為僱主完成的，僱主很可能對這項工作擁
+   有權利，並且必須同意根據GPL對其進行發布。
 
 一般來說，在發布程式碼之前進行一些額外的思考，幾乎總是能在短時間內得到回報。
 
 補丁準備
 --------
 
-準備補丁發布的工作量可能很驚人，但在此嘗試節省時間通常是不明智的，即使在短期
-內亦然。
+準備補丁發布的工作量可能很驚人，但再說一次，在此嘗試節省時間通常是不明智的，
+即使在短期內亦然。
 
 必須針對核心的特定版本準備補丁。一般來說，補丁應該基於Linus的Git樹中的當前
 主線。當以主線為基礎時，請從一個衆所周知的發布點開始——如穩定版本或 -rc
-版本發布點——而不是在一個任意的主線分支點。
+版本發布點——而不是從主線上任意一點分支出去。
 
 也可能需要針對-mm、linux-next或子系統樹產生版本，以便於更廣泛的測試和審查。
 根據補丁的區域以及其他地方的情況，針對其他樹建立的補丁可能需要大量的工作來
@@ -66,7 +66,7 @@
 
 只有最簡單的更改才應格式化為單個補丁；其他所有更改都應作為一系列邏輯更改進行。
 分割補丁是一門藝術；一些開發人員花了很長時間來弄清楚如何按照社群期望的方式來
-分割。不過，這些經驗法則也許有幫助：
+分割。不過，有一些經驗法則會很有幫助：
 
  - 您發布的補丁系列幾乎肯定不會是開發過程中版本控制系統中的一系列更改。相反，
    需要對您所做更改的最終形式加以考慮，然後以有意義的方式進行拆分。開發人員對
@@ -78,12 +78,12 @@
    檢查並驗證它所做的事情的更改。
 
  - 換種方式重申上述準則，也就是說：不要在同一補丁中混合不同類型的更改。如果
-   一個補丁修復了一個關鍵的安全漏洞，又重新排列了一些結構，還重新格式化了代
-   碼，那麼它很有可能會被忽略，從而導致重要的修復丟失。
+   一個補丁修復了一個關鍵的安全漏洞，又重新排列了一些結構，還重新格式化了程
+   式碼，那麼它很有可能會被忽略，從而導致重要的修復丟失。
 
  - 每個補丁都應該能建立一個可以正確地建置和執行的核心；如果補丁系列在中間被
    斷開，那麼結果仍應是一個正常工作的核心。部分應用一系列補丁是使用
-   “git bisct”工具查找回歸的一個常見場景；如果結果是一個損壞的核心，那麼將使
+   “git bisect”工具查找迴歸的一個常見場景；如果結果是一個損壞的核心，那麼將使
    那些從事追蹤問題的高尚工作的開發人員和使用者的生活更加艱難。
 
  - 不要過分分割。一位開發人員曾經將一組針對單一檔案的編輯分成500個單獨的補丁
@@ -93,7 +93,7 @@
  - 用一系列補丁添加一個全新的基礎設施，但是該設施在系列中的最後一個補丁啟用
    整個變更之前不能使用，這看起來很誘人。如果可能的話，應該避免這種誘惑；
    如果這個系列增加了迴歸，那麼二分法將指出最後一個補丁是導致問題的補丁，
-   即使真正的bug在其他地方。只要有可能，添加新程式碼的補丁程式應該立即激活該
+   即使真正的bug在其他地方。只要有可能，添加新程式碼的補丁應該立即啟用該
    程式碼。
 
 建立完美補丁系列的工作可能是一個令人沮喪的過程，在完成“真正的工作”之後需要
@@ -106,16 +106,16 @@
 需要被格式化成一條訊息，以快速而清晰地將其目的傳達到世界其他地方。為此，
 每個補丁將由以下部分組成：
 
- - 可選的“From”行，表明補丁作者。只有當你透過電子郵件發送別人的補丁時，這一行
-   才是必須的，但是為防止疑問加上它也不會有什麼壞處。
+ - 可選的“From”行，表明補丁作者。只有當你透過電子郵件轉發別人的補丁時，這一行
+   才是必須的，但是在不確定時加上它也不會有什麼壞處。
 
  - 一行描述，說明補丁的作用。對於在沒有其他上下文的情況下看到該訊息的讀者
-   來說，該訊息應足以確定修補程式的範圍；此行將顯示在“short form（簡短格式）”
+   來說，該訊息應足以確定補丁的範圍；此行將顯示在“short form（簡短格式）”
    變更日誌中。此訊息通常需要先加上子系統名稱前綴，然後是補丁的目的。例如：
 
    ::
 
-        gpio: fix build on CONFIG_GPIO_SYSFS=n
+	gpio: fix build on CONFIG_GPIO_SYSFS=n
 
  - 一行空白，後接補丁內容的詳細描述。此描述可以是任意需要的長度；它應該說
    明補丁的作用以及為什麼它應該應用於核心。
@@ -123,26 +123,27 @@
  - 一個或多個標記行，至少有一個由補丁作者的 Signed-off-by 簽名。標記將在下面
    詳細描述。
 
-上面的專案一起構成補丁的變更日誌。寫一則好的變更日誌是一門至關重要但常常被
+以上各項一起構成補丁的變更日誌。寫一則好的變更日誌是一門至關重要但常常被
 忽視的藝術；值得花一點時間來討論這個問題。當你編寫變更日誌時，你應該記住有
 很多不同的人會讀你的話。其中包括子系統維護人員和審查人員，他們需要決定是否
-應該合併補丁，分銷商和其他維護人員試圖決定是否應該將補丁反向移植到其他核心，
-缺陷搜尋人員想知道補丁是否導致他們正在追查的問題，以及想知道核心如何變化的
-使用者等等。一個好的變更日誌以最直接和最簡潔的方式向所有這些人傳達所需的資訊。
-
-在結尾，總結行應該描述變更的影響和動機，以及在一行約束條件下可能發生的變化。
-然後，詳細的描述可以詳述這些主題，並提供任何需要的附加資訊。如果補丁修復了
-一個缺陷，請引用引入該缺陷的提交（如果可能，請在引用提交時同時提供其 id 和
-標題）。如果某個問題與特定的日誌或編譯器輸出相關聯，請包含該輸出以幫助其他
-人搜索同一問題的解決方案。如果更改是為了支援以後補丁中的其他更改，那麼應當
-說明。如果更改了內部API，請詳細說明這些更改以及其他開發人員應該如何響應。
-一般來說，你越把自己放在每個閱讀你變更日誌的人的位置上，變更日誌（和核心
-作為一個整體）就越好。
-
-不需要說，變更日誌是將變更提交到版本控制系統時使用的文字。接下來將是：
+應該合併補丁，發行版廠商和其他維護人員試圖決定是否應該將補丁反向移植到其他
+核心，缺陷搜尋人員想知道補丁是否導致他們正在追查的問題，以及想知道核心如何
+變化的使用者等等。一個好的變更日誌以最直接和最簡潔的方式向所有這些人傳達所需
+的資訊。
+
+為此，摘要行應該在一行的限制下，儘可能描述清楚變更的影響和動機。然後，詳細
+的描述可以詳述這些主題，並提供任何需要的附加資訊。如果補丁修復了一個缺陷，
+請儘可能引用引入該缺陷的提交（並請在引用提交時同時提供其commit ID和標題）。
+如果某個問題與特定的日誌或編譯器輸出相關聯，請包含該輸出以幫助其他人搜索同
+一問題的解決方案。如果更改是為了支援以後補丁中的其他更改，那麼應當說明。如
+果更改了內部API，請詳細說明這些更改以及其他開發人員應該如何回應。一般來說，
+你越把自己放在每個閱讀你變更日誌的人的位置上，變更日誌（和核心作為一個整體）
+就越好。
+
+不用說，變更日誌就應該是將變更提交到版本控制系統時使用的文字。接下來將是：
 
  - 補丁本身，採用統一的（“-u”）補丁格式。使用“-p”選項來diff將使函式名與
-   更改相關聯，從而使結果補丁更容易被其他人讀取。
+   更改相關聯，從而使結果補丁更容易被其他人閱讀。
 
 前面已簡要提到的標籤（tag）用於提供補丁如何產生的線索。
 :ref:`Documentation/translations/zh_TW/process/submitting-patches.rst <tw_submittingpatches>`
@@ -174,24 +175,25 @@
 
 常用的標籤有：
 
- - Signed-off-by: 這是一個開發人員的證明，證明他或她有權提交補丁以包含到核
-   心中。這表明同意開發者來源認證協議，其全文見
+ - Signed-off-by: 這是一個開發人員的證明，證明自己有權提交補丁以包含到核心
+   中。這表明同意開發者來源認證協議，其全文見
    :ref:`Documentation/translations/zh_TW/process/submitting-patches.rst <tw_submittingpatches>`
-   如果沒有合適的簽字，則不能合併到主線中。
+   沒有適當簽署的程式碼不能合併到主線中。
 
- - Co-developed-by: 聲明補丁是由多個開發人員共同建立的；當幾個人在一個補丁
-   上工作時，它用於給出共同作者（除了 From: 所給出的作者之外）。由於
-   Co-developed-by: 表示作者身份，所以每個共同開發人，必須緊跟在相關合作作
-   者的Signed-off-by之後。具體內容和範例見以下文件
-   :ref:`Documentation/translations/zh_TW/process/submitting-patches.rst <tw_submittingpatches>`
+ - Co-developed-by: 聲明補丁是由多個開發人員共同建立的；當多人共同處理一個
+   補丁時，它用於標示共同作者（除了 From: 標籤所標示的作者之外）。每個
+   Co-developed-by: 之後都必須緊跟著相應共同作者的 Signed-off-by:。具體內容
+   和範例見
+   :ref:`Documentation/translations/zh_TW/process/submitting-patches.rst <tw_submittingpatches>`。
 
  - Acked-by: 表示另一個開發人員（通常是相關程式碼的維護人員）同意補丁適合包含
    在核心中。
 
  - Tested-by: 聲明某人已經測試了補丁並確認它可以工作。
 
- - Reviewed-by: 表示某開發人員已經審查了補丁的正確性；有關詳細資訊，請參閱
+ - Reviewed-by: 表示某開發人員已經審查了補丁的正確性；更多細節請參閱
    :ref:`Documentation/translations/zh_TW/process/submitting-patches.rst <tw_submittingpatches>`
+   中的審查者聲明。
 
  - Reported-by: 指定報告此補丁修復的問題的使用者；此標籤用於向測試我們的
    程式碼並在發現問題時告知我們的人們（他們常常沒有得到應有的重視）表示
@@ -202,7 +204,7 @@
  - Suggested-by: 標籤表明補丁的想法是由被指名者建議的，確保其想法獲得
    讚譽。希望這能激勵他們在未來繼續幫助我們。
 
- - Cc：指定某人收到了補丁的副本，並有機會對此發表評論。
+ - Cc: 指定某人收到了補丁的副本，並有機會對此發表評論。
 
 在補丁中添加上述標籤時要小心：除了Cc:、Reported-by:和Suggested-by:之外，
 所有標籤都需要被指名者的明確許可。對於這三個標籤，如果根據lore存檔或提交
@@ -216,15 +218,15 @@
 
 在寄送補丁之前，您還需要注意以下幾點：
 
- - 您確定您的郵件發送程式不會損壞補丁嗎？被郵件客戶端更改空白或修飾了行的補丁
-   無法被另一端接受，並且通常不會進行任何詳細檢查。如果有任何疑問，先把補丁寄
-   給你自己，讓你自己確定它是完好無損的。
+ - 您確定您的郵件發送程式不會損壞補丁嗎？被郵件客戶端任意更動空白或自動換行
+   的補丁在另一端將無法套用，並且通常不會有人仔細檢查。如果有任何疑問，先把
+   補丁寄給你自己，讓你自己確定它是完好無損的。
 
    :ref:`Documentation/translations/zh_TW/process/email-clients.rst <tw_email_clients>`
    提供了一些有用的提示，可以讓特定的郵件客戶端正常發送補丁。
 
- - 你確定你的補丁沒有荒唐的錯誤嗎？您應該始終透過scripts/checkpatch.pl檢查
-   補丁程式，並解決它提出的問題。請記住，checkpatch.pl，雖然體現了對核心補丁
+ - 你確定你的補丁沒有愚蠢的錯誤嗎？您應該始終透過scripts/checkpatch.pl檢查
+   補丁，並解決它提出的問題。請記住，checkpatch.pl，雖然體現了對核心補丁
    應該是什麼樣的大量思考，但它並不比您聰明。如果修復checkpatch.pl給的問題會
    使程式碼變得更糟，請不要這樣做。
 
@@ -232,20 +234,20 @@
 引用補丁的部分。相反，只需將補丁直接放到您的訊息中。
 
 寄出補丁時，重要的是將副本發送給任何可能感興趣的人。與其他一些專案不同，核心
-鼓勵人們甚至錯誤地發送過多的副本；不要假定相關人員會看到您在郵件列表中的發布。
+鼓勵人們寧可發送過多的副本；不要假定相關人員會看到您在郵件列表中的發布。
 尤其是，副本應發送至：
 
  - 受影響子系統的維護人員。如前所述，MAINTAINERS檔案是查找這些人員的首選地方。
 
  - 其他在同一領域工作的開發人員，尤其是那些現在可能在那裡工作的開發人員。使用
-   git查看還有誰修改了您正在處理的檔案，這很有幫助。
+   Git查看還有誰修改了您正在處理的檔案，這很有幫助。
 
- - 如果您對某錯誤報告或功能請求做出響應，也可以抄送原始發送人。
+ - 如果您是在回應某個錯誤報告或功能請求，也應抄送原始發文者。
 
  - 將副本發送到相關郵件列表，或者若無相關列表，則發送到linux-kernel列表。
 
  - 如果您正在修復一個缺陷，請考慮該修復是否應進入下一個穩定更新。如果是這樣，
-   補丁副本也應發到stable@vger.kernel.org 。另外，在補丁本身的標籤中添加一個
+   補丁副本也應發到 stable@vger.kernel.org 。另外，在補丁本身的標籤中添加一個
    “Cc: stable@vger.kernel.org”；這將使穩定版團隊在修復進入主線時收到通知。
 
 當為一個補丁選擇接收者時，最好清楚你認為誰最終會接受這個補丁並將其合併。雖然
@@ -267,7 +269,6 @@
 因此，請確保補丁本身具有完整的變更日誌資訊。
 
 一般來說，多部分補丁的第二部分和後續部分應作為對第一部分的回覆發送，以便它們
-在接收端都連接在一起。像git和coilt這樣的工具有命令，可以透過適當的執行緒發送
-一組補丁。但是，如果您有一長串補丁，並正使用git，請不要使用–-chain-reply-to
-選項，以避免建立過深的嵌套。
-
+在接收端都串在同一個討論串中。像Git和Quilt這樣的工具有命令，可以用正確的討論
+串結構寄出一組補丁。但是，如果您有一長串補丁，並正使用Git，請不要使用
+--chain-reply-to選項，以避免建立過深的巢狀結構。
-- 
2.43.0

