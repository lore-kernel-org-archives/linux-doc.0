Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D0A2F5A34
	for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 19:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758050059; cv=none; b=LVzSn7cI/JPf46AJt6M1ZMR3XZ7lXifdkI5ciyI1L59aXFCTBzLdGVh7MPQdXdhmQKrztoG2/smT9dxI+K/wzdQGCT9xFh3FnZYYfeFOBatKPuoE6wpanH0gjbAMVPuvNqCk6W3MPrUWbD7xfsnhSjkEMwrFJazC9KB7hAm5uOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758050059; c=relaxed/simple;
	bh=Xy7VXhh3YEK7cUVocua6pJ6f1HAClx0ThLQjwcRSeMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TPCNu9vajrbV/VVFy72kZAEQK74byUham4Tzy28UfaS8q1svNuMfYdYqmrALETKhl5QKrgpvptYklUCOUattV8zLHLQSLuOFwch8xqs0T0IgdNQ8gBn8YcRMuDSFKwFQJNYwoO+ID10+Xfzagj2svQCViUZsot29oiHeyvwLdIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvd7h8X2; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvd7h8X2"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4b38d4de6d9so33115641cf.1
        for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 12:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758050057; x=1758654857; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0sDsCrroOBNAqKcWltn4wv/b9zaB4bt8yGtraqcOqWI=;
        b=fvd7h8X2/ZRMW6g5Gg5GoHL2eRQFiGRYq1Bcb1RUsvrApPo2atFFTmLy+4deN2L1k8
         kiERxSkcZochKLHEKUKl/TxYAjupJdq/l5j3MIONvLO9suPm8Mx1UAbsEp4ZpAaxNjFo
         2T4WhZJP3g7Q7DOqF3KG4rSMEu/lTrwQ7jk3q+7YagiI0nMICAS81L8bo+sNGePvu7aE
         5ckvalqNSmpkPsI+l6SyLFvWird3/bDeT6B87BfBj/r/YkwldDAuZfNA6bkz0bF7c8F+
         el15tWVIdikMA8u7d3zMxmDXkW/swLlvXMJcpoMSYrtlnkmWeeQcDNEF9kkQjLNrwAVX
         LmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758050057; x=1758654857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0sDsCrroOBNAqKcWltn4wv/b9zaB4bt8yGtraqcOqWI=;
        b=Efiz0h4mM0kULSIu4g226MQIf50LcbrTNQ7M/zVvNrsR7uPbzrahjv8mR//7hgLXOo
         cHXF9ycXsUS0KRHZQljOj6DRWc/BAmqpAtJ/+iM+IHhbdYfl1/ySAH4ECAzsWgtaVH3R
         ey3pSNDnGbMfCPvfExuZABDKCoh7Zo7byW9T6be5nU2sQ55N6F0KvEfogq+dm88/o6So
         r5uBDK37Y8mvbsBI4XvACQx7NB+S1WC6IakNFrOQDyPIewJ3bV/g0f0Kjk9KmLgFjSsA
         wq3CGURNAWNmjg5a3S1oCDN18jWGRJSqLIQQhHS5QyiKMX9xKYMdzNsognZOiupK9KFI
         cfRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNeiNBugqckEvb3aV5Av/F2dtiRqDL6nO7pDysCouaRi019WaaYNj+Zo4XAWcH5fwgc3wU5D2lwok=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoOj3um2fxu3a+HtpkzM+5QKTfsUOp7g7XmJ/3H+WLo4zHKNzS
	KDgt4RwkvTsDs/mTKVAoM0G1mdDu2or9KYm61X9ANXNl5/JeRR8NfhFBDC6SHrATF8NS0KuaZ8C
	QjB3M/f65dUnAxz1EBs3PZ5BMREGcRUI=
X-Gm-Gg: ASbGncuKrLfm0NxARogDyR3lm9MMKP3MMPVH5suZ1YlPmAi29heTxW7uUM9HwYrBZJu
	QcME0cEePXuTNIYmOKdGwmsEskkQzOQCtGobIDVHZuYlak5KqPBoZWYWl0Hm/YeaxRQ3hv3oUSu
	Ari/9F32bXFjiC+w3KgEY+sCTFFZZIJ4jhzMSQbRJlhQKrjSqx5OqcP2BKAre1MxMsuHgKL3jK+
	MmMxxGsEdTj3LpsISbQtrJMcsXh0q+izUru6tyF0nXPbsd8/w0=
