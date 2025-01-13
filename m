Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DA61CAA87
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 16:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736786995; cv=none; b=tITJGfkOw9DR1bFKPWbmqfD+zTWc4+27yluExB0pv4mI8Xg0mPE+ohyMd46e/to1BYE2hLxSNskVs6mOLVG1s/mmfR17YueqPFc4FY/waUYgZxF6Ey45bN7Pb99+e5ETCi51UBSmxTiRBeagyhHWejHcOQop47XFQEAl+spspGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736786995; c=relaxed/simple;
	bh=5R8Z+Pn/PPnTY8jfLG97xqOJA6BxHCPtkA+ReHw86RM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZUIDQ56GxgN/nP53B74yjPk1TbV3NCjEFYwYCjPWXGklAvbwwnKnZStGikOTfLkgcpA7x+UZYHstYN8pTJHt28MqcCGLE+t37JF2+EbrUgocQp1GawxsmToLq5pVEwM/P6qC1fU2BCPaXM3WwltqrEVQXzPrBUplU77M9fRKm44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zwQ0warO; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zwQ0warO"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-46783d44db0so45033321cf.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 08:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736786991; x=1737391791; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sEuSOcdGgqmCGmEswksuVOiY36y/yqL1o3cjWspZHHA=;
        b=zwQ0warOnj9mgFPw3aL9Wv8mDRIVzMzf7iOuVtZtBKoQKpyB/5HSt+sicPIg9VNUVZ
         8dXMMgxT0QY/fveV4RQkRHvX53XCGdZTVH5TNUwZoelYNhN0EybBgthYJELR/gScvj59
         fiZemDg14/aAyxxDm/Jb6GtimBAE7znHvZ1mEPgDmpGLui0bl80pO3wtH2jqipKa+k04
         Ivc1MCAV9mTDh6kMZ2EBiULJZCZAYjPDXvwn6aeUJVRpnNzLPKpxys4Y8c4eejcKJHXt
         I4Wm/RCMZMgJiew1/NvPiQl+/Y6aodc3ap57B4Y0hEHKCIS1R6fULAnp8hvA5I/73iW9
         1xGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736786991; x=1737391791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sEuSOcdGgqmCGmEswksuVOiY36y/yqL1o3cjWspZHHA=;
        b=jAzG+zLNoAecxuEtsY1yvCsVecpbkHj95DuNEDfgoHcc5xxNYggC7IAJ3bUqsS0Oq4
         ZZJwW4iTO2TmlAv3dSAYNX+Oj9Hgl4VndZYB2a5OpwuIAl3jhFM1Fxxu9Gl7qyOzfWJP
         xI9K1VKlDBUvAIUgk2WnZSS9Wpk3wrRMyXpwsjxKoXtQSzzZWrFJIyaM3uCw9Mv2K+yH
         rXxza/ussuFLke8DwQUSmdc+MDA9XjSu8u5CeuU6Vluz67VJRNbCOgq2uvJJ1yv5r09+
         yC/D3dofgxCzNfAREDWRayE+aW4rX2lOk9GwRt4XsLOJCQ4KwRbfkP37tHZ2Fa890eP1
         7/GQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0wVINExEFMebdi4jE3BHxN5BGIGp/kvDmdDNrQ8c5eaDhSxF/e9uj79UWWPzzFepGVwxvkDYa3bU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPBN2FGDtcV6rO5m/vAj2bZhcU2Mq3e4dVt91A/rxW0xk9Un8+
	f4w6pNvsv/Nx+MseYCZ7YZ6KPdaxKWybAxxdQMzgAq82vepwXJW0fjsp58niBhY=
X-Gm-Gg: ASbGnct3kQR9xWEDRdWDo2tbbWxt2ebSaiwq4P3XAnudFtvr+/8ZHLJOn/zhEQW2hj4
	45QdCtXTSzDvANji0waJQlDH/Xllt/HeilmPR5hlYOb1qXPahtx25NGs5/dH9CTwraKimo5nWk9
	utJ9WDdfcOnR6ong/V0eWUjFlYa184qjzZ1elejBjvJLqawJvItb7IHd7rjAmOiIy4Mb1V771fx
	g/eZudC9PGPHyLOU414TzdUOJwgwhbVwceASIF0Y65q45n5Z4qM9MWHDXLuv1S0lzQCdCBU6XVB
	dKPPI0FNCOCzHZ9xb78fHFkd
