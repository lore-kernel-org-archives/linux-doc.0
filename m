Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792692773FE
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 10:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768213228; cv=pass; b=RZTNK8upFynqjJgBbKGCvUpN66MNvtVC5SgThtUSSQ6z7ZXC3+iEo9RzJleogE9mE9pxqu6uA3Y7jV9iZ7bgp/0BsOCz26UsOeMZg4qi/ql86Z15KeppLMaoVeip5qyDJMVwvbUtgYvhwG6miVvznUnWpAVbDeCq0IO8D67ybro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768213228; c=relaxed/simple;
	bh=gYHXiFLElUluIbrWA5o6qkz/fX9Z11mOZiGUFzm+f54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RB0bxVWi+EydzLezHdx9IV1QrMN+aN3rWwUKPelMDweMxBf59ZOhbnIiVyvKLpzW8arF8pSD1na4v04QMK1k/2i9CpN0Ld7HSN4fsFYDfgya0F/1SZEYpatN3hpNf7mAJCCV4XWXkXwhES05V2g6vpdVwyNhirzadhu0WQ9uPJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R5bzt+zQ; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R5bzt+zQ"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4ffbaaafac4so858291cf.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 02:20:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768213226; cv=none;
        d=google.com; s=arc-20240605;
        b=bZx2Vf1YCDev9BxGPaWio9Mw+7IZOwO13f4rcSjEfu+2tTNadJrE03TKOhP/8jd9wb
         B5VHy1xNpV+AL1EaVK99c7BtCeom+p69yi+nKaqq+dcifYLoVVzpxTcFpkGPoQh1wdgo
         jsYVO8Jr4cBzsiTSrSXqNekoPZXL9hqimWrxa4bCnvK84L+8G4JN2ZOOvwxEQGavEnAq
         aYMZSw6rAReOtACetjWAkKCGPLNEDwMAU4WKgRuRPfzqpJ8SfWgB+yHy/5gSrCteZMnA
         DtMttJIvOnKagTHY1SaJMKY3jtIS/8JgvokrW0e17ts4rRn9hIYPdszBKDWUplmgfIxG
         LYtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K81YAnOXZO5D4mYdCuhOxp178GZoWafY9YiJgFtn31w=;
        fh=0QLX6g8wIyhFHQao8ME7xjg5ntTzOvdNaDsstJBqUWY=;
        b=BWpsLhjFX6SL2F9UjoJ/rGVWTlgAsCZVsIJzwIEbPlxiLYYq17aqeS6MdonYK3GVg3
         Ozp4I9nWSFcdTkeXHLlnxwRv9HRRhci0GLyxQUW9TjmKmtiE/MGWyrbTpIiX7W2Mvdr+
         HE+mImgG2LheY7AknjRpVrA+Xb7xbF7d3SaAQa/rdwRfT+i+n9wQcoiOOUc045JVey1M
         CR8de3K6NZJII7LOdzvI0HEfuHrInbn+nzcTP6pBNAndj8plxK064DhiF5UPYA3qTeN0
         UgN+g7PQ1sacda+ld1vmGJEnFEHN+iEuuXyZR3NbeAGKrUoox20n+GblyfWrngGSANUZ
         Mh6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768213226; x=1768818026; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K81YAnOXZO5D4mYdCuhOxp178GZoWafY9YiJgFtn31w=;
        b=R5bzt+zQM2wW/p0K9zpVL/ClPklulDRD4dQsAxSik+ntGUWwDzjHI3U0mF9fQ4kMK8
         vmDZZUIBog6Ka3qDTjwQ9JRFPOkL8IlqlPmgsEEY/2qHaphA0xGukwwl/yTYB4E2bOMC
         NnzghGYgzeAfJRhbQdQBasLGi64P666R/GfpkhcXAc8TUwR5b3npdD+pbmsXD2QhUj/T
         nqk86zK1klWeG30/vYw0nIfnEtilgdxmxTV95loq5Jlv/FxFfAvqpD0z/O7n3i3ScDlF
         DodNAUBHUUK+2Y0iA0UWcDW0mlhlIE+kMO+FmVgS6KApNUivx6DRzGLnyFeQeNcc9+Qr
         FHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768213226; x=1768818026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K81YAnOXZO5D4mYdCuhOxp178GZoWafY9YiJgFtn31w=;
        b=EVf/vNoZ43BCOYYzmMIeLdaf4onILxNZ/S5ctKwBbt4HH0/Igsq8Bzei4TNedVnIIX
         yRNhSAUX0w5ndHVV79a0gUTQXsrDuN8KKRy7q6fHqcmhixPvtdxV+FDco7LkwvzlkodR
         U9iuhM6FnKBMEtpbKgHfCd7myfen4+psyuApHklzsNZkVPpqRSb4qE5oPP0Oa0eDXutk
         T6ZycoY0El+9U67mGBE9n8BWGEtrfN/SrsOr4wZ7QgIe3Aj2tcyhdH1T0SGpCmPo/gSx
         SHm94e2U6se/O4PfM84ofB4Q5P0tLFKMKDBjK9l/12QqqAJ51hElYuJ0aEYbqSqtiATX
         GHNg==
