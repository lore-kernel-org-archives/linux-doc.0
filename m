Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048CA25B095
	for <linux-doc@vger.kernel.org>; Sun, 19 Jul 2026 13:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784469200; cv=none; b=TVIYLG8nPU4TssPrVOwPRiMOI2pkD2lHmUD/HDRUZx7KhVY1cCMJDza1qb3he1n7Um+/e+ZlRxilp7GyEF7aJNuf3DXBgIp2wS3GL17bF+VB0bpzqnpKZfqXX1HSOfAu7Xd6UcC4DzkVQqDKehmopJujF6uHJHGHAG9Cfdjj3o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784469200; c=relaxed/simple;
	bh=K+P5R6wAclwOFM86ZUqkNFpSNByvTQ8SFaF2Kx/AkcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQ47AV3tWaIV4sxpKdtWD/CaFRi70sYhpTS7uysH0p5rT+FsgaDhAR0C5TBYqU55QwPwCxpCEUKYc2tIhxJf+cTAY/k1O89PKOYuY8akYFkfOqBg5StgUi4YTQ2Gn9ZIoXsPsDcXSfYXxOEByF1Yz1ohrvgyheC09S4vIMYBpLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nxHtsd1i; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nxHtsd1i"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cab973140bso114257815ad.3
        for <linux-doc@vger.kernel.org>; Sun, 19 Jul 2026 06:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784469198; x=1785073998; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1nuOr72UPwe1KUQeAbUU34Et7h55j9VwtvONRGN6oj8=;
        b=nxHtsd1i1Lyu2/RmhPm5UqhFXLIyhTpd0jtIbFyOQPJCzMXCuuavktphQx/uXtv39I
         +cBOb/FVNRGiKn6Aml543rf4Dd00xleRkX1HPQirz57W/Ju8mTF3xOU+3DDy5/Aa9Y9U
         F/JpGszeEmDyGMk/zJx9cUSKlTYAI6YJv2TK3MTdTg+Xz5jYnEySPp8DY+PpIw1nza2l
         mJ70iLcWK98V1pVg7mrP9peLRydQ7SLBnkY0kmu4NPy8IrMOiFzPXq4K5bbsB5Q3gz86
         IMOfu+uZrH4OMwJPQoYfopAmKRRzHjoq2shPca3a+R1Gs54p5v/RUslkkxo6oEmcHtJN
         M/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784469198; x=1785073998;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1nuOr72UPwe1KUQeAbUU34Et7h55j9VwtvONRGN6oj8=;
        b=Ba3C52D1x8ScFpLCTMoXNP+uo0MxttahmKwqdCGWGdFk2bhOx9+vSnf5/HE1d4dbSR
         CkIoLOMAm0xweBXfHHywJV9blU4p6ZbCE4Rc5lshUK31Pa8Gb3VxF8AmODtyH+OYgs9k
         qjN7BoMoB8JFWw8woso8gM2c5QHMtEsNvROZuDNYpbjpDSHQyzI9obRVa41udvRil9Dk
         CkiNhEDADQ9M/BXyMtJolcA7C0xJqUnBCL/s1UJhz1m3ybQ0AZgjoKE9Jq4LeN+V1+00
         9ZmVSCMjqShrkq/OWYTD8KNyHK5FvRyBUtVLCJpMKPNx+Qwu0mVNpfIFpwP1nrHs/grd
         1utA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+l1z8sTCLGaWW/3MC1qzNZjJkenzeG1GQLC/7sUXYzzm4JXoRa7JlHKox5F52plQn+ZZyubH706w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7dFKtInLd/Hejsl11MywFZDx6gPNoIgRgRXGWBYDxv6ovw3/H
	y7Jx7vksXt3Gso/06woU09IHzatWUw82yMtu0q6WjY3H+4EPozXywQc9
X-Gm-Gg: AfdE7cmV0powjCcV2CYfiDVprXoURhIJ3m17yxwp+kDXLx2785/7mv4D959i7dnH/Z/
	utH3qX+ihB6kBhb5ma8NBY9my8NBbtagqHiswyRSByxDWrap7twq8HS707nlwSgeKwbfZTQQdfT
	kV5QuCunEHO7LUvATWFF2Ri6JTAGgeUSmr0HTUg3YoQt7qvUpLaaAkiJaQHaUmBKm+3zUr2zHCH
	0yLC/8acJHS3DlaVUxPH7hZ4SvF57wjdAqQsrd17coWii0FhqQ1LxdHSjrP5AmCoYH30NF24rmA
	AJbVGbSL0rO9Aa4V3nmc65WPcjCr6eKfr4ovhtCTLq427HL9TYJfZale+cGmlkDA7IqDDOkYWf3
	dOLoqJuxxQD+jSyGyR36aZHnIpJNrIySKyJnnjN7VqoURbR2X4ScQ5lOMuOdJrRCuuei6M45EQg
	RvPAgGxylMd5FRu+A=
X-Received: by 2002:a17:903:b8b:b0:2c9:cf5d:d9b8 with SMTP id d9443c01a7336-2cf349a4e71mr120661285ad.33.1784469198194;
        Sun, 19 Jul 2026 06:53:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344cf96bsm41125915ad.28.2026.07.19.06.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 06:53:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 06:53:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Kun Yi <kunyi@google.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] hwmon: (pmbus/max34440): block unsupported VIN and
 IIN limit registers
Message-ID: <aec1b7d5-2416-4ef1-a25a-946226f5c2cc@roeck-us.net>
References: <20260716-max34451_fixes-v1-0-a941b27eaecb@analog.com>
 <20260716-max34451_fixes-v1-1-a941b27eaecb@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716-max34451_fixes-v1-1-a941b27eaecb@analog.com>

On Thu, Jul 16, 2026 at 04:25:11PM +0800, Alexis Czezar Torreno wrote:
> MAX34451 and ADPM chips do not support standard PMBus VIN/IIN limit
> registers, manufacturer specific min/max registers, or undercurrent
> or undertemperature fault limits. STATUS_BYTE and STATUS_OTHER are also
> not available. Accessing these non-existent registers during driver
> initialization triggers a CML error and asserts ALERT. Handled by
> blocking these functions during read/write.
> 
> Fixes: 7a001dbab4ad ("hwmon: (pmbus/max34440) Add support for MAX34451.")
> Fixes: 629cf8f6c23a ("hwmon: (pmbus/max34440) Add support for ADPM12160")
> Fixes: 2e0b52f1ae88 ("hwmon: (pmbus/max34440): add support adpm12200")
> Fixes: 479bfeba2eb6 ("hwmon: (pmbus/max34440): add support adpm12250")
> Tested-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

That is implied. Please only use Tested-by: tags if someone else tested
the patch.

> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Applied.

Thanks,
Guenter
