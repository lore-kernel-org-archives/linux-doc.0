Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CA33B8BB9
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 16:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774282094; cv=none; b=eOWRi+pxI+jbQI19EOvlv+RuVe/cnPgzkJ+oWOe5b7eFi9jf9guiemIBQKdv7G1gqAZT5gV8Pc7LjQlhQoA3SB4XF20LYyO0l1HvIdI2Ko8J60jpM6Ya+zqNADHANsNT6MmzVSLvlYyk8+Lq34mj1lr2Bo3c/bdgrf0WoJw86FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774282094; c=relaxed/simple;
	bh=o2DCwQCqpStVaX+n7FZYKQBtL2OGc+iF8tHcAp7A8DE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Cr5uFBeUcX3y96iAuSEkzHHpHYlPZXe1G9AQciOAZPUXUbEugBHxHSdwYXyhMK/AcsxlhCWDj2trxmmAgk7Sg3wzu8bgtEUTAGX11QxoXGwXC2Y3KbcykOI2PhWLcdArlNrjl1CFSFuCwybLSZ+uusGycPsqbu2t3luqY7zzvkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Z52zxUR/; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Z52zxUR/"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-66f3e7d9eccso208439eaf.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 09:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774282086; x=1774886886; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wyzGrNVisRoMpOWKYhySoLBPe/90QEbmgHqpo3IVsN4=;
        b=Z52zxUR/IBz7v+oXaimaZCu91W0Bnq9GPOANruxKsfoK9XiRJ1HkAdJxxxWNjd1A6s
         lTzSoY4hE1TnlVN6+6+vDdhHwdlZZreyCJ7GGUe8U5WerjxeFLuC/CKeVset+RT0MKSc
         fgFlD0rdJyVcT9PHeO57T6uLAl5QFTR/89Vo/WiZyjtIy64nfwGzgeSEddahXlM/LO9K
         gGRwLO+WwNDRGveKg8Ny5QOLzR7f9Z70S3Igz4Z46WUxjdJ1frUSXy943v8VcZjrROH2
         461O/D98Z3Yj6s1Q6JYK0vKLKwU8Wu4HnQaI8x07ijhAJItIV3iHcyK/oeLctLBnvgQO
         kPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774282086; x=1774886886;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wyzGrNVisRoMpOWKYhySoLBPe/90QEbmgHqpo3IVsN4=;
        b=p5kqB19aG1wERuje5qJ/4j/h5u/TC14EIroKr/9RgwwttuSkr91DPj7C5aS104OtZx
         zFwEiA/8FAkPY17iUp/3G5rV1oaFgn0MLqY10d5lbRZQq4lB6un7VopmBthQUqXsX8f7
         JlH0O55njzAb4Z2Nhb4n1Gbc/MPhFdRKk8VABfwldqYvo3Gwa5cEtrPm4UU/jAcr8XtB
         rUC5YKAuoOL5wmvFusw8zOmBq5XIevLBqfMUz+yZHE3tfF3rBjWAaz7nNM4ziCrcPQdb
         jzMgnSzm4wBSTY/v9otmTuYHjFHP6n9DI06iRrjO6b2EGm995aq4sUMjxDo8ryiULuLE
         ddKA==
X-Forwarded-Encrypted: i=1; AJvYcCUBF+QMmPjhAtu+n+kweFK5Mt31Irerh90tL612n+AkOoWJV3JuYGivY4d2yEHJWrWnWv8kR74Mryk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz43MI6nqlyn++4nx4/LOBw5Z2y55NkHMbNJbMeyojXCrtQfcUc
	5S2l0X2i7lLnyObrPNg3QPuzeSPH8/oGdxjHa9M7i7o89QTGuAuTX9wiipyiPd8Y+0w=
X-Gm-Gg: ATEYQzwR+5nlKRMRbilXMFOCy5J/o5ziFBRSqPEdyNB5FpZw8nGj/Wxsx9FvDBPkuR4
	aqwZdpVckJ596Oy/OGCB00hW68jzVhR4kh435BoR7QsFExUc6G4RRBejEinwSrGCF+91dNcpeWR
	83g4SpkIeAN+CYwMvbgMoCq0C39/K4IbUz5X7VbTYMl3yAFFL8JqpvFOIT/NRcsBiAST526F1al
	6HGwAA4fCQFgpdykyp4bFGXcsILCEOKCsJvpVKnj3nZ0Teb7fCcVKhmn/iHGM7svBYHhfVHQFDd
	6gAiiEwLD6+aJ43WfE5junpWiz6gFUziNIsCUeZywehHc63EUwUd3Ugy+UbW0PfbXKjTn7G0DCK
	rfOuhT4YbnQTXJRADZsUaUoYkYK5pDcla8gw2DyINKQ50bmuK8iEz33oL90sDC3t1mWl9vew5S+
	Bv76RZRqiUpd76Bdxl+zaA5Lp/ZtEYtk3FfCvnB/ule/ahypGCmL9wsJj1nMe4ORbM0cw+zcg=
