Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795774053;
	b=jiuRYYbphv6aMu+2yrfJMt3USVWR/sRpDruWWk63GXNddjo+d0vC8CH6b/M7cvUi6mi7
	 mSKP+/2MuNuKUEtg9M21wtfaP05AYKiZPHj0ojDOggvxWhRimpitgkJiBCEfacOyUryQX
	 X/nkxOcZX6DC51FCft1gR1vQp66yJT2rR6HkNP3HJQujFHbL+GQqcrBtmDPrYtwgKySeq
	 BEuUPIWl/6DTSkmlZDaM6H/LGGDyN4rqd28A9dCl6qr6+d1luQ2HlHhbEqkeJ1n3Z7V19
	 RImZz6JgijbRlJGx38OFiXv3UOVGwoZMNzJpiEKcAZYjsiDviY68Q6Y7ZrKqA8wDH/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=S/PXjXpl1KxRCCiW3qKqRyfY2HAeEsAmwu7iETB2+Lk=;
	b=cMRbQLA7WwAEF6osGL1Rmne/5ytAjlgijO87bBehP9Cp3mK2Ng/9ImX4JDxjelE7lnVc
	 iZiKhtlQhmZNY/+v8vgM5L9UrLVlDcC80vMru+cnLuYucD+7MUfXUOTU5kgVHKAtCBYK7
	 bNpPXr7cSfEF1rdVGd/0TzkikkKMj1w3/6IrHao9HC0xW0NKeFTmYF4UufwXvqYsXXikd
	 OUYTzzDlCQXQfCwD+S4NPOt4navcmlR/SsdrqlKWTR7TmYmJMfodL8rnWckhAd2T/NA0F
	 qJbmtcAX9k2esgha6wxGoTd4tSXYEDPYkF0DEXuL5L7FtDijopIXiaYRpnt1saisGJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T8ZERY7z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B9C606A332
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 10:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62B9C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T8ZERY7z
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso7130203e87.3
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 02:07:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795774050; cv=none;
        d=google.com; s=arc-20260327;
        b=ZVaxN/E+gseePgRd42XRVH7NZFnbRK1HhYpwWl2q3fhib4vhTU/3CGrLZinzjzIk0K
         HKtUe4P9ZFwmsbLQtAi84UsnptewL+HRcxVSxFaYfpojqzpoKZShHUtQjwqONYmtqlmH
         Bu5efCdKndLOqFRYhENHnu89Ayp8Z7xXKPOalJW+LEfCMi9FTloT38+YmwbGdP7vvER6
         8E6Q8pa0C7ult2RtuTNIOr/f+U+RxU3Fj2ES8lYgQfLFkDgamp//tNl01r7XtWU24Nwc
         QDdUo1hBKKeHKXwTeSjkHeYr5+qeB6Jexu9Sa7joFf97u0PiaUmVlTDkNEMDDbgb0RmT
         FCFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S/PXjXpl1KxRCCiW3qKqRyfY2HAeEsAmwu7iETB2+Lk=;
        fh=NiC7bAtB+6/h+7Idkc5nub1ZjEBoxj+0Q8il5Pq2aJE=;
        b=sTtTo41CCsePVj7eRoF/yd+p+cTmsgiaDxTFEEbzfZFqr4EsQMFp21kOnZAUbU0vpI
         wO1LV96KBJgmvGbp9+CGWZhXgnvxn6JoP5Dg4D94Vxgoz/Jb0nxhWFAqm6ZQQ7ESp+hS
         z7mcl6qDU1UMCW5JV1ogwJFqVoPjTTaeIZU1NuiyJLox+4CNSUBTC02tkz30xbarOBel
         ee7IwtvejPcRxVTKhMTXbhzuwn8kM23d0M22HPsr1/hwLSFFVP50z0POba/YvE9nxXhq
         ZMJ7i9DYW/ELIDBCmDB7AKnogL2C7k5Rkg4HvGkqQ03yzqtUG6803CCjlYH6JBHhr+Es
         iGcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774050; x=1796378850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S/PXjXpl1KxRCCiW3qKqRyfY2HAeEsAmwu7iETB2+Lk=;
        b=T8ZERY7zD/vy0H1Rb2du90/b67CWcF96NyZsqFxOi/RYxzLhB+qwyRH8qcWPBraa8v
         mW2zbzSP49Foraqc+NQDAmXZ1wubTXXFWND6ZtkJhZsKeALOmqaWo2ukNLoEvE2+62ZK
         6cLWHCumugFsUXIOtnP1I6tOsdCFTb7E+KqpznZQ9CJe95VPa1CX5Q3G6qZlNTsxFj7I
         +oKRx6WVXOXR0C9HVFtpTdRHu+eXoKolZFYEVFXpOd1/gQmHnPvjxoxPAEZfwuB0CqQj
         ZwCKClrm4FF4FjWeUhiqnMc9RPcBVLJs6R10KN7KtdHAmOMrEx1LzrMDpPSd3zjZIM7o
         EtSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774050; x=1796378850;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/PXjXpl1KxRCCiW3qKqRyfY2HAeEsAmwu7iETB2+Lk=;
        b=TPuXhYnfZzaMkexZB9etAcKPYTdDLjR571wiaWQXiKVb672rdXdSiEF297wLd056lH
         29WfnHOjvvTvsfMiX4RU49cdHwI10pgQSPSrUsgK2DcUkSoOUh6Nu0ahRQzcwcxpZuFt
         d/tcn+gIxWPMWgdcvGk2asi4nxS92BIpsV9uZhDkTjinqIEGMrUHYUfvN+1Sc+Nzxdmu
         fic7dPYniWRIh5tZOYQrUEfrvrBfVs6HaGC4fIVoMwXReAIg6hfuP8EfujAPbUTF6NWl
         tT0V+AVe64iSMberfDl4onbF+3vhD6V9fYzSHT5ZXAe/rJehXZUiwKh4dWF8saTXqasp
         bPQQ==
