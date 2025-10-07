Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F641C6FF6
	for <linux-doc@vger.kernel.org>; Tue,  7 Oct 2025 01:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759800178; cv=none; b=N+11/xLw1WR8gqaGmgoYkoopbwvQk8aQqttg3BLldHij2eCnG1FEawOr9/AdCpGrjsDN4r3Z69tQ1HJ+BPVRg6tE+xH6FRcCHUs+OxIRPRX8QEWNdq0tdcC88az0FzBxziIwzyHnXvqWlmKmzwJX5UEL/z4pWVUvrvGhcFVsSss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759800178; c=relaxed/simple;
	bh=00hx5O89+8fvzy4PkP6xQKJCZLvcQoPJKp5vdlCLTCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=riEA9Kb/LPqRc3WmryLeE7y+aHxgEGLdYxBLhITeq7F1wjyzcFzbYeILIVImILGY7Zt4IMIQ0IotmQ+XlnVFSNAe7dekevq2SQJ3VIMsRhOqNkymrGUsOnJNGmknpDRUo+W+MpjKRfh/EB44GyaZBsQcN5qI1fD36G47GHLJNUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxBotesK; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxBotesK"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-637ef0137f7so9256137a12.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Oct 2025 18:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759800175; x=1760404975; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t47vpiwRUGgVZgrjR0ubmEzxDtialDVYBK5r+ezzR+E=;
        b=cxBotesKVT0kItaCi+pL79Rrdy7oHT/uuYEDZPxBFct+abfWG5d4HATokKErrW6Dov
         8LWvTC2r6AiCf/12ib4PyDnFYyo1rbz31IcEhzWeCLYpaSKEUVFq4CrOvMZcYr4gwbPH
         Rch5xtKR2oqwJ17lxy9L6RGmoGAb8ObcoCauAwoIW0IpqpzUe2Sni6rQnGMGgWvZ15tO
         FKv6HB/L4snlgopisxw6TsUTVEv4ItS6cxhYcXh7/Eh02tMMmtELMrwrTFJ4VNZmnNIH
         +w65691ilDaIiDGbzVQ0QX2hw5fXhO4qN25lkV5AUkqGod9x0m6/typnjfSkVxjdx92m
         rawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759800175; x=1760404975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t47vpiwRUGgVZgrjR0ubmEzxDtialDVYBK5r+ezzR+E=;
        b=AsO3yCYrZxvm6X+IbLRyhII3NVHty3NbFE7t3aqewR0kcjQ7C6c/cVoIXSFj/c5dNg
         2Zyk9R0BE7QxcUODCMVaNRTnA6RTsl0uu8flwRgPvzbqtQGhFJQbuJE0cAdTxqqZLzbX
         MTgIRwSuv3OH8SWiH0vzrQrmxg8unD0Ozq7cUtDob1ADsyyCHQdPXE8l6afgH7JdOVK1
         BvYVuWiZiKPh6VzUARm0FKmOP8SFZIa5wJBOg7YFSynRqv5rfddEuGNC5P68iE62U4/+
         L8ulpPuhj69IcTKARcLMGeXbgPSxYcmb+FzeHu1Ik/DS4VgG4oJvm8THdV9xlm/wziL7
         Hfjg==
X-Forwarded-Encrypted: i=1; AJvYcCUekJXb0dRRnd8WTKKRCkfrmHybCCT2SKi1qN0EnDexaVnSVodooAc5U5oKw1g8n4Cq8+Wp9jl7Oos=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSiYyppfDNeMRKdiV/bnPp4GRFwgQUofq4f5o6CHRt2fSCi7rb
	jOfQWHrU+xEeij8LnmA7QdxmQsFwOb5DQGyxP/6meDCDMZmN1LDvL1hwrQ6G91kQWC+tHy5oM/e
	ELHhJ2gnTSNJQ7Lx1E+SpbnG6mscJTj4=
