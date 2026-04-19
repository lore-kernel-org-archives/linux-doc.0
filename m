Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A123254A0
	for <linux-doc@vger.kernel.org>; Sun, 19 Apr 2026 11:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776599470; cv=pass; b=aYXqDMr+H6t/IwVuH8Zsr3SFUvWhuxueKOIE8hYUdtlXL2DgE0mMa8X+2Q0+DIIB2s+UAq2aNLIMnk957TeqLgMwmi3vLxyz82Vm1X2EYowyQ19ZEPZp3WXKqOUVdjDv6QAciuuJoJmT3oC7+1L3HGx3sP2BBntRsUv2RzhBVtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776599470; c=relaxed/simple;
	bh=YFp/ewbau35oN7gDA56jyAxYeb909Rw3ZdgCe0T18io=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jnl4mMNUDL6OjYGKx5aOFvGojYsTIQMsiE912GTtlTiMWIh5R+7OzcN+a/v0ZaIABxZMqElBtyGX5HWwlVFiYtRLIR18HpHjGRKFPPAHqYIt4wT7918+AO4jHyR8uSSS1lZ0btqj+cDhpO8N0RryfuSXjLQ+k58nH/21iNs6z7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULlXizHi; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULlXizHi"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d74086e5bso2086296f8f.0
        for <linux-doc@vger.kernel.org>; Sun, 19 Apr 2026 04:51:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776599467; cv=none;
        d=google.com; s=arc-20240605;
        b=KjqY6bjDC94yjWvq7ieEwTIS7TlxBgXSUyfmIn/wziHGf8nlFOO8Y1PUFXNgayS0Tw
         j1vS80ohP+wzaukN7euu2bjeZp0YnBoFB8yUyrH/IZd4KNbMU1yD7wEiKd+ZX0tsIuVZ
         YzKy5tvelB+9tRtvKg8z+oytAqg+gL5pKe295+NPe/1vKJDH5qV1n3SH9RtdyqJot9fg
         1eEashghfEqZi3Z07ou52vtvJy5ZZQ2O499IpUU6GE7AiZjUbMEUfg3DsflGHJgvXnPm
         BU79xtdDVmX0xnmxisBhngWUnt4VywLUSO/YKCA2IJybDKs4KKZJ3phY4nzi5AcM4cgB
         Khsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tncWQPfYyaqZlRgPygAaRhu74GKThm47UJdwkoBU6aE=;
        fh=LbS339kCD9QgcZFVmuk6qzscdMvgzgKsGdxJ0AbjP/w=;
        b=cWmoD0sqaioaEh8S1tdFgZL/NKZ7QobcF1RJjc7fvR2K2Vy5ke4tfTumScuuUa95jN
         QC260jO909yHFKaqc7BptKzkuUH498xHJae66n2L93ACyNZrZ2MVjJabtOmpGEjAJVAg
         VaMLyRXyUP3dEkT0Tp/UnQLE/fVzyy3G/chFYkYT8TfHHsaERqdBeZCLFyBPQhtNCjir
         qD92W11+QyFixFnTgi7o4/I06z+rPt/3BPyxOKDfpbgbgfP413oLXvefhuZ7Xjd1jBu+
         ZgMYzF0/1ruwRzda9eX057ikPapEWDkfVdGl+J1Su3Rr/eNOnxlazDjihP5R3A6YzJ0J
         aM1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776599467; x=1777204267; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tncWQPfYyaqZlRgPygAaRhu74GKThm47UJdwkoBU6aE=;
        b=ULlXizHiYDjudHl9qXhJkmL+V3dEip6uM5SHtuB5Z+uKFiJJIHbVopdSvws/mWI5Li
         AVhXE1kDBm06a919Lz6TfPql8hdQ8WRki8hLSxwzNrUpyxnIb3UckqJbzecVetT1PJH6
         HfoAu1PJhxvVRtmYAojgLLcqpK8Jtn/2nu2dvZC6HomStMhvvp2MUREp4x15gvCR6gjl
         AZ6b+M5VW68nyHOeiiXRFIjl/bmvu2eJNxcDzxWobI8w2IBJDH6I/3l5CORfZF3ed1Om
         SWsW5vnemQIKTD51TQBJCMrtP5GLxavNCo/aoexnZ1bP47RM4Isxkm2cG8Dqf0UtppHc
         RY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776599467; x=1777204267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tncWQPfYyaqZlRgPygAaRhu74GKThm47UJdwkoBU6aE=;
        b=cpMEbKUJCoK3QQH7lxs7iVetQm3C8zXRIMgvnqKteAwJGCLMTHveynMFheywczAamn
         MGG4v+KkC9LdsrXONup5GWdTegOVOydQ8uYvCNZyB1YQYVSaMSEvuX2wBAuGyf7ObODr
         v2xden4cBxzYpumhWVUXJoU54IBQfoqBpsnwyN3JbxJOpnt34h972T0LNOv9bp4JSP8Q
         rRwOHsA36WN6nzmOwR0qPqSSWcFG2rrnmA5a2XvkvMsxTYQKfY+bUk7VbN/pxxgPicNX
         k5507ZnwpdA+m5C8cbz3LfWIR5yusaG+d10u5cVaGE+1e0j17cr6mi/iReVBCXTFoBei
         DbMQ==