X-Received: by 2002:a4a:e90f:0:b0:67b:c368:136b with SMTP id 006d021491bc7-67c22ef5124mr8523215eaf.29.1774282085727;
        Mon, 23 Mar 2026 09:08:05 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:964:f712:dbc7:4119? ([2600:8803:e7e4:500:964:f712:dbc7:4119])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67c252fe793sm6809434eaf.8.2026.03.23.09.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 09:08:05 -0700 (PDT)
Message-ID: <1272b66f-2d7e-4f18-bf00-f49b3c02213e@baylibre.com>
Date: Mon, 23 Mar 2026 11:08:04 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/6] iio: Replace 'sign' field with union in struct
 iio_scan_type
To: Francesco Lavra <flavra@baylibre.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
References: <20260317150316.3878107-1-flavra@baylibre.com>
 <20260317150401.3878294-1-flavra@baylibre.com>
 <4723284d-1e18-4a13-9ec1-878220af257e@baylibre.com>
 <af2128c68d2a14e1eb664ce9dc075ed02b640407.camel@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <af2128c68d2a14e1eb664ce9dc075ed02b640407.camel@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/23/26 11:04 AM, Francesco Lavra wrote:
> On Sat, 2026-03-21 at 12:22 -0500, David Lechner wrote:
>> On 3/17/26 10:04 AM, Francesco Lavra wrote:
>>> This field is used to differentiate between signed and unsigned
>>> integers.
>>> A following commit will extend its use in order to add support for non-
>>> integer scan elements; therefore, replace it with a union that contains
>>> a
>>> more generic 'format' field. This union will be dropped when all
>>> drivers
>>> are changed to use the format field.
>>> Opportunistically replace character literals with symbolic constants
>>> that
>>> represent the set of allowed values for the format field.
>>>
>>> Signed-off-by: Francesco Lavra <flavra@baylibre.com>
>>> ---
>>>  Documentation/driver-api/iio/buffers.rst |  4 ++--
>>>  include/linux/iio/iio.h                  | 17 +++++++++++++++--
>>>  2 files changed, 17 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/Documentation/driver-api/iio/buffers.rst
>>> b/Documentation/driver-api/iio/buffers.rst
>>> index 63f364e862d1..e16abaf826fe 100644
>>> --- a/Documentation/driver-api/iio/buffers.rst
>>> +++ b/Documentation/driver-api/iio/buffers.rst
>>> @@ -78,7 +78,7 @@ fields in iio_chan_spec definition::
>>>     /* other members */
>>>             int scan_index
>>>             struct {
>>> -                   char sign;
>>> +                   char format;
>>>                     u8 realbits;
>>>                     u8 storagebits;
>>>                     u8 shift;
>>> @@ -98,7 +98,7 @@ following channel definition::
>>>                    /* other stuff here */
>>>                    .scan_index = 0,
>>>                    .scan_type = {
>>> -                          .sign = 's',
>>> +                          .format = IIO_SCAN_FORMAT_SIGNED_INT,
>>>                            .realbits = 12,
>>>                            .storagebits = 16,
>>>                            .shift = 4,
>>> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
>>> index a9ecff191bd9..d48a0ab01b8d 100644
>>> --- a/include/linux/iio/iio.h
>>> +++ b/include/linux/iio/iio.h
>>> @@ -176,9 +176,19 @@ struct iio_event_spec {
>>>         unsigned long mask_shared_by_all;
>>>  };
>>>  
>>> +/*
>>> + * Format values in scan type
>>> + * @IIO_SCAN_FORMAT_SIGNED_INT: Signed integer (two's complement).
>>> + * @IIO_SCAN_FORMAT_UNSIGNED_INT: Unsigned integer.
>>> + */
>>
>> We could make this proper kernel doc format with one comment per macro.
> 
> Actually, a set of related #defines can be documented with a single
> comment. I see a few examples doing that in include/linux/gfp_types.h and
> include/linux/fpga/fpga-mgr.h

Fancy. Although, IDEs tend to be able to handle doc comments better
if they are not combined (i.e. getting the docs when you hold the
mouse over an identifier).

> 
> 
>>> +#define IIO_SCAN_FORMAT_SIGNED_INT     's'
>>> +#define IIO_SCAN_FORMAT_UNSIGNED_INT   'u'
>>> +
> 

