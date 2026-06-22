Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033553A6B8D
	for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 12:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782131983; cv=none; b=jJkx0g/nsMmP657hPFvGhwby4467fkXIRkEENcIHsk32tkMVahU59M003h6iIIMZvRNoRGO9OKFSEpLiykI1Bprjnwz5JTwJTQMSqpnMnsLIrI3UDTnjwMQRffd+332maDkYc7usVjfTwlv86k455QNjwvhX5wJb4mQbLDNDKdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782131983; c=relaxed/simple;
	bh=aTdC6XxwJCmig7rZo6QKDdxrqrz43rsMMKYh383XKk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nPI8bPCegRTmd+6QGdIL1sQqMFUqKUsGSJqFts+b9ccHm1qJ0n1rdiqg20hPe9bhHb9Jb6V3V6tSjcXYii7gAIwxr/YJeEw/xZiNNsHxdkV7vjOqBb8dk9W5xolHzujb5yakBgvA5cJxUdMtc9RBzbHJjl2YVUL/9W6Dxv3IYWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rdq1ld9G; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rdq1ld9G"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-37d700363fdso635464a91.2
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 05:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782131981; x=1782736781; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MvpH79wYXLCKH+SAxAFSpANy3DyUm5vrrOm1VqMVj6s=;
        b=Rdq1ld9GUSShzNGwPpg20JtPkTmfeNb0AdQCYdNTOegeuO7OhTISQlijCjhAw8g1w+
         70A3efGRUHXYYgRk6oRUEH9wnk1HvhPyzMR8oFiuqm4NKhNWcZm9GfB300nQJmKhwcpZ
         pBHO5IIgpmGxm4JwbBrSs/RiZPpH4uLGRq0tiYnC0/vIBbjYfwo0vhIzBljshG3lYY+x
         Ri5l3bk1f/JHRFNbbZIetKrA0l4vNjl6HZPWA5tY5APVkmhSvCJsEFlSNvxpKlXQcF2h
         DYbf8PF7pH8XQwBvQ4ohuG3SHzkFTmBfMwJpajhsduv4bh63X7IPQ3ip9QtoTEYYX27O
         MmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782131981; x=1782736781;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MvpH79wYXLCKH+SAxAFSpANy3DyUm5vrrOm1VqMVj6s=;
        b=NP4IkqyAR8LnbF4GG/FUrJ4wZadCqn3wJwnP3LYs7TCY4EUfWPeIb/X/Vqbo48oGI0
         hTcVHRjo93d3MIKhMMEyAg9mW2XL7f6uJ3QuEBGHGFlz2T2X0I/BEneHlCNrsk6V3OYd
         uXMKJ/Wa0DEg/iHea1kMvEDgu57OgYMOnF7/MEJn9gz0SvMlu0EomGSoMAIPy3miIAvm
         wUQoiA+2c07XrvCtiQUEWg3xuIMEJMWuKqQ2nc+SJiGWe4Usq4gYsNaqP1MWqFzr8+8h
         MZjzG/z8OklTj2G1zc2qa/rZwu0/yyn1raonv49mnildBoJpYvPEoJlO+jlVvRLBJKJi
         bMew==
X-Forwarded-Encrypted: i=1; AHgh+Rq4EzLK8y6/FL8T4wXW5Hs6nJHnwkLpurBOiU7eZZFbfwUKRh+B7HE3zZ8Ezbs/lFAAeHAfqyLXmiU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPDHdkm5B3XYtSC2kgRNzT6qcnKRgTFGwLHl7a/YshmJrZ5A5m
	1rSeIdlbs/IQ74GACBAOLBuwScOLrgpTlW3JpvH9PllYydjTfv467GdS
X-Gm-Gg: AfdE7cn5I7Ui8NBe2+U994Toa3HfEW6lJzbC4xuQ8nrljaXKCPsYvYzTr45yFb6ePsm
	pdfbb+869Wyi4/VOXHDNec2m04364BRulQ1lUWA8GfYur0JWFenLO6fg3WFCgN8JhSwUS9XZB+R
	E/VHaJrPAR+H2R2M3mUBlibg0xhgttyIE39yq0voRRRgEk71qyzac5cTvQHduwFLk8qfc+FPhcF
	fSrSWJ9NP3O24wgbjzGBF9bq2zdVIoaKf9Q6LdfgjeLgNgo81wc91MH5bw7NhtGlbhNZltYSK1k
	RtQi9ele+s7kPvOB7GpQNrPB7KyO9OkQ+l+ccemiywAJ+VyPJnzPJnDcFxtQ+7irNv/ECu1jjKu
	nJwvBK1vPCsRJeSHBkL3liPXC2iONGIkcSZeevXwbYFeKXFksM85Ry+icDNZZHBvWirgQ63W33y
	ScXDrZggqEVXEW8jOHNdTatuzWVmDSnnqTpPg/Abuu6EsvRMSJm+25/g==
