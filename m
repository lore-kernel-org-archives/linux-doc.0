Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F25393DD2
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 16:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763482538; cv=none; b=IsJg5AlnE20cUvhxnGrkA6cG6nJaSlvVdNvB7G+42PI8tA4H38C7J4hIqkclcYhGgx5RoI+vj0Td6v7CP7hon0J74N4L9z/BBSyWUbGw7YJPxzDoZQ6LBO2kfdxTvmdOMbAUROuSWwQI/cGrLmNrZyJsi7VTDIc6RCqUUG1K6Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763482538; c=relaxed/simple;
	bh=CH1QPu2GqTouc6JmQl/PvcmV2Q7kfaSd+QJjaITvltQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nAp+iQRVPENTD8bm9vOG6r5i+glbk7UIbn/55d9a84IQRw9eT3jVJujSQajjPq+00zPq+HiCtpoNrXLooeuO40bwYcfoP7YHgMQd8t7ZUrRu85YUoqm7NyToCpZmncaP6NTJ8ywb1IdNbWd6R7obvEak8XmqINdVoT0qKsTnCgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rpzqsYzp; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rpzqsYzp"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477a219db05so17490265e9.2
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 08:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763482535; x=1764087335; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gJbSaVfQsu8Be7gi3N3Qdz/1czwLOuz34Pc1Hp3AGq4=;
        b=rpzqsYzpKadJvYBuNJkOf6nBFZkbzz+AVM77nHEvA4TCD9pIKsvH9l0kK44EYAy3Zw
         Pi0YE3LcAac5mwvw5PFynnQNJWAxtoY9J9fgh9MuQq1gbn7RxPDeWXTgmkxawEAy7hyF
         NBA89cVfjNDVYim0nNt/pUSNwhKa7UzpOv2jGZ3QCyXxSTrMhWKXZWO4sd9s/cZm5iRC
         NXGYPYOOrSPJJB6ZvP7TzvL8VenRk3QlePQfkaxwx7jc9r5Lr32k335rhXcc5FI7KYqd
         3L4q0rUyxkY/nL4ieUx3cT6ydI5OtibExcKNP75j4tjWdyQxPq5qDVGHA0nuD7BHv+9b
         zcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763482535; x=1764087335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJbSaVfQsu8Be7gi3N3Qdz/1czwLOuz34Pc1Hp3AGq4=;
        b=SjpJdF9jsYRTzg2W+o+QbjrgtY+Q6MzeNNOVrEiH7g7WBzSLVudiC8wKTAQ/9vybme
         3o2JFjvhGnbZ7ipRVHF3nTqXXHaj/88CFABHbV+MRl/jAphdAWht7rA7D4x9WuWUq0Ji
         vJD0asIA5s8IVI8txPcmgY07jnYiM9nzHIAEII5a4ZNxX2J7hE/c6HxnDzSxTk2ZQjMa
         XAFewQXmfweUjPf+1UNXV1lMSuC7afq/tkxK1jkILZAtH4SqaMcD91wR9IVZhke6jm1E
         Do7j8LUxENGviYRoVjeOPfES0V3EX9UlfrjsABBPApWw3jt7iQqq3fgEcuK7QtG1lotp
         +edg==
X-Forwarded-Encrypted: i=1; AJvYcCXq6xjAcOpSgV00wBB0sWDVb7/Sww5F9WsrSR+2SKR4RpktkRQ1gCqfM9lmx6R5NAQnXE8bEHnHXHE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSaV1u3xz7bMNV0C76gHw1yBlItBX0LyFl45xj0Eeip8yD/wOl
	trbn5Obj3ll5BmzQNXGLjh6jWPvueYqPSERdZs5v7oLwuB1tI7b1hC5Zwv8USwastkM=
