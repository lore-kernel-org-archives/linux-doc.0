Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A035437121
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 13:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783951020; cv=pass; b=Po02jzA3CIp/vXyMR1Y7LA5AY8VV94Hy8T5T3EtAiaEjSMHYTy8oSg8JJpd3S8Lr6Qe2aNjuXybmSJKFca0LIDbhSHM5CO04RcpCHbQf4E4MRaLO1YNF0SulhMurZa2oNBFNx9M0BWi6uFWFbscAWcMje4nFlyI2Sl9GG14uKEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783951020; c=relaxed/simple;
	bh=P4M9X2beKZB5nvgfq/6kStGwmAj7ZUPjsmdqhUQHc7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U8NwbPg0xjvWC8y4FuwoLpgqDDOEWrCEXFnV4iV2VfUBN8MeRAb5MXx+R/tqdm6+AvG+b1+0qgynNcz6ATo76zOv4IkHdSoY/0XQn5WgOrxuXKDt9UvtCVT2PVXCa3tIBN7fDUovDEo16CpfCBWr0V/+1y/RkVQq+122eNQZNB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cUxdp0u2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xf5/ipms; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cUxdp0u2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xf5/ipms"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783951017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p7N6PlllbTvHO1g5IuTvCxlOA3ejXDi65k+Qzdhwvco=;
	b=cUxdp0u2W9lF52DXBLFXu4A+4aahnYuVwsH9kquJ+QAb3ZYbd0f/m98+drJpUZh/twUfns
	pxDCexLRt5slr+m+XdjEqRcCMCtSjWB3IFHug5J1dxUvRBIKgTNu2aZ3NOrlPduUzJv03n
	d7yZwycEqdHr94DPccRGCVN++2BMuOk=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-HvAGyZGNMOWN6-z_eUunpQ-1; Mon, 13 Jul 2026 09:56:56 -0400
X-MC-Unique: HvAGyZGNMOWN6-z_eUunpQ-1
X-Mimecast-MFC-AGG-ID: HvAGyZGNMOWN6-z_eUunpQ_1783951015
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-39ad42eaf7cso16237561fa.2
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 06:56:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783951015; cv=none;
        d=google.com; s=arc-20260327;
        b=TTA6oGnZ19QjUSufiColP/w29y2Kka9K2Gl5qyV5DfHkVbMmZSuT6fhly9S0nUzovP
         dYx7W4Fb5NzSskFX/QORP2+qMfI7XycUwNJtmZNlQ/GRZ39zAX2kXzDUEfVp3xv9hgzc
         5w+WZoLXd9vpum1RmIEOF8RKqys3ijZvhRDw7oAdew7ZB2/824x7uESaUcxYhAgJpWRt
         Fp8GJs1qRtlkokenpqMBS6FlFZwiWRSwOsOLZq7X8jGIOjluposGMPoD7y1zGUpHAvFo
         ls9mTRet+dby9mOohltz7z1CQTtmjaBmnD9naGwTgiVPpGc13oaB0/Y+5C+V2BOUC0Ad
         dEAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p7N6PlllbTvHO1g5IuTvCxlOA3ejXDi65k+Qzdhwvco=;
        fh=/sfdQ4tctgJI9ge/75sQ+t/oGeTjcxHtOQ5Z5MqsOqA=;
        b=ldx5icpPlaUPrwmDGC23j4j5y/cFa1XZ29i4UzL7XKSCje09Bub1VreCFRNcDCvUVv
         rqLQlIduTqfBQ7CRac1DN0BOmLFU2Gf5zfOqcxri11NtC8NK2jukjVSr3detPulexN8w
         SHTUOM/A2Af/bKZPjFwznvJhujClSdWJyK+50p6KyIWNSW5ZREQrT53aLogwul/cp3KA
         x1MgiQWJoU9BWNVThMztsXJDpUz8h/EBmGFzEKFpFpXHi6oyVdQscGd3M1tbl2cDf1Sw
         KUyEuqpOy7nyS0KAzkYKc8MblKjXRdiwkANzy05MKkSBts+TBAx1ROWMjo6IwjLXLLt6
         uKeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783951015; x=1784555815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p7N6PlllbTvHO1g5IuTvCxlOA3ejXDi65k+Qzdhwvco=;
        b=Xf5/ipmskWN4RT84qmT7yMT1vRc+tgww9M30XbRmjRBKt0ZC9LULLz/LZLWhRCTBl7
         Qm+faf6+RCcrMqgS/VkyrRH35NXTA64SNQBrmvAJi89bmA97ahpL8hHOvHvnoJZL3gAK
         XbUJsZJ2azw0QBBPOHCkhItD5I4mA/hN5qcbhgJlNxTrT92xR6XcZHCdUX76FztEi5qN
         mUaOS8xPmCGJupdyxuxKNIRS/wzXNQIO9YcX+kGPi7YQ/Qk+BIS0s92LtU49kV2Lh3en
         yeiJICbBDQW7aseKv6tdDl7m/plV5YyZHzU0lM/9X6PhGkMLiJaAoaOnwta0AnJGaNx7
         7UYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783951015; x=1784555815;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p7N6PlllbTvHO1g5IuTvCxlOA3ejXDi65k+Qzdhwvco=;
        b=blm0h2UEqAG9NmbaZUAIt6g1IrVGCNix1Tsdj30Icb14pWqyxxg9BMQhXjuNXbPseG
         BqSt1O70p6t91jE9D58SlMkBNxp0Lx4vZvj2sbOlanaGgrMdMKJTgzJjZt4V20BiO8kF
         6dNW+IbJKMVXMdz1ZFJecHjOcuB5Uw7dMKoX6fydVQ4APFWkHrLC9tZ8hBC77Hcxl6A4
         3d1TLMsOXd6tm/9HIV6x4kpjOIoW60epijCr/AzQXyD6vQZXE0md3gA/nIU7lHQt4ukK
         xQVsm6yq0oz3ahiw9FbCaJ+Cjc8N8MMklgLrYeWWhkz8CFua+cDYehAtRyxPMOAsELf3
         4+gg==
