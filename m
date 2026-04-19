Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD49D37BE74
	for <linux-doc@vger.kernel.org>; Sun, 19 Apr 2026 13:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776606099; cv=pass; b=FG4PaK36KGkuMs9kbTOtN+rhpZ1G7EcAckclnO19nxlDDvboom/KuzHaYFJ/Nl1nwxtMUC2REW4ABT11icqWolkVxai29YxS/nDWBQimLy2W3OU5RDJV+tbPcexAPQLf+bh47pMfetPzVG3EU/sewXivu5snU/pxqKV71UhegVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776606099; c=relaxed/simple;
	bh=KgYE8NY18HH8TRen0NPS97WUyL/0h7qMH3OxN9kHuxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hHLUXuyKQxQnTv9GVMVReQpY/oPHMqvAD6gU0HmUjPRGZCk6hrAQxtVgsvIAz13ygJS+4mnyb+k8OhEAOFGj8XyBfEKgIWnFU3mnrwqtcigaKFuOuA8CR7x9Tm86so5HJBI4LD19EA+HA9NnfrJprfPEKDr9UgSuzUGkSjicV3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCQnophj; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCQnophj"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so1982820f8f.2
        for <linux-doc@vger.kernel.org>; Sun, 19 Apr 2026 06:41:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776606096; cv=none;
        d=google.com; s=arc-20240605;
        b=ZpL1msC4lphdRUjflf7w0rbE3mNMo063ujVljz2ad2jiNxAZIpcgL9RT2JHUt13IVq
         Tvw8kx5hcGDpTuXhx9Uh+LtuIFqYJlPnuzOA2CnGRX+l+vW1lyYkmGVCLljGLS3Fyeyc
         zKiR8NhyH7lRJuQf1z+YYRDHMPxnjKW7UCCZUTEFM+otbQ0QyyLeaDV/wQn1ADKAVEkN
         kgXMxn5/S+P/oDc2QYJg8wTq6TCU7bFSzldkUYaZXoGGlxIe6MATG3ZbkmD3Il6up6Cz
         EMnwhWY1lJqfQmrV+fLej8enTDnBPtyY40cj3xlyVXUwTfdPojPKZdh59PntwyDaFS68
         qSOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bhvXeg9WDuDCHAGv1q3jriiZNOjr7t2RCHZ5SrorAsY=;
        fh=3W7vA1Mh5qEWT8NHPsRrjG4lSCt2/crl/P9UOxux65g=;
        b=HftEB65uT8dlflHtMeSQhMuLJVLzp1ldiJPi3mNwXJJNc2djI/q5ycGQfrYUAOEqcW
         v/NlK2aOGOv0eY37l/7L4fvTUhziQkkCg3rAZwqbI2rKOq8YHXtWgPWnRmslA4x30fKG
         QFSXz6jkpDpyePCCuU/ZZnQSpiKVPlppmpIhSy/yydg8CwRbexUwnjFLVvrNqNpvrBIV
         O0HkCS+BSqfJvDb2AkbOidEGekVWiULC+/8D2KhcR8KmSBSZ1CyJbVdprh97c1Cqtig5
         /RYpnP/ZIANRgTTZfR7JZJftnNjx2rcUoL/mkC1/q10DPiWVDLTwT7eUKB7VPOcbg2Ar
         +wFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776606096; x=1777210896; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bhvXeg9WDuDCHAGv1q3jriiZNOjr7t2RCHZ5SrorAsY=;
        b=eCQnophjr+vW1uUybVJzj76qKJtV7yIc/bd2Z8e8tmc0LVDXUO8XHzm7VWQ2ANto8z
         VMy8mpLRZI55R2VlVI5bvWHPUnG6sREqwG8BUzpdbXrVvIcX8UvxKAmvmu+bVGo2xWeI
         C+HJWRObMylqbbeUJYLB6NUYQ8w6FzcS35ychEbUpaj16p8yA3ByT9e/MNL+EY9NsCsI
         wwGzWeRg99QNy8Jiu25yE3k14MCRWsYzZi9o2giERc21068A8jbGQ4bEATx1l74w5mWp
         dJkoFFTOSMER0t/lpht1dA09NuF5z11QXfSYndGUAY0lqhGtC8zIwdNZKGQGjyPIegzo
         pz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776606096; x=1777210896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bhvXeg9WDuDCHAGv1q3jriiZNOjr7t2RCHZ5SrorAsY=;
        b=fpukicLVRivcGb2uCctkfMhUyJPdMy5oMaLS96PYiujm/87T/VTdOc1UM4BY/2kdoT
         TMYVZ2KhnftXPd8zBNEQHFRyedGqZ7+mPqyEi7mPXtHNFPt+Lvu/3DsW+pYXcMtsHltV
         uLGBBrGEx+BIbu1H8/yKZuBUsXtBrfX5ZR9WUDxhm5FIE+8Ke2R+iQFqgu+StQapoJaF
         9xjRdlM8yxWumMKw/6vVUTUtfdUUTaInEQWgwkabMF9gM0g7YxYvxVj8Veu728UvUf2o
         /ZJGHGFyCNfDzEClxMLWmGRfKFNCJOxudxY8z0Bl64KbWkFDgyziJDHP50+9sBUVmczn
         9+9g==