X-Gm-Gg: ASbGncvbGUun+k2fgSVELa+eF9wz5c7mWBh2jYVWBnUGDXDiLUlUgol/05/0RDqD48/
	YwPw+0zAio8xYgQj9OPW0AzKU6GOHzj0hNrYe70X1rxWeknmCnI55bB3c3JKfY2yWQQslZUkiEO
	ntxVVkgTVAOVIil0uTsTa7XTFTlHvTLWdBWTXRUfphTNzzVZQ84tHg607cD90SM5XrrA6UhBFt6
	Rs3CrrwzUE/QXsI64WOgRjUOsHO0s17kNdbV5rgK+SObID8MAydHdgIjLQq+yhivuvqhDtzG6c6
	XXwJOoCV1I8PEPw+e203c99DcQYo8j8ahgUnH6u/kdrHJwb4cjCnQPW/TZw0jnS8IJbW0gCfOz4
	4wx1Z3udDaaVHIk1lfZnTTK6fyDEbM1pM+9YYdGLM5p1fjHGjcBC7KKoU4Vs11FJErUCczw3sV4
	FKsiP3CwUMCEemZ8FY
X-Google-Smtp-Source: AGHT+IFNyjTOc2O+E2kBBP4fBbkcbWJS9AWlQK7jCUXfXz1xZUJdgxvuleAKgQPv4ma+ub1UTOpP7g==
X-Received: by 2002:a05:600c:a43:b0:477:3543:3a3b with SMTP id 5b1f17b1804b1-4778fe59f2amr146578905e9.6.1763482534892;
        Tue, 18 Nov 2025 08:15:34 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a974cdc8sm22479365e9.2.2025.11.18.08.15.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 08:15:33 -0800 (PST)
Message-ID: <4003a48f-73e0-4296-bcdc-6a975807c2d5@linaro.org>
Date: Tue, 18 Nov 2025 16:15:31 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] coresight: docs: Document etm4x timestamp
 interval option
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-13-165ba21401dc@linaro.org>
 <20251114180503.GM3568724@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251114180503.GM3568724@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/11/2025 6:05 pm, Leo Yan wrote:
> On Wed, Nov 12, 2025 at 03:22:19PM +0000, James Clark wrote:
>> Document how the new field is used, maximum value and the interaction
>> with SYNC timestamps.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   Documentation/trace/coresight/coresight.rst | 15 +++++++++++++--
>>   1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
>> index 806699871b80..80b5ed09d69b 100644
>> --- a/Documentation/trace/coresight/coresight.rst
>> +++ b/Documentation/trace/coresight/coresight.rst
>> @@ -613,8 +613,19 @@ They are also listed in the folder /sys/bus/event_source/devices/cs_etm/format/
>>        - Session local version of the system wide setting: :ref:`ETM_MODE_RETURNSTACK
>>          <coresight-return-stack>`
>>      * - timestamp
>> -     - Session local version of the system wide setting: :ref:`ETMv4_MODE_TIMESTAMP
>> -       <coresight-timestamp>`
>> +     - Controls generation and interval of timestamps.
>> +
>> +       0 = off, 1 = maximum interval .. 15 = minimum interval.
> 
> I am struggling to understand the "maximum" and "minimum" usage here.
> 
> Seems to me, you are saying:
> 
>      1 = maximum frequency .. 15 = minimum frequency
> 

Yes the documentation was the wrong way around. Will flip it.

>> +
>> +       Values 1 - 14 use a counter that decrements every cycle to generate a
>> +       timestamp on underflow. The reload value for the counter is 2 raised to
>> +       the power of timestamp interval - 1. If the value is 1 then the reload
>> +       value is 1, if the value is 11 then the reload value is 1024 etc.
> 
> I saw your replying to Randy, yeah, the formula would be much clear.
> 
>> +
>> +       Setting the minimum interval (15) will disable the counter generated
>> +       timestamps, freeing the counter resource, leaving only ones emitted when
>> +       a SYNC packet is generated for every 4096 bytes of trace.
> 
> "every 4096 bytes" is not always true.
> 
> Isn't this defined in TRCSYNCPR.PERIOD?  Maybe just say "... for every
> period of trace defined in TRCSYNCPR.PERIOD", or even more general
> "... for every period of trace".
> 
> Thanks,
> Leo
> 

It would only not be true when using a custom config. I can say that 
it's TRCSYNCPR.PERIOD but that the default is 4096 bytes.

>> +
>>      * - cc_threshold
>>        - Cycle count threshold value. If nothing is provided here or the provided value is 0, then the
>>          default value i.e 0x100 will be used. If provided value is less than minimum cycles threshold
>>
>> -- 
>> 2.34.1
>>

