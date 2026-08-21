Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8E735E1B9
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 16:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328228; cv=none; b=KXKf3McpP6zV+p8oZ1tqzrZJFT00YIO7QnquO+5KtRPdIOD9ozvZnZa5lRUuBlhvAyyIq/OcOl2RdDEuSD60UyW6dR3kCoUWZJlhI4EXxKG6h9EgEkH/wu2CpwX/Dwj0Cq9TwLnn8oS1JqwSjSCZNFd0vbG4kDVCxi71ZzIdatA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328228; c=relaxed/simple;
	bh=Vy2ZJZNGMyLbLm8dFlgEUCw1Cwow/lz5sQ+qvQJvgcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MMfUShT91mM0tVsTLXoEqTrr8V+n20XouTGpSvXH+AFxG/lhVbXE776qwcNcZIhQQW3HMY9I0tE5iSNBTJWSMCPD4zoxTYwRxd6Hxl7Mp8ViVmfPHYfNuEZgnxntQcwevNn3RVrY1/tDBQGAcqn5VF+MHBu8fGSiQHD8iC5NkIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=OJ7OmMj+; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="OJ7OmMj+"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8200ca16f26so17299687b3.3
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 09:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787328226; x=1787933026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ckvBWrFSwcLwwa+ubcnnacuUkv4EVV++6zpuDA54lvA=;
        b=OJ7OmMj+EAbSu0oTl47nKYBVpapK9/AWe/U1/QD84QD2sWRiKCL+hm6dBPrdGSg7bX
         H+6W/i3bQuq9/om83syVlmGVDRiPTw1yX3SB4p65mPtayK1CILJ/KwRy0PTiItDoxgR1
         F7rr/IkXfr7sPYLC0kEgFcjWhpJL0W4eBL3Jq1fH1gsN4X/hy23BN9vBm+iBT034rEj9
         pR5iRY7ladre+ZWrvYxcv0c1QPSXVMC94A8rkmEU7tnsfKYGZiZBjHVVdsZCxXJ/mRpO
         +gPi2T4ILRU6RtFMvOV43uoESnBV/XHeGVNXcTN0rMvwdq4eiBt0x4Igj+ZZV7nMLrrl
         zwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328226; x=1787933026;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ckvBWrFSwcLwwa+ubcnnacuUkv4EVV++6zpuDA54lvA=;
        b=N4OdnXzcNGZTlr+nA9KizESR66XELHmpuaoMOBeQGCWOf0Ju/hzQ4qalwKI3+RHV7w
         qYhW17DC2ZjaM4D51jmq4oCuO+1E8HAL1XJdNSEnLyWbmk/bq6rvrZ5LqaZlil3HUGhK
         IYTsp2iDraxANzcNxKyrORxZMBhI72AhR3aCbe7B33bwaRfCmh2tFFjyir68V7IDhBsV
         V0b+VdPO20ypZylNeNdc5tX4YWMlkLx1XQVBcVjb4KsDxBtdImNMXP74kaJN7BGNF0Ga
         iD+O6LtMaSlIw7HOX0jTA87oEvez+xPXrz/2/2z9+MtIqecy0uiMXvSr/6r9Q+J9xEGt
         /S7g==
X-Forwarded-Encrypted: i=1; AHgh+Rrc46I1UfKLWwYu6HgLZXA0P42CF126VyFUUsNTQJ1smQCSGS3cJJK5aPF8MFIOe+F0opVpdTr7uQk=@vger.kernel.org
X-Gm-Message-State: AFuF++mRCy/Dy2fW8CPY1bB5DGWz6CSB7a9vrCM/CDwMf4Ug9IOOo1km
	yaq9HlfTckq/hbSOLJsM7IZb80umRKN2x+nzjkXAzQRr3U9SzWCjEa2tlB/sR3hbyGE=
X-Gm-Gg: AR+sD13ezeCUn3K1tXmbO+w7bS4Uu+L282hWSmR2/f42jv+Rymw5Hvhup9p/jRTCT+G
	MK1NYifM87QQC9t9RKgDAtX2e5Am3XLOabLMkr3gEfjqnEImr1vFvjBzTqCGJGuFbsiJ5TAZnbO
	lewYX6D4PTeZmLmEYeXP8BfGCqU7at/QUWHlIeI1HnA/Xc5XxIlSfBT1uMAPJjTsKQsWdYhOW6q
	56SyrraJ2k357BtetETAnyvTfQZ2Cwokw7JLgJjsAsETuPayPhBonFvxm2R/4Lnd0697cgRA2Ak
	j+EZFJUpCeHmPCjJgnR96IKbD1n0DaBRY1c0k4FG7Br4Y0OnhI8D6ouSxWls3DJq6/YfX2jJTjV
	c43fQrR+atm35iyJum42DtqK+zS+Ioi4pDA+oFht1wbNGaaVANhHrnIZKw2IV57yHxJ2v0lQcUu
	3jC4hLaq95wz8xCXcd31M5fs3Y0A6Wd481x8hbswKDFV7BgsQYozwu8+xsm1y1pul39QRqR1R+P
	shKqT4LRkdWGpQckcGxt/AogOud5s/Rc5Y6XagTQg==
X-Received: by 2002:a05:690c:b96:b0:806:b6ab:a410 with SMTP id 00721157ae682-849ea4fa374mr34419257b3.0.1787328225648;
        Fri, 21 Aug 2026 09:03:45 -0700 (PDT)
Received: from [192.168.1.169] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-845195560e1sm44559037b3.46.2026.08.21.09.03.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 09:03:45 -0700 (PDT)
Message-ID: <699419a2-31ab-4379-b11f-c77e9e6a750c@baylibre.com>
Date: Fri, 21 Aug 2026 11:03:43 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/14] iio: adc: adi-axi-adc: Add support for CRC
To: Janani Sunil <janani.sunil@analog.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Michael Walle <mwalle@kernel.org>
Cc: linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, jananisunil.dev@gmail.com,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20260821-ad7768-driver-v4-0-bb8fbd06d4eb@analog.com>
 <20260821-ad7768-driver-v4-4-bb8fbd06d4eb@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20260821-ad7768-driver-v4-4-bb8fbd06d4eb@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/21/26 9:06 AM, Janani Sunil wrote:
> Add support for enabling and disabling Cyclic Redundancy Check (CRC)
> processing in the AXI ADC backend. CRC provides data integrity verification
> for high-speed ADC data streams, ensuring reliable data transfer between
> the ADC frontend and backend processing systems.
> 
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>

