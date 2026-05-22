Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EFC313283
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 16:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779466765; cv=none; b=quln2KjP8t/xggRs/N/MFNWB28mN/Q3gFIkyPObsWK3IQHCZ+6DiZkyBcrzsl4DKBc401K35agBP9UiEhZzMtiSQsSlYwFj4tVXIhgCBKvjEExqbehauew5tbP31RRB/GtD4kQYZIKl80tGrysBOWAR0umMtqZnyCDvZS0Szqa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779466765; c=relaxed/simple;
	bh=p/IziD86soopA2ykY/ULHl3FaXtM3O7DoQqZhWvNjF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O+K9D00s1tHiyh4IsAz+WT0N3/izoQfEQSRqV11SzCJNCUJ7vXS0lt4B1lJEF8ZRVg3clw8j6Ip55HDJmLbMJ/4vqPYV6qCGzzpQkEtcmEtbBKWFstkK0SeytlsxcYfLMABzl1aVuvgYQ59RtOcJp9JnNRcSA4vfYzbB9zC08jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=izpTMLmQ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="izpTMLmQ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d7645adbdso5097005f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 09:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779466763; x=1780071563; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=khURmgI8xAljbpClwOX73v/ypCL2TwOkHn4DqsHmwrI=;
        b=izpTMLmQyDQ+zLlckS1kU+wGrylrFdoSOHZk5tTwIu6cgu+k7SACum9QqlChS8jd8u
         oJa69pOsa6mCONI8bqD2EnfMlp94MYQdmy0ILJ9Tv94vUSNxx5W9+gbP/Di3wHAfw8++
         uIvOAHMysMryTK/q4MpDICxh0vcqb7WaYAkNhAPjNHfmYyweqWuPuBwsej0/dS1MP0XA
         G/W4DyAJZ93SUbXKymgsE4AdvQzcefXyctL/ZTB3gI9RHBXQ7KOt4NOJ8y2WDGWfsYJ4
         kCwoV3df1O95VwAo2e1Ux2n5kuZE87zU6WW74bso15J3jc4eVwyTNpon7qAu/fvhPHxG
         R+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779466763; x=1780071563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=khURmgI8xAljbpClwOX73v/ypCL2TwOkHn4DqsHmwrI=;
        b=ZrSEmR+rza8sgnJ3Up7FJC+Jis4TijREAa0/b/VNePKceiIzIO5tYv9hCXIBuBGRiX
         hYZzDf6+NJiPiMWWE+6n4VbXucbNklc51xB7+42kMZ3i2JrI8ckT4JUYUdAPXpfqc1XY
         OYHQVXiAfCgZhGynJyALPksqD+e1xrOU01sOY0x4aAbKpWF3iYznU0W+5VhJyQLI4o1E
         2lXzrWOmoi+AfZ+B0uNKMB0HFYye8vuHqsiLFoZ6apacMQXUrMQgvi3l8Ldb59W93u4N
         tCJqLCujLpWI4h7CnolQrlvymOLuwtpS5IOokYUeF2rHjLnaeNStTsnB9r+MOLViGs8X
         Heig==
X-Forwarded-Encrypted: i=1; AFNElJ99uXJeUKIVaL2bnwiumhtth+0nK7R9U8xXtPO4738u/PW65un467fDw94UnR7raU2DgtJKOCsp+gM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9IYycGSLSHiSmWZGTBeE4Hv7rVTHBye2vcTs9+VRLK+S8fSj8
	7wFp77mY/+JFoMo3XhhxTysW3EkCOYeRZX3FuNtQZ3TgqrvzccDib0nf5aRb+di8wY0=
X-Gm-Gg: Acq92OFgeYPqwHJO010MSe06a9XzMKAEfdy0k3RqPVpEcROm4ybu8+5QGPjKnJV/bQX
	csT/gTxoWKjyIBp3lhr1mrebWSN/SxnffCxXOJCPkMy8wumsZ8GjHQI7ZfC8MVqCCECU0CcfWHU
	Edrw5oCNXJz+C1leoqmAWMB3cxhe66cTf9sLkJRKWukk8ghx2xAABpDA7rjT7pEP3KtNkjRvkKH
	C4AJKbtoFe64xakGglExW364m8oFqmW5SdJPWslWF1mvWjXIEv30WJTFBMV6m9xWljYp++mlINH
	XXQrSJaZ5btT7FxPIzfdYxmBXVJSywl50b5h9cux3hTiH7Qytimj8syBtEGA3lk0QMI0J0qkxIK
	0w01mZVUdVNce6uCH3+RTrQUsP7rsAZi0eaL8lOJDYyGu9AxGj4qKQawjuEozjsxmeV08BWWxS7
	dhrFItlAzA2LBXoYqhtaDkzmmGBr6P2BQkSAtBWnLK2A==
X-Received: by 2002:a05:600c:8484:b0:490:3b87:be0e with SMTP id 5b1f17b1804b1-490428e3362mr60457495e9.29.1779466762913;
        Fri, 22 May 2026 09:19:22 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9f598sm5363185f8f.6.2026.05.22.09.19.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 09:19:22 -0700 (PDT)
Message-ID: <456a7b82-0d53-4c83-b17d-5361bd1f4a47@linaro.org>
Date: Fri, 22 May 2026 19:19:19 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/28] mtd: spi-nor: swp: Create a TB intermediate
 variable
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Sean Anderson <sean.anderson@linux.dev>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
 <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-13-93453e1a9597@bootlin.com>
 <a54562a0-1a75-401c-9508-8e0322d81a3f@linaro.org>
 <87zf1ro2dt.fsf@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <87zf1ro2dt.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/22/26 7:06 PM, Miquel Raynal wrote:
> 
> On 22/05/2026 at 12:39:48 +03, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> 
>> On 5/7/26 7:46 PM, Miquel Raynal wrote:
>>> Ease the future reuse of the tb (Top/Bottom) boolean by creating an
>>> intermediate variable.
>>
>> Please squash this in the patch that needs it.
> 
> The problem with CMP addition is that it touches all functions all over
> the place. I want people to be able to focus on the CMP addition, not
> all the side changes which have nothing to do with the CMP addition by
> itself. Most of the preparation patches are just steps in that
> direction, they could also be squashed, but overall they make the final
> diff much simpler. I believe every small change making that last step a
> little bit easier to read goes into the right direction?

I was looking where was this particular bool used and couldn't find it.
Fine by me to keep as dedicated patch if you think a 3 line change
distracts the reader of the bigger scope.
