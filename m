Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F65F17BCA
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 18:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766082373; cv=none; b=pnMOmOXsTyJnVn33oly7ttMzPGsg5KjFybRMRdcSuvOganUgZsrV96b1K0cwbrjEkRMv6lm8fijar7TRPs3ZyCardxepupJ0935ucUAYxnihqclX9mMgsuTb7Gt1IrmpDrKn5P1V81RXPMI2UOqn1+EsyP+xwcN3cJ/PMUIhOAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766082373; c=relaxed/simple;
	bh=h4JEy2+nSexXTwRPMMT7RyiOUQeSt8f99+Upc0+2cfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i/0ZV2xBkQkVacQPrjXjw7ZYRPMHg2mai3oOY950CNoY7gLb72LjUd06+0YoaXSts+UINY6ftTNWwNNEcnCxVAQRlekYrGajDCjDA4+mT3/1rOxK7kb8KakvLoo1VH0ueJJPNsYyZ7qbk1fBXxpqs2xLGiml0Yrld/RmFDL5qv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=CzXN5l1Z; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="CzXN5l1Z"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b7697e8b01aso164371066b.2
        for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 10:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1766082369; x=1766687169; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GC3r3DONuA6YiYHbbshOdJ1QdT9pjrS4H1t+Tf2/8Dc=;
        b=CzXN5l1ZD0e3KCsUUKUBKi9TVNnbvAdYtB7JuwLUZzr4dfBSGa2nqCQWpWVTPcBc6/
         5CPq0RPKrLCkOw9cvsGvyUXGEPAkpxjwiaIHBzuq8DcCa28LLmzYMan22+2ystxbe7pQ
         aAu1g0/eykPqus/40843k7X7NkRKOz5knzhA/SPahv4/pxdyXkvzneTrSGBqYsbgJ607
         LFpizd8N6T/IC2OFBunHIn13BiiV8F0yv+fQ39p0wXfusQR1y4PiqyJ1UF081ljlFprU
         WJ/fseTxZ7qybg1iuPLi00iOszszGP6iggsaKh1WlGMEhdznHpnOdHy5Gb1XVaJOIguV
         8GQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766082369; x=1766687169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GC3r3DONuA6YiYHbbshOdJ1QdT9pjrS4H1t+Tf2/8Dc=;
        b=V2VJYheZQ15BhnkPTUAkU0B4QZykuVpd+PlHkgdqMsI42K+5U7dVSNmCy1nqaXacq6
         GXaeSyHQa5EZd4k8wrAKxPrHKUN1LmgRcAX9cPJNTjIzL1Q4RuGq02JTR21UVrLes9T+
         pZdd+CjTxYGKy/aia5fuc3JzcqtT/aj3qHgKHrsxqv4reSoLFUVLhHKWL7UVfo1i5D1f
         AlBJnQwSKuy041uYzZM5QkWS6RLga4m08JpOS3nBgfRQnYikSm8IQaPvG+82xn2TUlH9
         ysgPbKc1zJr1QsbPIJxBgR8JQZMHr8hu7Peajo/wZnX2ABWwZPl483PF9Be6ivtd7NTD
         g3FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh1MjAp4vvBBPMvLMzWjmEMhMwnbziklsMlsCbHZOC5q5CYhjAUGjkX8spamC090RbO+3eYYEBo7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXSab/LQjkqhGUZD3kdahO95Jw224OOqHHO2xyCJIJYh4EErHk
	qItOiqAMckc6DWxHJr0Ac0C+Bj9n2q6zIviH626y6d3U9eUxeDpJh5NZiG8q9aCH7L2kvRS7z1C
	FTSv5HmGa9PSNefn3YugD4QnDJlC5jQopaQsFgISsVQ==
