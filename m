Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACAF241114
	for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 23:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761176888; cv=none; b=PFgeHwjZT0e0cBSqq8d/eRki5xQe+auGN/8Qoy2oYMggdgoqwl4Ke1XvDWArTx5rqBkUgpb3EEnGnHQ2vQ2D0R4pdPaaO2qKY/x980HVG7o90yBagxZfHfB3GeFOAfUAbwoUloZTNN/4/PpHHXGp7jBHqyvBT67zDlFmkgV3nAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761176888; c=relaxed/simple;
	bh=5WC3d0KpMF9e1+s5VMDuJD8IYrVBfMCqdA+27vs3t+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OpytpnN0l6VCPMV4qvO+1mpYR15vejFcKnYkDPuOYsN5J0buAiWy8fQ8eJGr07ZQLskz57QoFrxleT3wvW+fESeGLZ0LXA2wl89eTaMsNmIloFKg+IwG748YCm+ljDvcEWO/a8Ji0Vkgzxi9rSEn4hDmiQ7PC4g/bQ/cRAM7rYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efeT9fCl; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efeT9fCl"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-63e0cec110eso248459a12.2
        for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 16:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761176883; x=1761781683; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8mc7PEqKOdaKhhTWaiaacMdTM34oWGDw4sC0YwwFDk=;
        b=efeT9fCldGu0FwWHmP7IoseAh2X8ED0TgpvCaR2jNVypdAdHLS/v3lWwHoINELvbOy
         LRR+w87P2RaxwbZ1VwlWkcvttIv+l6sVyGH6plEM1oUhzQ+sbcr1rbj0fqOZVccgW2TG
         J4SWKbFCiwHI+Rirn9tT03g5d+P01HrJfnp26Q2TLB+TVOVEP3a2qJmB7CYvIhPu2V4r
         4+QpZQ7WpkqUrrVbjs0S+o8WSRal+Ykxl+7aEqSiU2esr3LTNu3J5235+awk1tpCG5ZG
         cUFsPukSzk5Uc1jCLTJtovhhqLzRZl+hta6BJmByyZrhIheT3jVy3pQwINcvuAqdc4Em
         7cuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761176883; x=1761781683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8mc7PEqKOdaKhhTWaiaacMdTM34oWGDw4sC0YwwFDk=;
        b=S3jAqqNUDxMbfQiUo3ETmtnC5gUnCy9ByO6iXmN+k3PDcz06xemQCP3vR0jBlYg9wx
         nq/1+utyIc8v2FhaZeGuAGgfsamHyxs/gSNRk8YzEVxTQETGPmwistoerMCuya9eivfS
         lQBkD2kyLYJDiN/P1tcvfHEG7i5QrZF7iAScHIedlw2x4FkUIh5+N9/sKoMOhUncbb+1
         EJLdPZe03UVQhdMnPjDSwpg0n8X66iWXWFt63trNmiI0rvJNp9AniLLJM0FAL7xO/YW/
         raZioFZGpfz0FwqKs9PhmkqBeg/Ub83HKfQULwiPsfikoauQJpo53FuDqfNHVXgxyniV
         ftVw==
X-Forwarded-Encrypted: i=1; AJvYcCUR6iLWZa5esa4/TzLd6jbF4s5L2GKP9fv8Dcv8H4WZCRL7IZiNd5QwwLeAIURGNJu41TKLj1U4k6o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP/wp3YklZC5bJt04JgDLRn+kaBl3yKPWvJ+vjA9eG+cgydRbJ
	KQFtMUEXzwvW07C3Gi0dpokyeL8oMwMzLw90hnN302DUe+Wv1+txi74JdKETPYuF0NQTLUHfBM8
	yZsMtGIASCIdBoQYviDv/if9gz0waPXI=
X-Gm-Gg: ASbGncuh1Ce/uaJbhtsCckKGOnqGSgS+8rKq+O6DNxuhSkmNzTKx0JyeScP2/ROoSMb
	QIU3kWKqgsIIO9Ctai2p1mUwOerqZ8VXtV3NHf13OoY8nYRYV5joDfMDT7oJN/3MUkAuT6Dj7BD
	ggs68r2nOCWh0hEV9w1bDCoK66i5UQAQFAegV5/rFmneLcfFkoagtwUer8NHNf/S4valAu813z+
	OlDd5EmnuHqeRPR45yiRU1WmyIhy8dlt+2kYIlJZkjjZndOEPlmiVRjKnjJnmH8opGLiHqKr/SC
	P7Q6KMnoMTTpc5I=
X-Google-Smtp-Source: AGHT+IFPvjCt3lhgdIMR/r39w4zk8tY3v7Ryh/JdZW1xA1CBJlkaCdErToOC3Wg0Fzc0bAc9ofaTJC6DzyBMlI3b854=
X-Received: by 2002:aa7:c958:0:b0:636:a789:beb9 with SMTP id
 4fb4d7f45d1cf-63c1f6dc078mr15321500a12.37.1761176882672; Wed, 22 Oct 2025
 16:48:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017042312.1271322-1-alistair.francis@wdc.com>
 <20251017042312.1271322-5-alistair.francis@wdc.com> <e7d46c17-5ffd-4816-acd2-2125ca259d20@suse.de>
 <CAKmqyKMsYUPLz9hVmM_rjXKSo52cMEtn8qVwbSs=UknxRWaQUw@mail.gmail.com>
 <CAKmqyKNSV1GdipOrOs3csyoTMKX1+mxTgxnOq9xnb3vmRN0RgA@mail.gmail.com> <7afb2fc0-0da5-4539-a1a4-87360186cf65@suse.de>
