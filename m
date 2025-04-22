Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF2A281535
	for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 14:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745330622; cv=none; b=JY6N7CkdIDOXsKD3JfdX/ZC5HsOuiAA6I+lWwSbjbOP6MLtjqOo62BU5cmv55HKLAlvw01lJ//k5kVuxBCZY+tnQVycZeJ5snUV+p/GX9o2Xd67uGHhCGf4+Of7PcOIIWPKqLI26yjGXp5LE8jKRrZQQe8q09e7X844jsrEZNAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745330622; c=relaxed/simple;
	bh=DI5wbiqZFhNjcg4g07wsE2rRpyR+Bg6kHqEcrbHze4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iY4cBDbujO+Nes4MsZboMvTUdbOvh9Zmds2NldWNaozShYXrDh1kkGlpfTFO1dn2JB80MoH9zOv22qbuTgIdrHhbben9l5qxMwRF6E6S6WqK7Z5EVebbN7yCNqcElgyvAm827sQ4pSB35X+VCIJJyGMyS1GKPqIQ7aDLD5ZoC2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=diHRM3SS; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="diHRM3SS"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2240aad70f2so182635ad.0
        for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 07:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745330620; x=1745935420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxtxQ2q5f2CesvMzHl2K/43Dvf+KKs8Sp+BtzyImVRI=;
        b=diHRM3SSYX1rhVTrFh85dMgmHNY8sO2ecyPwPFFxn5sQbKf8uyHGCTCokaasiZyg6F
         VKxRmeoGqd8z3gNfYfdYx9nRIt0sO2m4rZspMiU89vOTce8M36DF/iBjf+yUOw63OKP3
         hITordz6p0dyt9ILX6PjDqmdftBpNagsZ2+9Q43sianlor0YDckrxv6UHr73LrRP40nl
         0RhaPUqvIJhdfxVTKdVpFekbtxJ6p6mBz3v5CgPtgZJFLkFtAW0VeT+gmLV9s0iEgJ0l
         8gyzbdup2vQ5J4dKQketbtzn+Miv5FOylJYS/7yQo/70s3oaoMk8nilN940PIjwG8SKq
         /+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745330620; x=1745935420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxtxQ2q5f2CesvMzHl2K/43Dvf+KKs8Sp+BtzyImVRI=;
        b=vF2mrYMiKH0fvpsgd3/YPsMQhBVcAh0EopxkkiLp5OLIiDEKQsm8aWfo4JzAvIc5a/
         NVcw/WDDC3MTGQo1nZamBYlvqwz2HRIZzFsvngK4ZRNoAVSv/8SmgZsUPBZqUYpCmwtn
         PafCWgsa6wtZ5n18r8Jd0kn7jg2u39z+NzGlM95tYpuLVQrl7e7sBfigBRM18JL6dfA6
         KblWmJRyGQiXiTKJbQILZq+5UHvagDpz7KkC1NukJJ8KUheW24EGEf8hzXif03YA2LHs
         MBBj7werDTc+EzdZ202RsHH1ZRVosyy+LtVQAypS63p1tt/AXg3o+BmKoYucEBWw8CgX
         NeyA==
X-Forwarded-Encrypted: i=1; AJvYcCWbOf3772tHBjWOq98MUJG2hXBr+Ten7/9vUiRoMt02gTFxVcRf3U/HVvIaetkRkzuC7rB/k6wI6RM=@vger.kernel.org
X-Gm-Message-State: AOJu0YymMsiYat1LavmCDQvVcTVp6S47pMN4Q3SiblJ6Y3+2urIPoOwx
	1UXYfRH+GC5KVvhVm0RbWaxU7OFsl2oanasky+3rIxdH6LEPuLGOzJt/DEmsATWTtwl4PVGdtNO
	88g3pxB6QX/XGM5ibHjLR03WCC8iOOer9a7DH
X-Gm-Gg: ASbGncu7oqAkxCc32idkd1JN5jNsBmuIYRVvBB6lxk5gg6cau2zjKxFsZf4/g7zf3v5
	sXHTQn6MVGgKKAIkX00UwKkZgJ96hCHEMlue465rjglos3mvlDWxE0MIq04Ihwl43bBwQGadqFg
	Pg1C/rVGXfqem/P1o0tEOhA5Z4fOGLDGaxBA==
X-Google-Smtp-Source: AGHT+IG0i+651pdR53K0l/n7uIQCSuRiQEGLD3Fi7ND1TmWV2npssXiwnzzo30HBpgP42jyUy2IALw8wxWFt/Kz8RzE=
X-Received: by 2002:a17:902:ebc3:b0:22c:33b4:c2ed with SMTP id
 d9443c01a7336-22c52a93c28mr10089535ad.26.1745330619867; Tue, 22 Apr 2025
 07:03:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417231540.2780723-1-almasrymina@google.com>
 <20250417231540.2780723-2-almasrymina@google.com> <f7a96367-1bb0-4ed2-8fbf-af7558fccc20@gmail.com>
In-Reply-To: <f7a96367-1bb0-4ed2-8fbf-af7558fccc20@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 22 Apr 2025 07:03:26 -0700
X-Gm-Features: ATxdqUHgiM0jEZwKYWOLJlVXJ7i1N-PNg4kE-n9ns-g62S6RZ7kqQTTDhmeVqPw
Message-ID: <CAHS8izMFxDG5E07ZdqnDH_2D_g1fW8X0M7u3gGyV8efzxDNZbg@mail.gmail.com>
Subject: Re: [PATCH net-next v9 1/9] netmem: add niov->type attribute to
 distinguish different net_iov types
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, io-uring@vger.kernel.org, 
	virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jeroen de Borst <jeroendb@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, Willem de Bruijn <willemb@google.com>, Jens Axboe <axboe@kernel.dk>, 
	David Ahern <dsahern@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	sdf@fomichev.me, dw@davidwei.uk, Jamal Hadi Salim <jhs@mojatatu.com>, 
	Victor Nogueira <victor@mojatatu.com>, Pedro Tammela <pctammela@mojatatu.com>, 
	Samiullah Khawaja <skhawaja@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 1:16=E2=80=AFAM Pavel Begunkov <asml.silence@gmail.=
com> wrote:
>
> On 4/18/25 00:15, Mina Almasry wrote:
> > Later patches in the series adds TX net_iovs where there is no pp
> > associated, so we can't rely on niov->pp->mp_ops to tell what is the
> > type of the net_iov.
>
> That's fine, but that needs a NULL pp check in io_uring as well,
> specifically in io_zcrx_recv_frag().
>

I think you mean this update in the code:

if (!niov->pp || niov->pp->mp_ops !=3D &io_uring_pp_zc_ops ||
    io_pp_to_ifq(niov->pp) !=3D ifq)
return -EFAULT;

Yes, thanks, will do.

> You can also move it to struct net_iov_area and check niov->owner->type
> instead. It's a safer choice than aliasing with struct page, there is
> no cost as you're loading ->owner anyway (e.g. for
> net_iov_virtual_addr()), and it's better in terms of normalisation /
> not unnecessary duplicating it, assuming we'll never have niovs of
> different types bound to the same struct net_iov_area.
>

Putting it in niov->owner->type is an alternative approach. I don't
see a strong reason to go with one over the other. I'm thinking there
will be fast code paths that want to know the type of the frag or skb
and don't need the owner, so it will be good to save loading another
cacheline. We have more space in struct net_iov than we know what to
do with anyway.


--
Thanks,
Mina
