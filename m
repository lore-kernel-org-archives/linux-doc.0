Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FAC204937
	for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2024 17:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729273553; cv=none; b=WXRqvtd08q1LjK0Qed33kzH9EGf+tuXy4EYIF1AWpS0t9y+lksXdG9HbQTk65RBiIrxDu1TUrvE+jYDvm6zHpl5AyMdhkKE6Xu6LcHoxzqQjN8TUvhzLWqVVDnCbbr+uLvgraXA9vgsPnXYnwnCfTNCzmpEwiytPoFAUUb33IZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729273553; c=relaxed/simple;
	bh=SUsv7tExHvjG2Og3roP3MX96s4t/7e9/sISX4/ZHQGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Id5SljH9gkB4oIF+OM0jm3V4VFYGBNBx2pox4VPrgku5kNapOEdD3sr4jZgAn1XQkh0+tOsjRypBhGmstymyMAZnA+VZn4nctEODpCdK5YNi9EnE99etiTBRDkfzBUj+HLiEAcgChPazyR4zDO5lM1pD6pXHPDMRH/VuyRY9VHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pxCbnTGw; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pxCbnTGw"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-460a8d1a9b7so20181cf.1
        for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2024 10:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729273550; x=1729878350; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HNohuL1u3Ke6VUFgUqBJ1ousiBndflpg7Tj2zyNChI=;
        b=pxCbnTGw3082a7QIPkSH7ooMYJOpDRjqn3+cr2LNcsyRSquGCEuQEpDfHqn4LMkLIM
         7KVskAAoo/7WVmiGqHPfIj80XNeQJadURYcew4ktJoN9/cJhaMWBEeAfzv45eV/sACdT
         CGGvXj2jh5QcIm95tmPDGAZGOll9ymZgPSjwiPVNGQogH0FQ1emnydtDm4VAkEm/HFdO
         lHEUbBoDJ/5i2RJI6OgbZHwjgtvgQ9aLTwrhkArG8sYpZ25VVWJxwqlUDyoWIRjnuzrV
         oBygtzMUFe2Q6pbmbxIAe6mmWrf50AJ/szyDrbjhzvmiikETUK5HKHLvhllPyMKui6O3
         yhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729273550; x=1729878350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HNohuL1u3Ke6VUFgUqBJ1ousiBndflpg7Tj2zyNChI=;
        b=L/XIQd2XiU/hJam0BeAzdwYNKGNGnB6nVA69R1K9zvoPEZQrTO+4cZC1mvUxSANzVB
         jS44dLn3HZi7bsT28gfZ9gsBd63ZE421xOuDGpRyWbdkC6isFqBZWwRc/hpZhBFojX1+
         ZpbtT1QKWdbnsaUL77uTowYtV3fXV0A93uNCL2iGrt2LY1xeKUNjU1WR23yAp5In8H6g
         AMitVgaXK5WO32Eg0nEn5R/6jSKzRxlSbE9pSMEA00QDaO/EUFdc0I4ljDwqLyOkbw/K
         iERebTxKg6ssA2nVxITn0N+VL2aOmhmJaS0EythWKyFD1R0ro3UtJ6jaDQ/BsD0nWO/l
         /9Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWRAoo+FioWQqDGR0xVkos48v9pBjz8ahaMcNMBhjuI4RCpg4e54KyLM9uFQrhK1z1+07hbHA/V/tE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJlUUWrXxuXDu6dv+s8RTusEjH5a7hoTf6+aVhilqcwhKGeTi5
	t04y1I2c5Thj7aoaNskZ6/2J8IyBiW9O3dWrPqKpM0jgPS5N4lwMUU9IBopLsOqVW/ROfLMdR0V
	CWg4zs2UorEYkSLqPPm7hF6/pFfJaP+zOiVTV
X-Google-Smtp-Source: AGHT+IGLh5tN3Mn+UeRjw6TTi6Ilr8u+U81XwFGNFN94aBWeUXT1vXcpiZD1WFcjvHGV6Z3iM3U/fjqB5uzAQX6cuG8=
X-Received: by 2002:a05:622a:2a19:b0:458:14dd:108b with SMTP id
 d75a77b69052e-460aec26827mr3223491cf.13.1729273550039; Fri, 18 Oct 2024
 10:45:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014203646.1952505-1-surenb@google.com> <20241014203646.1952505-6-surenb@google.com>
 <CAJD7tkY0zzwX1BCbayKSXSxwKEGiEJzzKggP8dJccdajsr_bKw@mail.gmail.com>
 <cd848c5f-50cd-4834-a6dc-dff16c586e49@nvidia.com> <6a2a84f5-8474-432f-b97e-18552a9d993c@redhat.com>
 <CAJuCfpGkuaCh+PxKbzMbu-81oeEdzcfjFThoRk+-Cezf0oJWZg@mail.gmail.com>
 <9c81a8bb-18e5-4851-9925-769bf8535e46@redhat.com> <CAJuCfpH-YqwEi1aqUAF3rCZGByFpvKVSfDckATtCFm=J_4+QOw@mail.gmail.com>
 <ZxJcryjDUk_LzOuj@tiehlicka> <CAJuCfpGV3hwCRJj6D-SnSOc+VEe5=_045R1aGJEuYCL7WESsrg@mail.gmail.com>
 <ZxKWBfQ_Lps93fY1@tiehlicka>
