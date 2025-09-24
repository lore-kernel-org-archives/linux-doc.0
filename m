Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF7C1B423C
	for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 22:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758754596; cv=none; b=nBoS93XMxX5u4t6l69CENpiqtvqvdv2hyU4MRD+FCoSLUdhEO5acSZZvmT+QxtXz6PeqYzmGqnh3BgRlzETM/NPnAzGgFpcwufS2XZNtsqgOjwckKXXefUTCqm5jyJNybbjSYLwXnZCKDZwa/Zo9WUEOqr+0Jt7E0oka1xzjHug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758754596; c=relaxed/simple;
	bh=Op6DNkPC6eHPtYfufa74RLj648Tv43squgVRXyUVfnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LhvJbCdzQ8cnDI2WOyNkC+aXjHH6L2wEvn3jVCaxDxI33hvI6ScpjmUgezWVPcnuffcYU5KbtL2ogX0lppq20Bj22KrkV9A5WH3jlr8tTighYbnZx4iN4HCAgqsaY5p7uh03Zwq/cdlIEzWhbIkbZGhAwpxkpc57y/EGvXtQiBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DwoJgO5e; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DwoJgO5e"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-85322d9c606so44730085a.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 15:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758754593; x=1759359393; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5B+Zh9yFHo6Xolwu3opD/Diih25AjkCAs1FmMFIzwVU=;
        b=DwoJgO5e+q5F7FSQnVw9LAiWfS+IXaWOsio72wK7KbLl4ISRKjUKWy07k+nXoumPzQ
         XwUR1iAMvEtLk9bXe93Z0nYUkHLmCeDwoL7XZz7cbG9D1N+pIlemQb9QtmMtB1nt5u77
         Mh+V1jxeFH6GolL4b2keHNi6ezr5sqDw8BzVnAQOvzOc/T3F7rIXDoLGlnOx/nsEQi1z
         Etu0CMs2UtkLIf/vkt10+TVLDSuApGXSQOLfQyFUjfSTEfuDW10lmLYhJQQ9kAZYeecH
         LZeaUgCX4+dWu8NOJEdOJRge+zg4VTTPusdvjvQNo8tmcc3V53XSbytmrpulQML49EBs
         ENGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758754593; x=1759359393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5B+Zh9yFHo6Xolwu3opD/Diih25AjkCAs1FmMFIzwVU=;
        b=OD4GS0xqm4+JlcMNZZbYDamO+jcQAUYvMMnk1OXq2stnnUlbL9cza5y2GuWK/C1Zz9
         Ek6yt83y0cCZoJ/IL9XjIXLTLwKCqCJZ+kebti4uNUwrrkxRmyEKtK+XTPpUCLQ7FBic
         G0t5tKSo3KD32TT2qDD4eXkvePfzvv0j9ZkmkMXBwvmm7OLM6KF6NCT5s5QEUgkjtRjb
         lpnDZ4e9LdtxVYaQVvPF6tL+UPGms7aN8BSujYvCBeg9zvh3nIuZ2WnN5wh3EzNH9qwW
         8pSqv/3OyzdctKQ+oXTC/537k02kf+6NfomR6nqLnND9KduzO3SjofmXHfSbunbTVlYw
         5NkQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0R4m4JhYspTBDHNxDKpzyPtG1qXmrs5GMFyQLwBZBSs7BRQ0hvhtTyAdFu+HmvhKl90QNBywIYwE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzidFhywTxnZh3i4UZHCo8jLYDTwhvt8R61VU36MLaCEcuYofxW
	jgKrGPe0YlnEok+TXxWqHUINLGyIxzRFSIBIp5BoxIlIaxBgP8F44DWw0mmy+eds5mg/ikY8gfI
	5w8QdP1TXx4FDm/nT25O8215NX0VSKf0=
