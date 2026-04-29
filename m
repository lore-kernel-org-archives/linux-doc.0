Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAFA3FE65F
	for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 17:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777484013; cv=pass; b=B8TKgvdTXcjjI5mjqIVK/RRzX7Y97xI45jB+/IHn+7oGp2/JTRJxbFIT98xxYCFH9bp5bDyZuNqKlHJtxFqD46nmSXRO/54mR034DOGAzTrem03x1VspYBLb2osp2jBAoFTJrWW5ecdQuE6L7sWtshRh73rePxmeMxvMyW+Yjp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777484013; c=relaxed/simple;
	bh=kN1Jg8zrE0WkiYysXn+g0/IiPU/u/Efvo6UZbhbtzTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pZ/MGVQYlNhntBbfRxlJ6aFlgf+hGZR05nE1mg+zzwVBZA6c2pj7FDAoay/ElqInrZgEiJYDegAEB+a39zYsISkvTZCLj71MW7frlHwXTDyVcUr754CkYHtn2YSiZVgrxvlYZU1jNAhjJ9Zsf0mhXO39nf6tIE08uUeJHAxLAuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PEKrzCC/; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PEKrzCC/"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-67790429f71so91518a12.2
        for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 10:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777484010; cv=none;
        d=google.com; s=arc-20240605;
        b=jEQmZKQyrXW5kAOeQktDprTEghk+WQA1AK+xCgX7zxC/GzbkW3pqo4m1jfChYI18lP
         hC+DrMH7FaQsCspCY7kazp0+OFbzp8SeOhANHVqJ1tDomcWxykrLZCvkz16YOabpj5we
         3ui3EW7nFmUJhf+gMyaYRtTqjnDDc2wkzazt4NvdeHMFeSxX31BhoM6VQCvq2i6YnS6Y
         aM8B5WKzdr7ykZNYBx3FlRioWo7UvBH7EquoB4RZZ5i1rMChXePmoqy7NM+0g+Ly/1jR
         iZyNMZQALOsv1rI8hwuChUUgCd+5ydbo1Embmn3IDrTmI145CZn0yfruJDvccy94OM2l
         yEcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/kb5CXOOm0mj4ODKw/K4npAFTtH0bYa0bnYZ1mb4DgI=;
        fh=tqNy+u0TzT2MCHOG1eMZ7UbkoXtEKpE3Ln52ILPDzyg=;
        b=ULSJdzFaKthW3S2l+SRUkI/XvA62OFn8DyuWy1rzdjaZKv+Kn6L7qDJmK2mBfgS/U/
         1vycIVFcZqpeImVmKeQUeGicVYlfu2GEa7iea6QErHBoo9qMxw0h70LuFt4PhES/2lp5
         +Xfl/1w+gL39SKANOoaTkFXlO0NjA7QP3Uxl99SFelCABjfK2T1RZdxFxYm2SKbPe/tE
         wTnceQbcxkIVwppU/E79H9VCd5/syYq4I9AJIl8rSQIqKr9tY5bBSZvdmv34e7/q/wD1
         jYdYGOrV1kuBQH4M8pooOpB7vXbIOAzgcZu/a8/o4VH7/PK1CexH27ZVk6BEAhzSylBn
         O+nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777484010; x=1778088810; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/kb5CXOOm0mj4ODKw/K4npAFTtH0bYa0bnYZ1mb4DgI=;
        b=PEKrzCC/rAYDBGbkyjxCwRTqVSUmwyhWncEDGEJDD1tfT5AzME3HRihUbthWq6pyp7
         QycNd14wHmXXNN4jxEJuyFaSq0o38AsPNg5DRuCjwju8yAj+dHEc5XA3z+AOik/nGGFV
         PDb5YwnzrlCwoYLc4vYEYt8bxJOeIFByHRSmhhXVCB7oQ/GbdX0I9UeL/bv7mhXQri8i
         gjprCCsn+XGTdBgqVKYQvvzUE5ujR0ETrdAn/nn7Rpy9ZbsyZ5UUHHoya8VBKoH+tUWZ
         oLZq+y8E9nwRapDuGWGykFWfM1s5u9sPt7k1ygv6klmBTPlahP7K493EyogU3Qa68M07
         NlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777484010; x=1778088810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kb5CXOOm0mj4ODKw/K4npAFTtH0bYa0bnYZ1mb4DgI=;
        b=YgyP01Z3gM3ra2hia1tefv0d2rROJ61zCLpKFUfvcCKfQTSGT7yIEGZa+Hm0UrvUMq
         7jDLlueNrJwj3MPtL/2m3BJKXzOaTGaDj5QjJ+P2Gtg677cwI9zva833C/enf89pJBSL
         TDEm5aiNu7T9tVJgwWhHGNOd3ZDTPPM1YFV7P9TXjW64BMx2ovMT3n4VNYIk9zqMauzt
         ywFeoJYGe2fVvrg6Zr92BhOy0ipbtVNYTL+NGVvSl79yT/P8RhN1IV5nwcnXdJuqaQql
         cbGGoQRcGN2brOa0NDW04JN9FE+guGx+kSn6l5Y60KJ7dEaSaugstcf2auNScBV3nk0/
         dhDg==
