Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C685368965
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 19:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773860644; cv=pass; b=ZeQ+UgF9Lsl81NkfyN990Hjvt61FwweiLjTlwGOmMCFFlDU936fFNz8ksU5hlt4rlDhh+gozX30/VNVgMy8aZbWAztsSYmr/6OW8SXwoiT+Soboa1zWAtKUY3DTIPIB2WBF2wu9t5WqDvBEmvDOIKeMrvg2Z9G75Frt38atd4Cs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773860644; c=relaxed/simple;
	bh=T1+fx/WLpTfB9SQJibZ6lWXK3GEnUtk5g7rLlawTyh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YVuz16ntcBR+0i4g1a89eJEpDa4X66SturOX3fHH+vWrHWwv8pwGxougqkm0waTgx21E0Qeaf4+zJrcTVEFxyHErrgALdp1RNE/34uQvhLi/7IIXVNM7m4wygtTyTtGnFzCfr7vJADJzILVVUmOj+nOaklDSD5fD2wrpU8ENCoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dnP9N4NH; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dnP9N4NH"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b976536806cso19565966b.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 12:03:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773860638; cv=none;
        d=google.com; s=arc-20240605;
        b=Vd3Mxo7p1/aX8ZmsJHlzgac3bPlwwvlW0+41oJ41gyKWN9k0zVWeXqp9RbK0tEi37E
         MPgCBY8rgq35Qtls1zqC4zGN2Jk6XiMUD5e7sB+BjRZWyPl2USqcuBZyW5xO++4InfN3
         NozH5kqxg2/duGDxdusWa+uRPSIk4QBTkx3kfad2woaqOJZrYcj5e5vtwZKUx7RRvXLk
         OPzxrPU9wxeDq2axtYK+9FVmH4e0p+gg2KRl7HX+p+mNLLqs7F96FANCZHDcMQsrij5q
         TN7KanQ7tVSwLGnK/Nzaew3U+NwyWu3oiA5ftNrhPhb5BIwfjVum/JOiqfIKNdL38QiX
         YQxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=04ig8Jpnhmqmb93VFIyiBP6MR+wj/njfRfrqGD7STpI=;
        fh=gFuMPCULO5EO76TxCd2I7yTZkeBcvheLyJPTV9CNLJA=;
        b=Fu1V4mIm9Bhoxfjs81qBr8xcUWBYCHNA9suf2ldTav2YvRhKBn7XyMovlnps7pvde1
         wukjksmEB3/JEWkdZhVTx9PDNEw8xBK/IZTPaK3fHMI8yPzRROZFmyi90KenrsLlUILs
         Nd53t/LXTZj2j5qhkqOOxqn5fqwMd+7TurzpqK2LrqEXuX4Zik6oHPZLIKM+h8qi7c4w
         W8g+6no6RvEbTpiML87kRV/1oPrvhn4NTzQbpT4blJmMBzdjMFxHOBbo+uzvitay9z7E
         PHqqI4oZ4fQNDal+AHvXLVa3w7JhK97bEhtoKg+rprCXDzo4pgIS808hRwC7jbU6SCqL
         bk3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773860638; x=1774465438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04ig8Jpnhmqmb93VFIyiBP6MR+wj/njfRfrqGD7STpI=;
        b=dnP9N4NHO/fn1NCR86BmlTLBnppX+fJI2qrty6KzVKEs+tKSvODc/CXKU8byDw4x0g
         vNcXT+YR0sXFcWS/Pw3Q5+p0q6jdExZPksq9Zkv8vOt0ZfcKsQGpn4JaXZcCO8BCd1jk
         KSO6K47zEPI8al/jqeQH9YnEbDQyGc/X2xDHnVXjZyR9ZFmnfE7YNjuhdu4GUVKfgBUS
         3NkRw3FPfCKndw0oizKf/lA1UzTZAq2Pry5A8fPIPhvN3ax4L9NB5P6Sdxw6eZkNFRJL
         O//3njHue7pjHuI1wVCTWX/qzmYHG56HqkyqWZxE9+2S7u7o1VVdMyeU9vUydZxUpdM3
         gwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773860638; x=1774465438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=04ig8Jpnhmqmb93VFIyiBP6MR+wj/njfRfrqGD7STpI=;
        b=J7QFjgpEQkoPOPYe1/b+icyPyX1BmxO9gArf4xFmV+6Ixx7t/MKIipBxFoqPiD88q+
         cyjDFtBAEOcCAlaWx1yQcK0vcNphGsgTJfk6SdkqSlxhnqtNeIsvKYv1+6Yo8LYHYbzH
         z3IkpADGyub0vQiFZr9v3Sf75qmgQYvG4I1Gqewjkik7MqVdNQ3X1Cb4t+AET29RYNjX
         /37ASwOKLlsCqnNOvSoN/jLh3eZHsLFFBytfaFRF93zb1E8CcAbK/vrbteKRMRXMJsYV
         uWHkYSPNg80dQ8EZN8alDkarV2+N+2QuTR89gxQupr5Cch6B28ic+RGhCSyzRFI1dyyP
         DcCA==
