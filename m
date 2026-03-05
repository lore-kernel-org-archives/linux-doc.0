Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B04376BF5
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 09:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701793; cv=none; b=Uq0cEMWtG6IfB8P/n0EUQXYDX9BbsYtOSk/mOBuLoYdMOhouHQxtVhyqfSpzyfHj6bLQ0Xh3MRGlB/PEZrj2WbYoOEjWdtdEaEoWo9EosVBrlPROpe42MYZIgatt572xhPDcZZXLvARm+yH+V8QcHlXXW+Ag1lVlewcMvzoYD4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701793; c=relaxed/simple;
	bh=paMFccUX70MzLe6EqiSxhQfH8druuhfP7qmrJ+o85/M=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=safOqODphBBqBvwVJAXQ3WR23F99D1ReePhMI8HOyYOahYNfh4DuCX/L9iYoiOEBJ/NMM5ExTFgO7aqOtSpkkPqBr4uP3I+7AAFF5/ZOzE2F1XYtP3fJLcINkp5EUTqMyfbp/KHnvbJmBIuT3sRpYAPSrelWmbgEixfteXU3mrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vGPon/50; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vGPon/50"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4836d4c26d3so60418085e9.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 01:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772701790; x=1773306590; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=paMFccUX70MzLe6EqiSxhQfH8druuhfP7qmrJ+o85/M=;
        b=vGPon/50OBW/mGAU0XCwC1HVXLX9sZ+uree5UA6PUaLeIfPeOcGzfzJs6nseBX1Ufp
         NGuFyBv1k4W0snG6nBpf+5I4/qfTXaoef5qnmQ1RXY0vF8M51S9gXu4OtdoMYxGJALEW
         ZPLCmB2EKuIXEywR3qrIJU3rClvZEVBbdiaDlBaZ3hPxR8AzHEqLQ3GIINbDDqv+0Lp4
         P9bRm9yJZQIs5RC6/3NT5zXUUDCkuwHaBz/Df/EWH+rkLQvYQ0Ta57aijXn7x0vXxAxE
         QvpA79g2qwiljYtduHivZI8jRWAHJcuoIOpOI4O3ndjGy540WY+IOgOVDpG9/x3e5fbb
         i54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701790; x=1773306590;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=paMFccUX70MzLe6EqiSxhQfH8druuhfP7qmrJ+o85/M=;
        b=MOp2/yH3CQkIaTniwGUqzg6tVTanYnl9Hhttf0lQvgPFp7dEiRl5KVSn5GImEA9aTC
         49krmw9Zor4NMFlBfbTfXa5yP/xvAIaipwHEqBPVPX+mNMhHW46NGM8ksF1Llt0e/EJi
         Z0NvpsuiPf+67aWXCM9ulcdBe+akCSPIOPXSo0HQk7Vo8WGp29gjc+HB4o/aaoBtqP2v
         uUIiZBrwOQXgxXh788HGggUt9HHkaW6YkcT+jooggX5tx3Fb3sFDLk1/vw8UE7QOUMa/
         9L852aNiy2upH3vPk9ngBz3kVhnuxxKC6Y7C8zPyp4QLE2PSkURLGEWBShrYEzCe2PHc
         5VtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDbckYmrnEe7ZcccP3jwiQamJaMbu/gdgraDbCIEf0MTP4wsRRYin5p7vthr7HMrE3MhJtGCaUUPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtHJ6IqMpA0EGDjh5GQDvW/WoDRRUy0xLExngCKbrq4U51zTTo
	HdQ//0VidbhwIhG20ugsy+9baz4uSDWgl68rULG7eL2ETTArsQOZhzWVtwhlUIymmjQ=
X-Gm-Gg: ATEYQzxIzQu9pt8f1CI2BGUCad5i4Ozx4fs9L88oJcZpFQu2f92qZ4oJL+6eLEqS24E
	3b9jQutY0dc39CXVn9izQbbcH8CKPUev3Ee2xItVFflQajxjg8r/vwdAF7EzJc3Lkhh2wFB9+Om
	H+5wNbXkulbzanHViQ/k6oLbfHSQAjgQQEypv9YgMGGrfipsTEhVVbGIZ6T7EBI8/TjYbrSbr2u
	wmkT03SwEEDzouKExh3wZptJsZ4HYdQ319bq9vSxQsOrbECMK9wDAvcBpMMfeKnphndMBLSsHLZ
	NRrhqYXb9tlfCRtmIo7aJzR2X/EklWNbIvbNbJGknN3ygkE5xMoUz+77IRsxkGePvFGmyZ8+0uL
	ZUygDKTjeOinxfIVSFdHT0yLlFB4QVxZsNM9WVIZzo5Pv4kSyBaEsaojlhtjXF4oAPLVE8W6BCV
	VNwlQUyw==
