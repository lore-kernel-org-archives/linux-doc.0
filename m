Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2591AF0DC;
	Thu,  2 Jan 2025 12:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735819342; cv=none; b=pcCYF482YzlD7qN3gvxPPMNHfGTBvqt4cVxN2w3Aaia3oI8usnWYqmN4MqMJVoD8QnNEe7o/qiGTyQ2jb1XBRdDDVPK9L7goYOc4DYdzez8a/c3es3gnaNlHCPbmdYraHet8zgMkv67k6QG3DIo3a33hSkag9Ca0mkkwjvyu2tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735819342; c=relaxed/simple;
	bh=x29SpxNxVadIG1xo/mynTBtG68Rvig/giXVLvJsiKoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FzXp9bdAoaWhxJD4nms3LCRKVDWZMXxcoixrZJWLoYyrW8YG1v2eUcgGl1w8g8Um99nAegbsSg5PL8mCLyrqWG3f3dOwP08I449seOnPc+agdqt+yOtJtn+2LoKpZ/D52fDSimfm3u/mRbu5vNDU2JNeEZiCPaiaNJ1M67vMgug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IGfRgwGI; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IGfRgwGI"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42D4A1BF205;
	Thu,  2 Jan 2025 12:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735819329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DCekmWIsBZdXxl0wOI1O35zPVOupxsprKE8B+VAlWJY=;
	b=IGfRgwGITFxzr4VDxH4IexSFXKQtZygiilm4WSJ733c/0UA1JfTtMlcwQYl3d50lljoQAq
	DoqEwpx5s9yayhQxgAlWix52wzrdHTZUsol3X8F6nanE/3E7piq3qxB0LXB+yPiHPYzQzR
	+TZ0ZEBJ1P1eF2DGcqcBbHcOoXuBCzUFNyaP0Vwm0oYkus2FPWjHGVkStJpW6bTaFlklFB
	QDqv85oobOXNci8KDmaJ0qVSleQyZxIFSYIjVS4/bJjkY0d5k6KUZ6S6DmCr1sBBTnWkfn
	JL4GiLQJYIMxAECwPK7J8YKxknhVLlAyUCg9w5qr9vcxDuHNYuaN+aX2LHyuSA==
Date: Thu, 2 Jan 2025 13:02:03 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Jagan
 Teki <jagan@amarulasolutions.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, =?UTF-8?Q?Herv?=
 =?UTF-8?Q?=C3=A9?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, Paul
 Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 04/10] drm/bridge: add documentation of refcounted
 bridges
Message-ID: <20250102130203.10389fd5@booty>
In-Reply-To: <993b1c6d-6614-42b5-a64e-0061117fc1d0@infradead.org>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
	<20241231-hotplug-drm-bridge-v5-4-173065a1ece1@bootlin.com>
	<993b1c6d-6614-42b5-a64e-0061117fc1d0@infradead.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Randy,

On Tue, 31 Dec 2024 09:54:41 -0800
Randy Dunlap <rdunlap@infradead.org> wrote:

> Hi--
> 
> On 12/31/24 2:39 AM, Luca Ceresoli wrote:
> > Document in detail the new refcounted bridges as well as the "legacy" way.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > 
> > ---

...

> > + * Allocation, initializion and teardown of a bridge can be implemented in  
> 
>                   initialization

Thanks for reviewing! I fixed locally the typos you spotted.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
