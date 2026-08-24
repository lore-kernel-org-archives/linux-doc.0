Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8733F822F
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 15:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584999; cv=pass; b=fU5CF8VKayoyLQxgC3gSw03b+V5iM/z5XVUNOjRA13+jVF7HQ1JGRqEhkfGDq3Kr/FsIXoVQURhs9+zK5FU0RdqM1pwkmlfn4W9GH3PoAlOjbAzbLX4xT12G3vtMSKFggdtraZA9fQI9YvxzXsIe5AytNxMQNRVsoiMH7KzSBQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584999; c=relaxed/simple;
	bh=w4M3PCOM2gpUz97sjX5Lbk112SdjbcxEFkrd/Swveds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WNWzfbiN8hi2T/k5BBKw5CekToqYTp31mYGKRlJcXCvxnF1/NHbRGMOMA6T7WF7wkWIe1MsMyV7V/p9+HZpSEYGNB0yUoeXt3Lv2tOhRFLFOiS+J2Nikf/+U6jXG0cLHLGDPqbd/oCeS9oA7Ej8IaTgIKQgplerA3L8dkGqeYh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pRt+m5jJ; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pRt+m5jJ"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so6620198a12.2
        for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 08:23:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787584995; cv=none;
        d=google.com; s=arc-20260327;
        b=fAFGDbg43StQgjVdIhij2ejh4hXN4JZgh0Fs+fIZtybqOipr8kpcm5k/IdB8ja4DSn
         XqrlF/gtBQ6Z6dbtTT5M180lQvBfdRvrn57TDKBVFuGUjSel6YC+6KoTDOL36lUl0WqL
         n5D1EYtKqelN5WAixHeIQmD+QWBSaji+F9Z6VMa+WjUbycC72JoxM/VcdokVA3hsrBdf
         eSWe2FjsWa+S3S0Q+Z2lNcL+R3njCLyt74TqZOQW99rsmBFFDUzgJnTn/w1E03GWwAPN
         //whUtIER9MIHBBsZAt7XBbStkxswXwgtRodwMkdbPzEqIGOuF2jVT2ZBiUgi1xwbBvQ
         OFSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jH77beqs+5zKV6amTfBDwxpeesgjCtaEPDf8Q4m2/ZM=;
        fh=3bEwhzJ1jBeWjNI3FvGQ/dgm+tANem8s+k3GAgfdnxk=;
        b=XkZwHbz12ivPuIBYDTF9+0OCC1UUgISsTS47HFNCUO6wiSm/9r31BUu33HuA8ECDni
         /AAS5JWx5cLL2iolPyzuuXY5GEjFDZzAKs81EQvt+V1zmNw44iMLHz+cb1N8DU36krbq
         0vRUWIKc27sw0PWkiGduFdoUhbkCRtTMJ3eBU86XgemMzDRbQhBuYhiAcGI8EIK3h8kB
         akBo0DfWVPTpPzMjOkLP/0TLH1OV2vAHg/RNcT9NZdnCfpU3RHY0EJZZhnbrtGeaoj9k
         lOj8SCpHlzJm8nuS8Qs2g4fE7s6jCKS/rZGhYAN5BU5cHP3OXCfyC2MZ6IWnIaihJ9xw
         x8gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787584995; x=1788189795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jH77beqs+5zKV6amTfBDwxpeesgjCtaEPDf8Q4m2/ZM=;
        b=pRt+m5jJjAF0QPb07aYupEH6c8WnELMbvAFZg3f87zGuBcnVdlpXaiwXgx//lyABGH
         NQbvv9XSA4ozmMh4K3jewFE7msc0yBr39T1XBEv4wKA58sQQkzJy4jB+E9vmytMpNFKo
         hhvp8pMUUTfBoQXaSsHhMp/W4mr/vrgp5Nnxav7WXwoNqbKPoJaxpIS9jSfn9G0UEncX
         JHCp4OeNorHXRUs5tIIXnE8yBWA4QjtDPgYYOSyYkqPXodeqLYR8EqpnmHg94RJMfZ57
         ZygZpeCxg981btx62GpGuLfNswNxd5d5i5xi0+OMtygym4b06jmRG61fmuNLzzngS0qI
         1I2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584995; x=1788189795;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jH77beqs+5zKV6amTfBDwxpeesgjCtaEPDf8Q4m2/ZM=;
        b=YBsBg6a2sEWmOx7G9JwBhAbTumClpvnenYVx5rthVLmk8TgjSeDBWR+1Srk7qxYV5K
         +AWI3z4msRH3nfnuToIKHVigbS0Y9jM9Ym9ikUH0JryPveKyvQJN8BjBondYoj6fEKc9
         VL1CuuBA+j+md4GEfsLA/NSb0lCkmgqeYG2rVnVN85kKeJCd2BPKIOAG6nKzGMk2evJZ
         PPUT7Bs/f0DhvoLP7ty2Iy8frwDoLqR8SmBvODnp9AZwzGuro2Ztp6/PA7OsORmT7WhD
         6zGPisIj728xaX/ws4Ta3m3WA6X5xUQR9g2U7m4oWspvL+hWnCNgzkTl6EFMMAnnNioH
         Qfgw==
X-Forwarded-Encrypted: i=1; AHgh+RrQpj3LycocDiTQosR2J4YLahS5qgEHMz9aRP/3KPrWC9m5KsaVqcpRZuCl9gZmbgMM2Axg2tYMQaY=@vger.kernel.org
X-Gm-Message-State: AFuF++l6Hu6OMEXPXN3IH9arTF+tX0PaBRbEmlvkGBaF4nweoMrTMeK4
	eH/yJM04iOfrD3B3vfuDojx3keFdLqBAoWBgoG3tRruFP3dXidnzGp2Mv3S4zxnYC+ikVADEohJ
	Tj5YJx6ilLxYIr9tq7112BFzwgRAVD0A=
