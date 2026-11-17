Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794888637;
	b=AVSAIYAHV4tnJLT5rVwQOnsEGMqJ9QjxN0FPyZ+SM+5vqC4tTA7lf437Akz6AhiDK7g5
	 jXpKL0M/220MHwY2Yfbirq3AZ02OcNPdbkJ2AIfGaprhL1FwwRBUgLGZciZQh7uxDbPTh
	 SXnT/UWSW1pfjrzy7yzhnubsLt1tOgd3Y2aMhyZXOSH0BRZwD0VDWHby9LgC7pc6Yo0ix
	 VkFWt3Yr+u5neW0Zeh0b4/z9YKWX08SUUMFHhr07JXJ3a3WSqY01iQPGLBscVvqnZSlds
	 Xv67k9oldcccDCRaChV6FGm1u0YzQ6+usPemZnGV9n+TOz+SDty/K/raj0W7lwpltMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794888637;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=ibQmu7prqH/c3bNgVVFgFUz4JcJ031GLjvXREo43OSs=;
	b=r7+dRJ/AqGkVfO8rxXxq18YBiCCs5srNY3t3qmJdjm4Eq5fKjVmkmP6S10h97wlUZhNp
	 8ZGeS6dTgdmGPCUzjYkJbg+oI0eLk7Aoc/LRTfOEBbfxcRxKB6EPEqHV59dksyWJ67ThV
	 2wKwKUJ6MG7TSETxVZhv5SPYp3cWPXH0TJyxccZZ7RPd74/BLZBWqX1Ayyf6Xqk1quLP9
	 u8NEKYCnb04FKsmP3WGU6MqpHSugXB9ACyzgoug3+gaX7PN1wGwv/bm4FX7Hz8R/GGMwt
	 wcyeHpD3bZnIrSWA8k0cRpTUlvxZ6ekBMl2A0ABOr0NdHt1bc34CVkMie5zLJIp+KNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=gnE0EC1Z;
	arc=none smtp.remote-ip=95.215.58.1
Received: from mta1.migadu.com (out-1.mta1.migadu.com [95.215.58.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052D9606A886
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 04:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 052D9606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=gnE0EC1Z
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zwzcM4eEKCdUMq16Xl3ov1WsQoaO2CCle4zev0kkTuc=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794888634; v=1; x=1795493434;
 b=gnE0EC1ZHS1kQ0ibY7byeWuVqBraLZf7yp8Cxm4yC1JCwsXS9nG0SWhwpuxMfY5PAZBCoVlf
 fvoAC8qXgchi7HDZo0wmK3ij8JISN8WDZYDu1sUscoQtDKRPQdPlzcnvSOPPHxCK/m0BsJWROuf
 0p9M5IIsAQ1sZhKWIsVva2MYxOy+jxk+6WNQOL96yb6BgVeXnd1M+5DLziZMaQWEnhgGwghEjWk
 rIqLIOnGMuwzKJHMgYo1VPqfX7k0AgqFQFEIjfIpMc3c9pBi7aNY9lKTquQXcABaEtU3hopTMx5
 WwOHpNVBjer1ykaIDXtDaRgE21kPO2aDE05WgDFAWgBig==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 782ab6c198d99c83;
	Tue, 17 Nov 2026 04:10:29 +0000
X-Mizu-Trace-ID: 782ab6c198d99c83
X-Migadu-Flow: FLOW_OUT
Date: Tue, 17 Nov 2026 12:10:21 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Weijie Yuan <kernel@wyuan.org>, linux-doc@vger.kernel.org,
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: Re: What's cooking in Chinese docs (Nov 2026, #04)
Message-ID: <avvTrX08RRhkpiEW@wyuan.org>
References: <avcRFzlQQTOra-fr@wyuan.org>
 <b930b5f3-8571-42a6-a8d4-433ace854f3f@hust.edu.cn>
 <avsgnLlkyQZ2U7d7@wyuan.org>
 <8663b8ae-9bc7-46ab-ad12-c9ed97a8096a@hust.edu.cn>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8663b8ae-9bc7-46ab-ad12-c9ed97a8096a@hust.edu.cn>

On Tue, Nov 17, 2026 at 12:03:34AM +0800, Dongliang Mu wrote:
> > > > -------------------------------------------------------------------
> > > > [Cooking]
> > > > 
> > > > * Yikun Wei 2026-11-13
> > > >     [PATCH] docs/zh_CN: Add deprecated translation
> > > > 
> > > >     Needs review.
> > > >     source: <20261113122844.24838-1-YikunWei@126.com>
> > > > 
> > > > 
> > > > * Yikun Wei 2026-11-13
> > > >     [PATCH] docs/zh_CN: Add contribution maturity model translation
> > > > 
> > > >     Needs review.
> > > >     source: <20261113112200.16790-1-YikunWei@126.com>
> > > > 
> > > > 
> > > > * Xiongwei Song 2026-11-13
> > > >     [PATCH 0/2] Add RCU docs Chinese translation
> > > >     [PATCH 1/2] docs/zh_CN: Add RCU/index.rst translation
> > > >     [PATCH 2/2] docs/zh_CN: Add RCU/whatisRCU.rst Chinese translation
> > > > 
> > > >     Needs review.
> > > >     source: <20261113013054.5662-1-xiongwei.song@linux.dev>
> > > > 
> > > > 
> > > > * Weijie Yuan 2026-11-09
> > > >     [PATCH v3 0/2] docs/zh_CN: update maintainer/configure-git.rst
> > > >     [PATCH v3 1/2] docs/zh_CN: sync maintainer/configure-git with upstream
> > > >     [PATCH v3 2/2] docs/zh_CN: improve maintainer/pull-requests translation
> > > > 
> > > >     Needs review.
> > > >     source: <20261109-configure-git-v3-0-d7807bb8e8c7@wyuan.org>
> > > The above four patch/patchset are reviewed. New contributors still need to
> > > pay more attention to how-to.rst.
> > Oh btw, once this patch from Konstantin is merged, we'll only have the
> > linux-doc list, and no more LKML:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?h=mm-nonmm-hotfixes-unstable&id=24e311b72f31fddbbb1e2f6fc3232f3ac523d929
> > 
> > Therefore our free Sashiko review will stop soon because linux-doc is
> > not registered in Sashiko.
> > 
> > I noticed that support for triggering reviews based on specific file
> > paths, without enabling them for the entire linux-doc mailing list,
> > seems to have landed on Sashiko´s main branch, but isn't in the latest
> > release yet. If folks would appreciate an extra pair of eyes, I'll take
> > another look and kindly ask Roman to enable it for us.
> 
> Just do it. No lost, but more issues with another round of review.

OK, copied. ;-)

> >   I'll do that after this weekend's CLK conference. What do you
> >   think?
> 
> If you are in Hangzhou at the weekend, maybe we can have a talk there.

Sure, my pleasure! I've signed up for this.

> I will go to Hangzhou this weekend since my student will have a talk in the
> ebpf subsystem of CLK conference.

Yeah, I noticed that talk, so I knew you were coming. ;-)

Thanks.
