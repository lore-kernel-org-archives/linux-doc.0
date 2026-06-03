Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA72537F738
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 18:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780510484; cv=pass; b=a6JxchlV7rjhZx/NOgzoklWrzv6ffc2s23qW2BO5LWWKsl5uP3YzmJLr4BVNbora92dNl4otX5Qjc/VSH/1h75S6me6MLg2mtbQvXB21dPCws7jq3ymRjVLD/YFiE3zWIlQnXBwVWKA4GOKQ1vGDZmLqgWj/K85Xw+V0lSes5Lo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780510484; c=relaxed/simple;
	bh=rLBQNq80cbBlFmup3PMClX+lcEA1lBPhCm7/9YNkcH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dh0WFDSkbcMBCO3Pm/kbuvBPIp+XSx9g0XRhWzczccx4yZUH+9GQTEa0Wtf0uyYtk7YlPr780NHMXxOnS/QGqtRBM93Bgm9WzHPLI3uTBUkc/inM3AQUZRZ+EIgSRdVh0Wi3B6ev0iehpsobvUjUYQ9rHGTT5kvlGenix8CV7jI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gPVDFSoI; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPVDFSoI"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45eedcdaeaaso4787304f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 11:14:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780510481; cv=none;
        d=google.com; s=arc-20240605;
        b=IwiFiBHTDG3YulITtcQOjnHkE1pCuESTyt/FPiJxRv0h8eMKUDq3aj2jj6T807Usf7
         rtvYN3EzTc6QnMHkX79+AOFrJncvvWmkbH8z+jPpfI4RdaZZwJ4dpJYG2kRohN5mjebl
         0gLL1RYfYw8hZK+ra9MwKUZR4C0ZEdrP8sBiFsIJfaF6bQoRnKzALRCOqXI13OrwOS8F
         gZCTQe4mfjePku4cBsQNvvv6yNjaS+tMFV+P3eimB0eZc+dc2gpZaziZClyh4v3NRRio
         89je78tjQNcq8PfpbTRa3cSfFLofTbAC0gmYM4nZ2BKF03dZi9vWWLVvhgqDskqr/fmD
         8aew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CWVsqrCr+/hgZzs1LZgrRbIPF4JwXDGlPOi2Fa4T98E=;
        fh=ntE3wfg1Q/ICdDwLP1C9XoDjnwTzVdadH5Ap3GM2wkE=;
        b=S0QhYtJqn5M+tWBvl0KVsyg+votVG7r4Znp7KJFbQX95X/w/XkueswogmrMwiN83Hl
         R2JPJxGA3bfwKFwATzcM9wnII3kRyNiTCivKMiyLYZyBnWffpmCLa4BdnYhWOr5qfYvs
         ypSDnqHwV8BRrTgiDizCIULtyZNtBb5AMZ9T1C4WnWkBCYtp7m1O+oOm1n5joyFGggNX
         OogxUhDm/IfjQzw2PAzZCeKKkwhOgXSNwBrCmfpLGQlNW4s1k7PdDYtey12uDMTsCtOG
         b22YshiZ2Bd+KeRMNXz6ki4sDcs706Xbfc31EfIRkWnIWsxsp7wEfr2Ez1joe8dPpoPH
         wRYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780510481; x=1781115281; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWVsqrCr+/hgZzs1LZgrRbIPF4JwXDGlPOi2Fa4T98E=;
        b=gPVDFSoIzNsbOUpsWtHPE23zrRNnz+IpeVbWK3igfTKFYQgONdxnkLoTWcSR9wCeH7
         fbJQWMQrEsjUcACsoyUSAJGGM2vF7D0Ik4wwGvbNFcrpu6fcV5r/c7g8HDTvtQcnxYr7
         PQ++c8OWLIH+/RXipJGcqEsPPmAaBwlL39jxBRVLvU5j9BFy3ziqogWRSRBfFxqoThXE
         XtwN8ijBEiZhnqV2MUxJzolDJNVh8U47CYaZOEXv4pGPP5uQWCorZoh/pxhZOx7zy4Zu
         5e7EOGvW8N48be7DH6npbDx97zfq+kwovKAg+CI3LaLNVcJWLbIvIFuwx6iOxQuaGUyX
         NnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780510481; x=1781115281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CWVsqrCr+/hgZzs1LZgrRbIPF4JwXDGlPOi2Fa4T98E=;
        b=DiDXB7A43Y7JT5sidHXiQg4+UfjAA5FlK2TGXbPCzR3QpO8AF6fuU4FePpJUEP31TM
         8osktNp7LDrdozywqqjlde98/X72s5Td5GsWyCHHPcXNRyRxobfDVL1qLxVXCXD1VIR+
         kXAt6DY9qM1ybn40PAr7UeNim6UYgl3DvMHAcw6DNThz+MFMg/rtT86j3Iy7E5uXr6O8
         DSI/sculLDLlbp3tTnfVMXnq/4N+4/OUaV7Z5DciXRSnN4PDs5pMohAq/xwvqvCppK29
         Cn6WhisiPUdqtVmKHLSZh3OpWY5WWMOkEPsmqunjl8o7T84pjWdneVJjUSy66R5Rzve5
         BYWQ==