X-Gm-Gg: AY/fxX6PFIjCPBvKN2smvYDs1BteepMi88KrxWsX20lOhlTpz0J7CH+bOxZa4SGvbCG
	VCgi3ER7loFlr3sYvP3VfXCCVzV0JQjpoppZTQGwkc3/60jHd1fXlDHF+eS9WufFUGOo7MQgc20
	32Q9U0huOmAbKFTX5XNh9LJE0lwQdMZ0PDf/BocwHUCrXx5zYtQo7vTh197ELE2QHyHLwNaEl4Q
	1bf73liBRD+kWlzONRuvZzLMfN0ziFPjasANKEvua+ZbChIy+YCuO6frGuZ/FBH/0HXovzttWUn
	OSFoaXXIOl8PUZ7qvjWQiLlS
X-Google-Smtp-Source: AGHT+IFh20zE9m6KKsAOG3M+Pqif8xuWAkUFhwAc91SRRrHGiKgAdsW/CjK47Vzc8ueDX+KUR1WPj1KgEP2GVUpEGTU=
X-Received: by 2002:a17:907:96a7:b0:b7a:1bde:a01c with SMTP id
 a640c23a62f3a-b8037218276mr24148166b.64.1766082368907; Thu, 18 Dec 2025
 10:26:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251206230222.853493-1-pratyush@kernel.org> <20251206230222.853493-5-pratyush@kernel.org>
In-Reply-To: <20251206230222.853493-5-pratyush@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 18 Dec 2025 13:25:32 -0500
X-Gm-Features: AQt7F2qAhKKkrVYXVy4sUEw468IovytUHMMiamVn3JrQ0uPWSbbBGhs6jJM9oIk
Message-ID: <CA+CK2bAV1y_LySjyj-wcn1cdSuVBdC+r+zQL7AQTY64nk3OxuQ@mail.gmail.com>
Subject: Re: [RFC PATCH 04/10] liveupdate: flb: allow getting FLB data in
 early boot
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
> To support hugepage preservation using LUO, the hugetlb subsystem needs
> to get liveupdate data when it allocates the hugepages to find out how
> many pages are coming from live update. This data is preserved via LUO
> FLB.
>
> Since gigantic hugepage allocations happen before LUO (and much of the
> rest of the system) is initialized, the usual
> liveupdate_flb_get_incoming() can not work.
>
> Add a read-only variant that fetches the FLB data but does not trigger
> its retrieve or do any locking or reference counting. It is the caller's
> responsibility to make sure there are no side effects of using this data
> to the proper retrieve call that would happen later.
>
> Refactor the logic to find the right FLB in the serialized data in a
> helper that can be used from both luo_flb_retrieve_one() (called from
> luo_flb_get_incoming()), and from luo_flb_get_incoming_early().
>
> Signed-off-by: Pratyush Yadav <pratyush@kernel.org>
> ---
>  include/linux/liveupdate.h  |  6 ++++
>  kernel/liveupdate/luo_flb.c | 69 +++++++++++++++++++++++++++++--------
>  2 files changed, 60 insertions(+), 15 deletions(-)
>
> diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
> index 78e8c529e4e7..39b429d2c62c 100644
> --- a/include/linux/liveupdate.h
> +++ b/include/linux/liveupdate.h
> @@ -232,6 +232,7 @@ int liveupdate_unregister_flb(struct liveupdate_file_=
handler *fh,
>
>  int liveupdate_flb_get_incoming(struct liveupdate_flb *flb, void **objp)=
;
>  int liveupdate_flb_get_outgoing(struct liveupdate_flb *flb, void **objp)=
;
> +int liveupdate_flb_incoming_early(struct liveupdate_flb *flb, u64 *datap=
);

Hi Pratyush,

[Follow-up from LPC discussion]

This patch is not needed, you can use liveupdate_flb_get_incoming()
directly in early boot. The main concern is that we take mutex in that
function, but that I think is safe. The might_sleep() has the proper
handling to be called early in boot, it has "system_state =3D=3D
SYSTEM_BOOTING" check to silence warning during boot.

Pasha
