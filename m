Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EDA4FDE70
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 11:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975961; cv=pass; b=rvuoQY18zVUqQyKCkrFs2tOAD8XV512TR49FshdL2FMKU2QTv6KoFw6T20A69xRdNGUX/lGrFBpiP4nFwOCSLNyKrf1EB3/Eemo+JzvP+MWWmlOunhjPOSTmr1UxFd3LxACupLOqCrigi4yXJRKtBXHJ12kpB6//w12rsKm2fWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975961; c=relaxed/simple;
	bh=oKg3O/9qWwL0S/n8isR5H6f1yss4N5Cz6zPMHFWqGP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CKWMzCEDlfyBo7Mmg97c52RJjmUPPEQL/lW6CIw8ZHWQaIMBjLedc4iP544yM9NjlorRo/8uDIsKgeJ4dQLQl2+MWS3XWasRn5bffviGUoiNndecFxvig+SSbsmvh5+9lpAozYzEiv3S8mHM1UP37r1Uiaw+RV60UkViC4pkpDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YJ3g7cjH; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YJ3g7cjH"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2db33db4de9so212845ad.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 04:05:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791975956; cv=none;
        d=google.com; s=arc-20260327;
        b=kqd5xPQsOgMDYLqjIq4MYhXrnscWwDZpsGJ83ihGo34kkFJ+4sjzlTAXl7II+CS7OZ
         D3lvDDBBInJh3DaQd2U1C5SLSiNw8semDKF/ff6myCVrxEBNwvUOwXy2Asa8eKKwx2Ql
         NMEc7FTGvN4aIEGG60Or0YOxZVs7/34l3Yyu+bX1TZmf9NYx/DEArLcglm3Ioddb0P+p
         ClzeqpEvOhX2klbQ7QNu8ObuI3V7dj9v80M/lcOMrx1SnQuvcUi9o7WhFpH5yDX3bZWg
         cMiX1M93xcSrEdtqeEHtsWDF04+x+NR4n8erXxCU4y1FXQx3tofqQ691y2clhcmKRhWM
         soLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oKg3O/9qWwL0S/n8isR5H6f1yss4N5Cz6zPMHFWqGP4=;
        fh=ef2xZHTLpRf0PiWmJoG7t4Gf+1dYNDRZUmENy2h7Yt4=;
        b=rIcVDEL55mJUdcHwPZnCGy6644r7ODNToBjttuRKvYBF0mMH2iHutSby6bKEx25UV7
         esevH+OjXVG5V9heoxD0cAhvQqWcNJ9bWK0QfVishqurBPv1B6VOPkOe8daNOmYcu9il
         oHciZ3XEuANfYwZlixp+OrT3wvl+Z1lLGpQ8MZOb+zmg852HRNcv6nRLv0cmbltULTDi
         fX9rqngcU4C3DAWPVwxQhk4BCxHAFgT/hKXPZcnVaZjKo+Xcs1/E2dDnraY6QM3SoS2y
         qVK4w/ck4dFidZCAOI0aAEULP6iFfoQ1ESAzzbMCpNMMsIQIhtJI4L127a6Qqhsw70xN
         /FDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791975956; x=1792580756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oKg3O/9qWwL0S/n8isR5H6f1yss4N5Cz6zPMHFWqGP4=;
        b=YJ3g7cjHMpm7TU8HvtpzJwSEN8H+q5OGe6ySUTtM/H6A5nduWlRHZJ/SoYWbknr+oR
         WxXylTt012xWuCK43avh36CpAlVfVM6XDBxYX6A/UiyHUWj/onilcDN02WyBWqGR/0LS
         wjto/T9bbfmolLeCoL7fKfNIvcgGp9bnyGaRh4bDWRIulY4qtm+Ao241Awqxve9VsSDB
         X4bq0qbqIAFVwVOLKmcgnLrqp1H9qRdoL0RT/fv3cseDN/64Zy4hhpvjccBUSeJmLjh8
         NVF16ZbmlIzEmI8pWK2ESTshLeWphtqx7OLEINl26D25miLzIV9jyp0gQdRfPeqAbv4G
         8Y+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791975956; x=1792580756;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oKg3O/9qWwL0S/n8isR5H6f1yss4N5Cz6zPMHFWqGP4=;
        b=kX4R2hFzy2FqEMTEY4HRUsWVVuTIuIXVpjp5wKuqgiYzO9Jipj4ddOKhaCR2scVAG8
         v6dulQ00pcW6/vl4UPJgy0s6My9Cy5KzMmjd8rZBcavxtnOIA2NCMyUpqGgZRpibfZO/
         MnI6gb9dI1f+iRSzwtJeVSjFKMhg9kaNFH20JM5qTKL7JCm3qXhtGS118R3gPW4e9JCt
         hwIHAc0/0Ycqs78qFqHhnyZT1NH4qXEn5mtjtCn3OVEOEoQsBL58FYrG05SbSfUKdYw1
         qcWeVqkIMhOYWzCFMCViuQSVhr8zn34RetKcc88Xe4/x0PTXS+D/b3ZFBYq/8cizrBu4
         uCmw==
