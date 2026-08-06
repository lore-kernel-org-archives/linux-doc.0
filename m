Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF8348A8BE
	for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2026 18:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040407; cv=none; b=low+dKYrRQXFkIRzez2dbFouZh/u1otHjEZrc9N6OWMMsNS92+O3xFnpThhM3EZmLFoka2wDhhSWyyK+VG491ggLw0Gd21QnrYISKQTKAdVu1BodHnaDCJXafgsZm1xc9Sprn2rMznyMbmX8OJL+w0Yf6kk0PMwC2bGI8DsDFp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040407; c=relaxed/simple;
	bh=YtHzxqnY7PNg2iq+M/NPMJuZy+Pmml+sepD2lv7jitQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mQHtnhL3evN5IZHDYXeMCgl1aCqdOhFqTwnKkjFTLL7XmI5Q1rJbYSEC4nqfj6aIvSQyZmpR7+Xu/TDXdwC6Y1JQFh5otuIQ7PzPfu+aETjZJHRt8mwMZySYhwOGsrSgO5ehKFKY68m8SLT2d69rArviBIn8BBFIudn4hopqveg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRIAmInS; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRIAmInS"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9d290216d0so163867a12.3
        for <linux-doc@vger.kernel.org>; Thu, 06 Aug 2026 11:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786040405; x=1786645205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bxrcMtnYG/tv31p+h7GSczb+iae99vefZzDMIaJKhds=;
        b=KRIAmInSJ+cdx+gMM6HMlfHYeDSgeVfHTfjr5CNRrymPAf4xfvZjg6vnIdCUmPB2QU
         82QhCJpDzAsFnFjNRGGKgEnw4jouzlL5tZjTHmdocXO/GrFBjygAt6vz+bn7ByP+Aq+Z
         cumQjerUL9e1VN74qNuZeNIlhr3YOBc/QjtYkBBUP4uMUdd/6XfQAEu+ujb9xPBqs+wU
         t9/Nb47ezGR2DKIMihTg6F2T9W+DJ2ApR1P4klNh6KX1EUJ2ddXoBmBiPOk2XdV8q6jp
         b7HtEq9XToToMGLV3Dzq5j6U6j/b9tWvhP0aYgTsHphIWVOuvAwp5+qBh8JvzusDZ8Wa
         BjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786040405; x=1786645205;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bxrcMtnYG/tv31p+h7GSczb+iae99vefZzDMIaJKhds=;
        b=KIozqwr937NgaUc/SS6tzXPJhfxl/a3AL87iMLg9QUaepZ69ehDYW4dIoIipxoUttc
         DCE7q/BZZTChwDyyM3R+w+liJdLo2QYUZogeESl4MjJj/Jwt3K7YB+3616gycgzx2uzW
         ElOzrxLREk2y85LS50VkviYuJsAPXnMl4GZkjB3UQ7l4Ynjnh3uFoq8YcjJ7XNH8Ofp6
         ArRa2bX1/A14+DYvVZI19KAfPO57XLCnUa3etE3kjNvyn1YvPomOoCsGD9uxiWA/3BTK
         2r2D7ODt0z26kWl1soPlHLtX0w2gVzEA9jy+CRdYaeM8lyy1xctUfYN/bz6lQdXZf5fK
         Z6lw==
X-Forwarded-Encrypted: i=1; AHgh+RpnyjzEf4I/Xjw7nX5Sy4M54xW8p5KCuQR07aZ4ApISlWwu7L4fID3Fh8HsjqyFiulkiYWU1tFv2ek=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFrKtdEVGVzpatO20MIzTQggieB+pGLfNdO/8F1WbAT8DIHso3
	w6Vbl0V2iiVHkAQENGuGZYOm/YZmOeoSMn5jeG5XlNIH9pu5uKJVuUTD
