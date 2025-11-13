Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2270E2E6CA4
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 10:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763029216; cv=none; b=mwCxivZcypMPxYuTljgJImkYi+F3v29yY2+G6/Q55G+Ebg7jMAIAACn12OZMEJg414esdFuVEcVv6Vj0WPdXikGXO7zojfUlkWUBkGtRZljmNZGQ2oB4yEF9BAM4+5YcKZk4oO8S8xo2ReKRWlcWiEBrei/9ShIEhfmHNRxXgDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763029216; c=relaxed/simple;
	bh=DJZn8hUcr7qrXuuyp5TspC4wXrB7yMIW9ad/R+jXQq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b2thK0EvtEo3Xya8Sv1NNPz7vvOiWWqEw985+u7+19jQ3X+Rso/THRnuJM3lSEF3AhDBxbpf+Jwwnw6+cU/IHwxHCn/UTZNDkzLhfu5uVNkrxZwKBfLpIYdYx5h1KlambzcWYRRu40pZ6uXoVf04OU0d3RfKNkj6A/EGarelRsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQ90IUcC; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQ90IUcC"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b7277324054so80354666b.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 02:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763029212; x=1763634012; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IaLuTVv6ogQrV7pgPnqPwD8BmOYnKQewjeQIkkX8Rks=;
        b=KQ90IUcCCH41by4dG9uXHjmxEo5GOXEmfOtimJWDiJwavXQuTtDnWq1if/VZ8HSypB
         2hUrhw6L+68gPf0/Z1ufmC9tBhHjiokV3HmlIc7qctyuRzsbs+R+ZHBft4RouFGgexwL
         bw0uWxKOofubjtRVFsTjr3fzJmS/QmERzmYsHYzQ1kL9sj+sDMI8DQv19V8arpNwZXqN
         ozFmniPWds1+k62xnGe9YZL/G+f9o4iDlKpVBNAo9J3FSmIHI2vkOfgy6fXSswnmp6qi
         skv0RtfKNocC3V6ly44SzP3Viot49KNOsaH4yEPBC6xNJ3JUPxuhHJg/CQFcqI+V+/Ie
         hWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763029212; x=1763634012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IaLuTVv6ogQrV7pgPnqPwD8BmOYnKQewjeQIkkX8Rks=;
        b=wAORt/tuQacjTQved9VfeLOckyO9tT5IrrpZxnyTYNDvfko50e9QmL3TFFV/jApjk/
         f2m4sAyX4bePT+v9+rhqVNeRKKzdyZpH1fTTFPSCRwSWEo2AX+CdzYJ/5xLJf4n4ksFi
         flU2mOUG6NbJVceMmqwbkmlHc+ld4nCjXMrdr5HkrjEYA6Fn7P6qvehdOwby78MqSv8E
         LpTcuPkhEDqot9hMV0dDMexCATl6LAhuwkHhqHJuBZ2hNusRgxGbGpaIxXdCOjev2JaA
         UaMR3SCstVkw2iQ9ypcvq1ioJejs7mP4/mWghx5gp46AjPv27Gc7C+fP4DD1q7x+04+F
         t8JA==
X-Forwarded-Encrypted: i=1; AJvYcCXne0LQUepJeFo2jclkN6vgvaanvgEPhKA36bmrudLDV6vsSnHcHjKsQvo552cNKossGkrFd9ixUQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrC9LUUSvVBAzuOTGCCZCSfa7rcqGF6zKvKvvd8R77JTsNHJVm
	pWpEmCSddThz+AEvgTmaYfWMP+nggrjo+SASRfm+R2kyIH4P+OwXtQ+LrNYdFxjwaaBRP7d28zj
	+4OsZYehwya6Xax/e9kRUNN8u8wqLGvo=
X-Gm-Gg: ASbGncv/68H0rJTQM5a5q4uLi7viGPVtmOqgQkDFzDnYbEGX6hH63Ja+/zYB69fYps8
	uMlVrbzIlWT+0loz7ixOa4k6+sbrmJptpRmAeAs3BJyhmYxPckCnyewWAJUidDv4Pimb+uu4iRs
	K1Dwmco9kZIUjuR/v6K/syyItNLmmJ28K8ZY9WsDdasduuPgeA14hPKtdqOzVuJOdZuRg57+kc3
	aIy27mLWIVUaDrHq4/KJmx/P3fVircsXReVkZRe5ECNSkjSbK9fHjhIjQWFCIcsQ46IcL9OtcSN
	W9XhzQF0yyXhMzU=
X-Google-Smtp-Source: AGHT+IHW+MEeffc/pTPQLmL7Dde2CnR8q/jO4iZvJp6R/AepiIuZRquQtp0We7AMZrEbstFQ9LYr74m01iZsJkJ+N6k=
X-Received: by 2002:a17:906:f58a:b0:b72:6d3e:848f with SMTP id
 a640c23a62f3a-b7331a372c0mr637454366b.19.1763029212208; Thu, 13 Nov 2025
 02:20:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112042720.3695972-1-alistair.francis@wdc.com>
 <20251112042720.3695972-3-alistair.francis@wdc.com> <49bbe54a-4b55-48a7-bfb4-30a222cb7d4f@oracle.com>
