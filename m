Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E629A431496
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 16:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783613302; cv=none; b=pa1xX4a2uJq69Kx9VZ3qK/GB71PUQFuvNCRhbM2un6V/qg619WLwY9BYmB1sgnF7DFSrarcdDQ3vuFP6HYyU1pUmV0Noa8eCS/MQKAgznnlTaMdXDdTqnrNXfcgXx0Jur/EZUX726ce70xjpjVWoZSlhswKoYD/5G89OXnDWnDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783613302; c=relaxed/simple;
	bh=O4qNM2C0nbt2VbBlFC31/e1eUeaxHOXJ2oTMrSmpe0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XHcnsebvW/ynpDURHp64AIXbAg8YK8Ja8mdMJZ1VIvui5EMzg00k55B455/lClLZAla+hF+1QsHAr07IZc/XBSnpxJQRDHNt9NLdJGFiiAk5uqhU18meDQPrgANRr2REErgm8CJB9wY4daVrg3696AI1X04WgSUruhBqCI+EYDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q3CX03Bo; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q3CX03Bo"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493f25d47dcso881545e9.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 09:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783613296; x=1784218096; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E6idM/+ud/Xn7x4a5piPI4eTdbJ2+tm5HROj0RrFqGw=;
        b=q3CX03Bo1EI6Xj17QBACUu2hZO9GeMn6jlSukLMs8bE2/Iarf+HuJ+nCuuKLX5QbMn
         9Qd/ntD2Iq2J8lS4XEiA6AtJvZo5+rNeKthQtJ9Vk/6xdypBYmX30pObmjxoZ3IeCBg/
         QElwVDrqKoR/SwVA4At4rg5b47OidgzvcOLVRKsRTrfqggsFMnwywQ5G4znG+nQ/AH/X
         h7PBPMlfPXXL7abEc/NBFZHROrh9g4X8+XBdWdxYtM06oA6rY6i3K6zn+n6nUfFgeQdz
         LT8jT4aEcBC1bKq/LNGmPXYlWz58fJLfq5guTIfwgCSWlNb5XmNmT6pEsXo2ccUdNMuY
         awMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783613296; x=1784218096;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E6idM/+ud/Xn7x4a5piPI4eTdbJ2+tm5HROj0RrFqGw=;
        b=GnRBt6k4qeNZ7xzmx9LymekLxVjOfstD3+ud22Ib/ggO+U23oAP6/fFXHd1PaKNUXo
         Q2570YI0qFlF2hRh9xSDJLBs0ZmvUkXJzu6/4ZpLwsOsoo8nF6kNpuFhrNcMIiVvm4c4
         USvR3W6U99k/ymyNPiFZMMgfCHZONafAiUtS39whLeba7f/21lxq/v07N23Wtwj5q2ur
         u8f6wPI7hy0YbMv+RusxeSP//ZLb1ya+vVeePPJqZ10R2cjuF60rcpZ9Wea9RcOKWWM9
         KP1F+9onPrceUy7d8lVmFM6o1QNKuSHiCFWjSvvYDg56YLPxle96xjrJp56qluf+P2TL
         KDqg==
X-Forwarded-Encrypted: i=1; AHgh+Ro9b+2GTw5O7vgocKVKGAYSSVdpsscoQ9gCM5kDXuyKnyd8zK5InI5hvXGRyUYv06sgb51vlMpPl4g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn+5BUpispF6fXJYfisa9yoP9f2kvI4QNV59Z3ln19CZKzSL0h
	63PgclPAJ9dj+h6pB74PuO/a32szYSCoh2V47Y3xPLRF/wM0f+Rdj+fR
X-Gm-Gg: AfdE7ckDvrbS4QJWMvgNJOfXXLsCpeKajGhXdKbnpQ0cvMpmIAGJS5lXrs5ByD+3sL7
	FN3PRz1ijCeyYXn5uytIG8XnwM8yXUw3N1mrMssIO4/aE6du/6XeDumlkUkC98/BcRhijYCKkYQ
	GgSII/eSqZGzr5SkWDrElERx6+NFVg1NdcWVh0WNAPb5WswWbKrP/TxoE+P3xkoO+P2WSppvQJD
	NhwymC2/2TMs3/l/FAq3YUhuZs90Iy+ycaenpJvs/1WM8YzaDsgD1mS+xY8SMpUlbqyT7K5U+4o
	qsmTBX/EhTMu175CjYbwuRYKS7PnRo9unezqcohGJEepcYbGHJfdk9MBUSRK1JxqfJ7c2EU6dBh
	rajlU0lwq/1Fpx+ngWVsaQSKz5et+EjwIZukMoigcAbEx6db8Hmef2kUUU7da8GyYJjew/Nmywy
	IqEX8sSDrDiohEpQQ=