X-Gm-Gg: AR+sD12Ti49laTMX3zkqEU294Gy3iJgAyGokbD65KjfbPYhdAoX/Xh3AntfWTnZfQ2W
	7pWd11IwC5C/OSe10ewu/vSTEzO0KTwAL2PkQ0fM6okGxmZBMVdja1Yzrzp5KQXQD/i1aJZaCP+
	kZzOenoQbNWkl0fVb12uGUN8D6P654CtPOCFPPKZe/buYJlLDAZOH8bs/YSN4KMtF9xCrr1zZEv
	ae4Evav9EfmfQayC0ZAMEUaZRKmrQbgKAd1vyir9BoqXD+WOH9wT4z7g/vniPGS8wYyf6BcFWSd
	65fBGXuagEnZU+/NSpVkT3Un7ag5NJsBYlQTP496zLWOcFbVN8saaJDMyz25Fanf40JuDQPROOZ
	nI3Dhi/OEHY6c3talS6CUn4A+fKZW5Yu2R0zm8hZJEUhwbonzmiGQzXi3TAyIoJIOY3HSDoZAS2
	IfFkyq/jEI+N4zawCQX+oaVUEuTv58DuqsmCWP0SHkR2NfajYXpgGi3VJwVO2UlLqX5N+SEJ0KX
	GlGwxoiB++Vkg6iqZkpV8brD+XKABHSX6eSyS3mzhGEXiNjdhAwuRvQImbo8DIkOhyTUWoCBge8
	+yhdyZgJ4tWCIjp1Ajl9Kgw=
X-Received: by 2002:a17:90b:53cf:b0:38f:57f0:1f51 with SMTP id 98e67ed59e1d1-3903bb01d55mr11586465a91.0.1786040404329;
        Thu, 06 Aug 2026 11:20:04 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085f2b2easm2003356a91.11.2026.08.06.11.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 11:20:03 -0700 (PDT)
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
Subject: [PATCH v3 01/16] docs/zh_TW: process: localize terminology in 7.AdvancedTopics.rst
Date: Fri,  7 Aug 2026 02:19:34 +0800
Message-ID: <20260806181949.65648-2-chenyou910331@gmail.com>
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

Localize mainland terms to Taiwanese Mandarin (內核→核心, 軟件→軟體,
高級→進階, 項目→專案, 用戶→使用者, ...) and sync with the English
original (Github → GitHub).

