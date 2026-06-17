Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F7B3559C9
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 06:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781676019; cv=none; b=lgbbe6Ws2wjJUqc59rFkrVyq41tbTlOO9CCrre2p7nOdNEt0QXK6nkLx6KEQWKXIMch6zLMbDgFQHBbig0ZGw88ensXwUF8W8Y23K3N3/VW6S4KzMQBZlC0ky4vKUuzy6CY32fUdU3CfKPURJz8LKQUoKcf1txu7bfqdurxFYgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781676019; c=relaxed/simple;
	bh=EPp3+y8U+wDZQ2t1aRvjrkpD6kQKVPXuQaessSYJEI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IT+99OpHRXOP17C0MK1g15t0DgRi3p+AfxEAHDbAsn3s9ZrtSCHmpIX9ZjOTQWYQRDgu5n6kht3njY2efk97s3kSPcv0CoBwCf834XR6WDfBbqa+Nh40eGhUJojvb/cBQ2Jb79vqtgXS86A3QpVg9QsP/N1EhqHRzZdEEqwetVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBc2S9g/; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBc2S9g/"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3967717c951so66275461fa.1
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 23:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781676016; x=1782280816; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cs8qvTgnQoJy3gVauu2STPsPcaY4YlG12CSyBpLnw6c=;
        b=eBc2S9g/WVG1RAN4zKzecPQNVMmioA1GaCYMMDOdguMwD/2cQFoW6bPJN2KhjPicoX
         QR5GwyYGZmDU5P67emxguityVFNvwywFhKcSKbqj95lbibNMfgub8QC9g94uyqD+OqEa
         rZaH69EBdQIcw/lHlab+TtPSlUigQQa0Z1GrfbuXbvfEgUyqCklT3cAynbTDui17z7sE
         WnbISAMY4AJqWfSFo6EpdZ/1S2AqTPP3PJ2Q6cUimiDaRf7Czo8o/lUDHl8BIAWDe/7k
         h66gm+xo16DHTetu5lV26LuC6eMZndolcyJvQyQX1tD7ZIckG493fwwDQbwzGptjS/aB
         sYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781676016; x=1782280816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cs8qvTgnQoJy3gVauu2STPsPcaY4YlG12CSyBpLnw6c=;
        b=tF0E8+N91jwEIEpqVw0oUUpQhQx9vpACemw9Tx7iqLIQ4DVGrOx3olSBV54Pu0Kivd
         KJZEZQZ1mgMhpc/3tt6b03hzPxV3uiQwIUta/++AyGvjc4biT0w0+SSr9NGtQFNs/aNh
         dCMmkj4G9G4UVjRt8eoJQL05Zcz451lDdUOABdOQOFiom5Of+ImN9HG/UXS2td0Ij49e
         htTXHXqV6EkczQZagYZ68vltButFnvOQKRx8UdHZXbVM7aTDkwUQbkrFJpJDU7wVAn/W
         lJV39sJdc4pMHMIbtIqbaKUTIBklksZeUy9dA9yzHVDvhGJisggHqEaESV1evZU3gtTs
         pqWA==
X-Forwarded-Encrypted: i=1; AFNElJ8HvAWwDFuBjNXR5FtJ9aPHpd5U+oMMruoJJK0D3OBwS/IiCf3iUaRzwWULHmvxrt9Lje+QQIL1R94=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgd/HvvbxDrt8FlsVw372cndaDM5nDA9vV5RtRUtoWKQKegFJx
	9HZJEauhDiehdb9APMGrzau9+wQ/sbMkSqUYCucYvc1rbF1zGVXIr1WR
X-Gm-Gg: Acq92OHXLThSRCo6qTQDgdFLDAWp8iDuabHnuyrkN5mA56sA5Xhn7fOVeCx4VCi57GT
	5su/5qnkyN+EUaI+IEZNcAoXWTxzlt5Tp9MX02mwDDmV9BSCY9Ob9+bYnL0AL6lcGcawiSN/BYl
	gzz6tc4bzOuDigJuxDuj4ZT2XLjzMyxw15iTzki06P6HepQuCtbEGsS3FUyEeLi+gByGD2Jp5Yf
	pWR191BSaOwRHaIPq5RoPfOM2zwUXumivwCH7Yx27a+2tGHKQLW+k6PiDHO8XzLfykTy9c3XWcR
	BaU8tZw2v/g5Qp7X1635Z7SgDCAlEa8bv/uFpyiS59SgE0Bt5uL8aBLLRxFkC7sVoc9+DvDBmL/
	th4wnqDYx5q2ZWtxP9XtGuPRnMTxMvBUhr84blzHCCp3F22WUdsUUemNUIMVnJGi2m9+uQ9VgSA
	6e6NCN57oGKPuOu4Z8L45I9R0o/WzbgkXxCBZ2zEcRfJcAuJJfEtOTCdYPHYUkhZIrl244RQ==
X-Received: by 2002:a05:651c:2124:b0:38b:e464:f047 with SMTP id 38308e7fff4ca-39969ad94b1mr4694531fa.12.1781676015350;
        Tue, 16 Jun 2026 23:00:15 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c04d8b2sm12250531fa.2.2026.06.16.23.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 23:00:13 -0700 (PDT)
Message-ID: <f3562874-1c82-4ba3-b37d-dbb50bb54977@gmail.com>
Date: Wed, 17 Jun 2026 09:00:12 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] hwmon: adm1275: Support module auto-loading
To: Guenter Roeck <linux@roeck-us.net>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Wensheng Wang <wenswang@yeah.net>,
 Ashish Yadav <ashish.yadav@infineon.com>,
 Kim Seer Paller <kimseer.paller@analog.com>,
 Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
 Charles Hsu <hsu.yungteng@gmail.com>, ChiShih Tsai <tomtsai764@gmail.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <cover.1781591132.git.mazziesaccount@gmail.com>
 <634e76680ed93e58ebeb35db080138b791cb6c27.1781591132.git.mazziesaccount@gmail.com>
 <f080e20e-6ec7-4744-9794-0a92d03f48d8@roeck-us.net>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <f080e20e-6ec7-4744-9794-0a92d03f48d8@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/06/2026 17:04, Guenter Roeck wrote:
> On 6/15/26 23:47, Matti Vaittinen wrote:
>> From: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> Populating the spi_device_id -table is not enough to make the
>> driver module automatically load when device-tree node for the bd12780
>> is parsed at boot.
>>
>> Adding the of_device_id tables causes the driver module to be
>> automatically load at boot. Testing has been done with rather old Debian
>> system.
>>
>> When inspecting the generated module-aliases with the insmod, following
>> entries seem to be the difference:
>>
>> alias:          of:N*T*Crohm,bd12780C*
>> alias:          of:N*T*Crohm,bd12780
>>
>> I suspect these are required for the module loading to work.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> ---
>>
>> I did not add of_device_ids for other supported ICs as I can't verify it
>> doesn't cause side-effects. Please let me know if you think those IDs
>> should be added as well. I would be glad if I got more educated opinion
>> on adding the of-IDs :) (I can squash this to 3/7 and 6/7 in next
>> revision, and add own patch for adding of-IDs for other ICs if
>> required).
>>
> 
> I don't know what those side effects might be. I am much more concerned
> about side effects of having some of the devices in adm1275_of_match
> and some in adm1275_id. So, yes, please add a patch to provide
> adm1275_of_match for all chips supported by the driver.
It's nice to have an opinion on this as I was really unsure what is the 
right way forward. Thanks for all the help this far. I'll do that in v2.

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
