Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D74115689A
	for <linux-doc@vger.kernel.org>; Fri, 13 Jun 2025 14:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749825208; cv=none; b=ktE+Sc5Zs4yhU01C2v9QnOgmeG/PEKHWKgaBMWIRPL6zOVNnysEazbEOCfu9PzWl+n9tdFLlYXz1GS1LPFGBOmIL9VLB8I1moS2UOovXztWWhHFmjz3uvkXSp5v3cmJDgixl21udwZYjSIkYmwmUEiBf1A/YIFWel3jNpu+4K5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749825208; c=relaxed/simple;
	bh=WVPjwsbvnCLJBSObgDBQFwcWD+X0aMggdJGhkqv1wBA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HMV23svtmlpjIbJW5Bs2ZgrYarwIsZrHveuJQaCSyesH78SyUo8nBzfrxQ470DQUMGlfFC/3FN0QchJU937vi2NNsCYYWrQ49aKJ7n0v3Kp0jheiBw1OZKyQXc3ZW46k4JTWUeIhG9GxEA6z4REgYZdSgIUCu6RdsfKL/TXtKQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yz5MBPn5; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yz5MBPn5"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451d54214adso18278145e9.3
        for <linux-doc@vger.kernel.org>; Fri, 13 Jun 2025 07:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749825205; x=1750430005; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zgmFLvsdJ6iFhFtAs9sBOHn9N6rEmelJpZm6BimX7XE=;
        b=yz5MBPn5jUlyoLXOCs0LxX/cxZF9wUHfZs4dw/QqAw37A9FRmmJTjfM3dIgQUYMIXQ
         BYby5abjy7njkXV5VQjDdlx7pvCuEylNTRbkdRyzRl5SnMBacc5m+Sfnuh8EkGNF6LhS
         yA2Vq8xqQv5WWKJeK8U+T2MuhyUBpWXgQHs1ZEfCRIhn1uDdwd26TECKQuToWCxeWdVT
         qIjLsIe5TwUCAVIVcPpyZTaodnSDzOQcZZAlT93A/6Fvt0gBsyDgA6Cjtf3u0hQkX+DO
         2fL1HcHj1ghL9WJ1SDaew//d+nTgFF3NtkdS6j9SuTDFwku+XP9c0OlkGvZeF2igAmID
         q6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749825205; x=1750430005;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zgmFLvsdJ6iFhFtAs9sBOHn9N6rEmelJpZm6BimX7XE=;
        b=W8N6O5S86HK0N4tlmX1pl38+kodIWtbRuiXqkOleCFifEySTk4XdmuAyHILL8PXLY7
         YV+NbS8oVLa/sdzCWArnznrhivNXTFkUvzrRzIpxOGI41lD0dzQzhLFjFnj16QobJncZ
         6+b33wSwLQGmw7ErfKfiC+qY7DHxo+mZsgGb6s79rZmFrEom9YSq32OD3ao3dvNUYFf5
         pwPkWXJRQTO0DRaFMfjsKDrbTtRV01fiP94Mqx7jkZta6PKc5fUS3VBH8Kt0YQuisJYq
         tsqPKPwSy8skBU4u3ZKqOmaP7idvBf/YH8FQT97W5i+xHfrnj9kmxvN0exSb+yfAsvEt
         FWFw==
X-Gm-Message-State: AOJu0Ywb7EW4Ps9epcIzmLb1sdAhr//ytbsyOq/sEOTImQ8LoeRwTM6Y
	gkZLyp1A5iS1szE+LqHRRZ2xITHxqsiAAiMmwARgaQ3rxopV09wdRNNmvuwJzgFROQ8=
X-Gm-Gg: ASbGncs2LgkoS/BiRLBg7HIYakGQsoMEM/1SbNj1qPJFLR5OiJe1fdmo3yiQGCDRrq+
	sGB8IienUY12AkuGpMRh2/HoILb7Jf/mON9OgXxdDe57zsLwPfKn8+n9yJ4zzk+8XNQWegp2Hss
	36wcixR9t9w2gjlF0IxGwk5cowI/IiYInAI1qiqi3vbrls9JuaMJSbt2i4oRsZ9daYYTHsxYfFN
	uGh9JwgZpPA6Svi0VpuGKnFPk31G6G312VI+tFrKb31f8u6DpPkqp9uQbA133GMgNwzq7ftWoxO
	K1T32EgDesEamKYa21UBwnPM5pihR/5lzFqDXtPvnMtWPCSSYdQ+vKziU5QESXyxK9HzQ6DAZmM
	gj3RCTtCMRenxxnZR8KZdnNhMnxSagxKT1TOwdRs=
