Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715BC288C39
	for <linux-doc@vger.kernel.org>; Tue,  3 Feb 2026 19:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770148099; cv=pass; b=UQhdkxVdE6jSO4HFdbKXy2mhJ2CJox3++thx73TYdPCdFukBGHqTohQ590dbl9x7jJEzDWyTjc0pJH4ouUDb7o6H1HvL2wWhwP25jrik/+A6ytDrmwk4fuH9OT8J/nJxa6vCZatVgO2GFijyZjafH3P8TCH8oZ2JXf597/lO/U8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770148099; c=relaxed/simple;
	bh=kNXxiUDQy1SVXfSeJbu09uShQ8mMvmjrjF4sRv0Rx5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hHo5yCmIv+Dq+CLrffmqiPW7qpZYTde5+iXZJryEw7teirKQ+/cIRQbsSK/glcuKA4ei2kNCIcjH4A2CfEiw3QmiD77ZonrEmeBdVSSAVeXo06s+XIPUGYn2xAsq34gX/XWjYYkVS8miaDNR3Xi01sg1yklOuwTc86VXbhTHnmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M8EFHXjR; arc=pass smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M8EFHXjR"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-124afd03fd1so9045771c88.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Feb 2026 11:48:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770148098; cv=none;
        d=google.com; s=arc-20240605;
        b=ObjUGfcyNzTsw0SUqLYI4k0v5NV0zffxEWGakb4NIuqyGDBcxfcAJpYXI3SQU3POtJ
         Ej+QThUjEgh2ANB5vN5xszm6b3fcNZt8pii0L3zvleyArAjnIS3rf0uWlSMbLE/SUJB0
         9vC3RFDhM/cUtQPjOqYNaj/gttnpX3zMh/n6FGmBrX3RkkjQpW8UPrHiEUf1v6WOHbjD
         m0KEtZCace+guiY4Tl7YRxB4hFWWD/mXcXxJMCcDghxUX1mIRn4NlBknHsvZmEdNe0cv
         3u0cnXkUpTc4PqTvfb1vOMKc2srZHYsr+CArBuSu1gR2OOgr0CMbgcfSDwO8Pw6BTRT7
         +evg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ljYXjREKDmOu7d2s7Y3SwTV+aN53dscZlpBmijYsyBA=;
        fh=jeRuJHq31cGj0D7EiJ78rqqy3AQjaW7ipaL5iFbPcUM=;
        b=DWT4Xz+Rwhdx1sSaWpzMt0afgf3wLT7KZhKYZIrba1a0vtUyvphaOVsI8Z/CZav6fF
         PlBxKqd0qDyk6egNOQxBEcfJJ5nNXhD4myrPIWpwPbRIy+cviaAfGv1pWu26NuWQfqU/
         DhmgRmEDN0gPslWDJfOnjG30i0JKQppNCD7Nz70he6jdhe8qFiGvn3HN9C0dj4zH1gBb
         UGfc9YAzWayq8k0SWd9ENBomY4Px0LUn0ErA5PU/S8qODZ1udNXiMBe0TRwvjw8POcR3
         wEdPIUgItuBEg2RWI0fW1XWmbiQ8hCBRvSxdbLIMlJAfHAIN+9Wwa/vwQrKvUaxoklus
         DVdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770148098; x=1770752898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljYXjREKDmOu7d2s7Y3SwTV+aN53dscZlpBmijYsyBA=;
        b=M8EFHXjRmdSzfDypzpbjYeroD/naEkvqHUtZGsK9MT3IINmdZOaANZ89y5/sR0cWHJ
         Ad9M395+zzsXOo2w5KR2djBI555Z7THYTGdjWZjQcown3rMIEBj+nSnZE8P9bAQUHcXG
         ImGfU8qTKKgtaTakdCtE8/bmcsWgxtZDIXkmJu76+lV3eQOiCszeiT5hfehrmV9doQKo
         FS63wHw8EpGHjjr7FiTfzNuK7WBjOEX+FHD+J3+Wx8/a/3F4OWxKKX0cEEvG461ZqrBs
         dGBVbuOPdY4uUMcljXEutUAKx8cejEgySKA2syqBWwSNCG6rFFtKx/4Yo3of5nUjHkBR
         KMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770148098; x=1770752898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ljYXjREKDmOu7d2s7Y3SwTV+aN53dscZlpBmijYsyBA=;
        b=ACAYh0myCpOmkWf3eylFOdomRMa7TQKgBr/UtWKIIxToikP+A4jVOS9DzqTvyoccDL
         jV8d0hcZGksdq61oPwYBT70mid+lBau/L1EEbeBeiEQ7cv6vmv9kBxrWAtDZPi7ACOIN
         QoyS3m71+UIJv5ppKYFp9H+Qu3YXGgzp9+LvzVs3ViN1OxluwLsSiu7p6SdANUuS8LXB
         WiHfsxkBFjL+9KlnEw9d9ahNLZxqAKBUtU2g4v4LYSAClR7QUKEeDm2WNpGsshNTO8b1
         WkSdg3+lxtmj2xd7CdhyrSYMx9j30u5v/XAHbs4UI8dZte9xI4691w1M5+8x4Ge1COYE
         oIpA==
