Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3886438B7D9
	for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 15:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768838159; cv=pass; b=u/oDy3MHfjGhFBBREJ2JVOdmlg9pCEBmcrCufr7I8elj0aYG4nhj6EEkAUDPGD/RSR4fxSDgShLhQ+ylgPoWgBmqCnWKyHB2Gzqmq+0+wEOyW/iyaooCcdjgqi1c1+Skh0IcBuX5NjqATLUj1T4jEnW1Re5BtSzivVrefJrI9rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768838159; c=relaxed/simple;
	bh=oerooPL/kgCTBDoz7+mJmsEkb926v0K+H8Qy8IVf610=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o30MAgZd28ZijYGc7g2trb/TJgfnAd55uoT/ghDdRze1rkb3PJvFRCU7YR2gBSOU8+GbGrZlsvkAG9RZAjc1uHP7pXp6o8OD2c13BU5ZWuHerq+zgw8KXb2emVC/iQsDBUG/1u9aCZs/zYhPYNXSZIg2BCii4Pk1ZQWg5Hcd2p0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eJsm2F2c; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eJsm2F2c"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5014acad6f2so19371cf.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 07:55:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768838153; cv=none;
        d=google.com; s=arc-20240605;
        b=E2di5MJgqdIPvoQ7MQFWptB3CaKWoCUaDBAwGBohK8QMbu7fbffaQuETIsYEajkg7G
         zlWlJFWMFYT030isvI42lMwGxYhZRtmKtlQlo9U5arKMQ2FtqnM+NHV60w9PcPvWOLcf
         Crym6opLiDRZMM9+k4dhvBF3eGajDc0d0Virh5LCe6KCg8E62UjkFKtULlvpZH781eXy
         KjgxpxVl5ys0JaML+YVAkBdr6RJVtE1MyKgjyNrKcTpK4VDexNbLCDS/hxF4SL4gzfBN
         1AGWNMDNCgndTxNgH85dTZz8NIxmw6Uxf9gfLglhiCrIGwUO9uQYnzQTW4slIGrhufzg
         Q14A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t+CVQOz4f4pv4FZJxEWXVriYAxqFNoe7HY/c+6oYXd4=;
        fh=R+yhDQOru+Erl+tNNCbwK8We7bYbeQM4DbLYqQu9cko=;
        b=VXcZheaCYquTDK+BMCmj2o25Hgb1xOjDbf/yJFkFzoQREh4h0KFbDFfjdLj/DXAZvl
         3wYj3JoNGMSGCTF/99xpxLBGSPRba54MGAAKbeHs5BBSM5QyY/BYlm1st2+ff48RjaHb
         WS9aISIVr8OsXCA3Mz/QMzKc1uqEbZiGREsMiTxSGKqTXxorLItz+WYo1NmDX3GPAHXo
         8n2TLndcsh6F0u/tW0Fmrbaj25I0w9YuehsvaxdbWc0STGM17a4PBkh60rdA6FkJXLh/
         3uCn3E27Z9e+0aJxnBYVv2c/KIQj+TlCRdKmZvfEQ9oajsXsD1QODhfI6rBrC/uLZD2W
         G12Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768838153; x=1769442953; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+CVQOz4f4pv4FZJxEWXVriYAxqFNoe7HY/c+6oYXd4=;
        b=eJsm2F2ccX7gDDVhbDxhPRzTVqrAe2fEmMzWyGbU1QIrRDD3biOY207owNHb3pGH2k
         KAdBZqpBdSQd5RyJNMK4mTH5gw89EXI2ASPrkKysVCzh55b/jwObCrWtN1maQPnuUeMO
         XSn38S5sZ1slp1An5c1i58YyD3GCuC/y0hVVfw2+qpF1IAxf8zxvxQT3L+jrZZACAKIo
         fpLWqgI/hlMeZmQMptlNf0KsPJvunfhoQ3EDHBnraio27iVcgQIGbvoKbhZy6LPQMhTc
         JPXnFUD/CXkFB4a0UxIkqDElzs5uGDR1Naek/nWGBPXE0xfEL1xmmwBRKMl5keeXimZr
         lbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768838153; x=1769442953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t+CVQOz4f4pv4FZJxEWXVriYAxqFNoe7HY/c+6oYXd4=;
        b=fGbcUgkEC/pg/MO/YuFsnocbTcCk5FdkZFDWgfQejrPtzK2rgDHPqdp6aiom/djxzK
         X3CZqwxv3k1nmC9iR+BoI+EdtEOPpH/OREXbWntAKQ9WioHjNprnGmjWpM9xluu7oPxa
         DbaXr8+RTeRiEbfuq9UzJeviwcyjDDqbp5xHTv1MtFMyN4dfuLry/uxW891PVE7tDn8Z
         Fj5flUYgyAKfmvWmTw/DTAkXnJ6xaaGVb0Y4GUN0VnIFYmte+J1aV/quU/G4MfEsDG48
         cqqze6+uQmEId97D3+SEwEMHKSQxS3U+XnSIeV+LYQ1qEYrO++PU3nNiEaTWeu3cgmD4
         WMfg==
