Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A1948A2DB
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 15:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784041489; cv=none; b=IFudxT2OmwxPGC/Snw7fZhklXxkAKUQIVle9unUqY0UDACtV8F/UcmW8MLoFmX5FFcfCGvIpTvvNhnp4MnPcyFQwwT2P3U6tJXVqUZGo/noJgMz5gfxdF1mQ7/Wq5C7xSGQcfwQ8rJ+PiWt2bgAskOn9cwJnqsWY+khFt8E6Hsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784041489; c=relaxed/simple;
	bh=FQm0/D44eriZgFxyZUYSPGkdP/MWN8tiXTiMftZgk74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pURHdfMFeo0Xh0qmaX3a0Ly+7vkYvhYWh5yrMYtLXMDeqCBSiWk162k0b5fVXPrukwpecSLUlGuFhca5qoFwGAoIhaz7LcvZItsqjRatsF4JWKNaCTwBWuNSiY4HZReK0E+u/q9rkKs19zmI7ZEjIcUAzf+1y3faYMli4Pv8Cb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=w4tw+dVY; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="w4tw+dVY"
Date: Tue, 14 Jul 2026 23:04:31 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784041484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RHaZnGPSOJaMwyJruAf1dCStR/FTnImQ/vZOaUvpGrw=;
	b=w4tw+dVYOIORNunISMPo8K1FawcQlR9prgkQnJgJHSNGt283/uCmZ5w2a/t9eEjZmst2E5
	imFnSVXozyEmJsGLNMD6/ENP5JciZ902o96e0KMKFuB/sr8uQK5zmOjxBBcgM54y52s1eO
	ewkaKgm/r6ittQ6b93n6YTLHrYefS8Pj/qy/Rz5vqMp9ytlftf2fB+I/2dQ2/wXWz5SMPM
	cQNkj0eSerSwfyREnDdDytUm6O9gtDq1B2upjgklRTDmMXwgx0aUoRBmMPSiwzrGrhfhak
	IwvEfWNAeOYKC7mZB1PD+d8Lbe8YY1iPVhIM+khVZKX0EVb4126j4isV5hVKqw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>, Ben Guo <ben.guo@openatom.club>,
	Gary Guo <gary@garyguo.net>, Yan Zhu <zhuyan2015@qq.com>,
	Doehyun Baek <doehyunbaek@gmail.com>,
	Jiandong Qiu <qiujiandong1998@gmail.com>,
	chengyaqiang <chengyaqiang@tsinghua.edu.cn>,
	Haoyang Liu <tttturtleruss@gmail.com>
Subject: Re: What's cooking in zh_CN (Jul 2026, #02)
Message-ID: <alZP_6nAXNy_HfZi@wyuan.org>
References: <alZK0i0HvxOvSKwj@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alZK0i0HvxOvSKwj@wyuan.org>
X-Migadu-Flow: FLOW_OUT

On Tue, Jul 14, 2026 at 10:42:34PM +0800, Weijie Yuan wrote:
> Here are the topics that have been cooking in Alex's tree.

This statement is incorrect. I will correct it next time.

Sorry for the noise.

> Copies of the source code to Chinese documentation development tree live
> in here:
> 
>     git://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
>     https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
>     https://kernel.googlesource.com/pub/scm/linux/kernel/git/alexs/linux.git
> 
> Mirrors:
> 
>     https://mirrors.hust.edu.cn/git/kernel-doc-zh.git
>     https://mirror.nju.edu.cn/git/kernel-doc-zh.git (experimental)