X-Forwarded-Encrypted: i=1; AFNElJ92VYLZWZFcujy7DKbU2cCaqOybLM1aaqCDHDrg7Uugk9t+eBx6HfFgAHgNJIJ+CcwdkkGtxG6KYLM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy++lzpSlhiz2dgXFgtXFAsdXkT5bZI0dcWJykjIc1c2VwPrcH
	2QCrPg/XUPTu/ebXey8K/z5//G2UrmFg1b4XEClXxbuGDzkk6le+n/qkW2Uv+DQaQ41Ni6+U5ve
	nrG6ySNovo2XG9327NpPu5uPNrqyrFyc=
X-Gm-Gg: Acq92OHeti8S9Suoyi6TNB79JU3GwBhmH1SyaqJzQ+K6LmMHSFQiZTmxGkalPu7COHN
	lrqRbpNOvZOOujaomJTEz0fHKOEiHvJ8ovedkECBStf7UmGIDsEdlsEvQE4Xm9MOJNGKtdY8yNT
	kvtMhEcduZ2REQ+1q8L2moQ6BZtOKnGoM9uZGCMcFt2b4wsxsTQ3Koi29y9Z9cMRf5pUQFf+vTA
	NCVN7x6HJdUsDijL/DmU4bR3WBLxGMvW/KqbiHh9i74zuGaMndJqnkLNLjavLYvfFEIVz93jwyP
	OJMSmsGpmw9m9rqx2CC5ynSxm6WBNCwRTCQwVz52Aa0H5r/2KQ==
X-Received: by 2002:a5d:4989:0:b0:45d:41e0:467b with SMTP id
 ffacd0b85a97d-4602178af87mr5170086f8f.3.1780510481099; Wed, 03 Jun 2026
 11:14:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526114601.67041-1-jiahao.kernel@gmail.com>
 <20260526114601.67041-3-jiahao.kernel@gmail.com> <CAKEwX=MQe_KFZe2vBXQYh0aa-x+E8AzNwmyjJGJk4tDoS9ML3A@mail.gmail.com>
 <aho_VtLCmIRsNyvO@google.com> <6deeaea7-3cd1-4403-29fc-d2dc55c297f8@gmail.com>
 <aiBqzOtEv5iAC_qC@google.com>
