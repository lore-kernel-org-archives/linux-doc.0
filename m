Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAE8426EA3
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 15:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783612453; cv=none; b=gkk1OEkab/nHC6c9f56jHj/hOeyXF1VudTU18MSRZwevDOp/dWdMutKNox1DchIovhs9LAhl51MBiDLKOxmkvoSKNj3vQGyeCEz4pt0ResXdC6MyUdbVjx59TMiPF61RZK/P0je+9toP6HXAYkPQS9LXA3zZCxh0ZE2i4v/BU84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783612453; c=relaxed/simple;
	bh=E7xh6evd46JlapDcP1wu59TPdEBuTy/YptxJBkiz3T8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqNgyeowOmjniI2qtEArbZApS102ZQvEYffOn5ZbPALRJyQNDynUqNA//d+CmXgfW0AttbDilIOSncVMjNI8H/c2ASnq6YmOTVLGz6WzhC1roMxFu+B2bQyqv5j1Y0/2TWO2umVSaGKwQWzA/4VCGp59eH1mZU4Szb8+YHiOojo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CAhydAe+; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CAhydAe+"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso20557565ad.2
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 08:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783612451; x=1784217251; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iyiC5ezPowkdRB/jC99TZVbd/6jva1/e2ioHJ+vpJlU=;
        b=CAhydAe+OhkxBPdygMWMa98stHEw/YsRduHEum3lnZ9PBWL6Qfbuc/Ejfs7VGCi8oj
         ZuuessoqrKGRMWQSNnBMiBFJkRc08UOfASEIEWl+o3lDzF5qj6OdKecR1fP3mDwtJe8M
         29a/uqvBok7bYqahsDYPvFSjgh62w9n2I1tsVwMoci7cj7Mpcvi1XX4+3axOzFnkok80
         PEbjc/KFGoWagNG1O8Qjm28K57SwFUiJ42uotEG8A76sZOJ7STPEu2noJcwnEoEwWOcv
         3sION70qAfk+4vvN3mArxF7hMjX/x/mBdgdLDL5Dxnt1ZFPjbjvC3aESJo6a6JDgT6sy
         9m3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783612451; x=1784217251;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iyiC5ezPowkdRB/jC99TZVbd/6jva1/e2ioHJ+vpJlU=;
        b=rPm6VZ1RUdlL6zU1yw0bAA+3IYI6CtPY91ghIRaUP3VnWLGV6IbQqRL1wn5o/pmsIg
         0BrVt/kFnOQFaKKuAfVNvO23YtPj6Ax5rkTluh8vqJgEF/fNfCNUOVKWCIJ/qUr7bhf1
         5dTwXXvzyQ6QA3E96MpL4Jmp4MfHgqMclFWx09wZBdPOonbQjlRjKfoYgJSYxgGdbyMt
         98SuUcti6+jQSTzRpnkblC3pfFHffMsevAbVRzNg2I0fPciEc9wn8MSqT9/OZZ7ZuN9N
         LEumaxAbR3u3UYGoQSHKJipjDpANJudE3NErt+d/9sMWW+VFE6++lSmUBpa0/4Yppk/q
         UDgQ==
X-Forwarded-Encrypted: i=1; AHgh+RqzL1m33QYaK/LjBQHrdC3715sGqMS1o4LecVo5BIeqvyzxNxoexdiefeEGPTSYFUotVH4fnhngAaE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBo0Yn9wwwErBvdlGBQ1LYBFq+bqyBK8BJjjEocUXogfdg3Vy1
	kxYR9uYJDMkt1LOEY5l4YAsJy1M1wFZNoPXTJpqtvP2bQvDOfe4ceTIt
