Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E640470456
	for <linux-doc@vger.kernel.org>; Wed,  5 Aug 2026 16:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785946861; cv=none; b=QFBg7OhI7yFHIbSB7Fs82SeTjxPWpRIWjI7znkOt86fjOBN20VMasAe0ODbif6b2r0PWT818xuaqsDRYoLf1qb7nrHwqRWGGYydgkMhC5QpvTzCttXr6VgSyGLxXm7DY9gjwoUQ5mYF1ocydlonERs/9xDo82hOtnt4zPRaaNmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785946861; c=relaxed/simple;
	bh=JUrzj4o7bCoiRqiZ0x0xZy5NjydHTuKvPjo5Ei2xZ/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MYREpn0Zz6cnC46wX5K7Ww4Ss23QjMdJZCfWCsBS440pZ42OtBErfbQuFAOD/f9p1y/ZeJIKjJiG3IcopeV+Ag9K/ILZrZXHdxoSnkCi6HDoU0UGnCE0kukH5jtji9XddNk0PRzqhJiuWFOaPdKjrYJVeOUrhlqCwcbjnOpP34E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=XBoMljhQ; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="XBoMljhQ"
Date: Thu, 6 Aug 2026 00:20:18 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1785946846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j9slRGvAf7x6jKGJc5G6UKGZHe7yu2gGcgYDSb2BoTM=;
	b=XBoMljhQlaM5HFYH7tEhp+31lDeePAbWGvFCPXn+VqMoHxmmN21w/mSqKmD1jAp1cP6DEE
	l09KHLO9Fp5QVv5csz/KyckNQyYZU3i+I2oEtCJcixzrH2HmgOE+dqToy88c76to18qKpE
	JjnA4HafYdzrUB5O7Zkue3uatIX+qPmpKlUCuxN6VjRdUm6iAoKEeEC8vfBA/r2jLoVd9D
	044ZGoTZh65n9ISPtZEba5ToD5qGtrug4eTX+UD0SRoJTX5OndFv4sQAr4KA37TQyDV153
	fqNJ2XVYurQGx7DtfIYS5P8OMSvVkmmYOw8/hhDg9bireSVCugRw9cA/Q8TAlg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/16] docs/zh_TW: process: localize terminology in
 stable-kernel-rules.rst
Message-ID: <anNiwt5jL-tYUeNs@wyuan.org>
References: <20260728091038.171033-1-chenyou910331@gmail.com>
 <20260728091038.171033-9-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260728091038.171033-9-chenyou910331@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Jul 28, 2026 at 05:10:30PM +0800, Chen-Yu Yeh wrote:
> Retranslate from the current English text, which was heavily
> restructured upstream (three submission options, stable tag variants,
> tree list), and localize mainland terms to Taiwanese Mandarin
> (內核→核心, 隊列→佇列, 數據→資料, ...).
> 
> update to commit 10466b17af65 ("docs: stable-kernel-rules: fix typo
> sent->send")

Reviewed-by: Weijie Yuan <wy@wyuan.org>

> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  .../zh_TW/process/stable-kernel-rules.rst     | 256 ++++++++++++++----
>  1 file changed, 208 insertions(+), 48 deletions(-)
