Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7493D7D97
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 09:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784193747; cv=none; b=AMUystVaviSiYQmhwjS8UqwANQX60HRkeh7kruIP5M0mkj4klTqTfJLKmGJ9dAWtH+kGWvHNkt3rWVGBCKQa5fchYj9zGsUMrVz9v2t6hZaua0e+CEAC3+wukq22v5AgX8SGJph82GtLhVpb7vGo6PSN6aIdzXWxwb/FoBDMQsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784193747; c=relaxed/simple;
	bh=rzqO5CDfV2tieACWMMf/aFToKmo74knunxI4lMWi1/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nb6O7Ei3zXZOL18IhLizAQytSEdJ2wuTTiaKiPjeBkARqlcGlEcbVl/UMdy4yRkQkJ/xbPj2/xJmOILSpN358bJfIX+PpXyCWYNqXuXSw0IG4KpRqLZqCGGpln1tKEonj5zIdU5OGeulT5i23O5j6sp2vCt/Viwg2c74GRodwRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HmZjswKe; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HmZjswKe"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15e2dab83eso477491066b.1
        for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 02:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784193744; x=1784798544; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n6wOUdncDgzNL344qtaFFDOsPjqPXofjtfmeNQYdoHU=;
        b=HmZjswKel4QxxpyT6Y3sPgOGh1D/6kZTad6T6JU8PGTInB/XrDvTh4ZOnQVfEp9Uaf
         3qkxmg38RojIuAc9BxJSxVU2j+KO7i84AnhI81KqsCKcjrTFj7sT9w5ruJYmBgfnxisP
         NKeQgIFxKtxVFNiCmb56oYwweDavQjEy9TsKFVkJLuRPaRi6tck8T/+/3+ni92bDrMbb
         0lF8Xd1JU7TzM7z3nDgJn3zmTH7hL+aoayq2RRxQXq3MVzgbfugmyXeZFO0FxCM2ymnA
         KzfsDSTgIlU8Bqat2AARMlcB9IwW3NxviGijjY59iQyk1qIFqDqUpVIoGGO1oeWOIy6s
         EWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784193744; x=1784798544;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n6wOUdncDgzNL344qtaFFDOsPjqPXofjtfmeNQYdoHU=;
        b=fjuPSKs9/MG+vlcFGp4ArKAMyqV/AskwKvudbdrzNJPPoHHpeG6CvMHYo+4WO9Kgnw
         4he+g1Mak3m662VwbMfq3//XnehwjafmRvm/fZgxDxvgwxCwYLPxG3upPZa0PS4WNst3
         zzDOxW6sxuIwDavRNHemetq8/7wrrM7VREnBiaMm1QDx4168mBjVwWqqNxRgC85o1CLq
         7aoIInQbBb1VtMK8H5RjsYiZx9KydjVcBPpNbOS3878ZAuitNghvL3eG9plDhJxnjHPK
         afDYLUdKLuQ0fMHVisGxsMdGuLqXirVJE3bRdAIJJobwg8ib3E0kzTcrGJzGK5rUJRfO
         gQWg==
X-Forwarded-Encrypted: i=1; AHgh+RpRVvGEpKndTXv1kHJEw/3d8QfVII5e18ay4gRulIkdlFBIng78h7bZNJGhNWwCEbzix5kuabVNHLw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlYPrHm7HLhxxkZrpSogDbx814p+jRYb95v0S04sgSmRjSGsi1
	f3shyeuygZcq1pB9oPN8bqR9UCtQzZIxKKgNsCdz4Jofiuv1BUa9bjYB
