Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E1A370D57
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 02:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783910669; cv=pass; b=WszYPFOe5aMcXO527mR9cmiDkgIXn5Ltx00bBOA0gPkWt68YwQ5hn+J1yuv+9l1kfKy45I+RJufR6C0SKWIgcEcKDWTup7f7AdEGsKTJZ02nRsL7uVjoO35eTOOxhClbTdPrf54gYn/rd+R8eAEMix9i9rZTWz7ICggD+9MjhGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783910669; c=relaxed/simple;
	bh=Ey1ajMl0bnOZQQEq/xNoF0WY07DvldUXG8XIFLrkJTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YFboaHDyiPU5HxiXKmr1j6gUK8iraecmUjbNanRq2t89HKdyFvCTb1djzHeg0s9GHXkkn5bu0Ct+vdG9p06+g5Ww25lDqIiDedDgCrLeruqdHp0Z75c+ITgzTsEXX1k43TO3sxvDXzfD+Z4pBYOXyso1fjn5PyyhbzKDUtG+pXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bH0UGuVu; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bH0UGuVu"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aebe49b227so585864e87.2
        for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 19:44:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783910666; cv=none;
        d=google.com; s=arc-20260327;
        b=qu/9b5dLcqAkSk61gtPhkSc4eIByCQy9NVZEFQnzULUbU2pVewSACSLM9AAt2dU6dk
         AZGRU4+UUF+GAeF4IloCiCRFEbo6jqrGN8drpgbDpozE6sojaKsfMTe5LEfz241twy3N
         FKboQuF6s3g0OeJxW2tb+kq9W6J59a/nLeMlaqlauDfMSfPBI2BVQf28RSziEC9vMsZV
         kkzgjMeeEHTj958DLybMIvcNoF8qtANDo5TkyJNi3UFP/k2B0ajwSxY8T/Hq3pKWg+ti
         QiOnEYW6vyIDsQ1YTk1Nq6HOjAywMjxXKsIWs/N/DE5ZMOMbcX82HtLgB9vAL5MMXAX+
         BZiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ey1ajMl0bnOZQQEq/xNoF0WY07DvldUXG8XIFLrkJTs=;
        fh=yOOe8s80jrycrU+Dho71+mVDsgRwMYrruxqLgo9hR3M=;
        b=D4A4xKSMTH0c76CZjH+/4V4cdPFEUO49v9vcl3LfeDa91zXuJoC+I3ZhL7m7iuqnvs
         BK+wgZqTbAul6pI71kEKhoeqdymdNIqf8PM4/tLiOEXNxjpCoUX2xz7RPR5B8XVQRVSZ
         JKegCjwORu9Ub5nfxWuTMvAsNxUNrXyIxAcZp4CWsIhg/W1pJkZO4obd5ZTQTGY3StmR
         RHk8VwqU44HJFSsqt3sKv94HNW+D09CL/4Xu7Ox7mGDO2lg1HAkwGSoMJzZXBPjuTEE/
         FoG+jkyWob4PKFpBLjWQ1LVZpjvuEIR8+jyB/nG27J7BT3Bz/0J895bAU2XKpVOR/DwP
         VW3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783910666; x=1784515466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ey1ajMl0bnOZQQEq/xNoF0WY07DvldUXG8XIFLrkJTs=;
        b=bH0UGuVuGlFdJS1ZspXQfNMikhLHLLnTiI+nMLMsiKDXmS/bbEcAPWNHCGRKl3OHY1
         My3irjyDQ8Jsi8aXM2Q/kTs1X8SGNJ61TeLHSed8dFg3VykYk0bzfI2Mfz7zbnliugrc
         WsTkj/bHQapJZo6V395Ks+k8vYqHw/rhuDa9mr4ih5yLj+Ka5U+virHpzxbUOWwrDRts
         ju7hto0lHYC7YVZaQl4W/0QmLIDzAV90E/I7B1pKEAk96K6+hdTdOFaxwmEEbyDnq/dZ
         ciyHOlJv9NDFnJ/MyU1a05xJ0rmmbEfwsHsT055lTQ5cNKdk2lq6b+fgGc3nhLt9r8cU
         8/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783910666; x=1784515466;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ey1ajMl0bnOZQQEq/xNoF0WY07DvldUXG8XIFLrkJTs=;
        b=ST3/+Wvzv9IHXN3jVVQcwRdtpY27Jf8WwiqNhrjo+yOc2fJ/hxKkDaSfTRUHjyrnMd
         IC2W/sXvzVs9xqiJubUCsA37DsWWuwdt82bwJlwXQXbAu7KWUq5pUiwsbmSuGj8vP692
         2u5lnlAWCdhjWn2dK2+JHfT4MtPdu5fzhLkzJdUvMdUFvV1PwqbOR1u1zTfv9IUaMyQG
         K7Q97Kteqsj+lDP78UpYYrjDSxjLg+fl2Tm5pfR6rvD6FJ7gVUZBol6SDn/udmZUz4ga
         qtd4CD+svv/q7V/IOrVuR/vl8gYjznrc2oj9fh/VSX18KGy9xuu+KYmFTs7drWpuUsNi
         ij6Q==
