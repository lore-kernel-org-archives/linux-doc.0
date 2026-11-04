Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793766651;
	b=wiPej/bZmAndVutpKm/pR4/2rPJ71k3HwUS1xpQBX6Uql10TQGsDZvLVA6JxRHf+xpon
	 ItB15XOOSKS89c/H9YfeNqoB045xM9CwO3+zHHsGsDyqPrrUrmH1NdP8L5yEqc5E7dXpy
	 Fm+2jfT9KyvJ8mIVlw1xH9hulrwTA3PpW4ynVIG7d7tUyspNlk04kTotElNHSNgXxDM2u
	 oR2HYmz+qdy44WS7fAG//3xL4hXVUWGzD/qr+66xkspW4CrSvWnQLT6o94oUzanKnM88c
	 CbXh9ZGxMRSS4Qtr9wsXSYt6kAETvEA32z+KZVg9LeqkSAxmI1XRDx7e5e77FT6XPAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793766651;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZpNcQj24yuMM3GQtiTzILqkIccl+qas6VuLsoUlL4Ug=;
	b=aERra6D3D0M8hullNdQTrlWTXdTmOCANGNcmTi9eHz4KfpelwmTdR0l8Hm0/pxLl/xmM
	 eOaxck/EuFwRa2JpMa4MpBWhh13K1ryE913ZgHlifjbxEewa501x3SNYB7uT2a/glh5TQ
	 g3MmVZ5XBImzCqV8mYmnGv4gGIl6tzmxPIpAiF+xzfct8WV3+GR2KBaS37mXKOSIvqiea
	 LXsuHEwhki+Axp+uG1owjrW5mNB1a2oTG3WcKgnOUZiV/oEkyKAQ/5MudFn0mpgEmoL3s
	 7WGO6lSTz4d54Heah3q2ZN+x+rVp0+OkCqACxh7081/kXd45++VIi1WgwHYAYyKbapQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S6eMCrzx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFB0606A326
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 04:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S6eMCrzx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 290C31F00A1A
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 04:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793766651;
	bh=ZpNcQj24yuMM3GQtiTzILqkIccl+qas6VuLsoUlL4Ug=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=S6eMCrzxSqAOVgmsmosfiLt8SlqWRJYLyBn3xFly7Axbs+CcnPZ4suZp+uIys3Jgc
	 4PwgTbTlGU+uYOszuV8JP+quWKwBxKS0umYm/RwW51oNPRYy3PUiyHVWkOxVZxjgx4
	 iyfRVBNLA48avCLJMCo3K1GIR3vb4qV6CJQFbxTTr0vjQgzk8W7P81bBsbroB1LPs8
	 yBB7q/qVivwzcHqmmyFRbQkymuYXeNTeHnwepvXQh+s7v3pfcTjSLsX1p7wwCXwz46
	 CC8oUXW94stSS2g68YvdxCf9/IgebUmbDYhrb+JsOZwoZXblciB5A2GLh+57Fk5YtQ
	 PRfyBpOd6IrMg==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso382618a12.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 20:30:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzPWrlEP4YkOdOTviiLVDvXD4izKCXY6cQfdCOLHfBk0Gnl4ez4YCZahT39wM3ZO2J698rG54SIHho=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mdQlH7ICKG/b0GPTiYAH3ErW256ZcL8d5Rk8MV0NHedvWEOH5
	ktURWsonED/R6p1xNWZ2OiIKOBZdljrEIlyUxEoSXnm9P1qAjP4Mj9IiYE8D4dNfpnrgSosPOgW
	pQWcTNVoQMNC0DRjQgM7QGd7s6OTxym8=
X-Received: by 2002:a05:6402:a505:10b0:6aa:e46b:2ca with SMTP id
 4fb4d7f45d1cf-6b4d5537ae9mr7019046a12.30.1793766649804; Tue, 03 Nov 2026
 20:30:49 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103111453.84804-1-mike.michalo@gmail.com>
 <20261103111453.84804-3-mike.michalo@gmail.com> <20261103171742.18816-1-icb@fastmail.org>
 <A37137ED-872A-4969-A1BD-C23E9B523EDD@gmail.com>
In-Reply-To: <A37137ED-872A-4969-A1BD-C23E9B523EDD@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 4 Nov 2026 13:30:36 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8ozh-WT+iSLspeZ_h2PM3xLSK4c22EsDD+53z7nbzieg@mail.gmail.com>
X-Gm-Features: AclHuK_UFq3A83cRJ7DhTEK66pNCvFNRdlhviHK4gv1kJtzRQYyXpFPlKH59ijQ
Message-ID: <CAKYAXd8ozh-WT+iSLspeZ_h2PM3xLSK4c22EsDD+53z7nbzieg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ksmbd: add AES-GMAC signing support
To: mixalhs <mike.michalo@gmail.com>
Cc: Ian Bridges <icb@fastmail.org>, senozhatsky@chromium.org, tom@talpey.com, 
	chenxiaosong@chenxiaosong.com, ematsumiya@suse.de, linux-cifs@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 2:57=E2=80=AFAM mixalhs <mike.michalo@gmail.com> wro=
te:
>
> Hi Ian,
> Thank you for the careful analysis and the reproducer.
>
> You=E2=80=99re right: in the multichannel branch of smb2_sess_setup() the=
 binding
> request is never verified with Session.SigningKey, and with AES-GMAC t
> hat turns the existing signing oracle into nonce reuse.
> Namjae, please don=E2=80=99t apply this version. I was unaware of this.
> I=E2=80=99ll send a v2 that first verifies binding requests with the sess=
ion signing
> key before they are processed or any response is signed with it, and
> check whether legitimate binding can also reuse a nonce under
> the session key.
Okay, I will check v2 patches.
Thanks!
