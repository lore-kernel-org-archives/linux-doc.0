Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC484393DFD
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 15:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767799138; cv=none; b=Uk/293KlhHh5yK1+6odEESFxrYbc6qFmVf3oAIiErXsqauxpZc3OB2txUrxv41pKwFAEMN/tyn2A/ySP5wkHTuv28wyoyUbtjNVX7yoiRzlc6p67cyFSPADZVk3zivyAuSeOofMxPCufemR2QfPL4AFm1f5Luvk6ySPmOweqeQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767799138; c=relaxed/simple;
	bh=tNf3XDsjmbqCnuHq9LIYRFhLNf4mHQKLUrqjBbo6sxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=toMf8OrDiutm9OOP03RiqSGF+5zJ8T+ShHvuuu+gP4uWZkE0awBwHH6oyXQY3QFfKCAOEit6a94TkCl4dCtrETziVhxmZ8Uz3mrdaR4zUx2HdJX0VNRVHRHmkFyyln1xgajUlkbM0XHqgWVjQ+gvFUpvXDbNVAVgXhx/1EHOKMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJRGttIf; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJRGttIf"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b3b0d76fcso1363546f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 07:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767799133; x=1768403933; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hs7UTF9OYygppRuc29mz8ACnbiOzTDxmVFUfRrLLvNQ=;
        b=DJRGttIfUTjuNqYAbCrcYn1s29wMz3hmuNIACO+L6w8JqNLE5Cf41zckEmhoh6pGfT
         PoWfGd7zN/RLVT4RIQ2AKaxgBwfnCebkCObY7RsI2EDWNfs1XjWAhgeyk1C0Q1heL0Xz
         X0TfbCuaTNomiDIG5Qakb48vEcd5cVFJJsl+q8MB0N96NRvpdaSENbH8w4doBBvtxZFt
         dkc1HO2oBf619ttAM7G0vWoVS98K5wh9Tf9Y8YPHvCebtZPIOMxDfm0EgjneM3B6fuli
         jU24/uhoR1qeYmLj7v0fMY93hZ3NQDihsbtH9t6YBdu4wyh9TAPHY21v1r8XuV0jhu8I
         Df9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767799133; x=1768403933;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hs7UTF9OYygppRuc29mz8ACnbiOzTDxmVFUfRrLLvNQ=;
        b=CCh6Ql/FwHwFuvY/6QoLXeY4/IAnkr3bcyQ+Fb99GtYgXn6YG9i4IcHrA4sX+6LX8Z
         nx73VNuq5orkut9FLy8cMdbbDPfBombCjDLQhJFSQvJKidEZxnJ7mGkOBzYaMkj8/rtl
         ytN/5BWIy0qpOJlVo11eI/BLaPp+BUefxJZK+qJG4pnhsM2B5hYcAopNjbGgVpjGG38u
         jfdpL9PlsWcp1wEIstesMuQVim8rxc0FK1IHGufoBo9J8AjaPX+c916H/0clPCwtuJek
         XqtF9OKsEr0zJE+ShhOY69i6WmyLVfm0b53lxXiUGoSZPXyC5KRzgIWkxHGP4PI4kX52
         o0PA==
X-Forwarded-Encrypted: i=1; AJvYcCWw5lV2SJLmE0X/1xBRPRGU8ycd1I9BLj4DB3ptEUlLvjIhqp8Z9xQWe0/W3HdzuKJca4Ab5yhemDw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfK0OWREBilc93UU8SQeaFdz9im9H8qEKIfbwzNPQb0eFjzx3r
	7GtJQ0mYHSxFlGKXAVml412OsYJwK+d/j7kByoc18Emrr0E4d+th/RBX
X-Gm-Gg: AY/fxX4rKZ/kOqK/mUtPcthJM4FIvVDR/1mPqvqcA/B19TBSZQ0Shx2yaCn8gUm5nj+
	73UZ/bfvzsRfNhy1zCc/A/8m1/zK5k7VZwxt+MDiTTaIgUjpw1dEHOGP1+YhHpBzI/5ua9gwbjn
	e8JrrRNEg+USNBPQ0uIdzVcntDXzuSq3w8FWbL7aOJe23djXkgbyuKNcEmEqDOcSal3DRP1TjsG
	FL2SqOSkOT9JbiHc/Jr4zZuy9ARRMGmHngPOr3jd4pS7IPCO6H6ppadY1LlRdQj5f7YOx48anJE
	erZueYzB82oOPRFk5GwryqeFwt4Qj5Ty1B3GyoDUthZS92f1qoi3y9hr0u9pWLpgR931Ag4S82B
	+SpzqFWuSY7VzbrBfkKr8SoezcOi7QBPALDkRxDRIpKIHl+2gN+jK2z/IG3vpPfFyzUHtuMjaYp
	RBHFKToKXO57QI83I=
X-Google-Smtp-Source: AGHT+IHTvz1Je3JayvbprZONkEuGoye7ddyIvvyBYEi4WT32a73ymDQLhohQBmrkRjpi5o5aSJm9iw==
X-Received: by 2002:a05:6000:2504:b0:432:aa5a:3916 with SMTP id ffacd0b85a97d-432c37950b7mr3983445f8f.40.1767799133334;
        Wed, 07 Jan 2026 07:18:53 -0800 (PST)