X-Gm-Gg: AR+sD13LWiJGsVcn0AtycS9umVvLCFW8eTzD3i+8h2c0XhiUlzKTOqLbPxaGTS6CyZT
	zR8ODF+lheQ9itMgJQYTsOheHrvtDDjU0cFZ7uTWCwAdo3gRFeictgJ/a04Padj7TJ7aVifdu9r
	GBTbtIbrBKE3Wmg5RJy224sL83Eks82fnhqr7PKEP6aRznlgeZDyCo5j/VdkRobegDeunWalRsJ
	PNm8DlxL0VoU7xTKFUljXF2PJhLS4VkI2mBukFUCzOUQ/iz1iy/FBfAGYbDC9Yx8Pe1VXx4rrzu
	OvFhyeGt/5OK4JghC0a5nkBF4DRetsXjlyLQxr5PJLfvTw==
X-Received: by 2002:a05:6402:3705:b0:698:8847:e2f8 with SMTP id
 4fb4d7f45d1cf-6a582ba7883mr23687259a12.15.1787584995174; Mon, 24 Aug 2026
 08:23:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALa+Y15zNhpubyH5GQgu_BHesrwRdH0B8k5cqT3o_U0h5A2e-w@mail.gmail.com>
 <20260822003237.88274-1-sj@kernel.org>
In-Reply-To: <20260822003237.88274-1-sj@kernel.org>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Mon, 24 Aug 2026 23:23:03 +0800
X-Gm-Features: AcwNN1UfGZhL6wlAt_EY1z_vCXyRGndLOrHHNLYnegIDLisoABbScauoZxjolc8
Message-ID: <CAN_Opa9dQsz0hA_-+SS7hyHHtrYu2esK2Cp5X=G-YNFr5vgVZA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] mm/damon: hardware-sampled access reports
To: SJ Park <sj@kernel.org>
Cc: Ravi Jonnalagadda <ravis.opensrc@gmail.com>, Kunwu Chan <kunwu.chan@linux.dev>, 
	akinobu.mita@gmail.com, damon@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	akpm@linux-foundation.org, corbet@lwn.net, bijan311@gmail.com, 
	ajayjoshi@micron.com, honggyu.kim@sk.com, yunjeong.mun@sk.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 22, 2026 at 8:32=E2=80=AFAM SJ Park <sj@kernel.org> wrote:
>
> On Fri, 21 Aug 2026 09:32:02 -0700 Ravi Jonnalagadda <ravis.opensrc@gmail=
.com> wrote:
>
> > On Fri, Aug 21, 2026 at 2:55=E2=80=AFAM KunWu Chan <kunwu.chan@gmail.co=
m> wrote:
> > >
> > > Hi Ravi,
> > >
> > > Thanks for the detailed reply.  The fan-in diagnosis makes perfect se=
nse.
> > >
> > > > Your series is based on the v1 substrate, and the way an event is
> > > > configured is the part that moves most.
> > > >
> > > > [...]
> > >
> > > Glad to hear v2 is on the way.  The probe-based model is actually
> > > something I encountered while building the AUX backend. When multiple
> > > sources can feed the same region (e.g. PTE scanning + SPE/IBS), the
> > > question of how to combine their reports becomes interesting.
> > >
> > > For example, CXL tiering may care about physical-address locality, wh=
ile
> > > per-process monitoring may need virtual-address attribution.  How do =
you
> > > see probe weights being determined =E2=80=94 is that expected to be
> > > scenario-specific, or is there a more general principle behind the
> > > weighting?
> >
> > Hello KunWu,
> >
> > SJ can answer that authoritatively -- the probe and weight interface
> > is his. Here is my understanding which SJ can confirm later:
> >
> > Weights are relative, and only among probes. A context can hold up to f=
our;
> > each report carries its probe index and credits that probe's own hit co=
unt,
> > so two PMU-based probes in one context are scored in proportion to thei=
r
> > weights, and that is where a scenario-specific choice belongs.
> >
> > What does not mix is a weighted probe with the other two sources. Any
> > nonzero weight switches the whole context to probe-weighted scoring, wh=
ich
> > turns page-table access checking off -- so SPE cannot be blended with P=
TE
> > scanning, it replaces it. Page-fault reports carry no probe index; they
> > credit the region's access rate but have no hit count, so under weighte=
d
> > scoring they are not part of the score either. Both coexist with a prob=
e
> > only at weight zero, where everything feeds the same access rate and is
> > indistinguishable afterwards.
> >
> > So for your case I would read it as: PA locality and VA attribution are
> > different targets and different address kinds, which points at separate
> > contexts rather than one context with tuned weights.
>

Thanks, SJ and Ravi, for the detailed clarification.

> Thank you for detailed response, Ravi.  Ravi is correct.  Physical addres=
s and
> virtual addresses wouldn't be able to be monitored with a single DAMON co=
ntext.
> The user may need to have a DAMON context for physical address space, and
> another DAMON context for virtual address spaces.
>

This also corrects an assumption I had about how the DAMON access reporting
model currently combines different sources.

I had previously understood the new push model as something that could
be combined with the existing pull model within the same context. I now
understand that, in the current design, probe-weighted scoring switches
the context away from the existing PTE-based access checking rather than
blending the two.

My previous understanding was therefore off. Thanks for the clarification.

I'll update this point in the blog I'm currently working on, which I've
been writing on and off for almost a month. I'm using it to document the
evolution of the DAMON architecture and the transition from the
traditional pull-based access monitoring toward the new push/probe-based
reporting model.

Thanks,
KunWu

>
> Thanks,
> SJ
>
> [...]
