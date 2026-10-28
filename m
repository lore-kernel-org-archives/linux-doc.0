Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206232;
	b=U9SoT9QbKYy57aJd77d7zokWv6G6485dForqfLiZyzlup5tebmzdu1G1386emh69pR1B
	 XJMNg5tB4qhhDwBEPVfoUsH/MIF3RW73mhuEk6hZT7CqllRSpEpTByXHD1Y0/pWjbx1cR
	 gLO3+cFFhLhl/lB3WT/zeHIjf42VFN9q1gWbqJ4JMnLEtWVuKABRJ7+IhTbfuEuvqOARS
	 Mc6XMFLqDb4ofM8UXu/yoNcLsvLadu/mNLCZXPSiHaEkp7efz3Ih6HjnpdI1HA8gZJByB
	 D9JQK1Dh7KHM5NW5cUr8/modCwx1beXxYNm8/6Cn/d4/ItkU9Yc1zK+ququGEcdLV4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=rmtUDKQ0yoNlGhv53ScFwXXOWxSmXa4pTOke6+QnPrc=;
	b=E56Ihgbm1zVW4xTL9r9d6VnRMDftw/e+v2AuBLVS7052hLsh8xQoGHbdjLNA49t51RoA
	 fSTREx7VFYPJ/X4CUTcVmD95rvQDY8KWwG4/iSWIYEJ+9cE/WoQ2ld+SEdwbTPbTHIaoF
	 Ycnly9onlVK59tqFYkbvU7cPHVupdiAqpwA8tcHArxt7hqJ42w5CpRWzdc07Lvn+xSDUA
	 7FXA33zEHvMZpyMyaJmCla2infDd+e+fWyoDkPBK5DFLR4J76eCRwcpR0iRrD6UNvuvyd
	 AsCUZPw4jYRth482LtUkA55RjSiLf4ubSyKDFR8pLIe5DiThl23x/yrg7sbTH0+oB6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5A1606A31F
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 16:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E5A1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso13156455e9.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 09:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793206220; x=1793811020; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rmtUDKQ0yoNlGhv53ScFwXXOWxSmXa4pTOke6+QnPrc=;
        b=gXgEqKbhWXg0LLz9FvWn6V2M5RTpYqWlHjLH0NP+RzhxzISPz7BuGBUwie7l/s0pC0
         dOwOBNbVtUx+iHm3MIQFrm0Q6B8YArSlQrgE2RjwCmAeHjH/rbC2Ago7GMPFouoQ6/Ki
         l5VpdHIlZEAmEJd/hd6iBVSFe7YFraVN9uwKzuPIZY0xxhlmn5iKPXeboEDishSTZ1NR
         kxAs+/bXVi8UcA9VkCQboWB3250MXxYFPGAybyrY1stsxVzdDhdKlq4ix1NqVrhMkKw1
         +0/Ip1FdOvXwVyjfEdFth/TNwiS57iprsQbLE7kk7Ljjlnd8LVfmm4UX1+3z/GKZWwxU
         GfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206220; x=1793811020;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rmtUDKQ0yoNlGhv53ScFwXXOWxSmXa4pTOke6+QnPrc=;
        b=EkY5IZLFJ9lI+oJYpX9Z3GBgBCfYhuKreEnlLnAUzu9hb/jP0bI2nNO79sJkVvXIDN
         KRBEe9w/mJ7Z5Tu+UTYSzu1sod/CWbf7t+7cAEnQl+w4ix+s690hu66KNtDPk3AQO+rb
         AzzLv3WmIpJA6fTx4biFDR2/FXmypLdCluuGntYpgbn9ClOumYHJ+Ukvw6mbxthVJhas
         5YS9NMDSbuTfp2YkgTTgJ0MUPnj+urRDvC4cbfOxEjSklseQ5wKPR9sfFnlFgJHLQNCH
         6EelEnv/7pcrlslhvULygeo8TUy33PI9qRDxhqEv/xliFG4U/vGOKu2laftUJr844PEA
         Ng5g==
X-Forwarded-Encrypted: i=1; AKwUvBzZn3o5CcY/mOkZew7qusNoYYfDIlCKCYxisjoWdj/htZT160tkwpqw+6AxhSrPAIRDaS4SBpFbCp4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbW2ccx2dgoZfTF7ow4hjSubKgAf8ZnbQXIxeTsBlHwXvw6SQx
	Z8C1Vh2rRYQiA5RzrWMbVS65p0LAbxrjAkLSLMQhThb/Z5hAtsS05QJOODxiVsNwCis=
X-Gm-Gg: AYBFou28qZVj3jLGlgHXWWz9dmeXPFGB5ZhM0bMnHYOs0/nEXOa8ro0GzKRjsK4JPjn
	qHniqC+q8KWl1z6lq++kGQ0lcgcMX6VEsNf5noH10sXcQeYSMz4/nFCvusW4+PesnurdidwBHG7
	XdnYDdmnvTCs90g/nkrvRoI20Xoof3nbAUzFRnhxQj/Apg8Q5K3Zl6AjY6WXIxhDEFpPrP2yTQX
	f+THDvIPseljWuLjvswVcvBU//K19UzG4IBtv7gTGRmY7ZeJoyYKwvObnqEgY6MsC0+OJzYWbb5
	U3mKSsWqXzWdTcSrpx7nLH3mr43HvXEm36rTBe19bcIP6mTXiYL/0UOcpwNBmm//PITjonSxdz4
	ZVp1JOibyN2WnzXZBZpyoluhvFE2OKOkpWA807AvgBzPysn3J84W3woWvAQunerL9bMjT79HyIv
	Q3dSforliy66UYuLrbakkjLC8cc43rRo0PK8oKUFOqnxIintf3IgaB0r27JVPpgIZBijfTU4Qb2
	o1cCEHk8JyASgxCraPNQbHUrRFqTacOxA4J3I9h+zSexQp3erJYi1y0zVI8j6gyUYmpstKBblgA
	+YR87fzk4l6yUJjkoMxEl8xVsUf6