X-Gm-Gg: AfdE7cn+ERk9S+XSAq0O///PjXpdgSj/VB0kqQ02fl/IXmmit48N9EH/dvFMD13ld5L
	eCLwWjJvgDohhRSwT+Wmgzf+hAAqY1/MS4PphAJNMeESP3Gz0HMNjvHr5nWBZ7bkcYNrzTDplpB
	1nWriMlu39/RMZTMfekjuhQt0Z+8gNTbMj34dcb7GgMmf1EVy5PAhYgavmzWTE4duEm+2bRauyY
	pofHvYWFg21HpQBjMoxVBPmjTiMuFqo/GYdcVKL7ct5HlPxUXycn204S7Drrm7d8E+fCOogo+Sk
	ENZms/Y35ShVwc1wv27H7toDH6KKTnnbXr6+tpqTeYg8NC33yVVJCC9ujLHuF1eAZ4aFdPpEotx
	x2nB3GNXiJp+LoKvZHeO314rZa6l2CBrhUQSmdMqGUQ58VsQ5j0oAuxOiKJGkidZBYEaLvM6gO3
	NhgQEp+dYqQPn2BlnW
X-Received: by 2002:a17:907:3e1a:b0:c16:358d:df3 with SMTP id a640c23a62f3a-c16358d0fecmr1012405766b.63.1784193743476;
        Thu, 16 Jul 2026 02:22:23 -0700 (PDT)
Received: from NSA-L02.ad.analog.com ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e12ccd067sm2385553a12.21.2026.07.16.02.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:22:23 -0700 (PDT)
Date: Thu, 16 Jul 2026 11:22:19 +0200
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Janani Sunil <janani.sunil@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Marius Cristea <marius.cristea@microchip.com>, 
	Marcus Folkesson <marcus.folkesson@gmail.com>, Kent Gustavsson <kent@minoris.se>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Janani Sunil <jan.sun97@gmail.com>, linux-spi@vger.kernel.org, Kent Gustavsson <nedo80@gmail.com>
Subject: Re: [PATCH v6 1/5] spi: dt-bindings: Add spi-device-addr peripheral
 property
Message-ID: <jsximyohkijphqrtgat6cjtcvtirjsdtbgn3lb6npw6yhgmcth@tq64dotfowss>
References: <20260715-ad5529r-driver-v6-0-cfdf8b9f5ee3@analog.com>
 <20260715-ad5529r-driver-v6-1-cfdf8b9f5ee3@analog.com>
 <1c4af9b1-9937-4cbb-b57f-52ac575b8b89@sirena.org.uk>
 <lpbqk3wv6emhdtxhnczrgufzzxprcfpfgenfepnmzhzfj3b3ci@rdphuko7ikti>
 <157154d1-3995-454b-9e08-1527f1c5d409@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <157154d1-3995-454b-9e08-1527f1c5d409@sirena.org.uk>

On Wed, Jul 15, 2026 at 02:37:12PM +0100, Mark Brown wrote:
> On Wed, Jul 15, 2026 at 03:29:32PM +0200, Nuno Sá wrote:
> > On Wed, Jul 15, 2026 at 02:09:19PM +0100, Mark Brown wrote:
> 
> > > This really isn't a generic SPI thing, if nothing else you need *far*
> > > more information in there about how exactly this would be put onto the
> > > bus.  If it belongs anywhere outside of the specific device's binding it
> > > feels like it might be regmap.
> 
> > Just for some context,
> 
> > For the analog chip, it can share the same CS line with another 3
> > identical chips. It has two pins that depending on how they are set act
> > as the device address (so only one replies to a given transfer -
> > naturally the peripheral driver needs to setup the correct transfer
> > and that depends on these pins setup and hence dt property). 
> 
> > This property reflects that. Apparently some microchip chips are doing something
> > very similar so Conor proposed a generic property given that we would have at
> > least 3 users of it.
> 
> You still need to work out how the ID appears in the byte stream that
> gets sent to/from the device, that's way more information than just a
> number and not something the byte stream SPI offers is going to cope
> well with.

Not sure if I'm following you. Those ID pins just become something you
need to set on the spi_xfer. Or in Janani case, she's using regmap
reg_base in order to set the right thing depending on the address. I
would image this is always something that peripherals need to address in
terms of how the message/stream needs to be set. So my understanding is
that this should be pretty much transparent for the spi core.

But I might be just focused on this usecase and missing the big picture.

Thx!
- Nuno Sá

