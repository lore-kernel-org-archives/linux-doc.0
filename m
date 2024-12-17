Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8A61F758C
	for <linux-doc@vger.kernel.org>; Tue, 17 Dec 2024 17:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734455827; cv=none; b=qYfqdUTvezYSh+/c8XtKgerW3jjTWz6Cdtk/tLenbeQV9UhRBieRAIPK3x4KPYZqE/3zRgr6qZiCE6z/502cw7pNCBubecyeu/+g0wTtJ9Dj1739+Wh8K7uT/x+pdLBymR5cPExVZ4EsEQ9nwDb3JM3m0lKuEjtpAFTeCQjezn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734455827; c=relaxed/simple;
	bh=gt3zUDvSHMdF7hpq+6g1ZwAUEVLTW5inhSYZ9qnrlu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p7C0HQnPhd6pc22B1SjtGsouimssZmuXU7A4wKeXK477kRfqCA98ceywMEqid4jUV4dfjSt9WGArR0NZOe23wBddPsxMfKEFCnI9VCQ5P9mLgwY7fkF0gBhJeQfubgaFFtxSUtdXeUOa/oQw9Fo2nSECMhdhbAXYGcfipFEjDjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V5N/vr3j; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V5N/vr3j"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385de59c1a0so3638648f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 17 Dec 2024 09:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734455823; x=1735060623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XLefb8Z/1dQ9RlGboLgWSvRAfBbTlhXb7ifP2jXYA0o=;
        b=V5N/vr3jvGec8q1i+yJwfz6nsDLGSDLgP1Z6dDduD2iEi7VQp4ylabFmlgg00rvoHH
         K5xxh+op4gg7wVmOyUOLT2a5HEdBmRw7tWFb4O6xsZgdZApaytxnIMCUISeeoeWYkmNw
         dp51fg1Y3a1JBcmAd7v70AR6DB+8SfUMlwgdfJ0OnCAME9GjFro42BWBumSHe0xPc2pi
         zWSC6ixAZXxlg4LAaNCHi29PPbVVXRni/ZEquFk38KtYtB9mB90pXRLPtk46l9wrBiZ3
         4KzCZC18nAmui5VDSZwLIgGe2m6/BxFRU7PDD582hnCGy2QhCBhC+QtE/9n+/+Nz1QFW
         RhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734455823; x=1735060623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XLefb8Z/1dQ9RlGboLgWSvRAfBbTlhXb7ifP2jXYA0o=;
        b=gSsTVH+sLcfdRpbIsb0MyFsIsqfgabAXOIPqbIN9RZREqYfl5Xtwo1i3e2en1RQrzs
         bDfbQ2Hoj4ap8DHOUWTCNrBy1l0OIjQc9inWCB3LuM9GQ2ksKp0zr6UO5MJLCBkSFFX4
         FLCxTtFV6Ul2ZV5XCXi8+YastgiPvgQy3iI2Ih41XuY58bDYPVxcAHvBpsMMf1C3SjHu
         EoKLCqViI4B8ef22e+rs6OdZB4oaQ4/dpP8zDVfcUqL4EBqIPXhod3cNqxcNTwG51XC2
         4BiGKEV3Bbq4Og5GWOvkg1GBbge6mJzuYhwbNI1j8GbNfBaDmLd1iPC9XtNfOsCi/FYr
         g0yw==
X-Forwarded-Encrypted: i=1; AJvYcCVcChUk3UTek/aBeM1t0u5MVxQ+woXJrDR4Y3yF6GLh6bwp+7arREUjwPcOldJ7ugvljxGGDnVAu/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdnDYRxINM+bvfQtKz/X7sCZx7cmIqCuRcf0oek2k/PuCQ7Rky
	NyYRbnzulIOnffckbVGqd+5KIFCE7bCu4gCzSBUvcZEr5gXoqw5AhEyL9m8ZVvjDevAxbSU5eyL
	L
X-Gm-Gg: ASbGncsxKYQ4eQuZI5Wa+Jdy5fZ0gglQy71Jp23G9YJz1iIvR6tmEFKWmcWq9ma4jRh
	vMNwioPcGl1p2qAfqgbgMsAMtgo9XX4z4x1bdQPmbVkvHd8sjFl7tWNhdqopHGQp1BY9wlQQT73
	6SpGhzIIAxGSmfSxy5OvmSINUn8Yp4lWND9OW+tadoHVAALrN6+NbWQuzSzZ3h6vgpRgyiubsZB
	ByvprZ0uJlu+k8aH8RagtLeLYiVIdzcOs65ruIm/eIim9lz9Y/bC3VG5XrW3hjRrDY=
