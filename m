Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18881E3780
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 18:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736276275; cv=none; b=EVoV12ajCUt+itE0Z8LnY1BbELi2wvXlUpAMm7WzWaWWrORnRMOD1isADx6DSnedxi9uOR2i/Sro/RSiv3s+lgMEVq8TgKfChUQ+EtoRyLiGMp1FlA3+ELSGHfw4Wyh1ltma0VZFE/nA5YmvwPKPC4MZTOdLhNvh4rW8Ax82HGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736276275; c=relaxed/simple;
	bh=6RosC7spea/Z4Ln7JJBYkYve1O+tfccniwaJSbI+G3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=owJ805uHhUftjYvwrnBL8ewSnVZA1S1VgSf21pQ27r/dKWyyL+4C658SG/EvXFHaRmWeJlkK3rA20jcpgD+k2WIGUVFCqEc9oujxU05BjUEs9WY0TyhlE5O+8y9qJ//2nQF9aoX6gr/N+yBmqSSrIDSCqj+PYYLs0Gl1w3DZ/B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xK1Rtmab; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xK1Rtmab"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-467abce2ef9so26141cf.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jan 2025 10:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736276269; x=1736881069; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5SKBIPKKQgLIfLRfxxGHc6EYpdKJ7CBBxCscjczO2DE=;
        b=xK1Rtmab+9zhLLuk0qQyRAectYJ3gBEQO+sL8u3PsxbRBDyAnmRoMSXiZNfr9Xum6C
         tfF3/JBbd2/PWid++tauunLVScqXqyoYxzma4+7meF1T0Mzd3N/58JPy5DbI2jbOIm90
         lCLm7Vct3daebzOUl6Eb0+BUf+hXEVQNXzMi6iHM1q4kIApAXvxQtySICZGVCs/lJO3w
         62c58g+2HKbmYONzq8bkjooHT/nq7EhhQXvtb+H4RY3ukb8a6vgr8ynVLP60EcorCKdB
         t4xj1r6icF1wxXgfHGrA+093KbxWFUdt48y3++CjvmUDhAeLZ8XRBNXFyWgEMo9bQ2c5
         7EDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736276269; x=1736881069;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5SKBIPKKQgLIfLRfxxGHc6EYpdKJ7CBBxCscjczO2DE=;
        b=GVL0+n6l/NQBKI4LoXaZnG/a9LF4vqlVvRbmgYoqXdvH3f090l4+21MYnUTmfO4Ik8
         i/09MMRO6OdFeUpCdMkrrZUpRzuNbrVhiAAOyQAufWB6h5dtDpzR67xysz9pAQR3nE3Y
         P5UImjzjb9yJQdpOJKETpticKB4LZ5Z9sp8sv4+pNBNCcDA7BcU8CV/A/190IDU7n57r
         i1ZEgWQR7MpxlJuIe5mDjQFO0v8S3ZDzecJ47Pxh8NYnxqmlWn2yakxM67/pav7o0A2O
         XnCktUV8WlcPVQic0IB0qRAtniH6y7HzsizdE/HxPfcz2tMg2Sy3/PSP3XgK2dnksQD6
         tfbg==
X-Forwarded-Encrypted: i=1; AJvYcCXcIcRz3fkxf6z1EEdZMkTSMfnBtonqtGJxDoNAzdAuP5Ksnqq8v8ksr9pAvwIO7lDrqPSPHg50obU=@vger.kernel.org
X-Gm-Message-State: AOJu0YypKtlTtCn8wBewnVKRwRlGn2wcCk87joWbCbllNQQ5DIpl23rh
	Pn+JTCYTBt6TiH6FQMb/wUsWlbZeoDja7c2QmhuOwvR6A4+7cs2Hr01jLXr4tH6qTY0FUiOWsI5
	TklIDoH80vQgokRb8gGquZApe/Re+d0hc3mrp
X-Gm-Gg: ASbGncv9HnGc2wNkVbzbARKcgLVDwCzulNBXvLfG5ikv6BwrlSBeNy6dsDnSV0vax06
	OlXEFs82q40dAR8AzKsy07SBfaSd75aZeAGGn7nah3IK2l+CSZKgic7aDKgwgEtak9azZ