X-Forwarded-Encrypted: i=1; AJvYcCUPhA15SK6dRz9GoRpDHHmAHCUL/wbsofyDiwEPQLjtBseCFEgZJ2h7crZPEfffBaTOMwCROlHW3b4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJobdezqQXZ1W+mPCibp/s/CKG9QgJ6abj71PRCRQ1hwAhBvEk
	qFfbi4nurwSp3j+mnoUKoETOCmcpvJwNhkmpHEV9F8af7IqbZro6Ch0k+xG0vwLVnvRxWU5HIXx
	NXXMAf6+I7XC2asoioWYcAzZFlzYf872ClkkOxuGG
X-Gm-Gg: AY/fxX6uAe1PczCAZVjPOVtIKSoi43E489bcuuaXrtVhXdJypTw1QRnAATlf+x7WbYV
	+XPzEPH6sX+LsCjwiV9vbjsQubU5U6KKigjq2HCz33tCZWC6LiOp2m+VzexMCPFlqHo0KnbbP+C
	0/73BhqU2yboewn+0kfWULDc8E7+LrURe32A4faFfYWo8y1Aiz5u/uEJqxoL1MVe6Zple/VQv+4
	pu28qAuyBHSgzgr6VCSmJ3DLIaJwmjLfR/KzdcmX+G66V9v3B4rOdbc1URi57t6vUYOG2Q=
X-Received: by 2002:ac8:57cc:0:b0:4f3:5475:6b10 with SMTP id
 d75a77b69052e-502afaa0b9emr21378741cf.8.1768838152806; Mon, 19 Jan 2026
 07:55:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119142246.3821052-1-smostafa@google.com> <20260119142246.3821052-2-smostafa@google.com>
 <qu5oksvcaytolppeeale6rwf4bzvckvfdg3iw77kowrg4fn24a@p4hmieukkttu>
In-Reply-To: <qu5oksvcaytolppeeale6rwf4bzvckvfdg3iw77kowrg4fn24a@p4hmieukkttu>
From: Mostafa Saleh <smostafa@google.com>
Date: Mon, 19 Jan 2026 15:55:41 +0000
X-Gm-Features: AZwV_Qiw2HdJaRcL1F81HFaiwCNZCPdmUTScO3KLcBRCPXV-fWTgDvtVV_i5AzY
Message-ID: <CAFgf54pFzyAj5MKBx8xcuME-BGGWS1ZZLkw5vSgN8sGPftq88A@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm/page_ext: Add page_ext_get_phys()
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, corbet@lwn.net, will@kernel.org, 
	robin.murphy@arm.com, akpm@linux-foundation.org, vbabka@suse.cz, 
	surenb@google.com, mhocko@suse.com, jackmanb@google.com, hannes@cmpxchg.org, 
	ziy@nvidia.com, david@redhat.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, rppt@kernel.org, xiaqinxin@huawei.com, 
	baolu.lu@linux.intel.com, rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 3:49=E2=80=AFPM J=C3=B6rg R=C3=B6del <joro@8bytes.o=
rg> wrote:
>
> On Mon, Jan 19, 2026 at 02:22:45PM +0000, Mostafa Saleh wrote:
> > +static inline struct page_ext *page_ext_get_phys(phys_addr_t phys)
>
> The name is misleading as it indicates that the function returns a physic=
al
> address. Maybe name it page_ext_from_phys()?

I will update it.

>
> > +{
> > +     return NULL;
> > +}
> > +
> >  static inline void page_ext_put(struct page_ext *page_ext)
> >  {
> >  }
> > diff --git a/mm/page_ext.c b/mm/page_ext.c
> > index 297e4cd8ce90..5fe65a0ac4f3 100644
> > --- a/mm/page_ext.c
> > +++ b/mm/page_ext.c
> > @@ -538,6 +538,29 @@ struct page_ext *page_ext_get(const struct page *p=
age)
> >       return page_ext;
> >  }
> >
> > +/**
> > + * page_ext_get_phys() - Get the page_ext structure for a physical add=
ress.
> > + * @phys: The physical address to query.
> > + *
> > + * This function safely gets the `struct page_ext` associated with a g=
iven
> > + * physical address. It performs validation to ensure the address corr=
esponds
> > + * to a valid, online struct page before attempting to access it.
> > + * It should return NULL for (MMIO, ZONE_DEVICE, holes, offline memory=
)
>
> It should?
>

Yes, I can make it more definitive as "it returns"

Thanks,
Mostafa

> -Joerg