X-Google-Smtp-Source: AGHT+IEnrb16bzEhxxaatwm/RHyGJRLO1QGX6fXH1y0q6MaUT6DETIc88lYKeVZ10sb2epPRZw0BAX+3ZiCq+mA4Bjw=
X-Received: by 2002:ac8:5d0a:0:b0:4b6:cbd:8cb7 with SMTP id
 d75a77b69052e-4b77d0894f7mr223403051cf.54.1758050056106; Tue, 16 Sep 2025
 12:14:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908185122.3199171-1-joannelkoong@gmail.com>
 <20250908185122.3199171-13-joannelkoong@gmail.com> <aMKzG3NUGsQijvEg@infradead.org>
 <CAJnrk1Z2JwUKKoaqExh2gPDxtjRbzSPxzHi3YdBWXKvygGuGFA@mail.gmail.com>
In-Reply-To: <CAJnrk1Z2JwUKKoaqExh2gPDxtjRbzSPxzHi3YdBWXKvygGuGFA@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 16 Sep 2025 12:14:05 -0700
X-Gm-Features: AS18NWDZ6XCFv5ugS-Pg-arJpmWxy4cqI-2OS1xanpbZfZTkTFB40b8v2IMXcnk
Message-ID: <CAJnrk1YmxMbT-z9SLxrnrEwagLeyT=bDMzaONYAO6VgQyFHJOQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/16] iomap: add bias for async read requests
To: Christoph Hellwig <hch@infradead.org>
Cc: brauner@kernel.org, miklos@szeredi.hu, djwong@kernel.org, 
	hsiangkao@linux.alibaba.com, linux-block@vger.kernel.org, 
	gfs2@lists.linux.dev, linux-fsdevel@vger.kernel.org, kernel-team@meta.com, 
	linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 10:30=E2=80=AFAM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
>
> On Thu, Sep 11, 2025 at 7:31=E2=80=AFAM Christoph Hellwig <hch@infradead.=
org> wrote:
> >
> > > +static void __iomap_finish_folio_read(struct folio *folio, size_t of=
f,
> > > +             size_t len, int error, bool update_bitmap)
> > >  {
> > >       struct iomap_folio_state *ifs =3D folio->private;
> > >       bool uptodate =3D !error;
> > > @@ -340,7 +340,7 @@ void iomap_finish_folio_read(struct folio *folio,=
 size_t off, size_t len,
> > >               unsigned long flags;
> > >
> > >               spin_lock_irqsave(&ifs->state_lock, flags);
> > > -             if (!error)
> > > +             if (!error && update_bitmap)
> > >                       uptodate =3D ifs_set_range_uptodate(folio, ifs,=
 off, len);
> >
> > This code sharing keeps confusing me a bit.  I think it's technically
> > perfectly fine, but not helpful for readability.  We'd solve that by
> > open coding the !update_bitmap case in iomap_read_folio_iter.  Which
> > would also allow to use spin_lock_irq instead of spin_lock_irqsave ther=
e
> > as a nice little micro-optimization.  If we'd then also get rid of the
> > error return from ->read_folio_range and always do asynchronous error
> > returns it would be even simpler.
> >
> > Or maybe I just need to live with the magic bitmap update, but the
> > fact that "len" sometimes is an actual length, and sometimes just a
> > counter for read_bytes_pending keeps confusing me
> >
>
> I think you're right, this is probably clearer without trying to share
> the function.
>
> I think maybe we can make this even simpler. Right now we mark the
> bitmap uptodate every time a range is read in but I think instead we
> can just do one bitmap uptodate operation for the entire folio when
> the read has completely finished.  If we do this, then we can make
> "ifs->read_bytes_pending" back to an atomic_t since we don't save one
> atomic operation from doing it through a spinlock anymore (eg what
> commit f45b494e2a "iomap: protect read_bytes_pending with the
> state_lock" optimized). And then this bias thing can just become:
>
> if (ifs) {
>     if (atomic_dec_and_test(&ifs->read_bytes_pending))
>         folio_end_read(folio, !ret);
>     *cur_folio_owned =3D true;
> }
>

This idea doesn't work unfortunately because reading in a range might fail.

I'll change this to open coding the !update_bitmap case with
spin_lock_irq, like Christoph suggested.

>
> Thanks,
> Joanne
