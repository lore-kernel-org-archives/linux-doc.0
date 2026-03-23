Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C643D565E
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 20:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774296354; cv=pass; b=saH2jX6NUXU+VLp0l38dzGFhmo6wo+iXRbukIeGXJ2zIie9Xpb+Qel9VfOxqv4VFpWtgPjCMXb3HCrwQrxiRIhY30J7xroBnIeh+5dGdp8vnyvE6sn3hfFJHPOz7eOlyei2q0gT+TxsvS9ifG4nDN6bwjLJ78Gf2MJXSBPGDwlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774296354; c=relaxed/simple;
	bh=lj7GLdMcZyTj/61mPTlFdJbldgo57lmKQIvZ82vb5kI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=csuJKLt1NroFoIsMRMAe+Q3JnanUi/rtKwZE4JW4Fc1jpozvPf51gC/u2wRDfdIni2Pb2nX1NCC8c5wSDpfTT/RYECh6w7X0GpspfyVkuUVxI4cc8dqC3d2xfWL2VWtXKeFsHCofzeApDRsba+JFfKhaCGREgUOzR5iro4VPc0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qfXaY4/h; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qfXaY4/h"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439b6d9c981so3165617f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 13:05:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774296346; cv=none;
        d=google.com; s=arc-20240605;
        b=ebUhM4uJA1aa0PQN9qTVSZxq9pPLCtMC8jU4RP9wYP9DEAIVrbeI2zZb/oXbH653Ni
         WCW8XLC/ar5+9ZyLGBfi11ENQYC9Zb7Yrs1TeAM1OPbUPQVgdC/SgzValmYsca0soJ9O
         DoyjIyjzS3Pb24xfs47Y8VTi8q5W55zAHY2gXbu+MxPTPxL8vR4nn0JV7w1npRzWyssG
         iYd04ER+9RzXi115+YcFPiwxbZBqvh4kiBM4DcGdWtoLux36tPeylkhqe/Mzl2CAtXz3
         cMvHT+ETPyyMVRJm+x5WFXy08A57TYBe7/k7LttGg4RySyFqYawsC6UMySCjiUc+Xuhw
         0q9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cSm3pi/p5+viVRprqSKsRJS/Gwafhj+x/zgoAdc82J8=;
        fh=ATuYilsVfxWX3hKKFxmywr/fU+aKIn3TzuqKQr/kJ0Y=;
        b=jtyEv6781a34pYFerY+Yvjc/knzYu/kq0vZp/ZrSqJ+knyGY8ZD2XpgNTiANiKELZc
         0uokLTXxvLAORzR8lXoxt2bd+Qlok+laFFQm2yRCs0hhq5f3bAeqAK0fLsouVsv+Dvc0
         aV2a9gTtfcUjOEiAf0XUBuU5HHAS1XK1oh11/TuR/RcDesEBJbfMA+iOgL47fkaHQL9Q
         rqiXWBsC/e15TxJes2t/1OCjlAqWhdZ+34ZN8k1oY1qvsHYuSZru4YX6hPysTjQJr/Az
         aUGp6aOnxT8hyHEoF5xYV32tN/lQHElrCVJsVMAO56LmVabLsy1uI+SwxkIbQzzw3RQH
         yuyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774296346; x=1774901146; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cSm3pi/p5+viVRprqSKsRJS/Gwafhj+x/zgoAdc82J8=;
        b=qfXaY4/hPV+rKKLOiLR5PSYnV97PeOq/gw9jZnUr4fH/vfN5dNoozb5swfJ2WousBV
         r5LG2cz0FDp4IRmIQPlOQ2gkZ00R/XKeJNJgo9jAVDUcTklOTkdHFJ7d5/bwAFmsDO6B
         YJANisH006yoEl5ZqpEEcLzeH2b1lA2ssVp1H+ZsemevoP7gpBvHSTJy+Eemk8xKzVmR
         LDZN0sqSzhyOjwWDDnheTKdANVziFfKLkPuLOs1/tECkJiwSJNEbt1zlrm+Les4OPEaY
         w4yQwrKG2Qmc4hfdiooKVBnu2Xvg39SowjhHmGI7UxuvveVfa9L33JTouT3MqGejIhY9
         d0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774296346; x=1774901146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cSm3pi/p5+viVRprqSKsRJS/Gwafhj+x/zgoAdc82J8=;
        b=dCqwMaYNP01tmdSekGIWDKjTByqhtrt24qGgxzTFoYv0RHISOJ30DkW4Au3dzL3AHx
         dvxRh1/MsluP6e9DyOxqJPenonmZck5IvCL2UJsIzjPHaZiYCAW0QXcgPGp7Ur8Sa8u5
         OmUqrI/HtEDuiqfZM0qdN4PAcXGIW8gd5S9RU/CaGs1s8k+Exsjxqkmu3jJI526foYuF
         NzQ6nrviBrt0DCN/YpbkoNCmAJnyE/Pjjcgr65enjZuwlVmwZi8A/ub/bJsUT1ltmjK6
         m23T/wLQQKlwbvFKIFMJhh5gubcQ5xJ7G1eAQ+fU1Jl7fEMff9q4XI0p0im7lcH2PQy8
         NElw==
