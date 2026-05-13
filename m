Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD14C1C5F13
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 20:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778705599; cv=pass; b=Fx7zzSzRhBCbZgpILujlZ33o2lnkdQ2/sDInRFCmmgzYuStF1snJGcETp1eY4yfLZ1FHQwRQM1QRJvEQ0GJmhntmFrcyBN7NZrpmlZ12Wn4xpZW3CYlnMd6wso+tnnDZ89DWBAIOQmQuS5kCFKVMwfyggp6d6oM6sSxL6fJUSkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778705599; c=relaxed/simple;
	bh=X/DDsGtZ0cVyzetyiZE3huiuNEguykSuxbVV06c2O7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fp/a9Jk3z9QwBGZEwZljJE5eM3K7MLDWQZ13mTXckiiThC3aIsUjTEM7xrBBZ+3im94XV5JHP7HRU+bz3u8QZKUNyhH8HG3TWMM+ClaD8OOlgwUbjTRoiVk9pfaQzlGDpU0lnhS/386GK9LKFKCfDoKAAm3UBmgYEkNg4RSn860=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U7zBPfOl; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U7zBPfOl"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so6263105f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 13:53:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778705596; cv=none;
        d=google.com; s=arc-20240605;
        b=cQrzXs03ARllmCF1HPjvmtFEzhmyB+YRDbqfQ6QFJfYTje+DVh31h7p08lkMtIZeJu
         teed254zz1tRFgMADqpqFc8bGLvXDe/c0FWXsje6Vk8wlONwHiImqxawIOIvXCCUJONh
         5TlKbWGvHYX4s2OfyELwtHTahpk8aj3m2EpY6mPjm4Lz0rvdIBz03J2HhNaYGD2jwrU+
         Wfs5ve9XOG8XNttorIfdDcXXVNP7abUEu3BHQegxOhCxZFZh0yAl809O5O2JgIz3b9Os
         TgGEMgl9YPkuUoi8jNX7WCSIclwaEomuNJkBgCAvA5QlzUcFSGZ83SMaVak9XcrrPpGB
         rMhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X/DDsGtZ0cVyzetyiZE3huiuNEguykSuxbVV06c2O7A=;
        fh=n0USw6ECaOL1RfdUGquQn2Eb4BCPMxM0DhAR2chPJXk=;
        b=DKa/m/XPWEeO5ujhvKRO9e29i13iw6nnAx3qrczoUK/yzsxG+i2nG9CmyLBRa6dz3u
         95oApWRWevyiD65o3afW++doo6mgSPzxWhO+cbCeU41PKoF9l+kDmVYrIhk2NawqgeAe
         nzRt8QqU5sUlC5sGKQd9rh9MmyWHhGr19scHsSRHDI+KsWOMh1AxxahDrkcCZ2xR8wrF
         5z6oF8cDz5AOY2ctEO86wsM32cP0z7LmO3GbY5i2iMabvNcQBvDXIBnJZalISQAoEEE3
         GPOBZFtxii0iLwAeZssSDljMEWTD5TuxriL3BphKrROKr6cMoyzsPNweqZ4lb/ZL2Hf3
         ijeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778705596; x=1779310396; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/DDsGtZ0cVyzetyiZE3huiuNEguykSuxbVV06c2O7A=;
        b=U7zBPfOlzIlVig4kMwRnutsvLYrDV5ksZN2I1v4EmUHsHO/beXMRB2SrBdx2lV+pAW
         QXnIuXQ40RguAWxsmqEqiGHbAMCDdPPY3WnboscD7crzIeL7KgWgVu3/0qBLpdRGjO3y
         6zrl5vvhL20Emg3u3sxXPxCyEdm2fcjmPGpV8L5faOCBI+G253PRKYDs5oiZDKpHUKFL
         KQPKZM+sy5h5Df96HmUVo9usFLDc609+8dbPXIUSvq1eYDMqvCOBgm+3YgkwOHV63rE5
         e/kdUHwtO5oBNc5/N6TOHLa3SksnOWB0L4rwM2tUZo2/4hZS/5IWy+Lr8xQFI6XoZNcN
         FRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778705596; x=1779310396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X/DDsGtZ0cVyzetyiZE3huiuNEguykSuxbVV06c2O7A=;
        b=URTzRwDiHjO+m7ZvPFkZM3NYCL452d3GNAMk6U9CA7AUu+HP850FSzPTzTxxDYLsnW
         3SrC6iQJw43q1K5K8CW2WLgD6jy/Yjfinoyi5WGo7K7u00I3LobdMJBC8eUZH4qk4OXP
         KqQu3YFVljzWh9FKAFGkaNhel6O2S+IJnwcdawy7K8QrQDe/NhyJX/O/WKYQI9UrzOk5
         I5VW8jKa2zs6uiRaQmT0xYm1IpodDhRj1rNyiIorwMvSQXd2p8bOrC4NsS7htKQvuKja
         7fkL7fFxwZsUV9wvYQukZ7OODG1jb33PD95ROVk3rIyzfojmazSVh9758Hu8nxqHgDTY
         c2IQ==
X-Forwarded-Encrypted: i=1; AFNElJ9e3Je6KJ+F5w/2vZLu5n1bYT8ue/uMxiw2aoCM762gNquDJKTc3c7sZJoZByowml7jNglj2q62qY8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx55rxlyIvB31xdui9U8P2/rPqQTyJvpOb8ESdhNaXQtinftEbh
	qXYxt76smuvUtQG7bBRkFrM0daedIZe6pN1QoLa2aLJLNShNYW7h/xTqWYvpJU+boWMFfUeoB/O
	uJlzBCs+g41wL+DxHm9MbsGVSgHQ9MG0=
