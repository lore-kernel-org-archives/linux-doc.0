Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A673226E718
	for <linux-doc@vger.kernel.org>; Wed,  5 Nov 2025 06:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762322534; cv=none; b=ZYU5Pfh0uitozM4Gtpawm/PWJIZb8jMWTtq5QP0DnFYvTgDW38yMhVsSec077OXyZfdUwIVWCJETw4Lx6HWYcR7tFKk4JVTrYcCfZd5eMfp+z4MQYMQTz4VW1e3zp6jCAZZqK43/f2WV/27imbgGvQ+onJspK1+LIyyMnFVAIuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762322534; c=relaxed/simple;
	bh=rB26i8gg+y3xFbXaOX+BukR99gcLLiKA6P6pz/n0flQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SZYUR1DKCtIWNUKhQ45mfNM+Lh1ooh5jS+yOKBpt5pDPVqybUWIgU5SuIeCJ7hsB5DKY3sgRmKrCFcPf4KdZC3cNIIN9K2cBaEV85NW0b3/LqCV1kjmCdBZxIt10h90hBf8NMEKSwvhz8sgq24o3NAA3vlZB9v186XCy2TxwVuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com; spf=pass smtp.mailfrom=shopee.com; dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b=ERQZDNRN; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="ERQZDNRN"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b710601e659so453958566b.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Nov 2025 22:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1762322530; x=1762927330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ko+h2HHqIfyVkiIdgqbGuzIvxFEpCvepvxTD0kgHwio=;
        b=ERQZDNRN2PWRX1/EMYpLuryhsJePx8dLLR6HMR0G3StPlHyHMNU7tcKcLOyfEbhW+h
         inS0O8sMbszfsihBBXG23K3YUSpzE/cpyukL9MgARfVI23ILr3fgyUb9m+9wjPyfUjpr
         wESlDLbSGtW3SV79L89Zts97LY+pJ0xTfv2xbo0DT8rZk8DWo1KVR7RPR4Ar/1/E6Rp2
         3xfyFvxW6HODP/jEsVW/+vidb6+BhJvkqnjAmx0YQ90goj94gvaZQ0ewRGMb2yEVMP8w
         FQfUny5NtEVDkQQP4rfVLYLsnebR6QjNwv0PMkY6ELdHjyGt558Ke61gGTmqBUQEScTb
         yTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762322530; x=1762927330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ko+h2HHqIfyVkiIdgqbGuzIvxFEpCvepvxTD0kgHwio=;
        b=kOA46f3dYG4jWOZ1q1lA4KbpwmC5F04hZAuszWRe3Dw/fiiX3ckr+Pw89Sqhwsw3Xr
         JjqMH7tpvsXYK3G1nDyR6tU+Mch1Lh1ipqKJyvPLzmRTvjawq+Yt83eZY6O/8xHWqVMR
         BsbqdTsfC4/VYxB9xq35t93TytEsvCGgasTIeUFnjn90mZmhNZr6GWsOxWjmAOADfEwR
         gd7EfjzzkJ/f8YKUd3sHjJ7KpUmbWuvcS27yNqnrOe9myB7BvlTTl/1PAC6BIn60jND5
         K27LSJEUlugWSHLkA8KvzLcyh6dd7FaOAq2KeO5r6QPkCvk2JrxsBd481K9HTI7M9n5w
         LHTw==
X-Forwarded-Encrypted: i=1; AJvYcCWycrNeOvFNtJR21Q5+G1tX3TbOiG4CabksoE02+HIcpDkHYHOaqdR9Wknet2joTywztDCKdHF2dmw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIOU+SXluHML1OkOLq75CvOPMZ9Niq2TKuInqSaQL/rjKu9QQk
	TGRwGbLTLJqIUEM1wBDuRdWgX8F0WWynRr8SsII1ZAzQY2z7tYCNXO4zDj1KrPpwTpnSbFqWrFk
	Rm28CMxY1uRBjpdkP0M/XkvfKMddnaTrO432qPmpSvA==
X-Gm-Gg: ASbGncsCtks8me3vA7WgcWtoH28/x6ZqlIZzU7OETUmAeYpoyOQi/5RKHHcZiBIa9ds
	nDxmWYP2YC9PJqzWGpdC7n4u5PhIq1OacySIsSace9VNiH87Bh5hgNKhRQewHXeRc20tetdZXgs
	8u11xCjwBfjumlo9vRbU8znZKrl0RB36eMHcPzmkG7AFMa91VO/UlfYxJOj52rFvG8Fpxx4CYBT
	QnOH+sR2shnD0J9jM0F1GeUEhhfy/EEmOfviZ6M0cRqZpPMzkZBSZo4UiI=
