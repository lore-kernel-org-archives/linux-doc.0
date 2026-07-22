Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F98C2F4A05
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 05:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784699829; cv=none; b=HVEpXQZfKDdExwHopkIPhx955ldo4A/7nCXIv62Ucy9k0kI7GT8GrvwlgaJfUx+Eep5H5gjLF8TJH/U0QIAxbvDTFGF+WWjGzUJvO6/WAmtxHt5BFC0VXjwpv/TfAFC+PRl3cYPRsdJpvCzBonANGao7LKygWNlb0/su1f633WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784699829; c=relaxed/simple;
	bh=VwquUuVsuuHyWOjtXgnDu3+3jQWWpnuN4pqUb/t4VoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iMVHEDmfavtzzF9aUJuDRa7Q/JlmwFrSvKDQa/vHjCBYsQCUBLIF1XjcAWkkONgHsIdyeqmIln29DUAm5BGYSiZkTCCvoYT+008zkIi2Y3cFqaszABKu8M9LfQh7nIhqX61YH5E7bhqsLD1g5mfYjeEipEYXDYlELWBXRhuhb7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=kjYhhWkM; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="kjYhhWkM"
Date: Wed, 22 Jul 2026 13:56:46 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784699824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zBQiicSi5fnnQDxazHIMnhE1RUOqcwxlFed2NGvVi7g=;
	b=kjYhhWkMjqlMbfrk1qNFBx+wdAkBptuYXOW6cR/hv/juAif4f5Q8btTxwh/ERap3OTc9S+
	zgUjbwPGEvDRlzYLs4ez7HZIgAxnq4uI+O1Xtoh4PTNSnDLukkTyQwmNDk1/ptAYjvhnRe
	vbaB2NbwsnMwDN2Y1KX3ey/5D1yik/uyKyAYtDL7xLLjVAZkiGwfZhx3sDbtB6R8hqR6Va
	iopZ94XJ3oImSiVv9urProOGzyGiF/MN+uYQ9LxRvR8iIq5xHpTlcnPc4I8JwFXiXoA+/U
	J4TPNIGk9VnGX6kFpm0LJ8DfZ8ld3uOchSA6z6/rdjGoTL7prpS/4554ivwmtA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/16] docs/zh_TW: process: localize terminology in
 7.AdvancedTopics.rst
Message-ID: <amBbnowQ9rvZ4rrx@wyuan.org>
References: <20260721215542.98435-1-chenyou910331@gmail.com>
 <20260721215542.98435-2-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721215542.98435-2-chenyou910331@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Jul 22, 2026 at 05:55:27AM +0800, Chen-Yu Yeh wrote:
>  使用Git管理補丁
>  ---------------
>  
> -內核使用分佈式版本控制始於2002年初，當時Linus首次開始使用專有的Bitkeeper應用
> -程序。雖然BitKeeper存在爭議，但它所體現的軟件版本管理方法卻肯定不是。分佈式
> -版本控制可以立即加速內核開發項目。現在有好幾種免費的BitKeeper替代品。
> -但無論好壞，內核項目都已經選擇了Git作爲其工具。
> +核心使用分散式版本控制始於2002年初，當時Linus首次開始使用專有的Bitkeeper應用
> +程式。雖然BitKeeper存在爭議，但它所體現的軟體版本管理方法卻肯定不是。分散式
> +版本控制可以立即加速核心開發專案。現在有好幾種免費的BitKeeper替代品。
> +但無論好壞，核心專案都已經選擇了Git作為其工具。

By the way, not about the actual diff here,

"免费的BitKeeper替代品" should be "自由的BitKeeper替代品"

The text above is about proprietary 专有的/專有的, so here should be
自由的.

zh_CN has this issus, too.

But this comment should not interfere with/block this patch. I suggest
fixing it with incremental patches later, for both.

Quoting GNU's article [1]

"Free software" means software that respects users' freedom and
community. Roughly, it means that the users have the freedom to run,
copy, distribute, study, change and improve the software. Thus, "free
software" is a matter of liberty, not price. To understand the concept,
you should think of "free" as in "free speech," not as in "free beer."
We sometimes call it "libre software," borrowing the French or Spanish
word for “free” as in freedom, to show we do not mean the software is
gratis.

[1] https://www.gnu.org/philosophy/free-sw.en.html

The rest of this patch seems good.
