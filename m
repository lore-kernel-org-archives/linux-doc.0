Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36FD21CA13
	for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 06:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783839216; cv=none; b=pMbnFl4wsbnqaQFte6eeU6171gCnafaqGuaAqAovlOWl1SYlP8SGd5DrbMPg8P0KfTTms8joL9dwdRldnpBars/tDYVTWvbjkOGe4y0u1iiGuGDOTm4p3LiYLBWv2NlMIbTh87uPYAwCBmuL10DVmgucENrHyu54PUNN1vsbyl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783839216; c=relaxed/simple;
	bh=p1sCniXAnPIkpEs8Vk4uXJRwgknejmNmlee2L8k4e40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dcxu6Uj6C845Oe5fUsZm7iVkVlJU0jyEMxTKmsKCfzUiWyb39QBxwOgUPcrSCTqgfSrS/Cpxi728nyIveocv1pBiE5ygE6Hhtcu9YttcWq/2H8Ibz/EpxhNjEB+VToxMW+Dzp8RGa4fXtlP1SityXB40Lm1OXXwBqK7jIe2xaY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=Cxk8I64x; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="Cxk8I64x"
Date: Sun, 12 Jul 2026 14:53:07 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1783839211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=32riWyf5VIBXOuh8gPTukbBEVwBH2DqIU46imZiJiVA=;
	b=Cxk8I64xBvslY6lF3PZYZqWAkfX48443T5XKPqu7SKI8VC4EqyYli5bGvA6G/PzGz0UbHc
	ISvdDbNHfs8IorZn/sbLIXk2bTCA3NaMlHPyP3RiD9hl0oOJ1WzZcpD01z17hG4bv8Mmu/
	ZFhFw7HMT0fKD5VfKxBMbOcpivrtezmCTyoxDkNlZF/4qQ9SMpU91J1nBrI78+OcyPnjl1
	p3b27cAjwkm4BaWOP1meE7++kZPdosJcRgtuKrTRBgoAAWne8X7S+q7tzAwu+nwnWD+ZHD
	CJIpVAqdcLunuY6GS6+/DmzXGcnnrdFk1pF8SRI2i8iRBMZcidHilFZewND/Zg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: add docs-next checkout workaround
Message-ID: <alM509XVvq3Q0gKd@wyuan.org>
References: <4e5e728877c77a89f6c59e89c88ba8ffa8842643.1783609005.git.wy@wyuan.org>
 <ce715802-1b46-4ba6-b388-39260f217ba3@hust.edu.cn>
 <alD1b7O6KaIMqWpa@wyuan.org>
 <f637a819-5596-4cd7-b2fe-be7293eedf14@hust.edu.cn>
 <alD6UJw1Y2VNK3x1@wyuan.org>
 <91ea31b9-4154-4769-a620-43fea87cb949@hust.edu.cn>
 <alMp5-UPJks0xEvS@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alMp5-UPJks0xEvS@wyuan.org>
X-Migadu-Flow: FLOW_OUT

On Sun, Jul 12, 2026 at 01:45:36PM +0800, Weijie Yuan wrote:
> > We are currently diagnosing network issues on our mirror site. The classic
> > architecture - Nginx (serving static frontend, HTTPS, and caching) -> Apache
> > (reverse proxy + CGI execution) -> cgit / git-http-backend - appears to be
> > functional in principle.
> > The clone failures with large Git repositories are likely caused by
> > insufficient or inappropriate parameter configurations rather than the
> > architecture itself.
> 
> Agreed, it is very likely that the transmission problem is caused by the
> large size of the warehouse.

Oops, I mean repo of course.
