Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107EF74BE1;
	Sun, 19 Jan 2025 16:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737302943; cv=none; b=iV1VBdgy2VlY+86dkw82ym4vllROBEf0XQVJC2G4RcxqxJRdD/UkrJbR1ZXWhp2Cnp9IxzjkDvoa8417fPwZzcOlxTeYNtpXNEerNW7aSDHvVvo2jXKhR53AEHkrALD2npd9nqU7nIMhxl7OkUJcwAsKWqxfWxzHpEGyVHi8hPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737302943; c=relaxed/simple;
	bh=NuWpaFWccZ8WL2P2LILLyeT/y3XC/5NOzQk1nmCzfGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R2xhD4ZWR5GiNwl0Ly3Wwnpq1Ve9NaKs9IGge7zVaCQXR1+NIw1A1qtDJov5gDk4yfURzDuo19//DhMlCe11d539YZ+z85O1eSGp+KSE+zCz6qv3Japqxwfr7qugbhlkIuHq+2JzbzgUncAfj528RpPUiMo+XHNS4lrbEjBaOnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dv4gmrV2; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dv4gmrV2"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5f2efd94787so2183656eaf.2;
        Sun, 19 Jan 2025 08:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737302941; x=1737907741; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+mXwMvVASV3DcfhO5VTmDp+5CH+9TseWIlRBxbe7Uv0=;
        b=Dv4gmrV2ldga5BQ385knSW7htNA0c93ZOu2bceJ2G48AFAdk9OpNaSxlzwPyPi2GWp
         eFCYJQWpZzudFWLaUMwMqRexWuHS6vqHr+kzTsf0wNsWnwdzxUJjrQcRTJ8ZRP43bZTs
         2SQVc9XJjZQgya2NxeUgShO08QuQQTy6QOmo1Feksy5nPgOTjF1gozISrNdUsfjCmVDG
         Apdu2dRZ18GoQUM075fcwI1ukPtFv8PgFQUyV+o39tf5fYAIhiDwDQz+iwyNXA27HnXJ
         5r8ANBqUyRfO2BNKHjTKv/TaP5I6mjCUkXO9aUNGWWr5gw6QPNYGOw/H2rZkoTsAn2pa
         dTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737302941; x=1737907741;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+mXwMvVASV3DcfhO5VTmDp+5CH+9TseWIlRBxbe7Uv0=;
        b=tR6rdqgJjz3R7P9EvoPxKES+9GXILuLrfhwilrbQZmxmgk0BWtXTOE1L5JxhH7pFZV
         QfukUBfRDKmhuz0vO74wUsf6Bl7rOPKu4vtbzQ8CTJh8PjBLI6QTFwO3Bb11XLZM15Sz
         wGSWvoC+MurZir5Qnk3U6wxY7w5N/24VWP88QKPi/KBDHea+ZP9Bun3a1onZn/ikDdBV
         b0r+Hv2INNY9eEUGsn3T+dZoVeFRVIHIzvF7fdoT0ZIW+GTjIzY5mto5BpXtZvpbQmxq
         I6ghGX4Fh17PiRT377dmbwjHbfdUPWfwFKcgsei+iIb2NT2p262NlnXol1/Xt09k9TCu
         B4mw==
X-Forwarded-Encrypted: i=1; AJvYcCU1m9tMTs1Py1hmozctXWXLGKU4UCaaEYraj6uMtEEqWwlh13PpMtOS0QBjognN633S+b7yesIEdcp4YNUJ@vger.kernel.org, AJvYcCX/UevBAn4dY7wSMpHqotSnjkOkdEfd4YL+ga0w7PJISU0V4+aEF/7yJRSM0gJNnPwwH75pPQbpjbI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwczBYvaOQkvWIwaTqpeDwfAB0uvfaSDg0g+LO0yDN0iewhF9wP
	X8f6+jhlRE4695OCfWVfy9kdmbFxqST0mQKWNm5bHUHpHRbTCvv+
