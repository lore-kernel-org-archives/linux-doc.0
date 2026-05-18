Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D703B3FCB31
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 12:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779106026; cv=pass; b=GWgxkjd2lShQBxNSr81FX/+OQ0lFyQ3cKbFZWgqLw5pVfbJ+t5FRxAajKtsQiRIXElzO1KX7zPsUJxCwpEN+MIjJLuqSOgfAr5Onl6v9X7b/qAgegntSxSeAFGkbE6L4wVKrdcxv4CxQvtS/PHnWKUjFFHEDOxg9oZJHq7q31Ag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779106026; c=relaxed/simple;
	bh=EAOhdahq1wTYoi+v3Sd0YHLgR6nzuu2wluSY7LEs20o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UNq1lGn6iTfesop8CzOggIoFnDEqCGKZayWxAdN/t3LaaDZEwfnb3JvI5u/ZiKHWQVQv55nPIb2Ve+AaxsbCnSI0wljZ43rRXd+/5loAsG9UfDfm1z4KtZqrbAx5mMlLF7WGJn+SwEMNi+UvXTX9oHi1JJrEZfbV5J+7q/3tpVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G4THvtww; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BXRKsefn; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G4THvtww";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BXRKsefn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779106021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EAOhdahq1wTYoi+v3Sd0YHLgR6nzuu2wluSY7LEs20o=;
	b=G4THvtwwT61itdHBuBUracjdcEpsi+sICgXXKBL+iwx6iVPlkVa/kYDy7ZLbsrDPs/K3J2
	0T/r2m5zaN05pt/9i+k0znZnhFAnkynfANkoWx6y/sW1knf51kYrvn2qDC3KuynqN8mP0i
	/Kqt9tFL5BiiB92vZXzY1V3fixBsomk=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395--F9cS_ciMCK3rd0gdEqWcw-1; Mon, 18 May 2026 08:06:59 -0400
X-MC-Unique: -F9cS_ciMCK3rd0gdEqWcw-1
X-Mimecast-MFC-AGG-ID: -F9cS_ciMCK3rd0gdEqWcw_1779106018
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7bd5c9e2e4aso30212657b3.2
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 05:06:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779106018; cv=none;
        d=google.com; s=arc-20240605;
        b=QzmTyfA0I6/Qk4PzhvI5xudarD+Vfa7MSCe4jWsICTRLwYvjNwMosZuqqECFtJxpIi
         dLz6ElnYYiybBK1ZEfseDtAqSY6FBB+wz285Ki67JnT6y7JrK9cCY+yUznMGqvob1GF5
         uq3NIgcqbGmEHlD6WqOxe05G/Y7sbAdaNWES/pHapcGYLDfDJMs37GAfw2NsQtirjOJd
         cesi5mwXG2+WEjpY0Btnf+13Gb6nePVVVo05lqGSax0lJlG3dzc4cGMl8b/GjmJkyA+G
         FzC6HuaPc6smX2xtg2X8oqAIGit+Nj0o6J6JP6rN+PjWkQb95TDf8OaR/twSZqc/f2Mf
         5UMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EAOhdahq1wTYoi+v3Sd0YHLgR6nzuu2wluSY7LEs20o=;
        fh=EjypE2+7wnXMQLJa+xG6ZQDUbw67mMqnN4rBOvO+5MQ=;
        b=Ng2XSfNXpHoIpgcdefSvB/viouCMPvSt+e9aPlDEv8rIGl9L6CBpdjIfVORr50oxvt
         jGmsf/LC4iHBaTBnKQIKw3qD7HBO57D21F/NugOBNdve2rouDemP9Wo8RGO+zJkFDJpk
         T1arVG/b+QVqGfR7zZILrwtX/dHdn5JO5hKSX5wExXhH7lvddqLNWQ+aNhvcOHAWPZAY
         uyKLnpGK/xziNtxyApl4KQmmPK8D8FTNoOqv4oPDmGSwym1zcN6VsdwZKTrJeYWv/hwu
         uxmwRgMT05I2nfdB9/lLou+j7cMhtSZPz31vQOBvv/GdFEdkAKWFYHqhfDONxI/UxFOI
         Wb6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779106018; x=1779710818; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAOhdahq1wTYoi+v3Sd0YHLgR6nzuu2wluSY7LEs20o=;
        b=BXRKsefnGCMXMhgisrd0MC7Rs/auGleOXoRdtovMvOZlz8JJE1sPikdDhxXtmkWdr4
         /bR5Nt++ZHSOPzEGG8kIY9AOtowwgbNrnZNJT7Y6W0seh1k+P9T6nEGXlvx4bRcI/8eb
         uRRHMtOFb3JcOzXyIK10B/cJAuPoJY0qdSzZ6sCVNfj54b+HQ3HFZbzPQ0hjx7zlOqA7
         an8qq4u22GOl/cyqbd55SH39Y9RLLNTPjU5iCMDhjxvuMlak4x41FhiunXT6fZP/Gtdt
         D75/+eSFwmAZgP5xdE2FoVW7eokz5kyr1zHwu/5Z+MEDZzdcYLOF2T+EslGzUT2ojgbm
         D3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779106018; x=1779710818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EAOhdahq1wTYoi+v3Sd0YHLgR6nzuu2wluSY7LEs20o=;
        b=B0NmgIgN/tzldAM2DIXbFWEZCd8R4uh4TgPRSobxykAhKY7eIMTFVxtriYyJldr0E+
         H/x6wfIeeT3it9OcP7Kyz4af8dUj4lNSzOyQvh5VzQKS2wZKSL4H8JZnPDb222fdCOiR
         pwQqZL3G605MJrss8SXoRQRXZzjOiIzzYh43VVZG+mXvMAbUuFDMk+ofTeOcqRVH8Ksc
         0t8rUDNOYhxQUyyOxTLNlJvO20aaBznnizz7EroH2tnae4ugnAcZUO/YxPg/xyxLAeIL
         u61w18lxwhepAmohJAV/cxpgoIOKch9j8WP5zX6tAza7gfR9Ww3jNrMo3yi/W+1P1ATV
         0tjw==