X-Forwarded-Encrypted: i=1; AJvYcCVHZ4V7imlt10sHlloXsaegAMBZJgcvP/dV5Zb9ZmK9MlU48L+DfYy9EibtYSkPn8VjApAzEi1DbDU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW+1mbPP9/zmEGxFIrI5XvYy9jHn0fjlVwm0w2zKjxf3mmyoWf
	FrgK0FmH2+Rq5ngQuNSx9e66VentMeL4mLi5pfv0hpUdAnmnuZ1dGHzH3wEgDfgII3HvQUSTcYB
	2zapjLdS2WdX8+awDnXX/WSXV5KeVQEQSEXmlj2HzOvkWTc1ukn9Fc8lMa6I=
X-Gm-Gg: AY/fxX43H7/qbtTlauVuOHzQeDDSs+QK8cOo6yElC6EzEOhQTCQQ5Mv74m65vaBCL2p
	3Wj8uhfUKbXNolnZ/PUMZYVGQOLAexUNmnqA826VCXFK1jHmIdJBYUv3GUOdda7P+Elki5tiRh6
	uxW6YI0DeliIjEVVPQuMNbYiO3SHV4EZtKjHEDMLVH0Hynj/7DsMJQRYJrDmLoa3VDjK/JS0C6H
	ZBI0OBhX5+BiWHlDZ8koRUXE/B6r/XsyTEEyaeiGIDCe+TE6iLyJywMmjTfCvfs5TA3cl8wsGfK
	/vwZKCD8kvD9rWSB7VbxNRDEPw==
X-Received: by 2002:a05:622a:350:b0:4ff:cb86:eec2 with SMTP id
 d75a77b69052e-501197697e7mr18829141cf.5.1768213226233; Mon, 12 Jan 2026
 02:20:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109171805.901995-1-smostafa@google.com> <20260109171805.901995-4-smostafa@google.com>
 <20260109195111.GQ545276@ziepe.ca>
In-Reply-To: <20260109195111.GQ545276@ziepe.ca>
From: Mostafa Saleh <smostafa@google.com>
Date: Mon, 12 Jan 2026 10:20:14 +0000
X-Gm-Features: AZwV_QhBZadnJiyUFvTjuypzRI_tAKalJjtR7zhOZQkOyHcxgKv9-680wPv8WNg
Message-ID: <CAFgf54r_au6isA10Nrve=MHL455X=tKhNsSwH1ej-TX08J3xLA@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] iommu: debug-pagealloc: Track IOMMU pages
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, akpm@linux-foundation.org, vbabka@suse.cz, 
	surenb@google.com, mhocko@suse.com, jackmanb@google.com, hannes@cmpxchg.org, 
	ziy@nvidia.com, david@redhat.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, rppt@kernel.org, xiaqinxin@huawei.com, 
	baolu.lu@linux.intel.com, rdunlap@infradead.org, 
	Samiullah Khawaja <skhawaja@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 7:51=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrote=
:
>
> On Fri, Jan 09, 2026 at 05:18:04PM +0000, Mostafa Saleh wrote:
> > +static struct page_ext *get_iommu_page_ext(phys_addr_t phys)
> > +{
> > +     struct page *page =3D phys_to_page(phys);
> > +     struct page_ext *page_ext =3D page_ext_get(page);
> > +
> > +     return page_ext;
> > +}
> > +
> > +static struct iommu_debug_metadata *get_iommu_data(struct page_ext *pa=
ge_ext)
> > +{
> > +     return page_ext_data(page_ext, &page_iommu_debug_ops);
> > +}
> > +
> > +static void iommu_debug_inc_page(phys_addr_t phys)
> > +{
> > +     struct page_ext *page_ext =3D get_iommu_page_ext(phys);
> > +     struct iommu_debug_metadata *d =3D get_iommu_data(page_ext);
>
> You cannot do this - phys_to_page() can only be called if we already
> know that phys is a struct page backed item and by the time you get
> here that information is lost.
>
> Probably the only way to resolve this is to somehow pass in an iommu
> prot flag that can tell the difference between struct page and
> non-struct page addresses.
>
> But I have to NAK this approach of blindly calling phys_to_page().
>

The callers to this, first will check "pfn_valid", which is the right
check AFAICT (looking at similar patterns in page_owner for example).

Thanks,
Mostafa

> Jason
>
