Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6D720DD52
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 18:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772043566; cv=pass; b=bIU5nIHyfwILjxuosmVTQcAl6bx3iHFCXPBjqzm0WmGBNcF73UhQ9/kpupCkgHbD1cx8MBEAP4Lw62IuoT5lcPMIYD8GvX7Lbs0Qxl9LIlu3PxqPrSMyeE/IkcIEA7EDTNm2AYowBarDaJ7KNYGfP07rHVXXUpvGV5QQ3V8PgIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772043566; c=relaxed/simple;
	bh=r2r2EGX6azT/YlS4xTRQO84+cJg5TRoLRYciSVcCdes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AZOxATlMjVxd/dQEhCd2DqhKm+OWc/XAAFseueqgTFThXTmNXTSbiKWWRGY0MfJJ2AE++rSELHY3wm3qqMkTULQ7aAN9qpBjNAlhEVv4hsI4/MlYSLHONY+OIoskZq+VRictwywr/mAKzTBBpvo2iLzlIN3kbAviXVkoYdCQeVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArBuxNro; arc=pass smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArBuxNro"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-1270adc5121so8483841c88.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 10:19:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772043564; cv=none;
        d=google.com; s=arc-20240605;
        b=cPk2UnFE2OdykhKgJNwvjQ4hyoSpGEPMmsEgOeHZ5WxHouN91WnqYi4NhKu9vLGShY
         yEQ0Y33YKcEuxTr4rzEjHajvADm1WzWBkYl7TpUz0R9MuCdo5xVJFlheDnvOHg/u2/fQ
         IbbNMScom8xRBV3zfFSnzVSC/Jz8Mo7okmL5Raulc2rGAlHGDC8VlWqv3PAQ3NJlrzm9
         ensHHzkqa84LH8Zf9Mg6pY0WEmCVwOt0JNLMUw6LZvRFHAmzPg86ta5jeg2n+VNykSH8
         N/cL4f9m3DnhVy1Yd32lR6n4UwdD7Ya2Vcy0PlM+xQDcsEKiNTPvVmjxcA+WZx5mqCt7
         I2wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fpua/5AqL7IvJ5rCFhonR5njdxMsCjSPzuEjD4KqeMY=;
        fh=UHUIJEeii9K6K2moFy0FqNCIWfZEX6ksILQrHClE2Ac=;
        b=jlqHiBZzjFDnEvlZ1yLT6EgTjgKEX1zXDvNhakyv9f2oVgL8jmqTVOuWS+isQye4bJ
         Cw6B32UcnmN+KMWOuOSPKOsj3xHEPLxxSWxYj1PeG8mmfCI3MZ9JT+8sYIRT8hGBA/Cq
         jGvqlUc4yGfyTeKzz5kaWnG6HOFJY+L3TQwvOmKM9zufL+TA8LxV/DouYXyn4TbtjByh
         9BkYC2+KO1ItC4PgZH3nMYXtBJBLKQst8Qj4/YEr8kDFZ7yTvcGKAv0IW1foh+CWcleW
         X+gZefPUAasrrJNUQbCuMCim4olq18XGxNAHyEcf8OAiyggAK74VID1EP0UhTaHCHlr4
         iZwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772043564; x=1772648364; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fpua/5AqL7IvJ5rCFhonR5njdxMsCjSPzuEjD4KqeMY=;
        b=ArBuxNroH0+4r/yj3/jIcmiEdcK+kmWczonCjmZ3O1D5FhD5wJvmYAhlHf6CQcCHhA
         GQ+Cyi+U82X0rI+eahcRsXjjQzGJDvFEaVy/TIy1bLcsfoo4cjaIImM3wdCrAYbxVVwm
         zIl4kALq4VbvE5rZDjmupHg9RwUnEWzZZanV/EyUyUekMeVzRcYZT3/Lxjx3wpORWiFT
         nLmySyReZ2Hda5WVHqkWL4snOPCCq0Wa//NeVw/Huu9j48qWcsOnHqTH+aa/+3xEAhGB
         q7w7neeeWoG+ytrtz/jbV4v1iclfyt4454RVnmEaH3RopbQ8rK/kGKVohVdT1FPBYhug
         sSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772043564; x=1772648364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fpua/5AqL7IvJ5rCFhonR5njdxMsCjSPzuEjD4KqeMY=;
        b=YIzbxmaWfLZ3/iQYP0Zchj0QEd1ZH6+9Y49+OuMi2c8MEqWihdfS4MKKbMfDqN2M5E
         296Ij6gGDpNK7GEwSXJq18Gevm/Ft9RyMKuvpZH6m0MFUSZWybFuZK9Ezdv82wUf4DvL
         8Jmt65VdBkrK/rdqKatR+vGIPBournMoj/XOe0n3trVxvKIHQ5hDZXeJyCGpL5d3GQ3u
         DwCaUgStkqYj3AOMmwBvmmg3QdTaHuf7s6Esrh4C5sPR8sVIRQv+mUF8JIIGeheB13eC
         HarxYt4jTLoLmAS3juclMaLGutoPKtM3q4DMcf8pyeZauLFfe7UBnhKDisyBJMYX8/rQ
         a4JA==
