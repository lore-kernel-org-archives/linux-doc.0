Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EA53AF65C
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 12:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784897840; cv=none; b=blvrKDpvcZuORvmuF9tmAp28wHNbt0sOQDfpcSLp2cphhzdtB/l1prwDNxkIgwel0r5XsW82FaIbXZXLODH4+ylpV7wqU868N/GO0CSIxglAGMToHL6B6YwBqUHNbAIIBF2MCnjG385A6JT8O+HxBTUxp+/MJVp8iIzwGOcSNfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784897840; c=relaxed/simple;
	bh=snYFUZohow9WgXFZId72cWZ66Zk3GR74BxRmaRM39sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJyo5l270i+3K2KgSn9f8zXjsu/SYGpcANU31TdOxuT8vfpxXyfNk4ImdiKo7X3ocnBAO+pJCC4cuSJRl6B850i9SZA/djspP8AL7QLiJxxOu889FiSUZHtnVrdX7zti5rLoB+n7zrVRHdgCnxyA76zmQcHhY1b5aK2pZnXgQ00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=dZTc/JJA; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="dZTc/JJA"
Date: Fri, 24 Jul 2026 20:56:45 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784897826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ezeiHMunrm4djxNrw25eXLE0xPzRP+oIE62FvftAgxA=;
	b=dZTc/JJAS3auokPSF00lDACKEq6AhRaLJESgKC+GHzNuJD4erPN4IIXqydJPgHr/fuWZ6m
	2WQeoN4ta3fLW1LVr5RpoE0J2dv0en+M0RlqdE/+FqWkUiz3LFnP8C63Pjvji/bpdKEcBN
	km6bnVm6PlHbOU9N53OHcpXu1ASCMCCjIIPGYEsO2CG7IRpyVd/gbIxhv6RpiFYqfFVlmD
	bLmCcne1OJ6wBrJY+sPWY7++m12h8kXhx4ek/KRgDaqYXnB/W4Y6Rn1MSHOAXz2AQVEFvb
	VsqZh2SPBwNlgTo+NHPdpnpytxau1w+GofGdJuetllJR5UhuBX8LZKG1caREVw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 16/16] docs/zh_TW: Add a glossary for Traditional Chinese
 translations
Message-ID: <amNhDDzQk5toZsiF@wyuan.org>
References: <20260721215542.98435-1-chenyou910331@gmail.com>
 <20260721215542.98435-17-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721215542.98435-17-chenyou910331@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Jul 22, 2026 at 05:55:42AM +0800, Chen-Yu Yeh wrote:
> Add Documentation/translations/zh_TW/glossary.rst documenting the
> Taiwanese Mandarin terminology used by the zh_TW translations, with
> the corresponding zh_CN terms for cross reference, plus the character
> conventions (為/裡/著/才/啟/只/發布). Hook it into the zh_TW index,
> replacing the existing TODO entry.
> 
> This is the reference used by the terminology localization of the
> zh_TW process/ documents in this series.

Acked-by: Weijie Yuan <wy@wyuan.org>

> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  Documentation/translations/zh_TW/glossary.rst | 145 ++++++++++++++++++
>  Documentation/translations/zh_TW/index.rst    |   5 +-
>  2 files changed, 148 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/translations/zh_TW/glossary.rst
> 
> diff --git a/Documentation/translations/zh_TW/glossary.rst b/Documentation/translations/zh_TW/glossary.rst
> new file mode 100644
> index 000000000000..32cfbfaaef3c
> --- /dev/null
> +++ b/Documentation/translations/zh_TW/glossary.rst
> @@ -0,0 +1,145 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _tw_glossary:
> +
> +術語表
> +======
> +
> +:作者: 葉宸佑 Chen-Yu Yeh <chenyou910331@gmail.com>
> +
> +本術語表列出Linux核心繁體中文（zh_TW）翻譯所使用的術語。zh_TW翻譯以臺灣
> +慣用的資訊術語為準。新增或更新翻譯時，請依照本表選擇用詞，以維持整個
> +zh_TW文件樹的一致性；若遇到本表未收錄的術語，歡迎提交補丁補充。
> +
> +下表同時列出常見的簡體中文（zh_CN）譯法，方便從zh_CN翻譯轉換或對照時
> +使用。
> +
> +一般術語
> +--------
> +
> +========================  ==========================  ====================
> +英文                      zh_TW                       zh_CN（對照）
> +========================  ==========================  ====================
> +kernel                    核心                        内核

Non-blocking note:

I started a discussion yesterday in the telegram channel of l10n-tw [1].
Some friends support "核心", some support "內核". The ratio is
approximately 50:50 or 60:40. I just leave some opinions here for future
reference.

* 核心:

  Reasons (unmodified):

  1. jserv 開的作業系統課是用「核心」啦...

     https://hackmd.io/@sysprog/linux-concepts

  2. 基本上 core 在核心情境下不會單獨當名詞用，而且歧義看前後文就知道了
     所以會很多人比較習慣 kernel = 核心 (然後 core 也等於核心 (but as an
     adjective))

  3. core 亦可作為名詞，如「雙核心」，此時並不會與 kernel 混淆

  4. 作業系統的 kernel 在台灣的書籍翻的還是核心比較多啦

     https://www.tenlong.com.tw/products/9789574935055


* 內核:

  Reasons (unmodified):

  1. Shell: 外殼
     Kernel: 內核
     Core: 核心

  2. Jserv大建議的是
     kernel 核心
     core 核
     以區分兩者

     不過我個人目前其實比較喜歡「內核」，因為 kernel 和 shell
     的稱呼大約就來自於內外關係。kernel
     是作業系統的核心，其他一切都是由核心延伸(?)出去的，shell
     則是「果仁」外層的「殼」，是使用者與前者互動的介面。另一方面，shell
     譯作「殼層」在我看來是錯誤地沿用了物理學名詞，不應強調「層」，如果 shell
     用了「外殼」那 kernel 自然要與之對齊。

  3. 比較沒爭議的就 核心／殼層／核 吧 (* what does this mean..? Can it
                                                be considered neutral?)
     有其他意見的人基本上就是自己研究過的，他們能看懂的((

---

Because of the context, no matter which translation is used, there is
actually no problem in understanding this. So there's no need to worry
too much about this.

Thanks.
