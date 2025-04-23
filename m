Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0710B28CF6B
	for <linux-doc@vger.kernel.org>; Wed, 23 Apr 2025 17:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745431174; cv=none; b=g09piXlqxMF86gmzqs4oaZhvbSGQsRY1mLVbLTgCEgQHsMy1dh0XXOnqKKzYnEZlqnSqNxDSuDd++NW7P6D7Xy1h5DJmedA0CnehyrNj76hL9zgCaNQ60sxe2AN9mPudiDuzF0pHrtkO6jfaFry1Px0Xv1sWhQaCTYpQvppTFjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745431174; c=relaxed/simple;
	bh=T2TBlvkxpqSt4Yg66wrWZfHI9nHaKVofCMCsYRliPm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AEt2H5TxMWj+1zAa9apPs5H+/bONR7t8gfUc1CI7/jZ7ZhMUiDVi6NWPzZtTInetwvNOYFDJAU2x6/OvI0e767b2ADhgZ7NhBV4H+4arNrKw9ANMPf0PZieeBfSnnIcXNjZBKZYOB4LBmgGFmpe0hNNwEHui57Hu+mF61JuxuPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HACIZgpw; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HACIZgpw"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2264c9d0295so27535ad.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Apr 2025 10:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745431171; x=1746035971; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8ET6hBVRzBDqshUdhbgCvSUTaazcby/sOi3F1Bc3pI=;
        b=HACIZgpw4Xflv3W6XmdPwNuTYxQ8zATeYzoR01w5U1QhvU797QxfB3VWNBYsoEXN0D
         r1sBI0OEbn075eeaSweSTK9Kt/MJ+oPdDAesZPl/+gwjrSyjiKHi/louVdIOC2rBhz0F
         gfHVMBUSPw9v6u9oUVGZYXOL2Hsolk65Haz4RZ3eyh8VtpyVn4oN+idH/iRyUan57kOv
         VJ6+rf3ozumb3R4FPyShUVTDwoFxVdmAp+3zSh7bj83RiPJA3ghFhOAXou/grUCVcWQN
         ED6+2Mxhsurs/2rbbxTEY/C3kPb4RP2/y6TjS8R445L88/BoxlCYyj8cauarXMlwAt0F
         s43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745431171; x=1746035971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+8ET6hBVRzBDqshUdhbgCvSUTaazcby/sOi3F1Bc3pI=;
        b=fKMvir+XP4RtXJlMfu2gUse3p+3GxbDzUPmYfuCr7gMMTFEjkC9vWHvxDleSdZATal
         LkZ4XuVY0KujILUmzTAYlwC0gwuGTvktF14FuyBshxHiFUri6CT2JIL2usXs5OfdRvqv
         AiNLbY5odhQL0jqRArP4NtXcVOwsVQWJFV3L5/TrDSaCZ70JOKO8R5sScj/0nEgQfNx6
         B1eVLUKg7h02WLfwpNdjBY/YsM+SzHciUUP0R67Qxavp8qE7ojodWpQuZNDi0yqYtE8j
         zloFSDjIPM3emTsfWUhpphe2/tOvOB1tH502Hg+ZmKPwegacMeXUklmwUetBAHuBtVHq
         4ToQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcNy3lwNX6lLKl7knLwZ8G9lsYKGGSUWH2by3YOkhvurSR3lFDWNHvWyae1+JAKSR2kw6dBLjpbF8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIPRJxut6QLxKIe/TsZUkLkfXyx87MRXKmvQDwbwpuKggdFjhG
	s82OuIf10pqiWT77RjB6Y7uu+zDpFMTli19FPWhPLwdxh8zWQRQOxYvcw+lO4DuevtM+WtEfOs+
	Uh9yMn77UdVVDB7Up1JGbB/DYU/K98yf4rRNW
X-Gm-Gg: ASbGncvLmDTXAboIUEJa1nsPIkGdxkptCMTxLvq1lvnz33BVh1MFQK5xKO4QeQmixlh
	5PLYcGNHjsLGDDX2MGZC/we7K/kXsFmRKFslcHRT67ccoaNlWLvNPor3fM8k6aIN8ev7NNMhMtm
	z8m4dwXTcMrbhkBKrHQX63TRYLagofShM0TjVlIE9Mc9ELsheYjvHA