X-Google-Smtp-Source: AGHT+IGhzBDN0J2xo0zgTrF8hoLMoPjH/0yoSaTiCKabdffwkstVhE2JzObLLjxmM0V2ZK+kJ0pjRcykFQushFkcK04=
X-Received: by 2002:a17:907:94d2:b0:b71:ee24:8a3d with SMTP id
 a640c23a62f3a-b7265154e9bmr164396666b.12.1762322529791; Tue, 04 Nov 2025
 22:02:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251104031908.77313-1-leon.huangfu@shopee.com> <aQnFn6vPQ5D6STGw@tiehlicka>
In-Reply-To: <aQnFn6vPQ5D6STGw@tiehlicka>
From: Leon Huang Fu <leon.huangfu@shopee.com>
Date: Wed, 5 Nov 2025 14:01:33 +0800
X-Gm-Features: AWmQ_bkS8mFduVj_GZzMUe3ULkR8btNSr45nec1ttI4iNP0pSA8_ELWgHC8BzUM
Message-ID: <CAPV86rrt0YT-npNSBJ_eHvAYdr_j1qkN7H+J4QLN8zsfi5TJ4w@mail.gmail.com>
Subject: Re: [PATCH mm-new] mm/memcontrol: Introduce sysctl vm.memcg_stats_flush_threshold
To: Michal Hocko <mhocko@suse.com>
Cc: linux-mm@kvack.org, hannes@cmpxchg.org, roman.gushchin@linux.dev, 
	shakeel.butt@linux.dev, muchun.song@linux.dev, akpm@linux-foundation.org, 
	joel.granados@kernel.org, jack@suse.cz, laoar.shao@gmail.com, 
	mclapinski@google.com, kyle.meyer@hpe.com, corbet@lwn.net, 
	lance.yang@linux.dev, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 5:21=E2=80=AFPM Michal Hocko <mhocko@suse.com> wrote=
:
>
> On Tue 04-11-25 11:19:08, Leon Huang Fu wrote:
> > The current implementation uses a flush threshold calculated as
> > MEMCG_CHARGE_BATCH * num_online_cpus() for determining when to
> > aggregate per-CPU memory cgroup statistics. On systems with high core
> > counts, this threshold can become very large (e.g., 64 * 256 =3D 16,384
> > on a 256-core system), leading to stale statistics when userspace reads
> > memory.stat files.
> >
> > This is particularly problematic for monitoring and management tools
> > that rely on reasonably fresh statistics, as they may observe data that
> > is thousands of updates out of date.
> >
> > Introduce a new sysctl, vm.memcg_stats_flush_threshold, that allows
> > administrators to override the flush threshold specifically for
> > userspace reads of memory.stat. When set to 0 (default), the behavior
> > remains unchanged, using the automatic calculation. When set to a
> > non-zero value, userspace reads will use the custom threshold for more
> > frequent flushing.
>
> How are admins supposed to know how to tune this? Wouldn't it make more
> sense to allow explicit flushing on write to the file? That would allow
> admins to implement their preferred accuracy tuning by writing to the fil=
e
> when the precision is required.

Thank you for the feedback. Let me clarify the use case and design rational=
e.

The threshold approach is intended for scenarios where administrators want =
to
improve accuracy for existing monitoring tools on high core-count systems. =
On
such systems, the default threshold (MEMCG_CHARGE_BATCH * num_cpus) can rea=
ch
16K+ updates, causing monitoring dashboards to display stale data.

Regarding tunability: while the exact threshold value requires some
understanding, the principle is straightforward - lower values mean fresher
stats but higher overhead. Administrators can start conservatively (e.g.,
1/4 of the default: num_cpus * 16) and adjust based on observed overhead.

Your suggestion about allowing writes to memory.stat to trigger explicit
flushing is interesting. Comparing the two approaches:

- Threshold (this patch):
  - Administrator sets once system-wide via sysctl
  - Affects all memory.stat reads automatically
  - Tradeoff: harder to tune, always-on overhead

- Write-to-flush (your suggestion):
  - Tools write to memory.stat before reading: echo 1 > memory.stat
  - Per-cgroup, on-demand control
  - Tradeoff: requires tool modifications, but more precise control

Actually, your approach may be more elegant - tools pay the flush cost only
when they need accuracy, rather than imposing a system-wide policy. The
write-to-flush pattern is also more discoverable and self-documenting.

Let me try your approach in the next revision.

Thanks,
Leon

>
> --
> Michal Hocko
> SUSE Labs
