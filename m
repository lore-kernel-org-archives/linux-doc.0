Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156D0284672
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 17:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766512784; cv=none; b=Ko3sri3ALOApFkRNfusGzye4gWIuAsyk3ytc6348kk5zuo+7KbtC29PV/SkzIUWstcDB/QKJmIpr44qYhY76cEkEwf0TeaXZaDmuh7XKknWmGq/vg/UgZg8i8OmeIbUHM5Mc4EmVwAJ8jODA1WsnyGZD8x158JN8XYTrGe5fgRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766512784; c=relaxed/simple;
	bh=vYUJpGi7yPrdtWPgsk/g+lRQ3/29LPkAQNzk/ChMUa4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oBzj9sUhgq2oN1LlehD1AljUXa0KvNZqOhrV5PoWp2y7LsZ3ORrA+dj7ui+hf+wzcLQduhX3VVKa5+a6j4XLy7AK8ShsdSJzkhGaVhjHb0zEgJlyv5PSuRRRZ5lsWyZnSzfRGDtzjnn42V7xHOdIwivCthNmFJS9rH2GWnTUm+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=RqX6i1Sg; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="RqX6i1Sg"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64b9dfc146fso5661727a12.0
        for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 09:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1766512781; x=1767117581; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R53CMKldL+ao84ivaoLDo0FHwHdm/f6bhgTHaidoDBg=;
        b=RqX6i1Sg7sJLJI//wQce76oeSSa1SOGYiIFirbdAG+MOnk47Ufhx8kNfEQO41r4Vs0
         gTKh1EvQJ2x4/ZWtTmDoobnPvRBS3aJGWq3G9W4dnGkH9yjg2Capl0rDlxqtt2eHVUif
         8Smd9z9cr7ApmQgSqR425J2BgNaZ50b0vzbIhtFFJSaLVyVUrs5GgYlT5ajFTyd3zTID
         TgOv+McaVEDPtUbiddao/eOUH1WH9h3J2+pUIdpjTDi4JbYIUb5NF8KkWkAAQvaXB53X
         3JI5brmjyIhuRfZZjbv3rHO5socE4+JlShX91qUunZru5giitKTw8x6aUxT9M1ST/WJK
         zifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766512781; x=1767117581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R53CMKldL+ao84ivaoLDo0FHwHdm/f6bhgTHaidoDBg=;
        b=Lh0qZ2toQV0NzaK5YK+Ex2hQJXzKvtZyWmyJK5HZfPfkCAyPnmUtYJZzGwkfvIigZt
         wPXd7muY39jNuhNOgynF9iiWlKF4cb464Kt8Upbol5u7XG3ro+wsnW4wkTxxY1Rz0Llz
         e2AQwqHr8rQqdOgO7WPwN1CTv0MX89Lz1EFsjE7nDmZVdWRpsxeUsGh8211FbzgZl+KS
         mPZiqEGKv1bQ0fG2rveTnBNi2i1OwrSahJYacAuomQuZaqOaKksMgNtz9OgpzlShwa7x
         9YPdcKtSlBB0TbYlKiIt7LusPeeHFitbrJWngC5/e67+L6FncLaSFH+FXu9AhfGn+hSY
         lMjw==
X-Forwarded-Encrypted: i=1; AJvYcCXjuVlRb1mLjVwD7xL0BgTdNpcZxUyAX0om4xAMKeKsUpgM8GU7MKKTSRKdrb9AoNquUyUFLvNDUDU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNBU1bOYG0eSHoJu84Zx8Q4O6HwNx4rg81Nq408/LkqRp/J6z9
	zcmOVnsOdi/TwExoE434BcbYOzb6+CGY6EN/i+5OKinNUWpd68HrrXvDnYb3AXZXeOAlQkg/KRL
	y7HkRdpj7g9qR+czAtBIeKlLg033r0CUNHoxae5vHJQ==
X-Gm-Gg: AY/fxX6GSnaafZId1ZTH7zxU/FLHLGnEV1AGLMEBV53SSTpuog24yXk+mq04QQ7w/Zc
	1XXlR9r1hbL06bBu5Crk49f4UTCfqw5YMsKc2IP5tQfsI0Gnlfg1fSWM8RtHLO+5FMKFA0ZtLAF
	avV3iChHDC8ZOv2iX9Qdm4LHiz5Ct8SCvQCds6OMrJrNhQSdcws6XJj9+h0t0o72mxASiZZSXbu
	JPxqwHw/fjD3uAZO4SUVqNwEmbXRzeOux0YZS+QI3OF/SoHPWJIf2HNtZiKSlyKfDp7YjBDe3a2
	tMmXuhnnzu2dJGRJ0yzWB4uW/w==
X-Google-Smtp-Source: AGHT+IEIcVeNdEfJcm9VqUd+E8mWDB9V1hWp7w0giAMhCSKTNrPtcUlGUPRtf1huaKH0b5X5NkhBYKjrvd/UfQeEqC0=
X-Received: by 2002:a05:6402:13c9:b0:64d:1294:42e8 with SMTP id
 4fb4d7f45d1cf-64d12944806mr12214712a12.6.1766512781369; Tue, 23 Dec 2025
 09:59:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251206230222.853493-1-pratyush@kernel.org> <20251206230222.853493-2-pratyush@kernel.org>
In-Reply-To: <20251206230222.853493-2-pratyush@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 23 Dec 2025 12:59:05 -0500
X-Gm-Features: AQt7F2r0cpQB_ObkQOTsEIIl1kaIhEMZ8gs8RNljcXCPywOe6jERbxst1hl_vY8
Message-ID: <CA+CK2bDvaGmfkCPCMWM6gPcd4FfUyD6e5yWE+kNcma1vT3Jw3g@mail.gmail.com>
Subject: Re: [RFC PATCH 01/10] kho: drop restriction on maximum page order
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Alexander Graf <graf@amazon.com>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, kexec@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 6, 2025 at 6:03=E2=80=AFPM Pratyush Yadav <pratyush@kernel.org>=
 wrote:
>
> KHO currently restricts the maximum order of a restored page to the
> maximum order supported by the buddy allocator. While this works fine
> for much of the data passed across kexec, it is possible to have pages
> larger than MAX_PAGE_ORDER.
>
> For one, it is possible to get a larger order when using
> kho_preserve_pages() if the number of pages is large enough, since it
> tries to combine multiple aligned 0-order preservations into one higher
> order preservation.
>
> For another, upcoming support for hugepages can have gigantic hugepages
> being preserved over KHO.
>
> There is no real reason for this limit. The KHO preservation machinery
> can handle any page order. Remove this artificial restriction on max
> page order.

Before removing this restriction, please also add a patch that makes
sure that the calculated order does not intermix memory from different
topologies.

I suspect we need something like this in kho_preserve_pages():

order =3D min(count_trailing_zeros(pfn), ilog2(end_pfn - pfn));
/* Reduce order if the block spans across NUMA nodes. */
while (order > 0) {
   size_pfn =3D 1UL << order;
   if (pfn_to_nid(pfn) =3D=3D pfn_to_nid(pfn + size_pfn - 1))
     break;
   order--;
}

Pasha
