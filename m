Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610DD17FE
	for <linux-doc@vger.kernel.org>; Tue, 20 Aug 2024 02:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724120532; cv=none; b=q2VK2PQZsXYZuwSQS7lalNYC0UR4C6nI1rdl1V68t5mztnq8ubXPzR7VrBoB9iC5HZ9G/EJD4U67t9NMDeVC4+2GVC/FL0qWuX8ObTcUk7KWQ3y981tJ12wYKclpIy6pnqfnTDISFAzOPT8UgkYKsnamhg1ULwi45WFM4ReOuRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724120532; c=relaxed/simple;
	bh=TSnk6AtWa28c59UrW4je/4+rOjKmL6E2erc9O4TAePU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LfuBTB3UNDsTZ8Zph3V/WhdQlQjQIgA/6NigCJnISUsQ8M5x9+d9hg84m3aIkAQZfbWO9DkhHI/BDKSBHhDE3KMHHZkioi9lVMZ3eRES+J8sivm5ArBwvzkZUIY+/EED0xeurq3kywO1GXlbQPxUdJjKvN8oZ04rvcPgolRm+Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hBic+XC2; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hBic+XC2"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6ba0527a2e7so17309847b3.2
        for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2024 19:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724120530; x=1724725330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n9Q7vC9LFMPCk3qVQ7Qc1QgEANirFuPSlZqqwwUbx7g=;
        b=hBic+XC2Wu+Cb5FH8rh8OsKSeoWLOq7qjnFXvGU/5glX/Lz8UFhIvPFrlGvSDxO9eh
         JBVdcaY6pfkRY8pqAmWCzO00lIQuVlawwXs7RtyLzXrwozyCcMv5IWReVMxRk0wdOs5Q
         dD7xDUTBTOGNeymnKjzBlexmCOx1CBcfT78PfLQ8DqMjk9SYa/Gb5prWFFqduFrWHFYI
         xk6YduqHUaWnPhFexLFTGus1ZBSc6OfQNEJzmxGSlC+iX19PdHzriM8fEiONm2tZQ3hZ
         /ErRORNoSXSy8+RvneXWmnER5jq35LpiUSsouirkCrrBuYAdi5F91C9hnjDyMOrGYeGA
         QDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724120530; x=1724725330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9Q7vC9LFMPCk3qVQ7Qc1QgEANirFuPSlZqqwwUbx7g=;
        b=NO4DS9tluY7+/fqjhJpV5I97IIfOj1M/eCNhoBwNna0CD0aZ+K1uzI8Noq9Zy/PD9r
         gHpFQq33UuHNs8Scc1/kDGKBvLD2TKe5ai4QyM7OBcqsDDp1FP1z9k+SdBGxQ9wHs/hg
         ka4G57cJz22u6jMpZhmGGqxMLW1pIbrbh3CXNPlajPN8xonbEMfEUCWxPM0TRzHGtzlk
         vI2MKXbZQUQA5mVPn/AKSAs8w4b4BoMEqVZDweLowpzZXJ2Rq3/Cvt8TGTmxMhmzbX0v
         1noQDlRugL8KNdxuCCPHww4mqW42e94KkOmC8bBIxYd8liVDkyXnWpzwns0VzWubR95L
         zldQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbORcbKVQJsJQYfVc8Rz/M+UdjInIt2y2orfFb8Od62cedKLSfJJPAo1wJjCr0rtcVSLKlCvhZ6OUSy/BW/i1ijH9+bv3vIlwp
X-Gm-Message-State: AOJu0YzGq4UWrFNR6cDI/k+ETGMAPSNK+yACyYGI31Nd0uGcAaae07q+
	QHupaDdouzcrUvtCZKosVHr1owHRDu4YaGdjuVd7/ZSpODaopeCHA8Jd+WbDkSHlkQBdoKdUmfg
	hikN6iT4A6gq+gL2JAlR7GQhrHvLBhH1xQBDe
X-Google-Smtp-Source: AGHT+IGqv2dvKxmgA37AXYwXcqcy+VUarFEug/q6Qajf1/shsAVDJ2FVpYt5LV0ZKu34PjuRvF0l1baRqWG8DdWGDA4=
X-Received: by 2002:a05:690c:f94:b0:63b:d711:e722 with SMTP id
 00721157ae682-6b1b9b5ac7cmr168081857b3.1.1724120529883; Mon, 19 Aug 2024
 19:22:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819151512.2363698-1-surenb@google.com> <20240819151512.2363698-6-surenb@google.com>
 <ZsOeVSlToyhsyDGD@casper.infradead.org> <CAJuCfpH4yFw6RNKVDK0hqXQQhAhMsyGNp5A50E+c2PZd+_vOgw@mail.gmail.com>
 <ZsOtwhWC_JpgWe_J@casper.infradead.org> <20240819184649.8fc7da59f89290f716ae0553@linux-foundation.org>
In-Reply-To: <20240819184649.8fc7da59f89290f716ae0553@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 19 Aug 2024 19:21:57 -0700
Message-ID: <CAJuCfpHa_wfcbatEksuEZqWjTxvM0fc_SAdoBf74QYFipA+s7A@mail.gmail.com>
Subject: Re: [PATCH 5/5] alloc_tag: config to store page allocation tag refs
 in page flags
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox <willy@infradead.org>, kent.overstreet@linux.dev, corbet@lwn.net, 
	arnd@arndb.de, mcgrof@kernel.org, rppt@kernel.org, paulmck@kernel.org, 
	thuth@redhat.com, tglx@linutronix.de, bp@alien8.de, 
	xiongwei.song@windriver.com, ardb@kernel.org, david@redhat.com, 
	vbabka@suse.cz, mhocko@suse.com, hannes@cmpxchg.org, roman.gushchin@linux.dev, 
	dave@stgolabs.net, liam.howlett@oracle.com, pasha.tatashin@soleen.com, 
	souravpanda@google.com, keescook@chromium.org, dennis@kernel.org, 
	jhubbard@nvidia.com, yuzhao@google.com, vvvvvv@google.com, 
	rostedt@goodmis.org, iamjoonsoo.kim@lge.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 6:46=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Mon, 19 Aug 2024 21:40:34 +0100 Matthew Wilcox <willy@infradead.org> w=
rote:
>
> > On Mon, Aug 19, 2024 at 01:39:16PM -0700, Suren Baghdasaryan wrote:
> > > On Mon, Aug 19, 2024 at 12:34=E2=80=AFPM Matthew Wilcox <willy@infrad=
ead.org> wrote:
> > > > So if ALLOC_TAG_REF_WIDTH is big enough, it's going to force last_c=
pupid
> > > > into struct page.
> > >
> > > Thanks for taking a look!
> > > Yes, but how is this field different from say KASAN_TAG_WIDTH which
> > > can also force last_cpupid out of page flags?
> >
> > Because KASAN isn't for production use?
> >
> > > >  That will misalign struct page and disable HVO -- with no warning!
> > >
> > > mminit_verify_pageflags_layout already has a mminit_dprintk() to
> > > indicate this condition. Is that not enough?
> >
> > Fair.
>
> Is a BUILD_BUG_ON() feasible here?

We could, but I didn't think we should prevent people from having such
a configuration if that's what they need...