X-Forwarded-Encrypted: i=1; AKwUvByB8Jj/1ENi+pD/pG55yaILnw81dbf3qDYcuzJ542+ikdOOq5dKG7TbfMxEOhgFSGXuK6T552Xk15U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJI8FLT9XtFAZC6YgvowNnH895NaM8A9s8GNTwh/FT8JtbfJbbS
	9vxi7uZ7IgzbSTDMDzsjwGKaM7FRT9hPoSDIrE9xC6p7eb2Gw0mL3a/Y/obBiz/tvPWdLLSEgtT
	s6PN1W/vXHqiDjNx+efWIl0UaG8tV6wK9LUtKSCFM
X-Gm-Gg: AYBFou0NIFxeRYy1oHzoFn3Ct2EKTdh6YHZ9uvwpPSGPyvWN0Q6Mhn84eMy+6j+Z2Wa
	mn9aXqd7qWM8mZRVJ0g5eTAWaHZDUc7ylyD2utQrLXJiBROHY6jaMicg2fNPpLreh+vKAzcHdjy
	amfJioXZmCCy/4XVsseGOw6V+vS82EAKx52jtja0MtYxurs7CJyumSK/1Yq3e56QYQMNjLB4xSg
	oHQIccEE3gd0N8k+kOYJJPnGX1MRf4jiqYl0/MoztEc1Pi/ZlHsNGH4Xoa9yUePQq0W69yd/mLh
	tuDALzq8AGnoBVfbJzmI005WLNAcRqOswgT5sLWD+viMIcCmF7fcu00P
X-Received: by 2002:a17:903:1a2b:b0:2c6:99be:9dd with SMTP id
 d9443c01a7336-2e939d0f5c2mr3033515ad.12.1791975955291; Wed, 14 Oct 2026
 04:05:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com> <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
 <CAMOZA0JaiKsRgDdjHkL_N+MshhcyLSv+cT9SzEbNsC_sumHvOw@mail.gmail.com>
 <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org> <4fda41ed-741b-4c5f-ae83-e3ea5a447441@arm.com>
 <75c229ef-ae41-4072-9c90-98d4779c52bf@kernel.org>
In-Reply-To: <75c229ef-ae41-4072-9c90-98d4779c52bf@kernel.org>
From: Luigi Rizzo <lrizzo@google.com>
Date: Wed, 14 Oct 2026 13:05:18 +0200
X-Gm-Features: AclHuK8XP34mfrE8lQUslMQMNc1nPr8ujKpQNMaoAI_u53qDQl4REr9J8L8QdAk
Message-ID: <CAMOZA0L6hWd=PYLF2PkYwMG11JCson6Wp4Fy9B3k3VC0Vt2R0w@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Luigi Rizzo <rizzo.unipi@gmail.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Willem de Bruijn <willemb@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Joshua Washington <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Michael Chan <michael.chan@broadcom.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, iommu@lists.linux.dev, netdev@vger.kernel.org, 
	linux-mm@kvack.org, driver-core@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 12:48=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 10/13/26 12:42, Robin Murphy wrote:
> > On 12/10/2026 8:43 pm, David Hildenbrand (Arm) wrote:
> >> On 10/12/26 16:45, Luigi Rizzo wrote:
> >>> On Mon, Oct 12, 2026 at 3:51=E2=80=AFPM David Hildenbrand (Arm)
> >>> <david@kernel.org> wrote:
> >>>
> >>> I had to call it something... an earlier prototype used the name IOMM=
U_2M,
> >>> but I didn't want to suggest that the design was limited to 2M (it is=
 not).
> >>>
> >>> Aside from the name, the _current_ prototype restricts to 2M allocati=
ons,
> >>> exactly because too large units are expensive and wasteful.
> >>>
> >>> In the code, decoupling the allocation size from the PMD size is triv=
ial.
> >>
> >> Yeah, we should do that.
> >>
> >> We should probably just find a way to describe that this is a POOL tha=
t focuses
> >> on physical contiguity in some configured granularity.
> > And since it's intended for DMA we could call it dma_pool and oh look i=
t already
> > exists...
>
> Heh, I did have "DMA_POOL" in mind when writing my reply.

which confirms that naming is one of the hardest problems in CS...
Let's try to figure out a good name before renaming everything.


> > Sure the current implementation is capped at PAGE_SIZE for allocation (=
and thus
> > mapping too), but I don't see why that couldn't just be made more flexi=
ble.
>
> That intuitively sounds like the right direction.

Point taken, I will decouple the allocaiton size from PMD_SIZE this in
the next iteration.

I have also followed up on most of Pranjal's feedback (stricter error check=
ing,
compact IOVA ranges, opt-in per destination on the tx path...) .

I am also looking at reducing some inefficiencies (e.g. pagepool already ca=
ches,
and allocations of new pages are relatively rare, so there is not much
of a point
of having a dma_pmd_pool per queue; and on the tx side, something similar t=
o the
percpu page cache to reduce locking costs when a page is allocated on one C=
PU
and freed on a different one)

cheers
luigi
