Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0383C4164
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 15:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600885; cv=pass; b=Gk4LS9HrJax+KcQojwV6f1ET32Hgo/X5JSN6Yv+bMdeqeNDGl42BpwDa4PoGR0wqZM1ilI8BltUaMosyTDs+9G1rG+vTy1FrKLLbmkgs7udNdHEzP6PszOpMK/1tMnc6dcH2kWJrNLWdL/FfGJPAxTDy8Ol8UbrNaQZm4h5kZ7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600885; c=relaxed/simple;
	bh=B6amhBSyF7iVuaDtigX7s8Kmefjc7nih3jCvVr8zMNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eHZeKWHlq2k+LHNCP1onbYx0QaWeDRYNlBQ0hZxIYRN7KJnUthom5/STYks/kJeAOdxmwCP4aZyqC9ShZuOvy33e8e5WZp4/+XlJKUKxBNMevBzAvVI5s2yoB7nHNINxkVIRqg+jVSlUWzdWbPMWLXkVm9VKkwEv6zQ2wkSUkDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eriWQtJY; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eriWQtJY"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so51762295e9.0
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 08:48:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778600880; cv=none;
        d=google.com; s=arc-20240605;
        b=L3RYX6aoxT2d4N66ilikPuWr5pyxQGPEY/W4in62ynYhid0v6x6MOqbKmyTczGsB+a
         LKmBZZogAcgpnWccClexWrR0aX9qK6GngNzCpZMCoslkgYioQtqlykhdtoUZ46+h5t4w
         N1pN1NzELDCOXjmEHxm57v6KoPkoWa/yK3g0VurHXdiXJCH6g3JH8Qd0ex6UFo9ekF0Y
         +bmgPd7x/yQpUeqASyxeaCfHcX4uhuYg7OChK+uBMtGUGX8qdpcoexNvdohZDNq2xtGY
         LZE1OcaaQ7Abf32RusihoMEQguAy5G/oFuDiGKL6d95XucGu+btS191v4c8bU0O4CmYq
         aQ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HvUvOiFnKHM0REYpmaWk5d+F2+5GIifwAyYSC+4XUic=;
        fh=FrBBwW2GjyOQ/9v3XiF404I2X4tq3W04iFal5aWIzsg=;
        b=YzbJyYmtsY6wr1aztQvFhR60d4PpFY0aTNmgeVjWgRkNkjLbZ1/uJvL343jdJuKnJJ
         TCu0kx8n4w6Dfoqr7KemOInbSHA3mkeGEexVo1I9YLrdcOOF2WDgpklF+oApSt/vRqyS
         NZkBv7wCW81rR0DVn/kNEbxEuNJ/tDMfa6z6FZbifTmqcMNuK/lTb8F2w/jFJ+bIdFoy
         52LyfOJmVRWRmTXnEkQ4/ZCRXqE9J7qK8X3GKAI8PCEKdgKUbB20UmE8Pie60LbQQAzs
         K8TQp7QCParq71XEo+kkaJ2ZHsC5vq1DMpVpfQtX0OHuq/V+I7z1S/XUvUIqEE9gBjRw
         bvyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778600880; x=1779205680; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvUvOiFnKHM0REYpmaWk5d+F2+5GIifwAyYSC+4XUic=;
        b=eriWQtJYL7/aTBCvW0VRXFTefI0roq6fsreKMn7E2uFXWreXSb7v27ELgolV5AlR/u
         CPNmbOh2KOu/d5ZHI3FS3lMIQV21aHt7m50Uiojy2gepasbkoOilQZ4+bj4KKyYdBF6Y
         1hkkTIyLKfBAIb0X9Ub7qGIOFwTye0GmhcI/WyY8ozx/lzMNLnezhsDsj6lrEGXTT8nJ
         kcJ+wovv/EwokIpWX3wrdNt+kyi9mr9xfHV/yyU0LAWQUXDD3w8t4oflU3BLSqJ2SJgo
         9+1mohZeGaelpwZiHWuAXsZssk7KdhM/kRqSnMC9tkzaGKqvTrPAsY0q1oQCeQhHv3Sd
         5ODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778600880; x=1779205680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HvUvOiFnKHM0REYpmaWk5d+F2+5GIifwAyYSC+4XUic=;
        b=M9sjni+Q/30a2/GQx2QKOpDzY42a5bGMPw5xb5zQwnEB7XSSF+H4vPu03/0yyEVo0J
         TzCTR+PvN4fB3nzS7M/Pr1sdTy17Kcgpz50E2qUrFe+31DDOTQ9KkifXr1wNpubCrDzi
         yN1pRlDJamiFD2b3ecEY2aqh2P5VSwBBnN/Teai47HlTispFSCoJz/nngmwBoCoGN3um
         sYy4TqxBwuxqbE+iD0zLUFwrXNIt9Yc1/zYd+qPqb+vm/nrjZMt7bF4KrOq2REfPcE8y
         4zBG1yYHSnFgBsqVKCT23cdxbmyft1qnisvB8YbI1A6hvZ5ibNiioKMBcDhKh+AciuNx
         WkGQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xuFTlM5NHsxE/Q/IqaU2Z0wa8YJwY/wG7n8t9ffNeVSTxhA7JB+ZMabuJMnSgq63nzy9yk4S40Lc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPRMdHALRCOKICKX+SxZ6d30a4ezevrQXhQtA8sWDlqhBkxWiI
	jgDalXNwEjgii1te9Bwszccw7JaSK4yHYHRiE/t2mGHjl5lusrOXs9C8QZbVQrKucHlOpjbT4XZ
	5ld9oW/L0D/WbsY55h/ibjayPVb0RE8c=