X-Gm-Gg: Acq92OHyFCbpFlQbhyXPP1V7gaAsMLti2fFjN/BDTfbkOpwJ6l2WDr7jioc5Fbs7cUi
	aOT1/CuTGprS1RdrLVm/gpFzHtBPT+qBCa/VDsrnA0pxGVIJ3daVKgx09PsDya4kaLld2ERur9h
	XXW5DaJVzSpalrHDNz52IRCQJ2Qhls0qETquQrGy40j54UOlVMVgUgt5QXT6marb0Du44trAFNt
	e1O67olI7vstQ+bH6/PR9Yatqp/QlBhINYuODfKBpOZLrzt1QCTuVnVUk96Bb4eLG19b1qq63gg
	DmbxlwG7zKGWo3ir/f02PANqSVC6i6dNIbfhvkI=
X-Received: by 2002:a05:6000:26c3:b0:43d:773d:78ff with SMTP id
 ffacd0b85a97d-45c59bd694dmr7681297f8f.27.1778705595867; Wed, 13 May 2026
 13:53:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511105149.75584-1-jiahao.kernel@gmail.com>
 <20260511105149.75584-3-jiahao.kernel@gmail.com> <CAKEwX=PLFRkfUvZyaYfwBv0QJ-8KAktvZvGA02Hod04H-RsS-Q@mail.gmail.com>
 <CAO9r8zNOPdpJuTmccvQ6ZAVS+tXxp-_ofA765DbnfaUZOPPO-g@mail.gmail.com>
 <12e4784e-2add-d849-7e54-bde8abfa6e78@gmail.com> <CAKEwX=MOixJAUGiwUcMQa0Stvg-mR-MvpDRD8WA4YMtRvnUYTg@mail.gmail.com>
 <6fc7fdf0-368c-5129-038e-623f9db2aa88@gmail.com> <CAO9r8zPvgB-MG2ufmdn4HoS+QEPBAehU9u7fQmYs+47NF-C9aw@mail.gmail.com>
In-Reply-To: <CAO9r8zPvgB-MG2ufmdn4HoS+QEPBAehU9u7fQmYs+47NF-C9aw@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 13 May 2026 13:53:04 -0700
X-Gm-Features: AVHnY4LrLAgY72ojshBcIFy9xP1PEcHOYQ9m7UQfpzDmpcDw6jERR_OF5Wq4Pko
Message-ID: <CAKEwX=OY_nws-vf3VgnD54G205TK2YjkoAwRCyB9jvW=Oz3PpQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] mm/zswap: Implement proactive writeback
To: Yosry Ahmed <yosry@kernel.org>
Cc: Hao Jia <jiahao.kernel@gmail.com>, akpm@linux-foundation.org, tj@kernel.org, 
	hannes@cmpxchg.org, shakeel.butt@linux.dev, mhocko@kernel.org, 
	mkoutny@suse.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>, Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 11:55=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wro=
te:
>
> > > Zswap objects are organized into LRU and exposed to the shrinker
> > > interface. Echo-ing to memory.reclaim should also offload some zswap
> > > entries, correct? Are there still cold zswap entries that escape this=
,
> > > somehow?
> > >
> >
> > Yes, the memory.reclaim path does drive some zswap writeback, but
> > it is not enough for our case.
> >
> > 1. For a memcg that has reached steady state (a common case being
> > when memory.current is below the policy target), the userspace
> > reclaimer may not invoke memory.reclaim on it for a long time,
> > and so no second-level offloading happens through
> > memory.reclaim. In this state we want
> > memory.zswap.proactive_writeback to write back entries that
> > have sat in zswap past an age threshold, to further reclaim
> > the DRAM still held by the compressed data.
> >
> > 2. Even when memory.reclaim is running, the fraction of zswap
> > residency that ends up reaching the backing swap device is
> > still very small for many of our workloads, and the userspace
> > reclaimer has no way to participate in or control the
> > granularity of zswap writeback. So in our deployment we prefer
> > to leave the zswap shrinker disabled, decouple LRU -> zswap
> > from zswap -> swap, and use a dedicated proactive-writeback
> > interface that lifts the writeback policy into userspace where
> > it can evolve independently of the kernel.
>
> To be honest I see the point of proactively reclaiming compressed
> memory in zswap. If you use memory.reclaim, you are also reclaiming
> hotter memory in the process, and you are not necessarily getting as
> much writeback as you want. The memory in zswap is a more conservative
> choice for proactive reclaim because it's memory that's guaranteed to
> be cold(ish) and not being accessed.
>
> That being said, the interface is not great any way you cut it :/
>
> I don't like the 'memory.zswap.proactive_writeback' name, maybe we can
> stay consistent by doing 'memory.zswap.reclaim', but that just as
> easily reads as "reclaim using zswap". Maybe
> 'memory.zswap.do_writeback' or something, idk.
>
> I also don't like having two proactive reclaim interfaces, so a voice
> in my head wants to tie this into 'memory.reclaim' somehow, but that
> includes adding a pretty specific argument (e.g. 'memory.reclaim
> zswap_writeback_only=3D1'.
>
> I don't like any of these options, and we also need to consider what
> the memcg maintainers think. I see the use case of proactive writeback
> but I am struggling to come up with a clean interface.
>
> I also think we should take the 'age' aspect out of the conversation
> for now, it can be a separate discussion. Well, unless we decide to
> tie it to memory.reclaim. If memory.reclaim broadly supports age-based
> reclaim then zswap writeback can be a natural part of that without
> requiring a specific interface.

Yeah perhaps extending memory.reclaim is best... Sort of analogous to
the way we have swappiness to balance file v.s anon....