In-Reply-To: <7afb2fc0-0da5-4539-a1a4-87360186cf65@suse.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 23 Oct 2025 09:47:36 +1000
X-Gm-Features: AS18NWAK6TMWNZNySx8pysumGySsDeNzwXFu97eObXc75NSy-iZ6pjnX1U1P9V0
Message-ID: <CAKmqyKPuESAp3nGJNDSw13_TnQLtfjSEAUdFyKrtww46ytJdEw@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] net/handshake: Support KeyUpdate message types
To: Hannes Reinecke <hare@suse.de>
Cc: chuck.lever@oracle.com, hare@kernel.org, 
	kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-nfs@vger.kernel.org, kbusch@kernel.org, 
	axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, kch@nvidia.com, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 5:03=E2=80=AFPM Hannes Reinecke <hare@suse.de> wrot=
e:
>
> On 10/22/25 06:40, Alistair Francis wrote:
> > On Tue, Oct 21, 2025 at 1:19=E2=80=AFPM Alistair Francis <alistair23@gm=
ail.com> wrote:
> >>
> >> On Mon, Oct 20, 2025 at 4:09=E2=80=AFPM Hannes Reinecke <hare@suse.de>=
 wrote:
> >>>
> >>> On 10/17/25 06:23, alistair23@gmail.com wrote:
> >>>> From: Alistair Francis <alistair.francis@wdc.com>
> >>>>
> [ .. ]>>>> @@ -372,6 +384,44 @@ int tls_client_hello_psk(const struct
> tls_handshake_args *args, gfp_t flags)
> >>>>    }
> >>>>    EXPORT_SYMBOL(tls_client_hello_psk);
> >>>>
> >>>> +/**
> >>>> + * tls_client_keyupdate_psk - request a PSK-based TLS handshake on =
a socket
> >>>> + * @args: socket and handshake parameters for this request
> >>>> + * @flags: memory allocation control flags
> >>>> + * @keyupdate: specifies the type of KeyUpdate operation
> >>>> + *
> >>>> + * Return values:
> >>>> + *   %0: Handshake request enqueue; ->done will be called when comp=
lete
> >>>> + *   %-EINVAL: Wrong number of local peer IDs
> >>>> + *   %-ESRCH: No user agent is available
> >>>> + *   %-ENOMEM: Memory allocation failed
> >>>> + */
> >>>> +int tls_client_keyupdate_psk(const struct tls_handshake_args *args,=
 gfp_t flags,
> >>>> +                          handshake_key_update_type keyupdate)
> >>>> +{
> >>>> +     struct tls_handshake_req *treq;
> >>>> +     struct handshake_req *req;
> >>>> +     unsigned int i;
> >>>> +
> >>>> +     if (!args->ta_num_peerids ||
> >>>> +         args->ta_num_peerids > ARRAY_SIZE(treq->th_peerid))
> >>>> +             return -EINVAL;
> >>>> +
> >>>> +     req =3D handshake_req_alloc(&tls_handshake_proto, flags);
> >>>> +     if (!req)
> >>>> +             return -ENOMEM;
> >>>> +     treq =3D tls_handshake_req_init(req, args);
> >>>> +     treq->th_type =3D HANDSHAKE_MSG_TYPE_CLIENTKEYUPDATE;
> >>>> +     treq->th_key_update_request =3D keyupdate;
> >>>> +     treq->th_auth_mode =3D HANDSHAKE_AUTH_PSK;
> >>>> +     treq->th_num_peerids =3D args->ta_num_peerids;
> >>>> +     for (i =3D 0; i < args->ta_num_peerids; i++)
> >>>> +             treq->th_peerid[i] =3D args->ta_my_peerids[i];
> >>> Hmm?
> >>> Do we use the 'peerids'?
> >>
> >> We don't, this is just copied from the
> >> tls_client_hello_psk()/tls_server_hello_psk() to provide the same
> >> information to keep things more consistent.
> >>
> >> I can remove setting these
> >
> > Actually, ktls-utils (tlshd) expects these to be set, so I think we
> > should leave them as is
> >
>
> Can't we rather fix up tlshd?
> It feels really pointless, erroring out on values which are completely
> irrelevant for the operation...

It's not that simple.

For example when we call "done" for a handshake or KeyUpdate we call
tls_handshake_done() in the kernel, which calls
tls_handshake_remote_peerids(). So the kernel expects the remote
peerids to be set.

I think there's a lot of value in re-using the existing flows (as a
KeyUpdate is similar to a handshake), but the existing flows expect
remote peerids to be set. We could duplicate everything just to remove
that requirement, but I don't think that's the right approach.

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
