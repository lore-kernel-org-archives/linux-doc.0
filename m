Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C55B416CEF
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 09:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783502337; cv=none; b=jJ8V/F42PgRq46XA+kPISjvk8+d0T7MTP3+MmmRq0MflqKyd5zCC04gkfxGpOj/JKxwuF+7Ed8ZFUVtziuvWVgxCk0jTdmf3/UIVnzEO7mfaE32acEcbEk0hQJWk4JGfYyqYGgk6wwxtLRoOUtDa81mpJQmEwbF+RoKhmacy62c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783502337; c=relaxed/simple;
	bh=eDH2tYdoi0b0ofvijaNMD2HtX1hICdbEb+w0OEWQndg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZDb3qqq9DgUNEnouKPLnn3Jg368drYA3HgyAylTZOMSWW6sV9RMb00ZEsnMXJA39VxWX8M/ILzXlTyYNhLZZsN7okRqXKg0p971a/4qfeVs2EIMzTlCabJMwUgqyUHk1KH2FBch62nDyLetH6CXV6gy+autn9Cp2V1FQWhXF6EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k+bNX10K; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k+bNX10K"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493b1710405so2619865e9.2
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 02:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783502332; x=1784107132; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hgts3cXxi3OIQen+lK5BRu5vo0eVsiVEbfqLXX+In5o=;
        b=k+bNX10KjZ/1dgKXum247MaFfweyajH+w9g3kTaBKJ3xL4ZYaApM86CMGuUa8RSYx9
         AuNpbtIhdVfnESR1O8cGUxlcxYxgXqbie/YXsMyVdNwk207dtUy2GGelMizr+e98Uvt8
         QUmXIF3ChFqDbS/bf1OxXpRqsjQZABWARZmN6EzEYCS1XTFHZS9Ck6zd/oUhliyS3kPH
         fWRrtBXcWK2HIJ322ZKk8oJrY8+lKaUW5hobvg17qDs/bGZErEo+PcJXlB7XYLncWl/1
         kDnLVaXTDweMTlIQTUb6/69sAjO9ZEfjh3K5fV5FDxjPJ804AmqWhzLZRf5uhaK1Df9k
         xorg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783502332; x=1784107132;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hgts3cXxi3OIQen+lK5BRu5vo0eVsiVEbfqLXX+In5o=;
        b=HytQHsSQVnj+6k8cA71shqKapvoYvac1/iwdnaz+6BlwZm0ZT8bS6Z+D7KOTn78U3l
         XGBjUKvwdwWtWFgVg6+OShD9qIopC5bcomdldamrbwZHki8rgupLHkvfqOvcxvOpOjm7
         tVJlK+RITXMxD0NedFAHds4G0h7ixT+TqwHfl2js+bJ7mJ1FRZBRP0XAC3PatL0vr8OP
         YSEbAM+arVqMIoZDwvz/U6mcTE3aUg7iLv4Sq6o/MhQiAotyv5Lb8oEyD6SBOZ/Re0HK
         owgKDOVrwMjpoIfb8fm4IKkFOF+bAOBUvXaCPeAXM73ngDJrZUbIrrTwaPEwEKNoLL5y
         mOew==
X-Forwarded-Encrypted: i=1; AHgh+RqE1vJHp8Ex6bmexrUfor3VyEqxUMrOh55SxcQDtPPe0AXGu8msT0AooPzr43p5eq9MhdOX/W77cbU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiQytkt7xHeAvTAOghjn3EUHveaMWLKUgAXvZf/jj25jhZqXDf
	0EJqTbhhYaXmqfHX0q81I1Lx67f6x2gK5oR6Q8c5DE4n0IpeBMOdJ+ZS