In-Reply-To: <49bbe54a-4b55-48a7-bfb4-30a222cb7d4f@oracle.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 13 Nov 2025 20:19:45 +1000
X-Gm-Features: AWmQ_bkRDLojedW15PfOpNiK2JsU2DoevPnRuJfyF_0Rq1ckrKQa8VpTESFPsDE
Message-ID: <CAKmqyKN4SN6DkjaRMe4st23Xnc3gb6DcqUGHi72UTgaiE9EqGw@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] net/handshake: Define handshake_sk_destruct_req
To: Chuck Lever <chuck.lever@oracle.com>
Cc: hare@kernel.org, kernel-tls-handshake@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-nvme@lists.infradead.org, 
	linux-nfs@vger.kernel.org, kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, 
	sagi@grimberg.me, kch@nvidia.com, hare@suse.de, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 1:47=E2=80=AFAM Chuck Lever <chuck.lever@oracle.com=
> wrote:
>
> On 11/11/25 11:27 PM, alistair23@gmail.com wrote:
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > Define a `handshake_sk_destruct_req()` function to allow the destructio=
n
> > of the handshake req.
> >
> > This is required to avoid hash conflicts when handshake_req_hash_add()
> > is called as part of submitting the KeyUpdate request.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > Reviewed-by: Hannes Reinecke <hare@suse.de>
> > ---
> > v5:
> >  - No change
> > v4:
> >  - No change
> > v3:
> >  - New patch
> >
> >  net/handshake/request.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/net/handshake/request.c b/net/handshake/request.c
> > index 274d2c89b6b2..0d1c91c80478 100644
> > --- a/net/handshake/request.c
> > +++ b/net/handshake/request.c
> > @@ -98,6 +98,22 @@ static void handshake_sk_destruct(struct sock *sk)
> >               sk_destruct(sk);
> >  }
> >
> > +/**
> > + * handshake_sk_destruct_req - destroy an existing request
> > + * @sk: socket on which there is an existing request
>
> Generally the kdoc style is unnecessary for static helper functions,
> especially functions with only a single caller.
>
> This all looks so much like handshake_sk_destruct(). Consider
> eliminating the code duplication by splitting that function into a
> couple of helpers instead of adding this one.
>
>
> > + */
> > +static void handshake_sk_destruct_req(struct sock *sk)
>
> Because this function is static, I imagine that the compiler will
> bark about the addition of an unused function. Perhaps it would
> be better to combine 2/6 and 3/6.
>
> That would also make it easier for reviewers to check the resource
> accounting issues mentioned below.
>
>
> > +{
> > +     struct handshake_req *req;
> > +
> > +     req =3D handshake_req_hash_lookup(sk);
> > +     if (!req)
> > +             return;
> > +
> > +     trace_handshake_destruct(sock_net(sk), req, sk);
>
> Wondering if this function needs to preserve the socket's destructor
> callback chain like so:
>
> +       void (sk_destruct)(struct sock sk);
>
>   ...
>
> +       sk_destruct =3D req->hr_odestruct;
> +       sk->sk_destruct =3D sk_destruct;
>
> then:
>
> > +     handshake_req_destroy(req);
>
> Because of the current code organization and patch ordering, it's
> difficult to confirm that sock_put() isn't necessary here.
>
>
> > +}
> > +
> >  /**
> >   * handshake_req_alloc - Allocate a handshake request
> >   * @proto: security protocol
>
> There's no synchronization preventing concurrent handshake_req_cancel()
> calls from accessing the request after it's freed during handshake
> completion. That is one reason why handshake_complete() leaves completed
> requests in the hash.

Ah, so you are worried that free-ing the request will race with
accessing the request after a handshake_req_hash_lookup().

Ok, makes sense. It seems like one answer to that is to add synchronisation

>
> So I'm thinking that removing requests like this is not going to work
> out. Would it work better if handshake_req_hash_add() could recognize
> that a KeyUpdate is going on, and allow replacement of a hashed
> request? I haven't thought that through.

I guess the idea would be to do something like this in
handshake_req_hash_add() if the entry already exists?

    if (test_and_set_bit(HANDSHAKE_F_REQ_COMPLETED, &req->hr_flags)) {
        /* Request already completed */
        rhashtable_replace_fast(...);
    }

I'm not sure that's better. That could possibly still race with
something that hasn't yet set HANDSHAKE_F_REQ_COMPLETED and overwrite
the request unexpectedly.

What about adding synchronisation and keeping the current approach?
From a quick look it should be enough to just edit
handshake_sk_destruct() and handshake_req_cancel()

Alistair

>
>
> As always, please double-check my questions and assumptions before
> revising this patch!
>
>
> --
> Chuck Lever
