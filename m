Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10DD41B8F2
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 13:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601268; cv=pass; b=XieGrMYgOz4GYmbYZ/ori8Aav5b4V9nTiFAbeay3KHoapASb3hjeNcmGyDPYUyhyVTC2Aw1PKqB50VbitnRaEn2ezYcVm8qSBIBQ6sMwgkL+oI5gJIU6Hfzwl3+aoFwNpo95rcIrUeDFwFZJlys2Yr1A+rsBRqxzEt0XmlJqbkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601268; c=relaxed/simple;
	bh=vfndy+IDUfkE9mXtuiZaF5XqfBavVAoEu/YwMmCRbbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bXyISm4m2QMXksz2gM6thMQoMG8GxHlYKhODKC3HVBWs5WfOMZW0ehptOlf3hIQuPHV4g4/ksNOYKSRaVFMSfLpQviJ6nmB7u3S3zBc7pV4r0Z2SWG68O+ILTYiULkhsUjQZGXkY8Z9mPFfFVt1r5LN+65JZ6wu5KBGukKXmZLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OpKaoU2Z; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OpKaoU2Z"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso2415029f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 06:14:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790601265; cv=none;
        d=google.com; s=arc-20260327;
        b=BY5C8yT11FUI9PHZalNWlXp3GiFbPaXhuXc1onUGN9l3hoTW9Vj4nY4RkinQUAsyuh
         YdGSTCeiWDG0LSD/hfJwDTKbz4wHd0CrDwEseiWrSy+ImgpLf2VQPzU+NwoTwy0xZWLF
         TG/cE1USj9i0rp6hvtIQrn0lRg4ZyDU3hDM4RqZYOeCNQW8iDg7Sw5a0G09k/gI0Lrjg
         uu37dIYDbnNyIzQqJmcG/WxaWdPSlnl5OSClSBq+A3W999iOZDTGSCBOtYPKySbYmggm
         Oy1qg1v28yzvDiIqtsRYbrmWa0+I2ya9okcVKJn0ETDXhEhc+Zznm2VwqVmQRTdUe7na
         15pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vND3fTgxqxSE2NFt08zJwdsstzk03d+XxBDIXeJX5tM=;
        fh=TEJ0FyWltlWAYXYq1XQDFfIKnCPbRMW/cwoPMSUiw0w=;
        b=e27yZaG2m0qovKCE0yHlrNlwjvfHMl8zIF6D9OvPtLkhv2CYHUJWNTUbCXWq6TjZTP
         dCVfRYSExrGgu+9pF7RL5sC1cV7YHDgcnkcioBD4STt5sPIj1wQ4RVpJQDVK0LCwWnko
         mv8Lo9qDAIz1JnacDeHaIk5WKED+xEtKBcILxKuqOFXvcOPXKJ/r5/kHSzmblpsaPMm7
         O3du3qg7I9scF94/mdqKUJyx5vLEOKPj8Rkrqy6TLPODlSyfe3e4lhuNdrVhLQoJ6R3w
         CO8KJYSvamLan9TQJoBgn9ioQcjxgJ5HWnTHme8bqSk6Ojrcphl+3YTNiULAaNuGYGV+
         Sa7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790601265; x=1791206065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vND3fTgxqxSE2NFt08zJwdsstzk03d+XxBDIXeJX5tM=;
        b=OpKaoU2Z6cmRpoczjGMgHx7ZZimb5w3OKZ4j/HHfZ6tbXX4WrmuZb8C4jKHj8sJloG
         2l+LtIhuKDCACd73WolFjdg8G7g/fAe5IAVUzrRgV5mhCZCuI3Ao2xHG0GQBNRtZkaev
         HzbFFRlKfA1edEwRf/2dqhIo9DOBANufJMAx1AkHHdAWhgpRQzteq8bhzJmSjL3qftBE
         qzfgA4z4S0GLWzE0M8UCxIdombbBOg5CizgqM8j90wpPVFXZCX4mUUc0zYTrundI7/Ms
         1VxEHJsXXLucWmX/c41VZBGB66AOMOqIou6zdAB/h8WhyoqHxLv5HgmOLhlVTmswFOsq
         hnug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601265; x=1791206065;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vND3fTgxqxSE2NFt08zJwdsstzk03d+XxBDIXeJX5tM=;
        b=bNmf6w47ImOz8/bmxLqmPUYj7Oz2von4j1UIrQulW6fG6JXdGb/ZIPWH5hz58yXgR2
         xi3T0Zb4Tm5lC+pFtbY0EUCTp8UcvLrnlN/YPyHtqSfItzB3g66rh2j1cRphCYhehIrC
         5mGNr+Hg2ZHQX66UTJB2EqONiGCI1YH1Ze7CTD92biuj2HMWZ7e7L/eJByztgH7Edzz/
         DeOr3upnrQb021toEzkb+UguU40U8FJIrNsqLiZCYtWmmARc1WHeB2NC8OljiGtvqixu
         gES+yKNLVFF7tyJ07n7xOiz0Xyp0qWlmePpKsXBWllVgzBodewPm9oZWTa7QSubwd+SO
         45Yw==
