Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E8E29A9FE
	for <linux-doc@vger.kernel.org>; Wed,  3 Sep 2025 16:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756915222; cv=none; b=bwvpqraPAvgxDaioVybZYJjMPcoAh6gtriSmRVEDbD5+z+qFfx127hiM+BsnvFKiFvzm7OpEiEQRnREy+jo+wxaYRZ7RCSTWbB9+t4whOQFxoxeeIP91Lv+v4fauPcouZe7W+KH/UtY+sexfgSOcPb5n+OCBSBmclT34ZUM8w+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756915222; c=relaxed/simple;
	bh=VzTEB4bQWY8fWAQTgqOF+HS9WXqmiqpiTrodHwtJGNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nb4+1xYkZy9I7I42s5tRkjFYq50APAKP7glJBiuDjeebI4y1F85tUnzCy+wd1TyKaSLPMPeZMbkLSm+pWxrHKqY+IrXsL/xYfn6JmSOp8kaCG6xwjz6OVru35vNZbY62KsiaclIRtOaIxLWBsDbGuB0V+sBbFHx+4uJYKguGJB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=O9wxjTpF; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="O9wxjTpF"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4b3319c3a27so240421cf.0
        for <linux-doc@vger.kernel.org>; Wed, 03 Sep 2025 09:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1756915220; x=1757520020; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VzTEB4bQWY8fWAQTgqOF+HS9WXqmiqpiTrodHwtJGNM=;
        b=O9wxjTpFtggVhgmg/dADDBjOniauMEbfQ/SHgA5FT5kPLsxZDtzS5WVXlXiQPoYlJH
         e7xVnis3PS7PwsDCZm70i54D7yy9IrePgVvcfqs9jb3wuXm5slqigGlpnanb5YlJw9Mc
         B0hgRcRYE1F9t1hf0oWhQeWN4qaOfhj2ScvBDRvgiZA5tR6Zn1ynL9cAL0t7aOu+HsFD
         BqFZlwG5IPatyXp4j7sZVF7rm45rHV9GSYR3sHH9E3areJ6L8/4K6lTsuMFah3vcpA3i
         bTSewI5AvkaZg7Qw0hLiaQGRnSVQqh2Mab328n1BzodAFhl6Gvl2iWcVIhR/w3RLHqRc
         40Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756915220; x=1757520020;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VzTEB4bQWY8fWAQTgqOF+HS9WXqmiqpiTrodHwtJGNM=;
        b=NUnFKiWamH9TBIfhUeTNBJSg62rAxFsdUDK3tH6s23j0cJgeiUXASZHYzLdUdImpe8
         gHLjrwm40AfBdhoI8UO279e6xpCm8bem9hkm2IRNg6KZiZ6GWjSEjFlYWxPU5EGuF86o
         zHBN9PYTcsYV1ukS3XB7wL+SzIbeRrEaPy01brCgvuVoandfdKgvoQt2c65VoGSi4mLw
         +26fweSkH+hHJmZuRQ5V8UhMNdQ+3Wj9v7vSpKSNfTrwNR02toBJuITAvhCDagp+1+cU
         YhCPA8UZDii0JbT+XgaN7icmX9X6T7h11DnoNO+Z+hBm8Nr1/2YRmVmSRg9swyawbL8+
         5Wjw==
X-Forwarded-Encrypted: i=1; AJvYcCVgvmzUoYz1LCVmZgQDFpfP/MpHHhmBCthzLFxtvSEz+/EXMsPOIXNtZ3rin8EBN7o54qrRvl/cFJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXqYh4RAuPZTVZl1LESX2CiE9XMVc3LV3G2SB6vF+K6awfu/ux
	iYkMrteQm4i6W/H6XtQYs8aQeGkj3T9IKXrC+D3FptaWqnOsrsoQ4w0TPD5KlM70uaH5S0xAb9n
	v8XieZaO8K7knAX3E25/7sDrqmjsM0LLRYnQp8jhzYg==
