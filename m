Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BF8367B97
	for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2026 20:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786135749; cv=none; b=D7Dq2UizgA8mrn9pzxdL2jbTa4eNz1+5Yuq9zTXx1n8AJfgW4KCu3t3NKIl9Xm3pOZq+9Ehg/+LGgT/D4TXk4IeC+ZhE8LxzENKHTPo0Impr/crBOiDcKHCEa6jDrDBfxlupN1l1Cz0p1USvLUcN+RkjsxpRkRHUfC4/iufhpi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786135749; c=relaxed/simple;
	bh=hPfLP0hNorT8EBMoNPQqNYVzZGRJ/RFzthEnahRhP5M=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kGh1cA1KQ8Ghs4tprSDGblOtoOSMlvrHMo2cp1oiPzYJpcfNkZYEvv/Gkm5meEeC/AOBixhldV6VEfj8HzZiD/cyb4CVkelLNVza0G0QciXKwnIl8NvswfzijIhPAaDcoeZWcsgqxwh8Sp1+CGfcgZ5ysCBz6ejut+9SofJoRGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sQZ9SSUz; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQZ9SSUz"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f904e80eeso3159475f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Aug 2026 13:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786135746; x=1786740546; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hMUCiIk8VKHfw+lDvF1xcsVZxv/BobscGATfjEcSu3g=;
        b=sQZ9SSUz92YYydrsguNsMUdM9asNKlahxaWoS/C1CLFi+n+B+6axBRy0am452THdVh
         QkjrY+Uu3OQkLIE4juPmncSCEzwXBUVAMUvSQEDUpjkCUGLr0mmoC4Dg6DNWs7u64Y8J
         ZgTdrASJIeTVtzlpWKaHLZEoQ3uRkJNRdTZqOz6+CIVImdsyZgJbGWYeHyP/aeqs6vLe
         0ocK3FMIcPcL54O/pm8nYvImYoEqA8sbuLBfj+vG4m4N5hC5I1RS5U/+IeY3JcaOTxk4
         0cGEk6RIICsdJ4BAk9wGN4Kvec45WAb0B3ixvP1vfO8hSOO6xlmFI/zG6BA+TU9fOZIi
         GmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786135746; x=1786740546;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hMUCiIk8VKHfw+lDvF1xcsVZxv/BobscGATfjEcSu3g=;
        b=hs/E1c5JrsFLBYEuCrF58ywLL2ChaOB3NxOPZc6o5+qLJcRxXnId6OM6Qn/rjPA7p5
         8wf4BYJYapj9ppxdgFvXVsGKQ4+avNoKFrrqPfzyX+CFie5n7d+sJRcFajJirUhKubvJ
         8KetFaJH7Ote1f1rAcMvz2xu5CF8Km+52gyUMtSe16b5WPchDu8UxLo2TnZEGBsS7f+l
         itkoimvyYt62kPD3QiffI7wBkKxWZgHQ70AUppc1+v1jAeRTapLSHdfEqtek6fKUv2KB
         Kv+8qM39KSHxFApLQGXurwE+khyoBPKNW//j41Fht5oRa/2776fify5zCUX96eOwKtyq
         HNTw==
X-Forwarded-Encrypted: i=1; AHgh+RoskS70NEx/N+TeDyMCOTb+AgeNCxs8VKOIK0JlvXTZJJheDlG42gt/BP6O9bRXNlWai2flN1Tou4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmFl1bb38Kl3GhnTKg+MyEFIAz4df1SnS/O5FAzIyz99S6qY2q
	iWy5GO96uTLYPfgVWgZJ1sACetFfQIdnMRaLfGCW2EU0fXHkLZg5hpUG
X-Gm-Gg: AR+sD13tQ7yWjzSx7oE//JFvPP84yg95SDIGryHfgJYdIdr8iZtlNRygbiBOFQWqGK+
	it4LAWcumym/alV22zud6Ir/asz3z4DKbDlzuz8y89yoPTPRaZUnmlu6n0Q4FJIneYE9sh0Zmdl
	0gK6fBMxIBBrQFJlK2fE4/bR1C48n5cpljl4YSQGVIVuBNsvzqT874d49XanfOHNGn5kqKYrBev
	V61M+w3sJnqE8hPurxgn1UX3tTAz5I38vqYCw1pVJ6Dn6O2SV46ri5/WWTQu+4R0G/YPymUMqVi
	XwTk9+QBYQOCXTvzmZJSJk5mgHMjDb+KPkAAcNfrtc3WI3cQO7PvFl63lIBPhoPpOkqzUwZ3NQp
	uZXVZ1tT7C4oiueQqKNHZWpr1W905b4JFNGOzrzIYM/5diKagWBX26xC3D4Gat2RIGvldyd7hXP
	LdSMpOH6BjpbScPVw7IAii0p04mfSSZXo/DOua8xCYtUnWtANgq2cMQDpAJ1BzaYUDQKxCP02FB
	xo7eoCjqN9cW4R6vfs5o1ZjDrlVdvz7aLw6
X-Received: by 2002:a05:6000:41fa:b0:47f:fa17:ae0e with SMTP id ffacd0b85a97d-47ffa17ae68mr22949317f8f.11.1786135745578;
        Fri, 07 Aug 2026 13:49:05 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8b09sm9756544f8f.23.2026.08.07.13.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 13:49:05 -0700 (PDT)
