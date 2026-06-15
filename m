Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA353DD522
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 13:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781530471; cv=pass; b=UliejaKw8FHlIbMfefSPWvIhmwe3WB4Py0McbPjwHtaMPAP7yOOs4+A3pi6prm+d1xR/nWSS4VEk7wtxkhxx1Fnig2LIE5m4F0wsbiYXenAP8otbnuV+d5DSMiUGmDwiIZ+sUjFa2ZDzhlAm4um6967N4xVHS6Zz6uTdd+Be980=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781530471; c=relaxed/simple;
	bh=qziQh2ZXZieZhIjUzGWkjOs0k4Gto1kzMH7i7LsfVwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nO+kSZ97gbP1uZRLMg8tSVDU3XzImE9AgnTXwFyCLjMsEQ3kzIX3gM7l8r4Jyg+Cz0MYMZBPJe6hOuaEB5drbZEdxBFsyexktnvO1ktmRj6rhU/D2rT8tGp2FP8wLokV1TW1c1/vE3m69JM+8+CXaLUBQrRLGkdFMkVI9ucfNIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NU4bw1kA; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NU4bw1kA"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aa5edf347eso2113239e87.3
        for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 06:34:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781530468; cv=none;
        d=google.com; s=arc-20240605;
        b=ED9Tb3p1Mp0erLgT9ceszrZeBe76RQ57mocPEibDne1cA2NGKF8B/p+w2gHaKL8upg
         +Vp9nFfrXAUDEKuzPPW6t4Fb/XR+2GNNaE9NgCoe5PSuQ2MwO0xTTFQsBESAz4w3Eoqr
         niAthy9qCMkhWneudDsFDlUdmCfdOX7qzxpM+s4sHqgpqYCBgamvXCwECH3c4HeeEq26
         C3ncDakDteQG8Cvo1NY0QPgXMiBDokHtVPxm8jsVWwDHbIYApondaxX0UtmNFuxo0xML
         v6I4xCEXaHJlB4yTEOgJnoN7bo8PPHHEYeoMyUQTHH+oueea1VFO3fNErETu+5/t321j
         mPmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7N6kl02u38i0xq7EiCPKmqnsKro3sQNXVVPffAOnS/4=;
        fh=cEtnhfdB1ujGZ1+n7OvHnrbfbsgnzF6vKma8LwztILg=;
        b=d5nOoVgQ49moUdSgbEWYaKRr5r7jtGh+mNNNy6jNB2m7pnFQxA6M1RhjKMc9V3wyxA
         kQqOX2vHil21NXHutubGggWI/m52DT/zL5q4P6L8iCyn903+lo54XSjsWYOW/rbNhObY
         Kz1V0cUZ54LxNHVC+yTg9swEoakAGhcepu6spfhhI7TeuUD1Pk6kzFHwSPE6NbNC/Is9
         qq2K9MSjgKKBU7i8RdOIBES/3ko2XPWwtBC67Yr0Ze1dI2x7GiEHXIU7BqAX44BXg1EN
         EQ8grBUBwKR3SQbtWeOGyLpSJzmDBg2y5yvCNuuyg6Cm9zRWenqJGnCT638d8q0i30y8
         f87w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781530468; x=1782135268; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7N6kl02u38i0xq7EiCPKmqnsKro3sQNXVVPffAOnS/4=;
        b=NU4bw1kAl+K4saUcenv6cthXngL9uf0+x2xRGvObO7iKHSFeQpWe+BzmPCmYPz0okf
         7NKaLLDBBWIgu6x7qP08ECLkFCH4orDjq7u6D0m7ip/OITV4bRpXMb/bYtwN/XOI+ZPG
         6z+IxgazruvrhVPDZU0Xx8pEMToHzabD7xS8C8cF9/Xigp8WHXtav3zC/+6a/BpanRVj
         hd950Kv6Y/vB77S+SARlsGo6C7xxMuPg+fDOLoh1n4o6hDeEcaDe9oBjYsDeLPHRDMwP
         cJZKmZB1RhnJFPB2FeEWRj75hG/gYj/DJozI53vEfesRza5YriNDIDQn88/DvSE9ekwE
         MGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781530468; x=1782135268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7N6kl02u38i0xq7EiCPKmqnsKro3sQNXVVPffAOnS/4=;
        b=M5/nFhnaogNQogtIbBjfvkRIYCiyU8ZcmEqArk+pkV+ispqnXTyrnEGnJarG73sd4r
         TfwqRsf4gwFKfWqCYCNyulwJDth/dvhqqWgCcB6H4lbAogremMOwiqZau7g43c28S1TA
         RiNpp/d01SPGZqQXwirLQO+r0OonxCTBBNoHfEjPiAuI2whe0aJmSvVfsnWA3pyC8mKW
         2CaB/VHmQ74atiUht1dXo8fLie2FBj5Ej0laXZ5Xsg/+gZOeCSpXDRMiyW0D102BQM5N
         HkDm0UUoYzGo2D4BYUBzSvEzGa1gV+qljLAcZU1TzeUN58L7ZkRsldOnf7Bqyf+/kMuj
         5XVA==
X-Forwarded-Encrypted: i=1; AFNElJ95pGLpFL5VWcbXlZ60XhaxbK9NffGryUc6GeCwMoR+YeVRVvJwV/wiUwOMViPFeDfoYUYfL8CPHfs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT+++NtDA1MI1jEY+mXeow5mBOLKQaoFSbwHOhQjERo3Hl+wIU
	mQ1+pwUosOMZXpBySlxbslb/K/Gzbp8iSYv+qFFPDG1Eq1P2x1fNrYlrsZKmOMAyJXzAQHQ6YZP
	JlKyORZWqF2IofhAqvDOS9mCuggNryXA=