X-Forwarded-Encrypted: i=1; AKwUvByO3pQWSf3xdQ2PYZajA0XG+ev6Oplqs6zI0esyOw/20SyUGY+NoNs64PlDZzF/sSoj90Epp6VYV8A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYD4P0wAcUoHdxvZOVyP52kEjZd864hp6iTNR50XGJ5YQAUJcw
	kFY/tveHV5VK2gn+iMHSI4Ji91RzUSh0SBWYCz3FJp2sKAh75sv+pIYz5hHUxmMyKKCbSuYLzRP
	lAE+rSr6UkQCGgbggJqvmZNrFzhGgmBA=
X-Gm-Gg: AYBFou2rkma5ilhjeUx2dnY3b+rtexgJhptQGX+Ncdu07lRGjJSmJwKU/PSF1d/agXl
	sQ+sdqzAPffdysFxukjkLN1i0c01hj2myFuwMO52yXaj220JKzW8vVNWTPIGpyXtHzzgKM2s8pN
	+tlnCjnNYvUsAkahtJbywfhs/sQHX1VrG1fcpyCnL6/9TYyBNDlxesII/jE8RUymdljpxlmmc/m
	23y1KItihIrZsYoA0ZVA3+FtirH8p1jfChxy9B92Ltrg5ESh1K+1OEPi7VV/yd3wGD637DL1Nyv
	jdKSqcgy4p8BiqxaA5lpCSC5rj5NL4VfLnKuqCIYh3QH34WXHWLZaSOqc9tyaUY7WPNizJvSC2O
	32UHAlnlMUL+AtxlIcndhXzXrcXrm
X-Received: by 2002:a05:6000:4545:b0:488:7f5f:7caf with SMTP id
 ffacd0b85a97d-4887f5f7e22mr10175659f8f.23.1790601264546; Mon, 28 Sep 2026
 06:14:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918180241.3424851-1-nphamcs@gmail.com> <20260918180241.3424851-2-nphamcs@gmail.com>
 <CACePvbVaDNspMDSw_qAcapKAzXj3JGV-KMYmow7aePa0POHpSg@mail.gmail.com>
 <CAKEwX=OP3Gb9sVOvch+p4j7quzgy-rUY=UTZau5ztMj7heJJoA@mail.gmail.com>
 <CACePvbVQsHXt4=+qfKz-KTar9CG+3OiAfLd1EZgnRE-1gyoKOQ@mail.gmail.com>
 <CAKEwX=M8pJUYhmADfvdk+09O53EROyDRC+_b05vtimQE5VN=qQ@mail.gmail.com> <CACePvbWTZgbL7U-hrgV=V0egHZ13EqMCOsUbnKTcLvqnv85zUA@mail.gmail.com>
In-Reply-To: <CACePvbWTZgbL7U-hrgV=V0egHZ13EqMCOsUbnKTcLvqnv85zUA@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 28 Sep 2026 14:14:09 +0100
X-Gm-Features: AclHuK-P2g4Mc8ezdcRMnTDUO5s7E9DvQD4Qr_QNwMbU-IG7-Wm7IdyixU-UHR4
Message-ID: <CAKEwX=M1tc5fLSgxbq9S9TU1AKJWtRZA0AwGQZgNXJ_76hThFg@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] mm, swap: add virtual swap device infrastructure
To: Chris Li <chrisl@kernel.org>
Cc: akpm@linux-foundation.org, kasong@tencent.com, hannes@cmpxchg.org, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev, 
	yosry@kernel.org, david@kernel.org, muchun.song@linux.dev, 
	shikemeng@huaweicloud.com, baoquan.he@linux.dev, baohua@kernel.org, 
	youngjun.park@lge.com, chengming.zhou@linux.dev, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	qi.zheng@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, riel@surriel.com, gourry@gourry.net, 
	haowenchao22@gmail.com, corbet@lwn.net, hughd@google.com, 
	baolin.wang@linux.alibaba.com, tj@kernel.org, mkoutny@suse.com, 
	skhan@linuxfoundation.org, kunwu.chan@linux.dev, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 8:02=E2=80=AFPM Chris Li <chrisl@kernel.org> wrote:
>
> On Fri, Sep 25, 2026 at 8:04=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wro=
te:
> >
> > On Thu, Sep 24, 2026 at 5:44=E2=80=AFPM Chris Li <chrisl@kernel.org> wr=
ote:
> > >
> > > On Thu, Sep 24, 2026 at 6:20=E2=80=AFAM Nhat Pham <nphamcs@gmail.com>=
 wrote:
> > > >
> > > > On Wed, Sep 23, 2026 at 2:18=E2=80=AFAM Chris Li <chrisl@kernel.org=
> wrote:
> > > > >
> > > > >
> > > > > There are too many swap_is_vswap() in this series. It fragments t=
he
> > > > > code path, making things harder to reason about. Esepcially aroun=
d
> > > > > locks. I count 22 in this patch alone.
> > > > >
> > > > > I consider this the biggest drawback of this series. This
> > > > > fragmentation of the code path.
> > > >
> > > > This will mirror my response at [1], but I'm responding here for th=
e
> > > > record and for your convenience.
> > >
> > > Thank you. Really appriciate that.
> > >
> > > > It is needed because vswap *is* a special device, with its own
> > > > requirements. If you don't special case-it, you'd get undesirable
> > > > behaviors.
> > >
> > > Ack, that is why I am against making it a special device. That is the
> > > whole idea behind xswap. It is just normal swap device implemented vi=
a
> > > swap_ops just like ext4 is a file system implemnet on top of VFS.
> > >
> > > > Let's take Baoquan's patch series as an example.  It treats the xsw=
ap
> > > > device as just another swap device, without any special considerati=
on
> > > > for it. Which creates several problem:
> > >
> > > That is a careful design choice. Keep in mind that design choice
> > > usually has pros and cons.
> > >
> > > I will follow your feedback here.
> > >
> > > > 1. At allocation time, cgroups that disable zswap might get an xswa=
p
> > > > slot, because you don't do any check that the device you allocating
> > > > the swap slots for is xswap. At swap_writeout() time, it is *stuck*=
 -
> > > > we already do the unmapping step, so we cannot reclaim the page.
> > > >
> > > > Ironically a physical swapfile backend could have bailed us out her=
e,
> > > > but it's not in that patch series yet :)
> > >
> > > I am not sure I follow. Are you referring to the uncompressible pages
> > > that xswap would have to reject?
> > >
> > > One way to address that is for xswap to just bite the bullet and stor=
e
> > > the uncompressible pages within xswap. That way it will stay out of
> > > the reclaim LRU. Zswap also stores some uncompressible pages. The las=
t
> > > time I checked, it was unfortunately not able to serve my case but
> > > perfect for yours.
> >
> > Not even that. Say you have two kind of workloads in the same host:
> > workload enables disk swap but disable zswap (zswap.max =3D 0), and
> > workload that wants zswap. Let's even ignore writeback for now.
> >
> > You add 2 "swap devices" to the system: xswap and NVME swapfile.
> >
> > At swap allocation time, xswap patch series does not check carefully
> > which swap device is being used, so you might get an xswap slot for
> > the cgroup that disables zswap. You're stuck at swap_writeout() time.
> > You can't undo it anymore, and you don't even support the physical
> > swapfile backend to fallback.
>
> The xswap is to be used with the swap.tiers. So at the swap.tiers it
> selects xswap or SSD swap. Will that solve your problem?

I mean, we're having that problem right now, no? :)


>
> >
> >
> > >
> > > > Vswap both has swapfile backend, AND allows you to bypass it if the
> > > > cgroup disables zswap. Both involves a bit of swap_is_vswap() check=
,
> > > > but I think it's worth it :)
> > >
> > > If xswap needs the lower tier it can allocate for one. I don't think
> > > xswap should need to have swap_is_xswap() there. Also xswap does not
> > > have all the baggage of zswap.writeback enable interface.
> >
> > But that's my point. As of now, it does not. Unless you merge the
> > other RFC series, which brings it to roughly the same size as what I'm
> > doing here.
>
> It is cleaner because it avoids the dual personality issue. It also
> paves the way to enable writingback from one swap tier to another.
> That is heading to the right directions.  The vswap writeback only
> serves zswap, not others.

Writing back from one swap tier to another doesn't exist right now. I
have not even seen a coherent design to support writeback among swap
tiers. You're just delivering pie-in-the-sky.

The RFC you mentioned is not writeback between tiers. If you think it
does, then maybe you should read it again, It's from a very specific
swap device (xswap, with zswap backend), to a swapfile. Here is what
it does: add an array to store indirection (physical swap entry) to
clusters, and update that array when we need to do backend transfer.

Does that ring a bell? That's because it's the exact same mechanism as
vswap (without proper attribution - not even Suggested-by). If
anything, it's actually a bit less coherent, because you can set xswap
to be lower priority than physical swapfile.

