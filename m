Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFEB3E716F
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 16:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773073710; cv=none; b=OUANOKcksAQP8s+gDait7ZMeg9N8PO98Bal9VZhABTqW9mIP3FXLT0LX73FnfhZwxCxPRZLSZgrySKgLLYQDD6DLW2YUTivI+ao0yhJKkrjOM5X2TDrWr5zrKte7UNSMmabw6AZjD5VobNhOiQ7YRPkoj+HJV8z3Zk56t1cTnDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773073710; c=relaxed/simple;
	bh=WIk5ijmLnNs2NTjHaGHzRzb4sCI0btF2mTmcjtwNl+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pTiHNLL/TgXCaiH3dce8olToY83rT2WFw5kTgQXdLmqXT7uisbvT2fXyFZ+AzB7RHwePaMENZcHLcm7c7nAa6Wq5C7dZeEHR7Y/Ed9UFbxlJ06ct1YXrWLrOjLSHZfLv1H7VTJvzRRYZXcT4GNBDV2Bz+JnarJ48TyeqUj1BMPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sa9q+1BT; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sa9q+1BT"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2aae4816912so78276715ad.2
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 09:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773073707; x=1773678507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBQuohd/vt2LAF3I4JQSmNdjevqrT6nbat4LeA+5Cz4=;
        b=Sa9q+1BTaR+crY/Ycy/WkFApc6lk6kV6XReseop1+RhGk/HAYrbGg3jzxK8+tXhb86
         8PL2joid5wjGjmf/gMyOgB0lqEij6d84gMrRhbxap4BQ2GAdvCHYG2fhRfp5bXQPZdqd
         Pm6v0l0SQd8lW1ycr55p/jRI/MluWdByWZOsduyBoD2QecdANVhDEBHFtG/WN2YBXyaD
         BoL59xD+HoQFOeUxXm+4zjBXlhunHn+RpwpeVqyVK8gKOr7pW2nR2Xn2YCKklQK6dVhD
         1+kUvXBvFYw6Qy0zENNLAQkihkbmmJ0pFM+iYRP1ufAGBWJcb89QsUxr4G0NGhpz2TrX
         HvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773073707; x=1773678507;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rBQuohd/vt2LAF3I4JQSmNdjevqrT6nbat4LeA+5Cz4=;
        b=egdrcpTmiY+7FAAW0Ydcoixm2XBPafHv56m3ogX9dIXpSoEaIJK166dVN5mxwJda0R
         p35/PpR+2BLdoMBXrqAGwUx9cIohsc9UhChSWfLiduHdjZ3L7oTyvjgtajyZZkIwNiHP
         BxLzAWR+hcOe3TvYY8qkzIuBxBZapzwkzDUOjajR2b/pMf7iSyOgyrJaQWyjqH+Gn2J+
         O5hsD71bNC+RGc9duMIzy0FlRNLEuX/IBAkfkH+vdlLvk7JDibrrl361StPVlI5Xw8sz
         VmvIc1mEyqbclZbqmpNLve8Kq8YrvA+bIU8TV8VQBsbIALdz3nFxgDdFL8ZnSmHpeWOL
         CzhA==
X-Forwarded-Encrypted: i=1; AJvYcCX7eZ5AVHn08fgaNyKx4PfWdzhyegTSp/OaVUgC2xziwk4tJf7JVJWw8wnL7KeqPTDb7VG+ZMpxpho=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8t9AYII1IQpMoFZhcO6wkFU44TB8m1/GFe8yJxgWMyq0eJLba
	Ee29BWIlMNmOmTye9U2z37ROD/ZSTtyYoODpSUUE8dv/VLYICYKchVjb
X-Gm-Gg: ATEYQzyx62NJnXqTa3gqVVYXoXNdgBGh3VeK4+rvfd1io4I59+1SHm8wU5DvSpjTmqx
	NyT7Utss7WWtXM/SX/zezb7hAJjheJAGK5hVut3voSLRi41dpeqQd9z/t/e4BenK9GjkYvkS76l
	O4bi/HRFOx7gWT4qLr4V7uiSXTbz9vvM6drIjz1jAG2aC2QFyFJ5CAAVl8Nvlp3yW1Db35dB/L8
	BwQ6Qd80W6Mt2gW+R+1HZihTZ1O93Ni6WsLtvgAxs95i9hq9aULzk2tPOJagKRRsotdVPputdVh
	rPvjs+xgsYvh7JNKOJvho9SVmcpJABmNTxJaJ38Zd0L5xVbJAdvhElsremhc9IxwV5oodqPHraS
	+5oz0tGenRA2lRgLwSGe0fztmF5kVz+dgrRxg1DEvCEP4EGNzwfl07BTp1Zc2s4FK7uUK8unfvO
	+vhWqeIjaCz13ile7FBA1YmyywPEIJoyF1SYpcfV3RPGG3lzf9IsG5fYRdY1+djZAKRktv
X-Received: by 2002:a17:903:2441:b0:2ae:4fdb:d596 with SMTP id d9443c01a7336-2ae82367db1mr122450805ad.11.1773073707067;
        Mon, 09 Mar 2026 09:28:27 -0700 (PDT)
Received: from [10.79.58.83] (wf121-083.ust.hk. [175.159.121.83])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e57cb1sm116837325ad.9.2026.03.09.09.28.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 09:28:25 -0700 (PDT)
Message-ID: <ae8dda71-9e25-4f3b-ab95-1b00809ade37@gmail.com>
Date: Tue, 10 Mar 2026 00:28:23 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/dev-tools: fix a broken URL in
 dev-tools/coccinelle.rst
To: Jonathan Corbet <corbet@lwn.net>, Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>, Shuah Khan <skhan@linuxfoundation.org>
Cc: cocci@inria.fr, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260308100851.341-1-tttturtleruss@gmail.com>
 <87v7f5vv9x.fsf@trenco.lwn.net>
From: Haoyang Liu <tttturtleruss@gmail.com>
In-Reply-To: <87v7f5vv9x.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/10/2026 12:10 AM, Jonathan Corbet wrote:
> LIU Haoyang <tttturtleruss@gmail.com> writes:
>
>> The original supplemental documentation for coccicheck is
>> https://bottest.wiki.kernel.org/coccicheck, which redirects to a not found page,
>> thus change it to https://bottest.wiki.kernel.org/coccicheck.html,
>> which adds a suffix to original URL to make it direct to the right page.
>>
>> Signed-off-by: LIU Haoyang <tttturtleruss@gmail.com>
>> ---
>>   Documentation/dev-tools/coccinelle.rst | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/dev-tools/coccinelle.rst b/Documentation/dev-tools/coccinelle.rst
>> index 2b942e3c8049..f73ccf5397f3 100644
>> --- a/Documentation/dev-tools/coccinelle.rst
>> +++ b/Documentation/dev-tools/coccinelle.rst
>> @@ -61,7 +61,7 @@ Supplemental documentation
>>   
>>   For supplemental documentation refer to the wiki:
>>   
>> -https://bottest.wiki.kernel.org/coccicheck
>> +https://bottest.wiki.kernel.org/coccicheck.html
>>   
>>   The wiki documentation always refers to the linux-next version of the script.
> I'll apply this - a working URL is better than a broken one.  But is
> there really nothing better to link to than a page that warns "OBSOLETE
> CONTENT" at the top?

Dear Jon,

Unfortunately, I do not find any other documents about this script, so I 
have to use it even though it's obsolete.

Sincerely,
Haoyang

>
> Thanks,
>
> jon