X-Forwarded-Encrypted: i=1; AFNElJ8Pu50LD+S1sg4nOPuPZ8oBkP0qtXvFrt843BS1Zja9UoCt/kWMud/H8heQxZpgpNPwubYNFt5nFFo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq7TZhW9Qd+xr+WccPsKtSQ8x+cicb8qIy/NfDesBhKinI9dqZ
	edCrPBKwD2C+hVuBbhh15vOBqLjd8dPwwSecW6BcZLQQLHnNSs9XncrJtyVIVn7ogMkIUXTIZly
	sGwG2FMmACByXV1JYbZ7QJVzcMzCkLkoux3otQzs36xVyVqrlN8eKJBUWNN4wWNhBUXtc4YkTys
	D/drjdcQs1ybO/BAVPyiu5yLkn80vW/DQP9xgF
X-Gm-Gg: Acq92OGMwSF8+1QaJ1aj3PSIIUW9Xl0G1JCzBoJT45AfxUa4ko80L/0AB54KrVmto05
	TXv9c0O9BurhpwTSVPheoFdoUpR1cRuMSRTQAhCdQcOQwNuppxgM4MfAXWtNWmpD2TmitaVS9f2
	PvFsrfxRuK3L9aq18x1G7CG0KqY6fXrJDHd+EKds+UUy+LzWtns9szfNuaEsjwmLzXJGI10nBYy
	AF3KA==
X-Received: by 2002:a05:690c:e3e1:b0:7c0:56f:5b59 with SMTP id 00721157ae682-7c9599a36ddmr149907427b3.15.1779106018454;
        Mon, 18 May 2026 05:06:58 -0700 (PDT)
X-Received: by 2002:a05:690c:e3e1:b0:7c0:56f:5b59 with SMTP id
 00721157ae682-7c9599a36ddmr149906897b3.15.1779106017837; Mon, 18 May 2026
 05:06:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-v2_20230123_tjmercier_google_com-v1-0-6326701c3691@redhat.com>
 <20260512-v2_20230123_tjmercier_google_com-v1-2-6326701c3691@redhat.com>
 <8ef38815-6ae9-4359-86d4-042554357639@amd.com> <CABdmKX2uwZ12kYJYPJGfWxuMBOJS=64b1GRj72tfB5D=NKM22w@mail.gmail.com>
 <CADSE00Jq_uvNgvxgPze0mEdUd+hF4-DPZkHy0KroWHZzygf4WA@mail.gmail.com>
 <CABdmKX3DhejYBis9htLDnzPrG7vuF3R3URLVNEbnyd61SSsx=g@mail.gmail.com>
 <CAGsJ_4zyecY6E-=Tm4_couT7uoM9LMcFdTMUPkZAjj4zUKE-dQ@mail.gmail.com> <cb84c2ee-9de1-4565-b2e0-60984721228f@amd.com>
In-Reply-To: <cb84c2ee-9de1-4565-b2e0-60984721228f@amd.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 18 May 2026 14:06:45 +0200
X-Gm-Features: AVHnY4K8qpVqb_W68zu-wX_-3BWWvVrVAC2CPBMHXBkSI4OOVylnoTOI9cwLMps
Message-ID: <CADSE00Lc42s2bzXzV5D7t1Enf56u4BVj-yXLp3Yxhm0=qMPvuw@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH RFC 2/5] dma-heap: charge dma-buf
 memory via explicit memcg
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Barry Song <baohua@kernel.org>, "T.J. Mercier" <tjmercier@google.com>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Christian Brauner <brauner@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri- <devel@lists.freedesktop.org>, 
	linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, mripard@kernel.org, echanude@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 9:34=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/16/26 11:19, Barry Song wrote:
> > On Thu, May 14, 2026 at 12:35=E2=80=AFAM T.J. Mercier <tjmercier@google=
.com> wrote:
> > [...]
> >>>> I have a question about this part. Albert I guess you are interested
> >>>> only in accounting dmabuf-heap allocations, or do you expect to add
> >>>> __GFP_ACCOUNT or mem_cgroup_charge_dmabuf calls to other
> >>>> non-dmabuf-heap exporters?
> >>>
> >>> We're scoping this to dma-buf heaps for now. CMA heaps and the dmem
> >>> controller are on the radar for follow-up/parallel work (there will b=
e
> >>> dragons and will surely need discussion). For DRM and V4L2 the
> >>> long-term intent is migration to heaps, which would make direct
> >>> accounting on those paths unnecessary.
> >>
> >> Ah I see. GEM buffers exported to dmabufs are what I had in mind. I
> >> guess this would only leave the odd non-DRM driver with the need to
> >> add their own accounting calls, which I don't expect would be a big
> >> problem.
> >>
> >
> > sounds like we still have a long way to go to correctly account for
> > various v4l2, drm, GEM, CMA, etc. In patch 1, the charging is done in
> > dma_buf_export(), so I guess it covers all dma-buf types except
> > dma_heap, but the problem is that it has no remote charging support at
> > all?
>
> No, just the other way around
>
> DMA-buf heaps can be handled here because we know that it is pure system =
memory and nothing special so memcg always applies.
>
> dma_buf_export() on the other hand handles tons of different use cases, r=
anging from buffer accounted to dmem, over special resources which aren't e=
ven memory all the way to buffers which can migrate from dmem to memcg and =
back during their lifetime.
>
> >>> udmabufs are already
> >>> memcg-charged, so adding a separate MEMCG_DMABUF would double count.
> >>> Are there any other exporters you had in mind that would benefit from
> >>> this approach?
>
> Well apart from DMA-buf memfd_create() is one of the things which as brok=
en our neck in the past a couple of times.
>
> But thinking more about it what if instead of making this DMA-buf heaps s=
pecific what if we have a general cgroups function which allows to change a=
ccounting of a buffer referenced by a file descriptor to a different proces=
s?
>
> That would cover not only the DMA-buf heaps use case, but also all other =
DMA-buf with dmem and whatever we come up in the future as well.

I removed a draft adding an ioctl for charge transfer from the series
before sending because I wanted to focus on the charge_pid_fd approach
and keep things simple, deferring the recharge path to a follow-up
depending on feedback.

The main difference between my removed draft and what you're
describing, iiuc, is scope and layer: my draft was an explicit ioctl
on the dma-buf fd that the consumer calls to claim the charge (see
below), while you seem to be suggesting a more general kernel-internal
function that could work across buffer types and cgroup controllers,
so not necessarily userspace-initiated? A kernel-internal function
will need a way to identify the target process, which sounds similar
to the binder-backed approach from TJ [1]. For everything else, the
receiver still needs to declare itself, which the ioctl accomplishes.

```
# When an app imports a daemon-allocated buffer, it can transfer the
charge to itself:
int buf_fd =3D receive_dmabuf_from_daemon();
ioctl(buf_fd, DMA_BUF_IOCTL_XFER_CHARGE); /* charge now attributed to
apps's cgroup */
```

[1] https://lore.kernel.org/cgroups/20230109213809.418135-1-tjmercier@googl=
e.com/

>
> The only drawback I can see is that DMA-buf heap allocations would be tem=
porarily accounted to the memory allocation daemon, but I don't think that =
this would be a problem.

The main reasons we moved away from TJ's transfer-based approach
toward `charge_pid_fd` are: avoid the transient charge window on the
daemon's cgroup; and to decouple from Binder, allowing any allocator
to use it.

Technically, both approaches could coexist, though. Of the three
scenarios TJ described:
- Scenario 2 is directly addressed by charge_pid_fd approach without
any transient charge on the daemon at the cost of one extra field in
the heap ioctl uAPI struct.
- Scenario 3 can be handled by the charge transfer function without
changes to SurfaceFlinger. The app or dequeueBuffer claims the charge
for itself or the app, respectively (depending on whether we include a
pid_fd field in the transfer ioctl). It also covers non-heap
exporters. The con in both variants is the transient charge window on
the daemon.

Both approaches shift the responsibility for correct charging
attribution to userspace: first, 'charge_pid_fd` on the allocator's
side, and the transfer charge on the consumer's side.

Deciding on one, the other or both depends on how much we value
avoiding transient attribution, and how much we need a non-heap
generic solution. With the XFER_CHARGE we can cover both. Thus, the
`charge_pid_fd` approach in this RFC can be seen as a
performance/strictness optimisation, eliminating transient charges to
the daemon at the cost of a permanent uAPI addition to the heap ioctl
struct, but not strictly required for correctness. On the other hand,
if we agree on the end goal of migrating other exporters to use
dma-buf heaps, and scenario 3 is addressed by adding the app's pid_fd
to SurfaceFlinger, then `charge_pid_fd` alone is a coherent/sufficient
approach despite the uAPI change.

>
> Regards,
> Christian.
>
> >
> > Thanks
> > Barry
>

