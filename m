Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794058074;
	b=ghNeR87aCJvMpMrg/oBk++r+TVPkoLRqqrO4YXRSLM4zRz+wFTKhwEfqB/W9MUjad3Hu
	 eN4m1i6YUoSzx77tGutazhLSIsWNbPKvwh/Ufly5bRNjtg1A9kLNzc7UzeLfC9KxJoexR
	 TQvbgzaTRou8uK5uVTZzvLtYzdmhPEecd8YNVLuDIHOiASkx4X2SpufHoDevJ2pWGa52g
	 hvALRQ6oVZHwjHYPa6flnm+AyTpe7M4FvBBOETfyIeAMOID/EI0N4JoUUDdRsYr1U966l
	 0femAw6xpnIKtABEU4WGnYAimLvXxAcWW8iKT2wVRNsIXsok8LWuZ5g8IzhSPdwDNIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794058074;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=LaUlgukjVNl8eVPRCPoshgKjLQ6GWv84cGtCfauQbSc=;
	b=JKb5KeHs69pmv8jCWmRbr6u2TsuGRMSqx7e5IQStVjwEoKQfRNIoAoLIMr5ViQAqPHyt
	 RvnYciAG+rZgBYXKXEGi4ppddF2Iosz9HqLvu+i7tTxufvKT6q4LRxoHV7x04Z+xQ3VU0
	 qSs7yifvdvncsYRJj2fV2Ls/+Pq6HVE1aXmaHY7klB1GRbuHrEZETqQRtMYHg7YTI77o1
	 2qcQJUN7o7TmycHc4SaXaEvX9Gtlzw03NI0AGyzvQLV/UrzMxHEPfm5Qzo/ObMeF5xGm2
	 X3u9Z+8aoqwAh5MKTUShXnAHZKY97Y53MSKkLmqpv0GVn9M+2Di2A+a9RROB/ReGeRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=xNttusxY;
	arc=none smtp.remote-ip=91.218.175.128
