Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3423B3898
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 12:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784894905; cv=none; b=ujgfJ5EHGjpeT9C+/Hk7TE8btqCexT4vqPMDy/eJbuFwSK0hrlJ0tJ7AMroQe7AQ06YY6e6bSQqo74KuuJlN534OZp6VBsZn0HNQOdqi2JhScxn8nBZYDDX4F0YR1Ez212AO22ijm0IG8QeUEbknsY3Rpy+8kP6Kn+13VPtL364=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784894905; c=relaxed/simple;
	bh=HYXhXNdtx8MUhunb9bHVTF+TvWV6DXbM54tQhZ91H1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0atMEmuERYzh6fAKscyRCoLJLNc+b7p5qdsvN0nZ3bUqZr0nCKbduOhnirZvIkHsrsrmHiRe45oaQU246I2+rYwXD6xXooVntw8XUROTNZIWaE0J2ZDW7G448RGm+n+QmOEV9DHo0SUQ6GTXBdWI8xbaKrzkbgJ3dg63XTuXLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=WQIDADHx; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="WQIDADHx"
Date: Fri, 24 Jul 2026 20:08:05 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784894897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DfxH3EKqBwi8E3BaGeGU1LdfsQ+xZg115PDqR5cNdpg=;
	b=WQIDADHx9XcnlAmvRfOdFFtHDuf4dErsYxJHlDmKWwIGbbCGZWGBmcuAxW0gh49GMFxjn/
	WXH+g0wwQc2MR1rq/pyAvoTAYwff4vkQ4mxmh0jsdzojxD9FeQzXfmubnDRlhK7DUc3vZJ
	vvL2BYo+xbSUaaBdUdOvBYr2i9fYnMbY5f2wJcamcC87aPayPdVqbHjDDzBCkqVo/YV9ox
	UbxbpdCEO9KEWWI1feVedGQ1ELLW5BiJKYTELXmn06gfEFrNKzlvutIvWrZskLkMoQGSkT
	8YYL+uCHZmFJUf8/jzHbKwtrG4M7KgQGQi92pIUeh73qNUntpvrObZxkHdz+LA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 14/16] docs/zh_TW: process: localize terminology in
 8.Conclusion.rst
Message-ID: <amNVpU-47HOO58Ir@wyuan.org>
References: <20260721215542.98435-1-chenyou910331@gmail.com>
 <20260721215542.98435-15-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721215542.98435-15-chenyou910331@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Jul 22, 2026 at 05:55:40AM +0800, Chen-Yu Yeh wrote:
> Localize mainland terms to Taiwanese Mandarin (內核→核心, 代碼→程式碼,
> 軟件→軟體, ...), normalize character conventions (爲→為, 裏→裡, 啓→啟,
> 發佈→發布) to match the zh_TW glossary, fix the zh_CN cross-references
> to zh_TW, and rephrase a few sentences for fluency.
> 
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>

Reviewed-by: Weijie Yuan <wy@wyuan.org>

> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
> 
> Note for reviewers: this differs from the version Dongliang Mu reviewed
> in June. Beyond the terminology localization he reviewed, I additionally
> normalized the character conventions (爲→為, 裏→裡, 啓→啟, 發佈→發布) to
> match the new zh_TW glossary, changed the zh_CN cross-references to
> zh_TW, restored the blank line before the LWN index URL (the reviewed
> version dropped it and broke the RST rendering), and added myself to the
> proofreader list. The Reviewed-by is kept as the terminology changes it
> covered are unchanged; happy to drop it if preferred.

Nice reminder!

>  .../zh_TW/process/8.Conclusion.rst            | 51 ++++++++++---------
>  1 file changed, 26 insertions(+), 25 deletions(-)
> 
> diff --git a/Documentation/translations/zh_TW/process/8.Conclusion.rst b/Documentation/translations/zh_TW/process/8.Conclusion.rst
> index d1634421b62c..c95e2d1c7e81 100644
> --- a/Documentation/translations/zh_TW/process/8.Conclusion.rst
> +++ b/Documentation/translations/zh_TW/process/8.Conclusion.rst
> @@ -11,45 +11,46 @@
>  
>   吳想成 Wu XiangCheng <bobwxc@email.cn>
>   胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
> + 葉宸佑 Chen-Yu Yeh <chenyou910331@gmail.com>
>  
>  .. _tw_development_conclusion:
>  
> -更多信息
> +更多資訊
>  ========
>  
> -關於Linux內核開發和相關主題的信息來源很多。首先是在內核源代碼分發中找到的
> -文檔目錄。頂級
> -:ref:`Documentation/translations/zh_CN/process/howto.rst <tw_process_howto>`
> +關於Linux核心開發和相關主題的資訊來源很多。首先是在核心原始碼分發中找到的
> +文件目錄。頂級
> +:ref:`Documentation/translations/zh_TW/process/howto.rst <tw_process_howto>`
>  文件是一個重要的起點；
> -:ref:`Documentation/translations/zh_CN/process/submitting-patches.rst <tw_submittingpatches>`
> -也是所有內核開發人員都應該閱讀的內容。許多內部內核API都是使用kerneldoc機制
> -記錄的；“make htmldocs”或“make pdfdocs”可用於以HTML或PDF格式生成這些文檔
> -（儘管某些發行版提供的tex版本會遇到內部限制，無法正確處理文檔）。
> +:ref:`Documentation/translations/zh_TW/process/submitting-patches.rst <tw_submittingpatches>`
> +也是所有核心開發人員都應該閱讀的內容。許多內部核心API都是使用kerneldoc機制
> +記錄的；“make htmldocs”或“make pdfdocs”可用於以HTML或PDF格式產生這些文件
> +（儘管某些發行版提供的tex版本會遇到內部限制，無法正確處理文件）。
>  
> -不同的網站在各個細節層次上討論內核開發。本文作者想謙虛地建議用 https://lwn.net/
> -作爲來源；有關許多特定內核主題的信息可以通過以下網址的 LWN 內核索引找到：
> +不同的網站在各個細節層次上討論核心開發。本文作者想謙虛地建議用 https://lwn.net/
> +作為來源；有關許多特定核心主題的資訊可以透過以下網址的 LWN 核心索引找到：
>  
>    http://lwn.net/kernel/index/

Note: have changed to https://lwn.net/Kernel/Index/ (uppercased first
letter)

(I'm not familiar with how LWN works, so later I will check the
availability of these urls manually ;-)

> -除此之外，內核開發人員的一個寶貴資源是：
> +除此之外，核心開發人員的一個寶貴資源是：
>  
>    https://kernelnewbies.org/
>  
> -當然，也不應該忘記 https://kernel.org/ ，這是內核發佈信息的最終位置。
> +當然，也不應該忘記 https://kernel.org/ ，這是核心發布資訊的最終位置。
>  
> -關於內核開發有很多書：
> +關於核心開發有很多書：
>  
>    《Linux設備驅動程序》第三版（Jonathan Corbet、Alessandro Rubini和Greg Kroah Hartman）
>    線上版本在 http://lwn.net/kernel/ldd3/

http://lwn.net/kernel/ldd3/ or https://lwn.net/kernel/ldd3/ returns 404
(for me?)

In English version, they have changed to https (and uppercased), which
is:

  https://lwn.net/Kernel/LDD3/

Just leave a note here, because this patch doesn't mean to sync with
English original at all.

Thanks.
