Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.94
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794842786;
	b=3dQMAAXKWv6Ehj/Pr18jFEm6jL51yc1SfOggKEReomXgMAe7zmV8tJ3WPpCV0ysM5eIi
	 FXOFGKWuX6c1UUv5TWpU3bycas52hIN58uIY87hbwp8BG/WgkuMef8HMwkbiRVTE8uyKW
	 p05yInT0HteV3CJnOs0ZB6JcPkoq+wB7r6G/Qg4nnQvTe5n2KJfT8ZYqOK/JSqzs4LxiL
	 lpI3RTuibRSZZRyuBCV8qvwFPhzlCMIi4sJlxvJWILxe/0pb06LHzueX/a6NM/xYINXuL
	 COnZDKUOgjHYBI2cWMsM+nwWbt3FFxStGKNvU7VE0fJIi172NibHlw26amswc65l3rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842786;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=Ody2aDnsutJI/uSuUdbWsNNpgOPL+rzyrmQjkgk835U=;
	b=ji/hrdjA1gvBvo7JM6+CKBXgnlAojhkVm2TTrC5poK4nRQFp/J9T10lLdACfHFregTJS
	 PQhN32IS0wtQKBat9AJRmry1Kow+/YnDxJTCizjCj2vaoUePH/u6YDW4uHmp+qOh72S+f
	 w6WLV0FDp0qP4eTeIVUVlPrMoSuIMe8Vs9ZZX2OYnk+c0V4UmjCopUjJPF45FeZLAf4Do
	 iVqMC2DPSMtkviSP85KAA/6xH0xulXT8SI+U5diMuvjRyqn5MP29SnhblhRRqq9TrMouD
	 4ZV/49V+yNqVu3A3+vwNEbu9Pwc6h4WzdW2kiXtNeVymmVthCL9YXr6W54x5XWGtf/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b="WcO/0IyJ";
	arc=none smtp.remote-ip=95.215.58.94
Received: from mta1.migadu.com (out-94.mta1.migadu.com [95.215.58.94])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4415606A322
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 15:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4415606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=WcO/0IyJ
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=n9Ypacj/zxL+198XVoPdU8TvGm3GITLWdk/vyi2KTG4=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794842783; v=1; x=1795447583;
 b=WcO/0IyJoaztIExm4hJn+4fIXkeD3Bb/FyKL2j+IH1ePPgVvHexaCaT9Fzp2MO3gGDahxeDH
 V45QB6Bm1OyQBFbyXIAaHG/FmTN7PVAwCFqm4ktemgV0JxC7VaK5SYEft1oSmTu/Z/bITBy1fJo
 pFxSrCgtzxvx8A2eZzOtT0sEmHFbWVm2bMgCPvjoePzlC/5e2LsW/s2WhS18iBWywKvLgU+k8xy
 b+JvU3JkxSFn7Xzuavoc5biteEQ4qy51tSw46SQESlVanIE4ocneLAhvSSpaDVMzyN+ki9pkINl
 U1rfkgkU5XekQjhSfHWiH0UhzSGyXjapOe1HHst50YuTw==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ee1a683d8be8d14c;
	Mon, 16 Nov 2026 15:26:23 +0000
X-Mizu-Trace-ID: ee1a683d8be8d14c
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 23:26:20 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Weijie Yuan <kernel@wyuan.org>, linux-doc@vger.kernel.org,
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: Re: What's cooking in Chinese docs (Nov 2026, #04)
Message-ID: <avsgnLlkyQZ2U7d7@wyuan.org>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b930b5f3-8571-42a6-a8d4-433ace854f3f@hust.edu.cn>

On Mon, Nov 16, 2026 at 11:07:34PM +0800, Dongliang Mu wrote:
> 
> On 11/13/26 9:31 PM, Weijie Yuan wrote:
> > Here are the topics for Chinese docs waiting to be merged.
> > 
> > Copies of the source code to Chinese documentation development tree live
> > in here:
> > 
> >      git://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
> >      https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
> >      https://kernel.googlesource.com/pub/scm/linux/kernel/git/alexs/linux.git
> > 
> > Mirrors:
> > 
> >      https://mirrors.hust.edu.cn/git/kernel-doc-zh.git
> >      https://mirror.nju.edu.cn/git/kernel-doc-zh.git (experimental)
> > 
> > Please report any mirror instability to linux-doc@vger.kernel.org
> > 
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
> The above four patch/patchset are reviewed. New contributors still need to
> pay more attention to how-to.rst.

Oh btw, once this patch from Konstantin is merged, we'll only have the
linux-doc list, and no more LKML:

https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?h=mm-nonmm-hotfixes-unstable&id=24e311b72f31fddbbb1e2f6fc3232f3ac523d929

Therefore our free Sashiko review will stop soon because linux-doc is
not registered in Sashiko.

I noticed that support for triggering reviews based on specific file
paths, without enabling them for the entire linux-doc mailing list,
seems to have landed on Sashiko´s main branch, but isn't in the latest
release yet. If folks would appreciate an extra pair of eyes, I'll take
another look and kindly ask Roman to enable it for us. I'll do that
after this weekend's CLK conference. What do you think?

Thanks.