X-Gm-Gg: ASbGncsHi4rBbQlj7qq7tYO/+mM17kVYPnx6DzgBlfk9BnjUIVjDwpu8jeccOEux/rT
	vY/2V7l5uPAkK5+KqG2L7qxgFqol47bnxDhcwmNjFx8Jy3SpHdIdFiQ0EVkbHM4pgckbhBqlaAw
	N+OxNZu0lCsSOnWzLXrZqWv4jbN/viZ9j/cG3WQLf1yc+ERuhXQLDy2IIc5qVC+wWpgGkMzteA0
	RsPA1BcxQHZxgyzKZ7DZXBs2bI2XXhPkfJznlXQjuuwv9k2+Nz/Kp0PjsfNHw==
X-Google-Smtp-Source: AGHT+IEqVioe1S+GxtMPUCva4kG5CmfdDTTGDPNdiniLUblABnKsGagheixLUyeC/Xqdz84Zg3zCalpzx4OwzsmlUYQ=
X-Received: by 2002:a05:6402:b0a:b0:638:d495:50a7 with SMTP id
 4fb4d7f45d1cf-639348fa973mr13226165a12.16.1759800175262; Mon, 06 Oct 2025
 18:22:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251003043140.1341958-1-alistair.francis@wdc.com>
 <20251003043140.1341958-4-alistair.francis@wdc.com> <05d7ba0e-fe39-4f86-9e46-7ba95fccdce9@suse.de>
In-Reply-To: <05d7ba0e-fe39-4f86-9e46-7ba95fccdce9@suse.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 7 Oct 2025 11:22:29 +1000
X-Gm-Features: AS18NWA3ErD_gS2cWuFH4B1EU9R8Gp49Hxw1eP3L2D2MX2i73c7hEabcslLmzvQ
Message-ID: <CAKmqyKMRXKJTQciiqjPXYAFa6UUJ6xkTSdEfU+9HnyNTOx-BxA@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] net/handshake: Ensure the request is destructed on completion
To: Hannes Reinecke <hare@suse.de>
Cc: chuck.lever@oracle.com, hare@kernel.org, 
	kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-nfs@vger.kernel.org, kbusch@kernel.org, 
	axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, kch@nvidia.com, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 6, 2025 at 4:16=E2=80=AFPM Hannes Reinecke <hare@suse.de> wrote=
:
>
> On 10/3/25 06:31, alistair23@gmail.com wrote:
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > To avoid future handshake_req_hash_add() calls failing with EEXIST when
> > performing a KeyUpdate let's make sure the old request is destructed
> > as part of the completion.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> > v3:
> >   - New patch
> >
> >   net/handshake/request.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/net/handshake/request.c b/net/handshake/request.c
> > index 0d1c91c80478..194725a8aaca 100644
> > --- a/net/handshake/request.c
> > +++ b/net/handshake/request.c
> > @@ -311,6 +311,8 @@ void handshake_complete(struct handshake_req *req, =
unsigned int status,
> >               /* Handshake request is no longer pending */
> >               sock_put(sk);
> >       }
> > +
> > +     handshake_sk_destruct_req(sk);
> >   }
> >   EXPORT_SYMBOL_IF_KUNIT(handshake_complete);
> >
> Curious.
> Why do we need it now? We had been happily using the handshake mechanism
> for quite some time now, so who had been destroying the request without
> this patch?

Until now a handshake would only be destroyed on a failure or when a
sock is freed (via the sk_destruct function pointer).
handshake_complete() is only called on errors, not a successful
handshake so it doesn't remove the request.

Note that destroying is mostly just removing the entry from the hash
table with rhashtable_remove_fast(). Which is what we need to be able
to submit it again.

Alistair

>
> Cheers,
>
> Hannes
> --
> Dr. Hannes Reinecke                  Kernel Storage Architect
> hare@suse.de                                +49 911 74053 688
> SUSE Software Solutions GmbH, Frankenstr. 146, 90461 N=C3=BCrnberg
> HRB 36809 (AG N=C3=BCrnberg), GF: I. Totev, A. McDonald, W. Knoblich