X-Gm-Gg: ASbGnct02vZLOuXcVnBTTHxW+yyhTKjbsocNDEEzJg2uNVuNTe0qW4WThX6fLpzKdAU
	V0SCznhD49mhH3MN2jYhN5iIkQa0NmU3J4U4HGRZZ1OgvNdWjIFvbT1vkd6PSrdXAUUTE+LtHOh
	oEpcd/t2E2E9scDBuxr7Ye5aMAqfdJI8Dn1JhTKPfPurHU6+gYg1a5ynzS25qXL4OY08e9kt3xY
	1BxCQE9L69lNYoW1Pv+HfPeJkaYH/YFgreNakoFA93si/5Jqlc+oWREL5yLydOwkK2CyCRx0sWQ
	jRyfEltBMzdAxnNU5KfPEY6gBVPfD8gmfu3s1+07NWjEf9GbvvE+ABeuoQ==
X-Google-Smtp-Source: AGHT+IHhMRjKAl8Fu2887OnbENzbJ5zfezRYbkwHXplS/aWMhIomGBj3vx/lqiVdjY1bR83DFO1s+g==
X-Received: by 2002:a05:6820:3083:b0:5f8:c64a:f293 with SMTP id 006d021491bc7-5fa38879f6bmr5857948eaf.5.1737302940884;
        Sun, 19 Jan 2025 08:09:00 -0800 (PST)
Received: from ?IPV6:2603:8080:7400:36da:dff5:4180:2562:4c1e? ([2603:8080:7400:36da:dff5:4180:2562:4c1e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fa35f2985asm1977116eaf.20.2025.01.19.08.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jan 2025 08:09:00 -0800 (PST)
Message-ID: <6c8457ca-c43c-4d93-8493-bf4e5b22f3df@gmail.com>
Date: Sun, 19 Jan 2025 10:08:59 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailmap, docs: Update email to carlos.bilbao@kernel.org
To: Jonathan Corbet <corbet@lwn.net>, carlos.bilbao@kernel.org
Cc: avadhut.naik@amd.com, akpm@linux-foundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250111161110.862131-1-carlos.bilbao@kernel.org>
 <87ikqiboqp.fsf@trenco.lwn.net>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <87ikqiboqp.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

On 1/13/25 11:35, Jonathan Corbet wrote:
> carlos.bilbao@kernel.org writes:
>
>> From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
>>
>> Update .mailmap to reflect my new (and final) primary email address,
>> carlos.bilbao@kernel.org. This ensures consistent attribution in Git
>> history. Also update my contact information in file
>> Documentation/translations/sp_SP/index.rst to help contributors reach out
>> for Spanish translations.
>>
>> Signed-off-by: Carlos Bilbao <carlos.bilbao@kernel.org>
>> ---
>>  .mailmap                                   | 3 +++
>>  Documentation/translations/sp_SP/index.rst | 2 +-
>>  2 files changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/.mailmap b/.mailmap
>> index 5ff0e5d681e7..83837191affb 100644
>> --- a/.mailmap
>> +++ b/.mailmap
>> @@ -140,6 +140,9 @@ Cai Huoqing <cai.huoqing@linux.dev> <caihuoqing@baidu.com>
>>  Can Guo <quic_cang@quicinc.com> <cang@codeaurora.org>
>>  Carl Huang <quic_cjhuang@quicinc.com> <cjhuang@codeaurora.org>
>>  Carlos Bilbao <carlos.bilbao.osdev@gmail.com> <carlos.bilbao@amd.com>
> Is there a reason you didn't just delete the above line?


My understanding was that .mailmap should keep older mappings for proper
record keeping, but it may have had the same effect, yes.


>
>> +Carlos Bilbao <carlos.bilbao@kernel.org> <carlos.bilbao.osdev@gmail.com>
>> +Carlos Bilbao <carlos.bilbao@kernel.org> <carlos.bilbao@amd.com>
>> +Carlos Bilbao <carlos.bilbao@kernel.org> <bilbao@vt.edu>
>>  Changbin Du <changbin.du@intel.com> <changbin.du@gmail.com>
> Thanks,
>
> jon


Thanks, Carlos

