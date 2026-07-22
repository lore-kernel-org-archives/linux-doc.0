Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB04371CE0
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 14:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784731906; cv=none; b=Ih0ZKxjtZgc6SZ+gMhFxGLyYOVOett/B0hsvA7R4ZRCNyqTzdhUYGyAmP2jf7AU5kgpJBJRFnDC0RMvFej4CTqPEhWURRZLK8hlHqVNJUAnV0dVlfVOkteukHolgjmS2xEau5jy9Uzd8HcWCKCxeH3FsxS3EFLKa6G2l/fJnsBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784731906; c=relaxed/simple;
	bh=9ewhsjHOlbTDWG80QcmiEhITwAlIEoAJ36oSIsPLbek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kv8/vUxL2crAr90I2tYLpKkfncE2ImTfmULctT5SA5efyrb+Q3wqlrfcKEtLUTmSSQgJjFkYWLjO6Q196e8T1Lt1qgk2aOmzcxJ9+RTNPIGQc/ncjYBCd8xRF/YkPNwGiUOmgNTHYK63GLQjQfeet+JIL4mBePjNlXfKlt+Fw5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=Dg330Ohj; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="Dg330Ohj"
Date: Wed, 22 Jul 2026 22:51:15 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784731892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s5+8sP8gF/39TiIv/LI7riq7O/9w9jZ4H2iTkBYRnwQ=;
	b=Dg330OhjE2hrVuSe2s4IEu7ufQhMews5Znd4gIxEWE9MxIV8D5euBgLdr4upUAH+WctN0I
	kfxxZYeHWzn6Ee/cOnM0jGQ9rOQUhYaiY21/WM8eRmPpzY9Q6NfOAl6Sjln/jfTNAwSNS/
	HukmOJgMxVOjvlMAGzDo8h5XahmuvH9wDNh3iCR+7BB+KL+HOKJJt12G1bqM7iKhcdU1as
	XAjp09C2zZKT4/5Qcdd8GKHag9HO20zOUxiSGkx2TwMYvFG/mF3W38wzkjjvOxhhZo4YlZ
	lsmTEwXl84Eke+emxIuVl+62VduQU8CINAO8jmoonGzysv1puX+ug2DlOz0moQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/16] docs/zh_TW: process: localize terminology in
 programming-language.rst
Message-ID: <amDY41uKaPWM0Vqj@wyuan.org>
References: <20260721215542.98435-1-chenyou910331@gmail.com>
 <20260721215542.98435-7-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721215542.98435-7-chenyou910331@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Jul 22, 2026 at 05:55:32AM +0800, Chen-Yu Yeh wrote:
> Localize mainland terms to Taiwanese Mandarin (內核→核心, 變量→變數,
> 函數→函式, ...) and sync with the English original: drop the stale
> icc/architecture paragraph, switch to footnote-style references as in
> the English text, and add the Rust section, which now states Rust is
> supported (no longer experimental) per commit 9fa7153c31a3 ("rust:
> conclude the Rust experiment").
> 
> update to commit 47cb33cedf47 ("docs: clarify wording in programming-language.rst")
> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>

Except the wrapping issue of the commit message (leave it to the
maintainers to pass a judgment on it):

Reviewed-by: Weijie Yuan <wy@wyuan.org>

> ---
>  .../zh_TW/process/programming-language.rst    | 94 ++++++++-----------
>  1 file changed, 40 insertions(+), 54 deletions(-)