X-Forwarded-Encrypted: i=1; AJvYcCUDdSWBGIbcm9bZC/t/WudfUlgAcJM1eV4lAXK5YgWEN3dip4tYijxXgr/lPO7le06OW94+Xc1/RlA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF5rtJ7wS0FUQvRrud78Vg3Yg2wOUlajWx2zrGzNylqa+XrTlA
	77WRG1nmncmMsZngk6g7QmrO00RusFvLl2u3DrKaihYx/Tg5zlO437abyKquLVkRNOwAu6k7PnE
	leM7oA7pdXq7x8tk9Jcy4oZrdj73nlA==
X-Gm-Gg: ATEYQzxRJS9MPPJwt3RqoupEv0kGn7vv2VDEFP16Lxa2xKIEWeAAGEvbHfMLlDav2zT
	k4xcfPp1qM/71mmlssnmn03j0tBuMBClkEnSJSZalpqoeKSWQChuZbsGfKXmIDQfYwEH+IH2iqF
	EYI3GNeoYruB7ZHNYDEEDqmD9co/2aes2BNW4yoHO0fvCZvbomd4B4z2pUJ5H76dphftaSUF25U
	pLo/mEFBrIaPWDcu7u4zpF2vb+V/vo4eavmbE44ql3F+uMd0RiJZEgDlx9XLIp7B5Kja7/8JHfX
	eOcwTXM=
X-Received: by 2002:a05:7022:50c:b0:119:e56b:98a7 with SMTP id
 a92af1059eb24-1276acfb898mr8110234c88.14.1772043564405; Wed, 25 Feb 2026
 10:19:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223123232.12851-1-ravis.opensrc@gmail.com> <20260224053633.58448-1-sj@kernel.org>
In-Reply-To: <20260224053633.58448-1-sj@kernel.org>
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Wed, 25 Feb 2026 10:19:11 -0800
X-Gm-Features: AaiRm53hBf4jh574PmxytdQQ-YYkGigD5nOoFyBC9KFKd9UXuxLJxrvhLrRMxwQ
Message-ID: <CALa+Y17HPOxpLF41+Jn-fHqu7s4YUzgsFKdhD9MsN=wCop_kRw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/4] mm/damon: Introduce node_eligible_mem_bp and
 node_ineligible_mem_bp Quota Goal Metrics
To: SeongJae Park <sj@kernel.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, akpm@linux-foundation.org, corbet@lwn.net, 
	bijan311@gmail.com, ajayjoshi@micron.com, honggyu.kim@sk.com, 
	yunjeong.mun@sk.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 9:36=E2=80=AFPM SeongJae Park <sj@kernel.org> wrote=
:
>
> Hello Ravi,
>
> On Mon, 23 Feb 2026 12:32:28 +0000 Ravi Jonnalagadda <ravis.opensrc@gmail=
.com> wrote:
>
> > MIME-Version: 1.0
> > Content-Type: text/plain; charset=3DUTF-8
> > Content-Transfer-Encoding: 8bit
> >
> > This series introduces two new DAMON quota goal metrics for controlling
> > memory migration in heterogeneous memory systems (e.g., DRAM and CXL
> > memory tiering) using physical address (PA) mode monitoring.
>
> Thank you for keep working on and sharing this :)

Thank you for the detailed review!