X-Forwarded-Encrypted: i=1; AL+hErGJXP/OR8OxHnC1+cmngQi93SMskRg0sBcU9uWfmhD8jWWmsonCFZMd3OIZQs8jsWYJzMglDLtwBrc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ob47a8RpbkhLn7xGP7SJNKrbya/0jLQuzVproZXKQyHw2PqQ+
	Azf4FPA5F30o4/pIPw2kpl9Ljxh3kTO3DWH519oM8lR8neq6lmVj1ePrWuzw2RgmCCMflS00VIM
	BtC0iMjh1ei+eiDpmGaQulBP0StiLVg0=
X-Gm-Gg: AZFdTZfDFHZOJdssfJ3EHdXGr1rXJO9DAUrVOWn6QkZ4Zk/xs5cGi/f5/ezPZnEpc82
	IuC43yRSl/MWiQzWVoFoq640ndcUw4gBsfHLqGZ6XtlY4XjsfDP7dgoGoN4lWzhE8bGzo3P7D5Q
	UDLr4GsuonSFP7fVgn7h86gLR7f61eKG7gjPTZdKBmK7yY9/Tmjn2U8Sx7fXAtq4LKjsT9ZKfuH
	F5TKMjEac2WXz//n5f8sc1qPimniPLLZ0LovTckApRwkLxaNx6Y5Ceyq6Ir6P/5Ot2nQ0k5RYMu
	jDecIZ/YBD3XdY73aQEsYDFHXqC6Ki/3Lfad1dcf3tNsQmRA2mOGlM7lmf5g4h/JNjzvj5fkwyw
	ol5LlcH4XuInxL/ys8zTBrubfaIH+7MXTLx8TzIiTdDecKIEd6zri25nbvv4ekBOVaoxFvlbiDD
	5FClhML8F8y/QJmZc0kiC0XkLRKjN0tT0=
X-Received: by 2002:a05:6512:10cd:b0:5bf:f8fc:7b5e with SMTP id
 2adb3069b0e04-5c1bc89c61fmr6700305e87.55.1795774050347; Fri, 27 Nov 2026
 02:07:30 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121-at550-rfc-v1-v2-0-b0309d0789b2@gmail.com>
 <20261121-at550-rfc-v1-v2-8-b0309d0789b2@gmail.com> <awQEP9bHA0RPfRUA@monoceros>
In-Reply-To: <awQEP9bHA0RPfRUA@monoceros>
From: =?UTF-8?B?57Gz55Sw5oKg56KB?= <yogo.0917.sabu@gmail.com>
Date: Fri, 27 Nov 2026 19:07:18 +0900
X-Gm-Features: Aa3M54o3XA2vGbw-lT3h-QsKcDE27T0mWx-80FMotXTw-keuMBkBtHCZ9WsWU5c
Message-ID: <CAJGK9zaVJ-42c-AnZuXBW1uskvmRQv1ePHQsx=BMz55RfznomA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 08/13] Input: add polled SiRF AT550 resistive
 touchscreen driver
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-doc@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 10:16:56AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>
> On Sat, Nov 21, 2026 at 09:43:18PM +0900, Yuugo Yoneda via B4 Relay wrote=
:
> > diff --git a/drivers/input/touchscreen/at550-ts.c b/drivers/input/touch=
screen/at550-ts.c
> > new file mode 100644
> > index 000000000..89c2d2701
> > --- /dev/null
> > +++ b/drivers/input/touchscreen/at550-ts.c
> > @@ -0,0 +1,124 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/* SiRF AT550 coordinate acquisition. Layout cross-checked with AT551 =
draft. */
> > +#include <linux/bits.h>
> > +#include <linux/input.h>
> > +#include <linux/input/touchscreen.h>
> > +#include <linux/io.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
>
> <linux/platform_device.h> already provides of_device_id without the
> implied dependencies you get by including <linux/mod_devicetable.h>. So
> please drop the latter.

Hi Uwe,

Thanks for pointing this out. I verified both built-in and modular
builds without <linux/mod_devicetable.h>, and I'll drop it in v3.

Best regards,
Yuugo
