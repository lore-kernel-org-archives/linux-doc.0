Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5723803C7
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 11:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768302673; cv=pass; b=DD5VRHXs1+bawTW9GU76Eqj+z4rL3yE3wsdsY8Ccyt6/FHApCT3f1dQxRAWbvN/LoTArFORsBcfb6zi4D7TZ/o65WOjmaCNxknk5e84yEDebR3/O4Jc38EtW2tHcTq0eSdCoQuZMbXgOL6apzffSI/SyA9UDCbwGY4oN7tz4QXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768302673; c=relaxed/simple;
	bh=ewyYSu4U4rDrQ6g5eP349UtA4V/L3pb9prshEHmDFQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HszU3xLWrtdt9P4VsPoVDNKfEFWKR1Tpxf+PqcuXxeRV35XzN2a+TTjzFUEJWsmjTFUFQjktwSQdw1O2+nXkz3caIjAWd3MetHF2IemmakLp2e0TneuvjT92UULOZdd2NC+F8gma25iTzqiUWk/R7Cs4qA/kFCMoFT+XM9canv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r/a7y2WD; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r/a7y2WD"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64baa44df99so8091a12.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 03:11:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768302670; cv=none;
        d=google.com; s=arc-20240605;
        b=dH3bxBbf+OzjdFgNetVs7bHQ0n0zSiK0XVIgfPM6mGqiwkEqLzMOyFy9gQKfJLS4tR
         BwpFtkcDTsTlsYbfIiAXA2vRI8UbJQGTzaDZL6OnDks/InA7K4M1B9tWZYpTcuEQT91S
         94NEexl8zuPwk4gtn3Hun/ViBsZ268SVvDiRwVHFiwXeg5Z43KxF9XFRCxrnYRTkiW19
         vu5VMjyQMms5SHLY8k4DaWEE5YFTvaiBPc8bHXVat4bxEmXnPLwZnQ8M6YFSmVUcm2+z
         FpyymeK14IV9+U6Btd01A2ApKPMDfxaiYW4mq/YlQy7zT+inlQZ/YA/rMUz2Nz9rT/VE
         SL2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KDqRWolsacePh3UOFidtjakTxzNfCPsnv6damvWujAo=;
        fh=mgws61OpaewN0Fvvt+Ndka9CCejy6Nl8M3iBN/0J53o=;
        b=HAB/8CxgjAHlKqKSig4DuoJeWuQ15tN2MWAMu/dftSIQKuiUpTJ1TTIrC0bPjhw9LS
         H1BJWK21xpTyHSnKWXXJWa2uk5kbLDIJXgvLFaXzZWSLNwhXrMjCGT/H0mWcq/9Nwkpw
         9LrpLzGQvE0EJ8VSq5uNC0QO88OVUd2NGVdDENlEJdkz4O8S1jG+BBfqjHmhTob+V9Lc
         NdRimrGo31eAmQ9VkGD9QMpSaIl9RBZ1BZRvz6kPhcSLcQ7/h9GsoKKl7B/ZaFoRkSO8
         cRJ9HYtnpW9Knro9Pb6nRYtyHi7l5BxfuJY+6Rc/ONHgndN7TQzlUlwNbKofRPSunA9m
         aqBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768302670; x=1768907470; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDqRWolsacePh3UOFidtjakTxzNfCPsnv6damvWujAo=;
        b=r/a7y2WDAO+oF55D+S3QKY05ijRaJbIT5oOIwI59GfasqXfGQXDyAQF78TMtzF6dO0
         SPR1HMepDIkXcSMvPWeDxtfr+Mrnu3QAPskTsRiAOsP8RIb3H3ZwqomaIU7pSraMU6BI
         YOXG3kPmvvw9V+UyH/JVSl5nBj96lQSlxgkQDhPBh+XYt1pl/npth/CP0mvd346mCmW2
         KTBu3+otejTvshGMagsxqgYkloxZ9w5vRRii4ijemo+lSd7UFEy8AIAsD0IQqPlhiaJg
         OsKaqDFM1BtA/9L01/VrxofkjEB86C+GpCrmpMzzaT4vliWFwgoXGDsQB9fO+fRqalMe
         VpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768302670; x=1768907470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KDqRWolsacePh3UOFidtjakTxzNfCPsnv6damvWujAo=;
        b=ZjPLq+Eh6u8R/a8GpwfKQ32lbOtNrNU6aeeMPbWubyW7cnNX6e/ATE8+eVqQlkxqkk
         UyEIhJSTVWjHa09W6XcrW0YinWIxTi6dbMozkZ6dxPVdSbSr3tBIWB7PIGjAOnUHGHU8
         G6oXmO6S6qGqyA3axLFhS5A8IRIcvacri64qZ21LXAhmyfmAUPigv1dinGUQxgAqrRFT
         VdDEdVDwUwHayZljU62SEpBi0hsOWebXeeHEHNr9oijBJnBhrg+VrzNFPtZ63l2krZyV
         Xd+zbOxhHPn9b+mUVHAb8Kvw0eQP9mW9bb12nJq4/t15kYZxY5hYanyKlUsCJV+2XOsN
         WZiw==
