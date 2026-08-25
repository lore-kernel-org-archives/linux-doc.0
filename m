Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0B4459AD7
	for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 13:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787665864; cv=none; b=dS7d/SMbu7VK+Bs7ZwUvzqXNX3s85Ynwvk6z2ORSekHQNQrdiHbKjqcoRABZlruMArdgPrCffCMLUO1kgNb+S1darJC0+zVGGaCZW3E4bkwkw5qLeYdyKo7eGAjLnShD4V52IHmSwBBHI+okW7raI6INmmxPK9upc4gW1ehy4m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787665864; c=relaxed/simple;
	bh=q4fmKfhNvE2e6sble7TF9RAgMQFsrD3C7OFXvi8DTWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IVjlU57mxn978F2Z8Uz8rQhnTTPJm1EoJ/DXgoFc9TE7UxM3jQDxGYL9VSfACFEluUHilPd8LpLoq9YlLwsJRCS0NyddZknYDXaaou4mqbZWM9ybXjoII9AY1XJ9gD+tOekIZ/wf+S46Bj8EQv5La+FcniTvIsvd6iA07g4SI6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJnLlB1i; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJnLlB1i"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c1712a04ddaso795211266b.2
        for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 06:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787665861; x=1788270661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHnWeKaj8W4Oq7BCPbYGJwG4B0bt+vGlTEM1FKI9IJg=;
        b=QJnLlB1iyIxaXFJxASiPFKMBPGuWUVwXOZ+rqJF4VuRsxRxiVKV60LASPJLcNG4T3V
         ezvoma0Z2DS8Sz+V8XCZ3058pmAtfhJg4g00TzajkwAcRfk/9fjJ+sqTuruMaQyH8RDj
         /cHRjwTOVooAFLw2U8KcNr3pZEmXSx/gwz3a2nIUpDVmU4YMQTjiK1JaUT+TBsaZg9Qj
         LaW+zC0XlAt2unj2qRnjLZZY9wU/oR70MmCIE/syTlrqK1uhrBOnULonJPaGpT8qDA/z
         2keXIKK95fIp8Ubla02kGxrvE0QCNK33tioNVGmuquo8OiToWjzaRQXqw1IcPBj4oHPH
         lokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787665861; x=1788270661;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHnWeKaj8W4Oq7BCPbYGJwG4B0bt+vGlTEM1FKI9IJg=;
        b=UloNg0VNQp3jEryLh98lCX05lVRQeOSbWByZipoMbvSEV78hATvWEb2xI8s5k9VT4b
         zbYCCYKqccChEqZsty46+34pFuBE5MByu19k1FdGp5Nod3hZPzaPzmyzzVOM74tw52Mb
         wlEfngkPHox9opfnQ5fdxb5gIO8e32yuiN9nsg55pDKrjdRigJpGmNPly+F1m4/twbqo
         7hZ7i0VLVeGEfHwT4Kg7Bre20Nns62pvCr/tA70vfbHyDZQUjFfgtvdIy1F2T/y48rbO
         CU0AWw20TOl38P/S87Ue6kiuP2iDLhM/vyzt8UzNiDwU93iYwEu5I7Mdw0+PIagHjZN5
         6KsA==
X-Forwarded-Encrypted: i=1; AHgh+RqftKm0rQ1blPMkTS06q7pfiROwTuWlS31nEQEUO3pzVjZAWjPPkWU/zcZodyrkvWO3bwvAn1qdGSo=@vger.kernel.org
X-Gm-Message-State: AFuF++lYuyCbbX9nshfXUPxWCJnWL2BAi/9rGr4LGUyMpRmkpnsJIrZC
	TuEASvpkC6/RDQblhYXWp9xyHWIg7FFjIktW23LM6gkMHlaV/0l9V0oo
X-Gm-Gg: AR+sD12cUlv3ifkXJOxpuOPy4NLsfwnrwVigQVSZZdC6ob78hvnSnC4eLtb0h6fwXWU
	TYvkmzO4+rvEbM20NhScvjktQDo6b+Szkzc5r8MbuIgP0hHnlACrYviwZFQ1k3spfoWEP2rPM7J
	mBuBLsW8Lk6cyIRGt75m0sKj8WY20XJHTf0fEhJ3OSoP+G6UN3x5Qt2IbQiwLZWmiJwPZSk4Cz4
	z5R3Wt5Pi/ilkRoouaPbLqnxfsnOLKXZxJpwLeGPHQJm2D1IQ+8m/HLz0qArdcIO+HKmqvHphmK
	wOwfKqovhv54tb3+x7ha/f/NqSUI5DUGywWnp8dEgjMBLpTQLh3urWNMqMYnPMeWdbOHL/LZ5Y9
	FbMFpjv5mNGlwH1p3fnPte+f7GRfAkbr9cefHq1c+L8Wfxfn+jm5OGDrGdAbKuV2mjo4Ke7mC1O
	h4M1D6f+yQUXtpBbIQwGqo8WGdNg/X4xZIDgrK4hR0y50G8D0hNnxUfGib2JAXC90lPnpt39n9f
	0n7OOXUPLHs7RCmBLWUIAMUb122sdZ5psX7lFj83RRhXewuHHnaReuMZdXQBqG4YO8Z9PxLpAip
	L64=
X-Received: by 2002:a17:907:1c90:b0:c20:edda:ef5b with SMTP id a640c23a62f3a-c2491e839abmr2663366466b.14.1787665860484;
        Tue, 25 Aug 2026 06:51:00 -0700 (PDT)
Received: from [172.24.138.145] (dynamic-176-007-058-112.176.7.pool.telefonica.de. [176.7.58.112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496734bfcsm1958495166b.43.2026.08.25.06.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 06:51:00 -0700 (PDT)
Message-ID: <77daa3ee-e5cd-4be9-8110-6f31c90f76d6@gmail.com>
Date: Tue, 25 Aug 2026 15:50:56 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/14] gpio: regmap: Add optional runtime PM support
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Janani Sunil <janani.sunil@analog.com>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Michael Walle <mwalle@kernel.org>,
 linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>
References: <20260821-ad7768-driver-v4-0-bb8fbd06d4eb@analog.com>
 <20260821-ad7768-driver-v4-12-bb8fbd06d4eb@analog.com>
 <aov7QpTVLDZ9PEkw@ashevche-desk.local>
Content-Language: en-US
From: Janani Sunil <jananisunil.dev@gmail.com>
In-Reply-To: <aov7QpTVLDZ9PEkw@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/24/26 10:05, Andy Shevchenko wrote:
> On Fri, Aug 21, 2026 at 04:07:05PM +0200, Janani Sunil wrote:
>> Some gpio-regmap consumers share their regmap with a parent device that
>> may be runtime suspended. GPIO register accesses must resume that device
>> first.
>>
>> Add an optional pm_dev field and acquire it before register translation
>> or access. Release it using runtime autosuspend after each operation.
>> Keep the device active across the complete direction-output sequence and
>> propagate failure when setting the initial output value.
>> +DEFINE_GUARD(gpio_regmap_runtime, struct gpio_regmap *,
>> +	     gpio_regmap_runtime_get(_T), gpio_regmap_runtime_put(_T))
> This is not used, it's for guard()() case.
>
DEFINED_GUARD() was added because DEFINE_GUARD_COND() extends that class and reuses its type, destructor and error helpers.

Regards,
Jan

