Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E24E2F99B8
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 13:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784901479; cv=none; b=HJJze7ozfTOpbTyEMIeh98v1BUT19YW+2hi/j8gWVxY+3Rt7Aky4rw9osGPIoXbtwpsr/jIXMpXfO1dxdSw/ANZJoHFrVIpu6OyzRM6wA7wUzTtkLBF7sSjOkh3BPCq7HfS0oCq+JmNjJmJG9FB9D5PKHe69c+jECC09JJYObFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784901479; c=relaxed/simple;
	bh=Z0GaUnfpvjUSaEhocwo/huD0ZfaOqhc6irMtNBoPe5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lR5vN3L3kKfdYeDeJi274iQLJ+QNwamdCajAmmlLsfm2UUn5FMgnCdbuy5bI7cb6IrXXjMPn2I5f1Hz9G/83jZHAd1FZyF76ibw9diV0/JgD83wHzyWYSZt6bJRZLYcr2yOtV/VojCgoGnrau+ZZaKovROw0RM2LE3JmVTJwJh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=NZmoUK3c; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="NZmoUK3c"
Date: Fri, 24 Jul 2026 21:57:42 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784901472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1tHXd9moTBNicOhvA9R2AlyaFyve1XRLy3kF6zwdcy0=;
	b=NZmoUK3c0ATGzsWRaaigNHb4UpZUtK8WqBr7VPA2myhGTJ/Sme3sOHSNcBgRQPHTEQluPx
	Ug8y1qcW+ark5zlaPYYpqQvDrP4aaRtDy2n1a1CDJKfuKxS0VKOkt3q9k/dSc+wXpZ1Pm2
	4Kl09zNTBi2sjZ2z4NRPbQKpnGfp1Ubp4SDeWxG7BfuWjclRyhQ3R4tl8UVLmUB931oWEp
	L4suhERsp9aHzDIUoE2OC+do00DmEzK5Ghn+uyLqgP28pYz7N3dhZpwdfugOK5dibyAqsH
	nA2ylLnBF70H0BVV0pLzzCZawTKwNTwzHYsUb82hSmph/hWV23JIgc1qkAqAfw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: =?utf-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/16] docs/zh_TW: process: localize terminology in
 2.Process.rst
Message-ID: <amNvVsTq-bkDm_Qb@wyuan.org>
References: <20260721215542.98435-1-chenyou910331@gmail.com>
 <20260721215542.98435-11-chenyou910331@gmail.com>
 <amG08XPfZzA5y00N@wyuan.org>
 <CAKspUhJe1WmZzRh0TZDsO+jX_gWt6brhGuK3+o3T_k-eHc+aCQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKspUhJe1WmZzRh0TZDsO+jX_gWt6brhGuK3+o3T_k-eHc+aCQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Fri, Jul 24, 2026 at 02:41:02PM +0800, 葉宸佑 wrote:
> On Thu, Jul 23, 2026 at 02:30:09PM +0800, Weijie Yuan wrote:
> > s/LinusTorvalds/Linus Torvalds/
> 
> > 1) add a <space> before staging
> > 2) remove the <space> after staging
> 
> > Wrap a little bit earlier here?
> 
> All three will be fixed in v2. The missing space in "LinusTorvalds"
> and the spacing around "staging" were carried over from the old
> translation, and the long line is one of the paragraphs that needs
> reflowing after localization.

Yes, I left many marks that many of them are not the goal of this
series. I just want to make a reminder there that we may later resolve
them, so we can find it easily. Otherwise that's huge pain to look for
them again in the large diff ;-)

Thanks.
