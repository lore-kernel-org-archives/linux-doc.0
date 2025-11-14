Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE4733D6E6
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 15:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763133694; cv=none; b=jH0R8Z3Cn3K94SIbAPvCM5vzs+gCUEsC+n+7pLSgxTMOSD/HUwBboXKeZmS9aPjKEy9Kitskc+nafQ4mtB2h3tS8LeGi9NmHPGf+rxOhZACajbHO1c/g+B/ZUKP08CFCE9BBqEq2YK9ykgTrpwz6AhlpAHYbLUw3fLAUJObuHVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763133694; c=relaxed/simple;
	bh=MrG1YgyG9c8+KsutI7GttgCEPGm1ZrzOq7F+ESwUzzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=shFsyIyb1A4bZ25LneUkRrgYDu/88n/9jwX2bej0kvMubcFL8KzbxnXKslt5a3KuRmgYvnX3ex//fs9TTVp2jWhNq0hLumfJM6a7U094COw1CS6PX6CpuAdXgBm1Ch+h8Bcgen/DNa7AJHXzz2xhmrb1zqcrwhIKcTqq0O1PMa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X1E6j10Y; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X1E6j10Y"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4711810948aso14627475e9.2
        for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 07:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763133691; x=1763738491; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=spQr/NA76+OWDiEmTNKSTkOX2yR6kDRejGdoeHR8vFc=;
        b=X1E6j10YJ3DhNpyWZOJSwcscsV+2yBGjTEoHXbkcjBTuZ7SDN0PSslEvJIbQoHK9ix
         aCERYKI8wBV5TEQQFohN1psRZSff6yWZu/mNWCa901En0Te5OvXZDXMkf9AnwOTVyPB+
         GO8qBgHkOQ/FmGbUXZG5LMwGnLAV3Rs2r/sUhiifDk6TTvGNIIRFMaeWkKnYjAmVnVS0
         GE8Gemqv5FxKOmgQv4AUZD2IcFnDKaC3oxD1u0mjncm5IYoKIVkUxr6Q0Np4Pn1oT2h/
         /JHWLcPa9fPUS6GkuOjKpxHQ6qGqbin45/Uhn6PGfS/8kuSyTrvUNVk0FvpEBkmyqTSt
         MgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763133691; x=1763738491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=spQr/NA76+OWDiEmTNKSTkOX2yR6kDRejGdoeHR8vFc=;
        b=dvTqT+d2+h11uQt7xyotEWvmwpgk/jEVXAmrFPQMzZRxaBDT9Xw0mIPc05yKgJWzyE
         ZQffCQdMs7ZnyoHTayn0Q+V5I6MahiqSn7NY5NVqs1Jq3hFJg2LNdeNdWl5J1VEz7REb
         Z2GreEmH9VlnFew2A7XGZowNnva6MNQiNO6nHisihJnP0tdlqRgAuuzGsVTEmGM6Dt8L
         MeCqdWhCDoDHTvbaL3NpbTJZx/rGyqRVSQ/4lBjyEYmW9XuZFDl1Z6KOYjkeLa6iaN96
         1Gxo0h6fr4No2GWZYII6Br5/EMo2ZwEJ/509qFmeNzOKhg3XVxnHsE+Ogm6BnqNwxVeq
         27yA==
X-Forwarded-Encrypted: i=1; AJvYcCUOcrGpa4BW/P3PlcJdc5xMnO5rUeGPTt/hEjBS6dqhaNqQQI4CdSERx3FgpHsSN8gpDD9E/pQ0gSc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoFdy7Hn0O3hpABCclYsPjZwXA5FDcyeT50wV/9gDbdQDhUOxv
	VXjbu2jXIXMFeGfHeCx9vAKF3ct2LkuPDUW53UcUlkTL8F5q5n6p2S+tg3+h6KYnwfY=