X-Gm-Gg: ASbGnctj/uDCw+mFuZnit5c2f6qQzQam+XMpTGWXTIdCac1f0YJNWdDwVCDboc5kskD
	myvv9CMk8gZUl1y376S6cEhrz6TNomx/MBCigIQCnQQvx4yjSxPKwtG19DYGIT+eoVMjaPkyXoe
	M1Ab4w3V47dm2eJzTBhZaEMfQoOEEHQ6vIXAJJ53/8tOFe0zd+noBSPaTgGXgcS/mTQ9wGgptAp
	W8wlTPw2unUJjl76zyKEkJ8jZPQXL82zGgYtKaK
X-Google-Smtp-Source: AGHT+IGzPzKs0y65h3LIZE6940gB4vV72Qyi3WZ6TBql4rL2B63TcdhnpA6Y4/6LPYw9/CuHLQab903G3U6TadwRTxg=
X-Received: by 2002:a05:620a:394f:b0:82a:5c45:c625 with SMTP id
 af79cd13be357-85adec4234emr191180885a.12.1758754593415; Wed, 24 Sep 2025
 15:56:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250916234425.1274735-1-joannelkoong@gmail.com>
 <20250916234425.1274735-11-joannelkoong@gmail.com> <20250918223018.GY1587915@frogsfrogsfrogs>
 <aNGWkujhJ7I4SJoT@infradead.org> <aNG3fnlbJhv1cenS@casper.infradead.org>
In-Reply-To: <aNG3fnlbJhv1cenS@casper.infradead.org>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 24 Sep 2025 15:56:21 -0700
X-Gm-Features: AS18NWAkh7IUvbVhGBD_bsGuTPZgO9EW5ULTCeoQsEee5-TykTnYOZdbSiLkTe8
Message-ID: <CAJnrk1ZoZqnX8YOBJBnNpr65FpMO_wNJBg42NCAiB1_c+Zr-ww@mail.gmail.com>
Subject: Re: [PATCH v3 10/15] iomap: add bias for async read requests
To: Matthew Wilcox <willy@infradead.org>
Cc: Christoph Hellwig <hch@infradead.org>, "Darrick J. Wong" <djwong@kernel.org>, brauner@kernel.org, 
	miklos@szeredi.hu, hsiangkao@linux.alibaba.com, linux-block@vger.kernel.org, 
	gfs2@lists.linux.dev, linux-fsdevel@vger.kernel.org, kernel-team@meta.com, 
	linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org, 
	Ritesh Harjani <ritesh.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2025 at 1:54=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Mon, Sep 22, 2025 at 11:33:54AM -0700, Christoph Hellwig wrote:
> > On Thu, Sep 18, 2025 at 03:30:18PM -0700, Darrick J. Wong wrote:
> > > > + iomap_start_folio_read(folio, 1);
> > >
> > > I wonder, could you achieve the same effect by elevating
> > > read_bytes_pending by the number of bytes that we think we have to re=
ad,
> > > and subtracting from it as the completions come in or we decide that =
no
> > > read is necessary?
> >
> > Weren't we going to look into something like that anyway to stop
> > the read code from building bios larger than the map to support the
> > extN boundary conditions?  I'm trying to find the details of that,

Doesn't the iomap code already currently do this when it uses the
trimmed iomap length (eg "loff_t length =3D iomap_length(iter)") in
iomap_readpage_iter() for how much to read in?

> > IIRC willy suggested it.  Because once we touch this area for
> > non-trivial changes it might be a good idea to get that done, or at
> > least do the prep work.
>
> Yes, I did suggest it.  Basically, we would initialise read_bytes_pending
> to folio_size(), then subtract from it either when a request comes in
> or we decide to memset a hole.  When it reaches zero, we have decided
> on the fate of every byte in the folio.
>
> It's fewer atomics for folios which contain no holes, which is the case
> we should be optimising for anyway.

I think we can even skip subtracting when we encounter a hole and just
tally it all up at the end if we just keep track of how many bytes the
caller asynchronously reads in, and then just do read_bytes_pending -=3D
folio_size() - bytes_read_in to offset it. Actually, looking at this
more, I think it must be done this way otherwise handling errors gets
tricky.

I had missed that this approach leads to fewer atomics since now this
gets rid of the caller having to increment it for every range read in.
This approach does seem better. I'll make this change for v5. We
should probably do the same thing for writeback.

Thanks,
Joanne
