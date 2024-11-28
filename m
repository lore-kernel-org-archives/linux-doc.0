Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D13192B94
	for <linux-doc@vger.kernel.org>; Thu, 28 Nov 2024 11:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732791776; cv=none; b=egBpJ8WoiuX+bjLJfvhz5Cmf71xGSsbW3kWqVtd5/G8LySddO0PmjyFN4RajI2rXHttWU6f7Ile9Tmb2dvuiYVzf9cyi2pC8vY7CFAs95cM0z0tDls+vsqh1bgL1TmErUUNO6PqMPdl9a/e/KJ+ES6wfUVcUWmduw+ViegkJRRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732791776; c=relaxed/simple;
	bh=HkVtIayR9foQ5xZVMRAYZGNzyqx9gy93kknz1x9CCF4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Va8pychY2UxRbEwrG/GDy6PaqkJLdxsmc9wmdYQgvupCfLja9vUtf/IEYcP308n6A3XKN4Pq90SlHE8VtL2h49emn4K1rG6AvsWCCLgZgzE8eEk8kmu+YyaF8L24JKjaNbrdHLoYsKbtakVkj2o89b9ewyKIfPcq7MYh0rWL/+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=rlrLEGV7; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="rlrLEGV7"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5cf6f367f97so795771a12.0
        for <linux-doc@vger.kernel.org>; Thu, 28 Nov 2024 03:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1732791772; x=1733396572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N2jwobz0tUiTEvoVAQRqFl5xUiWCnjuXqJcLdQu4lR4=;
        b=rlrLEGV7J0Hi1G6VETZBW9SaLe95Zcy/SNuTmz1ptRbEgsA5h6361gmQMCT8qtOqcG
         5nlaKHrTPQtX2z7qylUWJYdo9k/PScwSFquuovfAe4lHPYTVEeQgSsV/ku8c9U0yQ/pj
         AJuwxdz/nadyi0hnKjb9pvD/h6pyhPOHlagrfECXy6XvWlNlfwzQ90LTD1ldqv91FEMZ
         0AfF9r/Ck6uIU3uFAyBcBaU9BtSQyx84Iy1WAX8bAVbq6R0Gf5GecFkZlBMtfVgZn4up
         wFvjY5Oef/3hPC+bi+Tw2z2hUNYvIZ9qWSrhkvSM35SfnEvXik35QPcBoSaTAGFgCAMa
         XPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732791772; x=1733396572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2jwobz0tUiTEvoVAQRqFl5xUiWCnjuXqJcLdQu4lR4=;
        b=bV2oUpw92YcVDcIjwNAZRnGEUqvrUiVWNRunGWqGzwAjZv7BWi2qG3+O2CMs1hA2kr
         YTYLVuK7MbemM4+Uwg6ldTPjKuYo0V2a/35y6ZV6gBVezA2fUNOfXbP7AyHNc37jZp9M
         8tZK8F5FNjjejLm/cx390MSqjowdjCmFITsCtQZldPPy15wnhAFFO8O77QAjbQ+3OAqe
         cK0WJrK9DJPGABK/sPWdDC/yeKsaIc3Gmz9E2W3ZQgN6uO6WhPaWpxI0YDyqvMZ0I/v4
         P6tL7GsmGwHQ7XCNhTIcGpgaTGCoFOOXqFiUejFepA35WVeamf/k3dADAHH5wC573toh
         RqOQ==
X-Forwarded-Encrypted: i=1; AJvYcCX49DrvCHft0pvzfdj7/BrincbdeRNv16WMSoCrbbgpjagGbE3uTdSpAmnKJEKibPDiX0Y1gV15V7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDWqY0IFqaeHvyRuwaoUFxieCDr2hHD+2koxgmqQ3RMRh9vNBH
	utNmzcmFAZKhrhXhHwyCUmok6W3jYGq80WjFf0DIxjQk15DUrH7WvPwNTXbO+UHXu+mxWqt8qhx
	lF99uJ5q2o6M3OWW8G3NRNfVZVzXP5Sf8u1h/lc2DANmlQ8mJ2SfERZuGsoSNXej9NjLLsg9/xl
	p0dUEc58Xm3NH+moKljs9SXWE=
X-Gm-Gg: ASbGncsbt5AvDGSjtUiM7cQFJvmAX2jBzZkjm0Who3ylFNZi/v5YijUibMKTVnudG/z
	utMdVB8I6qrkSpY3MsUhiBhZYwfr5YyaTK5UNRq+3AzQpOruVfN/9qqjPKkbP6r5A7UUbuyqRWa
	rx0FfxfGptxekOnH16S+USPm+QplLpg2ibOiP6qA6CtV6MNnBZJ7sl7bNWJHo+eQut1TpsJRTyk
	pwSQqUGsRgqpkM1VC+Q94SCEtmxbgrQQq8VxxBZqXepD8RCoklgGlaUuXEGLsTUoy+9RJaL6Q8U
	dx9Kqp9W6OWCiWAH
X-Google-Smtp-Source: AGHT+IFX+FbOsE2yr5AmUhyG7Thr6Holt/fq6gB5PxSluSHCix4v+HkEd87hynKdzyr22pwGJOpyIw==
X-Received: by 2002:a05:6402:280d:b0:5d0:a43:cf40 with SMTP id 4fb4d7f45d1cf-5d080b8c9bemr6225787a12.4.1732791772129;
        Thu, 28 Nov 2024 03:02:52 -0800 (PST)
Received: from admins-Air ([2a02:810d:aec0:2a54:184:ec69:1c84:8a04])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5999058fbsm53856766b.143.2024.11.28.03.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 03:02:51 -0800 (PST)
Date: Thu, 28 Nov 2024 12:02:49 +0100
From: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
To: robh@kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
	conor+dt@kernel.org, pavel@ucw.cz, linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org, krzk+dt@kernel.org,
	devicetree@vger.kernel.org, corbet@lwn.net
Subject: Re: [PATCH v9 2/3] dt-bindings: leds: Add LED1202 LED Controller
Message-ID: <Z0hN2WLfIOEx7x8l@admins-Air>
References: <20241121165829.8210-1-vicentiu.galanopulo@remote-tech.co.uk>
 <20241121165829.8210-3-vicentiu.galanopulo@remote-tech.co.uk>
 <173222307644.3811087.7654504224510124517.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173222307644.3811087.7654504224510124517.robh@kernel.org>

On Thu, Nov 21, 2024 at 03:05:14PM -0600, Rob Herring (Arm) wrote:
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.

There were no changes in this patchset with regards to the dt-bindings.
I wrongly, did not add the Reviewed-by tag.

> 
> Missing tags:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> 
