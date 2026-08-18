Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDFC417BC3
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 08:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787041652; cv=none; b=IGHSQqKGnA2lMGrzULlXeXxDnPxxGLWr8PozGYwO93Cc7z1gz2Niy4AXBYgCd+US5GD38BSou+tmU3Fn5kfxbE0+fkkjd5aLdsizxs5m9wCvAPM6UahxwdePQmSW0bVoL4KVhIGtpNhGHJL84ZoD1E/jfHyp6yicUmE92E17XF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787041652; c=relaxed/simple;
	bh=JDzjZcLP71KCvagkMKD84MYXhOgKomjguCW9GMyB0bI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pw7XyV1cluhPVDCbJL5JDbXb8uFiDQLvJXoWkuh6VHpG1tMq93yFCik5a0MQjAB2fV4hANi4Iqwx/d7lcEPgYg1VPcyBTZ3Blj114OCxVfCoY6EfixL7BlcUlwHx6vydpWulPdP4iU7N70V8DIEh6ogHwJQJafkQ7o2YqnjILJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rjz7IUyF; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rjz7IUyF"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so4363924f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 01:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787041649; x=1787646449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uuK5mDxMiFBjBjKQm/Fiu5kzFGUEM5srIwSUyEqNmyc=;
        b=rjz7IUyFe10YkUwvNbaJibLuM/n/edgAhlGlK7mAklD2GLJyMyksM0Rl8ZatP4sJCM
         fbOXoj1hyejD7L+u9KX9607IO5foOZ4+1/rGIuv9pDmNG7dL0XvYBgBFsq1AGJ3DE+VA
         e3i+Cc3EybrdP4wcrbb1ck1h998kyNxCyPtUn97XIhXiDDUM3CuoI7wCennaDu2IveTU
         KBbf5025J+uU8aRH8EiWLlJB1mMdODlwwVxcGA0lLChDGdxhblYbfOYBKJ1Xhg2iLS8Y
         6cw+kfgSRKMumnbm6BkxOJG+YtSKJzE9IuXwABB6syRr9cPIPsozu/9ii3aphEa7QRtu
         17aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787041649; x=1787646449;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uuK5mDxMiFBjBjKQm/Fiu5kzFGUEM5srIwSUyEqNmyc=;
        b=YZsqq9jKqv4qA2eEKk64VY9gxcif13Rwo/uoRpdQxnUTPBy8Duw6+p2oV2UFqdYGwl
         TBrT4Vqht5EftZhC2LXwxEg0MP0T/XAxZz93/1lZNW1OsTvGpfecaJiU8qRieO4Cl53w
         lfwciLNla7Xf/HiYBX7rzq9mgGLxFy4pi8sfONw4ufganVJSBSV92aYa4/hXDTBwvKrP
         q+r8C219ehrATVYPZhqKz0VmtC2sz4WE2CCVQCZqs5sP7czQmVhQXTUbcC3PC9/eLOUf
         mzqk3LzZQY1yQ9CKlyL7iaZ7AjT2HxcUdDEaswPDk8KHLPNK7A4krB5yTh3DimJFBjJ1
         p0Ow==
X-Forwarded-Encrypted: i=1; AHgh+RoOxt4n6X49efRhOfv6B8ZQbdwmv7YDDwECcOyUdRukvPS8tNfM77wCNsW5p4Tn29pvdjs6kYb+3rc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk8UyTbuHOcUkWKJ1KBOlwbLTlQwAlz8I5iU6x08c6rqfMX/8r
	DWfEY8NgouNHM8ZxD19n39LYySLowkh6OL9q9GNG9EPPIiH7dN88CM3O
X-Gm-Gg: AR+sD11LSj308+4MP06hMLrryyHn3dAHbRRGOQfjrjsGURvECSjGH6t/FTp08SYsFjJ
	EjnkYAltYgoGenqMUqh5knU/fkqroijNaXWQ6n7h3d4Y2c7JzeVZUa/h+nwvufkpCk4LB6IA7vX
	8TNOpI9t444usiKKagN3fIQPXKbXQtCLoaJt2J/7+LILA7ijO5MIQnArdbcKQg4i/WyI5+OPnyz
	bTO+txKb9AtecYWSexq/e4LYeQn6genNIiEg9MzpsudZIPgh6C1dPeTLFe6S8GA8cJdUk1UvIBK
	GqIwJYSN88ZV1vMswlGBKMv4mSeL79pP21B/YaTsQCQuwMg+sRwT0KQFuWmwRPaItwLgbiGfQ8N
	YldziPRbFO84d/84jwvDGmIvINzW6Qw91eBJJKeaLr/Jb0fF5NaVZEusQmS1vWkVYZak+H3SLy9
	uBCu6ZeN8OTY6Xc8heEpG4IsR7Yium+gkLj7l+eguqkdotY144B0LXGndY4gt+ODxRIR2cuylq0
	bX1zhrJZ7QhkWn8LpjbbcodI4Z5wFQemDGKCC2tSHfEFxpYL2Gzo61kfiXkWtnUaUc=
X-Received: by 2002:a5d:5e85:0:b0:47f:91eb:342 with SMTP id ffacd0b85a97d-4816071addfmr48543973f8f.13.1787041648823;
        Tue, 18 Aug 2026 01:27:28 -0700 (PDT)
Received: from [172.24.138.145] (ipservice-092-208-247-184.092.208.pools.vodafone-ip.de. [92.208.247.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a3b51asm10172929f8f.11.2026.08.18.01.27.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 01:27:28 -0700 (PDT)
Message-ID: <6f2b715e-f62b-4b6e-9605-23d6978b6cbb@gmail.com>
Date: Tue, 18 Aug 2026 10:27:26 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] dt-bindings: iio: adc: Add AD7768
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
 linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>
References: <20260813-ad7768-driver-v3-0-cb554399ad26@analog.com>
 <20260813-ad7768-driver-v3-1-cb554399ad26@analog.com>
 <20260816192409.145df670@jic23-huawei>
Content-Language: en-US
From: Janani Sunil <jananisunil.dev@gmail.com>
In-Reply-To: <20260816192409.145df670@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/16/26 20:24, Jonathan Cameron wrote:
> On Thu, 13 Aug 2026 15:56:54 +0200
> Janani Sunil <janani.sunil@analog.com> wrote:
>
>> Devicetree Bindings for AD7768-4 (4 channel) and AD7768 (8 channel)
>> simultaneous sampling ADCs.
>>
>> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
>> ---
>>   .../devicetree/bindings/iio/adc/adi,ad7768.yaml    | 338 +++++++++++++++++++++
>>   MAINTAINERS                                        |   7 +
>>   2 files changed, 345 insertions(+)
>>
...
>> +  adi,data-lines-number:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [1, 2, 4, 8]
>> +    description:
>> +      Number of DOUTx lines used for the high-speed data output interface
>> +      (distinct from the SPI control interface). AD7768 supports 1, 2, or 8
>> +      lines; AD7768-4 supports 1 or 4 lines. Defaults to the maximum number
>> +      of lines for the selected variant if omitted.
> The default statement is a bit hidden and I'm not sure useful as it's not
> an obvious default.  Maybe drop that and make this a required property?

This property was required in v1. It was changed to optional in v2 following a suggestion to use the highest number of data lines as the default.

