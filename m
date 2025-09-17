Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44F72C3257
	for <linux-doc@vger.kernel.org>; Wed, 17 Sep 2025 10:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758106633; cv=none; b=ZqZ84BqtBpTClrRv+BJZ3e0sIRps6ncJvPyFpBKK9uKAWIjint8fi8ptqXEdY7yFxubojXCHok4zWk+9jfloI2wr9LN/icd9Lje4UtnKluOALmWX81FlcIhcUrf5kStvyrt1bhbNhbLqcEVwbY/XhqQX5I1BiKD3EaCPzO0/RDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758106633; c=relaxed/simple;
	bh=QmYrtoWSI1kIy/nJzwXJBLHjj0jj0mabKB7oxUIrXJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ry0Q+ddgX+5z0biZAqsOrRy9dZtCxNhLYquDWwo1MkvvZqLRLfeZBTVJEFE6Ao9PjTZRs1Elr0ZJ6lasqdo4HS/8y0b1mJGH6myz0Ak3x2qwhbXgvNF7H84H+WHrNa0SIG3OPkPOt5yUIVMXswfroMzZfP6Frey4x0PWgcvAtaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bR4sv73W; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bR4sv73W"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-afcb7322da8so507321066b.0
        for <linux-doc@vger.kernel.org>; Wed, 17 Sep 2025 03:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758106630; x=1758711430; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwxczvPwBg4Uyzbb2S+36YkOcrWK5ImeOLTlbGUhTaE=;
        b=bR4sv73WBSutzyYADCMWCKSwFt1P57YfHqnR1MydAW8WaNykJzFMzOfFGrvFobjOQp
         HK8ItEw9x7mY+J6gsJfg4iH03IWix8hiGxV71Zy28mosp/9WTR5ZrVy3pqrYsjmHJ2op
         0/d4kHw+N6IaT7y2g/6qBn+bxaCgJOy6HA9uoBWMZgEkTN973Vs9B2dxiw2vyfPRDcVn
         5adZ8zg/519JEotfO7FEFQlZDHEL8RccuGSYcAhIvUu8g2EoDQ2uMHw0OBBYf+6QrHpR
         3sW04nWDsXcZfj0f59XSsgKQCJTWyNZqe8KBS7/CCQtp9SJweJxThm9FN17Me/Y2IF/V
         OjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758106630; x=1758711430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwxczvPwBg4Uyzbb2S+36YkOcrWK5ImeOLTlbGUhTaE=;
        b=XebwTLKAna/2PDukYJl4v8BDZxoc9pqXroQb/+dOP/6OngjYZqSrC/XwzYAdgjmHa3
         SsRkZsJ0bVeiqGLf7zNrbMwdMvxqm0jFbiptf1IHDJS7T3ZH6oOXeS+haNQMUSebJ7Sp
         O7xrPxNu8tV5Lj8pZ02jPUk2HV/LSmgMvRl/HtQ4oi/1BtgwlCoforNFIPTT82ultrpW
         2P/o4MQYFOFNfUXZyF7AzhT6JMzwPBC0ySJF89ttdX5IYsKqoehL3QQ2z/B/8A2SGsq7
         rtgqCWJ3QBJGBbPFt4Qoqfr7Gc9XNp9qk7d840NkDhXKThmuNBl11Hybk5mVZWP+5BlJ
         hdBA==
X-Forwarded-Encrypted: i=1; AJvYcCWyAb8lXBjewHvni7a7k9cc4JaGLwSQVebFzUURs5XlZoJTS5MRvUG5lJIbAu6rdl/Hq62MJlSfH5g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuMoG6Z0xh5uJT89ev0gRQk2OooIiVGszKDFx7KzdAkJjUq0n/
	i5uAegAgSJqdagzvkVI1T+6EcPGIA1dQz4CHoXOIe4ACGcVxdHgc225vXkd39Bcj76RgTjwv6GW
	p/fweRi1U7lBnI3Q+EzHcRqn360r+0C4=
X-Gm-Gg: ASbGnct0IxvcMoFlqxMUVRw4P5pJPqpdvrwfZ5wyYQM/HSrFIPdvzgOo0teSTLBky1A
	Lgeqz93komWXuIhatww3hRC/hwizo0AtOEHyVvHIjSd0YzldtLBCau6TR7ccKWclP3H/liXPq+i
	hb5Jc0QAF0E9547uQl9lFi0/WBnlVPLKexkartXGeKmuHuR3WpmU4XOSocdjMtQjn3yZolozWAB
	RwOsy5ddu2gAcN8ajevRJnqbOH2+GAml2Z7Tw==