X-Gm-Gg: AfdE7ckqkTIoQpxdVfczSfKHUBYOMJ14p5u1pJlgUKCpDXewjsPBrwUQh/7YI32BpS+
	PESkHLnwC0AL17DOQTMAteHj8sb5L30MUqMFNzNnZplaPXXvpt+uNohcKq+NI6kHh1xiA6KdkhO
	veQfaLB4ogOJ8zXZFkpoucwDSFvQ1drMj1WchqDWLKRG3cvG+NYlBMDhymY/yzPHXTCI3kj0mvR
	m+Cniik5yerhSzor4NsQ8ybcT7Mg7NDhJxoo2bth5/FqyZMFUgKNBKt3mCNKVVLKUAYs6JPlpzN
	StVe04YM+UnAmzzQZ6MNPomUyzAqTlR4hvdYvpoBE1/1da1RP2tGPL3L+q+25xQzLnvl8MebUhl
	Da0NExuiNcSNN+RhAhFQIGB4l8qe2pc1WjUxS6F/cWoIoLJXkQZQwaf+uQXr13KPiGUuXuvV/H6
	GQQ2UOWULZiKH8BmUmkwVddb2j0A==
X-Received: by 2002:a17:903:2990:b0:2cc:f4d4:29a7 with SMTP id d9443c01a7336-2ccf4d46bd1mr64154525ad.24.1783612451048;
        Thu, 09 Jul 2026 08:54:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1edb0sm46019575ad.53.2026.07.09.08.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 08:54:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 9 Jul 2026 08:54:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: Fred Chen <fredchen.openbmc@gmail.com>,
	"Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Wensheng Wang <wenswang@yeah.net>, Frank Li <Frank.Li@nxp.com>,
	Brian Chiang <chiang.brian@inventec.com>,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Eddie James <eajames@linux.ibm.com>,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Syed Arif <arif.syed@hpe.com>, ChiShih Tsai <tomtsai764@gmail.com>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	"Paller, Kim Seer" <KimSeer.Paller@analog.com>,
	Colin Huang <u8813345@gmail.com>,
	Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 2/2] hwmon: (pmbus) Add driver for Analog Devices
 MAX20912 and MAX20916
Message-ID: <5b865eed-ae58-47fc-8d80-e14a76a93050@roeck-us.net>
References: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
 <20260707122701.751878-3-fredchen.openbmc@gmail.com>
 <f9e32dd1-7c2c-4055-83fa-94683777e30b@roeck-us.net>
 <ak4QO9uhKOt68dl1@nsa>
 <20260708-true-carp-of-champagne-a0dcca@quoll>
 <ak41BRQBNdsQrYww@nsa>
 <b2a5e99c-6d4d-454e-8ecd-8638e4dc0ddb@roeck-us.net>
 <PH0PR03MB63512A19C32B7722D17D0FD4F1FE2@PH0PR03MB6351.namprd03.prod.outlook.com>
 <CABOy65_GqKiZLM+soZUK_34T8MYZS3dRX38-CMf_Bd1EmG0jhA@mail.gmail.com>
 <ak9gFKkfEgkU_q1G@nsa>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ak9gFKkfEgkU_q1G@nsa>

On Thu, Jul 09, 2026 at 09:54:22AM +0100, Nuno Sá wrote:
> > 
> > Based on the MAX20912/16 specs on my hand, these chips do not support
> > PMBUS_PHASE (0x04). Furthermore, the spec only indicates support for VID mode
> > and does not provide m/b/r. Therefore, some of the features you mentioned might
> > be specific to the MAX20826 series.
> 
> I see, phases are not supported using standard PMBUS.
> 

As mentioned in my other e-mail, it can still be supported by the driver.
That is what the chip drivers are for, after all.

> > 
> > Regarding enabling VOUT via GPIO, our platform handles this via the CPLD as
> > part of the hardware power sequencing. Managing this pin through the driver is
> > not a requirement for our system.
> 
> But we cannot assume all systems will behave like the above. But now i
> do wonder about controlling the GPIOs in the driver. In your system you
> clearly did not need to do it. In mine (testing with a rpi) I had to
> use a GPIO (well I could have used hogs or pinctrl). But if you control the pin
> you do gain the ability to turn off the regulator. If you don't it's always on
> (which might be indeed the bulk of the real usecases for these systems).
> 
Agreed. I don't really like it, but if the chip and some specific hardware
mandate it, it should be supported. However, that code also needs to be
tested - an untested implementation would be worse than no implementation.

Note to anyone from Analog listening: It is really unfortunate that I,
as subsystem maintainer, do not have access to datasheets. That means I have
to rely on assumptions and can not really provide actionable feedback other
than guesswork based on the PMBus standard. That feedback may and likely
will miss essential details.

Thanks,
Guenter
