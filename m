Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3101F8691
	for <linux-doc@vger.kernel.org>; Sat,  3 Jan 2026 06:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767422274; cv=none; b=bFalUQQYTSOwgrQ+008sct38UQeqXkGPOXFo47FlwDDx3RgsjHMoNDJ971/fjCr2FQpFLUahv0CYNSlajFRwPexWu5JXftW3PX0YlTeODvQMuicFcJMSKIiDlCb65nJh5Jl3KQQB16pdjya8TBIFJS8y9/vNpXhwW6ZTu20Zm9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767422274; c=relaxed/simple;
	bh=/nMoLJ/dyPVGEpQSrvqRiwlY70NtMwi/5VrgfX+iNVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q0v3Ubd5WXNGCPQHco4AqpzlJYitBcR2thR0aESEzou1UY6BAV8gyAB4r9GtMvyMS40LDV4IR9lkAXDSroO3YX/8BxC03wkqTI8Vg9ewFZuPrZPfkG15oO4194eXQt2Xoem3J39pCKmqV2pbaX+LfeGQnPTmykBkHw4PprOozwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WQDJ6q41; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WQDJ6q41"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso13105254b3a.3
        for <linux-doc@vger.kernel.org>; Fri, 02 Jan 2026 22:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767422272; x=1768027072; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ByoD4jWST79BUe/fxqijcSiTeboyFHDF95yg254b5r0=;
        b=WQDJ6q417xM1akNGv/vEXpgRcOAE6CQ+684eDDzE+IEHl57UMbXSwjRl31sEXaX2zK
         r5/G2dUfXLGx7UnJ19NQXhC4fOP7+FtKnpoH9UJTLB/NqeJKFdA5ubIUAqp6TJkI1NRK
         edfwEYIxaUWZwYhKqcfG1BXSezqmkG+nIayYooZKzWf6dzyjvQXTJU9kGI5LCKbMphSO
         3XZUeeuY3lQrm8K8Pqg1MtP7zXE+/jIKFlm4Gu19eLpEgf8tg3T++2O94bDjvs1+Oi1h
         ll4DnoYyTrI4sHmAocP3nJmdlQ/MVEPrLugxcpIWd6A69yJZc+ekktm6h6pfSROFeWDs
         gReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767422272; x=1768027072;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ByoD4jWST79BUe/fxqijcSiTeboyFHDF95yg254b5r0=;
        b=YAi0ggNzAGsm6sl12N1iItm2xwYnMxCVZ5DBO9XN7VKlOVp1XiYc0FeTMDPg6x0ywW
         tvmEKeVqjyyLhpQ/jxT5HhGgxJ8k6mAk5PtzG7Oq1qEl9MhU7RqqIMXVinhbpLX6fXUN
         QT/y7W7aF7zR2nULO1FJmAfjlqUSU87AscyiRSG1cElEkvwHanSN1O/7xw078Jk/U4N8
         clha989pdJ9eLs1HICBAEw2Ho3ndH/ha41+Nc0i+w0/L5xYdzk4A4ltJBpXkvpWHuKB3
         +qNUOL/SWNfYNkzDjuDODmNbbH4uBs6jeBBY9qGaLHewvbgqJ4SXkspgH7bpi98hKzPM
         q3SA==
X-Forwarded-Encrypted: i=1; AJvYcCUgO1d4cIwP6Ob0Bth4mbyLh+SEz0nP5dhCkaTo6E3i79VxZiMVg+MhUOH3WlBRiMVudT4GsgSOuTo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyZ92a2u4QMDnkpNUPRd5wecmA32ZmxaE+gKEv1t7cgiPVGcoK
	HPkd+fiURBulK1i4+pCcWzBHZj2kbob1giqElyhK5i3ZKPFloTOUieeq8xaI/nExFkY=
