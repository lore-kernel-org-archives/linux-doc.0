Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD36442B09
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 10:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784804046; cv=none; b=Kq6zSoeGxzSqzn8PPSDHyCqMoGcFq3bfk9rgjdo/emPIfroC8Q0o8EePxH6soo1HGKY2D26OeEkEiNZcxjezuPMECaYxdopTfC8a1+HEYYpN4qssSq8mUaX4eJbyIc+8tfmu37M5BB+42Ywk2xYxqxeu6FasauMz9AZOxW+uWyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784804046; c=relaxed/simple;
	bh=IEg7rXLmkOwBncNi8GCbMJlyKdiAwuUSQCnuCgsZZlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9j2nqS3bMrsL2FJ8UWmbt0GU/3P70FOf1xirT9DZrDsaIb6wWk202I/1zlwFnKn1ijnnuaHPPD/A8DLS/257tmvGQr8cJqTYm8d5SOFgm3vTod21T6AbU+Lfwa16czX8o2HHzFxrodoEpUjVCSvZrMaK0RgJH4a2njL5N8A9vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=BiCdWwgq; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="BiCdWwgq"
Date: Thu, 23 Jul 2026 18:53:41 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784804027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BayBsF4kVFarAL2/pScZoEvxPs6PLP39HiKcuUbO5V8=;
	b=BiCdWwgqhVYmAYCh64o87sI39KhNkPJNqloWYD5cE5QR4ZgE+PUnL8HrQ91TosLNm3Yu+P
	JO3OiBHf6VmgciVZnM8wOK7tjtid/UJz1iemET0ddliofdTr0lbBTf4cliGQGXkHVmBfdH
	kC5D716NZF/epxOeh3ZS5kVpUstT/f++GGcfw1N7qlK4ujZW0PTx61QN0h4ngXBiqX2Stc
	sK12+X5r3/RlJjXe9QyyzatN1ASzUqualnQRjFMhyxKzuKK9BMBrfLpSOyragPR1nF7+it
	d8nVWwUNzu5GDfyZDFsmpeU8We8YfWbhjeMyeUgAn3H2NMwppE83hy3nnq5E3Q==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/16] docs/zh_TW: process: localize terminology in
 howto.rst
Message-ID: <amHytUpfKnZcv1_l@wyuan.org>
References: <20260721215542.98435-1-chenyou910331@gmail.com>
 <20260721215542.98435-12-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721215542.98435-12-chenyou910331@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Jul 22, 2026 at 05:55:37AM +0800, Chen-Yu Yeh wrote:
> -Linux內核大部分是由C語言寫成的，一些體系結構相關的代碼用到了彙編語言。要
> -參與內核開發，你必須精通C語言。除非你想爲某個架構開發底層代碼，否則你並
> -不需要了解（任何體系結構的）彙編語言。下面列舉的書籍雖然不能替代紮實的C
> -語言教育和多年的開發經驗，但如果需要的話，做爲參考還是不錯的：
> +Linux核心大部分是由C語言寫成的，一些體系結構相關的程式碼用到了組譯語言。要
> +參與核心開發，你必須精通C語言。除非你想為某個架構開發底層程式碼，否則你並
> +不需要了解（任何體系結構的）組譯語言。下面列舉的書籍雖然不能替代紮實的C
> +語言教育和多年的開發經驗，但如果需要的話，做為參考還是不錯的：
>  
>   - "The C Programming Language" by Kernighan and Ritchie [Prentice Hall]
> -   《C程序設計語言（第2版·新版）》（徐寶文 李志 譯）[機械工業出版社]
> +   《C程式設計語言（第2版·新版）》（徐寶文 李志 譯）[機械工業出版社]
>   - "Practical C Programming" by Steve Oualline [O'Reilly]
> -   《實用C語言編程（第三版）》（郭大海 譯）[中國電力出版社]
> +   《實用C語言程式設計（第三版）》（郭大海 譯）[中國電力出版社]
>   - "C:  A Reference Manual" by Harbison and Steele [Prentice Hall]
>     《C語言參考手冊（原書第5版）》（邱仲潘 等譯）[機械工業出版社]

Is there really a traditional Chinese version available?

If not, it's better to keep it as-is.

But obviously it's not the actual purpose of this patch.

> -Linux內核使用GNU C和GNU工具鏈開發。雖然它遵循ISO C11標準，但也用到了一些
> -標準中沒有定義的擴展。內核是自給自足的C環境，不依賴於標準C庫的支持，所以
> -並不支持C標準中的部分定義。比如long long類型的大數除法和浮點運算就不允許
> -使用。有時候確實很難弄清楚內核對工具鏈的要求和它所使用的擴展，不幸的是目
> -前還沒有明確的參考資料可以解釋它們。請查閱gcc信息頁（使用「info gcc」命令
> -顯示）獲得一些這方面信息。
> +Linux核心使用GNU C和GNU工具鏈開發。雖然它遵循ISO C11標準，但也用到了一些
> +標準中沒有定義的擴展。核心是自給自足的C環境，不依賴於標準C庫的支援，所以
> +並不支援C標準中的部分定義。比如long long類型的大數除法和浮點運算就不允許
> +使用。有時候確實很難弄清楚核心對工具鏈的要求和它所使用的擴展，不幸的是目
> +前還沒有明確的參考資料可以解釋它們。請查閱gcc資訊頁（使用「info gcc」命令
> +顯示）獲得一些這方面資訊。
>  
> -請記住你是在學習怎麼和已經存在的開發社區打交道。它由一羣形形色色的人組成，
> -他們對代碼、風格和過程有著很高的標準。這些標準是在長期實踐中總結出來的，
> +請記住你是在學習怎麼和已經存在的開發社群打交道。它由一羣形形色色的人組成，
> +他們對程式碼、風格和過程有著很高的標準。這些標準是在長期實踐中總結出來的，
>  適應於地理上分散的大型開發團隊。它們已經被很好得整理成檔，建議你在開發
> -之前儘可能多的學習這些標準，而不要期望別人來適應你或者你公司的行爲方式。
> +之前儘可能多的學習這些標準，而不要期望別人來適應你或者你公司的行為方式。

[...]

> -如何成爲內核開發者
> +如何成為核心開發者
>  ------------------
> -如果你對Linux內核開發一無所知，你應該訪問「Linux內核新手」計劃：
> +如果你對Linux核心開發一無所知，你應該存取「Linux核心新手」計劃：
>  
>  	https://kernelnewbies.org

Should we use "造訪" instead of "存取" here?

Aside: the original translation was a little stiff. Better change to
like: "如果你对Linux核心開發一無所知，請參閱/參照/造訪這個網站"

>  
> -它擁有一個可以問各種最基本的內核開發問題的郵件列表（在提問之前一定要記得
> +它擁有一個可以問各種最基本的核心開發問題的郵件列表（在提問之前一定要記得
>  查找已往的郵件，確認是否有人已經回答過相同的問題）。它還擁有一個可以獲得
> -實時反饋的IRC聊天頻道，以及大量對於學習Linux內核開發相當有幫助的文檔。
> +實時反饋的IRC聊天頻道，以及大量對於學習Linux核心開發相當有幫助的文件。
>  
> -網站簡要介紹了原始碼組織結構、子系統劃分以及目前正在進行的項目（包括內核
> -中的和單獨維護的）。它還提供了一些基本的幫助信息，比如如何編譯內核和打補
> +網站簡要介紹了原始碼組織結構、子系統劃分以及目前正在進行的專案（包括核心
> +中的和單獨維護的）。它還提供了一些基本的幫助資訊，比如如何編譯核心和打補
>  丁。
>  
> -如果你想加入內核開發社區並協助完成一些任務，卻找不到從哪裡開始，可以訪問
> -「Linux內核房管員」計劃：
> +如果你想加入核心開發社群並協助完成一些任務，卻找不到從哪裡開始，可以存取
> +「Linux核心房管員」計劃：

Ditto.

>  
>  	https://kernelnewbies.org/KernelJanitors
>  
> -這是極佳的起點。它提供一個相對簡單的任務列表，列出內核代碼中需要被重新
> -整理或者改正的地方。通過和負責這個計劃的開發者們一同工作，你會學到將補丁
> -集成進內核的基本原理。如果還沒有決定下一步要做什麼的話，你還可能會得到方
> +這是極佳的起點。它提供一個相對簡單的任務列表，列出核心程式碼中需要被重新
> +整理或者改正的地方。透過和負責這個計劃的開發者們一同工作，你會學到將補丁
> +整合進核心的基本原理。如果還沒有決定下一步要做什麼的話，你還可能會得到方
>  向性的指點。
>  
> -在真正動手修改內核代碼之前，理解要修改的代碼如何運作是必需的。要達到這個
> -目的，沒什麼辦法比直接讀代碼更有效了（大多數花招都會有相應的注釋），而且
> -一些特製的工具還可以提供幫助。例如，「Linux代碼交叉引用」項目就是一個值得
> +在真正動手修改核心程式碼之前，理解要修改的程式碼如何運作是必需的。要達到這個
> +目的，沒什麼辦法比直接讀程式碼更有效了（大多數花招都會有相應的註解），而且
> +一些特製的工具還可以提供幫助。例如，「Linux程式碼交叉引用」專案就是一個值得
>  特別推薦的幫助工具，它將原始碼顯示在有編目和索引的網頁上。其中一個更新及
> -時的內核源碼庫，可以通過以下地址訪問：
> +時的核心源碼庫，可以透過以下地址存取：

Ditto.

> -Linux-next 集成測試樹
> +Linux-next 整合測試樹
>  ---------------------
>  
> -在將子系統樹的更新合併到主線樹之前，需要對它們進行集成測試。爲此，存在一個
> -特殊的測試存儲庫，其中幾乎每天都會提取所有子系統樹：
> +在將子系統樹的更新合併到主線樹之前，需要對它們進行整合測試。為此，存在一個
> +特殊的測試儲存庫，其中幾乎每天都會提取所有子系統樹：
>  
> -        https://git.kernel.org/？p=linux/kernel/git/next/linux-next.git
> +        https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>  
> -通過這種方式，Linux-next 對下一個合併階段將進入主線內核的內容給出了一個概要
> -展望。非常歡冒險的測試者運行測試Linux-next。
> +透過這種方式，Linux-next 對下一個合併階段將進入主線核心的內容給出了一個概要
> +展望。非常歡冒險的測試者執行測試Linux-next。

非常歡迎？

>  報告bug
>  -------
>  
> -bugzilla.kernel.org是Linux內核開發者們用來跟蹤內核Bug的網站。我們鼓勵用
> -戶在這個工具中報告找到的所有bug。如何使用內核bugzilla的細節請訪問：
> +bugzilla.kernel.org是Linux核心開發者們用來追蹤核心Bug的網站。我們鼓勵用
> +戶在這個工具中報告找到的所有bug。如何使用核心bugzilla的細節請存取：

Ditto.

>  
>  	http://test.kernel.org/bugzilla/faq.html
>  
> -內核源碼主目錄中的:ref:`admin-guide/reporting-bugs.rst <reportingbugs>`
> -文件里有一個很好的模板。它指導用戶如何報告可能的內核bug以及需要提供哪些信息
> -來幫助內核開發者們找到問題的根源。
> +核心源碼主目錄中的:ref:`admin-guide/reporting-bugs.rst <reportingbugs>`
> +文件裡有一個很好的模板。它指導使用者如何報告可能的核心bug以及需要提供哪些資訊
> +來幫助核心開發者們找到問題的根源。
>  
>  
>  利用bug報告
>  -----------
>  
> -練習內核開發技能的最好辦法就是修改其他人報告的bug。你不光可以幫助內核變
> +練習核心開發技能的最好辦法就是修改其他人報告的bug。你不光可以幫助核心變
>  得更加穩定，還可以學會如何解決實際問題從而提高自己的技能，並且讓其他開發
> -者感受到你的存在。修改bug是贏得其他開發者讚譽的最好辦法，因爲並不是很多
> +者感受到你的存在。修改bug是贏得其他開發者讚譽的最好辦法，因為並不是很多
>  人都喜歡浪費時間去修改別人報告的bug。
>  
> -要嘗試修改已知的bug，請訪問 http://bugzilla.kernel.org 網址。
> +要嘗試修改已知的bug，請存取 http://bugzilla.kernel.org 網址。

Ditto.

>  
>  
>  郵件列表
>  --------
>  
> -正如上面的文檔所描述，大多數的骨幹內核開發者都加入了Linux Kernel郵件列
> +正如上面的文件所描述，大多數的骨幹核心開發者都加入了Linux Kernel郵件列
>  表。如何訂閱和退訂列表的細節可以在這裡找到：
>  
> -	http://vger.kernel.org/vger-lists.html#linux-kernel
> +	https://subspace.kernel.org/subscribing.html
>  
>  網上很多地方都有這個郵件列表的存檔(archive)。可以使用搜尋引擎來找到這些
>  存檔。比如：
>  
> -	https://lore.kernel.org/lkml/
> +	https://lore.kernel.org/linux-kernel/

Note:

I don't know what happened. This change is from commit 413e775efaec9b452
("Documentation: fix links to mailing list services") but now if you
visit /linux-kernel/, you will still be redirected to /lkml/ ?

So what's the point of changing, or perhaps KR forgot to change it back
when he chose to continue using the classic "lkml".