X-Forwarded-Encrypted: i=1; AFNElJ+UtHSiaAanM1HopfpSkJuAuRnVELSEbesKIT+KMZZ7xAoShPPkG/Abd+dJMrIqkXgKPdpD9rwpj4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK66LKmc2Agr7ueZGJlvFRdXjEtHFHftfmQyJMH3KC1B7anwaz
	uhDa7Jluqw15wQj/yarNXj9OPheVXmMy0hyg+upiHoMDZNr7uF0Di2KoIkts6t8w5BPfBhrx7B8
	Ob9bE7rzqFMY5PaC37UGQMqEiYiATFIw=
X-Gm-Gg: AeBDievqriRz5r0b/kLpXU1Qz4SIi1b27FqvESs5GIwTTo8a6bNKvDVqaDdRBwVprW/
	JgkH4ix3mvzMGbxUNLJA8c+XFcGM2FrnKixrQ2M1iI/yihbvpY3G7QFkDCq/F8LSdYzIU7PCw1K
	mYefPn9xpFc0/y86xQrgh1/6mUMsLfBCg7g/TdCRiu/AY0ZDBQBe/WrMLmjGmmy6YbG7VBDteUY
	q9s4CeYnUSGnGF4YNXxvBV0f/7gUywsusFoXhnt7emLFjR2erxDuBJg0yPt/dfd/unYSUfcC7MG
	jhdqP65yK4w5VCs9Mis=
X-Received: by 2002:a5d:5f82:0:b0:437:711c:8754 with SMTP id
 ffacd0b85a97d-43fe3dc842bmr14658844f8f.7.1776599467085; Sun, 19 Apr 2026
 04:51:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419083125.35572-1-clamor95@gmail.com> <20260419083125.35572-3-clamor95@gmail.com>
 <20260419122950.67355f4c@jic23-huawei>
In-Reply-To: <20260419122950.67355f4c@jic23-huawei>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 19 Apr 2026 14:50:55 +0300
X-Gm-Features: AQROBzDe6HM4uuoI0FaMpknWQm05f0KEdcarfEIwiYOb4XhXkmoLtebse2uUQdc
Message-ID: <CAPVz0n1iB9iC+TFrGK5ajXjdk8-g8vzr4ZbXdvW5=F8iukanaA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] iio: tsl2772: add support for Avago APDS9900/9901
 ALS/Proximity sensor
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 19 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14:3=
0 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, 19 Apr 2026 11:31:23 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > The Avago APDS990x has the same register set as the TAOS/AMS TSL2772 so
> > just add the correct bindings and the appropriate LUX table derived fro=
m
> > the values in the datasheet. Driver was tested on the LG Optimus Vu P89=
5.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Hi Svyatoslav,
>
> Just one small thing.
>
> Experience has given me a strong aversion to the use of wildcards
> in naming within drivers.  They go wrong too often because companies
> can seem to resist using similar names for very different parts.
>

Noted.

> > ---
> >  drivers/iio/light/tsl2772.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/drivers/iio/light/tsl2772.c b/drivers/iio/light/tsl2772.c
> > index c8f15ba95267..8dab34bf00ca 100644
> > --- a/drivers/iio/light/tsl2772.c
> > +++ b/drivers/iio/light/tsl2772.c
> > @@ -127,6 +127,7 @@ enum {
> >       tmd2672,
> >       tsl2772,
> >       tmd2772,
> > +     apds990x,
>
> As above, just name this after one of the supported parts. apds9900
> That doesn't stop you using it for multiple compatible devices.
>
> Same applies for all the uses of x as a wildcard.
>

If this is the only thing keeping you from picking this patchset may I
resend with apds990x fixed right away?

> thanks,
>
> Jonathan
>
> >       apds9930,
> >  };
>
