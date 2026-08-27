Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA0C47F782
	for <linux-doc@vger.kernel.org>; Thu, 27 Aug 2026 15:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787844986; cv=none; b=SNaJlDcW15ovpUTiw7VIhq02NZhx36EtEO/gnvWB+u6sB0SQGZ/hmFOiWPGDK3nXG+KZbyXaQM9JJXYDs6GJ86Mo30v/raPiSt+2r+pesOqRlZ8CYCP5UG9y9Eo6lUzr2fjKs/ZlQ9am9cDH7P7+7npSM8mhc10FNa4zxRz9rhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787844986; c=relaxed/simple;
	bh=IXit39jokJOkDKdV9ozjAq5puFGqOrTpsC39d5ly7YQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZO9oKTpHhp7VFpoA14Omfqgp2RiJfKcUk1oTxCW8mT0Rp97mpd5F8hviQoX9mTyhoG1U8j0YPpcOide0eZazM9GnBKztNORJ+/B+hJfa8d84C3pYiInhr5kw7hr+A+Ko+tSmayl2286kLmdouGHQk8/GEoTK0hIurM70OjCnGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ndE2+w2+; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ndE2+w2+"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-39686abd426so126778a91.1
        for <linux-doc@vger.kernel.org>; Thu, 27 Aug 2026 08:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787844984; x=1788449784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u0GbLwFaHwwzrHQZ6KyEJK5JW6SPWToNlMJADlPNRPk=;
        b=ndE2+w2++9Cg8O4juXiYVelRJmQ8+HFiDcLp7iuv2/g7qeuZ7eILSSdAxdPszUz7Ru
         2wdqKVTcdG4fFxooYcxMwvcd48PmQYg9OnSktXlAtGgzXVuWhF7323RDH/BceKPxVGl9
         HZxfOc3C1ZZ584so24PKu3406w1E3Chggu+jPmz8dhJcJqcHPIcCJLC2HWvVoFcbxNq7
         6BcamcvNRXPIyXosEwaDEpEEAfjtdzd2gDDajE53qYvQeB46xQJIPmae0qfhglOxForA
         RZ6ubRz/zBjMWcj8WQKKz2h7UFeLPdh2FPgTU2Aig03NFM8CrzTHhUBSci1vLGA7tU4+
         Rsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844984; x=1788449784;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0GbLwFaHwwzrHQZ6KyEJK5JW6SPWToNlMJADlPNRPk=;
        b=Nlel1A3V9acK7ioXQISWUn/kVbuTjHhBF2cX4LOusKb8q/TXekAjnLVbb2d9aAVgFq
         +SLDFHZrxPM0g3Lk6uMAYyp5YwQgE5OKseJwjA6hkTbxHEiEnpPkorqcEB3pP/wfQY19
         p/ZUJUXu8JMSvCzo/YHNBjcn5KGq3jIPQA/LJRRfd28LwrkLhqf2q1M+iy63yp0fMTNx
         Op2aULDnGKTlcbPTnzTvcJTSBecOZSln6oyfy6x7AdKWyI6ZaijV1TP5BaOZ1asneK//
         sBouqP/7esnlRgKLq8AgCr1Y/6NMNQ7zDizcQUNcj240hp9FUmbLqGWKj+fuZvpNTKmn
         f1MA==
X-Forwarded-Encrypted: i=1; AHgh+RpLWhXGTQSaCRVa+pSNWG+og4lue0gDVyFA9B02agpttAZyGxizbxz4xl+4K9Z7unsS88rhlEqO/rE=@vger.kernel.org
X-Gm-Message-State: AFuF++l2nAWmE+URKqyFvkCyfAMH0aCXz0P5Q0nxwqhDWpxeByOj1sES
	nsIfATRSfe5YZEceAsGtjRVPDaAjH75uxvqrlkyZpDPihzDvel7SSfxYfTnYnhpRnC8=
X-Gm-Gg: AR+sD11Xzz/hZlZrMDPErgKSDG3CsVbdHAy0mSScmsJGBwGpBHKgh8zAQIV7QLXrdN/
	Z7HRD4C0quomPeKcdxt8LU7II8HATD4dZPhCOsREHAb3K4CDOBOqtT+Dvsx8sfpp8PIrItugvev
	YpD1Kfw+BqHvssjcmGeqpSuK8h9Xc+gZwDAbmCTJAoIjO3vSNhcvsx5DwcFsuViumnAJyclGcSt
	d6XfPTiNJ1BgT/6cAdUeviVDZDTNdT2cK4V7KEc4Mcg6966ITE6hNeyLfjTxi8D7ZzoqgKRx9TD
	14g27UBD3DobYYlo9bLbTldhOyNkpFSdYpr1W5FSOeE2MsIJr7GarErKpxJDUvc8wztZUtJ0edU
	E7qVJ0rswX62RebV2aC+dhL+/7XzDrO384PjhK3BsKPHGfmb/RiiaU8T9TN3X1s44JLrxlRPRdM
	FiKRC5a7R4cN8xYua33xflxcOpK9N2oowh8DMMOizJ9EZLxfvRanSEXgxFP6XN5mkR
X-Received: by 2002:a17:90b:5188:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-396d0ea530emr169425a91.4.1787844984074;
        Thu, 27 Aug 2026 08:36:24 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:887f:45b3:fb30:8d79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd5c34sm3187307a91.8.2026.08.27.08.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 08:36:23 -0700 (PDT)
Date: Thu, 27 Aug 2026 09:36:20 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	"b-padhi@ti.com" <b-padhi@ti.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Message-ID: <apBZdNozfoCUp515@p14s>
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
 <20260721204704.400781-3-shenwei.wang@oss.nxp.com>
 <CANLsYkxZbr9hKaJJGXwYXErLwQ-A07eb-oeNXY1CceHHa0Tdmg@mail.gmail.com>
 <PAXPR04MB8093FA9283357BF9604BE39F89AE2@PAXPR04MB8093.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8093FA9283357BF9604BE39F89AE2@PAXPR04MB8093.eurprd04.prod.outlook.com>

On Wed, Aug 26, 2026 at 06:36:54PM +0000, Shenwei Wang (OSS) wrote:
> 
> 
> 
> NXP Public
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Monday, August 24, 2026 9:39 AM
> > To: Shenwei Wang (OSS) <shenwei.wang@oss.nxp.com>
> > Cc: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>;
> > Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
> > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn
> > Andersson <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> > gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > <festevam@gmail.com>; Shenwei Wang <shenwei.wang@nxp.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Arnaud
> > POULIQUEN <arnaud.pouliquen@foss.st.com>; b-padhi@ti.com; Andrew Lunn
> > <andrew@lunn.ch>
> > Subject: Re: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
> > subnode support
> > > +          gpio@1 {
> > > +            compatible = "rpmsg-gpio";
> > > +            reg = <1>;
> > > +            gpio-controller;
> > > +            #gpio-cells = <2>;
> > > +            #interrupt-cells = <2>;
> > > +            interrupt-controller;
> > > +          };
> > > +        };
> >
> > As I (and Arnaud) have stated before, I don't think this is the best way to lay out
> > bindings for rpmsg-gpio nodes.  I am currently thinking about a representation
> > that aligns better with other virtio devices.
> >
> 
> Hi Mathieu,
> 
> Would you prefer that I wait until you finalize the layout before submitting the next version?
>

Let's wait until the DT format if is finalised.
 
> Shenwei
> 
> > > +      };
> > >      };
> > >  ...
> > > --
> > > 2.43.0
> > >