>
> >
> > v2: https://lore.kernel.org/linux-mm/20260129215814.1618-1-ravis.opensr=
c@gmail.com/
> >
> > Changes since v2:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > - Split single metric into two complementary metrics:
> >   * node_eligible_mem_bp: hot memory present ON the specified node
> >   * node_ineligible_mem_bp: hot memory NOT on the specified node.
> >   This enables both PUSH and PULL schemes to work together.
>
> This perfectly aligns with the direction we agreed on the previous discus=
sion.
> Sounds good and reasonable to me.

Great, glad the approach makes sense.

>
> >
> > - Added PA-mode detection lag compensation cache (see dedicated section
> >   below for design details).
>
> I'm not very sure if this is really needed, though.  I'll leave comment o=
n the
> dedicated section below.

Understood. I consciously separated the cache implementation (patch 4)
from the core metrics (patch 3) because the cache is ONE possible approach =
to
handle detection lag - not necessarily THE approach. My goal was to share
what was needed to achieve equilibrium with my synthetic benchmark
workload (multiload),
while making it clear that the cache mechanism could be dropped or
replaced with alternatives.

>
> >
> > - Added fix for esz=3D0 quota bypass that allowed unlimited migration w=
hen
> >   goal was achieved.
> >
> > - Added fix for goal_tuner sysfs setting being ignored due to
> >   damon_new_scheme() always defaulting to CONSIST.
>
> Thank you for finding and fixing these issues in my previously shared RFC=
 patch
> series!  I left a few comments to the patches.  In short, the second fix =
looks
> good and I will add that to the next revision of my RFC patch series, if =
you
> don't mind.  For the first fix, I'd like to take more time on thinking mo=
re
> cleaner solution.

Sounds good. Please go ahead and incorporate the goal_tuner fix into
your series.
Happy to test whatever approach you come up with for the esz=3D0 issue.

>
> >
> > - Rebased on SJ's damon/next branch which includes the TEMPORAL goal
> >   tuner required for these metrics.
>
> Thank you for clarifying this!  This kind of context is very helpful at
> revidewing patches.
>
> >
> > Background and Motivation
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> >
> > In heterogeneous memory systems, controlling hot memory distribution
> > across NUMA nodes is essential for performance optimization. This serie=
s
> > enables system wide hot page distribution with target-state goals like
> > "maintain 30% of hot memory on CXL" using PA-mode DAMON schemes.
> >
> > Two-Scheme Setup for Hot Page Distribution
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > For maintaining 30% of hot memory on CXL (node 1):
> >
> >     PUSH scheme (DRAM->CXL): migrate_hot from node 0 -> node 1
> >       goal: node_eligible_mem_bp, nid=3D1, target=3D3000
> >       Activates when node 1 has less than 30% hot memory
> >
> >     PULL scheme (CXL->DRAM): migrate_hot from node 1 -> node 0
> >       goal: node_ineligible_mem_bp, nid=3D1, target=3D7000
> >       Activates when node 1 has more than 30% hot memory
> >
> > Both schemes use the TEMPORAL goal tuner which sets esz to maximum when
> > under goal and zero when achieved. Together they converge to equilibriu=
m
> > at the target distribution.
>
> When this kind of complementary setup is being used, in my opinion, CONSI=
ST
> tuner might be better, especially when the access pattern is dynamic.  Bu=
t it
> is up to user's choice.
>

That's a fair point. I chose TEMPORAL because I wanted to move the required
amount of pages as quickly as possible to reach equilibrium.
For my multiload benchmark with uniformly hot memory, this seemed like the
most direct approach to test the metrics.

> >
> > What These Metrics Do
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > node_eligible_mem_bp measures:
> >     effective_hot_bytes_on_node / total_hot_bytes * 10000
> >
> > node_ineligible_mem_bp measures:
> >     (total_hot_bytes - effective_hot_bytes_on_node) / total_hot_bytes *=
 10000
> >
> > The metrics are complementary: eligible_bp + ineligible_bp =3D 10000 bp=
.
>
> All make sense to me, so far.
>
> >
> > PA-Mode Detection Lag and Cache Design
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > In PA-mode, when pages are migrated:
> > 1. Source node detection drops immediately (pages are gone)
> > 2. Target node detection increases slowly (new addresses need sampling)
>
> I agree.  And this is not what I clearly expected during the previous
> discussion.  Thank you for sharing this issue.