X-Forwarded-Encrypted: i=1; AJvYcCVmycdlBhxdkOvQ5FKa3pqbWcLoSSzP2lEPI97/DNz3AypquZaEH9Ba82PUSjMDIA1q94oDova7wYM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIBdPrWLVGs8h4keDLO03O4QG5wsPfj+gYjj8QDKd6DUjrQH2c
	ZzP7YBA7xqI4oxayL4c0tUHcK6j9lFkFtpiDdbftlvZkuIPPUl0Nl5sBvdygY0P1IR5Fa367CdI
	54kqrnZDZbzLfFrjl+0qXH3qxm+JtlCg=
X-Gm-Gg: ATEYQzzUbe9OTPDp5eYMVFhPr8dgCqzLpfN1ES6t7gie/0wDJ5HI5n2n/ym/KQKIDch
	rFJw5o1sEzlNs9b/7IV8CvjLJebMyHeUNu+7TB4JS+z1KBkbh82u1SvSfax2BmbP+dSM9VzThKA
	AVuxX170CCdwT9px+276UHaPchLxXw8v9ISZoKbHo+1MCxcoaXZKN5p8RDVvH9DT1NTuzTbs/vs
	lxrot9vFr2wtdEWlqTPE5datr2Nj36RS3/DSCBm15qHUwmqRghTqh6O54qYq97vRYZyirUQHCwf
	gTZRD/MTp5tg6tEmMmAyzpxuH6m1iqx6zwLWgb+p4dWA2EXbteXi5nE=
X-Received: by 2002:a05:6000:290a:b0:439:bee4:8a93 with SMTP id
 ffacd0b85a97d-43b80543fbfmr1328875f8f.12.1774296346222; Mon, 23 Mar 2026
 13:05:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320192735.748051-1-nphamcs@gmail.com> <CAMgjq7AiUr_Ntj51qoqvV+=XbEATjr7S4MH+rgD32T5pHfF7mg@mail.gmail.com>
 <CAKEwX=PBjMVfMvKkNfqbgiw7o10NFyZBSB62ODzsqogv-WDYKQ@mail.gmail.com> <CAMgjq7AzySv801qDxfc8mEkEsFDv4P=_qw0rNOTe0n+qy7Fz6A@mail.gmail.com>
