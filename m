Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB38372B27
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 14:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784731726; cv=none; b=ZCWalGEYyj2RVU+S/dnB/E1reOsOCNoRbh/yHQvIzBJf3KUMXv3fBSbtunoAU2vuHMD/sf8kyjmJg+8a8NrjsJ5ziCxrEBbNCNHURbJ9/JCsphdVo2nSf4DktHVhzy7W5GVJHhRnRIVErmtjr9E/zMJ1AB0ELnt3NID4EzoXleA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784731726; c=relaxed/simple;
	bh=gUEHACkXYvpGprjPLuYE0Ck8o2knaEouUYtnGcFW/58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BZtgdzU7zz3pvBicmMdSahPQkYWzNPo+er8jbTJOBivzMNC3kq6pQh6yN0KfuC5rMhLMEhdZ6OMKirUedi/j83rIZHeBo1i6CiypkSJi3MxnIf4jzD9ETeew9rHSyUiUSSNsER8L2wDOKGrcINtm3YmeapqXL3NeECiliy2UyLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=ZqOJTzyx; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="ZqOJTzyx"
Date: Wed, 22 Jul 2026 22:48:26 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784731719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+/zHGM89k5oCLmeFIWt4axkN+0Ol8vePALGxhhFUh5E=;
	b=ZqOJTzyxHmYE5Iv6nnqg+iI7vvk7DDkP8/5dx/1oXmoKEB6Zr7Bl1+q7BUFlJKOLqFJKvz
	fsjUuSS8QfP+P3vAOVYfq2NEOX076g2NnS52FGa7YSe2PqRSJjmkQnPmWQuyl5rj+bKhJf
	f9BquEJvxIzlw4l71CSsOo7M64f6hDPcPFh4gvDfjTarYAiqlHmFgJMd2eo/qo2bTISvXo
	xJsqDz1waVJfGE/KDwd8sHsbbkrtdVssARbEH/m1JqZ2FSN15EfkbMq56s4YU9k6pJJzSX
	rzvZ30odbysWM2DxTSRzLzCk4jjKk3g8bvJArZkdP3s6pVD2W/RIkO0lEY7ILQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/16] docs/zh_TW: process: localize terminology in
 coding-style.rst
Message-ID: <amDYOmUlDWCOCa4M@wyuan.org>
References: <20260721215542.98435-1-chenyou910331@gmail.com>
 <20260721215542.98435-8-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721215542.98435-8-chenyou910331@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Jul 22, 2026 at 05:55:33AM +0800, Chen-Yu Yeh wrote:
> Localize mainland terms to Taiwanese Mandarin (內核→核心, 函數→函式,
> 宏→巨集, 枚舉→列舉, 聲明→宣告, 寄存器→暫存器, ...) and sync with the
> English original: update the memory allocator list and array
> allocation examples to the type-aware kmalloc_objs()/kzalloc_objs()
> forms.
> 
> update to commit 323fa4b9608b ("Documentation: Fix syntax of kmalloc_objs example in coding style doc")
> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>

Except the wrapping issue of the commit message (leave it to the
maintainers to handle it):

Reviewed-by: Weijie Yuan <wy@wyuan.org>

> ---
>  .../zh_TW/process/coding-style.rst            | 580 +++++++++---------
>  1 file changed, 292 insertions(+), 288 deletions(-)
> 

[...]

>  9) 你已經把事情弄糟了
>  ---------------------
>  
>  這沒什麼，我們都是這樣。可能你長期使用 Unix 的朋友已經告訴你
> -``GNU emacs`` 能自動幫你格式化 C 源代碼，而且你也注意到了，確實是這樣，不過它
> -所使用的默認值和我們想要的相去甚遠 (實際上，甚至比隨機打的還要差——無數個猴子
> -在 GNU emacs 裏打字永遠不會創造出一個好程序)
> +``GNU emacs`` 能自動幫你格式化 C 原始程式碼，而且你也注意到了，確實是這樣，不過它
> +所使用的預設值和我們想要的相去甚遠 (實際上，甚至比隨機打的還要差——無數個猴子
> +在 GNU emacs 裡打字永遠不會創造出一個好程式)

