Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F8116B396
	for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2024 12:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724071126; cv=none; b=Dbt1w/PKanu5xTTHFQ/hZjB2YJEcZV4Y+gSyk5nkummfh8mL+R7tNUs202/zlhqdzZMRAPUcvY8Xq7uPx96DRZrCN+SutbJupGkW8MencA6hkDpgiqfa7PyhELMotEmHjzRWmjXrzGJTw0wKBwG1YKd7h8IF9koCUyXd298Ko9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724071126; c=relaxed/simple;
	bh=vMn7bOnvoOHNpw5Huz8R9HFC86Zb4QOtPXMeOq4M2EY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e7UxQtPvxuCk/ZDoezKexz3e5IqmjC+UFmXAf76a25DMPTAK3w5t5l6B3Yi7Bnd8RStlVZpqSQ2fsDqllfgh2F5lFNO8MClYKcWkVlb20GrqVdJPrJyihLPMvgTutpESaXP00BuIgnjUP8AgMo3DQQh7nwah0vU5k4vUpkHTtv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ppwKtcjJ; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ppwKtcjJ"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-492a3fe7e72so1575727137.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2024 05:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1724071122; x=1724675922; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vMn7bOnvoOHNpw5Huz8R9HFC86Zb4QOtPXMeOq4M2EY=;
        b=ppwKtcjJH/4b9ZzHJQQ8DesbDC/BIx+NcvdaJ2UW42msbvvvRQWotmAz+bZER45EZC
         yV3oMQkOa4lMPQxcUJn0GQZfTzQJ4ie/1ffxwDxM8VRAmi2gylNz9OjnXmfhuYnRG7iQ
         Q68eL4rFbP8t1BKOz8DvZgoSOTp8lbwn6dc4z0JC3vMglXpW710mdxjXOnqnHcYyic3I
         ExB1Q/UvlT58rcvuxF0SylCke4lOuOEw0jRcIngMQat2eeVB+RKxsoRVyQWIYLC8k7a5
         lsqu1i90rP0bG4W90MzcJGmyOiK5+kZP9AKglKNzBi//GE6nKanN6GpV+SRvD0pQHvlf
         jjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724071122; x=1724675922;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vMn7bOnvoOHNpw5Huz8R9HFC86Zb4QOtPXMeOq4M2EY=;
        b=rXFsom0aphV4Bc+DzhDT4xLm+dDMp+fEdVITXxy1nKdbppPcHjosJ2X/pJapEFC0dI
         RdtXw3sb2DihAYviQte4CBoEwOuUr3JA2AE2jQ/LuF3ApOiwXGDLzlAktfh8cLZszOJ5
         qaY6PQzWWI+j5ryVlr3z/WrvGimNUVikkDdydips5UXaM85HvWPhWj08k/o+U/L5bURN
         m32A5kBp1qMu8zcUSyDWtJG0QpYqGsxcXthUvuByNbMzpLnwr8xKVIANH7sYa5eWODN/
         nm2HGIl7mt46Qba8p22k3OtDqkdeN/aE0GEqHcUgBp75r4sa2z7WV1rk0zuHP/DTv2Xh
         yIEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9IXOcEfRJhtG3oOj3Zbc6WI92ADOko3Elfw2pBa2R2XOdvDV2QCFi19mBrT+CvSd3ogBONInDN5q1+R5Hx2/K9GYgAKzoST24
X-Gm-Message-State: AOJu0YwfAe3b7Ox5W1Qy0pERpn7i6v2mSGW5iRHb0hGBO/NzL5zE7xc/
	whGdWEcQjHwvvwCf99puaw2zuuobt5lOZFf2/rd68Ny7ONPmuQEhbB/9wkC5Kok=
X-Google-Smtp-Source: AGHT+IGp6MdnP3Khhov+7iI5h+lG3ocEnkCPS56pNZDl3tn3+e/uJwlfHRCj4p5R/7sR0EnP+2ZLwA==
X-Received: by 2002:a05:6102:94c:b0:493:effa:e721 with SMTP id ada2fe7eead31-49779a0778dmr13557400137.27.1724071122291;
        Mon, 19 Aug 2024 05:38:42 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4ff02f7a2sm427301885a.14.2024.08.19.05.38.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 05:38:41 -0700 (PDT)
Message-ID: <2fcae752-39ac-4332-9365-f25599a991b1@baylibre.com>
Date: Mon, 19 Aug 2024 08:38:40 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] iio: adc: ad7625: add driver
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 David Lechner <dlechner@baylibre.com>,
 Uwe Kleine-Konig <u.kleine-koenig@baylibre.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20240809-ad7625_r1-v2-0-f85e7ac83150@baylibre.com>
 <20240809-ad7625_r1-v2-2-f85e7ac83150@baylibre.com>
 <20240817124752.3a6c1b49@jic23-huawei>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20240817124752.3a6c1b49@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2024-08-17 7:47 a.m., Jonathan Cameron wrote:
> On Fri, 09 Aug 2024 14:41:09 -0400
> Trevor Gamblin <tgamblin@baylibre.com> wrote:
>
>> Add a driver for the AD762x and AD796x family of ADCs. These are
>> pin-compatible devices using an LVDS interface for data transfer,
>> capable of sampling at rates of 6 (AD7625), 10 (AD7626), and 5
>> (AD7960/AD7961) MSPS, respectively. They also feature multiple voltage
>> reference options based on the configuration of the EN1/EN0 pins, which
>> can be set in the devicetree.
>>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> Hi Trevor
>
> LGTM, so I'll pick up v3 once you've made that weak to the DT binding
> and it's been reviewed (assuming no one else has feedback).

Awesome, thanks for the review. I'll get a v3 submitted soon.

- Trevor

>
> Thanks,
>
> Jonathan
>
