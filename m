Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7604499A4
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 23:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783640381; cv=none; b=qO6SOBfpf2EvEkP3yZEOqvJHd8lj5Lc9es/3CTwBMWozDxzAoUK5hFTbJFITvNit7isrW7hquxkfN17oCsl6CwPK4YPcDrD9ki0UKGBw6HVa5rEfsxFw42nIDSH1PZF6aKSi/x7QnaJbqV6zOfMLvtaRrahoNAriV7PDCTPZ/JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783640381; c=relaxed/simple;
	bh=BBS43bYqANX3sdc4izW1nmPremUY1KXU3+Wx3uJXVMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uoOkMdCb7jKTDOT1bbRaepleo4yhAB6zG52944Tnn9wEzHsM1n+jpqBdR2jstgp0R4SU6SnF7WUEJMh7C3AI+CupIrRxb8QJxQKld27Em0rc2KigNogb/WDLLQtZiAnLrcy3OBg9jXzybsK/RNCXahJ5kMZGC930aXvcU6UsmnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ceB0s+cb; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ceB0s+cb"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cacd69a9c0so2708415ad.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 16:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783640379; x=1784245179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dr11GjuErsqvv88bA0ajz6+C0H5haFeLgvXd4cjf/pI=;
        b=ceB0s+cbx49YeRAEBEYTbwL/36IjxOq5sbJJ8yt7nxkHl2tQ2pXLlvp7lg3z3ROz3i
         +mpU3GXv8B7d4yksnbt3//hzYyutInoHvBBvh/KUXSqNWChfrTaoFpaL4gCosPAPij3w
         DsXdw8kqy0pzSEOJ2xL7kOb+Wua3mit0CiHATUcCd5v/WjZAgooMOOhpUdiEHQszrtKX
         Dw/jHcfJurBrE5R1vzJjpFASP3dN/1jBwdMRJnPQYzSBcawCinP+i/BQV621bmjajn5i
         9hDBoepToEihy0lqQpjEv/9XcSSkMdHqJsz43fIRGeoM2lVFgPPG6MZ/Yrs4QQfHFLmD
         jlDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783640379; x=1784245179;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dr11GjuErsqvv88bA0ajz6+C0H5haFeLgvXd4cjf/pI=;
        b=YQ2zI13YBqEz/cXY5YzQqGkiQr3B/8QxeKnT0RJMtMd+QbUjc7tSgcaFqdRqsuFjrM
         0/Vce6xv2fjUHhHTcKu9kD68TbG1a+sVXqXbjxnWOs2eWNfRwxyHvHolc+FEeVwlhpZK
         kWqerRnooTeWPsjvpq/89E1pvSm8vNlZg8KiYJWzPzQpM6Txol8sBuZwwFmKu62/hVpb
         Y2eFPG7MOZbiAK09kJ1ExdvQj02z9633wpflN8uNjY2E7kz2EOONNawoIfjmDxMHzyTs
         jH/ru2FhfzI1HaYxmMfvA/BuWj9zAlpVRvIpqED5Fl6VvFoubd3Lo1ZjB2eMrrDpMJxH
         sgWg==
X-Forwarded-Encrypted: i=1; AHgh+Rpxvuai58bypSPTw2K0Me6/TWB8YP2fBRltoQQ0xOiMOzaoomnzgkF8A47WXersnW36gLY4jvlQN00=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9AcuQJvP8MnLkumLHdiqUXVl0FZtngn6lwGp0orxjILxoeCf9
	vWEfZZZ8OVlCSzB5J4HkTIxZebNgL06lol+6/GDgs0f8ZUNRDBn75Fo+
X-Gm-Gg: AfdE7cm4abRatnoaxyv0njw86UWLs2G3GmKSGgXkwXYx0ga8UQscDGvbec5vYfBGK3t
	W6RZw9sXLMJi1qaRCEDH+sdwusdmhQS06R6pGdDCCV/O3BwiV8x0Ic8FHCwQ4/skKIGiB/xR2eq
	vE1rvQsSQVoHFZO4BPJB1iSt8ld6erGxoX1kvQVFfn2sI2McvQ8dzkqnDJcJy+nfL7Fv9EnB1Nr
	SCK3HfAkTWvpJErQqqwxfQpa2S/9exOA25MOtora+aOhClDMAjZ7yHUmcbJY9Z/FFyLWjYfCcDR
	FDSnsl/9Q+RA6GPqn1XlW6uUA9aLlyqE3lhMm2h5cepjlJFFkv/GD8NCgmjQOUIKT0HFgdn46Sd
	El+To5Sv4HU19xemra2MF3Av6izsFdqAIiRE4ITdHgL+vap5IyMx3boXd6B+eT78tIU6sPAzDU7
	Y/5qoJUeCOo2Vn1zvqs/v1zAdQPgCuYADnW8hX1vEH3k82o7JGIB2p6AGbji6Qmg==
