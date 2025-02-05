Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C681FCD07
	for <linux-doc@vger.kernel.org>; Wed,  5 Feb 2025 19:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738785224; cv=none; b=bHsD2CbrjNh01mQAhCOLVlJH3GDOYlyNTbDx3g9iEt+I9L/bMUjhzWfdYKvCFbDlE9AJ75MVhzuXFJdK7S+14YSlTWjHAkOSKOCysrC3dYE1FUxptp1F02A5eklflaWJIyCrqEp4y1O2g/brLaMjx3gJ0W92NdgofDckLIpo+mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738785224; c=relaxed/simple;
	bh=6q5v84lcktHrl3Z/XuzQ2h/3k5A/dQfZvkx4mZLUD3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hPDcTNjsWPUIi1ECSZ6H/zw06XmGxOGydnumQBKJjRF4GIgbYVJpPT3VCEHG3phxzZhUf+nHeIf4e8Sq5ZarQInHJVReQUWVZ31JOCHNFy0WlmSApNU+Cxyzdtz9N4zV1hKowPkrZtynbfDqcD2ZXdRO6kpt2NzyuNHRLSttecI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uFqmbNS0; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uFqmbNS0"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21625b4f978so24375ad.0
        for <linux-doc@vger.kernel.org>; Wed, 05 Feb 2025 11:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738785221; x=1739390021; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6q5v84lcktHrl3Z/XuzQ2h/3k5A/dQfZvkx4mZLUD3I=;
        b=uFqmbNS0aBRnuo9pIv0WlRbfYcyfLCZgY3fhAFoYmNRMInar7ONTMyWfrwIkc1o7Tu
         h/NNa5g8HMGIKel+KVJG+yqOExkoR0MXGAcvEWi5OElTbZVVa6GJ43In2ZXxNYEPdotq
         etguEabJ4EeAKgyL4y4RQ0WuNhvShkm/Zo7zDY4m1GjCqkwTiQLy0Jv9sObNcQ0uA+DA
         KdbhALjjkfSubZV5ENAirfaLKmMu5+CCXre1AqVY+e/09ztZMNm970g/tCTnmM9d9tEc
         QTzh7NbdC0EsuH3LEukcps4R6JpRPT1fNoAOylP+0Vq0tAcx2+AjhY1aXtI1sF/yyNOW
         kUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738785221; x=1739390021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6q5v84lcktHrl3Z/XuzQ2h/3k5A/dQfZvkx4mZLUD3I=;
        b=gzUKCY5a64/F3wjgG1+M3YkXDl5MScz2Zh+IILlUOoIdl4ZUiMHSaS3yLUnEiEL/+q
         tMKMhutjNTDUc3xa2OghjxfKd/TGqZQ8ClV7pNmRjn5ZEWa1FiOakx+CVvQ02XJEfRdQ
         +j7HGSE0f64frJUIj6V+w484ObTz1A1q1z9wnrzCJNOQ8wYPLEaFjKumeuP+lJSNgQaP
         kOuwmz5db0IQHPXfJIOZ6KPwNrY/6ZuJ2ubXaerPC8vKRbjuKGXsf2nyxNdZHqS8f7FM
         HBV93lbEKlKDRWTY8ZaCh+jSHkWJutgv+xH8pvvvcHzQTHXutJrYVQwX0x02kiBK4ukE
         6Nvg==
X-Forwarded-Encrypted: i=1; AJvYcCVSGIkaErxvJLov+Cq1gxniy3U4671lWVKwAsSYrzZIj4MA223K4G7SlSlhZTqCtD7HV6wwgQYY/Bg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt2tLMhrN8kmhylYrDhJBIcFW8kWAEtF+u0xgrpQt8pMHOf0UD
	EurGg/BtNRpllniM6iq8lKErn9tEXFY8/fh2bNEPh1+ZrLc3yHu8RT870dI2yhrbKVxFhmiVJWi
	aWddMhZ0r77Fa8Rm/0nanIsSqw+NnvJE/KZ4h
X-Gm-Gg: ASbGncuv7lwXAbqTe9TzyV5IIgOt+cF16sIfjU3RvmUBNpYGhuWCWiMJpdFofaKQiaG
	iF9zill0CKt4TEW5Q09NOx4xNvIvf0zWChnfxd0PHWQlOyZBXEgJfia6QZ3puwwZUzh1hxg2X
X-Google-Smtp-Source: AGHT+IFDcob/TSEuYMXb3hSVO++9mpu4Se8Bnl44BpJBOAaoFodhFrUGSu2xVB4BmBZwjRYxoARZ3TUatoE/oCz5blg=
X-Received: by 2002:a17:902:a9c3:b0:21a:87e8:3897 with SMTP id
 d9443c01a7336-21f3022831bmr337775ad.4.1738785220998; Wed, 05 Feb 2025
 11:53:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203223916.1064540-1-almasrymina@google.com>
 <a97c4278-ea08-4693-a394-8654f1168fea@redhat.com> <CAHS8izNZrKVXSXxL3JG3BuZdho2OQZp=nhLuVCrLZjJD1R0EPg@mail.gmail.com>
 <Z6JXFRUobi-w73D0@mini-arch> <60550f27-ea6a-4165-8eaa-a730d02a5ddc@redhat.com>
 <CAHS8izMkfQpUQQLAkyfn8=YkGS1MhPN4DXbxFM6jzCKLAVhM2A@mail.gmail.com>
 <Z6JtVUtsZL6cxsTO@mini-arch> <20250204180605.268609c9@kernel.org>
In-Reply-To: <20250204180605.268609c9@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 5 Feb 2025 11:53:28 -0800
X-Gm-Features: AWEUYZmMVG6gb-GClyYhPSsDJYW5WzEYrdAHF0Dz0FhMB9-YcVD_emeIkz00f9E
Message-ID: <CAHS8izNPxqUHNcE-mtnLSMEpD+xH9yNCxEAkvn01dLekkuvT_Q@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/6] Device memory TCP TX
To: Jakub Kicinski <kuba@kernel.org>
Cc: Stanislav Fomichev <stfomichev@gmail.com>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kselftest@vger.kernel.org, 
	Donald Hunter <donald.hunter@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Neal Cardwell <ncardwell@google.com>, 
	David Ahern <dsahern@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	sdf@fomichev.me, asml.silence@gmail.com, dw@davidwei.uk, 
	Jamal Hadi Salim <jhs@mojatatu.com>, Victor Nogueira <victor@mojatatu.com>, 
	Pedro Tammela <pctammela@mojatatu.com>, Samiullah Khawaja <skhawaja@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 6:06=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Tue, 4 Feb 2025 11:41:09 -0800 Stanislav Fomichev wrote:
> > > > Don't we need some way for the device to opt-in (or opt-out) and av=
oid
> > > > such issues?
> > > >
> > >
> > > Yeah, I think likely the driver needs to declare support (i.e. it's
> > > not using dma-mapping API with dma-buf addresses).
> >
> > netif_skb_features/ndo_features_check seems like a good fit?
>
> validate_xmit_skb()

I was thinking I'd check dev->features during the dmabuf tx binding
and check the binding completely if the feature is not supported. I'm
guessing another check in validate_xmit_skb() is needed anyway for
cases such as forwarding at what not?

--=20
Thanks,
Mina
