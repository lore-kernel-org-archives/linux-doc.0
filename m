Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38651245005
	for <linux-doc@vger.kernel.org>; Sun, 21 Sep 2025 22:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758493289; cv=none; b=Fkg+o+bm6c+QVTJJAR73ljyvrHECv89IdfaNn1AroWQ4MOuN53MEzxDPBNKmtn/CAd/km/cmGBHRupu0eZawSQM5m43ufxLkAXZ3uVFwCkz7d3ZPvSBVnp7KqNYTsQ5EZLQvajy/wtjMb2mTtLRIPsVcjGHOcXYu6jc9Me53smA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758493289; c=relaxed/simple;
	bh=6oei0aWXFhVRzFAC+ZsItJg6xnA+dZu9f+eLcagd27c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TxUsQ5ORQJ06rKJI79Xqx21dKfdRTR/LNbGnoyRLUY5/BAOncMunJ3zJqcQLCGR4CazinKSkU3mgR/zmMDszzeMVjYN9QwiLtdymsIxq/ykQLxRtlPaCQgTQK7KLKP+l6ky4SexRQMP/zDivgOIICx0Zeg7hwfdZULapwOAP8Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=PYp+qLmQ; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="PYp+qLmQ"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4c88e79866aso4256331cf.1
        for <linux-doc@vger.kernel.org>; Sun, 21 Sep 2025 15:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1758493287; x=1759098087; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHLyAWNRRvZ698aiszn9fxUOIJUP3t6BL2WpPwYPRag=;
        b=PYp+qLmQxDpcmaKJAmXMNT4GUpKlnhY6sJMKA98L5JO9raId4BOtZqe4WvAc8WA1zg
         tPLT7hLlrHPZWi7qcn9VILdX7yuKmgioYSnnb6UVNzkerEruUta/TsokQD6GY3314ZLk
         PpFK6/80wRa8dfWftRO3ku1Ayr/N3gSR1QeuLFUNLW0QEChYKfSRh4UDtSAy10HGjtFx
         8U15lT76FdDnIJqfvDxXx+5aBa/a2jzoc8JBxh6ggMbtcG3XqkYEGyRbJPYeEXA9ae9d
         mW9rrKbYxoZ2k9LtHic6v7oeBw3FTSwXE8PjL8G/hukziGsKDx+P5tU46dvcVEIuNl1J
         bDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758493287; x=1759098087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHLyAWNRRvZ698aiszn9fxUOIJUP3t6BL2WpPwYPRag=;
        b=g2zT/q6udKpIpUYCvyPBN69zXyFwsySJ6jO/zBwGunmX6BATHTzaE/ZvCzAlsNcAqt
         52zkEVRl5yhRSMIqWCn43K/AQayCJPYOWWqoi2nx317HUhLPVVn5RFWM5cKpX8LHEJYS
         6LsOf/r6JUwv4H9A2HDu2jSSTE6oI6bYpJnqkQzGeZ7rn/sWVHQDd7GVcziwQf2XRxDu
         eY1ZhlxWxCv0ajCHTCNFIEHaP0lNhcoO5IwyHC1kIqWJrXR7P20dSPlc9r6GnK378AYC
         0XNTP0wIgEE3gt0t073igHqf4nGl3Z7XW8XyVopf8tGrTcbsgAUTlitkUmVhzheFAuoH
         Sp3A==
X-Forwarded-Encrypted: i=1; AJvYcCUEDJ+dSf7gOZDQMEGNIHhVV/zgr4wqxQl1pwDnva8GBGSXpeqAzDkzQ2LDyVzPxXy8nPawfnFT6fE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwipAZ8B+/Qdj1BzbjdwDO6wN/ByhA1NIQp7cWZX5zY3yl+y7f2
	mgGPHk8CCkYl17ymVeDwrcayv6dfjkBstD8/MVGxEwJ/M6xOr4eHMEvCHw1h9OndmSzWzHWn4d1
	GXZbVA0HIM1wADzT0uNyDcj0pzdPlqAfLikkM3KGaMQ==
X-Gm-Gg: ASbGncuchI+JRNkm5kXcVY9BNA+/GrMVoRjMiNa7crrK1imaAAkXkJuX8d5It8BIZVb
	f4kF2wMg6ho0A3WnEfjg5YLJujNUSAgMbhZddHWJcf7khJ4PM2xtDpL+sT+RaxomI78FYtVG2WJ
	kBPfvxZT7IP0FvWE3PNEHPfloqHIKwt41vLX/B790QNJPLW1Xxousata9tyno+lh7R0DNgZ6kS9
	59SUZw=
X-Google-Smtp-Source: AGHT+IF9Bd/LCK7h6/iC83qqAy9wLiFHaZDvz7ruwA4mtaZ7EwXHPx8srwbwmVkArl3yVoSLBLTkv5dGYhCDZ5ZrJps=
X-Received: by 2002:a05:622a:4c06:b0:4ca:10bd:bae5 with SMTP id
 d75a77b69052e-4ca10bdc5dfmr21648151cf.81.1758493287147; Sun, 21 Sep 2025
 15:21:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
 <20250807014442.3829950-8-pasha.tatashin@soleen.com> <20250814132233.GB802098@nvidia.com>
 <aJ756q-wWJV37fMm@kernel.org> <20250818135509.GK802098@nvidia.com>
In-Reply-To: <20250818135509.GK802098@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sun, 21 Sep 2025 18:20:50 -0400
X-Gm-Features: AS18NWCcd-5oq0uHFf03h4LWbprCKHRBHh45SwiCRQil-ZYQKwKcHW5Zv6e3HKA
Message-ID: <CA+CK2bDc+-R=EuGM2pU=Phq8Ui-8xsDm0ppH6yjNR0U_o4TMHg@mail.gmail.com>
Subject: Re: [PATCH v3 07/30] kho: add interfaces to unpreserve folios and
 physical memory ranges
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Mike Rapoport <rppt@kernel.org>, pratyush@kernel.org, jasonmiu@google.com, 
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
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	saeedm@nvidia.com, ajayachandra@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 9:55=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Fri, Aug 15, 2025 at 12:12:10PM +0300, Mike Rapoport wrote:
> > > Which is perhaps another comment, if this __get_free_pages() is going
> > > to be a common pattern (and I guess it will be) then the API should b=
e
> > > streamlined alot more:
> > >
> > >  void *kho_alloc_preserved_memory(gfp, size);
> > >  void kho_free_preserved_memory(void *);
> >
> > This looks backwards to me. KHO should not deal with memory allocation,
> > it's responsibility to preserve/restore memory objects it supports.
>
> Then maybe those are luo_ helpers
>
> But having users open code __get_free_pages() and convert to/from
> struct page, phys, etc is not a great idea.

I added:

void *luo_contig_alloc_preserve(size_t size);
void luo_contig_free_unpreserve(void *mem, size_t size);

Allocate contiguous, zeroed, and preserved memory.

Pasha