X-Google-Smtp-Source: AGHT+IGu4eKfRmNuFlGQoAQksrtyJ2U/WzguxcOe4y1M95GhtYiONOwbXdNo611kinV+njRzcew1cXndvH0WR4+7TSo=
X-Received: by 2002:a05:622a:ca:b0:466:a3ed:bde7 with SMTP id
 d75a77b69052e-46c70bd562bmr47881cf.6.1736276269196; Tue, 07 Jan 2025 10:57:49
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226200335.1250078-1-surenb@google.com> <xzbyr4v4jhxjovjsbsqikapqddkwyh3sudm3dd3rvxjgcoayda@xqyebxeynnya>
In-Reply-To: <xzbyr4v4jhxjovjsbsqikapqddkwyh3sudm3dd3rvxjgcoayda@xqyebxeynnya>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 7 Jan 2025 10:57:38 -0800
X-Gm-Features: AbW1kvbU2YZNkojjppL04xsN0Y5Tj7bZ5w4ozFnvPURcDIO56GPnHZgG4vWz0Qo
Message-ID: <CAJuCfpFKWZBLHbgH1dDNPo+6jnz4j4e9qOeKVh2Qy4JYuic71w@mail.gmail.com>
Subject: Re: [PATCH 1/1] fixup for mm/debug: print vm_refcnt state when
 dumping the vma
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 10:50=E2=80=AFAM Liam R. Howlett <Liam.Howlett@oracl=
e.com> wrote:
>
> * Suren Baghdasaryan <surenb@google.com> [241226 15:03]:
> > vma->vm_refcnt does not exist when CONFIG_PER_VMA_LOCK=3Dn, therefore
> > when CONFIG_PER_VMA_LOCK=3Dn and CONFIG_DEBUG_VM=3Dy we need to avoid i=
ts
> > usage in dump_vma().
>
> It might be worth having a function that decodes the information in the
> vma lock and outputs a string that spells out what is going on,

You mean something like "attached, 2 reader(s), 0 writer(s)" instead
of "refcnt 0x3" ?

> and
> another that just outputs "not supported" or something.

Do you mean we should report "not supported" when CONFIG_PER_VMA_LOCK=3Dn?

>
> This has the benefit of spelling out the state and only having one place
> to update in future dump_vma() changes.
>
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202412270328.HiJX1mRt-lkp=
@intel.com/
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> > Fixes https://lore.kernel.org/all/20241226170710.1159679-14-surenb@goog=
le.com/
> > posted over mm-unstable.
> >
> >  mm/debug.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/mm/debug.c b/mm/debug.c
> > index 68b3ba3cf603..9c4cbc3733b0 100644
> > --- a/mm/debug.c
> > +++ b/mm/debug.c
> > @@ -178,6 +178,7 @@ EXPORT_SYMBOL(dump_page);
> >
> >  void dump_vma(const struct vm_area_struct *vma)
> >  {
> > +#ifdef CONFIG_PER_VMA_LOCK
> >       pr_emerg("vma %px start %px end %px mm %px\n"
> >               "prot %lx anon_vma %px vm_ops %px\n"
> >               "pgoff %lx file %px private_data %px\n"
> > @@ -187,6 +188,17 @@ void dump_vma(const struct vm_area_struct *vma)
> >               vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
> >               vma->vm_file, vma->vm_private_data,
> >               vma->vm_flags, &vma->vm_flags, refcount_read(&vma->vm_ref=
cnt));
> > +#else
> > +     pr_emerg("vma %px start %px end %px mm %px\n"
> > +             "prot %lx anon_vma %px vm_ops %px\n"
> > +             "pgoff %lx file %px private_data %px\n"
> > +             "flags: %#lx(%pGv)\n",
> > +             vma, (void *)vma->vm_start, (void *)vma->vm_end, vma->vm_=
mm,
> > +             (unsigned long)pgprot_val(vma->vm_page_prot),
> > +             vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
> > +             vma->vm_file, vma->vm_private_data,
> > +             vma->vm_flags, &vma->vm_flags);
> > +#endif
> >  }
> >  EXPORT_SYMBOL(dump_vma);
> >
> > --
> > 2.47.1.613.gc27f4b7a9f-goog
> >
