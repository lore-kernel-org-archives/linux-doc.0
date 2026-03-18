Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7890B31353C
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 16:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849805; cv=pass; b=R5K9Vxm5wP2+yu+n2Wf62MJxO/mDv0cMmjUONuHxAnS19h+EQIuPARxEO8NnZPcDblNMNhpaFBAdE0ZeZW5LDKso6O057r9WfgqvMDndLboWDRXlalrKelglkZ8vWK0m2eOzNWp7Oa6SAu6fxIYSPSl7EJhy3QQ1CwZhtHjjrEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849805; c=relaxed/simple;
	bh=whUst5kD5E4ZE3YDOSV+OSVwVL0wed8ch5z/VyWCXig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dd43BqFLtG/UhH1qu4MIWnlMscJvO4Mt328udimbHi4XW6EvK/5+wn975u3FFj7XDJ7jFI/Nzv4GlhxlYTn196A/06qht9SoDbdgldUXgfXmsxpRNXP094qLh1nTq+XPVKXObnVouc/K34Sj7Tz47lsBWb+pl2bQhYI9+2ztc0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NrvFKfJy; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NrvFKfJy"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b97bca3797dso513189766b.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 09:03:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773849796; cv=none;
        d=google.com; s=arc-20240605;
        b=lTBxAk6VfwQJEAlduITQ9N4IyoUrpdu6E8oU/9/7R4hn9FSlIz0yp8CuvAUxnMHzTi
         RqA6CvqrAAO8Sl1SrK15NjLaqetbM34JQ3qEBBMq26Mk1G2qj2+M1YTqPJ3wrpoHilSO
         qQ0sysR9/Gfa9Yfx9w7N9KvVkW2O5tQBZc0MnFun+yiacEEc31QRAw4cgwU4HXpaF5dG
         ByV6XYNhlKBGiW/QqCRGllTqvNIFcFRpSz2DSu6P98kh3NU9f1ju+C+BJue01kV4BWT8
         +gWy42xHrewXOiyoe5IITiYD+M26ytllkM6VbQ7wzQ6PVGBosaZ2hGSkjntzaZqXqLnp
         uUEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Swz0XhdroxzWkDHIYYyMmBF0VrlYEkeUluciyU8bDwM=;
        fh=2Yup9b1rA7aPmykDKO+Y29j7wvhrEAp4h/sbxpH68x0=;
        b=VjAgl01obdAlxeDKHOzSnvD3tfYL4E0JD3lFTY+x1HN9cqKKUsMag+54H7tPoS9GC1
         he7zF5ZKYbeGNcO0m2gCDj8fSq6K+Dmibt5s44Q2/IFhNMDM6fbpx4/WSUA5+APixgkp
         komUukr18xAcEEhWOpVVYXhDOOgDI4sDruE7+DxseAcPctl+kyu4rv97tbw77u8aK3Dg
         RfP+JVUCrQMFylznaUBkSLzamUAufc3WD1gnBdzTqAcvt530TXizn+L44UMnYAm/j76x
         pXvgrHod1VJPqAe1PU3MzgyuKcGHiS/F3WeBO7z/2Gd28RcXXrQBm870WC3vvTlz/2rb
         YKwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773849796; x=1774454596; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Swz0XhdroxzWkDHIYYyMmBF0VrlYEkeUluciyU8bDwM=;
        b=NrvFKfJy8CtNVdNccGFS39F+Doot4zdly3PsBWy04M7efbIcf6JilwzgwZ5tKcxYvE
         CRsztuu8mCaeVzWm8JS8NQJo8NiV+qUdakCj+PcJCY5f9k47Y9Bzl/s2JryZnZYbIQJ4
         Us/Q6uozSXjJ2OHxxlKdUPPtzhCLXNQV88EcL9igVFlszfsI1/PHUPIpZQ42UUpMqSQM
         Qb1vV55lgYIoRD0ARNuuIEsSzK7rgFpdNAbbklTL6awoS2ak9qKkt/HctA0Lqi+BKIO9
         yW/TET3gQkdUt+yvJpODff1zYn7V7WIgZZMyyEUk4J6HO/ZMfVW4Fn4uELApzY2iMTeA
         IOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773849796; x=1774454596;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Swz0XhdroxzWkDHIYYyMmBF0VrlYEkeUluciyU8bDwM=;
        b=lGK5LOQfSXhnXjjYbvGssO6juut1htdNAImKWSfhtx0k30BAI8HewSWKn+7nyPBND0
         zs5L13PWxWxgRfebcl62K3D3cgZtYQXSNYcpK/eXfEG+Hhrz87WUiZfKqz2lRYjyb3Uk
         rnVf2bwwgiZ8VB2YgL3zsuqqrR/wK+F8E09b8lwwp5+HAI1XqqtiF9Y6Kg9Hmb2E+mtR
         Jsx6Vh7bTj9oDLJtu+PjGB/qS/RgFTvbXMbGkSh1dORmhtKf4RxPr365/3azUG+s/1wu
         Yr8wRhLZPnGHOwHx3H1nKgQs9wxrFho7UrpyOvdNUs53x2rSmOI3XnafpHc+6JxrYinC
         Hz+g==
X-Forwarded-Encrypted: i=1; AJvYcCUFbfJfPhuWykI9jz742glDZvNh/B5lwlppEflRqq7gDz+HIlNywbhN2buCxdtq3+HvT3/6vhA3QTY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVsBWXr94ipNJXcqgM8NSx5kLch3s5aBmmCoAKM8eF0+oKNNsn
	fNudnJfEy/YeVdgfH4YI1bQIoGi2V2DKBMZq3CwirTVVBBEPDbIG8nSaGeLdAb3TGcisVw/G5q0
	n0gaY8joC+PQpJO6oJH+FtGqEkkGiL1s0vOTTsziyhg==