X-Google-Smtp-Source: AGHT+IHvMK0SV6VtztVj+YoeYQ5/i4hvqsncQiTOPb2g+BToFdj7TZ78J3grFAhStRy75jc6hEr26BgE749DHVAlZwc=
X-Received: by 2002:a17:902:ce08:b0:21f:3f5c:d24c with SMTP id
 d9443c01a7336-22db2089754mr282595ad.0.1745431171080; Wed, 23 Apr 2025
 10:59:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423031117.907681-1-almasrymina@google.com>
 <20250423031117.907681-4-almasrymina@google.com> <m2y0vrtd5i.fsf@gmail.com>
In-Reply-To: <m2y0vrtd5i.fsf@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 23 Apr 2025 10:59:17 -0700
X-Gm-Features: ATxdqUHq-n2Ogx9j37-VJ8KU3c5QgjU5O-8PAbfORQ_YtioEYEuiwEUpYsuISUQ
Message-ID: <CAHS8izNUOO-X0WHFTMd3_yEjCDu4sPYADE1oDEtWTYFNNMB5wQ@mail.gmail.com>
Subject: Re: [PATCH net-next v10 3/9] net: devmem: TCP tx netlink api
To: Donald Hunter <donald.hunter@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, io-uring@vger.kernel.org, 
	virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jeroen de Borst <jeroendb@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, 
	Willem de Bruijn <willemb@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Ahern <dsahern@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, sdf@fomichev.me, dw@davidwei.uk, 
	Jamal Hadi Salim <jhs@mojatatu.com>, Victor Nogueira <victor@mojatatu.com>, 
	Pedro Tammela <pctammela@mojatatu.com>, Samiullah Khawaja <skhawaja@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 5:11=E2=80=AFAM Donald Hunter <donald.hunter@gmail.=
com> wrote:
>
> Mina Almasry <almasrymina@google.com> writes:
>
> > From: Stanislav Fomichev <sdf@fomichev.me>
> >
> > Add bind-tx netlink call to attach dmabuf for TX; queue is not
> > required, only ifindex and dmabuf fd for attachment.
> >
> > Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> > Signed-off-by: Mina Almasry <almasrymina@google.com>
> >
> > ---
> >
> > v3:
> > - Fix ynl-regen.sh error (Simon).
> >
> > ---
> >  Documentation/netlink/specs/netdev.yaml | 12 ++++++++++++
> >  include/uapi/linux/netdev.h             |  1 +
> >  net/core/netdev-genl-gen.c              | 13 +++++++++++++
> >  net/core/netdev-genl-gen.h              |  1 +
> >  net/core/netdev-genl.c                  |  6 ++++++
> >  tools/include/uapi/linux/netdev.h       |  1 +
> >  6 files changed, 34 insertions(+)
> >
> > diff --git a/Documentation/netlink/specs/netdev.yaml b/Documentation/ne=
tlink/specs/netdev.yaml
> > index f5e0750ab71db..c0ef6d0d77865 100644
> > --- a/Documentation/netlink/specs/netdev.yaml
> > +++ b/Documentation/netlink/specs/netdev.yaml
> > @@ -743,6 +743,18 @@ operations:
> >              - defer-hard-irqs
> >              - gro-flush-timeout
> >              - irq-suspend-timeout
> > +    -
> > +      name: bind-tx
> > +      doc: Bind dmabuf to netdev for TX
>
> nit: maybe add "for RX" to the bind-rx doc.
>

Thanks, will pull this with the next iteration.

> > +      attribute-set: dmabuf
>
> The bind-rx op has "flags: [ admin-perm ]", should bind-tx also?
>

The omission of admin-perm for tx is intentional.

Binding a dmabuf to an rx queue should and is a privileged operation,
because basically the application doing the binding is taking
ownership of this rx queue. For TX, no such queue ownership is being
taken. The TX binding just gives the netdevice access to the dmabuf
dma-addresses so the netdevice can send from there. It's very similar
to a normal dma-map with normal memory. There is no need for privilege
checks.

--=20
Thanks,
Mina
