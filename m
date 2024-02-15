Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0611A13B294
	for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 23:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708040121; cv=none; b=Nr1/NeX6QkuM31vJXcEmgefCJFHtyfAh8TUQcCmI7KGC20xlrVeR4MiIh7Oz4jElZOPL+lPyqnA5tLYMkMzjPQ06B4ZUeuEjJvPTfkEozZezce4PLa93HRPNIVkgbt5pzax/B6cCc0MGK3pU4hHLGZgnCCd2PqF2sprFelEnIQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708040121; c=relaxed/simple;
	bh=ASpAxO2SKEhYDedaMFjCuxFyrh4efmSJYJew0p2Txmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t5oLh+oC5+rKn4HoRvI3gRz2R1YHhPtAyIHatBH7c9M3FX77kbK57dyXOG0V6FMgJ2rl6N0J0Ole10ttNrcRF0AypGGx3fzPfR15tJ3+w6v0/7x6BEglcCQ1BpBrhqWbIY4tpnIk868OokXkf2TMZa15NaxcDTQooZRXx9th5ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NIOsl+1s; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NIOsl+1s"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=51/eUIaGFQTLXIFGeFP0L+36yMqIIfnj2P3j79BEZuQ=; b=NIOsl+1sJiHBfLX0qEklccJL3+
	DDKPzZRnudvL2EXblOgnuxIjSnFeHuZXBzpX8y7r1Qc1MRzoEK2dX2fz/NIXOisjIkrNIfBrX5vUX
	FVQ6ZuGnwm4J/No8rIEw8wLNrzbD0+v6M1l6QiAIWNNRab9P++SpOdEoFz0adVVng+L+F1icN6ywc
	eYyiH7/NgfknJA5kJIY7enWho6QPdn+Qee9Qs5rR/Sh2kjR1sseozhzE00s8cYnYsjIBvNAaVnrsr
	uSlxwFLToW3q7L9esirFv1cfJPQv03ZOfugKauFIer0DbibWMAWChYd5GNGDOxpedFHfY/NSQo5RN
	KPWF1U+A==;
Received: from [50.53.50.0] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ralG5-00000000Tgo-0Ux4;
	Thu, 15 Feb 2024 23:35:13 +0000
Message-ID: <9044f53a-a2d6-4bee-86d0-2ba1c2d8d3c4@infradead.org>
Date: Thu, 15 Feb 2024 15:35:12 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] doc: kerneldoc.py: fix indentation
Content-Language: en-US
To: Vegard Nossum <vegard.nossum@oracle.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240215134828.1277109-1-vegard.nossum@oracle.com>
 <20240215134828.1277109-6-vegard.nossum@oracle.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240215134828.1277109-6-vegard.nossum@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/15/24 05:48, Vegard Nossum wrote:
> kerneldoc.py is mostly indented with 4 spaces (like PEP8 suggests);
> replace the last remaining tabs for consistency.
> 
> No functional change.
> 
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  Documentation/sphinx/kerneldoc.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
> index 7acf09963daa..ec1ddfff1863 100644
> --- a/Documentation/sphinx/kerneldoc.py
> +++ b/Documentation/sphinx/kerneldoc.py
> @@ -61,9 +61,9 @@ class KernelDocDirective(Directive):
>          env = self.state.document.settings.env
>          cmd = [env.config.kerneldoc_bin, '-rst', '-enable-lineno']
>  
> -	# Pass the version string to kernel-doc, as it needs to use a different
> -	# dialect, depending what the C domain supports for each specific
> -	# Sphinx versions
> +        # Pass the version string to kernel-doc, as it needs to use a different
> +        # dialect, depending what the C domain supports for each specific
> +        # Sphinx versions
>          cmd += ['-sphinx-version', sphinx.__version__]
>  
>          filename = env.config.kerneldoc_srctree + '/' + self.arguments[0]

-- 
#Randy