Vswap does not have that, because vswap is not an ordinary swap
device. It's implementing the concept of virtualization (the "V" in
VFS, if you want to make that analogy), made optional to reduce
overhead when indirection is not needed. That gives you all the
machinery you need for backend transfer: a centralized virtualized
layer, where you can update the backend, without having to go and
chase down all the external references - no PTE walk needed.

>
> The biggest hurdle is the user API. One of Johannes's biggest
> objections is that it lacks writeback support and perhaps more. Now
> the writeback RFC is available. Let's re-evaluate what is possible.
> The swap.tier series has been out for a year now.

See above. But transferring between tier is still not a solved problem.

>
> If it is the same but does not have the 33 swap_is_vswap() fragmented
> dual personality issue, I see that is a reason to choose that path
> instead. What do you say?

The problem is the interface and the charging question. We have put
out our objections to it, and so far we have not been satisfied with
the defence.

>
> >
> > > >
> > > > Maybe instead of just grepping for swap_is_vswap() and throw your h=
and
> > > > at the complexity, read the code and try to understand why it's
> > > > necessary first, then propose simplifications if you have good idea=
s
> > > > in minds.
> > >
> > > Yes, I already read your code I decide that most of the
> > > swap_is_vswap() should not be needed if taking a proper swap_ops
> > > approach. I wanted to offer you the chance to work closely with me to
> > > achieve that, but you did not follow that suggestion.
> > >
> > > Quote from my old email:
> > > https://lore.kernel.org/all/CACePvbX+3tO91BmRwaLqf3Xia32GCemt3W8tayEr=
G81BYLgrzA@mail.gmail.com/
> > >
> > > "I am happy to spend some time working with you to discuss the generi=
c
> > > adopted version of vswap, if you are open to it. Or if you don't want
> > > to waste time on it. I can have someone else or myself come up with
> > > the generic adopted version of vswap for you to review, which I prefe=
r
> > > less."
> > >
> > > Anyway, Baoquan's xswap writeback patch series is out. I suggest
> > > following and improving that series instead.
> > >
> > > > > This is questionable. A vswap device does not go through swap on.
> > > > >
> > > > > This changes the behavior where swap devices always go through sw=
ap on/off.
> > > > >
> > > > > I wish the swap device went through swap on to be able to start s=
wapping.
> > > > >
> > >
> > > >
> > > > What usecase would necessitate the need for swapon/swapoff interfac=
e?
> > > > Other than just trying to shoehorn it to an existing interface?
> > >
> > > I like universal interfaces. Your vswap will break the /etc/fstab. Th=
e
> > > current suggestion for xswap using sysfs will break that as well.
> > > I would like to keep the /etc/fstab interface working, including
> > > support for UUIDs for swap devices, etc.
> >
> > "Universal interfaces" is not a use case. None of the thing you list
> > out here is a use case. It's an interface, but you have not
> > constructed a single use case to justify all of that.
>
> We don't have to go throgh the universal interface to resolve the 33
> swap_is_vswap(). It seems there is an alternative now. We can take the
> xswap route to eventually solve all your problems.
> >
> > > I am very concerned that vswap will start kicking in without me
> > > explicitly enabling it. That changes the previous user-visible
> > > behavior. It breaks my mental model. Please take this feedback
> > > seriously.
> >
> > I mean, there's a knob for it. How can it start kicking in without
> > your enablement?
>
> Please correct me if I am wrong; here is my understanding from you:
>
> vswap is off by default because of that knob. You turn it on and it
> starts zswap.
> Two questions here:
> 1) Is your knob compatible with the existing /etc/fstab where people
> use it to enable swap devices, including with UUIDs, etc.?

If they don't turn it on, their code works as is. Their existing
/etc/fstab exhibits no behavioral change.

What you're asking is us *enrolling* in that same interface. And my
question is what does that interface give us? I already pointed out
multiple ways where that interface's generality shoots the user in the
foot.

> 2) When you enable the knob, do some unit test and disable the knob
> again. Does the vswap go through the same path as swap off so no usage
> of vswap exists on the system?

It's a boottime parameter.

Why would you care about swapoff? What use case does it serve?

>
> That is the existing use case I have in mind.

You're describing an interface, again. It's still not a use case.

I can promise that it won't break /etc/fstab if vswap is off. - if it
does then it's a bug and I can fix it.

>
> Code maintainability is also a consideration when choosing which
> technical solutions to move forward with, when there are alternatives
> to provide solutions to the same problem.

I already pointed out how xswap's design *creates* problem, including
userspace problem. You just handwaved it away with "let the users
shoot themselves in the foot". I disagree with that philosophy.
