Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A696034D391
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 22:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771973237; cv=pass; b=Cv3swGAplwgjWGUXz41Fr8WgfviNRBgY9Ob5X3IiCu8zs00tEq/m3v9LM/blEenbd0TCb4Yhu0QAhfs2SHM6A5O5bONFqdq7iAW9SJNgEFJ/mlzC8i2bue+/tb/DNvmXewPUy30g8Uho7WTXDR+bp2/uPJgZ+/dmPj+MHHqqA1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771973237; c=relaxed/simple;
	bh=mR2DxBgw13ANLVUMK5/jjvVRnqlmqJqFCSdBmr/gbTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X+fZkEiMXRHZ9+8mnFgX/eCmQMjjJrrsjCND249/rP7kPd89vJC594jOsTUdJ0Qjw4AztmYYGcHRvUxGuryr7tmxapyC/It6oUeULU4MlGGVxJMUG2xIuPyanweIwrCM1thn40TnrW0pYsma3+4q4oZ7QWLssZd58zmx284tKVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IcGQhEp9; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IcGQhEp9"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-65a3527c5easo10591262a12.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 14:47:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771973234; cv=none;
        d=google.com; s=arc-20240605;
        b=Bi7Ctv7rIzysjuoO68/jwLAx5evQH/E7POYbZYSgkW+C9KawD0+t5K8njE3+NaJ5yi
         zzMJTDwYljE7M+h7AYBdFONuPH6Mh4hxYBncf7EmSAgLjrYhqwxMlzdC43LRr+ob/9kI
         aAQzMj3HuC5iDB8TovWGM2R0p9EPdvQCemZbUZByuAjOubNb/mjyls4ptuGelO00KU6F
         SxiXzsCTWXP4adJJveJMWCyk9c/JKfMiMe3BTc/nDGQn8vHkLO39G8Y6hJ2tq3XI8jtm
         +ki0GiPbEoEZmaefNO03M+g3JsCPGwCtJTlviQHu+41PMrjIbtyeAoLiB7iKNhLkRCVK
         Naaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zBtpA9uIN0gITjPuBpG1lTav8ApyzBRQxBUsMgkMm8c=;
        fh=z+fQRqHezSBIrX3K+YdMdLQewEqjhyQLBy+qu8xrpKc=;
        b=KLTr0Rv+YhpeQdDWEgmDTpH71BOtmnTYSXSXo3S/alGnP8M7V5/icVbl8miJYBDFOy
         qpDAzol2VH4L36bG6W6QzULpOfx68qkP9Ok+XL9w3YgfeXau0xQ619Iu+vtooahyT5lB
         bfxzS6ZQsa3h3HP1c/Pg/x8DjREI4hGUhdCdh0zsYU5JzSGGmB76bWDAgF2iMvHje248
         6CG73od3Oh9/9er1yZiMo2vgu4kuNZhYdEqGYQJmEB7ecZep9/0Ks9wbN/6wUN+79+OD
         S3bLA6hkyP6Lo4dASy6P3CDyOXHHjta6nLO3hlNhmqrCSUfzeQoUY/VIAed3iYc5nrFa
         Q4Zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771973234; x=1772578034; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zBtpA9uIN0gITjPuBpG1lTav8ApyzBRQxBUsMgkMm8c=;
        b=IcGQhEp9hL6greYM2+2maoVHPZjWvdvDsAC086EqeqlFB0YHUO5Y3ztMzQzJKEi0ob
         Lt+ri+Gkh0UL8uCsGGOSWdplUDKskV1TTMTA7FbR61NQC9e+C+LYIqJEJbZ/Y9KgIIMv
         aYzZWR+0JarEqlnA0WiJEEtQcZ922DZ2U7CphKYeThvRJntrFunwA7FBWBq8hA26gbSH
         tVp4Zcok6dI0IPYKDzCk7xzhStEC8M6mtCMBiWm96Gf9Ti9L8zBcA/xQ8bvzu2aDIfh6
         yUN3ms3f56iLbCN7ALNTSSRYvD+BBWM26dk6BDHalYarc7BJ9HuZzjS2eBjye0ghsGh8
         CbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771973234; x=1772578034;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBtpA9uIN0gITjPuBpG1lTav8ApyzBRQxBUsMgkMm8c=;
        b=oQsgtLRkKLWrtqkL9h6XmhTxOMBJGH7dJSc+vAiCAL7IZSRY7DfHPmnxsCa+h9D4qf
         dEDNmW4pIRbe6u9MUZz2AtdJW5/bPJjrMxDlI+JyNOBzwDZ0XDUCkfv+DJXNmSJ4kg6w
         RdxKBfprLUuwLIelw/f96/h3yr+IVNQ6Aqy3Vrqxub37339m7Xl5iTYYExihKI63Ct1Q
         URUVE1FoEMoHxXfA/oNcOatziPDgbLwGazMhOmRm4b5UrrbtySUDXJkjtsvwA02VEsOH
         PQ/58ftzFwAVGe+IJk6kuqxcM5jVG1H0+DxiFOVaAEBLFBmuUNj/gM1edddh4lOt7tMl
         OsLA==
