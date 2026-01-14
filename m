Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5FB30EF90
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 17:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768412533; cv=pass; b=ZOEdCGztkfYtj187xtE0Ohq4ziIn8UAKwxME3bo5/FDBy9OpQHWHP5sAxHvVrGo1j20Ap2uqLnbDpC4a/GU1Rmu32SWotWnKSECmSHSfEuz8OvXGB8bHE2U6OPi+Me7SsjZCQOSgeer1k/g25ECQ5k7EA9LI93kYxdNS57tWi94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768412533; c=relaxed/simple;
	bh=bxYFRGiihJzuHMQSatw/LwdszSA9J1n2Vf27ur6aRQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HEUlZvqAJS0ERHzCsh+5cxbPcBk6lzlwZF4U6Aa+0LvOtbgEspdeagn4yytpejoh6VUpSwY3HIt55txrWpA5Q4AhkTMAAkRtmdxiLwKU8CpGtSz1OcKGyYtK+lQGcqL4KUART9XQCESvsQm8WzFFCfu2StG2Xxum24B+XDe9mgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rK8+SkxT; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rK8+SkxT"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6505d147ce4so224a12.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 09:42:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768412529; cv=none;
        d=google.com; s=arc-20240605;
        b=lzfSGUh+Pv0tY19BW9KAet8kcJVJeN0qxE9VlqVGg4ivf1NSngx5wRnu4f9+2u48M+
         fL2rUVpndEATsSkLdOniJ4zkytsJ3XFG3mVDM7tzVNfTVH08oeyMIwARW7LzAevLrDvB
         ZL6gVXVaigE70/n92OI/J4kKSv9mCUsxR5L2X3Nlt30uv2ETI2AALFL5yqglXZ+aenQv
         FNHS9xqfJ9TY1wfb5dp343C/bFz65CWXfRrtipTtaD6MfNVUm+FEsz918Llmwpu/60Jr
         SJORw5Qngl2xGtq1jT5u3fNyjIsyJn8EXz9h2b7SIkLv0/EDMolN8GS3nzLkf5QoMe6M
         Z/NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/LvZuiuu1YEsxAfp5fNtmPk7deYxJACc8HafvMN6PKo=;
        fh=a7n3NrI6cHkK7eYIcQhJxZh/F0+FWo7/CuL+zns1NoY=;
        b=j3qceRNA3Md4CmdIOF/josz4vznowOYsH4FjyVrxNLHRzoZXI1SQGHlUepX1dkcZin
         y2o0fVRoUfaFLHepUUA+6NRCsAV0s7afnsx5NcBA4c9O+gJ1/aLWlLu6fRk7YUS5i8G+
         8aScLaJU86i2x2gsReSvP1+KZ6W0aqBgRO/wROJ/qF50mcTNW16Hg4OIwTeJprJyBcKw
         U0+vActlto4Y9SU5EjTwInMVphT8a9s916IUEqkTOG/1P+Aed7Jw/tQnjk06+k7+5hPn
         32zn8c3VbnvKlYgJW6ZkO3PQqCVDr+Be6VcVF5/rD/OUJbU2vBHNfvltTUtG5cWnJEOb
         puvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768412529; x=1769017329; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/LvZuiuu1YEsxAfp5fNtmPk7deYxJACc8HafvMN6PKo=;
        b=rK8+SkxT7neadHqNfgLEa2ScOcHE7UXM3Rw8KyMSI7X929RkxblNF0XOwd3YAW+lNL
         GUSgzIdJj1a5VHwgwwP5/5ZCyEU2MBdDeFqFbOaeZT86m7oXaCh5Ni5RZk5hMej3e+Mm
         74wvCQFpgdkt6D1QXYQorOojUFE96HHEBgcnhOcucwjVTMq2evU2Hok2HnsBO4IIueO7
         a3pd9hHf1yf5UtC1irutj1MiNk58pB++w79taKY6kjp61MciW2m5kXEAV4kkDr3yJnyN
         o/Cf7tUY/tS0Kuj8UQg1mSMvOi+ekTsyRtXuCWGqPRKPyDLJECeCcMKZ4SJexybW6Hae
         wLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768412529; x=1769017329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/LvZuiuu1YEsxAfp5fNtmPk7deYxJACc8HafvMN6PKo=;
        b=myq3IkapQe+e31AwuHETV+BrQmQe2w0BinlJnCDLvSIbXKLveD/eEqD134E4zQVFP0
         YeYE4d4QTTdgQQhduIXVZmaQbuVYoEh9grrVjI1JKqUPCRs83Ngt1BfTuAEuk+BnGL7a
         F6ld6NhvAEhhPEDBayPSZgXdVb7FWCQNwaDsIVPlY6PJILSCHe/OIR49oKbB6URQGho3
         n/mmPq6Zkhu27dFEVl09s50izOs9yEemHCoOCmdbx8QGd7xskNBK+BfdP3u7v5lxOvOv
         3CXrowY/Rrs+UnXFCN7IFbmZ3lzfO37/hSHr0PjopA4tyhhquZDp8nakb0MJKgestNUA
         u3iA==
