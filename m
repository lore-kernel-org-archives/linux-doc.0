Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8526341AC1
	for <linux-doc@vger.kernel.org>; Thu, 30 Oct 2025 09:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761816503; cv=none; b=p9m5pFFLRTxqwkqRakB7lOV8D+XmXxiAXw0DXZpmAbgq0IL5ZjS80I2ibYjHnO+xc6dq0cwuWNHuN5pEDDr0yl4B9QvLm6yUiPApPpQkyuuNeX+R6SWSCGcHnLK4ZFC1bLmbShjtEoHlwuRmdYeokvQv3vLnMyJImvrEdxHH728=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761816503; c=relaxed/simple;
	bh=3KFae3mnHAdFgFch5WE6C2EMGzI5ArupRlzDKVWdUMU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Thu0uS8GCQlO4hxI5kAihnJydjb0+xfPw9rHU0qLh54MSbxO8N6bTGJLrapAmG8dnWsHLEM4y1s27JTOAAquUyR1kJ+jDtU0Re2UU6PWaqVh5cexPDZB7ueu8n0QsHqWwJI6kX++gki7vmQfOIkag1fPWSmZ8mPLVzXXBCLQxQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kUpQQp2h; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUpQQp2h"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4771b03267bso5759915e9.0
        for <linux-doc@vger.kernel.org>; Thu, 30 Oct 2025 02:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761816500; x=1762421300; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3KFae3mnHAdFgFch5WE6C2EMGzI5ArupRlzDKVWdUMU=;
        b=kUpQQp2hixzbrRyl76dwIB85fUNBHwHtc5rZjDBeYHTmFgYWP+mHqXZC1m9/9y7x0K
         8HbUO7yWW0mnybxPfVdxRYOOuriki8kN2wKLqMhgR7hAj3oQxqIr0UWqYuZdaHWDeXBi
         Od/3B4UfB2WZmRhSBkcjWsefZxH6jg7YuAAEU4kwP3q3lsp2E90PJ8ZT2B6qDU0sRAkF
         UNSfCYWqjwBfkbZzud7ZDWKyAXuSGzmZEKC0nIOFHk0YBiDMyoF+8xNIsCqK8xZrgAOK
         YGlWGYH318kXq/ovFWAndE4FtDNWPj3b91quV0lOgvUIb4W7oWEjZoP8Xb/xPdepQy+E
         mmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761816500; x=1762421300;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3KFae3mnHAdFgFch5WE6C2EMGzI5ArupRlzDKVWdUMU=;
        b=mKzoeflAnI5WfK+BRZFmLecNH5tM4+6fcnK4uQ5iZ0yG7bXniiz6QRIbHemSgYgigw
         MFWda5GbYkwwCdySUGLj8LHNbi/kBtN+BQuzADF8BZD+B2Qb71VY82FhIhECs4zYWivh
         BWN7SDkLwIs6wz0t5+ZVAeG2fNBwPYm7GAvQVg5zYjMsIl9TrgHfnz4LgLFtWPKpkvyz
         wySSFiOQOpEvmMz4Y/zL2tncusvBB55vSlxim/60PfeD6ZT/BdPIcgpC1KZVid5ev89j
         RvKixcOVtHhCLs1F9c+42PeSVPoKiIniYV8as/fgWFl9x07csfxB1rnaSu4r65n7fwJs
         30EA==
X-Forwarded-Encrypted: i=1; AJvYcCVUtdtsAHc7mlL7TQy8+2S42mt6Wi7SGOcrHw90a2+n8cMom9Mxko5qZfUGFUQ7FWkdLz1e2h5KJBo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEuomdDlrKwjbw5qnDSn1SnpwR1vfikLEY+UiOy6vTzth94DND
	S5pPjNu7ZDySzUP9XekUdBDMODQhHNJP+fstC/E1YMSHgfT9CsWxjlqH
X-Gm-Gg: ASbGncvE/2v8IHdWH0+IxAnHmuFfK/7AI4LfyeRdY6uFynMqXPuaIsCi082H3+1qOAa
	kW7T2VARpe3Lwb3uikOzeBhnep8Dz5pmXsy9ePGVZXk2YDJjiTe8AjkMwp5Xxpn92r3mZ0agQNv
	Ddd6BGXRBOQ7RNwEWOBvjII+GonA6BkIiNV7zyNl7vbA51fyOWo53R5otwhr/Y/hmlfhjRc7Ice
	QKfIEGh3fi22gDQ0sv10aKxGR4NdB3uP3VoxyuMSRuj4MdXRLajojFGxKT4TOvpqRlYkoe9CJYq
	L6/S3G0eLkQzBRRbDmASD44NJj8TL+jusI+2enGwroSF7wcZagAsvlj8kFbH/OQdUy+jxsNGasp
	zVTGxhgJFBFFPuytX3DfCZYbxdna0ja7yJlVost374BB4FT0dOhvQ/rn2au+OSkmmoOIsELbkO2
	AH1UP57VilYzywz83f+ro=