In-Reply-To: <aiBqzOtEv5iAC_qC@google.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 3 Jun 2026 11:14:29 -0700
X-Gm-Features: AVHnY4KZKWD3d0SaeD3tNM3fVPW6StZjCUd8WFWR-F3KM2I_lnoM-TIgG8bLJbk
Message-ID: <CAKEwX=OhxUxRCEfvZMnWzXy=Fa4jgzL3DuP-RmaVzdK65m4bew@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] mm/zswap: Implement proactive writeback
To: Yosry Ahmed <yosry@kernel.org>
Cc: Hao Jia <jiahao.kernel@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	akpm@linux-foundation.org, tj@kernel.org, shakeel.butt@linux.dev, 
	mhocko@kernel.org, mkoutny@suse.com, chengming.zhou@linux.dev, 
	muchun.song@linux.dev, roman.gushchin@linux.dev, cgroups@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 10:58=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Wed, Jun 03, 2026 at 07:22:36PM +0800, Hao Jia wrote:
> >
> >
> > On 2026/5/30 09:40, Yosry Ahmed wrote:
> > > On Fri, May 29, 2026 at 12:58:09PM -0700, Nhat Pham wrote:
> > > > On Tue, May 26, 2026 at 4:46=E2=80=AFAM Hao Jia <jiahao.kernel@gmai=
l.com> wrote:
> > > > >
> > > > > From: Hao Jia <jiahao1@lixiang.com>
> > > > >
> > > > > Zswap currently writes back pages to backing swap reactively, tri=
ggered
> > > > > either by the shrinker or when the pool reaches its size limit. T=
here is
> > > > > no mechanism to control the amount of writeback for a specific me=
mory
> > > > > cgroup. However, users may want to proactively write back zswap p=
ages,
> > > > > e.g., to free up memory for other applications or to prepare for
> > > > > memory-intensive workloads.
> > > > >
> > > > > Introduce a "zswap_writeback_only" key to the memory.reclaim cgro=
up
> > > > > interface. When specified, this key bypasses standard memory recl=
aim
> > > > > and exclusively performs proactive zswap writeback up to the requ=
ested
> > > > > budget. If omitted, the default reclaim behavior remains unchange=
d.
> > > > >
> > > > > Example usage:
> > > > >    # Write back 100MB of pages from zswap to the backing swap
> > > > >    echo "100M zswap_writeback_only" > memory.reclaim
> > > >
> > > > Hmmm, so this 100MB is the pre-compression size? i.e if this 100 MB
> > > > compresses to 25 MB, then you're only freeing 25 MB?
> > > >
> > > > I'm ok-ish with this, but can you document it?
> > >
> > > That's a good point. I think pre-compressed size doesn't make sense t=
o
> > > be honest. We should care about how much memory we are actually tryin=
g
> > > to save by doing writeback here.
> > >
> > > The pre-compressed size is only useful in determining the blast radiu=
s,
> > > how many actual pages are going to have slower page faults now. But
> > > then, I don't think there's a reasonable way for userspace to decide
> > > that.
> > >
> > > I understand passing in the compressed size is tricky because we need=
 to
> > > keep track of the size of the compressed pages we end up writing back=
,
> > > but it should be doable.
> >
> > Agreed. Using pre-compressed size is probably easier to implement. IIRC=
,
> > interfaces like ZRAM writeback_limit are also calculated using the
> > pre-compressed size.
> >
> > I'll clarify this in the documentation in the next version.
> >
> > >
> > > If we really want pre-compressed size here, then yes we need to make =
it
> > > very clear, and I vote that we use a separate interface in this case
> > > because memory.reclaim having different meanings for the amount of
> > > memory written to it is extremely counter-intuitive.
> > >
> > Agree. This would indeed break the semantics of memory.reclaim. I will =
use a
> > separate interface for proactive writeback in the next version.
>
> But doesn't it make more sense to specify the compressed size, which is
> ultimately the amount of memory you actually want to reclaim.
>

I personally prefer compressed size to pre-compressed size. That's
kinda what user cares about, no?

One thing we can do is let users prescribe a compressed size, but
internally, we can multiply that by the average compression ratio.
That gives us a guesstimate of how many pages we need to reclaim, and
you can follow the rest of your implementation as is (perhaps with
short-circuit when we reach the goal with fewer pages reclaimed).