X-Gm-Gg: ATEYQzwSjRwPj6DQgscz3HnlWfw6O+sEdAdesDbtSyOwJT46aVv2AnK4YInGGQfrNVD
	xcp6CsQ86p+Eorpr5zVQFoYg6Fmfb6uvJAB6YvtgdUkbqFqxxxUkV/SbL4pwpmorSawkqtnefNH
	xQGxOl2/PSN0J77S6UlcT99IEpCaQslXJtANLm9liChFpZAdrX3sls7mK/Ra501XAytx+F/R6J/
	7yT8uHiQY5Tn7Lty0/xfq1yaeBWkIe0HLJzKpdkwfinMqBuzHfam1C7GTgoucKrG2j5Xl6tU/Lx
	Fr02RVlIWrsvD9Y+55oM+pV17mSGvFZOVIJljfCY
X-Received: by 2002:a17:907:9811:b0:b94:24:44bb with SMTP id
 a640c23a62f3a-b97f49bd1dfmr258135566b.42.1773849796081; Wed, 18 Mar 2026
 09:03:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
 <20260313195801.2043306-4-shenwei.wang@nxp.com> <2aa1d063-181f-4145-9f1f-7e3012c4d0af@foss.st.com>
 <104e9861-bfd4-4e0f-8967-a849edf7e6fb@lunn.ch>
In-Reply-To: <104e9861-bfd4-4e0f-8967-a849edf7e6fb@lunn.ch>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 18 Mar 2026 10:03:03 -0600
X-Gm-Features: AaiRm50ET16GLgpYC6lwF0jbLmfq5CygllZIeseBjuujZbOA5MhL0hZ6kP_Zg-Y
Message-ID: <CANLsYkx6KhspTjzpk51ywfgWcf-FR7-3XrH=MmBi_W6yZmMukA@mail.gmail.com>
Subject: Re: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Mar 2026 at 08:11, Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > +struct rpmsg_gpio_info {
> > > +   struct rpmsg_device *rpdev;
> > > +   struct rpmsg_gpio_packet *reply_msg;
> > > +   struct completion cmd_complete;
> > > +   struct mutex lock;
> > > +   void **port_store;
> > > +};
> >
> > Except if I missunderstood Mathieu and Bjorn's request:
> > "reuse all the design-work done in the gpio-virtio"
> > We should find similar structures here to those defined
> > in virtio_gpio.h.
> > struct rpmsg_gpio_config {
> >       __le16 ngpio;
> >       __u8 padding[2];
> >       __le32 gpio_names_size;
> > };
> >
> > /* Virtio GPIO Request / Response */
> > struct virtio_gpio_request {
> >       __le16 type;
> >       __le16 gpio;
> >       __le32 value;
> > };
>
> The core of the issue is that Shenwei is stone walling any change
> which makes it hard to keep the legacy firmware. It is possible to use
> these structures, but it makes the extra code Shenwei needs to
> translate this protocol to the legacy protocol more difficult. It
> might need to keep state, etc.
>

I agree with everything Andrew points out above.

> Two points...
>
> The firmware implements more than GPIO. There is definitely I2C as
> well, the first version of the patch has bits of I2C code. Looking at:
>
> https://lwn.net/ml/all/20250922200413.309707-3-shenwei.wang@nxp.com/
>
> There is also RTC, and a few other things which don't directly map to
> Linux subsystems, but maybe do have Linux drivers?
>
> Give how much pushback there has been on the existing protocol for
> GPIO, it would be wise to assume that I2C, and RTC is going to get the
> same amount of pushback. If any of these three, GPIO, I2C, or RTC
> decide that only a new, clean protocol will be accepted, no legacy
> shims, the firmware has to change, breaking compatibility to legacy
> protocols, and the accepted shims become pointless Maintenance burden.
>

I have made this point clear before: modeling legacy protocols in
mainline doesn't scale.  Mainline uses a single generic protocol, and
yes, it means breaking legacy protocols.  This is the cost of moving
to a mainline kernel.  If people want to use the legacy firmware, they
must stick with a legacy kernel.

> Point two is that the customers who are pushing for these drivers to
> be added to Mainline probably know that nearly nothing gets into
> Mainline without some changes. There is some short term pain to
> swapping to Mainline because of these changes, in this case, firmware
> upgrades. But in the long run, it is worth the pain to be able to use
> Mainline. And those customers who don't want to upgrade the firmware
> can keep with the out of tree drives.
>
> So, what are our choices?
>
> 1) We accept the code as it is now, with the shim?
>

NAK

> 2) We keep pushing for the virtio protocol, with the shim?
>

NAK

> 3) We keep pushing for the virtio protocol, no shim, firmware changes
>

Nothing will get merged in the RPMSG subsystem that includes support
for the legacy protocol.  Not today, not in a month, not in 5 years.

> 4) We pause GPIO where it is today, and restart all the arguments with
>    the I2C driver. We can come back to the GPIO driver in a few months
>    time once we have a better idea how I2C is going. And maybe we also
>    need to see the watchdog driver, and argue about its protocol.
>
> I also understand ST has a generic I2C driver nearly ready, if that
> gets merged first, that probably kills the NXP I2C protocol, and maybe
> the NXP GPIO and RTC protocols.
>
> My vote is for 3. If not 3, then 4.
>

Strong vote for 3.

>      Andrew
>