X-Google-Smtp-Source: AGHT+IFF7NXPdvCAbGKnhLasZSsumjveW6sgM14GbeDb/ZSePCiZlozXxupC6H8veSQgZ8O+6rzmTA==
X-Received: by 2002:a05:600c:348a:b0:475:dd89:ac7 with SMTP id 5b1f17b1804b1-47726701f1bmr19220215e9.1.1761816499994;
        Thu, 30 Oct 2025 02:28:19 -0700 (PDT)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772899991asm29042145e9.3.2025.10.30.02.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 02:28:19 -0700 (PDT)
Message-ID: <ca6760182b4662c96df6204bae903d8affa6a8e3.camel@gmail.com>
Subject: Re: [PATCH v6 8/8] iio: adc: ad4030: Support common-mode channels
 with SPI offloading
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>, Jonathan Cameron
	 <jic23@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, michael.hennerich@analog.com,
 nuno.sa@analog.com, 	eblanc@baylibre.com, dlechner@baylibre.com,
 andy@kernel.org, robh@kernel.org, 	krzk+dt@kernel.org, conor+dt@kernel.org,
 corbet@lwn.net
Date: Thu, 30 Oct 2025 09:28:54 +0000
In-Reply-To: <aQJY7XizVWbE68ll@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1760984107.git.marcelo.schmitt@analog.com>
	 <3fadbf22973098c4be9e5f0edd8c22b8b9b18ca6.1760984107.git.marcelo.schmitt@analog.com>
	 <20251027140423.61d96e88@jic23-huawei>
	 <aQJY7XizVWbE68ll@debian-BULLSEYE-live-builder-AMD64>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-10-29 at 15:11 -0300, Marcelo Schmitt wrote:
> On 10/27, Jonathan Cameron wrote:
> > On Mon, 20 Oct 2025 16:15:39 -0300
> > Marcelo Schmitt <marcelo.schmitt@analog.com> wrote:
> >=20
> > > AD4030 and similar devices can read common-mode voltage together with
> > > ADC sample data. When enabled, common-mode voltage data is provided i=
n a
> > > separate IIO channel since it measures something other than the prima=
ry
> > > ADC input signal and requires separate scaling to convert to voltage
> > > units. The initial SPI offload support patch for AD4030 only provided
> > > differential channels. Now, extend the AD4030 driver to also provide
> > > common-mode IIO channels when setup with SPI offloading capability.
> > >=20
> > > Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> > > ---
> > > New patch.
> > > I hope this works for ADCs with two channels. It's not clear if works=
 as
> > > expected with current HDL and single-channel ADCs (like ADAQ4216).
> > >=20
> > > The ad4630_fmc HDL project was designed for ADCs with two channels an=
d
> > > always streams two data channels to DMA (even when the ADC has only o=
ne
> > > physical channel). Though, if the ADC has only one physical channel, =
the
> > > data that would come from the second ADC channel comes in as noise an=
d
> > > would have to be discarded. Because of that, when using single-channe=
l
> > > ADCs, the ADC driver would need to use a special DMA buffer to filter=
 out
> > > half of the data that reaches DMA memory. With that, the ADC sample d=
ata
> > > could be delivered to user space without any noise being added to the=
 IIO
> > > buffer. I have implemented a prototype of such specialized buffer
> > > (industrialio-buffer-dmaengine-filtered), but it is awful and only wo=
rked
> > > with CONFIG_IIO_DMA_BUF_MMAP_LEGACY (only present in ADI Linux tree).=
 Usual
> > > differential channel data is also affected by the extra 0xFFFFFFFF da=
ta
> > > pushed to DMA. Though, for the differential channel, it's easier to s=
ee it
> > > shall work for two-channel ADCs (the sine wave appears "filled" in
> > > iio-oscilloscope).
> > >=20
> > > So, I sign this, but don't guarantee it to work.
> >=20
> > So what's the path to resolve this?=C2=A0 Waiting on HDL changes or not=
 support
> > those devices until we have a clean solution?
>=20
> Waiting for HDL to get updated I'd say.

Agree. We kind of control the IP here so why should we do awful tricks in
SW right :)? At the very least I would expect hdl to be capable to discard =
the
data in HW.

>=20
> >=20
> > Also, just to check, is this only an issue with the additional stuff th=
is
> > patch adds or do we have a problem with SPI offload in general (+ this
> > IP) and those single channel devices?
>=20
> IMO, one solution would be to update the HDL project for AD4630 and simil=
ar ADCs
> to not send data from channel 2 to DMA memory when single-channel ADCs ar=
e
> connected. Another possibility would be to intercept and filter out the e=
xtra
> data before pushing it to user space. My first attempt of doing that didn=
't
> work out with upstream kernel but I may revisit that.

I'm also confused. Is this also an issue with the current series without co=
mmon mode?

If I'm getting things right, one channel ADCs pretty much do not work right=
 now with
spi offload?

If the above is correct I would just not support it for 1 channel ADCs.

- Nuno S=C3=A1