X-Forwarded-Encrypted: i=1; AJvYcCUSg13FZnzwtHHTcPKZ+yEZ+kr4B6tHSkkrP5wHQkF0qfAls0z+R81OfDVikv7ZRgRbEt03s1CqoMs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxviaopZA+kIIj9cXKlhpZDWoh/jDCKs1ewD3PHWPLMn77qQ2VT
	3DMI7BNn0/PqArkij01PTzCrbunCh0wxdOf2HiDNkj7fbeJDD8KmhXBwW/ML+/yf2BUp9v7mTzk
	VKYF1jHlk884rihcyXVaR69E42kxgESbD0fvlmk16
X-Gm-Gg: AY/fxX4uKJOcuGbghtlHLdUWyikKsIkx5q669+dbw5vYa77FNXPddEJbVp82KSx3W4c
	n+9QNbXmevCPFz7Cu7K9fV2cmjS7au4qcfEG5FKf4qGnWtAIfsyp2C7bKkaKS+Q5ZvYa6fxV8Vm
	93S4+RQ/Fh5kbcwJ7Bf8FtCbXFmb7aOLtTNArd8SnORmbcI+9LzIQ812LVnc8+al56uhO3l15dV
	7KJA/WiXcWMgbIT49h/L0hKb1rAMZNIUBTG8gLvsZTWPXS4eIiD2w1CWRQHS2zdrMpdjPXlDVpY
	S+bWIZFsZUMf4C7KnvYWHtKEHA==
X-Received: by 2002:aa7:cf05:0:b0:64b:53a1:7b09 with SMTP id
 4fb4d7f45d1cf-652f503ee6bmr32524a12.14.1768302669759; Tue, 13 Jan 2026
 03:11:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109171805.901995-1-smostafa@google.com> <hf3gfmaq673tvz6lc7mgip3m4y4o62b3nyqlofas252qr5776y@6oekozsrwea3>
In-Reply-To: <hf3gfmaq673tvz6lc7mgip3m4y4o62b3nyqlofas252qr5776y@6oekozsrwea3>
From: Mostafa Saleh <smostafa@google.com>
Date: Tue, 13 Jan 2026 11:10:56 +0000
X-Gm-Features: AZwV_QgEqIamUf-ZRcxgt46xlqga3cO4Nf6E12yZEj_ySpaNDevCFdZsj-pUJ20
Message-ID: <CAFgf54opD5qveK7njnCgkWeNYWSwiPHTxPBL2ouQYFEAL_kYKQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] iommu: Add page_ext for IOMMU_DEBUG_PAGEALLOC
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

On Sat, Jan 10, 2026 at 9:53=E2=80=AFAM J=C3=B6rg R=C3=B6del <joro@8bytes.o=
rg> wrote:
>
> On Fri, Jan 09, 2026 at 05:18:01PM +0000, Mostafa Saleh wrote:
> > Mostafa Saleh (4):
> >   iommu: Add page_ext for IOMMU_DEBUG_PAGEALLOC
> >   iommu: Add calls for IOMMU_DEBUG_PAGEALLOC
> >   iommu: debug-pagealloc: Track IOMMU pages
> >   iommu: debug-pagealloc: Check mapped/unmapped kernel memory
> >
> >  .../admin-guide/kernel-parameters.txt         |   9 +
> >  drivers/iommu/Kconfig                         |  19 ++
> >  drivers/iommu/Makefile                        |   1 +
> >  drivers/iommu/iommu-debug-pagealloc.c         | 167 ++++++++++++++++++
> >  drivers/iommu/iommu-priv.h                    |  58 ++++++
> >  drivers/iommu/iommu.c                         |  11 +-
> >  include/linux/iommu-debug-pagealloc.h         |  32 ++++
> >  include/linux/mm.h                            |   5 +
> >  mm/page_ext.c                                 |   4 +
> >  9 files changed, 304 insertions(+), 2 deletions(-)
> >  create mode 100644 drivers/iommu/iommu-debug-pagealloc.c
> >  create mode 100644 include/linux/iommu-debug-pagealloc.h
>
> Applied, thanks.

Thanks a lot! Based on the discussion on patch 3, I might need to
respin a new version.

Thanks,
Mostafa