X-Forwarded-Encrypted: i=1; AFNElJ/GxM1wDReakt8bxl6ZktbxLedWeiPNtXTthO+Pt/LZjoKACbIaIeYg/qJ39+MiC9J/uhB411BfII0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY8R0sHTrxj/e/31lyRjibC/1gtLicNh9fTCfTkNkaTBR1OYVT
	Ws49UHAyMacj6pigEgunVPWkQRIjfLTvtQ8wOkOxzPz0xRlIV4Q3GdRTHPL1P8KsR4pa4vhzpAv
	RoQI12Ox+RRweIvPixxMzGqEY1uMzuYQ=
X-Gm-Gg: AeBDiesjZu1Zr12+egiO0ExEuVBihu3/+Bude7RGqeQq0ZwsXnyce4lTCyp8XOoczwi
	9qV7EMaEZZdURkES6QGv/5IFpAFD00/cXHN//MYVdks2fLEb6kG0dYiVyD1Q8Z0j86CcxhiT7Ff
	/9fg0dCJA4OSFwqvkUKbEUNQvILVQhJZTlTDnwDmi4udmq2HxwHL/YwZC6kRU+ARSqRJlYB5jr6
	BooDaPAJHonftJLym/oYqTMm4JW4s6KxRLV7G7G8xhhsN1U/V3OfiC1TuIovk494hPI1u1AdeFA
	PSZs0Nxc8+2QNOxp9IY=
X-Received: by 2002:a05:6000:2508:b0:43d:7e6f:3816 with SMTP id
 ffacd0b85a97d-43fe3e14ecbmr15264222f8f.40.1776606095936; Sun, 19 Apr 2026
 06:41:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419083125.35572-1-clamor95@gmail.com> <20260419083125.35572-4-clamor95@gmail.com>
 <20260419143346.45ed78c2@jic23-huawei>
In-Reply-To: <20260419143346.45ed78c2@jic23-huawei>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 19 Apr 2026 16:41:24 +0300
X-Gm-Features: AQROBzC9oRegsMB0JD377mwqYwXM9XZykSe1t4A6lF1Rs8q0BlhM7AMgugsjju4
Message-ID: <CAPVz0n1qrSYr16zSSqRHuTWVkRfdC+c9w+mxAhtzgfHzL41XFw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] misc: Remove old APDS990x driver
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

=D0=BD=D0=B4, 19 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:3=
3 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, 19 Apr 2026 11:31:24 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > The Avago APDS9900/9901 ALS/Proximity sensor is now supported by tsl277=
2
> > IIO driver so there is no need to keep this old implementation. Remove =
it.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  Documentation/misc-devices/apds990x.rst |  128 ---
> Sashiko AI reviewing is now running on anything that hits linux-iio@vger.=
kernel.org
>
> I'm slowly getting into the habit of checking out what it finds though
> I'm 500+ emails behind so it might not be that thorough today :*
>
> Anyhow, it caught an easy one here.
>
> This file is referenced from Documentation/misc-devices/index.rst
> so that needs an update as well.
>

Good catch, index was not updated, I will do so in v3.

> There is the obvious point of ABI compatibility raised as well, but given
> we don't seem to be getting much push back on that maybe that's not a sig=
nificant
> concern.

I did not found any ABI in the Documentation/ABI regarding this sensor
using grep, maybe you are more familiar?

>
> Jonathan
>
> >  drivers/misc/Kconfig                    |   10 -
> >  drivers/misc/Makefile                   |    1 -
> >  drivers/misc/apds990x.c                 | 1284 -----------------------
> >  include/linux/platform_data/apds990x.h  |   65 --
> >  5 files changed, 1488 deletions(-)
> >  delete mode 100644 Documentation/misc-devices/apds990x.rst
> >  delete mode 100644 drivers/misc/apds990x.c
> >  delete mode 100644 include/linux/platform_data/apds990x.h