I'm glad this observation is useful. It was something I discovered during
testing that wasn't obvious until I looked at the trace data closely.

>
> >
> > This asymmetry causes temporary underestimation of hot memory on the
> > target node. Without compensation, the system keeps migrating even afte=
r
> > reaching the goal.
>
> But, is this really significant?  I believe people may use complementary
> auto-tune setup especially when they expect dynamic access pattern.  In t=
he
> case, even if we can perfectly compensate this kind of gap, some of oscil=
lation
> will happen.  You also mentioned "eventual convergence" could be acceptab=
le.
>

This is a valid point. Real-world workloads with mixed hot/cold memory and
dynamic access patterns might behave differently from my synthetic benchmar=
k
where all memory is uniformly hot. The uniform-hot case is essentially a
worst-case scenario that forces continuous oscillation regardless of
detection lag compensation.

For my multiload workload without patch 4, there was significant unnecessar=
y
page movement due to the detection lag. However, as you note, that may be a=
n
artifact of the synthetic benchmark + TEMPORAL tuner combination rather tha=
n
a fundamental problem that affects all use cases.

> >
> > The cache addresses this by remembering how much was recently migrated.
> > When calculating effective hot memory:
> > - Source node: reduce detected amount by recent migrations out
> > - Target node: boost detected amount by recent migrations in
> >
> > The cache uses a rolling window to track migrations over time, and
> > expires after a configurable timeout (default 10s) when no migration
> > activity occurs. It also detects when its baseline becomes stale due
> > to new hot memory appearing in the workload.
>
> I will leave more comments to the patch implementing this.  But this seem=
s too
> much at the current stage, unless there are clear test results showing it=
s
> needs.  I'd recommend proceeding without this, and later revisit if the p=
roblem
> becomes clearly significant.

I agree. Let's drop patch 4 for now and focus on getting the core
metrics merged.
The cache mechanism can be revisited later if real-world usage shows
it's needed.

>
> >
> > Dependencies
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > This series is based on SJ's damon/next branch which includes:
> >
> > - mm/damon/core: introduce damos_quota_goal_tuner [1]
> > - mm/damon/core: set quota-score histogram with core filters [2]
> > - mm/damon: always respect min_nr_regions from the beginning [3]
> > - mm/damon/core: disallow non-power of two min_region_sz [4]
> >
> > [1] https://lore.kernel.org/linux-mm/20260212062314.69961-1-sj@kernel.o=
rg/
> > [2] https://lore.kernel.org/linux-mm/20260131194145.66286-1-sj@kernel.o=
rg/
> > [3] https://lore.kernel.org/linux-mm/20260217000400.69056-1-sj@kernel.o=
rg/
> > [4] https://lore.kernel.org/linux-mm/20260214214124.87689-1-sj@kernel.o=
rg/
> >
> > Patch Organization
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > 1. mm/damon/sysfs: set goal_tuner after scheme creation
> >     - Fixes goal_tuner initialization order in sysfs scheme creation
> >
> > 2. mm/damon: fix esz=3D0 quota bypass allowing unlimited migration
> >     - Ensures esz=3D0 stops migration rather than bypassing quota entir=
ely
> >
> > 3. mm/damon: add node_eligible_mem_bp and node_ineligible_mem_bp goal m=
etrics
> >     - Adds the two complementary metrics for hot memory distribution co=
ntrol
> >
> > 4. mm/damon: add PA-mode cache for eligible memory detection lag
> >     - Implements rolling window cache to compensate for PA-mode detecti=
on lag
> >     - Adds configurable cache timeout via sysfs
> >
> > Testing Status
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Functionally tested on a two-node heterogeneous memory system (DRAM + C=
XL)
> > with PUSH+PULL scheme configuration.
>
> Glad to hear the functionality is tested.  Looking forward to the next re=
sults!
>
> >
> > This is an RFC and feedback on the design is appreciated.
>
> I'm yet to further reply to the fourth patch, but I hope my comments be w=
orthy
> :)
>

Very much so! Your feedback has been invaluable in shaping this work. :-)

I'm currently on a break and will be back after March 10th. Once I return,
I'll send the updated patch 3 and share test results with CONSIST
tuner.

Thanks again for the thorough review!

Ravi
>
> Thanks,
> SJ
>
> [...]