X-Forwarded-Encrypted: i=1; AFNElJ+Zbm/CscO8VF1PT+wZp2rHvAfTmH060ntP7cSCeywqGirZPCZ6dElJ3pFQ2Z8q2iIs/IoxZSGjiqY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza3EDwBVqcLPjpaJC3H8CEq0UC+45izBEjTSsGg/3e8x9Sucpz
	VXDhDmBBBX9ylN2mLoQxMq0lUjbqrByXI8Pr6p7x6Dxg7B7grXW7UpXKMityB1ppfX+w0iL7sfh
	mf5nt+J/YcTE1fS9Phx6LwNI81MwG1utctSm9eewirg==
X-Gm-Gg: AeBDieuEh0/agMiOo7srSc/NGjdtR7khPJR0tLXcSouKhReeU3fFCEbVmM32t8G6yW/
	5vYQ895ddK51zbuZewqHQAs+flmq0HGiSi/4QTS8Z/1aM4pof/kkqvYXho+4+rsfomONHxaQVl8
	4de6gVJahy5YkYIxpRbV9NdCASilhWcgnUnTXh89n3EWFib07QDA5IHBxXDZaMjIXCR/QzPBjzH
	+1kD5HALC+DaQo3SjB9xZS0NtxoV1ToddTDNwEwdNHh/3ySSw4yhpELuNcEGIHCUDbtVPlb4eJO
	ZXU3wTsgANrlzKJ51+51pihRzGnHPnQlGObTOlkj82QdyPFzd+VP
X-Received: by 2002:a05:6402:1ed3:b0:672:5255:af77 with SMTP id
 4fb4d7f45d1cf-679bb07ee71mr5034063a12.13.1777484010328; Wed, 29 Apr 2026
 10:33:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com> <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6412a758-4560-4cf1-a0d0-5b24d1a715f1@lunn.ch> <PAXPR04MB9185009A17DFDF3D6C8B44E789362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6e01e114-e336-4744-b6b4-563ec42e321b@lunn.ch> <PAXPR04MB9185A098D894B6A6EBCC13F889372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <afImuoeHolxGgw3H@p14s> <PAXPR04MB9185F2F6DDB55AC56C92D63B89342@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB9185F2F6DDB55AC56C92D63B89342@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 29 Apr 2026 11:33:18 -0600
X-Gm-Features: AVHnY4KBveuXaT50xXGT561BJAnz_p9YSdb7SJnI5b60PkMgL6_ZMJ8SGU0KF-U
Message-ID: <CANLsYkwvL0Z3+12MD=J+Dc2yAU2T8ypizyG=6AhYoWOh55odHA@mail.gmail.com>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "Padhi, Beleswar" <b-padhi@ti.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

On Wed, 29 Apr 2026 at 10:53, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Wednesday, April 29, 2026 10:42 AM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Andrew Lunn <andrew@lunn.ch>; Padhi, Beleswar <b-padhi@ti.com>; Linus
> > Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
> > Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> > <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> > gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> > devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> > imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx <linux-
> > imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
> > Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
> > On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Andrew Lunn <andrew@lunn.ch>
> > > > Sent: Monday, April 27, 2026 3:49 PM
> > > > To: Shenwei Wang <shenwei.wang@nxp.com>
> > > > Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij
> > > > <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
> > > > Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
> > > > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
> > > > Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> > > > <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha
> > > > Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > > > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > > > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix
> > > > Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > > > <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> > > > devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
> > > > imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
> > > > dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
> > > > <brgl@bgdev.pl>
> > > > Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg
> > > > GPIO driver
> > > > > > struct virtio_gpio_response {
> > > > > >         __u8 status;
> > > > > >         __u8 value;
> > > > > > };
> > > >
> > > > > It is the same message format. Please see the message definition
> > > > (GET_DIRECTION) below:
> > > >
> > > > > +   +-----+-----+-----+-----+-----+----+
> > > > > +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> > > > > +   | 1   | 2   |port |line | err | dir|
> > > > > +   +-----+-----+-----+-----+-----+----+
> > > >
> > > > Sorry, but i don't see how two u8 vs six u8 are the same message format.
> > > >
> > >
> > > Some changes to the message format are necessary.
> > >
> > > Virtio uses two communication channels (virtqueues): one for requests and
> > replies, and a second one for events.
> > > In contrast, rpmsg provides only a single communication channel, so a
> > > type field is required to distinguish between different kinds of messages.
> > >
> > > Since rpmsg replies and events share the same message format, an additional
> > line is introduced to handle both cases.
> > >
> > > Finally, rpmsg supports multiple GPIO controllers, so a port field is added to
> > uniquely identify the target controller.
> >
> > I have commented on this before - RPMSG is already providing multiplexing
> > capability by way of endpoints.  There is no need for a port field.  One endpoint,
> > one GPIO controller.
> >
>
> You still need a way to let the remote side know which port the endpoint maps to, either
> by embedding the port information in the message (the current way), or by sending it
> separately.
>

An endpoint is created with every namespace request.  There should be
one namespace request for every GPIO controller, which yields a unique
endpoint for each controller and eliminates the need for an extra
field to identify them.

> Shenwei
>
> > >
> > > Shenwei
> > >
> > > >        Andrew
