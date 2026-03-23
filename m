Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B040A3C0600
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 17:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774287465; cv=none; b=nLNLdmJPLV8cK9gblfO1CyVFaplyk8bljq+uAORYWSvwaTIX+ZvzXfgAPJQIAc6VNKFIBq6IfX0Ybf4r/euuYABWe6sB4DEh95KSFf7d6GsqfURG2Rv6nQlrcujK43V0Xu9uiIqJuByRf8IrBGsGzoe4GF7RYCMNcVF22E74m8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774287465; c=relaxed/simple;
	bh=cK4s+aRJJfMSKQPfpYFlQXybNBTHKRc80Yo7MgBs5M4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i8CxewGxICcbUmw6GgLWqoDHmwIYuck/3GqywziXRZ55AtbTqdKPZy9UbkhU2I6oLnEtU5RMbhEt66xG9opIqA1HRfibjoOW1/k2hGg01PnCw1iDF83t1gzfKYPqnRrmEIshCbAA88zm0mbr8CEUSrSmySVZ1o2HVb+dOnsGemY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=os8CgyaT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="os8CgyaT"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so26889645e9.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 10:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774287462; x=1774892262; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cK4s+aRJJfMSKQPfpYFlQXybNBTHKRc80Yo7MgBs5M4=;
        b=os8CgyaT2Mfz2n5P0+B7XxDrx7gL3g88ShQLrki2M4e144FPKUn1XxUPfsHpLN5Zub
         G6xFyrd3BBBRL6Md6X2/9q5RJTzmxc9TjSNGYD1+jhpR7eujKs0ckniNbroFIIGMjfWw
         xeqOr6U3cbtdP26rQvI2AqYqFjcMTBY+j2UJfRLOXCaf9qAQ0jXTogahDA1gNEHKK3oA
         dD/UByI4Pmcl6j3iso9U2yz/K0aalDedmKSq6Du0PeFhD7+Cmz/00JYO69KIziaPgUGU
         9zjzPYE7HwijkdjxVkn9lsk0M5mZcZ/mm2TY91Y50KcEPzo1GezdgEZGTQOGPEFe+PMN
         wcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774287462; x=1774892262;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cK4s+aRJJfMSKQPfpYFlQXybNBTHKRc80Yo7MgBs5M4=;
        b=EWigZf6tNPcvgeQXDtne0wCuf74+kCbcDHLo2TEOFJPP//Fh/jXp8i/bXBB+ZjYkpD
         nOMsE8j5d8YQSXGWg1CSig2fGUHUBGPYmN80v/6/YGEL7nPgxbHR4F0Vxx2GUhj4OfL+
         7e9b5gCyACM+guxocZaoqbtOc5BXWhbr/x+TyLteLdDKIvnozkRjj/OSTZO4Gn9jIgII
         AzMCZ6VYXmqhAc0dsMIWuoQoHl00XGJOP4uiB/y21ysiCcjPxfANY67I0Uk/plOSuWba
         gx/sl14mZbzyE4RS3nwFnJRNFE2cwD+/waOF34Hh1P45UE0zv9MdhNKIq+PzqhunEOr6
         ckxA==
X-Forwarded-Encrypted: i=1; AJvYcCXIhMH3fmCYbsPe7AkSxPZknaHktozGsk2mxjyFDoptZvSmRZUUd5S1Dt0J259KwGais/4b2DWCEtE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVtlQnR8g5doPHFo7A6GgkFFD/yjXn0jsCPbRYVm7U2uUfei2m
	zk/3Aars/z6mAFzHa8NF7eVvbltd/FLQUniFdarRwxEGsZm0cZ8NaBRZkg7IDP4qQYM=
