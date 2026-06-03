Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8893E480DF0
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 13:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492242; cv=none; b=a9+K8jVHqwxGoHqRSLxbN3NvEnXekg0DYUcRlgg67FHqKIFy9bahMwz+H2H/yGh1jNsAr9ONhStyW9/huO0auZe5bPDjh/YKvq7PRxFFyBXHaRGYDv7zCV2uz5MU+Aeeu2QBI/Ec25ai+9GGoCxaYnCvl4lHA0uHxKjdjhpXucw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492242; c=relaxed/simple;
	bh=DA2FW+m2bWueyUDMLsGb7KZj+YBbfbYQwznE2VUZHeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=arf2aJhmc0sEPjjIc1UXz2e0rdAabRUVfvAHItTeutdOLq4mc88zhOjo2s6TiOvF5Is726/x1sEFryMelnejRGETI4JO7cS1T1TI3ihFtyXZ+umYZ4AlFwSorIfGLHPyyusZjqMR7vYkFkqj7OYBHBNSMKA3CtjHXJZSJO2+NjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tzOZ5zSw; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tzOZ5zSw"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bec43ee8ff0so111247466b.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 06:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780492239; x=1781097039; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X1Ude0q8UJNEq/jv9daxrUZHrb0trlAcIj1CVfNsKe4=;
        b=tzOZ5zSwVVEsQSIcpKmLO1Z47lE42mK5pFQSe8jtORpBnPY/hute9iWahmsiIAmGV1
         OrjVeFrqPgaSXPXiV92pmUj/Kc67Wo9wK0E9asWP0yJf05LrbFM4CHFX6+wjKIKb8d+e
         v/paP1p/I4CiwvoAt7lSnAIYXHBamY8cOSqgYFu2+2Pg8XVnQWbUDWtNKiZmVM8aLAuS
         Ef6/InC8nNsu2D4ZSmR0R4FzQNUmefTb8reqLWDfJQ6GqKnHfjbQZxM2guWOZyy5umnL
         H6xg313ByCl+bsbcneWHPVae38sEMxokG1iwSsvlOjsNYLlhgqqaZ6Qb3Ka0Tq4gcrwA
         E+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492239; x=1781097039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1Ude0q8UJNEq/jv9daxrUZHrb0trlAcIj1CVfNsKe4=;
        b=j+jmnbMlCv5QGFEgo/vZERfeFkQnGea7LZY8CoF/uOw/HRiaB7pkrUWv2yXBRXnDWR
         2Xudo5AijNGTi9euuaM/ZYHzsPCYr6GaYFP7CYS/PK6eUveNT/TU1qvXYawWaBiiBHsY
         UuHQlnAJHrys+P+R6ndLlRWWhbaqgxTR1G0ZQzmiedFtR/8LXUSMHXEQA7SCCMTsRcSl
         6IHmbbgD0iegZpH3khG9TinFqNXIlXb6zBZ0zqU12QFbTuxET3ZRI9I8Hz5cRAFei2wv
         xWc0g9s3MZ/5SgS5daE6yDKunc7lrKFX2p9wPVuQ5mt/XPmsatrnmRbGB8DlueCeQ1T9
         AXPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Ogx12MrhncuKHefVKocbhI5nhXCcVBAU5+REQASDWNv2gpmd00odqxuKnMIACtsi/myqjli0/OQk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4pRvM+WGcd95Fpnh9HPXYqByIZJxiY/ELbiaRDh30pAnIUuL7
	aC8KTZZpNLV9tA//PafldhWMELl32+x+o1TVQ0B9T7Bc2HHzi+F5EIGOj/FskLsw1gA=
X-Gm-Gg: Acq92OF5i1pjLQSh3FeMSq18njh4bnlQ+DEkjTggaYWw7/sZMdJyCYan6qqiGnxyrin
	pHWhxtEKtKZ0l80JhZZU8JdN68t13W51I+GAn8DqZZoAuZAcbxzVtBC7PTyzqA7LXjgJVoUx6Vx
	VFGo0NGqIsatzSuwntMYCeqxNdzPlTisvr0X78OorGon+1BNIjYQOEanW2K1V+rZnRdpsGcYM9i
	YP9Fkdo7ucYcRxYU851lybXafEHdsbZ7VX3Z7u8gQzp/9UW9EL59Uti8spP0RGW739z1Q1p/rJK
	9IkKqdLBe9Zgcftfmfg9jxarMeYZTsWAxGnTZnY8v9PaazGUZdCiwFtRov1SlQtEtP5Cw17vQxe
	laNUApo3AcqOPNwkU7m3byo06eOs/EVWhQLKAzaXZINrvnajaCK41RPyQ+9l54WJrTJjZAfV+KA
	VzE3wQ2FmK9Dtf53gjFGmxIp1OKKuhQpE9oqTayCI=
X-Received: by 2002:a17:907:c783:b0:beb:4d05:9a0a with SMTP id a640c23a62f3a-bf09ea5e71fmr166944866b.15.1780492238789;
        Wed, 03 Jun 2026 06:10:38 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0517714c5sm155160966b.2.2026.06.03.06.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 06:10:38 -0700 (PDT)
Message-ID: <b4836fe9-49cf-44c3-96a9-548e890cee29@linaro.org>
Date: Wed, 3 Jun 2026 14:10:37 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/18] perf test: Add deterministic workload
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Amir Ayupov <aaupov@meta.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Paschalis Mpeis <Paschalis.Mpeis@arm.com>, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org
References: <20260602-james-cs-context-tracking-fix-v2-0-85b5ce6f55c6@linaro.org>
 <20260602-james-cs-context-tracking-fix-v2-5-85b5ce6f55c6@linaro.org>
 <20260603112742.GT101133@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260603112742.GT101133@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/06/2026 12:27 pm, Leo Yan wrote:
> On Tue, Jun 02, 2026 at 03:26:47PM +0100, James Clark wrote:
> 
> [...]
> 
>> @@ -22,3 +23,4 @@ CFLAGS_brstack.o          = -g -O0 -fno-inline -U_FORTIFY_SOURCE
>>   CFLAGS_datasym.o          = -g -O0 -fno-inline -U_FORTIFY_SOURCE
>>   CFLAGS_traploop.o         = -g -O0 -fno-inline -U_FORTIFY_SOURCE
>>   CFLAGS_inlineloop.o       = -g -O2
>> +CFLAGS_deterministic.o    = -g -O0
> 
> I have no strong opinion for using 'noinline' in source or using the
> global option '-fno-inline', just thought this is not easy to follow
> up if anyone (likely myself) will write a new workload for disabling
> inline. Could we have consistent style for this?
> 
> For the patch itself:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>

Actually it's a fair question why some have -fno-inline and others do it 
in the code, it could just be copied from when these were built by their 
shell script tests. From a quick look I would say we can easily drop the 
-fno-inline and do it in the code, and it's better to only noinline 
what's needed rather than everything. But that's probably a change for 
another time.

That leaves the only custom build options as the ones that force -O0 
(which also requires U_FORTIFY_SOURCE), or force -O2.

