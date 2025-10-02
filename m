Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325132E03FE
	for <linux-doc@vger.kernel.org>; Thu,  2 Oct 2025 20:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759438509; cv=none; b=B3Q3zYubJKIj8tTwN98xh4kKYJ96vYcZbR0U440AEy0DEqh42LnLE7fzwokC3OZWbDWY7hudka/N1+YIevvqIHe6QqxtYkdXbO9+RKrv4kDIUEHFjdiKzqoGQ9YPKGHRetN3OLuGI0daYsfNecbn12O2nSUyM0shbAQtvgPnYEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759438509; c=relaxed/simple;
	bh=ve7VSnEXz8SXLkr0Ns3Xtbmzdzf6/gpZI94v8i0XhNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2wx+q14SfDZ7sp4j8lyKx8UcXQGxV/dJi944dQ0fXPSHOhoNRKyp3Lz25TI9pYYOAQTFWelyz1iswoOcDiNQx1D/Y8nqW4peMq1aS4Hw8gkd9wJKJhHLV1q4VV4YFEXPHIpHLc7yIG/vvHjdlNNylhFeo39nT0032nzfl5tn9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zum4Xn2E; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zum4Xn2E"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-271d1305ad7so19492275ad.2
        for <linux-doc@vger.kernel.org>; Thu, 02 Oct 2025 13:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759438507; x=1760043307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lIklhV74VxzGNTOE6vXMU3sJY9HtAA/7pD7aRkESOR0=;
        b=Zum4Xn2E2Tflw56ex9a12QHG7jkwi8KYoQ8qGaYvZ2Dkt6SMK6fh/JwxIZVn3hwnz/
         656/S9F+MYXBSpsMEVjj3BgNvOZr3Nw80EiJCts7JIe1vn1FoGcxi6q/aTGfXFNeoA6g
         izHmK5aAckLIzHbTx8Ua65mh8J1m8CbDkm+R1czbAbGgQwYzy4KUIN14u+HWSKarBmX6
         BiwcHZmTy6BNiaeiIEJwB7Pchw9C13bHaJ4DLPN+4OKhnIB1f5XOKVSjq1vQgkCbbjUA
         pJELwq2e+S8+JzlPj1jIbcgOWprvh+tO/Mc7DJHgZDMGlzjJdR/e2yQNLEyoXbbmnO66
         x85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759438507; x=1760043307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lIklhV74VxzGNTOE6vXMU3sJY9HtAA/7pD7aRkESOR0=;
        b=SD5lyL3xLVtsIdhHk5xvdX2UBBnSMBjwfnHtGlKT9OGmFXfLkO5aCDIf2al4SNK2pS
         ZFqpDbkJMn7M1eaJNzV8XQO1zcxoc7eTyRDWuHLjwgpV1OanxOgo2N7eIsVSGSGDYQwO
         E/9IswJa6WJMQ+dRXKusx+eZ0S5bD3WPVEY79ShmXMiju3twrqImeExrP3DVoF+N4Qp5
         tTWv7a/BRJtlp7b0+u2TkTp3s0aZIwj7qIn68GIiLFnaYSqNIIxTcqYG0hRv+AVQNNRl
         dSQfIgju9mX3z4+RS5AW/kBQR2gSqHAphARvxyPWe2ndWtWOvSYR5lZWEe0i5OApaPYV
         TIRA==
X-Forwarded-Encrypted: i=1; AJvYcCXe1vup9wbINc84NBtWvJzRrSUZoUXH2d5CA7dhJOH7ltBjLsBYqYdGbz6F6En6r8VCy4rWkkpnqow=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPNCMlgBs0wPChqWf81nqsJPJjkFC+yo6uDEykMilb9ukA814J
	d+E+v8Tar62HGxwuIyPpowxZu0ptcdNQ86J+GpqxaB565r5RnLzHdFwm91RkQ7T1
X-Gm-Gg: ASbGncvVtaJ0oarQKi55aNcHs89PEJSSEB7guZ7odoUGP55cnCq492MIzqSJLyit3SX
	BXaIzar3TwB2p5VdfqOHt9t6gbp4DOTZg84czl3yo0gdNOw4bz9HOyHRyrnUjnmZ19XNLOL8kFf
	rzf4xaXjUNgoW4FKk9GnQFjLbNq8y8Iom0wx3DSGp0Sh5obFHUUWivxe2QF9kdWrnKLGcKS3m8g
	BClG/bdJptcOH+sM+VY9cP0dTZYU+E1jJzdNGvxy6qLnZluKsWqo3UapvW81TISMs96I9NbrnWf
	NV4sw+Kt6BUgOeyJleP72Fn1kKmg4bvJMNTtSHJJf687Vc5OJmESd5OyfTuFSMYpryCl2dxmCcY
	0ammJIjX24DkLuENCwyFnc9PXvOvK1Pqdy59k3lCVzkX5JK1mrOi50cSQp6s=
X-Google-Smtp-Source: AGHT+IFTD102IbQjDd7ezi5HEPtVTH6TbbeKx+COFeUkw9uJEnFAQC6usbIyZfpGul6EpzbGLgme9w==
X-Received: by 2002:a17:902:d591:b0:26d:f589:9cd7 with SMTP id d9443c01a7336-28e9a593d26mr7143505ad.15.1759438507464;
        Thu, 02 Oct 2025 13:55:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1eef42sm29474935ad.133.2025.10.02.13.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 13:55:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 2 Oct 2025 13:55:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kim Seer Paller <kimseer.paller@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: add max17616
Message-ID: <07272da0-6b8c-4283-8094-ff6446ff5762@roeck-us.net>
References: <20250930-upstream-max17616-v1-0-1525a85f126c@analog.com>
 <20250930-upstream-max17616-v1-1-1525a85f126c@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-upstream-max17616-v1-1-1525a85f126c@analog.com>

On Tue, Sep 30, 2025 at 01:02:20PM +0800, Kim Seer Paller wrote:
> Add device tree documentation for MAX17616/MAX17616A current-limiter
> with overvoltage/surge, undervoltage, reverse polarity, loss of ground
> protection with PMBus interface.
> 
> Signed-off-by: Kim Seer Paller <kimseer.paller@analog.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied to hwmon-next.

Thanks,
Guenter