X-Google-Smtp-Source: AGHT+IFNSEcDX5l/rwUhlg71qHnodYMhIxIuQDqIrH7anGzKvOcHlAuLuuuOT0Tyfj5WaYZcTVlywA==
X-Received: by 2002:a05:622a:20d:b0:461:22f0:4f83 with SMTP id d75a77b69052e-46c71084227mr360867621cf.43.1736786991533;
        Mon, 13 Jan 2025 08:49:51 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46c873216e6sm43125471cf.2.2025.01.13.08.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 08:49:50 -0800 (PST)
Message-ID: <efba6746-47a6-484f-ade5-f1e17246ac68@baylibre.com>
Date: Mon, 13 Jan 2025 11:49:49 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] iio: adc: ad4695: add offload-based oversampling
 support
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Jonathan Cameron <jic23@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250109-ad4695-oversampling-v2-0-a46ac487082c@baylibre.com>
 <20250109-ad4695-oversampling-v2-1-a46ac487082c@baylibre.com>
 <e3fd7f56675908a60d8ce6bcb6ad4f05b828e132.camel@gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <e3fd7f56675908a60d8ce6bcb6ad4f05b828e132.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2025-01-13 09:35, Nuno Sá wrote:
> On Thu, 2025-01-09 at 13:47 -0500, Trevor Gamblin wrote:
>> Add support for the ad4695's oversampling feature when SPI offload is
>> available. This allows the ad4695 to set oversampling ratios on a
>> per-channel basis, raising the effective-number-of-bits from 16
>> (OSR == 1) to 17 (4), 18 (16), or 19 (64) for a given sample (i.e. one
>> full cycle through the auto-sequencer). The logic for reading and
>> writing sampling frequency for a given channel is also adjusted based on
>> the current oversampling ratio.
>>
>> The non-offload case isn't supported as there isn't a good way to
>> trigger the CNV pin in this mode. Support could be added in the future
>> if a use-case arises.
>>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
> LGTM, just one small thing inline... Either way:
>
> Reviewed-by: Nuno Sa <nuno.sa@analog.com>
>
>>   drivers/iio/adc/ad4695.c | 333 ++++++++++++++++++++++++++++++++++++++++++----
>> -
>>   1 file changed, 303 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/iio/adc/ad4695.c b/drivers/iio/adc/ad4695.c
>> index c8cd73d19e86..0caaeaa310ed 100644
>> --- a/drivers/iio/adc/ad4695.c
>> +++ b/drivers/iio/adc/ad4695.c
>> @@ -79,6 +79,7 @@
>>   #define   AD4695_REG_CONFIG_IN_MODE			  BIT(6)
>>   #define   AD4695_REG_CONFIG_IN_PAIR			  GENMASK(5, 4)
>>   #define   AD4695_REG_CONFIG_IN_AINHIGHZ_EN		  BIT(3)
>> +#define   AD4695_REG_CONFIG_IN_OSR_SET			  GENMASK(1, 0)
>>   #define AD4695_REG_UPPER_IN(n)				(0x0040 | (2 * (n)))
>>   #define AD4695_REG_LOWER_IN(n)				(0x0060 | (2 * (n)))
>>   #define AD4695_REG_HYST_IN(n)				(0x0080 | (2 * (n)))
>> @@ -127,6 +128,7 @@ struct ad4695_channel_config {
>>   	bool bipolar;
>>   	enum ad4695_in_pair pin_pairing;
>>   	unsigned int common_mode_mv;
>> +	unsigned int oversampling_ratio;
>>   };
>>   
> ...
>
>> +
>> +static unsigned int ad4695_get_calibbias(int val, int val2, int osr)
>> +{
>> +	int val_calc, scale;
>> +
>> +	switch (osr) {
>> +	case 4:
>> +		scale = 4;
>> +		break;
>> +	case 16:
>> +		scale = 2;
>> +		break;
>> +	case 64:
>> +		scale = 1;
>> +		break;
>> +	default:
>> +		scale = 8;
>> +		break;
>> +	}
>> +
>> +	val = clamp_t(int, val, S32_MIN / 8, S32_MAX / 8);
>> +
> Why not clamp()? AFAICS, we have the same type on all the arguments. I also
> think clamp*() macros got the same improvements as min/max() ones which means
> that using the ones with explicit casts are not so often needed anymore. My
> understanding is also that those macros are not that encouraged as it's easy to
> go wrong with the casts.
I have no preference, this is just a recent habitual use of clamp_t(). If
clamp() is preferred I can send a v3. Or maybe Jonathan can tweak it 
when it is

eventually applied?

- Trevor

>
> - Nuno Sá
