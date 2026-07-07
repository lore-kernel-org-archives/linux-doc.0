Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5653641DEF7
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 13:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432373; cv=none; b=mCldRETO7BR1yi0beze374onYvGjJ6Du+/2fh7FDJ46l4wPxaTr9ndtIdbmQ0NSkWj4DqJJUc5wjWKIXw9l9rhvdfiqz163ZcoUXM04Q8lSqBEq4VHG/M5So/XlWvHMgSsTe+cmYrKEA1J+r/Kwhs8FgaCeT5tuRIunxEGyr6mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432373; c=relaxed/simple;
	bh=O5r0QM4vlWaAKytyGnutHHhlW8rERQ7EtUjxqbLD5ak=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dw0A/q3nJphMm6HxOYIVut3vnYbJ/2W5ZmvEZ2bMvWO9Xr3PIxA+skfIrfopHy+eN07zoeFqJu52QQlZpCg98L2sFS3KzEiOgyffBm7D1+NFFRd3QdqS6oZuT5UikwoJy2kThnCtOGzjHDpLzNRqqcnbPoOFa3YIuKNpGaSerQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ql54BAs6; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ql54BAs6"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8482074a000so1504530b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 06:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783432372; x=1784037172; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LWvYJ5/uKr5kJJ1PXNzEPmavAQjEeTr2n2C9V2vwHg=;
        b=Ql54BAs6/feHT6OMREpc7m9ADSM2RvVSg5tAWCef4iUsh6EGeA8wETwpI6tPueOO5R
         JPyf316zaWKPkq7NQgOd4zKQ5bdMT6S4ZRduRmNfyN/PTK4PPMWg704gHgb7pgxOkv9F
         1KJXSqkHMw4d/Ujf01h5B4rSpKFq+UPd9nhoEO7EJpifZJYgCQPcvJgB1VZ3czGaDa9M
         xyrvQSGAFb2Xs6A8Bq1q7qP00N5PA0WuXEhA2K9ZETrHfqz6QWRXyyZrT5TbAKMAPXYB
         NwHwMtGaqZXBVBwoqQd35YH0D/mPxQU2YEMfNNU0XiznyUCeptxJ7GU/+f2e9A0V+ZKW
         AhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783432372; x=1784037172;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6LWvYJ5/uKr5kJJ1PXNzEPmavAQjEeTr2n2C9V2vwHg=;
        b=RGfI5tjtoCcyFyT1r/otn5p3IUSaF1qxlZphm6vgpvv5CGF0aBgRigJafn5Q6Gaj1c
         6NivEsIzsqvdwno6WY/WX77heP2XCZE7aKAAGlJYIyO0RJUE5myZ7+sZvwj5mfeNhrPM
         COtFDIHzrbOpbHrG0K2J0i+rGmw+nIuwa/StUKgjiTsb6GUMf+qFx2d3/j4fPXJs+v9/
         KlR+mAZ0BDKI6HkdqZFEnoIiEW04sOERNJvnD53NfyVAbD2qqRHtyzt8D8GRXVfaG08B
         2fPheszUQqoXuk/MvcHaQHpudEPohtAlUbLq3E4Nori9RfrCqMgT6JKGdawladO0+Xhj
         akNg==
X-Forwarded-Encrypted: i=1; AHgh+RqiWUSu57uOSOQza7sCkePxsLZMiqOTB+10js8rTTYU8BfXcS+FQW7eBCX/NcB8UVWXUMPA8oDFkfk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9qzpMWcl0O5eXWuNRGz4VGN4UhEY+wZ7DmwpO9IMrLtNQyS3/
	qZCCg8/jxLHkCRKVukl9jSsleW5YLUFyuaZ4GwvhSXrJk56E6yCLhCAe
X-Gm-Gg: AfdE7ckJwlUa3Zq+ik+r3bz87nlp+Xf/HTPg5/QzNQ9UigsGZKi9TH9GQAA9NRKVUio
	5vApnk3TTfl9vP0zpgk9C809xdOYXa7gnzaM/yELjCeYbQLNbaNQLM7LtO5U53JWpy+dzcP7ZHM
	C0MRiGGMyrcXWmpKMagBRn7IudexOsHyc6SpBC7G8sPAiOQMcVr7CRegjtREzOQEjUgTx7rQyQa
	7og8dWueV1Jybi8v7LtVHHnn3tkoqk7KGZjzsJADfHCmqo8DwHQx3ALhLbzzDtC+10UNfRi0T+I
	/NRFINSsbLYE/1Np/Enx0sbM1mtZQ1guymQ+VrJH13oBRr/fUp2X9sgKbRC/po0gB80C6zjZyWQ
	XuxSLQZjUqCYbJ7h6eSVyLdcONuwUR+d5CwAHC8fzoUeQ0bzVTXn6Kb8/OofYe3U/cSD5AeWaxY
	faYrL+2FUs19TKKZsjVguNF2b/Nf3KBF40N0xEk7GQkKHNuGylp7Thhz1cbJXl4w==
X-Received: by 2002:a05:6a00:992:b0:848:2f74:1d60 with SMTP id d2e1a72fcca58-8482f742551mr2888329b3a.70.1783432371414;
        Tue, 07 Jul 2026 06:52:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af6df87fsm1069986a12.5.2026.07.07.06.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:52:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f9e32dd1-7c2c-4055-83fa-94683777e30b@roeck-us.net>
Date: Tue, 7 Jul 2026 06:52:48 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (pmbus) Add driver for Analog Devices MAX20912
 and MAX20916
To: Fred Chen <fredchen.openbmc@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Wensheng Wang <wenswang@yeah.net>, Frank Li <Frank.Li@nxp.com>,
 Brian Chiang <chiang.brian@inventec.com>, Cosmo Chou <chou.cosmo@gmail.com>,
 Dixit Parmar <dixitparmar19@gmail.com>, Eddie James <eajames@linux.ibm.com>,
 Antoni Pokusinski <apokusinski01@gmail.com>,
 Thorsten Blum <thorsten.blum@linux.dev>,
 Ashish Yadav <ashish.yadav@infineon.com>,
 Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
 Syed Arif <arif.syed@hpe.com>, ChiShih Tsai <tomtsai764@gmail.com>,
 Abdurrahman Hussain <abdurrahman@nexthop.ai>,
 Kim Seer Paller <kimseer.paller@analog.com>, Colin Huang
 <u8813345@gmail.com>, Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
 <20260707122701.751878-3-fredchen.openbmc@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260707122701.751878-3-fredchen.openbmc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/7/26 05:26, Fred Chen wrote:
> Add support for the Analog Devices MAX20912 and MAX20916 dual-output
> multiphase voltage regulators with PMBus interfaces.
> 
> Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>

Please provide evidence that those chips actually exist.
Internet search comes up blank. I'll need confirmation
from someone at Analog.

Thanks,
Guenter

