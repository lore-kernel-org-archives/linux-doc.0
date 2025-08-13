Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F0B1ADC93
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 12:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755088341; cv=none; b=Y/UtXHHuN8kMhZU06HoUV+fuItk2qC9ZEhyG1kinIH0XjcBLoW2ZCVSZ76rasraJvLjydGqppbfBmVxkroGoDfaAhfB3sFG0HTG8oDNQgwMc/SfwjZkLoRUHHXjwK4gBuLpjh2itBR0mPwK22Od1nHuLegFHg2e1ydM77uHBbFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755088341; c=relaxed/simple;
	bh=78VP5p10Jg8NcnMtDmrrGCJeg8umSedtsXpZInRySm8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Wln4aGNFLThyKTi5Xto3ig2hw7ymN6aLpn0OZV2yjwcUlEnS5T5Ksu9dDf3f+UEdWSDnvgCuw+V9LsLX6g1R09mrDACrananiydEhJCrC9xPbX4GwP1EIZm9Cq/zWNmy4NWRBjHHh7ongBi6r2o+FubTYjv3z6Xgj21iHKJRAUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=TBburqiv; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="TBburqiv"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-af51596da56so5060698a12.0
        for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 05:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1755088339; x=1755693139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNG3CwDZnVq+LlYCqJlDgz0JDJC7ub+N0Uk1MeSzHuI=;
        b=TBburqivT3KjGd0sx1ZE6gaEt9UKi92w5ljhr5HpeOgmGTfeV00sTQqV6m+oQc1rCB
         7SI1lcCNGSVz+igOdgKYUClWd8J03WLMVFB4WjtUFeNgj5EZSmlkTMYIXaAw5yfgF15y
         uDUzhqE0hDyZ0ZMeTXouW1i4VvZlaa5rZaMqQm1ubEIMaqfANh24AbH8yoXTZDW8vMxG
         2wI8i0YpypuV8oo3KUyAufbN/k9Ir64dB7/S8b7I1Lbc7UcSXv+gOdWyciMvbzcXvEbW
         PaM4Wj8p+8cuNF6PjHcD7Wd8XJslZoj0HxBuq1lSYLaEsUnYA2VMo8Ni9MyivVrZE+F7
         Xmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755088339; x=1755693139;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNG3CwDZnVq+LlYCqJlDgz0JDJC7ub+N0Uk1MeSzHuI=;
        b=qeu+LwLKqHJxHaJ9o4k02qadGsNfMbo6FEBSsUPjKV26Wg4OGCPFpjGEsNYFNqlj73
         hcu41d4GkYdwgrapAwPk6sCm1cwa61722l7BZRk6ZwgmcpMb64ElNrY6E6hXC9rES0UY
         dmIuInBEej1HtRBCEOCNKjtNLOK+A4mmFwygUnK36f09bAYhbsrld85M9uqfKPHGbKhe
         C0PMdqSjU5UQt8QszdkLFH9JVlPfH0ulISMFHYlAp4cqV/T75DRaFbnn9cW/xZCGhgnH
         C1t1GCIgP6z7t54ShPbtFQV2fJlx5zRcM0D0FKEfWV4l0jPU1QescKPPjjCTPE/wKTG2
         X5uA==
X-Forwarded-Encrypted: i=1; AJvYcCVOhI5FOP+aZFE6ac5AyCwqkbjj6REIQTjoi5DQjpoGlTWXL6hk64RFOex1QrgSXaJmBPU5JGgdkJk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhoXoh/d1yQszsrQcMl9+CsC+JEu8/zP3qAaW7LvOonahpYj4J
	0LwWAWdMzTdLlz9bXvZGwz/8CwrggGWI0AnM1aljGkWi0N+6708fJpE4+94oM9VTLNonIOfRY00
	77Fys
X-Gm-Gg: ASbGncsywbunXhgweltDBMCMHf0hPSELfORgEE+E3rpeHFBtKtFxG7KakS8Gm1fzHvx
	NzVTLgp+Y8W0c9N3SBm7KYb+y7/lTkvmdEYLdFGgyy6JOt7RTBkCx79FIMAUSPOK+hQ9YCBFCg0
	fgaLvYybR0z9lIcZKVy5QOvRcBdiCAKJTPz72eoN1Mmr6+EfQ4UTeoR4ojAKpc07WhVarcOkTQI
	RS0iwJwVLzK72eDHsveP/cvD07bmKOGmmO30fAzQgD9cajucwtCuZxpr/F0Udvlndup7xVpAMih
	yK5ihaMbQSmq4h24WlKWY/a8pMU2+QfbyYuMaVeef4MycWoGxs/pYgGv2Iu9IO8yKo8OzDJvFRX
	IlenF/u0FVyD1Bro=
X-Google-Smtp-Source: AGHT+IH45G27XmEuq78X8gxw6G2P5IIWEUKaJJDkJWCvlT9IOAHkUHlLvMF5cfFKCUbmxNPSZShPMA==
X-Received: by 2002:a17:90b:5211:b0:31e:fe18:c6df with SMTP id 98e67ed59e1d1-321d0e5cdc3mr4379625a91.16.1755088338731;
        Wed, 13 Aug 2025 05:32:18 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3232553e4a2sm82418a91.4.2025.08.13.05.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 05:32:18 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Damien Le Moal <dlemoal@kernel.org>, 
 Philipp Reisner <philipp.reisner@linbit.com>, 
 Lars Ellenberg <lars.ellenberg@linbit.com>, 
 Jonathan Corbet <corbet@lwn.net>, Erick Karanja <karanja99erick@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, 
 =?utf-8?q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, 
 linux-block@vger.kernel.org, drbd-dev@lists.linbit.com, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
In-Reply-To: <20250813071837.668613-1-karanja99erick@gmail.com>
References: <20250813071837.668613-1-karanja99erick@gmail.com>
Subject: Re: [PATCH] Docs: admin-guide: Correct spelling mistake
Message-Id: <175508833758.953995.10420055026430792302.b4-ty@kernel.dk>
Date: Wed, 13 Aug 2025 06:32:17 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-2ce6c


On Wed, 13 Aug 2025 10:18:36 +0300, Erick Karanja wrote:
> Fix spelling mistake directoy to directory
> 
> Reported-by: codespell
> 
> 

Applied, thanks!

[1/1] Docs: admin-guide: Correct spelling mistake
      commit: f7a2e1c08727384cde1c686dd57172f99b5f2e6e

Best regards,
-- 
Jens Axboe



