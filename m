Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55FA19067C
	for <linux-doc@vger.kernel.org>; Sat,  9 May 2026 15:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778341254; cv=none; b=heqpRt+5HWRPBfI9x07a5hcgs3l01pCuOMPqsyiOgjeR8efJLtqqqyyi4ixfA31xko0f3xtl7JKdbT728i03b4pBENzp2EuP04MdUucAkff1W4PRXRzOx2jz5LpKwfVgZFETj699p97Uf8G6/hpAGDtP/v/f9rWzC/EY/MpJAKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778341254; c=relaxed/simple;
	bh=DO0uuXw4XHQbU70ojqf9zPsomYorV9Oj36hGoursxqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cjeq3fYmS7lHNbd4uHKfl6Llr2H6Gw8cnQL0lom/1eIuikaGIRj6SAAGkahHtkWisVG7rHPY1dS0pgujNDiMGi64CxIQhJ0Nb/hj6ywoKDQmUE4d4sHBVFR4JHj/RVOm8dTLxD1N1QRsmDWpuZ5+TNLsATdC+VOrZn9B1n0WZJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmlpNz4E; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmlpNz4E"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12c1a170a50so4112157c88.0
        for <linux-doc@vger.kernel.org>; Sat, 09 May 2026 08:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778341253; x=1778946053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4xYjp8R8MGjk1tvhBBohAtI6RYlnEbpBj/HtDKZx7fw=;
        b=cmlpNz4EZ2YnVQZycu2frjLyjTDK3E3awfeaONQ665OACts5B68i7kZV29ZFGxbw1I
         bAbLehvPA1swjzExpe1Y2zwBh92J+Mfs/uxtFK98XCGGlMDzkRtu6Db933ZKLjQGksXy
         uzd9g4rdxrZcrReSM5Znyf9BGQsMQyveyKv67dZEB9Och9OO0r0LiUs3EwcywPA+QKDU
         NFDpRfesjK3A5RvUc+OKUq792o+SQA6yPeTFK8DccEp8QnIQwHz1/7Blq8pr1xYg3xZ2
         g8dHj6WCWJXY/pVEEVjV3CGJS87J3pCEjnJiNEehuh+61BaaYde89MR/kc6Q2vqCJRpE
         y2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778341253; x=1778946053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4xYjp8R8MGjk1tvhBBohAtI6RYlnEbpBj/HtDKZx7fw=;
        b=oeIUh58fiKIMSXM7WoUNBGIPzFl4HIogqCgBr35ADz8aHVTtR/ZfRFy/2wAVvHc+Ld
         yD5lUvGj0Yfed2cIeQHQEgmt1yaWf5oQarA6VaQGAwiohSieddq2+rdIDwAxMSE86OCc
         v+nSijwZFDd06PrwlhFbnGUhvCZuenHOG26llylmu3+RTsfUdwQ3F/KDNLWtdLPDoVuE
         9LMHP/mXFYv65s/yFa3eKqk3Fkcd4An8KCAwbND8zzxZWEvQFEP/kW0zPaLDNfvIkQjN
         LUPb8CP3FSijhNP829UQbAyFioIhglesZO7zt1yPFCtZhevUraWgmmKQBYW5pR/T15KH
         IkFQ==
X-Forwarded-Encrypted: i=1; AFNElJ+80Y+s/Utb0xp3x01OThFLuhq5MSlDZ+C5RbfLZFLzLeuwX5SvWu81SFA9ioXEJbP+Pz+nPwn+2Gw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8GMsGKB2Y+EQ3HcUX7aMSTXER2EQY2/5glLFyS6lop9p+MAau
	2H4hndX8P01/pIvvU41Yqk4TcRBp5H+CUC+eEms8WAsF6m4QcU5wRnKf
X-Gm-Gg: Acq92OEdGVh3iBZGe09luOJJlkCLrvqYF2prL0QvHzJ+tOutU7kkGIlj7SexeihsyzU
	LEON50gYCtEUKCn1fgu2fcjPH+80FHP+ZzzGKWU3pwbqiZaWHhPWsbNbytPdv6BiHve1OWty8TY
	KRHLwz+VHpAh2U0DzPfKWFzll4S+Byh9JaQ/YLORcb2lkTAqg9NHI1aP3Z7o2E1k+dRX3i5YHG6
	uawpB/H9fTGoM06/HXtaZRykBMYQJ7s7peNmK5lzcOGUo7SyUDNdrrycwwMFbwYYLwmXoeKWWfi
	CbqNqeFHFs8e93zH/jQf8ocVQuV+Dd68qTW2pjImwiFGYzpKyWtPGWziMtsTflM2TwpjTean3NZ
	3cwJOc+YqmcW8r3ea4m31+s9CeRXAuK30Q63V+6HjXgeJxay6LD4Vv8b9w92IWkXMVNIMHlJzxm
	QGWvI/O3plG1ONFwCdJtY/Kmo6IhxBgNKMErVawbdri42TM8E=
X-Received: by 2002:a05:7022:f411:b0:128:ccb7:7fa3 with SMTP id a92af1059eb24-1319d14f7efmr9154077c88.34.1778341252823;
        Sat, 09 May 2026 08:40:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13278210d40sm8386334c88.4.2026.05.09.08.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 08:40:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 9 May 2026 08:40:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Chang <kevin.chang2@amd.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Colin Huang <colin.huang2@amd.com>
Subject: Re: [PATCH v5 3/3] hwmon: (pmbus) add support for Delta E50SN12051
Message-ID: <355daf0c-afb7-43b2-b6a2-fa25426eedc1@roeck-us.net>
References: <20260508-add-e50sn12051-v5-0-abebdcc29665@gmail.com>
 <20260508-add-e50sn12051-v5-3-abebdcc29665@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-add-e50sn12051-v5-3-abebdcc29665@gmail.com>

On Fri, May 08, 2026 at 05:44:30PM +0800, Colin Huang wrote:
> From: Colin Huang <u8813345@gmail.com>
> 
> Add the pmbus driver for Delta E50SN12051 600W Non-isolated
> 1/8th Brick DCDC Power Modules.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Applied.

Thanks,
Guenter
