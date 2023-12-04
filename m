Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lofcBWGe"
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE415CD;
	Mon,  4 Dec 2023 14:17:01 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F71240002;
	Mon,  4 Dec 2023 22:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701728219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NS4jS69KLOJnxFovqZv/8vQ3n77jCj0+KLo8w0Mmcsg=;
	b=lofcBWGepeW/OU/1n6lJ8R6GE91nJTN2RoVmxDzB15pF9kdEiP7bO0iK0X1sv/XtlsDrIh
	MnOZIWUSeJRGkli7LMGZAW3C27vp22wofxiW098Qnv8KdgMxEieov+WNEGoBHjUe5LGRVY
	nMIbM0Qc9jsW5R+7C+7nLQLYREMNFbocLbWSmC8E8V+LlcDmlDslF+43uhjYIVVnUSOm4A
	YXnuPlsxnA00gaHZyQXStqWEYInVGusAIN9CpaDQk1HQYaCRYS3jBQ4FT0lsyIeP/nwgMg
	83XERe3VDQtNi4zxYQytFRtKtBs79vu2MVvSgYndNJ/pjq8a4Xb+BXqQVAdPsA==
Date: Mon, 4 Dec 2023 23:16:55 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Luis Chamberlain
 <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, Dent Project <dentproject@linuxfoundation.org>
Subject: Re: [PATCH net-next v2 8/8] net: pse-pd: Add PD692x0 PSE controller
 driver
Message-ID: <20231204231655.19baa1a4@kmaincent-XPS-13-7390>
In-Reply-To: <6eeead27-e1b1-48e4-8a3b-857e1c33496b@wanadoo.fr>
References: <20231201-feature_poe-v2-0-56d8cac607fa@bootlin.com>
	<20231201-feature_poe-v2-8-56d8cac607fa@bootlin.com>
	<6eeead27-e1b1-48e4-8a3b-857e1c33496b@wanadoo.fr>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: kory.maincent@bootlin.com

Thanks for your review!

On Sun, 3 Dec 2023 22:11:46 +0100
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> > +
> > +	fwl =3D firmware_upload_register(THIS_MODULE, dev, dev_name(dev),
> > +				       &pd692x0_fw_ops, priv);
> > +	if (IS_ERR(fwl)) {
> > +		dev_err(dev, "Failed to register to the Firmware Upload
> > API\n");
> > +		ret =3D PTR_ERR(fwl);
> > +		return ret; =20
>=20
> Nit: return dev_err_probe()?

No EPROBE_DEFER error can be catch from firmware_upload_register() function=
, so
it's not needed.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