X-Gm-Gg: Acq92OEGbfcYSQ8T0ewBhnjeQF0uDzjnXGrfZ94JsbFEW1EtuZOrNiHjYKy9nvXorLN
	pqok4jn+fWjwZU7DKn6ANwbgH2hUp6GmNTSoEpgHzCfMXGQlDUNBWbAaZJB73V+KrOdrMfF8/a6
	dUY5QSIKNl+db/WckvevLxmeFyIU9kyUNoj0+rNONHA0pOFCoseBOinnPQkddmMxDQTOCuliYdg
	SCP+0AtTLmPA56StZ/eg9gaqfodgrCH9S0dUIEj7RRSMS/7z7CsolKHg6VnPVfOjvWx11k6CP0M
	RIRTQrBLHT61dgDAw4IWqhBL+gf/QdkSOv/xfHo=
X-Received: by 2002:a05:600c:3e19:b0:48a:5546:61a1 with SMTP id
 5b1f17b1804b1-48e8fe721afmr50364255e9.15.1778600879485; Tue, 12 May 2026
 08:47:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511105149.75584-1-jiahao.kernel@gmail.com>
 <20260511105149.75584-3-jiahao.kernel@gmail.com> <CAKEwX=PLFRkfUvZyaYfwBv0QJ-8KAktvZvGA02Hod04H-RsS-Q@mail.gmail.com>
 <CAO9r8zNOPdpJuTmccvQ6ZAVS+tXxp-_ofA765DbnfaUZOPPO-g@mail.gmail.com> <12e4784e-2add-d849-7e54-bde8abfa6e78@gmail.com>
In-Reply-To: <12e4784e-2add-d849-7e54-bde8abfa6e78@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 12 May 2026 08:47:47 -0700
X-Gm-Features: AVHnY4JskTf23tSbnnLn2V95OlEo1bjSAHzhtTqVEIKfyAdTp_H0_7MV48nFSA8
Message-ID: <CAKEwX=MOixJAUGiwUcMQa0Stvg-mR-MvpDRD8WA4YMtRvnUYTg@mail.gmail.com>
Subject: Re: [PATCH 2/3] mm/zswap: Implement proactive writeback
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: Yosry Ahmed <yosry@kernel.org>, akpm@linux-foundation.org, tj@kernel.org, 
	hannes@cmpxchg.org, shakeel.butt@linux.dev, mhocko@kernel.org, 
	mkoutny@suse.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>, Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 2:32=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.com> w=
