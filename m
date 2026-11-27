Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795767730;
	b=LA5noFLKME8wFQs7octy7moTp5vD3F5aHu7gjSOKM6W/rNzR0t9kraWZfR4rrRIavPb3
	 dqf7RI8ktgX0eBKcy5Dlm90lmnSCPqeZD207FgpJP6eowrXw2mlpBgGGP1F6vOO0ZVBc3
	 8r97Su5d0rGrYeAXHZOgrmo4yuWEYPc8Y8Hq5pFdG7FxZbSK7Jd3Vby6RTQDwaR91e2VC
	 BnPEHM6iS+SthNOE9QtbZbiWbCNgK2xpIj4zkb5g1n2O4td2hq0NIfYdFujjHk+U8BjXM
	 q9FFsD2r0zayFYTw2qC2V0GH4xcstAgHCoe7hLgPxtzMyMBcTMW1yuEmPjZk/MVdtmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795767730;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4gjIviFxnoVaasMSYbqLBSAQ4vI3oymgCZJPsQtN0hU=;
	b=ADoBjW4nSrWsk5kOmGXGREVJ/QqvA7Xo7axnRCAdzoaPyiyR4xxC+IIFDnOLtcIarUHZ
	 YDxYaq7BmmPxVswfg36RlXYAttAO4+S0ZD8sUvLU51VCceI+DcpFRFz9P71azoPsWibao
	 JQJ/y1Aw8PPgRbY7B9eDPeiMDvDhUoYDZYDRzmolOAu7KyoZjw4V/HLetRNlcanLl9iPK
	 3CzoGFxEyM3Chn2kQUUKaPmBSxobgABImYSml3qUq/qf5zbWW8H8dEXzY9KGSbunzl/aU
	 gBAK2PUTBPdegOO3P8AfcZdvKf9hhPo1oucSiX1ERoCd9u+Qz8BQMkfn1x1U1GLKqWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=JsSQ4mIX;
	arc=none smtp.remote-ip=95.215.58.30
Received: from mta1.migadu.com (out-30.mta1.migadu.com [95.215.58.30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CC1606A32C
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 08:22:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38CC1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=JsSQ4mIX
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ulwFGhznBrvY87SLHxyMhtM155mX9ZEbpTL/Ry/VU+A=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795767727; v=1; x=1796372527;
 b=JsSQ4mIXLWNiRuJsEsp+dRr8v0rsWgnOVZmOPSL2Z1kQvyMWGI8WEh8MgsY43U4upjt0TJDQ
 YWLuFl79fh56Ot+jhK1hSWMgwScY6qKkeG6B068Rn8e2hVby8hbn1ZcqAooj0ekIvvxANkWV8PH
 Zbm29NiTlgr3R4Qk1ciftacND+oZ0wc2ZCeWYyn5yJTQsWAxC0qxwpjo5WnIAp4JGJ5Ebi/amcm
 0tFRAgnDF93h6aQXksGvlZA01lprz2HbhXdlHy4GlLXCIhkwFr24xMjEm7P2PU0HwILuFq8m9br
 dAkEmgiMYu0ZHKxZsB4xCnWD3i4vf6cgHVq0EgS1wsjIA==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 00acb8133852aa2e;
	Fri, 27 Nov 2026 08:22:07 +0000
X-Mizu-Trace-ID: 00acb8133852aa2e
X-Migadu-Flow: FLOW_OUT
Date: Fri, 27 Nov 2026 16:21:58 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Alex Shi <seakeel@gmail.com>
Cc: linux-doc@vger.kernel.org, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: Re: What's cooking in Chinese docs (Nov 2026, #05)
Message-ID: <awk9puFUUkVhqRpV@wyuan.org>
References: <awRWXw8KsV_TJs9A@wyuan.org>
 <5bcd13dd-5164-4a0b-bec0-c8fdd795cf11@gmail.com>
 <awkC0plVerzZe-hi@wyuan.org>
 <273c5571-8e0c-4b5d-a3ac-a716575fd1f7@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <273c5571-8e0c-4b5d-a3ac-a716575fd1f7@gmail.com>

On Fri, Nov 27, 2026 at 04:15:48PM +0800, Alex Shi wrote:
> 
> On 2026/11/27 12:10, Weijie Yuan wrote:
> > On Fri, Nov 27, 2026 at 11:13:12AM +0800, Alex Shi wrote:
> > 
> > > > * Weijie Yuan 2026-10-21
> > > >     [PATCH v3 0/2] docs/zh_CN: cleanup headers
> > > >     [PATCH v3 1/2] docs/zh_CN: remove translator-related headers
> > > >     [PATCH v3 2/2] docs/zh_CN: remove Translator field in header template
> > > > 
> > > >     Partly reviewed by Dongliang with an extra question to Jon.
> > > >     source:<cover.1792569583.git.wy@wyuan.org>
> > > Can not find in linux-doc emailing list.
> > Ah, so sorry. My manual operation at that time must have gone wrong.
> > Now I have a script to do this, and should be much better.
> > 
> > They are here:
> > 
> > https://lore.kernel.org/linux-doc/cover.1792745468.git.wy@wyuan.org/
> 
> Ops, too much conflict on the 2nd patches.
> 
> Do you mind to rebase your patches?

Sure, will rebase and send out soon.

Thanks!