Received: from mta0.migadu.com (out-128.mta0.migadu.com [91.218.175.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C88D606A326
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 13:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C88D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=xNttusxY
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nQm/NG10zmkNt0SEe9r+/xSJWmu9ICJykBKjKyuKsuk=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794058071; v=1; x=1794662871;
 b=xNttusxYeb787gSoo9Jitq1W26K/Q0rp/BejjfXBfOOoBWcarLQYJ17NOKJW1IFJ+InxQsYF
 gr/HfuyQ/CTrOAVmEjQe2uDtOqYWh/mwoRNJpUrlmXYAL2NNz/AnIoAHp5Qv3g8gOpbSib/U7wR
 PzHJspAMp7ldVHJn89XmOnALFVudIEAaokqLGe6OBfraEkUTYcr5lfjrBO7VxiZgObHeCPDqhTW
 gUZWGJvK1SoBBFhtfC5yhS5U+4EzwhonNtTFM4anzkxPBFYonr4zNe441dYhux3oEwHi3zzknQ4
 rAosTTY3u9qN0/Cm+RvOEGXx0sEOOa0tGfnG6lLU9GKnQ==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id eed239cf6502daad;
	Sat, 07 Nov 2026 13:27:50 +0000
X-Mizu-Trace-ID: eed239cf6502daad
X-Migadu-Flow: FLOW_OUT
Date: Sat, 7 Nov 2026 21:27:43 +0800
From: Weijie Yuan <kernel@wyuan.org>
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: linux-doc@vger.kernel.org, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>
Subject: Re: What's cooking in Chinese docs (Nov 2026, #02)
Message-ID: <au8nT3DVrC4jJicS@wyuan.org>
References: <au8heODCJCmmCWKA@wyuan.org>
 <CAD-N9QU4tWCoXyt0onyRtSOM_kK-MHRmJyjjNDg7YRsq033yiQ@mail.gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD-N9QU4tWCoXyt0onyRtSOM_kK-MHRmJyjjNDg7YRsq033yiQ@mail.gmail.com>

On Sat, Nov 07, 2026 at 09:16:29PM +0800, Dongliang Mu wrote:
> On Sat, Nov 7, 2026 at 9:03 PM Weijie Yuan <kernel@wyuan.org> wrote:
> >
> > Here are the topics for Chinese docs waiting to be merged.
> 
> It seems this cooking has some delay for review collection.
> 
> >
> > Copies of the source code to Chinese documentation development tree live
> > in here:
> >
> >     git://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
> >     https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
> >     https://kernel.googlesource.com/pub/scm/linux/kernel/git/alexs/linux.git
> >
> > Mirrors:
> >
> >     https://mirrors.hust.edu.cn/git/kernel-doc-zh.git
> >     https://mirror.nju.edu.cn/git/kernel-doc-zh.git (experimental)
> >
> > Please report any mirror instability to linux-doc@vger.kernel.org
> >
> > -------------------------------------------------------------------
> > [Cooking]
> >
> > * Chen-Yu Yeh 2026-11-06
> >   [PATCH 00/13] docs/zh_TW: process: add translations of 13 documents
> >   [PATCH 01/13] docs/zh_TW: process: add researcher-guidelines.rst translation
> >   [PATCH 02/13] docs/zh_TW: process: add cve.rst translation
> >   [PATCH 03/13] docs/zh_TW: process: add applying-patches.rst translation
> >   [PATCH 04/13] docs/zh_TW: process: add maintainer-pgp-guide.rst translation
> >   [PATCH 05/13] docs/zh_TW: process: add changes.rst translation
> >   [PATCH 06/13] docs/zh_TW: process: add handling-regressions.rst translation
> >   [PATCH 07/13] docs/zh_TW: process: add deprecated.rst translation
> >   [PATCH 08/13] docs/zh_TW: process: add kernel-docs.rst translation
> >   [PATCH 09/13] docs/zh_TW: process: add maintainer-handbooks.rst translation
> >   [PATCH 10/13] docs/zh_TW: process: add contribution-maturity-model.rst translation
> >   [PATCH 11/13] docs/zh_TW: process: add conclave.rst translation
> >   [PATCH 12/13] docs/zh_TW: process: add threat-model.rst translation
> >   [PATCH 13/13] docs/zh_TW: process: add maintainers.rst translation
> >
> >   Needs review.
> >   cf. <3bbce43f-476c-4a21-8da3-2be98a696e9c@hust.edu.cn>
> >   source: <20261106113545.708896-1-chenyou910331@gmail.com>
> I have comments on this patchset half an hour before

Yes I saw that, so I added your comments in cf., but yes, "Needs review"
is not appropriate, sorry. It should be "Waiting for response &
Expecting a reroll" then.

[...]

> > * Weijie Yuan 2026-09-05
> >   [PATCH v2 0/2] docs/zh_CN: update maintainer/configure-git.rst
> >   [PATCH v2 1/2] docs/zh_CN: sync maintainer/configure-git with upstream
> >   [PATCH v2 2/2] docs/zh_CN: improve maintainer/pull-requests translation
> >
> >   Needs review.
> >   source: <20260905-configure-git-v2-0-ab194db8c6b9@wyuan.org>
> 
> This also has my review.

Sorry, this one should be Expecting a reroll. I messed them up. And I'll
reroll this serie soon this week.

> > * Weijie Yuan 2026-08-23
> >   [PATCH v2 0/5] Update maintainer-pgp-guide.rst Chinese translation
> >   [PATCH v2 1/5] docs/zh_CN: update maintainer-pgp-guide translation Weijie Yuan
> >   [PATCH v2 2/5] docs/zh_CN: clarify free Nitrokey requirements Weijie Yuan
> >   [PATCH v2 3/5] docs/zh_CN: update maintainer-pgp-guide kernel.org link Weijie Yuan
> >   [PATCH v2 4/5] docs/zh_CN: add kernel.org trust repository reference Weijie Yuan
> >   [PATCH v2 5/5] docs/zh_CN: remove empty proofreader field from maintainer PGP guide
> 
> This also has my review.

God, I completely forgot to update my own series, so this one should be:

Reviewed-by Dongliang.

All above are changed in my local copy, will send them out next time if
anything more updated.

> >   Needs review.
> >   source: <20260823-maintainer-pgp-guide-v2-0-bea33b2ece54@wyuan.org>
> >
> >
> > * Yan Zhu 2026-06-12
> >   [PATCH 00/10] <cover.1781105672.git.zhuyan2015@qq.com>
> >    # Msgid changed
> >   [PATCH 00/10] docs/zh_CN: add LSM admin-guide Chinese translation
> >                 https://lore.kernel.org/linux-doc/tencent_001080DF135CEE2CD1B260EFA08E3CC71A09@qq.com/
> 
> A little wired format.

Yes, I suggested resending them if he would like to reroll. Because I
found that qq email would change the message-ID sometimes, therefore
email thread broken.

Thanks for your attention!