X-Forwarded-Encrypted: i=1; AJvYcCWkqMH5tkc5RK+0J1glkoHZ9Pt6aoBqOyDsarU0UChYSi6nl6In9BJROiYdqpNXce1xpLjNvyY830c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaWVuHmNL/bY0/lOYcwVB38JdpkHQrsuR1HWePQZbnhmfjLeUM
	7y3nv9T5xAaqe4aJC7/07vCy+dbfKEmFCs+Nj8nHW//sJo3gggHlpiX299EmEnecNUD5hJ1lxq7
	SYjQz4wqTx6Yhf3iyvnj+nLQvJ6A98LOVoBnFvJb5/A==
X-Gm-Gg: ATEYQzzPD63er8SPOav874L2qszP+f/EpjWLRlGyfL05otIIOV9ysd0y2Fg6pxE72NX
	qbRmOJPLyDTUYNW6SmiRq1HgHFF2a7tYgbIsfDtE4Sm9pzfh0CAMPsN/2We8MA+n7ELpkTMV2sP
	JBQqhNnCu0pgTOb6M4aE5DZFfi6HTmvCCYz6YCakHAvxtrzXUb5R3CazwSb5HF24GGo/fL6UHqr
	Vv2GCN3FHgQYHF/riYdohk5Sxefo1RaD7VI9RJ6o6ORYr8aPZRlsWqm8iMjxiNRCbHLoD2GwfF6
	N+JOndHRE3+l9ABBQS0lALF8EJzvRWgVRfi5o8x+g1MDNGqgOwY=
X-Received: by 2002:a17:907:96a3:b0:b94:1bd:13fa with SMTP id
 a640c23a62f3a-b97f493bde3mr266129966b.21.1773860638142; Wed, 18 Mar 2026
 12:03:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
 <20260313195801.2043306-4-shenwei.wang@nxp.com> <2aa1d063-181f-4145-9f1f-7e3012c4d0af@foss.st.com>
 <104e9861-bfd4-4e0f-8967-a849edf7e6fb@lunn.ch> <CANLsYkx6KhspTjzpk51ywfgWcf-FR7-3XrH=MmBi_W6yZmMukA@mail.gmail.com>
 <PAXPR04MB9185E1D7543DB60DE089423B894EA@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB9185E1D7543DB60DE089423B894EA@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 18 Mar 2026 13:03:47 -0600
X-Gm-Features: AaiRm50DCHDfwwIrpEvrd6IARu-OJyOKkB98w-Mz3i8yabOEb0YcC2ELSE3lijw
Message-ID: <CANLsYkyvHBKVuRB9abg=WijMLAfaboBxb_eHWETQ6hU3C9Zmew@mail.gmail.com>
Subject: Re: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 18 Mar 2026 at 12:46, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Wednesday, March 18, 2026 11:03 AM
> > To: Andrew Lunn <andrew@lunn.ch>
> > Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>; Shenwei Wang
> > <shenwei.wang@nxp.com>; Linus Walleij <linusw@kernel.org>; Bartosz
> > Golaszewski <brgl@kernel.org>; Jonathan Corbet <corbet@lwn.net>; Rob He=
rring
> > <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dool=
ey
> > <conor+dt@kernel.org>; Bjorn Andersson <andersson@kernel.org>; Frank Li
> > <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel T=
eam
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> > Golaszewski <brgl@bgdev.pl>
> > Subject: [EXT] Re: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO =
driver
> > On Tue, 17 Mar 2026 at 08:11, Andrew Lunn <andrew@lunn.ch> wrote:
> > >
> > > > > +struct rpmsg_gpio_info {
> > > > > +   struct rpmsg_device *rpdev;
> > > > > +   struct rpmsg_gpio_packet *reply_msg;
> > > > > +   struct completion cmd_complete;
> > > > > +   struct mutex lock;
> > > > > +   void **port_store;
> > > > > +};
> > > >
> > > > Except if I missunderstood Mathieu and Bjorn's request:
> > > > "reuse all the design-work done in the gpio-virtio"
> > > > We should find similar structures here to those defined in
> > > > virtio_gpio.h.
> > > > struct rpmsg_gpio_config {
> > > >       __le16 ngpio;
> > > >       __u8 padding[2];
> > > >       __le32 gpio_names_size;
> > > > };
> > > >
> > > > /* Virtio GPIO Request / Response */ struct virtio_gpio_request {
> > > >       __le16 type;
> > > >       __le16 gpio;
> > > >       __le32 value;
> > > > };
> > >
> > > The core of the issue is that Shenwei is stone walling any change
> > > which makes it hard to keep the legacy firmware. It is possible to us=
e
> > > these structures, but it makes the extra code Shenwei needs to
> > > translate this protocol to the legacy protocol more difficult. It
> > > might need to keep state, etc.
> > >
> >
> > I agree with everything Andrew points out above.
> >
> > > Two points...
> > >
> > > The firmware implements more than GPIO. There is definitely I2C as
> > > well, the first version of the patch has bits of I2C code. Looking at=
:
> > >
> > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
wn.
> > > net%2Fml%2Fall%2F20250922200413.309707-3-
> > shenwei.wang%40nxp.com%2F&dat
> > >
> > a=3D05%7C02%7Cshenwei.wang%40nxp.com%7C4b8879a9c89a4a831cf508de850
> > 7de18%
> > >
> > 7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639094465992371367%
> > 7CUnkn
> > >
> > own%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIl
> > AiOiJX
> > >
> > aW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Ds8tl8n
> > m3eD
> > > 9l%2FetyyE%2FPWwJh4wQalaaHr4OEwzpQ7NY%3D&reserved=3D0
> > >
> > > There is also RTC, and a few other things which don't directly map to
> > > Linux subsystems, but maybe do have Linux drivers?
> > >
> > > Give how much pushback there has been on the existing protocol for
> > > GPIO, it would be wise to assume that I2C, and RTC is going to get th=
e
> > > same amount of pushback. If any of these three, GPIO, I2C, or RTC
> > > decide that only a new, clean protocol will be accepted, no legacy
> > > shims, the firmware has to change, breaking compatibility to legacy
> > > protocols, and the accepted shims become pointless Maintenance burden=
.
> > >
> >
> > I have made this point clear before: modeling legacy protocols in mainl=
ine doesn't
> > scale.  Mainline uses a single generic protocol, and yes, it means brea=
king legacy
> > protocols.  This is the cost of moving to a mainline kernel.  If people=
 want to use