Change to:

``GNU emacs`` 能自動幫你格式化 C 原始程式碼，而且你也注意到了，確實是這樣，
不過它所使用的預設值和我們想要的相去甚遠 (實際上，甚至比隨機打的還要差——
無數個猴子在 GNU emacs 裡打字永遠不會創造出一個好程式)

?

>  *(譯註：Infinite Monkey Theorem)*
>  
>  所以你要麼放棄 GNU emacs，要麼改變它讓它使用更合理的設定。要採用後一個方案，
> -你可以把下面這段粘貼到你的 .emacs 文件裏。
> +你可以把下面這段貼上到你的 .emacs 檔案裡。
>  
>  .. code-block:: elisp
>  
> @@ -640,31 +641,31 @@ Documentation/translations/zh_CN/doc-guide/index.rst 和 tools/docs/kernel-doc 
>     (expand-file-name "~/src/linux-trees")
>     'linux-kernel)
>  
> -這會讓 emacs 在 ``~/src/linux-trees`` 下的 C 源文件獲得更好的內核代碼風格。
> +這會讓 emacs 在 ``~/src/linux-trees`` 下的 C 原始檔獲得更好的核心程式碼風格。
>  
> -不過就算你嘗試讓 emacs 正確的格式化代碼失敗了，也並不意味着你失去了一切：還可
> +不過就算你嘗試讓 emacs 正確的格式化程式碼失敗了，也並不意味著你失去了一切：還可
>  以用 ``indent`` 。
>  
>  不過，GNU indent 也有和 GNU emacs 一樣有問題的設定，所以你需要給它一些命令選
> -項。不過，這還不算太糟糕，因爲就算是 GNU indent 的作者也認同 K&R 的權威性
> +項。不過，這還不算太糟糕，因為就算是 GNU indent 的作者也認同 K&R 的權威性
>  (GNU 的人並不是壞人，他們只是在這個問題上被嚴重的誤導了)，所以你只要給 indent
> -指定選項 ``-kr -i8`` (代表 ``K&R，8 字符縮進``)，或使用 ``scripts/Lindent``
> -這樣就可以以最時髦的方式縮進源代碼。
> +指定選項 ``-kr -i8`` (代表 ``K&R，8 字元縮排``)，或使用 ``scripts/Lindent``
> +這樣就可以以最時髦的方式縮排原始程式碼。
>  
> -``indent`` 有很多選項，特別是重新格式化註釋的時候，你可能需要看一下它的手冊。
> -不過記住： ``indent`` 不能修正壞的編程習慣。
> +``indent`` 有很多選項，特別是重新格式化註解的時候，你可能需要看一下它的手冊。
> +不過記住： ``indent`` 不能修正壞的程式設計習慣。
>  
>  請注意，您還可以使用 ``clang-format`` 工具幫助您處理這些規則，快速自動重新格
> -式化部分代碼，並審閱整個文件以發現代碼風格錯誤、打字錯誤和可能的改進。它還可
> -以方便地排序 ``#include`` ，對齊變量/宏，重排文本和其他類似任務。
> +式化部分程式碼，並審閱整個檔案以發現程式碼風格錯誤、打字錯誤和可能的改進。它還可
> +以方便地排序 ``#include`` ，對齊變數/巨集，重排文字和其他類似任務。
>  詳見 Documentation/dev-tools/clang-format.rst 。

[...]

> -分配一個數組的首選形式是這樣的：
> +分配一個陣列的首選形式是這樣的：
>  
>  .. code-block:: c
>  
> -	p = kmalloc_array(n, sizeof(...), ...);
> +	p = kmalloc_objs(*p, n, ...);
>  
> -分配一個零長數組的首選形式是這樣的：
> +分配一個零長陣列的首選形式是這樣的：
>  
>  .. code-block:: c
>  
> -	p = kcalloc(n, sizeof(...), ...);
> +	p = kzalloc_objs(*p, n, ...);
> +
> +這兩種形式都會檢查分配大小 n * sizeof(...) 是否溢位，如果發生溢位則回傳
> +NULL。

I would say splitting this part into a small patch is better. But for this
time, it's fine.
