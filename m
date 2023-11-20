Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gDJG1iyf"
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14F3AB8;
	Mon, 20 Nov 2023 01:22:23 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AEDD340011;
	Mon, 20 Nov 2023 09:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700472142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hUL7lI12RbRGqL5GHxALD646PpmFiPkKK5/6ME+lyzs=;
	b=gDJG1iyfmHtwajMwEaMwCMFpErFIGtH6+SVMJLqpGGmpw0Sbp3H5VHoTstybcIsxR4wM0S
	C8Xq5yefllEnsTlI8ZlP/EUro8VW3sF5EI/LMUMsK9AyFykUHnzaHIzDr6nhcFA9m6xGLe
	GIrU2cuw9sHQLJY+TZNQXY9LVyPFeHDz3qGOW0pZ+1GZF+C+BMIH1DRy4H38HcdxBjdnt/
	bDjozbjFNy9/JsPdo7Lm5qXSHJ0SWhsxwCOxhcyOvWEJe1qGrY3YWuKICio2g0/KREMKFo
	+mEKxlohtQ28qkblRZzSfYicOJepHQsJhIyJKyD6ibu/EXJCF1GroxM7DeVtFA==
Date: Mon, 20 Nov 2023 10:22:20 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet
 <corbet@lwn.net>, Luis Chamberlain <mcgrof@kernel.org>, Russ Weight
 <russ.weight@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 0/9] net: Add support for Power over Ethernet
 (PoE)
Message-ID: <20231120102220.01528782@kmaincent-XPS-13-7390>
In-Reply-To: <20231118155937.4c297ddb@kernel.org>
References: <20231116-feature_poe-v1-0-be48044bf249@bootlin.com>
	<20231118155937.4c297ddb@kernel.org>
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

On Sat, 18 Nov 2023 15:59:37 -0800
Jakub Kicinski <kuba@kernel.org> wrote:

> On Thu, 16 Nov 2023 15:01:32 +0100 Kory Maincent wrote:
> > This patch series aims at adding support for PoE (Power over Ethernet),
> > based on the already existing support for PoDL (Power over Data Line)
> > implementation. In addition, it adds support for one specific PoE
> > controller, the Microchip PD692x0.
> >=20
> > In detail:
> > - Patch 1 to 6 prepare net to support PoE devices.
> > - Patch 7 adds a new error code to firmware upload API.
> > - Patch 8 and 9 add PD692x0 PoE PSE controller driver and its binding. =
=20
>=20
> You haven't CCed Oleksij or am I blind?


Oh right, I forgot he was not described as maintainer for pse-pd drivers
subsystem.

--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