X-Gm-Gg: ATEYQzzq+66vpM6qv0XrDorDJGoFD12u2FBYJHkfv5tBJhVi9/hDH4nuNzDF4oYsBW2
	bb420hY2RGAdSymfq2BjnaN6QGQ7gfnDt2BGstLJSXPFcgNe2AZh1Xy/X8H8ovexk5R+b0TdrvZ
	VfUXwJMfy5888Q4M/WJsvLkd36ZZ0tHxfE9IdgrvucWUOnt+Yj7IRSXmNN68ysCrmxc+L/oYwDi
	mOr7g4pcpis70QSiZ6GspSK3HPUEQbCAzab4Aixz4vmfVQcnm5j6xIvBreegkf11nKA+pMlXcLc
	EeTp7t7IHLc07PIHK7RfgkJQluqQ0JuTd8nI0IHuqsAnMM7BwYqf2r80PRxXzk/UZMOeN/SVfaq
	f/wY+MXzgXcA10FpzpBr2AfhD7ZI+mQhMMk71o81UM2Qavm25ToRPsvnqMQB3na3jnSI1UveEDg
	6eMxww
X-Received: by 2002:a05:600c:a4a:b0:485:5c6e:8a38 with SMTP id 5b1f17b1804b1-486fee0fbabmr173331945e9.17.1774287462040;
        Mon, 23 Mar 2026 10:37:42 -0700 (PDT)
Received: from [10.76.209.31] ([151.35.182.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff1d6fbdsm80846685e9.33.2026.03.23.10.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 10:37:41 -0700 (PDT)
Message-ID: <5c780b1be8a64f7862a421db5a1f5be861cb197c.camel@baylibre.com>
Subject: Re: [PATCH v8 2/6] iio: Replace 'sign' field with union in struct
 iio_scan_type
From: Francesco Lavra <flavra@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: David Lechner <dlechner@baylibre.com>, Jonathan Corbet <corbet@lwn.net>,
  Shuah Khan <skhan@linuxfoundation.org>, Jonathan Cameron
 <jic23@kernel.org>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>,  linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-iio@vger.kernel.org
Date: Mon, 23 Mar 2026 18:37:38 +0100
In-Reply-To: <acFvHgTo-3cxH_UP@ashevche-desk.local>
References: <20260317150316.3878107-1-flavra@baylibre.com>
	 <20260317150401.3878294-1-flavra@baylibre.com>
	 <4723284d-1e18-4a13-9ec1-878220af257e@baylibre.com>
	 <af2128c68d2a14e1eb664ce9dc075ed02b640407.camel@baylibre.com>
	 <acFvHgTo-3cxH_UP@ashevche-desk.local>
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

On Mon, 2026-03-23 at 18:49 +0200, Andy Shevchenko wrote:
> On Mon, Mar 23, 2026 at 05:04:10PM +0100, Francesco Lavra wrote:
> > On Sat, 2026-03-21 at 12:22 -0500, David Lechner wrote:
> > > On 3/17/26 10:04 AM, Francesco Lavra wrote:
>=20
> ...
>=20
> > > > + * @IIO_SCAN_FORMAT_SIGNED_INT: Signed integer (two's complement).
> > > > + * @IIO_SCAN_FORMAT_UNSIGNED_INT: Unsigned integer.
>=20
> > > We could make this proper kernel doc format with one comment per
> > > macro.
> >=20
> > Actually, a set of related #defines can be documented with a single
> > comment. I see a few examples doing that in include/linux/gfp_types.h
> > and
> > include/linux/fpga/fpga-mgr.h
> >=20
> > > > +#define IIO_SCAN_FORMAT_SIGNED_INT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0's=
'
> > > > +#define IIO_SCAN_FORMAT_UNSIGNED_INT=C2=A0=C2=A0=C2=A0'u'
>=20
> ...or use enum
>=20
> /**
> =C2=A0* ...kernel-doc for enum...
> =C2=A0*/
> enum {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0IIO_SCAN_FORMAT_SIGNED_IN=
T =3D 's',
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0IIO_SCAN_FORMAT_UNSIGNED_=
INT =3D 'u',
> };

There is no standard kernel-doc format for anonymous enums.

