Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974229;
	b=LwSAEORgn56vyaWk4YnfLDfPrNe0kUkd8IH12KMN9D66SSw6VJe1foZqX+EKrT9WkDOV
	 QI3k+sk07B8/+md36DzTxwbxn+XMl/IyoFCWg5ffGJ4X0cN1DiOgxJl3RP5LgFn+LV8Y6
	 kO5e63N9zxYY+9aTbKNOLHXETO5dqrv5ASP2mjJVTiSIaEdzLZdGgkmySFlHgVKJaCytG
	 D7eds+md8C5SoiXbAGBbe/yXcJvqJxRED0y1xHBeVObgECTYp1ea/vkWG9jR82FHhS0jV
	 ofQoOLrzIjT9dSQcc8ZCyWsSq/nk4wnxGk1ADMWfdCB7InJy6lMNXotCm0u/lPi7mUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=qOAEuxqxBYmK/0PL/M0euV7RCcXgDliX7E86NGaLuy4=;
	b=w3iNv9VlEC2i5B1rp+NzX4yH+BL4YWZNKbYuun9Fg196S3c5ADQOKev1V/c0Ngtg13SW
	 eU98CgIoXakCPymEHRUKM+RoTvfnGopqEHhmf7AOqT02xQ0TT9HmLNgX7txEBkEUCHm+M
	 irOjauXodLaCO3Z4pyLkizT3jFr5SQly5hkZaEJxkaVfVHeScN2heP48mh8tBbf4gHRap
	 TOckPs0X8uZajxriI2k1f6oSshZTWSrJsTLkvO9DZJpiHnXWnnX+Lgz/tW7UCgiiXvfHx
	 GzPA6yvzieSEm8a6gJpG02atlYl+QRWvM/lWPoTHYckBuXw8/6dApakcH+pI70FemSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="c5O6rA/0";
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A88606A31E
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 00:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08A88606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c5O6rA/0
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so1891874a91.0
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 17:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974228; x=1793579028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qOAEuxqxBYmK/0PL/M0euV7RCcXgDliX7E86NGaLuy4=;
        b=c5O6rA/07U3TPiUdjyQl+0E/1QGQKFEd/BuZr146AnkMngEg/j6CBnibvZSqG0Fd/U
         e4xYnAbkCcJZ1k93qWPPfj5VllNNTSBCgJV5StBfQdExN/DGAdLuzUg0d+8BpiUz+dWF
         8k8Yh1uPDnH3nRhntCgLGxU/EuI7hZF/CcR4oFQkXMUVcuTWXLK9tsE7bHqwgN19O4Zd
         Cyeu/xE4r6nEEXj62dltqk3zE19zxhJyrgAJVuQnqGgjnQ/LBWSIkIOro2427PZKPcis
         CuBDXBzun4bni3YIS0qe8Wr7agcu2YNAB9TuCWvtGR2SX0aXsXlmznXP+M9fy4lE0ZeB
         LV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974228; x=1793579028;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOAEuxqxBYmK/0PL/M0euV7RCcXgDliX7E86NGaLuy4=;
        b=lOKrrrTqz+dhBeXthWSsI439Sck7V0nAT8DIkeVhv2A1G4Ef7ZYtQOGzLBtem9d/Lo
         m958zDRHslc49yoHbX0RQkQANq/eytcFxm03xrADruqfgbqm1d6e5odaJJXAakrnKbE/
         lnpPcI0BCFYO5H1yJDefKeTFh7ribq2aRo/H1M9OkNlHqxGK0fSB9uTtl4K9HgZoljWH
         4tlLQm5dMzYQJeUfpFI9tq1A1Jvp3VHrsloElbIgKE1p6q3PznhpS18cjIzhhhITvZv/
         9cvG3auvRF6h35ZOGKqBTN4ngUnFNjK0FyeN4kj1kGPzax+aumVTuOEpNvTyR/l2uxTT
         C5iA==
X-Forwarded-Encrypted: i=1; AKwUvBxxFBK4qN9dQwD1Gq2OQ6tCt4M1WwrIgSzFsmLe8xybb6U5MXyB5jtdHETsgUqWuIESoAG4yYOEZ28=@vger.kernel.org
X-Gm-Message-State: AFq9FYJA0K+S2YPvYISHrVqbgjzC8HpzJB7LkBNizgLrTq8Jv9qaxwo5
	ubypco19rzisebOiocHNiYlEap5hOA4lnBAhGcjqQdlpiqtNJ98iCDzb
X-Gm-Gg: AYBFou2rYNu4WPI/gHBQN079DVU28BcLmdsYf5YSA/uFGHBxAs0HXcI2YL+71rz0ahZ
	Ll4UJ8zd+Mz9a3trHeTTGc/OzsdmWjCCGqOUoG0G0qy54Fv58szGBgjw3Mjsd1FmRudJdq5nh/T
	08l0g1LKPljnIJ+97rKZZvWz3nunHgfa/soU9Orm9wv6e9iYY/tVw+cYwNZ2x1nhFW8oWnAVA7Q
	YIGyiF0E5vxB3Chf7hdVAi99NehFCB7B5QQR2sRvMJG8Byf4wEboYIkX4uV7btAmauo5Qh13B2h
	fQMHh1uI2FK+v1TZQtomLNoMTrbn2limWZ71MA9JcQQNv3yjAD7xyTO7DTWdxkpkDoOWlEfAbWE
	TQeV94nPHBAizGlJZtqqX+FKMuY0HS3i4gb36gmzfJOhkHVB0tClHtooM8mF9osI04e9pMQZHGf
	x/HURdXOQIVBx7dCegLQzfB7P6hB6OCoHvFPMYFU0R7mxsoVKOxhMP2n+8rvOJzUzxreeFwdJTz
	N1xaSAovQ2kW9SE+PNIUG8t5VoLcZgYKw2LRd2tBvZm9vz7In9AN96pPrFsq2aDpEfhbA==
X-Received: by 2002:a17:90a:e7d1:b0:3ab:1b19:78f4 with SMTP id 98e67ed59e1d1-3ade9b2ed8bmr5091396a91.6.1792974228365;
        Sun, 25 Oct 2026 17:23:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba32e38sm6406037a91.2.2026.10.25.17.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:23:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:23:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, jdelvare@suse.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 2/3] hwmon: (lm75) add MAX31875 documentation
Message-ID: <c5cdf9e3-919c-48c9-9717-8bc801ad207e@roeck-us.net>
References: <20261023091550.1494-1-johnerasmusmari.geronimo@analog.com>
 <20261023091550.1494-3-johnerasmusmari.geronimo@analog.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023091550.1494-3-johnerasmusmari.geronimo@analog.com>

On Fri, Oct 23, 2026 at 05:15:49PM +0800, John Erasmus Mari Geronimo wrote:
> Document the Maxim MAX31875 I2C temperature sensor as a supported
> chip in the lm75 driver documentation.
> 
> Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>

Applied.

Thanks
Guenter