X-Received: by 2002:a17:902:e945:b0:2c8:f34c:82c0 with SMTP id d9443c01a7336-2ccea348a91mr92933375ad.2.1783640379482;
        Thu, 09 Jul 2026 16:39:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf92bfsm51002325ad.28.2026.07.09.16.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 16:39:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <94010bec-7921-4fac-ba48-755e51c59bcb@roeck-us.net>
Date: Thu, 9 Jul 2026 16:39:36 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (pmbus) Add driver for Analog Devices MAX20912
 and MAX20916
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>
Cc: Fred Chen <fredchen.openbmc@gmail.com>,
 "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Wensheng Wang <wenswang@yeah.net>, Frank Li <Frank.Li@nxp.com>,
 Brian Chiang <chiang.brian@inventec.com>, Cosmo Chou <chou.cosmo@gmail.com>,
 Dixit Parmar <dixitparmar19@gmail.com>, Eddie James <eajames@linux.ibm.com>,
 Antoni Pokusinski <apokusinski01@gmail.com>,
 Thorsten Blum <thorsten.blum@linux.dev>,
 Ashish Yadav <ashish.yadav@infineon.com>, Syed Arif <arif.syed@hpe.com>,
 ChiShih Tsai <tomtsai764@gmail.com>,
 Abdurrahman Hussain <abdurrahman@nexthop.ai>,
 "Paller, Kim Seer" <KimSeer.Paller@analog.com>,
 Colin Huang <u8813345@gmail.com>, Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <20260707122701.751878-3-fredchen.openbmc@gmail.com>
 <f9e32dd1-7c2c-4055-83fa-94683777e30b@roeck-us.net> <ak4QO9uhKOt68dl1@nsa>
 <20260708-true-carp-of-champagne-a0dcca@quoll> <ak41BRQBNdsQrYww@nsa>
 <b2a5e99c-6d4d-454e-8ecd-8638e4dc0ddb@roeck-us.net>
 <PH0PR03MB63512A19C32B7722D17D0FD4F1FE2@PH0PR03MB6351.namprd03.prod.outlook.com>
 <CABOy65_GqKiZLM+soZUK_34T8MYZS3dRX38-CMf_Bd1EmG0jhA@mail.gmail.com>
 <ak9gFKkfEgkU_q1G@nsa> <5b865eed-ae58-47fc-8d80-e14a76a93050@roeck-us.net>
 <ak_G4_eAUYflt9M3@nsa>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <ak_G4_eAUYflt9M3@nsa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/9/26 09:09, Nuno Sá wrote:
> On Thu, Jul 09, 2026 at 08:54:09AM -0700, Guenter Roeck wrote:
>> On Thu, Jul 09, 2026 at 09:54:22AM +0100, Nuno Sá wrote:
>>>>
>>>> Based on the MAX20912/16 specs on my hand, these chips do not support
>>>> PMBUS_PHASE (0x04). Furthermore, the spec only indicates support for VID mode
>>>> and does not provide m/b/r. Therefore, some of the features you mentioned might
>>>> be specific to the MAX20826 series.
>>>
>>> I see, phases are not supported using standard PMBUS.
>>>
>>
>> As mentioned in my other e-mail, it can still be supported by the driver.
>> That is what the chip drivers are for, after all.
>>
>>>>
>>>> Regarding enabling VOUT via GPIO, our platform handles this via the CPLD as
>>>> part of the hardware power sequencing. Managing this pin through the driver is
>>>> not a requirement for our system.
>>>
>>> But we cannot assume all systems will behave like the above. But now i
>>> do wonder about controlling the GPIOs in the driver. In your system you
>>> clearly did not need to do it. In mine (testing with a rpi) I had to
>>> use a GPIO (well I could have used hogs or pinctrl). But if you control the pin
>>> you do gain the ability to turn off the regulator. If you don't it's always on
>>> (which might be indeed the bulk of the real usecases for these systems).
>>>
>> Agreed. I don't really like it, but if the chip and some specific hardware
>> mandate it, it should be supported. However, that code also needs to be
>> tested - an untested implementation would be worse than no implementation.
> 
> That's how I tested it :). So from what I understand the preferred way
> is to support these pins as optional? If they are not there we just
> assume the pins are always enabled by some other means? In contrast to
> what I have today which makes these pins mandatory!
> 

I had to go back a bit in mental history .... actually, the regulator code
in the PMBus core doesn't touch the ON_OFF_CONFIG register. It uses the
OPERATION command to enable/disable outputs. The reason is that the enable
pin and ON_OFF_CONFIG typically affect the entire chip, while the OPERATION
command only affects a single channel.

So far PMBus drivers typically don't touch ON_OFF_CONFIG. The ibm-cffps
driver supports writing it, but only through a debugfs file. The tda38640
driver supports writing it, but only because it does not (or not correctly)
support the OPERATION command. ON_OFF_CONFIG (if it is modified at all)
is normally set by the firmware or even in production (if the chip supports
non-volatile configuration). It is one of the "hairy" PMBus commands
which should be left alone if at all possible.

You can not make the property mandatory since most systems will neither
support nor need it since it is handled by hardware/firmware.
In many if not almost all cases there won't even _be_ a GPIO pin that
can be set by software.

Guenter

