Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5F433D6C5
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 15:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763134478; cv=none; b=bGsjVkL4U9DvwiyfKUWfGwM78bVEDv8AYlHl46Y3IoyDRKayCubaEj8l6hpZFT4pwkgELZ0TlaJx9klUwPOWHn4IqjGtRcyk+v9iSCHUVTRX78PlWv8eKRce2qIdKgU7NEt8Valfb11ZvuR+Ox7o547eKN+taqoCfgamJPhu0oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763134478; c=relaxed/simple;
	bh=ZQz2FMkTmiCawZ4J2vs+T5KKCZmjDu6DnoRQcKwN8LI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oL8EdUGjCQMspOMgTFoiNNznuUQX6bSybR+Lv6Z00bAAhpMqNoFAthYLzTwBIqsNGl/YnUGz0nm2Lm78dQU4yGlOEyBCjfw8R0wzNcX0j1GyKk0CkK2rpby/hZcOPsfsrtLM/jUnlAHHsiRTu9jWzjpOiVD6Y47S+YVmHBltsfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PSYVDBRh; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PSYVDBRh"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b387483bbso1765739f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 07:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763134473; x=1763739273; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C3q07i2Mxp8ymZccHYSaVs1bYwvtotulPZj159o78ws=;
        b=PSYVDBRh01XgyPX+I+CPOQ1jT9MktzNnpY7yG7BYDFnqKiHXq7Z4nWIMBHNW33zYqC
         fIV79VH95W7a6UbAzu75IhW9RjEqQqT0uLYYBwHQdH2fY2YI/2RWpRni8PopTIfPiLol
         pcMLTyppRIVKVikwLrnC2Bs3OQdlZ4OOanBLZmfJCmElq5au0OrymNA5SW4YNqj34rUL
         FDyGfsiaQpZ+1kFlubLdEeG9aXIyA8NpX/zrWJ2eiWdAlkelcGzgDJlVLZm1XpgEJeON
         53UD3HhLlG233WIhL0m5iazmkSCOkWo+Y/b/5rFrP3bsOHzhsppZ/NocUWb6AgUe9CWB
         dWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763134473; x=1763739273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C3q07i2Mxp8ymZccHYSaVs1bYwvtotulPZj159o78ws=;
        b=s1SfL1jbIY7O6dAQhQpjVJqQEHHX1fh1/vQONFtJOd1NGc7DnFkfpcsNO0QAfLwiJ3
         AOGCb6IGFFcZjg9qrHfAUb+HatTMTpLKOGSmHPIWuEN/azQiwtPOJfQKe8Zy/xqvBMqI
         VdVOevZuhboKKcEMKTRtc0lNvYqlgNNgs+t9wDtuzFkAWX/DnqEWCLErV2zd7bZUzONX
         T8QcwI3d9cqHz32Jy+E3YYFIg75c7JMaKzV4eYH7XThSkXYoBbazguVRFD89NiP4O+GZ
         GfFRdGZkQyk1X6/lGuBnA0W0B7LcH7sy4sda2C6iOJaNvIxpGQKK+5pQSlhmKzJCCM3q
         qM7g==
X-Forwarded-Encrypted: i=1; AJvYcCVg0JxbXLo8x2lUk1N5KiVK2zwXvzR+16rFfUejF+/KpVHGOXrpgel4gY4CnsvpHQmccMjlZUxVcsA=@vger.kernel.org
X-Gm-Message-State: AOJu0YypWoQo2EtetukiDGzmsv7cgMwubvUWKgtLvPvzvPQc3qc0Fdkc
	McSItbUN2ktmpETcA9wSbYDJtcgjGiMWBxLD8scgj4i3hfyHRx2K5co+V2Pst4upP/vUHRi7snX
	G3oorbjY=
X-Gm-Gg: ASbGnctPhwhvIjc13Wxkf8Xo4ZpINlGgex/iTE8+Q/PEfyj9k6Icds8A5rL3NoqqhZQ
	3xH3CxRxWGn0O/Ouhc2xr6yu+rBG2ALyIUE7PR8/0wdiYBsgsyd58q3J5fLR7/hvagfTzkk51+x
	vslNZgZCTR7bl50PhqYYYAqtRpNP0mLuThaFTQ+cAG96Elbx7HmvlASo3GJbBfCkssnboR25a3J
	Q4EvFj2jHdvnpnbAs7zJKqBxtakSsA23gqJ4uBcjIiuFoqG97nPIYKQGzskxVucYU/CJRW023cb
	lDntnfsHn3ZdMv7PJuCh7JLX1mawkIxjE8umyx3Tue3iqAJxoDcgJSJGeZiotNPMW9nJIhW3UW0
	QnVfaZCU8zckJwMeDZdMNpA5VI3moWxoI0LUDN6SkphTypfHTZuMQI7GzJVzh72XZu9Ff1aj5wf
	X3ndBtkohLp6MJB61G
X-Google-Smtp-Source: AGHT+IH8FrMnIJiG2DgEll/+zhTyysVGVgx50Ww0DSAImDg/dmoGOLNaeuBBspK7MALsggi1sXKBPA==
X-Received: by 2002:a05:6000:2509:b0:42b:4081:ccb8 with SMTP id ffacd0b85a97d-42b5934253amr3564970f8f.23.1763134473333;
        Fri, 14 Nov 2025 07:34:33 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e85cc0sm11019027f8f.17.2025.11.14.07.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 07:34:32 -0800 (PST)
Message-ID: <0d2d2660-7552-4cb1-b974-87f376f153d9@linaro.org>
Date: Fri, 14 Nov 2025 15:34:32 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/13] coresight: Interpret perf config with
 ATTR_CFG_GET_FLD()
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-8-165ba21401dc@linaro.org>
 <20251114153021.GH3568724@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251114153021.GH3568724@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/11/2025 3:30 pm, Leo Yan wrote:
> On Wed, Nov 12, 2025 at 03:22:14PM +0000, James Clark wrote:
>> The "config:" string construction in format_attr_contextid_show() can be
>> removed because it either showed the existing context1 or context2
>> formats which have already been generated, so can be called themselves.
>>
>> The other conversions are straightforward replacements.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-etm-perf.c | 18 ++++++++----------
>>   1 file changed, 8 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
>> index d19e2568a0d1..7272e758aebf 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
>> @@ -80,12 +80,11 @@ static ssize_t format_attr_contextid_show(struct device *dev,
>>   					  struct device_attribute *attr,
>>   					  char *page)
>>   {
>> -	int pid_fmt = ETM_OPT_CTXTID;
>> -
>>   #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
>> -	pid_fmt = is_kernel_in_hyp_mode() ? ETM_OPT_CTXTID2 : ETM_OPT_CTXTID;
>> +	if (is_kernel_in_hyp_mode())
>> +		return contextid2_show(dev, attr, page);
>>   #endif
> 
> As said, this function now is only used for ETM4, we can remove "#if
> IS_ENABLED(...)".
> 
> Otherwise, LGTM:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>

Unfortunately it's still needed to make the build work. 
is_kernel_in_hyp_mode() results in an undefined symbol when building for 
arm32 so it needs to be ifdef'd out. I can add a comment though.

