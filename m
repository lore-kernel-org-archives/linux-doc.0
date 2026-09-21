Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B733749EB
	for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 08:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789980409; cv=none; b=InIcFpcv6dL+UDL/yBkEIzRA7BXVGqdhKmD45OtB5fPhgH1klYJesvmw/NLHttmSMQoozR56hKoC4M6NVMwB0KT6NHPyEos4BI9ze4xcM7+OUPoPOZ1teCZ3IK9ZLHLW7RPOHg2ReIzbTJGCnDrngVZ0ocdPmoD1qwYCipqJW9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789980409; c=relaxed/simple;
	bh=KyBH7dhUVR4B0av3A00svT+cy5avMnDRCt6F/8hLFiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AIXpqNEEDLRbX6nQ/4I+jNqfPQOWWZaIg68aa+OvRQb1kX/eKYF3CwWH9RqgewkUZtusclEhZP2iFGjZrxQD5Mv+9R2TnUw7dg8BlBJwoiT92tAH6O42OFaJcQykfjOlSN+G/mzHvCBsIFsQE7WdNNttpPwb20GRHD3cQqIcZKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xde7lvO7; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xde7lvO7"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6056ac81fso4511738a12.2
        for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 01:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789980406; x=1790585206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U83Tc5sQYnzc1MW72+9l9dJyYEc+FCbzixyfv/lGGEw=;
        b=Xde7lvO7wONq4WdJWo6Y4+36q0sugLQo7GicQlDObrmem8LfZ/gVLYU/J2MK+8WLTZ
         2ivBumskyL28bEmZAOVzELbUmX0SnMH2rRtgT8ZvVnuv9C+/LaB8PBlEvN25ATL+s6HL
         HAlIUK8ZHxacglxHdq09BfHLZi3O7HtmLllOlabGi8HV2sSF0qDwi4GiTMTSvu0XQFze
         /ALoNlmiU//wJL4Ff2F2H+fKfGxyYHQdxbD+vQG/CrRcMIgsedNa7QjQAlOUH5Mh31zI
         0WxL4FtQR5Ou2ds7yFd36eo+aXzqVdxNC8gcglkdlE1OnduVKtj+79o7rx0BNls/GL2A
         XFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789980406; x=1790585206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U83Tc5sQYnzc1MW72+9l9dJyYEc+FCbzixyfv/lGGEw=;
        b=VHfd20ge1VCzBzuOVBI7Z/6AYxShNeg7eelSxkffGemxe322NomKT/bm5s0eJIEhYF
         VpDmuaxA0d9+ve4EaDF5zAkqyylxcyI0Z9U7Qul+MEN9Ko6kLfpv9T7pCoxmsp1bv14K
         y2KkuO5S3/pf3+5Wip98IiYc3/Ns1GjPKwa+c/HbtS5Yx3wS2uQ51AePBltUAm6cYJNN
         sg1+Lefu2csOq9shXYDwyRom+RARfPQFVv4co0VWNkfM6auIospKAqDXAZiKCB9rJR0x
         IyQ10XAnGldz6iNDlhxuwYHrGkhIPx6FGMBdBrrLsFf4e75RrZp7kK4nAxlaoWcCDPuQ
         CTwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzA+e+qrRwu5TSZCi1AQAWQga2JU2BYa1gbva2W4NA8Mo01gsJ6quW3SL3pM/+BPZAj3MqjeF0Y6go=@vger.kernel.org
X-Gm-Message-State: AFuF++lpeyhjZi3Ua/nI3lQ5dvu1yL1aMxyQPhMid2O62egIV1baY1Wi
	yrITYhHkkgQrb80NCEd40O5wpB7ASDT71UZG6t4J1CO0aXO/4SZcmm4K
X-Gm-Gg: AYBFou3kDYybb4zvaUSaaR9YPeBp8jle//73K/QzzaeVVRx+1NvB4BopqmYJAwuj9C+
	igQ8KDTF/Iz9xTM+hsfoN95so+RVT/mTDZUTno4ko9wStN4GiwaRY1VQlq8FCuEYXR0WF+dzQcA
	pkJ/Fcn9h9wsqxL2bx02Qi+h73V0tSU8nHPqp8Y84Kjmx27saKiMbBUPw6Jg2mxzGMoNPCUnqri
	zd2kUSPBmdZCQEq0kMkhBlXOZsP2SlCVotIQvF3ksaKpvh5FTSUOGFFhKUnzzlL4qH6L+WXyier
	mkmk0JUrMihNIEfSQqHqKDW8Wxlsky7H1G83+l+laBzbKjS4A3x/gFnWzKKXZxKF+xJxQds6ES/
	hEbZX2erAXF2Bc68b7TYfhpY+R2fecEHnoHdyaVO5YLAqu808ifomsdMt4UmLV1LUJEUsAPGlPh
	CyDeinYh0cAB3vY0Vgu0jM0f6CdQkNyXO3kp1EoGnuAZGJTrNcAa94H129OpcQnEM2HomxehnNU
	UoOYVjPaJ0=
X-Received: by 2002:a05:6402:23c7:b0:6aa:4529:4cb7 with SMTP id 4fb4d7f45d1cf-6aa53135128mr7228644a12.16.1789980405879;
        Mon, 21 Sep 2026 01:46:45 -0700 (PDT)
Received: from [172.24.138.145] ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67d821efsm3882322a12.10.2026.09.21.01.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 01:46:44 -0700 (PDT)
Message-ID: <457da50e-a633-4508-a8e9-7e000933623c@gmail.com>
Date: Mon, 21 Sep 2026 10:46:41 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/17] iio: adc: Add AD7768/AD7768-4 ADC driver support
To: Jonathan Cameron <jic23@kernel.org>,
 Janani Sunil <janani.sunil@analog.com>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Michael Walle <mwalle@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux@analog.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, Conor Dooley <conor.dooley@microchip.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260916-ad7768-driver-v8-0-27aa24db5225@analog.com>
 <20260921013732.6c5399e7@jic23-hlaptop>
Content-Language: en-US
From: Janani Sunil <jananisunil.dev@gmail.com>
In-Reply-To: <20260921013732.6c5399e7@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/21/26 02:37, Jonathan Cameron wrote:
> On Wed, 16 Sep 2026 13:13:49 +0200
> Janani Sunil <janani.sunil@analog.com> wrote:
>
>> Add support for Analog Devices AD7768 and AD7768-4, 24-bit simultaneous
>> sampling Sigma-Delta ADCs with automatic power mode selection.
>> Changes in v8:
>> - Introduce the DCLK divider helper in the core patch to avoid moving its
>>    register-programming logic later in the series.
>> - Document why register caching is not used
> Other than open question on regcache vs volatile registers
> this series looks good to me now.  So let us get that resolved
> nice and quickly.  If it turns out regcache can be used I don't mind
> just tweaking that comment for now and taking a follow up patch to
> turn regcache on when you have it ready.
>
> Jonathan

volatile_reg would handle the live GPIO and status registers. I will remove the regcache sentence from the comments, leaving just the SPI framing explanation. I'll look at enabling regcache in a separate patch.

Best Regards,
Jan