X-Gm-Message-State: AOJu0Yw5cWdczHCzp4U4+addTeHLPiYu49gjqLdhWGaZ/5xpEq2ka4wv
	fOkSkmmLxJbzcyf0olwkbgxsNThEIjd/HABJ1TMXTv5PkPEggG4pR32pX6Dx6tAQWcdl7Dn87h4
	FC1YkNA1bfKf/L3SSQ2qn6xGXzv4CSIwWCJpd7wovFL1HVsL/AqLaIjpC/YXgYp/x25pCBW9VFL
	Jqyzxy97FbRQShZDJcKP1nStP7aNtsPfc7hxQ3
X-Gm-Gg: AfdE7cn3NV14Ai6iQyP1Bb06rFWA8+Y5kL7zbp6WrY5WaHwd6hRtFsKJIQm4D6HFwRh
	8IW36c3Fzkou8tU7qIgaxPEJUy3ei0MM+OcQZKEYufdUHL1rHD9qyfgJp/c0QJNooQm4/O0X4g0
	TKnvj91ltrvT1Q5qkhWPskdRQHQApw+vPSp71yxLiFeq2B/t2VlnIRveS8GTZWDSEO
X-Received: by 2002:a2e:a5c1:0:b0:39c:9452:15e6 with SMTP id 38308e7fff4ca-39cae8a9999mr21110471fa.33.1783951014739;
        Mon, 13 Jul 2026 06:56:54 -0700 (PDT)
X-Received: by 2002:a2e:a5c1:0:b0:39c:9452:15e6 with SMTP id
 38308e7fff4ca-39cae8a9999mr21110261fa.33.1783951014291; Mon, 13 Jul 2026
 06:56:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706154500.39178-8-npache@redhat.com> <20260706193556.876676-1-usama.arif@linux.dev>
In-Reply-To: <20260706193556.876676-1-usama.arif@linux.dev>
From: Nico Pache <npache@redhat.com>
Date: Mon, 13 Jul 2026 07:58:10 -0600
X-Gm-Features: AUfX_mzCabUIlX9TQ3gRocALmiHePfG2uYgZVzFveFv553hugDtYsgls4Kx902g
Message-ID: <CAA1CXcDjNnPuensEftae0mVNPxgpt2xeMNZPYyb2HU_bOp5Xdw@mail.gmail.com>
Subject: Re: [PATCH 7/8] mm/khugepaged: clarify a comment regarding
 max_ptes_none check
To: Usama Arif <usama.arif@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 1:36=E2=80=AFPM Usama Arif <usama.arif@linux.dev> wr=
ote:
>
> On Mon,  6 Jul 2026 09:44:54 -0600 Nico Pache <npache@redhat.com> wrote:
>
> > While reading collapse_scan_pmd, one may be confused on where the defer=
red
> > max_ptes_none check is done. Expand on this current comment by explaini=
ng
> > which function the max_ptes_none check is now done.
> >
> > Suggested-by: David Hildenbrand <david@kernel.org>
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >  mm/khugepaged.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index 3c6f1254deca..388045a524a3 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -1728,7 +1728,8 @@ static enum scan_result collapse_scan_pmd(struct =
mm_struct *mm,
> >
> >       /*
> >        * If PMD is the only enabled order, enforce max_ptes_none, other=
wise
> > -      * scan all pages to populate the bitmap for mTHP collapse.
> > +      * scan all pages to populate the bitmap for mTHP collapse. The b=
itmap
> > +      * is then checked again in mthp_collapse() for each attempted or=
der.
>
> Could be combined with patch 4?

Yeah, sure :)

Thanks
-- Nico

>
>          */
> >       if (enabled_orders !=3D BIT(HPAGE_PMD_ORDER))
> >               ctx.max_ptes_none =3D KHUGEPAGED_MAX_PTES_LIMIT;
> > --
> > 2.54.0
> >
> >
>