In-Reply-To: <ZxKWBfQ_Lps93fY1@tiehlicka>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 18 Oct 2024 10:45:39 -0700
Message-ID: <CAJuCfpHa9qjugR+a3cs6Cud4PUcPWdvc+OgKTJ1qnryyJ9+WXA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] alloc_tag: config to store page allocation tag
 refs in page flags
To: Michal Hocko <mhocko@suse.com>
Cc: David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, 
	Yosry Ahmed <yosryahmed@google.com>, akpm@linux-foundation.org, 
	kent.overstreet@linux.dev, corbet@lwn.net, arnd@arndb.de, mcgrof@kernel.org, 
	rppt@kernel.org, paulmck@kernel.org, thuth@redhat.com, tglx@linutronix.de, 
	bp@alien8.de, xiongwei.song@windriver.com, ardb@kernel.org, vbabka@suse.cz, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, dave@stgolabs.net, 
	willy@infradead.org, liam.howlett@oracle.com, pasha.tatashin@soleen.com, 
	souravpanda@google.com, keescook@chromium.org, dennis@kernel.org, 
	yuzhao@google.com, vvvvvv@google.com, rostedt@goodmis.org, 
	iamjoonsoo.kim@lge.com, rientjes@google.com, minchan@google.com, 
	kaleshsingh@google.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2024 at 10:08=E2=80=AFAM Michal Hocko <mhocko@suse.com> wro=
te:
>
> On Fri 18-10-24 09:04:24, Suren Baghdasaryan wrote:
> > On Fri, Oct 18, 2024 at 6:03=E2=80=AFAM Michal Hocko <mhocko@suse.com> =
wrote:
> > >
> > > On Tue 15-10-24 08:58:59, Suren Baghdasaryan wrote:
> > > > On Tue, Oct 15, 2024 at 8:42=E2=80=AFAM David Hildenbrand <david@re=
dhat.com> wrote:
> > > [...]
> > > > > Right, I think what John is concerned about (and me as well) is t=
hat
> > > > > once a new feature really needs a page flag, there will be object=
ion
> > > > > like "no you can't, we need them for allocation tags otherwise th=
at
> > > > > feature will be degraded".
> > > >
> > > > I do understand your concern but IMHO the possibility of degrading =
a
> > > > feature should not be a reason to always operate at degraded capaci=
ty
> > > > (which is what we have today). If one is really concerned about
> > > > possible future regression they can set
> > > > CONFIG_PGALLOC_TAG_USE_PAGEFLAGS=3Dn and keep what we have today. T=
hat's
> > > > why I'm strongly advocating that we do need
> > > > CONFIG_PGALLOC_TAG_USE_PAGEFLAGS so that the user has control over =
how
> > > > this scarce resource is used.
> > >
> > > I really do not think users will know how/why to setup this and I wou=
ldn't
> > > even bother them thinking about that at all TBH.
> > >
> > > This is an implementation detail. It is fine to reuse unused flags sp=
ace
> > > as a storage as a performance optimization but why do you want users =
to
> > > bother with that? Why would they ever want to say N here?
> >
> > In this patch you can find a couple of warnings that look like this:
> >
> > pr_warn("With module %s there are too many tags to fit in %d page flag
> > bits. Memory profiling is disabled!\n", mod->name,
> > NR_UNUSED_PAGEFLAG_BITS);
> > emitted when we run out of page flag bits during a module loading,
> >
> > pr_err("%s: alignment %lu is incompatible with allocation tag
> > indexing, disable CONFIG_PGALLOC_TAG_USE_PAGEFLAGS",  mod->name,
> > align);
> > emitted when the arch-specific section alignment is incompatible with
> > alloc_tag indexing.
>
> You are asking users to workaround implementation issue by configuration
> which sounds like a really bad idea. Why cannot you make the fallback
> automatic?

Automatic fallback is possible during boot, when we decide whether to
enable page extensions or not. So, if during boot we decide to disable
page extensions and use page flags, we can't go back and re-enable
page extensions after boot is complete. Since there is a possibility
that we run out of page flags at runtime when we load a new module,
this leaves this case when we can't reference the module tags and we
can't fall back to page extensions, so we have to disable memory
profiling.
I could keep page extensions always on just in case this happens but
that's a lot of memory waste to handle a rare case...

>
> --
> Michal Hocko
> SUSE Labs