rote:
>
>
>
> On 2026/5/12 03:57, Yosry Ahmed wrote:
> > On Mon, May 11, 2026 at 12:49=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> =
wrote:
> >>
> >> On Mon, May 11, 2026 at 3:52=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.c=
om> wrote:
> >>>
> >>> From: Hao Jia <jiahao1@lixiang.com>
> >>>
> >>> Zswap currently writes back pages to backing swap devices reactively,
> >>> triggered either by memory pressure via the shrinker or by the pool
> >>> reaching its size limit. This reactive approach offers no precise
> >>> control over when writeback happens, which can disturb latency-sensit=
ive
> >>> workloads, and it cannot direct writeback at a specific memory cgroup=
.
> >>> However, there are scenarios where users might want to proactively
> >>> write back cold pages from zswap to the backing swap device, for
> >>> example, to free up memory for other applications or to prepare for
> >>> upcoming memory-intensive workloads.
> >>>
> >>> Therefore, implement a proactive writeback mechanism for zswap by
> >>> adding a new cgroup interface file memory.zswap.proactive_writeback
> >>> within the memory controller.
> >>
>
> Thanks Nhat, Yosry =E2=80=94 let me address both comments together.
>
> >>
> >> We already have memory.reclaim, no? Would that not work to create
> >> headroom generally for your use case? Is there a reason why we are
> >> treating zswap memory as special here?
> >
>
> Apologies for the lack of detailed explanation in the patch description,
> which led to the confusion.
>
> While we are already utilizing memory.reclaim, it does not fully address
> our requirements.
>
> Our deployment runs a userspace proactive reclaimer that drives
> memory.reclaim based on the system's runtime state (memory/CPU/IO
> pressure, refault rate, ...) and workload-specific
> policy. That first stage compresses cold anon pages into zswap. Entries
> that then remain in zswap past a policy-defined age threshold are
> considered "twice cold", and the reclaimer wants
> to write them back to the backing swap device at a moment of its own
> choosing, to further reclaim the DRAM still held by the compressed data.
>
> This is the "second-level offloading" pattern described in Meta's TMO
> paper [1]. zswap proactive writeback is what this series introduces to
> address that second-level offloading stage.
>
> [1] https://www.pdl.cmu.edu/ftp/NVM/tmo_asplos22.pdf

Yeah that's what we've been trying to work on as well :) We are
working on a couple of improvements to the mechanism side of this path
(cc Alex) - hopefully it will help your use case too!

Anyway, back to my original inquiry: I understand your use case. It's
pretty similar to our goal. What I'm not getting is why is
memory.reclaim (which you already use) not sufficient for zswap ->
disk swap offloading too?

Zswap objects are organized into LRU and exposed to the shrinker
interface. Echo-ing to memory.reclaim should also offload some zswap
entries, correct? Are there still cold zswap entries that escape this,
somehow?

Furthermore, we already have a way to detect the "twice cold" entries
you mentioned: the referenced bit. This is analogous to the way we
treat uncompressed pages.

>
>
> > +1, why do we need to specifically proactively reclaim the compressed m=
emory?
> >
> > Also, if we do need to minimize the compressed memory and force higher
> > writeback rates, we can do so with memory.zswap.max, right?
>
> Here are a few reasons why memory.zswap.max is not enough:
>
> 1. Writing memory.zswap.max itself does not trigger any writeback
> immediately. For a memcg that has reached steady state (on which the
> userspace reclaimer is no longer invoking
> memory.reclaim), after enough time has passed, the reclaimer has no good
> way to trigger proactive writeback for second-level offloading by
> lowering memory.zswap.max, because in steady
> state nothing drives the zswap_store() -> shrink_memcg() path. The
> userspace reclaimer still has no control over when proactive writeback
> happens.
>
> 2. memory.zswap.max currently triggers zswap writeback via zswap_store()
> -> shrink_memcg(), and each over-limit event can write back at most
> NR_NODES entries. If zswap residency is far
> above memory.zswap.max, converging to the target size requires at least
> O(over-limit pages / NR_NODES) zswap_store() events, with no batching =E2=
=80=94
> proactive writeback therefore has
> significant latency.
>
> 3. memory.zswap.max is a stateful interface. If the userspace reclaimer
> crashes for any reason mid-operation, it may leave memory.zswap.max at
> some set value, putting the application in a
>   persistently throttled bad state.
>
> 4. Once the userspace reclaimer has lowered memory.zswap.max, if the
> workload is rapidly expanding and triggers memory reclaim via
> memory.high / kswapd / etc., the actual amount written
> back can exceed what was intended.

One more reason: IIRC, when you set memory.zswap.max to a value other
than 0 max, every zswap store incurs a pretty expensive check
(obj_cgroup_may_zswap), which does a force flush
(__mem_cgroup_flush_stats). That was pretty expensive last time some
of our internal services played with it. So yeah, it's not ideal...

(if you're using this, might wanna profile this as well).

>
> Thanks,
> Hao