X-Gm-Gg: Acq92OEiCVMsYt89xVck97w7eLSTM7n1pZeIqAGBsxmE8sOGwTuQUnfIfrQ73OVphHT
	t06O7qLRrnQsW5kfju8eT+JguYyoAk8rYveLdSasJKXFWCsPg3V2E4bCkbz6jhwzJcuhCuSIRer
	Ww1uX9u64XCavn8Cok0KH2nWtkVifX2emh9lzQHORd45RdeR6Wl42kropIV6RtBdMPtbxXAvvoF
	x+Q6Y0EhRtZyXJqgTnRpadwwjbBB8mDCx7vLd4KYTsZ60yYjk1NT38RKARk3fXXiLZmubAqwbT7
	SBHmGSAJZGXBOgYcqodtu00r+lyuaOEckdRJ
X-Received: by 2002:a05:6512:14b:b0:5aa:8822:f280 with SMTP id
 2adb3069b0e04-5ad2db7e686mr3080193e87.48.1781530468188; Mon, 15 Jun 2026
 06:34:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260614-zram-swap-ops-block-register-v1-0-6c1a6639c222@gmail.com>
 <CAGsJ_4yqy3ZnXirSZD0X_1b5qDnyoMLuuSS4mHRcip+CPpvQdg@mail.gmail.com>
In-Reply-To: <CAGsJ_4yqy3ZnXirSZD0X_1b5qDnyoMLuuSS4mHRcip+CPpvQdg@mail.gmail.com>
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Mon, 15 Jun 2026 21:34:16 +0800
X-Gm-Features: AVVi8CcjdILiZpap5bpfUy5jr4Y1IYVz4A1QoXBevZAhC7hGGptQwJo2-0WWHxI
Message-ID: <CAJxJ_ji9arB=2Ta89yV5dsRApgT3RC5P_=GbBDSYZuGdkPkeeA@mail.gmail.com>
Subject: Re: [PATCH 0/3] mm/zram: route block swap I/O through swap_ops
To: Barry Song <baohua@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <bhe@redhat.com>, Nhat Pham <nphamcs@gmail.com>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Youngjun Park <youngjun.park@lge.com>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jens Axboe <axboe@kernel.dk>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 5:14=E2=80=AFPM Barry Song <baohua@kernel.org> wrot=
e:
>
> On Sun, Jun 14, 2026 at 11:35=E2=80=AFPM Jianyue Wu <wujianyue000@gmail.c=
om> wrote:
> >
> > This series builds on Christoph Hellwig's swap batching rework that
> > moves block swap onto struct swap_iocb and per-backend struct
> > swap_ops handlers [1].  Christoph's patches unify batching for
> > ordinary block devices and swap files.  zram still needs a custom
> > path because swap slots map to compressed pages, not disk sectors.
> >
> > The first patch adds swap_register_block_ops() so a block driver can
> > install custom submit_read/submit_write handlers when swapon targets
> > its block device.  The default swap_bdev_ops path is unchanged for
> > devices that do not register.
> >
> > The second patch registers zram_swap_ops at module init.  On write,
> > the swap core still batches folios into a swap_iocb.  zram maps each
> > folio to a slot index and stores it through zram_write_page() instead
> > of building one bio per page.  Read handling keeps slot_lock and
> > mark_slot_accessed() in one critical section.  Writeback-enabled zram
> > falls back to swap_bdev_submit_read() for ZRAM_WB slots.
> >
> > The third patch moves slot_free_notify into swap_ops next to the
> > other zram swap callbacks, and documents the locking contract for
> > that hook.
> >
> > Applied on top of Christoph Hellwig's "better block swap batching and
> > a different take on swap_ops" series [1].
>
> Nice. I think it's better to mark it as RFC at this stage.
>
> By the way, besides the architectural refinements, have
> you also observed any noticeable performance improvements?
>
> >
> > [1] https://lore.kernel.org/linux-mm/?q=3Dbetter+block+swap+batching
>
> Best Regards
> Barry

Hello Barry,

Thanks for the feedback:) I will mark the next revision as RFC.

I ran some local measurements on a zram swap workload.
Without a backing device (zspool-only swap read path), the swap_ops
path looks slightly better on average and median latency, while p99 is
roughly flat:
avg 1,750 ns vs 1,812 ns
p50 1,273 ns vs 1,504 ns
p99 6,318 ns vs 6,198 ns

With writeback/backing device enabled, the numbers are much noisier
(bd_reads per sample and cold-fault ratio varied a lot between runs),
so I would not read too much into them. Directionally, the swap_ops
path looked faster on avg/p50/p99 in the runs I captured, but I need
more controlled repeats before claiming a real win:
avg 39 =C2=B5s vs 77 =C2=B5s
p50 4.5 =C2=B5s vs 90 =C2=B5s
p99 116 =C2=B5s vs 210 =C2=B5s

bd_reads/sample 0.37 vs 0.75
cold-fault samples 62.5% vs 100%

So far I would describe the gain as modest for the common zspool case,
maybe because doesn't have merge benefit like bio side.
With the main motivation still being architectural fit (put zram
swap semantics under swap_ops) rather than a large performance jump.

Thanks,
Jianyue