X-Gm-Gg: AY/fxX6cmawqu/NMRdM1e4SwvAMc7BPtnch82Q2w6i9v6yNaqpxPQKqVFvvsOOkwC37
	YhJBFzzFj3ChUtDbQ+JRKYPnu8uZlFQ38aPS3hgtmrpPA6K4vNq1I/lWf7dgheyP5aNgIQiJfVA
	ATRz7D/VZ7hFiUJreUT6zahTewakvAIM76616g94b2Xigx36oovJPAeppGS+L+4wHvGbjOmcvKc
	ofBCayk2qZTJj7WgqfNpM9tkwQmh4L6FkT5CQ6LoYCGi8q8iBJcKfILjGxTGIRq/DEDSJXhbzmj
	+LeHkhEY/hugfZIT/HNBTqmjWska/9FEy9V+sLStVz/ITrgqAl8OoxysGQ9/pYZxF3QBeW/OArK
	LXyCcfcsjAxrzWflT/cqOMbXAmbu6XGbAf1oi99hhLIOoeKnJGIwG58lA3V0wNQFejyC1mQfPKz
	m/ZW2qwqoX79W0N54u0RRFJPTPubIwmFXu+jwbU2LKglwBWdR3pi3FsTNOo9cLFRJp
X-Google-Smtp-Source: AGHT+IHOn/shxgu6O9AbZYxbJun3BCH+nZYMReTx1ZUY3Ku/Rcc6T4HDI4a+cvUWlCqKmwFxIHrgIA==
X-Received: by 2002:a05:6a20:12c6:b0:366:14ac:e205 with SMTP id adf61e73a8af0-376aa8ffdb4mr41042704637.67.1767422272279;
        Fri, 02 Jan 2026 22:37:52 -0800 (PST)
Received: from ?IPV6:2405:6e00:642:d187:9f0f:f4ff:8fd1:e7bf? ([2405:6e00:642:d187:9f0f:f4ff:8fd1:e7bf])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7961c130sm36229897a12.3.2026.01.02.22.37.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 22:37:51 -0800 (PST)
Message-ID: <8c7fcd35-3b29-4621-b4e1-df0c88a00cba@linaro.org>
Date: Sat, 3 Jan 2026 08:37:41 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/26] mm/numa: Register information into meminspect
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, david@redhat.com,
 mhocko@suse.com, tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-arch@vger.kernel.org, tony.luck@intel.com, kees@kernel.org
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
 <20251119154427.1033475-20-eugen.hristev@linaro.org>
 <aVImhhgEsHInebeh@kernel.org>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <aVImhhgEsHInebeh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/29/25 08:58, Mike Rapoport wrote:
> Hi Eugen,
> 
> On Wed, Nov 19, 2025 at 05:44:20PM +0200, Eugen Hristev wrote:
>> Register dynamic information into meminspect:
>>  - dynamic node data for each node
>>
>> This information is being allocated for each node, as physical address,
>> so call memblock_mark_inspect that will mark the block accordingly.
>>
>> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
>> ---
>>  mm/numa.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/mm/numa.c b/mm/numa.c
>> index 7d5e06fe5bd4..379065dd633e 100644
>> --- a/mm/numa.c
>> +++ b/mm/numa.c
>> @@ -4,6 +4,7 @@
>>  #include <linux/printk.h>
>>  #include <linux/numa.h>
>>  #include <linux/numa_memblks.h>
>> +#include <linux/meminspect.h>
>>  
>>  struct pglist_data *node_data[MAX_NUMNODES];
>>  EXPORT_SYMBOL(node_data);
>> @@ -20,6 +21,7 @@ void __init alloc_node_data(int nid)
>>  	if (!nd_pa)
>>  		panic("Cannot allocate %zu bytes for node %d data\n",
>>  		      nd_size, nid);
>> +	memblock_mark_inspect(nd_pa, nd_size);
> 
> Won't plain meminspect_register_pa() work here?

Yes it would work, but as explained in the other email, it would not go
through memblock API.
We can continue the discussion there

> 
>>  	/* report and initialize */
>>  	pr_info("NODE_DATA(%d) allocated [mem %#010Lx-%#010Lx]\n", nid,
>> -- 
>> 2.43.0
>>
> 