> > the legacy firmware, they must stick with a legacy kernel.
> >
> > > Point two is that the customers who are pushing for these drivers to
> > > be added to Mainline probably know that nearly nothing gets into
> > > Mainline without some changes. There is some short term pain to
> > > swapping to Mainline because of these changes, in this case, firmware
> > > upgrades. But in the long run, it is worth the pain to be able to use
> > > Mainline. And those customers who don't want to upgrade the firmware
> > > can keep with the out of tree drives.
> > >
> > > So, what are our choices?
> > >
> > > 1) We accept the code as it is now, with the shim?
> > >
> >
> > NAK
> >
> > > 2) We keep pushing for the virtio protocol, with the shim?
> > >
> >
> > NAK
> >
> > > 3) We keep pushing for the virtio protocol, no shim, firmware changes
> > >
> >
> > Nothing will get merged in the RPMSG subsystem that includes support fo=
r the
> > legacy protocol.  Not today, not in a month, not in 5 years.
> >
>
> @Mathieu,
> Your tone is unnecessary. If you believe this driver must
> comply with a specific virtio protocol, then please point to the exact
> specification instead of making blanket statements.
>
> If virtio is the direction you prefer, you are of course free to propose
> and implement such support yourself.
>
> My patches are contributed in good faith to improve the ecosystem, and
> this work clearly belongs to the GPIO subsystem. I don't understand why
> you are asserting authority here without providing any technical
> justification.
>

All arguments have already been presented to you, we are now going in circl=
es.

I am happy to look at a new revision of this work that complies with
the comments Andrew, Arnaud and I provided.  I will not engage with
you or your work until that time comes.

> @Linus Walleij,
> From a technical standpoint, this GPIO driver is no different from
> gpio-mxc, gpio-omap, or gpio-rda. If the concern is simply the use of
> the word =E2=80=9Cgeneric=E2=80=9D in the name, I=E2=80=99m perfectly fin=
e reverting it to an
> NXP=E2=80=91specific driver.
>
> If maintaining a private GPIO driver is no longer acceptable going
> forward, that=E2=80=99s also fine =E2=80=94 we can stop the discussion he=
re. If you think
> there are still technical limitations in the driver itself, I=E2=80=99m m=
ore than
> willing to continue improving it.
>
> But the goal is not to create a driver for another protocol that someone
> claims perfect.
>
> Thanks,
> Shenwei
>
> > > 4) We pause GPIO where it is today, and restart all the arguments wit=
h
> > >    the I2C driver. We can come back to the GPIO driver in a few month=
s
> > >    time once we have a better idea how I2C is going. And maybe we als=
o
> > >    need to see the watchdog driver, and argue about its protocol.
> > >
> > > I also understand ST has a generic I2C driver nearly ready, if that
> > > gets merged first, that probably kills the NXP I2C protocol, and mayb=
e
> > > the NXP GPIO and RTC protocols.
> > >
> > > My vote is for 3. If not 3, then 4.
> > >
> >
> > Strong vote for 3.
> >
> > >      Andrew
> > >
