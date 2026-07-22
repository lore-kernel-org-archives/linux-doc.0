Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC1F3469E7
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 10:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784716977; cv=none; b=kYB8TxxUqi23G/51NNQido+LyCopt3CjCQFQMkTyVdCxytOerDu9s3KPWTfKRJglD5iqA6uSqgQ3Ci6/Gj1avQ08LBc2NhkCvcdqpK+FPwe17ZNnUg2Ef56O2ptRacxlMYmPHghD0Df1YfVvG2eCBaeIzn7yUFuCZVub9CVuzWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784716977; c=relaxed/simple;
	bh=JvZ5rIpjwOcvQVBYVKNGMsirgxq9UGCO+keRGq7K6EA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FAC2PLkLtGnLC2Kao/jfxaY+DLrsXM3D62fCeykZOZhflBqxd10ZLUD9t5vAm2ZYSNhwRlpnJUeQx4u+vkYfd9bYL3HG+51Hib/dP0h2GRw4PgYTTlJXpfYQEnvPrF+MgUfoOZ14zEYRytKxasXygnC4esrcKj2kxbM0q87Zgd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=oilO9/PV; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="oilO9/PV"
Date: Wed, 22 Jul 2026 18:42:36 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784716963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g7JgZfY4jI18rVtCxcPyogeDLoBZxnMFGP0NKb0uwxI=;
	b=oilO9/PVHGbw4nyQgFdy7Xq+/LJE1nq1SVCPobwofPUM+Qiw7OR7FhkmzjfY5iDAI9xm4Y
	6fwGfZkktVT9dlTsypJKZ/QuDHEz9D3RKzgrMFEDQY/28iQDYjS8geOG57ad5lRX4Y8adw
	dIbJm0z0lL1OI0ID4dKTmlQXYi67t4w4+L/AVv2fMe2tIR9ZdeQVclzOmzIj/+U9HMgi5+
	dhEbh/toLrHrZEvjcKVf/PQfrsJfMhBQAju3a81eHTgTLMk6Ff7PqADASiMTaaO95vowf0
	b1ld+sM65m0OvAY8WmFihzzpP2JlNHr3M++1TpqV+pWT+HltgljyES8RZ5LQlw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: cuishuang <imcusg@gmail.com>
Cc: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn,
	corbet@lwn.net, skhan@linuxfoundation.org, wangyuli@aosc.io,
	kezijie@leap-io-kernel.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs/zh_CN: Add configurable error injection
 translation
Message-ID: <amCenDTqFKpC6ec7@wyuan.org>
References: <20260722100053.71691-1-imcusg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722100053.71691-1-imcusg@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Jul 22, 2026 at 06:00:53PM +0800, cuishuang wrote:
> Translate Documentation/block/error-injection.rst into Chinese and add
> it to the Chinese block documentation index.
> 
> Update the translation through commit e8dcf2d142bd
> ("block: add configurable error injection").
> 
> Signed-off-by: cuishuang <imcusg@gmail.com>

@maintainers

Hmm, do we prefer Cui Shuang or Shuang Cui? That seems more
recognizable. But I also do see that similar situation is found in the
applied patches as well.

> ---
> v1->v2:
>   - Add the required Assisted-by trailer.

I can't see the Assisted-by trailer in your commit message.. (above
'---') Did you miss it?

Thanks.
