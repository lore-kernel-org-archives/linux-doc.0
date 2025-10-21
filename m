Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47199286D40
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 23:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761089520; cv=none; b=Stw4aAruhSiodG2bqsxfUUjUPjUpzl/9S07DqwioTYKCDuQ09vx9TelO/6WpJdwXtULpToUhmPk257C5GSWuqyBb3QAji6l1XcelLlAo780x1TNKhRW9qMHMFXkdBgZ5SjEhFB+wV70C3alOn0ZR2eJxGn0p9rWMohc4lzxZBnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761089520; c=relaxed/simple;
	bh=pqqWmzw7DjJdnFf8r+/KCbFt0dIYwNLmYz8AmwYgSR8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oBioZ2LKFeUEBggCVP9Tdr7st1KpyM2PsI6GEI2BNuDsO9XEqyChDMj2JhPSeLWed3FREt78OFVoPkexBSORxa/4QHjerAIvB9YlNAFJY/q3S2pxAU85WX2hqgsP93Ava8NWwA4mhvSthG6SHR9jvdlw1bXFbAOA+GaehnNhxJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bAy9lZLH; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bAy9lZLH"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-33ba5d8f3bfso5482135a91.3
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 16:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761089518; x=1761694318; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vcxIn3xS1W1KdT5lDY1lIR5M97MqhUxp9HDJPsXzhq4=;
        b=bAy9lZLHPzNYzadbzUzir1Mm5vQm8mGhLBFWFOFTj8yHGO4/1OiUckqDaKRUpGhdrV
         e/nIgScgstUUUIxES9i8Mb7kd6B6TbfKCOKVpucHtw9zt04mGRMUAkb4JgcOQg7db5vm
         qOeadvu074q6gqFNkpCHyUIfi/CtH1eoodYPaWd6gLqmaDCyfqvyFu7xBDIo9NoppqgB
         wCIDzMlnwxKqfkG3V6Dq/okyPCiwC9ELEUXLPjU7CeVaHnnElFzghKFqEZHSPV8mSSTP
         gom+3Bh+XiFlTB14dozJNnRzP/YHhpXHj3OGPpE3CFni6YhnCIqnREev6IEAfl7wF9v8
         zdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761089518; x=1761694318;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vcxIn3xS1W1KdT5lDY1lIR5M97MqhUxp9HDJPsXzhq4=;
        b=FnM92U34G43Yp1+f/gHp2QZyyyjXEGbMUwF+ceGJNxzsv6YTIntBtiURiqOxLUwKAP
         vyfvgY3RKgssw4O4Mc5gkRahS+K0cm9/FMq5B8ZiIzp/WLynGFzMC4oyhixKG+83ao9y
         gzychHWs6E9L8AKQkAcrwCZhCI8DOX3xVXnRGgwfj4Gr6eRBtZEmtD3OImgfXfn5xntq
         dZ/iOyrSP8N1iyfgok8p6oi4FT2I80qDEFbIGyYWQLhVePn+dlFAIhQBsPKJC6mYiYpH
         A7V+aCsc5eesKWkbZaitJ/EoZY+Lbe50rDIlYriiU5wpVP9cG+4eREJvrQdiq6BOx3ob
         42ng==
X-Forwarded-Encrypted: i=1; AJvYcCXS5siGzN5HtZ35qS9v5Hesy5RK3AcMby4QFPlU5Uas2Tj2EQFeQPP/h5qi2eY+u174Jj5muPDINhc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1mqZbrh8sGuPLpOOBbyB5tXh2TcNGvjNE89FKgO1/+RH4Efiu
	jt3ekh1Soj9ZAhtE5qSRUpFftwqfG+mryx3ICnpY83J9BmaaIiRfsSLG