X-Google-Smtp-Source: AGHT+IFRxj/9mtl/X+fIrakzsiy5Ocq5giy1UUqC3+OR/MDKcOd65B6+Mg4kPuXc5cy2Khkk6gzSVw2BB+E/UtAWaGo=
X-Received: by 2002:a17:907:3cc9:b0:b12:162:8347 with SMTP id
 a640c23a62f3a-b1bb2d0f441mr214182466b.16.1758106630039; Wed, 17 Sep 2025
 03:57:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905024659.811386-1-alistair.francis@wdc.com>
 <20250905024659.811386-7-alistair.francis@wdc.com> <f1a7b0b5-65e3-4cd0-9c62-50bbb554e589@suse.de>
 <CAKmqyKM6_Fp9rc5Fz0qCsNq7yCGGb-o66XhycJez2nzcEs5GmA@mail.gmail.com> <e168255c-82a0-4b9a-b155-cb90e6162870@suse.de>
In-Reply-To: <e168255c-82a0-4b9a-b155-cb90e6162870@suse.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 Sep 2025 20:56:42 +1000
X-Gm-Features: AS18NWCp6hE9_gHHY9RNWcNThlN_Ck6Xfvl_Pbkl6uhBvEylonTEL18YHTqIeJc
Message-ID: <CAKmqyKMLP7hOi4FNhBET9XfoNZv4MZ3OsSRA0=B42C3+Q7P1jA@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] nvme-tcp: Support KeyUpdate
To: Hannes Reinecke <hare@suse.de>
Cc: chuck.lever@oracle.com, hare@kernel.org, 
	kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-nfs@vger.kernel.org, kbusch@kernel.org, 
	axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, kch@nvidia.com, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 8:12=E2=80=AFPM Hannes Reinecke <hare@suse.de> wrot=
e:
>
> On 9/17/25 05:14, Alistair Francis wrote:
> > On Tue, Sep 16, 2025 at 11:04=E2=80=AFPM Hannes Reinecke <hare@suse.de>=
 wrote:
> >>
> [ .. ]
> >> Oh bugger. Seems like gnutls is generating the KeyUpdate message
> >> itself, and we have to wait for that.
> >
> > Yes, we have gnutls generate the message.
> >
> >> So much for KeyUpdate being transparent without having to stop I/O...
> >>
> >> Can't we fix gnutls to make sending the KeyUpdate message and changing
> >> the IV parameters an atomic operation? That would be a far better
> >
> > I'm not sure I follow.
> >
> > ktls-utils will first restore the gnutls session. Then have gnutls
> > trigger a KeyUpdate.gnutls will send a KeyUpdate and then tell the
> > kernel the new keys. The kernel cannot send or encrypt any data after
> > the KeyUpdate has been sent until the keys are updated.
> >
> > I don't see how we could make it an atomic operation. We have to stop
> > the traffic between sending a KeyUpdate and updating the keys.
> > Otherwise we will send invalid data.
> >
> Fully agree with that.
> But thing is, the KeyUpdate message is a unidirectional thing.
> Host A initiating a KeyUpdate must only change the _sender_ side
> keys after sending a KeyUpdate message to host B; the receiver
> side keys on host A can only be update once it received the
> corresponding KeyUpdate from host B. If both keys on host A
> are modified at the same time we cannot receive the KeyUpdate
> message from host B as that will be encoded with the old
> keys ...

Correct

>
> I wonder how that can be modeled in gnutls; I only see
> gnutls_session_key_update() which apparently will update both
> keys at once.

gnutls_session_key_update() only updates our keys [1]. You can use the
GNUTLS_KU_PEER flag to set `request_update` to update all keys.

> Which would fit perfectly for host B receiving the initial KeyUpdate,
> (and is probably the reason why you did that side first :-)
> but what to do for host A?

Patch has been sent and reviewed, just hasn't been merged yet:

https://gitlab.com/gnutls/gnutls/-/merge_requests/1965

>
> Looking at the code gnutls seem to expect to read the handshake
> message from the socket, but that message is already processed by
> the in-kernel TLS socket.
> So either we need to patch gnutls or push a fake handshake
> message onto the socket for gnutls to read. Bah.

Correct, patch is pending (see above)

1: https://gitlab.com/gnutls/gnutls/-/blob/master/lib/tls13/key_update.c#L2=
45

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