X-Received: by 2002:a17:903:230c:b0:2c2:245a:336c with SMTP id d9443c01a7336-2c718f63a4dmr149446005ad.14.1782131981162;
        Mon, 22 Jun 2026 05:39:41 -0700 (PDT)
Received: from ?IPV6:2a02:3038:288:e57:59d:91ae:1c45:fb41? ([2a02:3038:288:e57:59d:91ae:1c45:fb41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436d6c16sm80701995ad.23.2026.06.22.05.39.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 05:39:40 -0700 (PDT)
Message-ID: <013aba24-c30c-44a8-8511-96278edb3f4a@gmail.com>
Date: Mon, 22 Jun 2026 14:39:21 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: dac: Add AD5529R
To: Conor Dooley <conor@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Rodrigo Alencar <455.rodrigo.alencar@gmail.com>,
 Janani Sunil <janani.sunil@analog.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
References: <20260619-bunch-diocese-dd7805cc17ff@spud> <ajU73_TkKrSbqD4f@nsa>
 <20260619-concierge-doozy-9c161533c369@spud> <ajVlD-j0nIGrRVow@nsa>
 <20260621153330.79b6600c@jic23-huawei>
 <20260621-nutmeg-coauthor-715189372230@spud> <ajj6nEb4tATM3C7b@nsa>
 <20260622102722.5900592f@jic23-huawei> <ajkILRPq_g24g4dH@nsa>
 <caa54d52-72db-4c58-ae3f-1d1343bd7845@gmail.com>
 <20260622-overbid-yonder-3fdfee9eda7a@spud>
Content-Language: en-US
From: Janani Sunil <jan.sun97@gmail.com>
In-Reply-To: <20260622-overbid-yonder-3fdfee9eda7a@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/22/26 14:14, Conor Dooley wrote:
> On Mon, Jun 22, 2026 at 01:54:25PM +0200, Janani Sunil wrote:
>>>>>> Why do you think the microchip devices won't work? Does the spi core
>>>>>> reject multiple devices with the same chip select being registered or
>>>>>> something like that?
>>>>> Not sure how things work atm. But I'm fairly sure it used to be like
>>>>> that. SPI would reject devices on the same controller and CS. Now that
>>>>> we support more than one CS per controller, not sure how things work.
>>>> We always supported more than one per CS per controller. I guess you mean
>>>> per device.
>>> Obviously :)
>>>>> Janani, maybe you can give it a try?
>>>> I think we'd need to get it to work with shared gpio proxy which maybe
>>>> will just get set up under the hood.  This used to be opt in, but seems
>>>> that changed fairly recently so maybe some of us are working with out
>>>> of date knowledge!  I haven't played with it yet, so might not be
>>>> that simple.
>>>>
>>> What I meant for Janani was basically testing two devices on the same CS
>>> as in my pseudo DT. For the GPIO, you mean having a way to select
>>> between devices on the same CS?
>>>
>>> For these devices the pin id numbers get's setted up as part of the spi message
>>> so my assumption is that all of them will receive the message but only one acks it.
>>>
>>> - Nuno Sá
>> Hi Everyone,
>>
>> I tested the case where there are two devices on the same CS. The SPI core does reject it at spi_dev_check_cs():
>> https://github.com/torvalds/linux/blob/master/drivers/spi/spi.c#L631
>
> Can you try again, but delete that check and allow the code to continue?
> Worth knowing if the problem is policy (which makes sense for 99.99% of
> devices that cannot share a chip select) or actually not supported by
> the spi core code.

Hi Conor,

The CS conflict check is only a part of the problem. Even after removing it, the second device fails at the sysfs layer.
The device naming in spi_dev_set_name() produces spi{bus}.{cs}. Both devices register as spi0.0 here, making it a duplicate directory.

- Janani Sunil