In-Reply-To: <CAMgjq7AzySv801qDxfc8mEkEsFDv4P=_qw0rNOTe0n+qy7Fz6A@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 23 Mar 2026 16:05:34 -0400
X-Gm-Features: AQROBzAzMaxnOtFYtdtVGHbHrUkaMTL891lXMF0vK2wektlQwRdZr3vTHyQqlKE
Message-ID: <CAKEwX=P4syV38jAVCWq198r2OHXXc=xA-fx1dk6+qYef6yzxWQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/21] Virtual Swap Space
To: Kairui Song <ryncsn@gmail.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, apopple@nvidia.com, 
	axelrasmussen@google.com, baohua@kernel.org, baolin.wang@linux.alibaba.com, 
	bhe@redhat.com, byungchul@sk.com, cgroups@vger.kernel.org, 
	chengming.zhou@linux.dev, chrisl@kernel.org, corbet@lwn.net, david@kernel.org, 
	dev.jain@arm.com, gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com, 
	jannh@google.com, joshua.hahnjy@gmail.com, lance.yang@linux.dev, 
	lenb@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-pm@vger.kernel.org, lorenzo.stoakes@oracle.com, 
	matthew.brost@intel.com, mhocko@suse.com, muchun.song@linux.dev, 
	npache@redhat.com, pavel@kernel.org, peterx@redhat.com, peterz@infradead.org, 
	pfalcato@suse.de, rafael@kernel.org, rakie.kim@sk.com, 
	roman.gushchin@linux.dev, rppt@kernel.org, ryan.roberts@arm.com, 
	shakeel.butt@linux.dev, shikemeng@huaweicloud.com, surenb@google.com, 
	tglx@kernel.org, vbabka@suse.cz, weixugc@google.com, 
	ying.huang@linux.alibaba.com, yosry.ahmed@linux.dev, yuanchu@google.com, 
	zhengqi.arch@bytedance.com, ziy@nvidia.com, kernel-team@meta.com, 
	riel@surriel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 12:41=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wro=
te:
>
> On Mon, Mar 23, 2026 at 11:33=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wr=
ote:
> >
> > On Mon, Mar 23, 2026 at 6:09=E2=80=AFAM Kairui Song <ryncsn@gmail.com> =
wrote:
> > >
> > > On Sat, Mar 21, 2026 at 3:29=E2=80=AFAM Nhat Pham <nphamcs@gmail.com>=
 wrote:
> > > > This patch series is based on 6.19. There are a couple more
> > > > swap-related changes in mainline that I would need to coordinate
> > > > with, but I still want to send this out as an update for the
> > > > regressions reported by Kairui Song in [15]. It's probably easier
> > > > to just build this thing rather than dig through that series of
> > > > emails to get the fix patch :)
> > > >
> > > > Changelog:
> > > > * v4 -> v5:
> > > >     * Fix a deadlock in memcg1_swapout (reported by syzbot [16]).
> > > >     * Replace VM_WARN_ON(!spin_is_locked()) with lockdep_assert_hel=
d(),
> > > >       and use guard(rcu) in vswap_cpu_dead
> > > >       (reported by Peter Zijlstra [17]).
> > > > * v3 -> v4:
> > > >     * Fix poor swap free batching behavior to alleviate a regressio=
n
> > > >       (reported by Kairui Song).
> > >
> >
> > Hi Kairui! Thanks a lot for the testing big boss :) I will focus on
> > the regression in this patch series - we can talk more about
> > directions in another thread :)
>
> Hi Nhat,
>
> > Interesting. Normally "lots of zero-filled page" is a very beneficial
> > case for vswap. You don't need a swapfile, or any zram/zswap metadata
> > overhead - it's a native swap backend. If production workload has this
> > many zero-filled pages, I think the numbers of vswap would be much
> > less alarming - perhaps even matching memory overhead because you
> > don't need to maintain a zram entry metadata (it's at least 2 words
> > per zram entry right?), while there's no reverse map overhead induced
> > (so it's 24 bytes on both side), and no need to do zram-side locking
> > :)
> >
> > So I was surprised to see that it's not working out very well here. I
> > checked the implementation of memhog - let me know if this is wrong
> > place to look:
> >
> > https://man7.org/linux/man-pages/man8/memhog.8.html
> > https://github.com/numactl/numactl/blob/master/memhog.c#L52
> >
> > I think this is what happened here: memhog was populating the memory
> > 0xff, which triggers the full overhead of a swapfile-backed swap entry
> > because even though it's "same-filled" it's not zero-filled! I was
> > following Usama's observation - "less than 1% of the same-filled pages
> > were non-zero" - and so I only handled the zero-filled case here:
> >
> > https://lore.kernel.org/all/20240530102126.357438-1-usamaarif642@gmail.=
com/
> >
> > This sounds a bit artificial IMHO - as Usama pointed out above, I
> > think most samefilled pages are zero pages, in real production
> > workloads. However, if you think there are real use cases with a lot
>
> I vaguely remember some workloads like Java or some JS engine
> initialize their heap with fixed value, same fill might not be that
> common but not a rare thing, it strongly depends on the workload.

