Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CEE248F73
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 13:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691879; cv=none; b=AyNfyR+v+pvnS80WF6EobNgI0ka/m6sdDnnKuuQb0t6IyqluJNQaKbhUYtOLT77Esnu/P/qGI1kjsn4qDrsz+tKoLRV96k0m0Kg3NHJynkQYMwvOApQ0D6S1ZhbtYvbyy3zXhlC4CiYpOIJWaFy18WEi5sCQbbk3uAxdtkvQNj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691879; c=relaxed/simple;
	bh=8wARTC+ds8j0CjhyCea0YxhJJ468IIPls0q97XoLBxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GmcnulrAReZF6r8TmUdbSFz1Gt7NcutpHov0bmppEnOQWGYEMob/jpuVA1TJ+Pvi06zD8+xrwRRelVEh/JKlk9M4Tp0L5uzkC/p8xcFH+zcd5vNpnnt53WEx8jBmm8iGQM4wwBr4sCjV4IodSuj6+C52RBPkxAGyCzu0qLue3MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=aAL6eTuH; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="aAL6eTuH"
Date: Fri, 10 Jul 2026 21:57:36 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1783691874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rXBpqLg8g/x0DnWjXId5cAJLFGn3ZRur2O6qm8QzbFQ=;
	b=aAL6eTuHk5WdfeIjuEdtFzMSjkxGfQsH/R92jixHLdy8Pb4EhsZ8XErMeqXmDqZNadG8sJ
	NB+S/KYgmcYwsF+H2I5x93FpTOTmlGHwkh0UHOlaP8KY/6rsKqt2RGAHtwdFbUo0GI9Dwa
	t67UCkCCk4gTjvrG085SsowWWhEgkioxi2d4NjVdKcZLcAp/xbowcFRp3/RPezj6cqmwwX
	BEXdIomh0DXQy0Dm/5ud//rJTgltnKU5SejZkVb1nrnxYAsLpi29BJI2T8eifH5s9V3DKd
	XKACAX+QT2EwhZdlidHQBJGgOVUk5245DgsS9nLgnj8kAplElKfs4YfT0XCRCQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: add docs-next checkout workaround
Message-ID: <alD6UJw1Y2VNK3x1@wyuan.org>
References: <4e5e728877c77a89f6c59e89c88ba8ffa8842643.1783609005.git.wy@wyuan.org>
 <ce715802-1b46-4ba6-b388-39260f217ba3@hust.edu.cn>
 <alD1b7O6KaIMqWpa@wyuan.org>
 <f637a819-5596-4cd7-b2fe-be7293eedf14@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f637a819-5596-4cd7-b2fe-be7293eedf14@hust.edu.cn>
X-Migadu-Flow: FLOW_OUT

On Fri, Jul 10, 2026 at 09:44:45PM +0800, Dongliang Mu wrote:
> > > > --- >8 ---
> > > Is this a special mark for LKML? If I understand correctly, the following
> > > should be the patch content.
> > Yes, the following is the commit message body.
> > 
> > You can apply this patch by "git am -c" or "git am --scissors", which
> > means: Remove everything in body before a scissors line (see git-mailinfo[1]).
> > 
> > https://git-scm.com/docs/git-am#Documentation/git-am.txt---scissors
> > 
> > Git community sometimes use it, for the cases if you want to swap the
> > actual commit message and the supplementary information.
> Understood.

Sorry for any confusion.

> > > This would make the envionment preparation more difficult. My suggestion is
> > > to ask maintainers of some mirror sites to sync this repo like us.
> > > 
> > > Dongliang Mu
> > Makes sense. Could I kindly ask, for example, Tsinghua tuna team to
> > mirror our repo, on behalf of our Chinese document team? I'm afraid they
> > are unlikely to consider my request in my individual capacity. ;-)
> 
> I can help contact TUNA maintainers.
> 
> Dongliang Mu

That would be great! Apparently your words carry more weight than mine
;-) So do you mean that I just need to wait quietly for your good news?

Appreciate it!

Thanks,
Weijie
