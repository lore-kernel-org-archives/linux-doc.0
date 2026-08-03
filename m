Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434A93C108F
	for <linux-doc@vger.kernel.org>; Tue,  4 Aug 2026 04:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785816838; cv=none; b=DIshgQstDysQox7NV08BPwZJBa5ZMyDsLWR4gYOtxxH6u4bKwxL34dyrKVpo0hggS/8Bf46pH6Emn3S+ioEEBhMjMKZ4ef9M8O5iKV067LHY6lYERHyaUAGN2mmxvz8Yc0jxWKHmWBZWKjVLyr96QAzcuhn+DHT4r2wqjzksjfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785816838; c=relaxed/simple;
	bh=mk85tQ4G9QNwsNY5N53bCBh9RCwON9RcBOPrVxiwUzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g6ntwxkoALqeomVwdXrn8IJFBSc/wdnrGLxu8qJeihDdhO8osOEpZXe4Afy4fPwpRPSwbdPNu4LgfJsBs0z4HVpOQkW++qcQ6gGTAdAs/PejY4Tv+LhUrVUFcZcxcHSVDAQb9WVIiNT+TnNBTomot7Yit1NAug3caY1Zd2Vpm6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=FYlNJc5O; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="FYlNJc5O"
Date: Tue, 4 Aug 2026 00:22:12 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1785774138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e33Cy59CoIyrpQx7LgVpf0fsks4Z83c3ncqC2xCHKrg=;
	b=FYlNJc5OKFbZTQyicAjyu9v7nKMFQ8Uzw6w+FsoNeOdGyc8Q43sIqKHpAdD/WWVS8YTBtI
	lBY2FhsVWsUxMH/mSS1lySOsmeTQ7dkpJb06FPyaqGSPfpjig6n9BXhn+4kFb8KcfqPEGP
	Yi33kDyC122402V8bEOAKq/EdYS5x4mOtXUg4IVizBsleHba2b0EZrMtOtpNma3++aib5W
	we3DbIXVF543TTJSxP2a9EUPOFE1fsUzCf9XhqF0IydkoYXRFaQ29xg3SHQwRO751lDy2B
	+mGX0R6bBCrfddJPV0J33ms5YN0NP6HQoJh5gV2qWv/ap7wnaW8PkrPIaiLA5g==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/16] docs/zh_TW: process: localize terminology in
 2.Process.rst
Message-ID: <anDANHRAHb3wr2o8@wyuan.org>
References: <20260728091038.171033-1-chenyou910331@gmail.com>
 <20260728091038.171033-11-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260728091038.171033-11-chenyou910331@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Jul 28, 2026 at 05:10:32PM +0800, Chen-Yu Yeh wrote:
> Localize mainland terms to Taiwanese Mandarin (內核→核心, 社區→社群,
> 郵箱→信箱, ...) and sync with the English original: rolling-release
> wording with the 9.x example and Wikipedia link, 9.x-rc1 examples,
> stable team now Greg Kroah-Hartman and Sasha Levin, LTS list moved to
> kernel.org, linux-next maintained by Mark Brown, and mailing lists
> hosted at subspace.kernel.org.
> 
> update to commit 46298375477b ("linux-next: update maintainer info.")
> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  .../translations/zh_TW/process/2.Process.rst  | 325 +++++++++---------
>  1 file changed, 158 insertions(+), 167 deletions(-)

[...]

>  Staging 樹
>  ----------
>  
> -內核源代碼樹包含drivers/staging/目錄，其中有許多驅動程序或文件系統的子目錄
> -正在被添加到內核樹中。它們在仍然需要更多的修正的時候可以保留在driver/staging/
> -目錄中；一旦完成，就可以將它們移到內核中。這是一種跟蹤不符合Linux內核編碼或
> -質量標準的驅動程序的方法，人們可能希望使用它們並跟蹤開發。
> +核心原始程式碼樹包含drivers/staging/目錄，其中有許多驅動程式或檔案系統的子目錄
> +正在被添加到核心樹中。它們在仍然需要更多的修正的時候可以保留在driver/staging/
> +目錄中；一旦完成，就可以將它們移到核心中。這是一種追蹤不符合Linux核心編碼或
> +品質標準的驅動程式的方法，人們可能希望使用它們並追蹤開發。
>  
> -Greg Kroah Hartman 目前負責維護staging 樹。仍需要修正的驅動程序將發送給他，
> -每個驅動程序在drivers/staging/中都有自己的子目錄。除了驅動程序源文件之外，
> -目錄中還應該有一個TODO文件。TODO文件列出了驅動程序需要接受的暫停的工作，
> -以及驅動程序的任何補丁都應該抄送的人員列表。當前的規則要求，staging的驅動
> -程序必須至少正確編譯。
> +Greg Kroah-Hartman 目前負責維護 staging樹。仍需要修正的驅動程式將發送給他，

Oops, I guess I might not say it clearly last time, I said:

 | 1) add a <space> before staging
 | 2) remove the <space> after staging

Actually I mean:

 Either: add a <space> before staging
 Or: remove the <space> after staging

Which is..

[A] Greg Kroah-Hartman 目前負責維護staging樹。仍需要修正的驅動程式將發送給他，

[B] Greg Kroah-Hartman 目前負責維護 staging 樹。仍需要修正的驅動程式將發送給他，

Which one do you prefer? I think the first option is more consistent
with the usage throughout the text.

So let's adopt option A in next re-roll.

> +每個驅動程式在drivers/staging/中都有自己的子目錄。除了驅動程式原始檔之外，
> +目錄中還應該有一個TODO檔案。TODO檔案列出了驅動程式需要接受的暫停的工作，
> +以及驅動程式的任何補丁都應該抄送的人員列表。當前的規則要求，staging的驅動
> +程式必須至少正確編譯。