To a non-zero value? ISTR it was initialized to zero, but if I was
wrong then yeah it should just be a small simple patch.

>
> > of non-zero samefilled pages, please let me know I can fix this real
> > quick. We can support this in vswap with zero extra metadata overhead
> > - change the VSWAP_ZERO swap entry type to VSWAP_SAME_FILLED, then use
> > the backend field to store that value. I can send you a patch if
> > you're interested.
>
> Actually I don't think that's the main problem. For example, I just
> wrote a few lines C bench program to zerofill ~50G of memory
> and swapout sequentially:
>
> Before:
> Swapout: 4415467us
> Swapin: 49573297us
>
> After:
> Swapout: 4955874us
> Swapin: 56223658us
>
> And vmstat:
> cat /proc/vmstat | grep zero
> thp_zero_page_alloc 0
> thp_zero_page_alloc_failed 0
> swpin_zero 12239329
> swpout_zero 21516634
>
> There are all zero filled pages, but still slower. And what's more, a
> more critical issue, I just found the cgroup and global swap usage
> accounting are both somehow broken for zero page swap,
> maybe because you skipped some allocation? Users can
> no longer see how many pages are swapped out. I don't think you can
> break that, that's one major reason why we use a zero entry instead of
> mapping to a zero readonly page. If that is acceptable, we can have
> a very nice optimization right away with current swap.

No, that was intentional :) I probably should have documented this
better - but we're only charging towards swap usage (cgroup and system
wide) on memory. There was a whole patch that did that in the series
:)

I can add new counters to differentiate these cases, but it makes no
sense to me to charge towards swap usage for non-swapfile backend
(namely, zswap and zero swap pages). You are not actually occupying
the limited swapfile slots, but instead occupy a dynamic, vast virtual
swap space only (and memory in the case of zswap - this is actually an
argument against zram which does not do any cgroup accounting, but
that's another story for another day). I don't see a point in swap
charging here. It's the whole point of decoupling the backends - these
are not the same resource domains.

And if you follow Usama's work above, we actually were trying to
figure out a way to map it to a zero readonly page. That was Usama's
v2 of the patch series IIRC - but there was a bug. I think it was a
potential race between the reclaimer's rmap walk to unmap the page
from PTEs pointing to the page, and concurrent modifiers to the page?
We couldn't fix the race in a way that does not induce more overhead
than it's worth. But had that work we would also not do any swap
charging :)

BTW, if you can figure that part out, please let us know. We actually
quite like that idea - we just never managed to make it work (and we
have a bunch more urgent tasks).

>
> That's still just an example. bypassing the accounting and still
> slower is not a good sign. We should focus on the generic
> performance and design.

I will dig into the remaining regression :) Thanks for the report.

>
> Yet this is just another new found issue, there are many other parts
> like the folio swap allocation may still occur even if a lower device
> can no longer accept more whole folios, which I'm currently
> unsure how it will affect swap.



>
> > 1. Regarding pmem backend - I'm not sure if I can get my hands on one
> > of these, but if you think SSD has the same characteristics maybe I
> > can give that a try? The problem with SSD is for some reason variance
> > tends to be pretty high, between iterations yes, but especially across
> > reboots. Or maybe zram?
>
> Yeah, ZRAM has a very similar number for some cases, but storage is
> getting faster and faster and swap occurs through high speed networks
> too. We definitely shouldn't ignore that.

I can also simulate it using tmpfs as a swap backend (although it
might not work for certain benchmarks, like your usemem benchmark in
which we allocate more memory than the host physical memory).

>
> > 2. What about the other numbers below? Are they also on pmem? FTR I
> > was running most of my benchmarks on zswap, except for one kernel
> > build benchmark on SSD.
> >
> > 3. Any other backends and setup you're interested in?
> >
> > BTW, sounds like you have a great benchmark suite - is it open source
> > somewhere? If not, can you share it with us :) Vswap aside, I think
> > this would be a good suite to run all swap related changes for every
> > swap contributor.
>
> I can try to post that somewhere, really nothing fancy just some
> wrapper to make use of systemd for reboot and auto test. But all test
> steps I mentioned before are already posted and publically available.

Okay, thanks, Kairui!