X-Google-Smtp-Source: AGHT+IHW8FLcQvFLOkTfiFxTJUM786W3SLQIjmtJNRIgKR/TJsAsPI22IQ/snWtB5ESeIpY/+CTaUw==
X-Received: by 2002:a05:6000:4b12:b0:385:f1bc:765c with SMTP id ffacd0b85a97d-38880ac1909mr14900187f8f.6.1734455823556;
        Tue, 17 Dec 2024 09:17:03 -0800 (PST)
Received: from [192.168.68.163] ([145.224.66.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c80608e3sm11544818f8f.103.2024.12.17.09.17.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 09:17:03 -0800 (PST)
Message-ID: <50e4aab7-d262-48a0-b956-2c2df0faeb25@linaro.org>
Date: Tue, 17 Dec 2024 17:17:01 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: docs: Remove target sink from examples
To: scclevenger@os.amperecomputing.com, coresight@lists.linaro.org
Cc: yeoreum.yun@arm.com, Mike Leach <mike.leach@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@linux.dev>,
 Namhyung Kim <namhyung@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241210144933.295798-1-james.clark@linaro.org>
 <9e53f5b9-d8a9-46b8-8ff1-7f018e2d9c06@os.amperecomputing.com>
 <24299600-277f-48f4-9be5-cbd65ab6ddb7@linaro.org>
 <75ce4def-b0ca-428f-99a5-19ca98e876a0@os.amperecomputing.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <75ce4def-b0ca-428f-99a5-19ca98e876a0@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 12/12/2024 7:38 pm, Steve Clevenger wrote:
> 
> 
> On 12/12/2024 7:27 AM, James Clark wrote:
>>
>>
>> On 11/12/2024 6:01 pm, Steve Clevenger wrote:
>>>
>>> Hi James,
>>>
>>> I thought I'd mention this issue with multicore self-hosted trace. The
>>> perf command line syntax does not allow a sink "type" to be specified
>>> (e.g. @tmc_etf or @tmc_etr). For multicore, it doesn't make sense to
>>> specify a processor mapped sink as would be the case for single core
>>> trace. A sink "type" should be allowed to avoid the auto select default.
>>> In our case, the default is the ETF sink.
>>>
>>> Thanks,
>>> Steve C.
>>>
>>
>> I'm sure it would be possible to add support for this, but I'm wondering
>> if the real issue is that the default selection logic is wrong? Are you
>> saying the default you get is ETF but you want ETR? And there is both
>> for each ETM? The default selection logic isn't easy to summarize but it
>> should prefer ETR (sysmem) over ETF (link sink), see coresight_find_sink().
>>
>> It's probably better to fix that rather than add a new sink selection
>> feature. Maybe if you shared a diagram of your coresight architecture it
>> would help.
>>
>> Thanks
>> James
> 
> Hi James,
> 
> It appears the default sink selection is ETF for multicore trace. In any
> case, for the Arm® CoreSight Base System Architecture STC Level
> compliance, I need to be able to specify the sink type.

Yep it makes sense to add support for selecting it then then, I will put 
it on the list but not sure about the priority. I think looking into why 
the default isn't working is more important for now.

> 
> The Ampere CoreSight hierarchy is described to the ACPI as follows:
> 
> 
> +-----------------+
> |                 |
> |       ETM       |
> |                 |
> +--------+--------+
>           |
>           |
> +--------+--------+
> |                 |
> |       ETF       |
> |                 |
> +--------+--------+
>           |
>           |
> +--------+--------+
> |                 |
> |       ETR       |
> |                 |
> +--------+--------+
>           |
>           |
> +--------+--------+
> |                 |
> |      CATU       |
> |                 |
> +--------+--------+
> 
> Steve C.
> 

I recreated this in the test here: 
https://lore.kernel.org/linux-kernel/20241217171132.834943-1-james.clark@linaro.org/T/#u

But it looks like it correctly selects ETR rather than ETF, so I'm not 
sure what the difference is between your setup and that. If you can have 
a look at that test and compare it that would be very helpful.

Thanks
James