X-Received: by 2002:a05:600c:6309:b0:483:7eea:b172 with SMTP id 5b1f17b1804b1-48519888cbamr87753395e9.23.1772701790412;
        Thu, 05 Mar 2026 01:09:50 -0800 (PST)
Received: from [10.203.83.244] ([151.19.52.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851a8955c1sm42457995e9.1.2026.03.05.01.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:09:50 -0800 (PST)
Message-ID: <098886563f5fdcde837989d0556ed9a2d8d3203b.camel@baylibre.com>
Subject: Re: [PATCH v7 4/6] iio: ABI: Add support for floating-point numbers
 in buffer scan elements
From: Francesco Lavra <flavra@baylibre.com>
To: David Lechner <dlechner@baylibre.com>, Jonathan Cameron
 <jic23@kernel.org>,  Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org
Date: Thu, 05 Mar 2026 10:09:47 +0100
In-Reply-To: <70f25902-5c79-46f9-8c67-99633b22b5ac@baylibre.com>
References: <20260304080519.2844101-1-flavra@baylibre.com>
	 <20260304080658.2844434-1-flavra@baylibre.com>
	 <70f25902-5c79-46f9-8c67-99633b22b5ac@baylibre.com>
Organization: BayLibre
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-03-04 at 16:45 -0600, David Lechner wrote:
> On 3/4/26 2:06 AM, Francesco Lavra wrote:
> > In the data storage description of a scan element, the first character
> > after the colon can have the values 's' and 'u' to specify signed and
> > unsigned integers, respectively.
> > Add 'f' as an allowed value to specify floating-point numbers formatted
> > according to the IEEE 754 standard.
> >=20
> ...
>=20
> > diff --git a/Documentation/driver-api/iio/buffers.rst
> > b/Documentation/driver-api/iio/buffers.rst
> > index f36e6d00173f..2fc9c2951a9d 100644
> > --- a/Documentation/driver-api/iio/buffers.rst
> > +++ b/Documentation/driver-api/iio/buffers.rst
> > @@ -37,9 +37,10 @@ directory contains attributes of the following form:
> > =C2=A0* :file:`index`, the scan_index of the channel.
> > =C2=A0* :file:`type`, description of the scan element data storage with=
in
> > the buffer
> > =C2=A0=C2=A0 and hence the form in which it is read from user space.
> > -=C2=A0 Format is [be|le]:[s|u]bits/storagebits[Xrepeat][>>shift] .
> > +=C2=A0 Format is [be|le]:[f|s|u]bits/storagebits[Xrepeat][>>shift] .
> > =C2=A0
> > =C2=A0=C2=A0 * *be* or *le*, specifies big or little endian.
> > +=C2=A0 * *f*, specifies if floating-point.
> > =C2=A0=C2=A0 * *s* or *u*, specifies if signed (2's complement) or unsi=
gned.
>=20
> I would keep all of the format options on one bullet point.

That's what I did initially, but Andy suggested doing differently [1].


> > =C2=A0=C2=A0 * *bits*, is the number of valid data bits.
> > =C2=A0=C2=A0 * *storagebits*, is the number of bits (after padding) tha=
t it
> > occupies in the
> > diff --git a/Documentation/iio/iio_devbuf.rst
> > b/Documentation/iio/iio_devbuf.rst
> > index dca1f0200b0d..e91730fa3cea 100644
> > --- a/Documentation/iio/iio_devbuf.rst
> > +++ b/Documentation/iio/iio_devbuf.rst
> > @@ -83,9 +83,10 @@ and the relevant _type attributes to establish the
> > data storage format.
> > =C2=A0
> > =C2=A0Read-only attribute containing the description of the scan elemen=
t
> > data storage
> > =C2=A0within the buffer and hence the form in which it is read from
> > userspace. Format
> > -is [be|le]:[s|u]bits/storagebits[Xrepeat][>>shift], where:
> > +is [be|le]:[f|s|u]bits/storagebits[Xrepeat][>>shift], where:
> > =C2=A0
> > =C2=A0- **be** or **le** specifies big or little-endian.
> > +- **f** specifies if floating-point.
> > =C2=A0- **s** or **u** specifies if signed (2's complement) or unsigned=
.
>=20
> same here

[1] https://lore.kernel.org/linux-iio/aZ7dCdLs5xcJ4UGW@smile.fi.intel.com/
>=20