X-Received: by 2002:a05:600c:1986:b0:4a1:fae5:f2e2 with SMTP id 5b1f17b1804b1-4a9643d5154mr61518125e9.4.1793206219964;
        Wed, 28 Oct 2026 09:50:19 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94e4be4b2sm38091265e9.2.2026.10.28.09.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:50:19 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 28 Oct 2026 17:54:12 +0100
To: Guenter Roeck <linux@roeck-us.net>
Cc: Gary Guo <gary@garyguo.net>, Andrea della Porta <andrea.porta@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pwm@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH RFC 0/4] hwmon: Add fan tachometer support for Raspberry
 Pi RP1
Message-ID: <auIotAwnOWKNApjp@apocalypse>
References: <cover.1792748690.git.andrea.porta@suse.com>
 <7df58d42-517c-4936-88b0-9d044d30882c@roeck-us.net>
 <auBzvB8TsvIK8Hik@apocalypse>
 <53a4b4bb-271c-4d2d-a9e4-cec4e0ce214b@roeck-us.net>
 <DMFPE71J8205.3FZKD5BKW3U7C@garyguo.net>
 <b02b4f0b-ad2c-453a-b69c-a0865a333d62@roeck-us.net>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b02b4f0b-ad2c-453a-b69c-a0865a333d62@roeck-us.net>

On 09:13 Tue 27 Oct     , Guenter Roeck wrote:
> On Tue, Oct 27, 2026 at 10:51:15PM +0800, Gary Guo wrote:
> > On Tue Oct 27, 2026 at 9:48 PM CST, Guenter Roeck wrote:
> > > On Tue, Oct 27, 2026 at 10:49:48AM +0100, Andrea della Porta wrote:
> > >> Hi Guenter,
> > >> 
> > >> Yes, I also proposed that in the cover letter because auxbus seems also a viable
> > >> solution.
> > >> 
> > >> The current implementation is a consequence to the discussion about the companion
> > >> PWM driver, from here (and the revisions that followed):
> > >> 
> > >> https://lore.kernel.org/all/cover.1775223441.git.andrea.porta@suse.com/
> > >> 
> > >> To give a short and hopefully coherent view of the decisions, here's a breakdown:
> > >> 
> > >> - first proposal: PWM driver + fan hwmon (to read the RPM), all in the same driver
> > >> 
> > >> - V2: Uwe preferred to split the PWM driver from the hwmon one, so the hwmon was
> > >>   dropped from teh PWM driver in favor of a future (fan) driver. To accomplish this,
> > >>   I moved from readl/writel to regmap + syscon.
> > >> 
> > >> - V8: Gary proposed to export a function to read the fan RPM as a viable
> > >>   solution. As a result, the regmap/syscon was dropped as it was no longer needed
> > >>   and the function has been exported from the PWM driver
> > >> 
> > >> - new patchset for fan driver: the now independent hwmon moodle just call the
> > >>   exported function from thw PWM driver.
> > >> 
> > >> If the auxiliary bus is indeed the preferred approach, I'd like to ensure we are
> > >> all aligned, as this would also require refactoring the PWM driver.
> > >> 
> > >
> > > Let's say it that way: If you don't want to implement the auxiliary driver,
> > > and you insist using the exported function, I would prefer for you to go back
> > > to the first solution. The one thing I really dislike is conceptually broken
> > > code, and I consider the current approach broken. Your call, but the one thing
> > > I won't accept is the code with the exported function.
> > 
> > I agree on the auxiliary driver part. However, I don't think EXPORT_SYMBOL_NS is
> > an issue, and regmap is not the right fit here:
> > 
> > - Previous version of the PWM1 patch series publish regmap using
> >   of_syscon_register_regmap, but this cannot be undone -- which needs to happen
> >   on PWM device unbind (the RP1 PWM device is itself platform device, but RP1
> >   chip itself is PCIe device which must be removable).
> > 
> > - The tachometer register is not its own separate register, but rather (re)using
> >   the phase control register. The phase control is not implemented in the RP1
> >   PWM driver on the list yet, so this is currently a simple register read -- I
> >   can see that RP1 PWM driver need to take special care to about the tachometer
> >   reading if the phase control is implemented.
> > 
> >   For the two reasons above, I think the way that tachometer is read should
> >   really be an implementation detail of the PWM driver and not for the hwmon
> >   driver to worry about, so I suggested using EXPORT_SYMBOL_NS.
> > 
> > - EXPORT_SYMBOL_NS is the documented way for exposing functionality from parent
> >   device to auxiliary drivers: https://docs.kernel.org/driver-api/auxiliary_bus.html
> > 
> 
> Let's agree to disagree, and keep the code in the pwm subsystem.

And auxiliary bus it will be. I propose the following:

- drivers/pwm/pwm-rp1.c: create an auxiliary device for the fan. The function to read
  the RPM will not be exported, but a function pointer will be passed through the
  private data to the fan driver. No need for regmap. To be taken by Uwe.

- drivers/hwmon/rp1-hwmon.c: The auxiliary driver is probed against the device registered
  by the pwm driver. No imported function. To be taken by Guenter.

In this way, we decouple the two drivers and we leverage the auxiliary bus paradigm.
Also, no DT node needed for the fan.

Do we all agree on this approach?

Thanks,
Andrea

> 
> Thanks,
> Guenter