Message-ID: <6a7644c1.df882948.3a7741.2280@mx.google.com>
X-Google-Original-Message-ID: <anZEvaEjN5i9h5ww@Ansuel-XPS.>
Date: Fri, 7 Aug 2026 22:49:01 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev,
	Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH net-next v11 03/12] net: pcs: implement Firmware node
 support for PCS driver
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
 <20260807131301.192060-4-ansuelsmth@gmail.com>
 <235c60e9-f19a-4336-a569-ddf5e5462fe5@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <235c60e9-f19a-4336-a569-ddf5e5462fe5@infradead.org>

On Fri, Aug 07, 2026 at 01:29:41PM -0700, Randy Dunlap wrote:
> Hi--
> 
> On 8/7/26 6:12 AM, Christian Marangi wrote:
> > Implement the foundation of Firmware node support for PCS driver.
> > 
> 
> > 
> > Co-developed-by: Daniel Golle <daniel@makrotopia.org>
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/net/pcs/Kconfig          |   6 +
> >  drivers/net/pcs/Makefile         |   1 +
> >  drivers/net/pcs/pcs.c            | 240 +++++++++++++++++++++++++++++++
> >  include/linux/pcs/pcs-provider.h |  65 +++++++++
> >  include/linux/pcs/pcs.h          |  75 ++++++++++
> >  5 files changed, 387 insertions(+)
> >  create mode 100644 drivers/net/pcs/pcs.c
> >  create mode 100644 include/linux/pcs/pcs-provider.h
> >  create mode 100644 include/linux/pcs/pcs.h
> > 
> 
> 
> Please address these warnings:
> 
> WARNING: ../include/linux/pcs/pcs-provider.h:39 function parameter 'pp' not described in 'fwnode_pcs_del_provider'
> WARNING: ../include/linux/pcs/pcs-provider.h:39 Excess function parameter 'fwnode' description in 'fwnode_pcs_del_provider'
> WARNING: ../include/linux/pcs/pcs-provider.h:62 expecting prototype for fwnode_pcs_add_provider(). Prototype was for devm_fwnode_pcs_add_provider() instead
>

Yep, they slipped in the rework. I already fixed these, just waiting the
usual 24h.
 
> > diff --git a/include/linux/pcs/pcs-provider.h b/include/linux/pcs/pcs-provider.h
> > new file mode 100644
> > index 000000000000..5df48022bc6e
> > --- /dev/null
> > +++ b/include/linux/pcs/pcs-provider.h
> > @@ -0,0 +1,65 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +#ifndef __LINUX_PCS_PROVIDER_H
> > +#define __LINUX_PCS_PROVIDER_H
> > +
> > +struct fwnode_pcs_provider;
> > +
> > +/**
> > + * fwnode_pcs_simple_get - Simple xlate function to retrieve PCS
> > + * @pcsspec: reference arguments
> > + * @data: Context data (assumed assigned to the single PCS)
> > + *
> > + * Returns: the PCS pointed by data.
> > + */
> > +struct phylink_pcs *fwnode_pcs_simple_get(struct fwnode_reference_args *pcsspec,
> > +					  void *data);
> > +
> > +/**
> > + * fwnode_pcs_add_provider - Registers a new PCS provider
> > + * @fwnode: Firmware node
> > + * @get: xlate function to retrieve the PCS
> > + * @data: Context data
> > + *
> > + * Register and add a new PCS provider to the global providers list
> > + * for the firmware node. The relevant PCS from the PCS provider
> > + * is retrieved from the passed xlate function.
> > + *
> > + * Returns: A pointer to the registered PCS provider on success, or
> > + * an ERR_PTR() encoded error code on failure.
> > + */
> > +struct fwnode_pcs_provider *
> > +fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
> > +			struct phylink_pcs *(*get)(struct fwnode_reference_args *pcsspec,
> > +						   void *data),
> > +			void *data);
> > +
> > +/**
> > + * fwnode_pcs_del_provider - Removes a PCS provider
> > + * @fwnode: Firmware node
> > + */
> > +void fwnode_pcs_del_provider(struct fwnode_pcs_provider *pp);
> > +
> > +/**
> > + * fwnode_pcs_add_provider - Registers a new PCS provider
> > + * @dev: Device of the PCS provider
> > + * @fwnode: Firmware node
> > + * @get: xlate function to retrieve the PCS
> > + * @data: Context data
> > + *
> > + * Register and add a new PCS provider to the global providers list
> > + * for the firmware node. The relevant PCS from the PCS provider
> > + * is retrieved from the passed xlate function. While at that, it
> > + * also associates the device with the PCS provider using devres.
> > + * On driver detach, release function is invoked on the devres data,
> > + * then, devres data is freed.
> > + *
> > + * Returns: A pointer to the registered PCS provider on success, or
> > + * an ERR_PTR() encoded error code on failure.
> > + */
> > +struct fwnode_pcs_provider *
> > +devm_fwnode_pcs_add_provider(struct device *dev, struct fwnode_handle *fwnode,
> > +			     struct phylink_pcs *(*get)(struct fwnode_reference_args *pcsspec,
> > +							void *data),
> > +			     void *data);
> > +
> > +#endif /* __LINUX_PCS_PROVIDER_H */
> 
> thanks.
> 
> -- 
> ~Randy
> 

-- 
	Ansuel
