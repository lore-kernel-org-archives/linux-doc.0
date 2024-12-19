Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817EB6FC5
	for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 00:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734568611; cv=none; b=VsFsWonFKIn+E7uSwKADhZmxw2Cmdgeo6OcLWblHIT4YqczoLDemar58vgg2+vuv4MuppGVeORYhSlHCSeUu3zmSMxW/qHvIQ5qrX0p7IYvtst6IX5DJyhMUlG9qlW1TlZihh41nrbEXrPWPDAL7RkkmT6WEYKm+Ehvj7RnQVus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734568611; c=relaxed/simple;
	bh=+SaeB0VCw+i7foCEgr6B5tYSBWITRsDz23gNP6NFVdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U6OQjjn9kBsLYfN1Hsh70JpQZb6WEEInK1RWwJIX6VSm8pa2O06vdXl9+e/E9/wkTETA5k24P+dQHL3yENt5MtIf6ULq+aKPHYxuG3HGuHMMcmevAPZIB8S1YeFWoW2bQ23lvzTC7iVpKkWIDmjXskJ7HQHHYY/kL0T1dt0XRxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=ARQdvUuu; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ARQdvUuu"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-844cd85f5ebso20645339f.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 16:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1734568607; x=1735173407; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cb8i+/RcecBf8L1BHUB812gTo+/Q1lLoDgdoPwfFPzM=;
        b=ARQdvUuuuNMZ1mnpffyLFKwFFV8P8HM7iBq4VgQcTS68dWVRRAe1NOa1yzAv+rNJCK
         uyF0GE1vQsn+3QCJfxh2gvhDZLz3QMUj99YUyfHuDtYs969LsNWWO/CSkhcJ6yIBRt5P
         2jqXLD1uWXyzOkfT3O3X2/dGJD5fwEk8L5M1LqnQ1D3zXlQZnzjo+cPp3iSM/w3ms45b
         famEk76o+6h5VQF31G3mFkeiPZgQY0RKYIQbuhq2DGO0E+A836cjoqI2wXdqi5T0jYoa
         zAKKT5MtJn+aO/MgWvyKCotoIM7YDx9c8lw56A6Xv+prrxm92wUGYV7uA/A9kOaNlkNs
         6c5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734568607; x=1735173407;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cb8i+/RcecBf8L1BHUB812gTo+/Q1lLoDgdoPwfFPzM=;
        b=X3nsCR1wmgZH+eldwHezEZw9fp9RQZfgatsjfECzmcylS+5fH7v0oI+i3CR7Y5w41x
         /jX0VEqX8W1vo3NsOZHoeNLV/0seT0MqvYFl4O/dq8a+GdVfq7jFu9bneNZpExGuhBCC
         uOtzsJuJLE39hRJ31qiAUulE/meNM8SvysZDrAwoyzNbx2P02lc5LoYvmvA3iM99tfm4
         hIyaip2ylCscgb+B55qfSWVXytJH51AUwAQwuikXr+vjGLI3Eb9vWzOUm8qa10OPvrHA
         8bM88luyz6kmGh5PintjRFqwQYcIjMvOd7cl3R3ntW1wCK73wiJW/YcIByL+BDZgyccz
         jHCw==
X-Gm-Message-State: AOJu0YwxstyUUFyf0fBpSGA1ECpJw05hcy3w8gmqDY15z09lJyafYqee
	DtTSjOcugdXUhH2//tRL8hHyBeDhWQTobzIbPMT0WSKBUv8T7zpZBvXNa6IUYpt3rAq0bhW7bnW
	v
X-Gm-Gg: ASbGnctu0UzvmMnxKU48vDTVfOU+lRgTNwPpQZq2T31kh8eNbAQDLJ4/FF725YWW3WA
	g3sJ+qUQtePRZ39Fleag4WBPAqZjfwS40omGbDL/XMhPV9cmQ7qUUYhsLI00j9a5M11UlMIeYRt
	4hcdntv7sLMYTt+JlR0yDpr4LDu6dAJjAV46BYkh92DCJo/3i+PnHphmRHEYksbjv5Pwk/50Qvm
	WL/f9zTzLWWMoMBp0tT8vZ0mNOraTvK+1NyL2sgowPSxUgOqEW444EQO+PaWQGPHYD3VPUD5Uo/
	pHI5uQ==
X-Google-Smtp-Source: AGHT+IGjJyKsYjWbWITE1klbpwS9jGoMikkrLPCOKb2Dw/oFK7RIUcGdG08meGSlH2+zD9XaD1HuDQ==
X-Received: by 2002:a05:6e02:218e:b0:3a6:b783:3c06 with SMTP id e9e14a558f8ab-3bdc437ae8fmr49474725ab.19.1734568607604;
        Wed, 18 Dec 2024 16:36:47 -0800 (PST)
Received: from [100.64.0.1] ([165.188.116.15])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e68c2220cdsm16169173.148.2024.12.18.16.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 16:36:47 -0800 (PST)
Message-ID: <76505ca3-b5a7-4cb1-90ce-0c7951c0b3b6@sifive.com>
Date: Wed, 18 Dec 2024 18:36:44 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: riscv: add bfloat16 ISA extension
 description
To: Jessica Clarke <jrtc27@jrtc27.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Chen Wang <unicorn_wang@outlook.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <cleger@rivosinc.com>, Evan Green <evan@rivosinc.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>, Jesse Taube <jesse@rivosinc.com>,
 Andy Chiu <andybnac@gmail.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
References: <20241206055829.1059293-1-inochiama@gmail.com>
 <20241206055829.1059293-2-inochiama@gmail.com>
 <5e878b5b-b49d-4757-8f7e-4b323a4998b3@sifive.com>
 <F52E8856-7602-4E4B-8932-2B13AAA30822@jrtc27.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <F52E8856-7602-4E4B-8932-2B13AAA30822@jrtc27.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2024-12-16 4:51 PM, Jessica Clarke wrote:
> On 16 Dec 2024, at 22:00, Samuel Holland <samuel.holland@sifive.com> wrote:
>>
>> On 2024-12-05 11:58 PM, Inochi Amaoto wrote:
>>> Add description for the BFloat16 precision Floating-Point ISA extension,
>>> (Zfbfmin, Zvfbfmin, Zvfbfwma). which was ratified in commit 4dc23d62
>>> ("Added Chapter title to BF16") of the riscv-isa-manual.
>>>
>>> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
>>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>> .../devicetree/bindings/riscv/extensions.yaml | 45 +++++++++++++++++++
>>> 1 file changed, 45 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
>>> index 9c7dd7e75e0c..0a1f1a76d129 100644
>>> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
>>> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
>>> @@ -329,6 +329,12 @@ properties:
>>>             instructions, as ratified in commit 056b6ff ("Zfa is ratified") of
>>>             riscv-isa-manual.
>>>
>>> +        - const: zfbfmin
>>> +          description:
>>> +            The standard Zfbfmin extension which provides minimal support for
>>> +            16-bit half-precision brain floating-point instructions, as ratified
>>
>> I think you mean "binary" here and in the entries below, not "brain”.
> 
> No, that’s Zfhmin / FP16 / binary16, not Zfbfmin / BF16 / BFloat16? The
> B is for Brain as it came out of Google Brain.
> 
> https://en.wikipedia.org/wiki/Bfloat16_floating-point_format

Ah, yes, I was the confused one here. Sorry for the noise.