Received: from [172.24.138.145] ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e199bsm10937637f8f.16.2026.01.07.07.18.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 07:18:52 -0800 (PST)
Message-ID: <2b675aed-eef0-462c-b412-5cc8cd91e864@gmail.com>
Date: Wed, 7 Jan 2026 16:18:49 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: iio: dac: Add max22007
To: Jonathan Cameron <jonathan.cameron@huawei.com>,
 Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 jan.sun97@gmail.com, gastmaier@gmail.com
References: <20251219-max22007-dev-v1-0-242da2c2b868@analog.com>
 <20251219-max22007-dev-v1-1-242da2c2b868@analog.com>
 <20251219164002.00004c74@huawei.com>
Content-Language: en-US
From: Janani Sunil <jan.sun97@gmail.com>
In-Reply-To: <20251219164002.00004c74@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Johnathan,

Thank you for your reviewing the patch.

On 12/19/25 17:40, Jonathan Cameron wrote:
> On Fri, 19 Dec 2025 16:31:15 +0100
> Janani Sunil <janani.sunil@analog.com> wrote:
>
> Hi Janani and welcome to IIO.
>
>
>> Devicetree bindings for MAX22007 4-channel
>> 12-bit DAC that drives a voltage or current
>> output on each channel
> This is a very short wrap. Aim for 75 characters in patch description lines
> (so slightly shorter than 80 chars standard for everything else).

Noted your point. Will update the message.

>> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
>> ---
>>   .../devicetree/bindings/iio/dac/adi,max22007.yaml  | 116 +++++++++++++++++++++
>>   MAINTAINERS                                        |   7 ++
>>   2 files changed, 123 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,max22007.yaml b/Documentation/devicetree/bindings/iio/dac/adi,max22007.yaml
>> new file mode 100644
>> index 000000000000..c2f65d9e42d4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/dac/adi,max22007.yaml
> ...
>
>> +  vdd-supply:
>> +    description: Low-Voltage Power Supply from +2.7V to +5.5V.
>> +
>> +  hvdd-supply:
>> +    description:
>> +      Positive High-Voltage Power Supply from +8V to (HVSS +24V) for
>> +      the Output Channels.
>> +
>> +  hvss-supply:
>> +    description:
>> +      Negative High-Voltage Power Supply from -2V to 0V for the Output Channels.
>> +
>> +  reset-gpios:
>> +    maxItems: 1
>> +    description:
>> +      GPIO used for hardware reset of the device.
>> +
>> +patternProperties:
>> +  "^channel@[0-3]$":
>> +    allOf:
>> +      - $ref: /schemas/iio/dac/dac.yaml#
>> +      - type: object
>> +        description:
>> +          Represents the external channels which are connected to the DAC.
>> +          Channels not specified in the device tree will be powered off.
>> +
>> +        properties:
>> +          reg:
>> +            description: Channel number
>> +            maxItems: 1
> min / max?

Shall add the values.

>
>> +
>> +          adi,type:
>> +            description: Channel output type.
>> +            $ref: /schemas/types.yaml#/definitions/string
>> +            enum: [voltage, current]
> This is much more constrained (as only two types of channel) but we do have
> precedence for adi,ch-func in adi,ad74115.yaml and adi,ad74413r.yaml
>
> That's not a particularly pretty binding but we should probably stick to
> it anyway.
>
> adi,type is too vague a name for this property anyway.

Agreed. adi,ch-func seems to be a best fit here. Shall reuse it.

>
>> +
>> +        required:
>> +          - reg
>> +          - adi,type
>> +
>> +        unevaluatedProperties: false
>> +
>> +required:
>> +  - compatible
> For supplies we document as required any that are needed for the device
> to function, whether or not we happen to need to specify them on
> a given board (given fallbacks that apply on assumption that fixes
> always on supplies are in use).  So I'd expect to see at least some
> of the supplies listed here.

Noted. I shall update the required power supplies.

>> +  - reg
>> +
>> +anyOf:
>> +  - required: [channel@0]
>> +  - required: [channel@1]
>> +  - required: [channel@2]
>> +  - required: [channel@3]
> Interesting. I'm not sure we have never bothered to document this before and there
> are other devices for which some sort of channel config is pretty much needed.
> What is the justification to have this explicitly listed here?

There is no need for the channels to be explicitly mentioned here. I Shall drop them.

>
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    spi {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        dac@0 {
>> +            compatible = "adi,max22007";
>> +            reg = <0>;
>> +            spi-max-frequency = <500000>;
>> +            reset-gpios = <&gpio 19 GPIO_ACTIVE_LOW>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            channel@0 {
>> +                reg = <0>;
>> +                adi,type = "voltage";
>> +            };
>> +
>> +            channel@1 {
>> +                reg = <1>;
>> +                adi,type = "current";
>> +            };
>> +        };
>> +    };
>> +...

Thank you,
Janani Sunil