update to commit 5ce70894f6ca ("Doc: correct spelling and wording
mistakes")

Reviewed-by: Weijie Yuan <wy@wyuan.org>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/7.AdvancedTopics.rst        | 110 +++++++++---------
 1 file changed, 56 insertions(+), 54 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/7.AdvancedTopics.rst b/Documentation/translations/zh_TW/process/7.AdvancedTopics.rst
index b449d67e3ad9..8090d482c4b0 100644
--- a/Documentation/translations/zh_TW/process/7.AdvancedTopics.rst
+++ b/Documentation/translations/zh_TW/process/7.AdvancedTopics.rst
@@ -12,28 +12,29 @@
 
  吳想成 Wu XiangCheng <bobwxc@email.cn>
  胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+ 葉宸佑 Chen-Yu Yeh <chenyou910331@gmail.com>
 
 .. _tw_development_advancedtopics:
 
-高級主題
+進階主題
 ========
 
 現在，希望您能夠掌握開發流程的工作方式。然而，還有更多的東西要學！本節將介紹
-一些主題，這些主題對希望成爲Linux內核開發過程常規部分的開發人員有幫助。
+一些主題，這些主題對希望成為Linux核心開發過程常規部分的開發人員有幫助。
 
 使用Git管理補丁
 ---------------
 
-內核使用分佈式版本控制始於2002年初，當時Linus首次開始使用專有的Bitkeeper應用
-程序。雖然BitKeeper存在爭議，但它所體現的軟件版本管理方法卻肯定不是。分佈式
-版本控制可以立即加速內核開發項目。現在有好幾種免費的BitKeeper替代品。
-但無論好壞，內核項目都已經選擇了Git作爲其工具。
+核心使用分散式版本控制始於2002年初，當時Linus首次開始使用專有的Bitkeeper應用
+程式。雖然BitKeeper存在爭議，但它所體現的軟體版本管理方法卻肯定不是。分散式
+版本控制可以立即加速核心開發專案。現在有好幾種自由的BitKeeper替代品。
+但無論好壞，核心專案都已經選擇了Git作為其工具。
 
-使用Git管理補丁可以使開發人員的生活更加輕鬆，尤其是隨着補丁數量的增長。Git也
+使用Git管理補丁可以使開發人員的生活更加輕鬆，尤其是隨著補丁數量的增長。Git也
 有其粗糙的邊角和一定的危險性，它是一個年輕和強大的工具，仍然在其開發人員完善
-中。本文檔不會試圖教會讀者如何使用git；這會是個巨長的文檔。相反，這裏的重點
-將是Git如何特別適合內核開發過程。想要加快用Git速度的開發人員可以在以下網站上
-找到更多信息：
+中。本文件不會試圖教會讀者如何使用git；這會是個巨長的文件。相反，這裡的重點
+將是Git如何特別適合核心開發過程。想要加快用Git速度的開發人員可以在以下網站上
+找到更多資訊：
 
 	https://git-scm.com/
 
@@ -41,44 +42,44 @@
 
 同時網上也能找到各種各樣的教程。
 
-在嘗試使用它生成補丁供他人使用之前，第一要務是閱讀上述網頁，對Git的工作方式
-有一個紮實的瞭解。使用Git的開發人員應能進行拉取主線存儲庫的副本，查詢修訂
+在嘗試使用它產生補丁供他人使用之前，第一要務是閱讀上述網頁，對Git的工作方式
+有一個紮實的瞭解。使用Git的開發人員應能進行拉取主線儲存庫的副本，查詢修訂
 歷史，提交對樹的更改，使用分支等操作。瞭解Git用於重寫歷史的工具（如rebase）
-也很有用。Git有自己的術語和概念；Git的新用戶應該瞭解引用、遠程分支、索引、
-快進合併、推拉、遊離頭等。一開始可能有點嚇人，但這些概念不難通過一點學習來
+也很有用。Git有自己的術語和概念；Git的新使用者應該瞭解引用、遠端分支、索引、
+快進合併、推拉、遊離頭等。一開始可能有點嚇人，但這些概念不難透過一點學習來
 理解。
 
-使用git生成通過電子郵件提交的補丁是提高速度的一個很好的練習。
+使用git產生透過電子郵件提交的補丁是提高速度的一個很好的練習。
 
-當您準備好開始建立Git樹供其他人查看時，無疑需要一個可以從中拉取的服務器。
-如果您有一個可以訪問因特網的系統，那麼使用git-daemon設置這樣的服務器相對
-簡單。同時，免費的公共託管網站（例如github）也開始出現在網絡上。成熟的開發
-人員可以在kernel.org上獲得一個帳戶，但這些帳戶並不容易得到；更多有關信息，
+當您準備好開始建立Git樹供其他人查看時，無疑需要一個可以從中拉取的伺服器。
+如果您有一個可以連上網際網路的系統，那麼使用git-daemon設定這樣的伺服器相對
+簡單。同時，免費的公共託管網站（例如GitHub）也開始出現在網路上。成熟的開發
+人員可以在kernel.org上獲得一個帳戶，但這些帳戶並不容易得到；更多有關資訊，
 請參閱 https://kernel.org/faq/ 。
 
-正常的Git工作流程涉及到許多分支的使用。每一條開發線都可以分爲單獨的“主題
+正常的Git工作流程涉及到許多分支的使用。每一條開發線都可以分為單獨的“主題
 分支”，並獨立維護。Git的分支很容易使用，沒有理由不使用它們。而且，在任何
 情況下，您都不應該在任何您打算讓其他人從中拉取的分支中進行開發。應該小心地
-創建公開可用的分支；當開發分支處於完整狀態並已準備好時(而不是之前）才合併
+建立公開可用的分支；當開發分支處於完整狀態並已準備好時(而不是之前）才合併
 開發分支的補丁。
 
 Git提供了一些強大的工具，可以讓您重寫開發歷史。一個不方便的補丁（比如說，
 一個打破二分法的補丁，或者有其他一些明顯的缺陷）可以在適當的位置修復，或者
 完全從歷史中消失。一個補丁系列可以被重寫，就好像它是在今天的主線上寫的一樣，
 即使你已經花了幾個月的時間在寫它。可以透明地將更改從一個分支轉移到另一個
-分支。等等。明智地使用git修改歷史的能力可以幫助創建問題更少的乾淨補丁集。
+分支。等等。明智地使用git修改歷史的能力可以幫助建立問題更少的乾淨補丁集。
 
-然而，過度使用這種功能可能會導致其他問題，而不僅僅是對創建完美項目歷史的
-簡單癡迷。重寫歷史將重寫該歷史中包含的更改，將經過測試（希望如此）的內核樹
-變爲未經測試的內核樹。除此之外，如果開發人員沒有共享項目歷史，他們就無法
-輕鬆地協作；如果您重寫了其他開發人員拉入他們存儲庫的歷史，您將使這些開發
-人員的生活更加困難。因此，這裏有一個簡單的經驗法則：被導出到其他地方的歷史
-在此後通常被認爲是不可變的。
+然而，過度使用這種功能可能會導致其他問題，而不僅僅是對建立完美專案歷史的
+簡單癡迷。重寫歷史將重寫該歷史中包含的更改，將經過測試（希望如此）的核心樹
+變為未經測試的核心樹。除此之外，如果開發人員沒有共享專案歷史，他們就無法
+輕鬆地協作；如果您重寫了其他開發人員拉入他們儲存庫的歷史，您將使這些開發
+人員的生活更加困難。因此，這裡有一個簡單的經驗法則：被導出到其他地方的歷史
+在此後通常被認為是不可變的。
 
-因此，一旦將一組更改推送到公開可用的服務器上，就不應該重寫這些更改。如果您
+因此，一旦將一組更改推送到公開可用的伺服器上，就不應該重寫這些更改。如果您
 嘗試強制進行無法快進合併的更改（即不共享同一歷史記錄的更改），Git將嘗試強制
 執行此規則。這可能覆蓋檢查，有時甚至需要重寫導出的樹。在樹之間移動變更集以
-避免linux-next中的衝突就是一個例子。但這種行爲應該是罕見的。這就是爲什麼
+避免linux-next中的衝突就是一個例子。但這種行為應該是罕見的。這就是為什麼
 開發應該在私有分支中進行（必要時可以重寫）並且只有在公共分支處於合理的較新
 狀態時才轉移到公共分支中的原因之一。
 
@@ -86,52 +87,53 @@ Git提供了一些強大的工具，可以讓您重寫開發歷史。一個不
 對於一個私有的分支，rebasing 可能是一個很容易跟上另一棵樹的方法，但是一旦
 一棵樹被導出到外界，rebasing就不可取了。一旦發生這種情況，就必須進行完全
 合併（merge）。合併有時是很有意義的，但是過於頻繁的合併會不必要地擾亂歷史。
-在這種情況下建議的做法是不要頻繁合併，通常只在特定的發佈點（如主線-rc發佈）
+在這種情況下建議的做法是不要頻繁合併，通常只在特定的發布點（如主線-rc發布）
 合併。如果您對特定的更改感到緊張，則可以始終在私有分支中執行測試合併。在
 這種情況下，git“rerere”工具很有用；它能記住合併衝突是如何解決的，這樣您
 就不必重複相同的工作。
 
-關於Git這樣的工具的一個最大的反覆抱怨是：補丁從一個存儲庫到另一個存儲庫的
+關於Git這樣的工具的一個最大的反覆抱怨是：補丁從一個儲存庫到另一個儲存庫的
 大量移動使得很容易陷入錯誤建議的變更中，這些變更避開審查雷達進入主線。當內
 核開發人員看到這種情況發生時，他們往往會感到不高興；在Git樹上放置未審閱或
 主題外的補丁可能會影響您將來讓樹被拉取的能力。引用Linus的話:
 
 ::
 
-   你可以給我發補丁，但當我從你那裏拉取一個Git補丁時，我需要知道你清楚
+   你可以給我發補丁，但當我從你那裡拉取一個Git補丁時，我需要知道你清楚
    自己在做什麼，我需要能夠相信事情而 *無需* 手動檢查每個單獨的更改。
 
 （http://lwn.net/Articles/224135/）。
 
-爲了避免這種情況，請確保給定分支中的所有補丁都與相關主題緊密相關；“驅動程序
-修復”分支不應更改核心內存管理代碼。而且，最重要的是，不要使用Git樹來繞過
-審查過程。不時的將樹的摘要發佈到相關的列表中，在合適時候請求linux-next中
+為了避免這種情況，請確保給定分支中的所有補丁都與相關主題緊密相關；“驅動程式
+修復”分支不應更改核心記憶體管理程式碼。而且，最重要的是，不要使用Git樹來繞過
+審查過程。不時的將樹的摘要發布到相關的列表中，在合適時候請求linux-next中
 包含該樹。
 
 如果其他人開始發送補丁以包含到您的樹中，不要忘記審閱它們。還要確保您維護正確
-的作者信息； git “am”工具在這方面做得最好，但是如果補丁通過第三方轉發給您，
+的作者資訊； git “am”工具在這方面做得最好，但是如果補丁透過第三方轉發給您，
 您可能需要在補丁中添加“From:”行。
 
-請求拉取時，請務必提供所有相關信息：樹的位置、要拉取的分支以及拉取將導致的
+請求拉取時，請務必提供所有相關資訊：樹的位置、要拉取的分支以及拉取將導致的
 更改。在這方面 git request-pull 命令非常有用；它將按照其他開發人員所期望的
-格式化請求，並檢查以確保您已記得將這些更改推送到公共服務器。
+格式化請求，並檢查以確保您已記得將這些更改推送到公共伺服器。
 
 審閱補丁
 --------
 
-一些讀者顯然會反對將本節與“高級主題”放在一起，因爲即使是剛開始的內核開發人員
-也應該審閱補丁。當然，沒有比查看其他人發佈的代碼更好的方法來學習如何在內核環境
-中編程了。此外，審閱者永遠供不應求；通過審閱代碼，您可以對整個流程做出重大貢獻。
-
-審查代碼可能是一副令人生畏的圖景，特別是對一個新的內核開發人員來說，他們
-可能會對公開詢問代碼感到緊張，而這些代碼是由那些有更多經驗的人發佈的。不過，
-即使是最有經驗的開發人員編寫的代碼也可以得到改進。也許對（所有）審閱者最好
-的建議是：把審閱評論當成問題而不是批評。詢問“在這條路徑中如何釋放鎖？”
-總是比說“這裏的鎖是錯誤的”更好。
-
-不同的開發人員將從不同的角度審查代碼。部分人會主要關注代碼風格以及代碼行是
-否有尾隨空格。其他人會主要關注補丁作爲一個整體實現的變更是否對內核有好處。
-同時也有人會檢查是否存在鎖問題、堆棧使用過度、可能的安全問題、在其他地方
-發現的代碼重複、足夠的文檔、對性能的不利影響、用戶空間ABI更改等。所有類型
-的檢查，只要它們能引導更好的代碼進入內核，都是受歡迎和值得的。
+一些讀者顯然會反對將本節與“進階主題”放在一起，因為即使是剛開始的核心開發人
+員也應該審閱補丁。當然，沒有比查看其他人發布的程式碼更好的方法來學習如何在
+核心環境中撰寫程式了。此外，審閱者永遠供不應求；透過審閱程式碼，您可以對整
+個流程做出重大貢獻。
+
+審查程式碼可能是一副令人生畏的圖景，特別是對一個新的核心開發人員來說，他們
+可能會對公開詢問程式碼感到緊張，而這些程式碼是由那些有更多經驗的人發布的。
+不過，即使是最有經驗的開發人員編寫的程式碼也可以得到改進。也許對（所有）審
+閱者最好的建議是：把審閱評論當成問題而不是批評。詢問“在這條路徑中如何釋放
+鎖？”總是比說“這裡的鎖是錯誤的”更好。
+
+不同的開發人員將從不同的角度審查程式碼。部分人會主要關注程式碼風格以及程式
+碼行是否有尾隨空格。其他人會主要關注補丁作為一個整體實作的變更是否對核心有
+好處。同時也有人會檢查是否存在鎖問題、堆疊使用過度、可能的安全問題、在其他
+地方發現的程式碼重複、足夠的文件、對效能的不利影響、使用者空間ABI更改等。
+所有類型的檢查，只要它們能引導更好的程式碼進入核心，都是受歡迎和值得的。
 
-- 
2.43.0