X-Received: by 2002:a05:600c:a00d:b0:493:a96b:fa0b with SMTP id 5b1f17b1804b1-493e68beea6mr80777025e9.24.1783613295994;
        Thu, 09 Jul 2026 09:08:15 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960b06sm51644492f8f.28.2026.07.09.09.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 09:08:15 -0700 (PDT)
Date: Thu, 9 Jul 2026 17:09:20 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Fred Chen <fredchen.openbmc@gmail.com>, 
	"Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Wensheng Wang <wenswang@yeah.net>, Frank Li <Frank.Li@nxp.com>, 
	Brian Chiang <chiang.brian@inventec.com>, Cosmo Chou <chou.cosmo@gmail.com>, 
	Dixit Parmar <dixitparmar19@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
	Antoni Pokusinski <apokusinski01@gmail.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	Ashish Yadav <ashish.yadav@infineon.com>, Syed Arif <arif.syed@hpe.com>, 
	ChiShih Tsai <tomtsai764@gmail.com>, Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
	"Paller, Kim Seer" <KimSeer.Paller@analog.com>, Colin Huang <u8813345@gmail.com>, 
	Yuxi Wang <Yuxi.Wang@monolithicpower.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 2/2] hwmon: (pmbus) Add driver for Analog Devices
 MAX20912 and MAX20916
Message-ID: <ak_G4_eAUYflt9M3@nsa>
References: <20260707122701.751878-3-fredchen.openbmc@gmail.com>
 <f9e32dd1-7c2c-4055-83fa-94683777e30b@roeck-us.net>
 <ak4QO9uhKOt68dl1@nsa>
 <20260708-true-carp-of-champagne-a0dcca@quoll>
 <ak41BRQBNdsQrYww@nsa>
 <b2a5e99c-6d4d-454e-8ecd-8638e4dc0ddb@roeck-us.net>
 <PH0PR03MB63512A19C32B7722D17D0FD4F1FE2@PH0PR03MB6351.namprd03.prod.outlook.com>
 <CABOy65_GqKiZLM+soZUK_34T8MYZS3dRX38-CMf_Bd1EmG0jhA@mail.gmail.com>
 <ak9gFKkfEgkU_q1G@nsa>
 <5b865eed-ae58-47fc-8d80-e14a76a93050@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b865eed-ae58-47fc-8d80-e14a76a93050@roeck-us.net>

On Thu, Jul 09, 2026 at 08:54:09AM -0700, Guenter Roeck wrote:
> On Thu, Jul 09, 2026 at 09:54:22AM +0100, Nuno Sá wrote:
> > > 
> > > Based on the MAX20912/16 specs on my hand, these chips do not support
> > > PMBUS_PHASE (0x04). Furthermore, the spec only indicates support for VID mode
> > > and does not provide m/b/r. Therefore, some of the features you mentioned might
> > > be specific to the MAX20826 series.
> > 
> > I see, phases are not supported using standard PMBUS.
> > 
> 
> As mentioned in my other e-mail, it can still be supported by the driver.
> That is what the chip drivers are for, after all.
> 
> > > 
> > > Regarding enabling VOUT via GPIO, our platform handles this via the CPLD as
> > > part of the hardware power sequencing. Managing this pin through the driver is
> > > not a requirement for our system.
> > 
> > But we cannot assume all systems will behave like the above. But now i
> > do wonder about controlling the GPIOs in the driver. In your system you
> > clearly did not need to do it. In mine (testing with a rpi) I had to
> > use a GPIO (well I could have used hogs or pinctrl). But if you control the pin
> > you do gain the ability to turn off the regulator. If you don't it's always on
> > (which might be indeed the bulk of the real usecases for these systems).
> > 
> Agreed. I don't really like it, but if the chip and some specific hardware
> mandate it, it should be supported. However, that code also needs to be
> tested - an untested implementation would be worse than no implementation.

That's how I tested it :). So from what I understand the preferred way
is to support these pins as optional? If they are not there we just
assume the pins are always enabled by some other means? In contrast to
what I have today which makes these pins mandatory!

> 
> Note to anyone from Analog listening: It is really unfortunate that I,
> as subsystem maintainer, do not have access to datasheets. That means I have
> to rely on assumptions and can not really provide actionable feedback other
> than guesswork based on the PMBus standard. That feedback may and likely
> will miss essential details.

I cannot make any promises but can at least raise this internally.

- Nuno Sá