X-Gm-Gg: ASbGncvHrGepFPsLg973J5aFLX40vpABIX6UTeHRLB4OmtoV2o9VUYqcNfOolcYXQ1a
	PbVDOR1NfN8sGlrz3cBB7++LVU3mT4ytuvN49pOIAewrLMYS8WYR31I/tflcECqiBwe8p+0VPsp
	W0zQCiGYnCTVj/38NQfGBixTmSCRyPX+Z05f3pEJzYLi46ENZ4S4+4G9MNXCa2ROG3tLSOWqSPP
	n5dl/pZQPxwOcw=
X-Google-Smtp-Source: AGHT+IEwx1LONda4kuiaJ848y4hM0OUKd0p1JeEharACFnO+JnUd0aS8iQNuarNBHObxQXAJhaTUSynWXDSmvzGvt7Q=
X-Received: by 2002:a05:622a:1ba4:b0:4b3:1197:b93a with SMTP id
 d75a77b69052e-4b31dc8f67fmr234759261cf.34.1756915218859; Wed, 03 Sep 2025
 09:00:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
 <20250807014442.3829950-30-pasha.tatashin@soleen.com> <20250826162019.GD2130239@nvidia.com>
 <aLXIcUwt0HVzRpYW@kernel.org> <CA+CK2bC96fxHBb78DvNhyfdjsDfPCLY5J5cN8W0hUDt9KAPBJQ@mail.gmail.com>
 <mafs03496w0kk.fsf@kernel.org> <CA+CK2bAb6s=gUTCNjMrOqptZ3a_nj3teuVSZs86AvVymvaURQA@mail.gmail.com>
 <20250902113857.GB186519@nvidia.com>
In-Reply-To: <20250902113857.GB186519@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 3 Sep 2025 15:59:40 +0000
X-Gm-Features: Ac12FXzyfAMIU2bzOrGlEX9a8opKhAuJo6gq5GdnRJV0XcXKQKHlYu1Dn3mOunw
Message-ID: <CA+CK2bB-CaEdvzxt9=c1SZwXBfy-nE202Q2mfHL_2K7spjf8rw@mail.gmail.com>
Subject: Re: [PATCH v3 29/30] luo: allow preserving memfd
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Mike Rapoport <rppt@kernel.org>, jasonmiu@google.com, 
	graf@amazon.com, changyuanl@google.com, dmatlack@google.com, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, rostedt@goodmis.org, anna.schumaker@oracle.com, 
	song@kernel.org, zhangguopeng@kylinos.cn, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	rafael@kernel.org, dakr@kernel.org, bartosz.golaszewski@linaro.org, 
	cw00.choi@samsung.com, myungjoo.ham@samsung.com, yesanishhere@gmail.com, 
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com, 
	aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, lennart@poettering.net, brauner@kernel.org, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, saeedm@nvidia.com, 
	ajayachandra@nvidia.com, parav@nvidia.com, leonro@nvidia.com, witu@nvidia.com
Content-Type: text/plain; charset="UTF-8"

> > > > The patch looks okay to me, but it doesn't support holes in vmap
> > > > areas. While that is likely acceptable for vmalloc, it could be a
> > > > problem if we want to preserve memfd with holes and using vmap
> > > > preservation as a method, which would require a different approach.
> > > > Still, this would help with preserving memfd.
> > >
> > > I agree. I think we should do it the other way round. Build a sparse
> > > array first, and then use that to build vmap preservation. Our emails
> >
> > Yes, sparse array support would help both: vmalloc and memfd preservation.
>
> Why? vmalloc is always full popoulated, no sparseness..

vmalloc is always fully populated, but if we add support for
preserving an area with holes, it can also be used for preserving
vmalloc. By the way, I don't like calling it *vmalloc* preservation
because we aren't preserving the original virtual addresses; we are
preserving a list of pages that are reassembled into a virtually
contiguous area. Maybe kho map, or kho page map, not sure, but vmalloc
does not sound right to me.

> And again in real systems we expect memfd to be fully populated too.

I thought so too, but we already have a use case for slightly sparse
memfd, unfortunately, that becomes *very* inefficient when fully
populated.