X-Forwarded-Encrypted: i=1; AJvYcCVZJaGcN77AMIDWZkAT0TD/L/Eh8RXPnWRw7l6SoxgsJFWPqftAwIelvGlP4OXc7+um3Fm8HzQHIOo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo+0XZzBN2zOtc5Hg6LPMpbeQTCEnVRB0U3WOyB3F/kwsvksmA
	O8Zlu9MbxCUVa88OVvDyWoKiAkT7KAik8ZX2DehZxRjyxss+fxpjh6OwLvnde6kwqewJt7R7Lkv
	/8bwKZoP3ko0JY2xwSFIMkqU9HGJ4xZFWRtyj+7rp
X-Gm-Gg: AY/fxX4mp1WDUvyQcYGa4nTCGbPBqfEhvah2ndo/fIf2tCSY49LOhq7OXC0pfTerLUY
	1rds4XP85RIba8BGU5Cqi0RM6rBdtsCVKs5Kv4JKy+UO+6vWwbqY8XhV1UERHHPl0MnLoBisUtW
	VEaWogf+6jqSWe3XvIPjBswwpF1Hfl3cshu1jdbEYUMgH6V/XGa2ZafpTIycKHJ/YMNZzMcMyBp
	wxi3WmuRpOdIlR+WUqCNnPcS1YQOb9me3RkrajLcckrqWvFuXJy0sL0PDUtBxYRH85U+y8McwBX
	FsGV4XJ313+GiqXWedVTL09y
X-Received: by 2002:aa7:dd15:0:b0:63c:1167:3a96 with SMTP id
 4fb4d7f45d1cf-653edfab5b7mr33769a12.5.1768412528683; Wed, 14 Jan 2026
 09:42:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109195111.GQ545276@ziepe.ca> <CAFgf54r_au6isA10Nrve=MHL455X=tKhNsSwH1ej-TX08J3xLA@mail.gmail.com>
 <20260112133256.GB745888@ziepe.ca> <CAFgf54psxPrsvujStPNtrzxiKOsJF+aVrN7BcNxxmAF4wDmRXA@mail.gmail.com>
 <20260112135208.GD745888@ziepe.ca> <CAFgf54q+9Y5TtGJDB=8q_BW-0F=TM7zBbCcMzvtvr_N2WMnd-w@mail.gmail.com>
 <746f5adb-1d91-4ca2-8ae0-a2d171203b66@kernel.org> <CAFgf54pbkfdFr6biE8BiNKBnTBFWxXGmvxsZ0E+C1C44c9AW_g@mail.gmail.com>
 <482f2f36-e906-492a-a80c-987bf7359d83@kernel.org> <CAFgf54ovfnTHmMuZGk73SEEKsP3k-_exR1wqUE4W9tLYKv_iDw@mail.gmail.com>
 <20260113150828.GP745888@ziepe.ca> <f239e391-ac7c-4d26-ab82-4024a77ec3d3@kernel.org>
In-Reply-To: <f239e391-ac7c-4d26-ab82-4024a77ec3d3@kernel.org>
From: Mostafa Saleh <smostafa@google.com>
Date: Wed, 14 Jan 2026 17:41:55 +0000
X-Gm-Features: AZwV_QhTl513jAwSvXOQMjGLcpJF9UrikiS1WWDBCfp2vS9vKyi4pvniNQM3cAg
Message-ID: <CAFgf54pBAUm3ao-UJksiuGKtvv4wzRyFq_uKwLe0H1ettO4DLQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] iommu: debug-pagealloc: Track IOMMU pages
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, linux-mm@kvack.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net, 
	joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	akpm@linux-foundation.org, vbabka@suse.cz, surenb@google.com, mhocko@suse.com, 
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, rppt@kernel.org, 
	xiaqinxin@huawei.com, baolu.lu@linux.intel.com, rdunlap@infradead.org, 
	Samiullah Khawaja <skhawaja@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 5:30=E2=80=AFPM David Hildenbrand (Red Hat)
<david@kernel.org> wrote:
>
> On 1/13/26 16:08, Jason Gunthorpe wrote:
> > On Tue, Jan 13, 2026 at 10:49:28AM +0000, Mostafa Saleh wrote:
> >> Would you have a problem if we added a new function in page_ext
> >> "page_ext_from_phys()" as Jason suggested?
> >
> > Given the hidden complexity that David just pointed out I think this
> > is essential to encapsulate it in a function.
> >
> > The function must be able to accept any phys_addr_t and safely returns
> > NULL if page_ext cannot be used for some reason.
>
> Right. I think pfn_to_online_page() is the appropriate check.
>
> @Mostafa, I saw you already sent a v7, is the pfn_to_online_page() stuff
> handled in there?
>

Yes, it's in the first patch in function page_ext_get_phys().  After
spending some time looking into it, that was my conclusion also.

Thanks,
Mostafa

> --
> Cheers
>
> David