X-Gm-Gg: ASbGncuRUWaC/v9A9vJBZP7fFdgjKXtDS/hHptTgQ9+bvYb0Nx11ELa8nmPuzg7xuc6
	CF4uQ7rCOREK5fMwxnYCPlT1AE7OjiOyA11/Aq+li3Yd9w+I4AQVHj9hSZPqx5qxEe4HDVw3rPy
	qEY6v1KCF2BIfjaJllGyoVI0RG0+wzquvceB2HS+nAsiOPZ9BbV1eQ5rYl6YwfWMyPCi5BCezs2
	SqIPhfN5ba+CeFNdfa4NaeXJIYfFEKxlIF05lWBitnTuwbYHvmKQsPXGZANnQi5fZRi06P+7C8I
	7+RnEytSqEs/aahzkBGFM1bw8bhT7cjTI20jezBztZ5k3Pxt7Hlp3P7+plUh7jXt/3+VF2bTWAw
	hO4ADZkCjI/YPGlmGQyioCpFckbSnpcAMLtBKQcV5wqYZp1JBfo8/OwKlmzID5C4XTcBZeXETAG
	War6HFzwAjamzfd0SOLQk31Df/DFavvg==
X-Google-Smtp-Source: AGHT+IGzAsvapfQPwXxI8Qn0+WUuZk0fpYv0ATQ3QcqzMDCO7tvMff3/oU84M5k7fByuu6Mv1I4JIQ==
X-Received: by 2002:a17:90b:48c8:b0:33b:ba55:f5dd with SMTP id 98e67ed59e1d1-33bcf93ab88mr20368837a91.37.1761089518516;
        Tue, 21 Oct 2025 16:31:58 -0700 (PDT)
Received: from [192.168.0.69] ([159.196.5.243])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e2247a359sm678229a91.12.2025.10.21.16.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 16:31:57 -0700 (PDT)
Message-ID: <ba52cb688c9fd3209feefc5f7927d929190626fc.camel@gmail.com>
Subject: Re: [PATCH net-next v7 1/2] net/tls: support setting the maximum
 payload size
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>, Jonathan
 Corbet <corbet@lwn.net>, Simon Horman <horms@kernel.org>, John Fastabend
 <john.fastabend@gmail.com>, Shuah Khan <shuah@kernel.org>
Date: Wed, 22 Oct 2025 09:31:51 +1000
In-Reply-To: <aPeASl1RRAKMmuhC@krikkit>
References: <20251021092917.386645-2-wilfred.opensource@gmail.com>
	 <aPeASl1RRAKMmuhC@krikkit>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-10-21 at 14:44 +0200, Sabrina Dubroca wrote:
> 2025-10-21, 19:29:17 +1000, Wilfred Mallawa wrote:
> > diff --git a/net/tls/tls_main.c b/net/tls/tls_main.c
> > index 39a2ab47fe72..b234d44bd789 100644
> > --- a/net/tls/tls_main.c
> > +++ b/net/tls/tls_main.c
> > @@ -541,6 +541,32 @@ static int do_tls_getsockopt_no_pad(struct
> > sock *sk, char __user *optval,
> > =C2=A0	return 0;
> > =C2=A0}
> > =C2=A0
> > +static int do_tls_getsockopt_tx_payload_len(struct sock *sk, char
> > __user *optval,
> > +					=C2=A0=C2=A0=C2=A0 int __user *optlen)
> > +{
> > +	struct tls_context *ctx =3D tls_get_ctx(sk);
> > +	u16 payload_len =3D ctx->tx_max_payload_len;
> > +	int len;
> > +
> > +	if (get_user(len, optlen))
> > +		return -EFAULT;
> > +
> > +	/* For TLS 1.3 payload length includes ContentType */
> > +	if (ctx->prot_info.version =3D=3D TLS_1_3_VERSION)
> > +		payload_len++;
>=20
> I'm not sure why you introduced this compared to v6?
>=20
> The ContentType isn't really payload (stuff passed to send() by
> userspace), so I think the setsockopt behavior (ignoring the extra
> 1B)
> makes more sense.
>=20
> Either way, we should really avoid this asymmetry between getsockopt
> and setsockopt. Whatever value is fed through setsockopt should be
> what we get back with getsockopt. Otherwise, the API gets quite
> confusing for users.
>=20
Ah I see, okay I will revert this change :)

Thanks,
Wilfred=20
>=20
> The rest of the patch looks ok.