X-Forwarded-Encrypted: i=1; AJvYcCVNdFahuMhiMSCm/EQRY5nXKQomMlP9kUpQX4ZKIfN1wJz8R0Xjp0Bx687+K3ukmjaVnCWti4kgI9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtACqRSHJ/J/w9sKjnjnoje24t8VsDe9dNRwnewtVpG0S67rDK
	r/gUdjXqYPJzRJR8oSEC6vABkLNEuRKnppzJzyjoGciYtlxJCW3zgp8Q03FbnvPS7Fa5JD4zg/l
	r/bVyPeTC+khitOj7A9GWSs4FRCGF3w==
X-Gm-Gg: AZuq6aIR8vqFR8+sjC/+twFwoCoV1YNmAxP4UqoveNyd7mvl18x5c36EN32YqvTPTwy
	PDwFNC7DngS0A+GnmXyaAUH2ZRM52EhefaVGOCd7wPkKGFwoJktIOfZqt8gUF5de+JYQqtGHe6U
	oDUtAG3CU8ENUPJtqpkAPl97HIaBpEvj4QuyoD6aPwLLB8d5XItv5OjCniR0G3k91hxFdIJGtH3
	aGT7wQErknuMikj2MuXOuJZ5lXtXo0ji2o1/rKcfHxXGivs1FEuSPaVLs+3QlEwSWs1hwA=
X-Received: by 2002:a05:7022:6ba2:b0:11b:923d:773f with SMTP id
 a92af1059eb24-126f4781428mr242143c88.5.1770148097517; Tue, 03 Feb 2026
 11:48:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260130014807.51302-1-sj@kernel.org> <20260131195408.66514-1-sj@kernel.org>
In-Reply-To: <20260131195408.66514-1-sj@kernel.org>
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Tue, 3 Feb 2026 11:48:06 -0800
X-Gm-Features: AZwV_QhQ9CdPx0t0XZJXip2Lmrp6vOfL-d4v8wYJQjypSaPQbLX41bGGmoxym7c
Message-ID: <CALa+Y1475VSnrNTn-AQtTTnye+sdAGu9sVO0YMEtLidNW53_=A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/3] mm/damon: Introduce node_target_mem_bp Quota
 Goal Metric
To: SeongJae Park <sj@kernel.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, akpm@linux-foundation.org, corbet@lwn.net, 
	bijan311@gmail.com, ajayjoshi@micron.com, honggyu.kim@sk.com, 
	yunjeong.mun@sk.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 31, 2026 at 11:54=E2=80=AFAM SeongJae Park <sj@kernel.org> wrot=
e:
>
> On Thu, 29 Jan 2026 17:48:06 -0800 SeongJae Park <sj@kernel.org> wrote:
>
> > On Thu, 29 Jan 2026 13:58:11 -0800 Ravi Jonnalagadda <ravis.opensrc@gma=
il.com> wrote:
> >
> > > This series introduces a new DAMON quota goal metric, `node_target_me=
m_bp`,
> > > designed for controlling memory migration in heterogeneous memory sys=
tems
> > > (e.g., DRAM and CXL memory tiering).
> > >
> > > v1: https://lore.kernel.org/linux-mm/20260123045733.6954-1-ravis.open=
src@gmail.com/T/#u
> [...]
> >     Context 0: monitors node 0, migrate_hot -> node 1
> >       goal: node_ineligible_mem_bp, nid=3D0, target=3D4000
> >
> >     Context 1: monitors node 1, migrate_hot -> node 0
> >       goal: node_target_mem_bp, nid=3D0, target=3D6000
>
> In offline, Ravi enlightened me that using a single context with two sche=
mes
> instead of the above two contexts setup can be more efficienct and useful=
.  I
> agree that.  It will be able to only single kdamond, and there could be m=
ore
> flexible use cases that can use the whole-memory access pattern.
>
> That is, we can use single context with the two schemes, but adding a cor=
e
> layer DAMOS filters for applying the schemes to only memory of node 0 and=
 node
> 1, respectively.  Similar for memory tiering use cases.
>
> But I was recommending the multi contexts approach to people because the
> current implementation of DAMOS is not efficient when both quota and core=
 layer
> filters are used.  I was actually working on making it improved, and just
> posted an RFC patch series [1].  After the patches are merged, hopefully =
the
> single context approach will be useful and effcient enough for varying us=
e
> cases including the memory tiering.
>
> [1] https://lore.kernel.org/20260131194145.66286-1-sj@kernel.org
>
Thanks for providing the DAMOS_FILTER patch update SJ.

For v3, I plan to introduce two complementary metrics:
DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP
and DAMOS_QUOTA_NODE_INELIGIBLE_MEM_BP.

This will support the following approaches for hot memory migration:
1. Single context with two schemes using both metrics.
(along with DAMOS_FILTER_TYPE_ADDR)
2. Two DAMON contexts each using
DAMOS_QUOTA_NODE_INELIGIBLE_MEM_BP.

Will provide more details on the implementation and usage in the v3 series.

Thanks,
Ravi.
>
> Thanks,
> SJ
>
> [...]