X-Forwarded-Encrypted: i=1; AHgh+RpzBemNcgiM3GxHnPA9qCPQ3kUIEd7Ko0u2uqtz/6s3ebv1TvOF0sEPeNoZOT/11WIG5IO0l2Jn3Kw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4b74u6t/Xo4XcFizCGg48oZzPhokUg361n5gISI0AfwUwav2x
	5WVOPSwqdOJKMHq5QirTGiihsQntkWi83LMj4echR4fsMewwD51zhAgjG2UDqGG7o+kUDR5+NR0
	Tz2u1nnSXb1U5Vxh46pUwORJ/cn5dctg=
X-Gm-Gg: AfdE7clypPURqy/anBO8bD4awyGs5kdjHQjI9Foy8dZjmPeXOtOeEi6Z+NvKZk8+SLu
	dIDlbl5gpnnzJNDmo7sKBBBVe0m8abFbRIBm6NvoA41QbRdNQr/qJ9sKwd93igO8VhIlz4EYds4
	lK+lX2CeTDx1PfI11//NZ8qxgvHxyeLHUO+QzZOg+EjaallWSgyB/pDkFFomTZ5+R183+ELWrN/
	gcSFIGcQT91TpHyK1s2Dr9pyk+PtEyMVRKraL+94jOvU/SirT/T86ElE71s70grQWvfshxPumPE
	zd0T6LplZLP9ptKHRPaE2DvL/XDg7dpYY24+nLlTuPtldx3+eTVLrbY=
X-Received: by 2002:a05:6512:8345:b0:5aa:61ed:482c with SMTP id
 2adb3069b0e04-5b023699004mr574978e87.6.1783910665328; Sun, 12 Jul 2026
 19:44:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603082531.263115-1-chenyou910331@gmail.com>
 <CAKspUh+2ndK1qMP58hPPmvwczruCikEuaO2tmyw=APCGrd9yaw@mail.gmail.com>
 <alDs8bnIK8bWApIr@wyuan.org> <57e42f43-44dd-4b22-8d81-c88e20016138@hust.edu.cn>
 <CAKspUhKh=cT_ks1hH9B4G8KppR=XT+THHsmNUFH_irX6xo1SZw@mail.gmail.com>
 <alJ7ocaqtpUkCGrd@wyuan.org> <40155119-b6c1-40cc-bbf2-5d1bbe5743e8@gmail.com> <alNBB1Ju2GGk6Uqu@wyuan.org>
In-Reply-To: <alNBB1Ju2GGk6Uqu@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Mon, 13 Jul 2026 10:44:12 +0800
X-Gm-Features: AVVi8CftW27fF3Zz01D_9Na7r2FFsUhdkRwAHgN4VVlpxeY49nQzRbyiMixO9us
Message-ID: <CAKspUhJE-6NN7XnfG0iJAxEiV9PJx6pDbUEU5jgO__+qvuU5ug@mail.gmail.com>
Subject: Re: [PATCH v2] docs: zh_TW: process: localize terminologies and
 improve fluency in 8.Conclusion
To: Weijie Yuan <wy@wyuan.org>
Cc: Alex Shi <seakeel@gmail.com>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Hu Haowen <2023002089@link.tyut.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Dongliang Mu <mudongliangabcd@gmail.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yuchen Tian <cat@malon.dev>, Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Weijie,

> I suspect that some contributors would run the get_maintainers.pl script
> or b4 prep --auto-to-cc, so they did not cc Alex, as they didn't know
> the current situation. Because I noticed that for both two versions,
> Chen-yu didn't cc Alex or Dongliang or Yanteng. Am I right, @Chen-yu? ;-)

Yes, exactly. For both v1 and v2 I ran get_maintainer.pl, which only
lists Hu Haowen and the mailing lists for zh_TW files, so Alex and the
zh_CN team were never on cc.

> Given that this document has not been maintained for ~2 years and these
> patches to the terminology actually don't have much significance, it
> might be more appropriate to directly declare the status of Traditional
> Chinese as "Orphan" provisionally for now, and remove it directly in the
> near future, until Hao Wen's return and opinion. Or maybe, waiting for a
> new good soul to take over, which is unpredictable.

Before it comes to that: I would like to step up and help carry zh_TW
forward. I am a native zh_TW speaker from Taiwan, and I understand
this means staying with it, not a one-off effort.

Dongliang, since you kindly offered to help review zh_TW patches:
would you be open to doing this together -- either as co-maintainers,
or with me listed as a reviewer (R:) first if that is a more
reasonable starting point for a newcomer?

> > To avoid scattering our efforts, I suggest we minimize fragmentation
> > as much as possible. When it comes to technical documentation
> > translation, not literary translation, a straightforward, unadorned,
> > and free from misunderstandings is the best translation and easy to
> > maintain. Let's keep thing simple, unless sth is really necessary.

Alex, I think this concern is fair, and I have no intention of
forking the translation effort. The scope I have in mind is
deliberately narrow: keep zh_TW aligned with zh_CN in structure and
coverage, and localize only where terminology genuinely differs
(e.g. =E8=BB=9F=E9=AB=94 vs =E8=BD=AF=E4=BB=B6, =E4=BB=8B=E9=9D=A2 vs =E6=
=8E=A5=E5=8F=A3) -- exactly the kind of differences
you mentioned. Plain, accurate technical translation, no literary
rewriting.

Weijie, as a first concrete step I will prepare a terminology series
(rather than one-word-at-a-time patches, as you suggested) covering
the existing process/ documents, and use it to build a small glossary
that future patches and reviews can follow.

Jon, if this direction sounds acceptable, I am happy to send a
MAINTAINERS patch once the details are settled in this thread.

Thanks,
Chen-Yu