X-Gm-Gg: ASbGncuuEFcObCjmN+UPhg1nVOHIBiy2VQUzmVUcba9h71thR8SOvJ97PB5dfjWzYv+
	56XbtCikQ2WwNDAEW+zZnwZFuYkHWkpP+mtxxsp30OhyVdB58arOaVim1iVn9cE5YnPvjdA4KRm
	q7UePQE6+QTskOlHM9s/VWQiyJnR0dVm4BHW5YtxRVkU9MuDmtUzSlDttQKvbjO5nuT5PnH+noK
	elAAZ0eWid3PvPk1c1QnJsvPgusZHifSoG7YucOgXo5brkXg34/k/4U6m4WySjO6bhHUJosSwsn
	Rgh57ipB7jli6kLjdS/IcNBXrVvjRTMiII1O3/4Ha8WwqOBuXEh8XsgZK0wg6jx6rsHmNOz/FT7
	jydhVphiKMPCxgMSHDQxmNRP4cgy9Djhe22NzaTLV/5fyhehvOZtGu1KwFm9GEWYB0DmUeH4YfE
	Mpbl/my3S+ZPFDP2jc
X-Google-Smtp-Source: AGHT+IFF1t1CoxEZ5R530Db9r2XX566FpGv1PPCAcKESuGedkS3oZfaEcKSquxVavWe1ChO/EKFlrA==
X-Received: by 2002:a05:600c:6288:b0:46e:4a60:ea2c with SMTP id 5b1f17b1804b1-4778feb83eemr31863195e9.37.1763133690910;
        Fri, 14 Nov 2025 07:21:30 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477952823d3sm12900885e9.11.2025.11.14.07.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 07:21:30 -0800 (PST)
Message-ID: <a836bd2a-ef60-439b-9ad9-10e5888f22c7@linaro.org>
Date: Fri, 14 Nov 2025 15:21:29 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/13] coresight: Don't reject unrecognized ETMv3
 format attributes
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-7-165ba21401dc@linaro.org>
 <20251114151810.GG3568724@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251114151810.GG3568724@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/11/2025 3:18 pm, Leo Yan wrote:
> On Wed, Nov 12, 2025 at 03:22:13PM +0000, James Clark wrote:
>> config isn't the only field, there are also config1, config2, etc.
>> Rejecting unrecognized attributes is therefore inconsistent as it wasn't
>> done for all fields. It was only necessary when we were directly
>> programming attr->config into ETMCR and didn't hide the unsupported
>> fields, but now it's not needed so remove it.
> 
> It is fine for not validating all configs (please ignore my comment for
> checking all configs in my reply for patch 04).
> 
> I am wandering if need to remove ETM3X_SUPPORTED_OPTIONS totally. I
> saw etm_enable_hw() uses it to clear config bits, so it makes sense to
> keep it.
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> 

I tried to remove it, but as you saw it's used to clear the old config. 
It wasn't obvious to me if there was some other state in ETMCR that 
needed to be preserved, so only selected bits are cleared. I assumed 
there was a reason it wasn't just overwritten with config->ctrl to begin 
with as that would have been much simpler.

There wasn't a comment and I didn't want to spend much more time digging 
so I just left it. I think it's harmless to leave for now.

>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-etm3x-core.c | 7 -------
>>   1 file changed, 7 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
>> index 4511fc2f8d72..584d653eda81 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
>> @@ -333,13 +333,6 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
>>   	if (config->mode)
>>   		etm_config_trace_mode(config);
>>   
>> -	/*
>> -	 * At this time only cycle accurate, return stack  and timestamp
>> -	 * options are available.
>> -	 */
>> -	if (attr->config & ~ETM3X_SUPPORTED_OPTIONS)
>> -		return -EINVAL;
>> -
>>   	config->ctrl = 0;
>>   
>>   	if (ATTR_CFG_GET_FLD(attr, cycacc))
>>
>> -- 
>> 2.34.1
>>