X-Google-Smtp-Source: AGHT+IHaqiDiPxrZkJtlgp01dU1UfqfhmbQn8nOwH2pzxfHuCnqJZ61g8lNlq6CgU9ZCy4LVF+0kjQ==
X-Received: by 2002:a05:600c:4f56:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-45334b153aamr39047735e9.13.1749825204341;
        Fri, 13 Jun 2025 07:33:24 -0700 (PDT)
Received: from ?IPV6:2a01:cb1d:1aa:e900:b5a7:96eb:d1b6:fda? ([2a01:cb1d:1aa:e900:b5a7:96eb:d1b6:fda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b798d3sm2516759f8f.100.2025.06.13.07.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 07:33:24 -0700 (PDT)
Message-ID: <f916cf7f-6d0d-4d31-8e4b-24fc7da13f4d@linaro.org>
Date: Fri, 13 Jun 2025 17:33:22 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 09/14] genirq: add irq_kmemdump_register
From: Eugen Hristev <eugen.hristev@linaro.org>
To: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
 rostedt@goodmis.org, john.ogness@linutronix.de, senozhatsky@chromium.org,
 pmladek@suse.com, peterz@infradead.org, mojha@qti.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, vincent.guittot@linaro.org,
 konradybcio@kernel.org, dietmar.eggemann@arm.com, juri.lelli@redhat.com,
 andersson@kernel.org
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
 <20250422113156.575971-10-eugen.hristev@linaro.org> <87h61wn2qq.ffs@tglx>
 <1331aa82-fee9-4788-abd9-ef741d00909e@linaro.org>
Content-Language: en-US
In-Reply-To: <1331aa82-fee9-4788-abd9-ef741d00909e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/7/25 13:27, Eugen Hristev wrote:
> 
> 
> On 5/7/25 13:18, Thomas Gleixner wrote:
>>
>> $Subject: ... See
>>
>> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-submission-notes
>>
>> On Tue, Apr 22 2025 at 14:31, Eugen Hristev wrote:
>>> Add function to register irq info into kmemdump.
>>
>> What is irq info? Please explain explicitly which information is exposed
>> and why.
>>
>>>  
>>> +void irq_kmemdump_register(void)
>>> +{
>>> +	kmemdump_register("irq", (void *)&nr_irqs, sizeof(nr_irqs));
>>> +}
>>> +EXPORT_SYMBOL_GPL(irq_kmemdump_register);
>>
>> Are you going to slap a gazillion of those register a single variable
>> functions all over the place?
>>
>> That's a really horrible idea.
>>
>> The obvious way to deal with that is to annotate the variable:
>>
>> static unsigned int nr_irqs = NR_IRQS;
>> KMEMDUMP_VAR(nr_irqs);
>>
>> Let KMEMDUMP_VAR() store the size and the address of 'nr_irqs' in a
>> kmemdump specific section and then kmemdump can just walk that section
>> and dump stuff. No magic register functions and no extra storage
>> management for static/global variables.
>>
>> No?
> 
> Thank you very much for your review ! I will try it out.

I have tried this way and it's much cleaner ! thanks for the suggestion.

The thing that I am trying to figure out now is how to do something
similar for a dynamically allocated memory, e.g.
void *p = kmalloc(...);
and then I can annotate `p` itself, it's address and size, but what I
would also want to so dump the whole memory region pointed out by p. and
that area address and size cannot be figured out at compile time hence I
can't instantiate a struct inside the dedicated section for it.
Any suggestion on how to make that better ? Or just keep the function
call to register the area into kmemdump ?

Thanks again,
Eugen
> 
> Eugen
>>
>> Thanks,
>>
>>         tglx
> 