X-Gm-Gg: AfdE7ckFCf3jPf2je2Jugxrn9RPJx3YKck9qkFn//98hhhrfYmTQJSCmetocf8I3ZRj
	5uJrr5nFwnWXETbVVFhVKeTzhH/x9+tTmqyRoOPS368Ok7EglfZO5tBzYOAfgmuKO3jpSH9kMGC
	yd3sutxc3RixQH8bL/H+rWyvp5Mr8QUhVOXReEjgQ/AVc6amRn8tJCnt5kfJ0RwVsFCZdtx0Tgw
	cj9kye/1JN+INZnkUJX027G5QqJjb6A/lGtRSCXqI6lZ/4OpPWJ+u34LWeUbDN2ZZIaHM87DyLL
	2EPgGSFqCh7dRQcjx43RErnXLuO3lB39gRReuoymxsDXXw5FGPZsix8/cCOES3Ke9D40lnGfKhW
	xMb6mcucu6cYRLpD2HLJWRVZ96dE4t0p2teWnT2AzEDTIlMBeMCMxgdwV58tQhRoNO8Gz++0tya
	3gywJn
X-Received: by 2002:a05:600c:8b54:b0:493:bc4a:9547 with SMTP id 5b1f17b1804b1-493e68815bemr16151505e9.39.1783502332232;
        Wed, 08 Jul 2026 02:18:52 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f40912sm118117685e9.4.2026.07.08.02.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 02:18:51 -0700 (PDT)
Date: Wed, 8 Jul 2026 10:19:56 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Fred Chen <fredchen.openbmc@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Wensheng Wang <wenswang@yeah.net>, Frank Li <Frank.Li@nxp.com>, 
	Brian Chiang <chiang.brian@inventec.com>, Cosmo Chou <chou.cosmo@gmail.com>, 
	Dixit Parmar <dixitparmar19@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
	Antoni Pokusinski <apokusinski01@gmail.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	Ashish Yadav <ashish.yadav@infineon.com>, Alexis Czezar Torreno <alexisczezar.torreno@analog.com>, 
	Syed Arif <arif.syed@hpe.com>, ChiShih Tsai <tomtsai764@gmail.com>, 
	Abdurrahman Hussain <abdurrahman@nexthop.ai>, Kim Seer Paller <kimseer.paller@analog.com>, 
	Colin Huang <u8813345@gmail.com>, Yuxi Wang <Yuxi.Wang@monolithicpower.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pmbus) Add driver for Analog Devices
 MAX20912 and MAX20916
Message-ID: <ak4QO9uhKOt68dl1@nsa>
References: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
 <20260707122701.751878-3-fredchen.openbmc@gmail.com>
 <f9e32dd1-7c2c-4055-83fa-94683777e30b@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f9e32dd1-7c2c-4055-83fa-94683777e30b@roeck-us.net>

On Tue, Jul 07, 2026 at 06:52:48AM -0700, Guenter Roeck wrote:
> On 7/7/26 05:26, Fred Chen wrote:
> > Add support for the Analog Devices MAX20912 and MAX20916 dual-output
> > multiphase voltage regulators with PMBus interfaces.
> > 
> > Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
> 
> Please provide evidence that those chips actually exist.
> Internet search comes up blank. I'll need confirmation
> from someone at Analog.

Hi Guenter,

Well, in fact I'm in the middle of preparing a series that adds support
for:

"max20826"
"max20855b"
"max20908"
"max20912"
"max20916"

All the above parts have the datasheet under NDA. But before we had a
one page "datasheet" in analog.com but I guess that is gone! For context
I mainly did the base (core) driver for max20826 and then Alexis added
the other ones.

Not sure how to proceed... I can wait and then work on top of what Fred
has but this patch is very minimal when compared with what we have.
Like:

* No regulator support;
* No direct mode. The chip has two ways to access registers (paging and
* direct mode).
* No way to count how many phases we have or if RAIL_B (func[1]) is being used at
all.


Some other things more intriguing is that these chips, as far as I'm
aware (at least for max20826), always have bit 2 set in ON_OFF_CONFIG so
a gpio vout. Also we needed some special handling to read phase current
which I'm not seeing in the driver. So I would like to understand how
the chip was tested?

Anyways, if Fred is ok with it I can just finish what I'm doing and send
the patches. It would make sense to have something more complete on
submission but I don't want to just "steal" the work already done.

- Nuno Sá

> 
> Thanks,
> Guenter
> 