X-Forwarded-Encrypted: i=1; AJvYcCVBB9PEakTDAoLu/jgVBeN7bz3UE6WNQWooGdgQJ6lMXw0Gpm1ND2VB96NYiT/RCi25LOMcwG4JkbM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx82dqRZ1l1NkK0WZKczk5E5oo0VFrKrlbSkIicR26gQWdray0c
	xpiVOW6HhZlUNeUVCbIBnQwJ4oVMSC3dg54aFEM9OXG+gyH1A0HOTW4mcrQEpBv1FV8HdKyVBu3
	qNemKdjiijSCEfduHFb6mlPaDoI+xusa8iZoNo2mKpG6iA9QKKVHRybc=
X-Gm-Gg: ATEYQzxzsPVF16DwCoahwoyC+7RrLx2NWMV57NdznLozcW3GeBnwsmag8THpnVSPzVn
	NWB9i+6x4E0dWyiwcCsrTH1LA3MXa+4YZmDN0a7s6LgiDpYmmcuhtR4FWMoRGMv33WJRspSgLDG
	y6KBUnpGpLt+1yDfXLhvHAFOOmyQLntyKV8rtEBINiCRp6TqTMx1rPtxX0TL60yvSc5OwC8nhnz
	bhFwMplAdYoW7EKpkSttxWGGRIhau6p9lRsV+cD8LmO/y4iZ5kYXxc4tbNSdFcSI+Uwfh9DlIBG
	sldXjizviTRDxYPjr4RSOJleP2GhaJ78LB7Vl5Nxkw==
X-Received: by 2002:a05:6402:430c:b0:64b:3225:b771 with SMTP id
 4fb4d7f45d1cf-65ea4ec02efmr8235378a12.6.1771973233960; Tue, 24 Feb 2026
 14:47:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
 <PAXPR04MB91859B642802813F908B03DA8977A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <64ef5dbf-6264-4758-a5d8-d8c52c359fcc@foss.st.com> <PAXPR04MB9185934EB640E8B21905FF878974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <79eb8bb8-83cb-4b24-8e56-42a53c710055@lunn.ch> <PAXPR04MB9185F1A67384E4886282227A8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <91701822-df30-4feb-9e9a-4ee82e2a5d23@lunn.ch> <PAXPR04MB9185FD3EEC313CC2408E157F8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <0b42e303-a2ed-4983-bee5-a4eafd6c7f36@lunn.ch> <PAXPR04MB918509F265757E6028B45DDC8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <8fbb4ded-8914-4e11-aad6-038c78f2d31d@lunn.ch> <PAXPR04MB9185C388591EC3C9053C262D8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB9185C388591EC3C9053C262D8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 24 Feb 2026 15:47:02 -0700
X-Gm-Features: AaiRm53YSUao7_rhr1i52add55pdbzLxtSc_huet_gFbRkQV2slyqwkA4zQhORI
Message-ID: <CANLsYkzzkvSHVWt_DOw8q7DvD3mic12zcNR1wuxrG-_vG+H+JQ@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
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

On Tue, 24 Feb 2026 at 15:32, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: Tuesday, February 24, 2026 4:23 PM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>; Linus Walleij
> > <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corbet
> > <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> > <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Frank Li
> > <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel Team
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> > Golaszewski <brgl@bgdev.pl>
> > Subject: Re: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
> >
> > Caution: This is an external email. Please take care when clicking links or opening
> > attachments. When in doubt, report the message using the 'Report this email'
> > button
> >
> >
> > > > > + remote_cm33{
> > > > > +     rpmsg {
> > > > > +        rpmsg-io-channel {
> > > > > +          #address-cells = <1>;
> > > > > +          #size-cells = <0>;
> > > > > +
> > > > > +          gpio@0 {
> > > > > +            compatible = "rpmsg-gpio";
> > > > > +            reg = <0>;
> > > > > +            gpio-controller;
> > > > > +            #gpio-cells = <2>;
> > > > > +            #interrupt-cells = <2>;
> > > > > +            interrupt-controller;
> > > > > +          };
> > > > > +          gpio@1 {
> > > > > +            compatible = "rpmsg-gpio";
> > > > > +            reg = <1>;
> > > > > +            gpio-controller;
> > > > > +            #gpio-cells = <2>;
> > > > > +            #interrupt-cells = <2>;
> > > > > +            interrupt-controller;
> > > > > +          };
> >
> > > Then how would you distinguish gpio@0 from gpio@1 on the CM33 RPMSG bus
> > in the example above?
> > > They are running on the same transport.
> >
> > Doesn't reg indicate the channel number? gpio@0 is on rpmsg channel 0. gpio@1
> > is on channel 1? The reg value gets filled into struct rpmsg_channel_info when
> > the endpoints are created?
>
> There is only a single RPMSG channel for the CM33 remoteproc in this example-its name
> is "rpmsg-io-channel". As I mentioned above, both gpio@0 and gpio@1 run over this same transport.
> The transport here is the RPMSG channel, so multiple GPIO controllers share that channel.
>

That is one of my main problem with this proposal - multiplexing
several GPIO controllers over the same RPMSG channel adds complexity.
RPMSG can already handle multiplexing via channels, use one RPMSG
channel per GPIO controller.

> Thanks,
> Shenwei
>
> >
> >    Andrew
>
