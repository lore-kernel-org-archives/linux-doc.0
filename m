Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.114
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841977;
	b=qNCF8mjDnEpASzxOBZkgzxzZyNC3Hkqp4XOyhfEX6BT5GHGihAqhbfG7iqu9dfZkW7F6
	 dwAzjzKY3oL0W+8895xMK7hqoVwKcFzn6ARPJYmsXUjFha5K0aNVf3m6qPhRdXbQ6mlWM
	 wq492vxOgxXX2YsvQSmAWzLTjfPmA9imrc2Gs4YsSKrKTw85QDdcVKBQL7wqMZFppUDRX
	 GEiaG+U7faH8FpCpZgzL1x2V/bqib/rAOz2SQUHz3dWF2o0inxJwYF32pau3m9oZHJZCt
	 WzdbU2bBdwmpSZsGzas1rWKvEbvvSjGlLQmRxuIGEEPFF6ULlK2WikPb3FOpu3MTE8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841977;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+0UYWY5Ylh+KrWGsxxRAdRH7NkLfyVTq7h0fa0xqQKs=;
	b=lmvl5DEo3pJX5Zra6p+Q5IdV+QiaIulbusvlL4wLDe76MPcqCrLtDA6pNB9PVkqO6ozD
	 8dI56JKATfnqRV1mT6WFo8bKeK+IUjYtpPeXaJiypGS2EDrioZ8a2+p+MuM6QVG7aR+Ex
	 BG5dX7I/Zr9b+pJx7BBQQYAYnghgR3dgfubgrOyaliHd8ykJaki/yo7BpJaOb1i4aOmmE
	 FaKDaalH0wro1dd7ZPPtjEm8g8uomLNvM1vBCh42B0g3pt0iIYXAHnkV5Lzc46uJ7KQoA
	 zRD99RybuOzzueSdWYapKwmuGnvi7omhNBk6S/bRzID2i8nMcCh7r+WfOutj8GLGoLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b="RxStZ7X/";
	arc=none smtp.remote-ip=91.218.175.114
Received: from mta0.migadu.com (out-114.mta0.migadu.com [91.218.175.114])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1BD606A889
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 15:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D1BD606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=RxStZ7X/
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3ldeSoOlRHxHqdDLaarbCn9jFffKQuxeUAjhFmDUWBA=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794841972; v=1; x=1795446772;
 b=RxStZ7X/xJJo96g3jr1HB90OOsZ0BAuvmOlEfsWiLOOZlR6vrOzazH0nJvrEesSaEoHghoR0
 /ldsYMVOC/BkU2tz/ryuIq6zFiyA+A+IpGxdqBkCDC89jh1Wvw+j+0wDbsjmB+sL/XW9ieXGXtb
 7k2uIAQyKbSC+tZMKYQF8l4HLGhjmxLq3epsZPDE72xKnZURbPYDUQ7tRvHQbogtRvG2QIbmn80
 pa3tRAML77wrnuXIhwUQlUXAoL2kNYTUGAG3Z3/o/Yx54hi/cslGha/Uf/oGqv0/cV9ZVXUXywA
 ba9A1rvuH7xlHv1X8bwfhvuhqSvj4Y3cFBjJGzs2alpfg==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e85528d7703d5095;
	Mon, 16 Nov 2026 15:12:52 +0000
X-Mizu-Trace-ID: e85528d7703d5095
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 23:12:49 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Weijie Yuan <kernel@wyuan.org>, linux-doc@vger.kernel.org,
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: Re: What's cooking in Chinese docs (Nov 2026, #04)
Message-ID: <avsdccLDUrcGJc9f@wyuan.org>
References: <avcRFzlQQTOra-fr@wyuan.org>
 <b930b5f3-8571-42a6-a8d4-433ace854f3f@hust.edu.cn>
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
In-Reply-To: <b930b5f3-8571-42a6-a8d4-433ace854f3f@hust.edu.cn>

On Mon, Nov 16, 2026 at 11:07:34PM +0800, Dongliang Mu wrote:
> > -------------------------------------------------------------------
> > [Cooking]
> > 
> > * Yikun Wei 2026-11-13
> >    [PATCH] docs/zh_CN: Add deprecated translation
> > 
> >    Needs review.
> >    source: <20261113122844.24838-1-YikunWei@126.com>
> > 
> > 
> > * Yikun Wei 2026-11-13
> >    [PATCH] docs/zh_CN: Add contribution maturity model translation
> > 
> >    Needs review.
> >    source: <20261113112200.16790-1-YikunWei@126.com>
> > 
> > 
> > * Xiongwei Song 2026-11-13
> >    [PATCH 0/2] Add RCU docs Chinese translation
> >    [PATCH 1/2] docs/zh_CN: Add RCU/index.rst translation
> >    [PATCH 2/2] docs/zh_CN: Add RCU/whatisRCU.rst Chinese translation
> > 
> >    Needs review.
> >    source: <20261113013054.5662-1-xiongwei.song@linux.dev>
> > 
> > 
> > * Weijie Yuan 2026-11-09
> >    [PATCH v3 0/2] docs/zh_CN: update maintainer/configure-git.rst
> >    [PATCH v3 1/2] docs/zh_CN: sync maintainer/configure-git with upstream
> >    [PATCH v3 2/2] docs/zh_CN: improve maintainer/pull-requests translation
> > 
> >    Needs review.
> >    source: <20261109-configure-git-v3-0-d7807bb8e8c7@wyuan.org>
> 
> The above four patch/patchset are reviewed.

Thanks for the review. Already updated the status and pushed out.

https://github.com/kernel-zh/linux-zh_TW/blob/meta/whats-cooking.txt

> New contributors still need to pay more attention to how-to.rst.

I'll try to help newcomers get familiar with our process.

Thanks.
