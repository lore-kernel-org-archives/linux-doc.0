Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D361C32FF
	for <linux-doc@vger.kernel.org>; Wed,  9 Jul 2025 14:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752072584; cv=none; b=cuf4MIX3cpHhDlgDHs2sNSv88G7Cel2POf1q16CzxXTnRA1TDzY0uJuXX7aOSJeglb5CHf7a2HcsggW6tRFPPa4DeN6cBxjCZ59uHqn/AUKChF4A5m/TRxr0EEdjxe//v0YThU1F0VkgSYQLADCfjViJrsubqUIB/ZIEoPK/ZT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752072584; c=relaxed/simple;
	bh=i/3T3rgCm3LbTB5t6VdO73xMaOdq9fqlxsmlO44cOGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D+deElhCh4HdkhEZdG6aqPBtTFOmc6z8U3bGYu+WWmqQMIgfYOJql7w8inA3yAUeq/b2vLgJhjRTze3ZNo8cTc9cWPeYMn74vi+5QIcl3XQs1oodP2g+/ZWYwfitXT6yIEN6p4TV3Pyn+PmxR+aBwo0hb8KRHdCljHUqvGsf+JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oODtWeLm; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oODtWeLm"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4530921461aso41265395e9.0
        for <linux-doc@vger.kernel.org>; Wed, 09 Jul 2025 07:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752072581; x=1752677381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+clCZcAmNaEhJNDxw2K6HurtRqBRlDqkioZalS/QiBw=;
        b=oODtWeLmpFA8KAWPi4S1KvNXKqBJpQdCe/FfHceNATbJoJRGtUTMrLJch28HSAvepd
         OWFnBrn2Uwri5FNNpQ8lGnvBHQ+F3ZtH+ytnp+eCB4rvTEzkR9521a8LrnjR/QoZhTRY
         SbeI6qsjBBGoYRVznqLdyZCCmN0T7/aDMtp2nxBqTe8Ga2cskdkn3lJFozeg4CGRaQjt
         IRUwY76ZbdhqmlESPZFScwt8FXbLIeLIZBLp34EYZ88udWJaR1e+pG/AL3vEqr7Hysoy
         C1RAt3BanlSROB+83he7Jk1urRMWY4O+w/c7gJFpMX8HJt/0fOzVxsZ4VMd6Zo+RntBO
         /oJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752072581; x=1752677381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+clCZcAmNaEhJNDxw2K6HurtRqBRlDqkioZalS/QiBw=;
        b=blukgKcwObRzGEUOB5HUvMP42TpW5fwzHAtpC6LaZOTS+Wk26pzfUFTKo5yqhk83CQ
         Q9Ec8QdSfmFkVWXF8vRALycPDWAf3HDXc4pqqVTjnt9LnWXjwF4AULR2YCe66ctaEjS1
         VDvUDlt0uF5DJvqdDYl6Zl4KQjkwgEqEKVRoEXsYb8/gRk1NgY4PM7wMg/7LXo2K/xfj
         tgO9KH2EBupna+8WJ7IcnXANGnlXUisAz6dQov1VNGUCKhvoWcmxHUoraiDX8bq3KzF2
         FbysQ6X+5KabDIQQV65mNrhbDS1t1oXmVg0tw9fYvcyPzSCIfQ7z008/VUxCL7+hZ2Yf
         xjwA==
X-Forwarded-Encrypted: i=1; AJvYcCUL2NL7VMwHJHSZne5FrISkuOgrnrt13jbBZjn1dnrpxkzxNYFDFjqNl/4wIU8ai14gbe5oBSutw9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzorUugvCVFwOS3Skz8IFvM5nPfhQZ/+xgZ/rPw+fvLQfPG7jql
	SaceORc5gXCXEq4A4PfO4e+ERcdeimtJQ5UFPjxcCN7Peiyrz3n/16AtsgJDF/17Luo=
X-Gm-Gg: ASbGncsm6RzsjqJZsC54eSenN272B6VsoFFagwIcDCdYhfZLiD1OeQ+QWykKW92PXVE
	tQTXSjdfmGZjiVcQvh3dN5MeUy6QerYcC3+eAVCsr9lnDsK+NeP8AY3HVbeYNE4Q63Le3X7Iasq
	R46hb9RKPIlZfhvSKIv9rIAMoXDSdpvJ4r+ZtYUZwYTIbbjv+oMBRwwTH6FfelQheq6ikSLXpBi
	pA+6i7q+xf+URchmAFC+0HOnN2/fJF+XvEyWp3Olh2lUoiEfMkYqvc5PdXx7gFTP5bl342x6r0a
	g+Z4Yc8AJYeWUsxTntiNGE+eq1u9iILSLiDd5NHWN5bpd8cLf2plLWTPRXuHMUp0TOyOj5gVNQ=
	=
X-Google-Smtp-Source: AGHT+IEvnogMibb4vYHlJHRH2PNaGzoX5smkfBnnJv6Rl4n+ke+bVilxmX5/5ST1QwlJ7GZnt/JGzA==
X-Received: by 2002:a05:6000:24c6:b0:3a5:26eb:b4af with SMTP id ffacd0b85a97d-3b5e44e9e13mr2351579f8f.18.1752072580842;
        Wed, 09 Jul 2025 07:49:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5062119sm26543685e9.18.2025.07.09.07.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:49:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: sim: allow to mark simulated lines as invalid
Date: Wed,  9 Jul 2025 16:49:39 +0200
Message-ID: <175207257347.43561.5299868235496742290.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250630130358.40352-1-brgl@bgdev.pl>
References: <20250630130358.40352-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 30 Jun 2025 15:03:57 +0200, Bartosz Golaszewski wrote:
> Add a new line-level, boolean property to the gpio-sim configfs
> interface called 'valid'. It's set by default and the user can unset it
> to make the line be included in the standard `gpio-reserved-ranges`
> property when the chip is registered with GPIO core. This allows users
> to specify which lines should not be available for requesting as GPIOs.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: sim: allow to mark simulated lines as invalid
      https://git.kernel.org/brgl/linux/c/0cf6d425d39cfc1b676fbf9dea36ecd68eeb27ee

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
