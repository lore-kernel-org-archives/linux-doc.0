Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831EF7EF09
	for <linux-doc@vger.kernel.org>; Wed,  4 Sep 2024 16:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725467987; cv=none; b=Z/qdO/nIqo09NM8gzRRwysVbhIVWMzyNj5YwSngCs18/URtOarRTuxfErLu6L84oWQZy879CP8TKxKb3P8VbOrVPmbFo8d+uqIe/4fG+0Wx1o+BcuKJBRn826BZPAVTuU8Q30Cbze0H7uBSJlwTl0sV0dMz/UrCpbEXenyv2v0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725467987; c=relaxed/simple;
	bh=nn/g8cIBSnZ11bpaYzZZ8NthHY/+J2Dj+WTEu3myqks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z7CRxrL2Bndb3H5/XJwAlOvTj/LmD67OmEulTls/ql5P2JEhHAKSrxn9HBcW01nvKSeQSmFeY5516XLOzAb1DTTSeZzgmhiuPSADNHx7msJxtS/LM1dsKqtu8v9j/rdDGjTBU4cBtyF88MtfOzLji0ST9D6iKD5KjAn4Ky8LyKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4NDvVEAQ; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4NDvVEAQ"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4567fe32141so3131cf.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Sep 2024 09:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725467984; x=1726072784; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVKgBZWcIsT5jzi2Y61F5gCJD2ntfYeuhQqcN6HyFFE=;
        b=4NDvVEAQ/E8D7qwFNSsUh8b34gKbzyvh/WcZx7FL2DwEyQ8kQgOntCTawE/JmnYIH4
         as8YCcT5j/iAUc8uEl0x3oN7ArONbAxN80QPkiDxOt4Pc8upx5tdIk65JyBoIIZiLpXL
         D3a3bRnUPM4wqL+7IApmoo7TZjLXJ23PjIINwSd0Xs3Fojk3vdLbxBeCVzp0rERrj9GN
         wSyttTI4O11+IHK3+Vve0KCU9cBstD56K2QTnpjFyq55QxScQUcSqm5hg1T+UYUR2fB4
         jUAcZyAxxm2yJuCVXZl5F2V5R2BJrrvvQNOLEE/2CyowEULParc+4vZmgimIr9+KoVyN
         Nygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725467984; x=1726072784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aVKgBZWcIsT5jzi2Y61F5gCJD2ntfYeuhQqcN6HyFFE=;
        b=Q/TekF0yjY0dZtNbmoa2IP/xoaGIoQ7iT8Z9ra3mCgbUBM/v/wxXocs7btsvL7Un6d
         SwbRCbTDKhFyQMqNyJKHM422TEJDXnxqnPYpFfeRhQM8auo5Fuo3fteVz45R+8/WqNaT
         /46zuNBtHng22jnvN9qvaVNE83rA7ORyDUBMZ2gXXAb2s3b6tKJjyqTG4JEDmhomNBh2
         7q4FV9nKsqZB5B6gaLhFQ82OaZqLjbTVDTSfkeP8Ym148hfQU1y3zf5eiOVDTarZrFHF
         EahQagqiq1P7digSfP7b+VrWfORmxaU5DrrV+XOelwZQalGHEwccQDDWEXOs9Bdrj1rA
         MeDA==
X-Forwarded-Encrypted: i=1; AJvYcCUEu0/dgB3dRwiaXaxGPNp+LbteGrgEO50K7UgkypLmyGUO6V/29dCT/u5gHAyqvnyMlcKZ+tEP/SE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUixlSItB1RVrmFTmnFelOb6tsWM2dCKviLgtA8LPrJMoMT+36
	b4lYkaaoKM1mefYEQatbgHMky3McmCYW0FeuBRFbyF8m7fbhFvZNxXSTkMTlRy55j3OfAScHW/Y
	0TBsBzR8PaYR4yn1bp++lsEuP7G1o6RI1bQ/V
X-Google-Smtp-Source: AGHT+IGwhDrAQPEAmF0bOfcaTr6MOXUafuS1vP9sMQ9KrAbdAewI1zke0LJG2AKiNDfA445/E3iPPiTzSRTtLdtDDnM=
X-Received: by 2002:ac8:5ad3:0:b0:456:7ec0:39a9 with SMTP id
 d75a77b69052e-457f7a9c517mr3513941cf.5.1725467984034; Wed, 04 Sep 2024
 09:39:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902044128.664075-1-surenb@google.com> <20240902044128.664075-7-surenb@google.com>
 <20240901221636.5b0af3694510482e9d9e67df@linux-foundation.org>
 <CAJuCfpGNYgx0GW4suHRzmxVH28RGRnFBvFC6WO+F8BD4HDqxXA@mail.gmail.com>
 <47c4ef47-3948-4e46-8ea5-6af747293b18@nvidia.com> <ZtfDiH3lZ9ozxm0v@casper.infradead.org>
 <CAJuCfpHJ9PwNOqmFOH373gn6Uqa-orG6zP3rqk-_x=GkpUo2+Q@mail.gmail.com>
 <ZtiMZWqht_8Bse-5@casper.infradead.org> <keaqrfkkoswtpbtvr3l5oetd4d3ncbpaxsay7dckn74qdob2u2@lohq26fuccib>
In-Reply-To: <keaqrfkkoswtpbtvr3l5oetd4d3ncbpaxsay7dckn74qdob2u2@lohq26fuccib>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 4 Sep 2024 09:39:33 -0700
Message-ID: <CAJuCfpEtsWM2S0K=UB1QZ81qeq_5jY-R0zNz3Kc8WojvJfj76w@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] alloc_tag: config to store page allocation tag
 refs in page flags
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Matthew Wilcox <willy@infradead.org>, John Hubbard <jhubbard@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net, arnd@arndb.de, 
	mcgrof@kernel.org, rppt@kernel.org, paulmck@kernel.org, thuth@redhat.com, 
	tglx@linutronix.de, bp@alien8.de, xiongwei.song@windriver.com, 
	ardb@kernel.org, david@redhat.com, vbabka@suse.cz, mhocko@suse.com, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, dave@stgolabs.net, 
	liam.howlett@oracle.com, pasha.tatashin@soleen.com, souravpanda@google.com, 
	keescook@chromium.org, dennis@kernel.org, yuzhao@google.com, 
	vvvvvv@google.com, rostedt@goodmis.org, iamjoonsoo.kim@lge.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 9:37=E2=80=AFAM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Wed, Sep 04, 2024 at 05:35:49PM GMT, Matthew Wilcox wrote:
> > On Wed, Sep 04, 2024 at 09:18:01AM -0700, Suren Baghdasaryan wrote:
> > > I'm not sure I understand your suggestion, Matthew. We allocate a
> > > folio and need to store a reference to the tag associated with the
> > > code that allocated that folio. We are not operating with ranges here=
.
> > > Are you suggesting to use a maple tree instead of page_ext to store
> > > this reference?
> >
> > I'm saying that a folio has a physical address.  So you can use a physi=
cal
> > address as an index into a maple tree to store additional information
> > instead of using page_ext or trying to hammer the additional informatio=
n
> > into struct page somewhere.
>
> Ah, thanks, that makes more sense.
>
> But it would add a lot of overhead to the page alloc/free paths...

Yeah, inserting into a maple_tree in the fast path of page allocation
would introduce considerable performance overhead.
