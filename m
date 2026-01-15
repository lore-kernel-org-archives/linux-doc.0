Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B02630E820
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 06:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768460165; cv=none; b=sie169zgqY0cjIFOdMhPfOKsbolva0fzltnUU2m7vqyB2BskUfk5mMsHv2Gan0MIMmFfDnA4SCf9l9RNshH5mfsCH4GlqPTlbdLIoV4ybTo89VM0G5iQSi9i28c2lzJcB+i+8GM/vQv3lSsKUXqBzJ5a7tjbPI9Ushe1FXRt3Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768460165; c=relaxed/simple;
	bh=eE3zLEQ38FxS7L+a163ReIzMHdlAXyJE5Imew2BcCGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ULfgnrZzZUkR8l6cDGlsJJ3sSHJZ8Nf7hw7XLZGssY/5dnRzqZvNGuamcVHf8Cpu9C0GFv9Eh6xtGacPjglwBeAo2mpvR6yUJgsZA0ah4weDCHhVbNY/pAbBSy3RcTR8cjG3oTpbImRbDBb+KvFd9Qy6HOwlI2t3sW01MdnVZtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fctqo5oI; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fctqo5oI"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-29f0f875bc5so4329325ad.3
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 22:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768460159; x=1769064959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BPV2Q9C67pHKChEfXvxUb0q8RJzYHP2E0PJSUQJ50HU=;
        b=Fctqo5oIb9I00Cizv/7qFlEkAoMBl1kf/8uC5Pc3x9t5CD3oAOYHwWWZXgLPYDNNxK
         WyJROjyqehoKpZ+vXKMMrSf9aota9qcG4OjWFgKv3JonWO49vLyA6d7WlGrlBwvXe8Q4
         v5X4DT7zzWMd9FFb1N722ZSLRKtIYq8zPYKG4TkDRE0EVOyFW3Vg2vF2849Ij7DjxwwD
         7F9ld5RcJLhjhegSByP6s2PIZ4BPyBGu7yY08vlwJk98d4G2pwi8kmbOzsgCEJqkDxlu
         YL1ZKgGsE6cBaBQaA/PSga7qeSIIHzjhVdNQVort5TKs0NKdM0Y5JbuiOpifRJ4vYi0X
         c1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768460159; x=1769064959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BPV2Q9C67pHKChEfXvxUb0q8RJzYHP2E0PJSUQJ50HU=;
        b=gdf+RkdPSgA1yLBRFSx9SEtUDlkUrEDugRCcq9629P7O5hlx/5RPLi5RbBTwNdbyhu
         PbEDULJiGhXHjbVewg41Y/N3I98A63T+63ldAi6BbBf28NnvlurydZTXVKxKeQ4fdxKE
         B9lTFy/ap1S1GhVTns0Naz/0G4m6hT5465opWl95uEEd2IyUPIlD4azi3HNwTP9548os
         9MT2CPO7NHFsdgHjusGm6RpOCRhmzklcIoWnXnrSI7lEWkA4Q3DmKcMW/RAwxxt4us6V
         4UIN3Tg4ADqLWj2emJZA3CINVhpAb28BIpmGigF3SzPtpDUktfnUCrvYzNt9WPJIEn9U
         URSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMkr3dOj0LqS3XbFm/gkK1mOk6WSxPmZzk+w33YBbKqUCYuB/c1zC9Lkq9/conZbZPCrrxbYeh/yc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6TWIrYqHl/HmxhMwdYmoEUfnYblc0n8qjzrVqx7EndoYFPU6E
	YeJjBq8WpPRdsD6Of0I0T4/4PkJywe6cDCJ5dkRdLw3m362MxTI3EbN0F/CiieSQ
X-Gm-Gg: AY/fxX4yGLhuJrmoXidDRPapqCAE//tnrWChECjk8lDd3CNYMzu+/i+xMl0JU7llWwd
	lgeh6iHaI9jciH6DJ0gOdFgyhZgJy9d0OK8XWkcF5wsK3sjJE0nneznCc+9Q6Z91g9N64HhbenO
	QWbtnheInZN7How2PQCd84zbvnUYNWdvn+zIUkESc1R+YeyKg0KRZ4uSzNNgd/sIM1bTqbfDmj9
	pRQqCHJLHB94RrM/GHwRjwZ+mqR0hU8FFZNXV6/4zzMSL2w1OKNtv64wQBeB/wlfLg27hpuR6H2
	PA25sgcW4DinxyH3Csm7zYWmob6PXpb5rhonXVVsaWzEbQvFihY1bH3qFGKWjR3KJRljOKkRWKs
	2qvaJ8xx6WrpmKuKtwYHQJT1ef3ssXOVxUy6VzbiFLRNNWAA17W3+9UnPuH7S319HCfhKkgBg6M
	K3L2UgKWKZYH/1F444g/7eu4GkjkQ=
X-Received: by 2002:a17:90b:582b:b0:34c:a29d:992a with SMTP id 98e67ed59e1d1-3510b15a75dmr4167561a91.34.1768460159252;
        Wed, 14 Jan 2026 22:55:59 -0800 (PST)
Received: from [10.173.35.36] ([72.25.121.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35107b75c70sm1977764a91.5.2026.01.14.22.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 22:55:58 -0800 (PST)
Message-ID: <0282b93c-7d14-48ce-9706-d92ffcb64811@gmail.com>
Date: Thu, 15 Jan 2026 14:55:55 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: docs: Add description for missing options of
 link_power_management_policy
To: Randy Dunlap <rdunlap@infradead.org>, corbet@lwn.net,
 linux-doc@vger.kernel.org
Cc: hdegoede@redhat.com, srinivas.pandruvada@linux.intel.com,
 linux-kernel@vger.kernel.org
References: <20260115032952.6658-1-s921975628@gmail.com>
 <d329da11-d33e-4f6d-bf1b-c2466ffb3165@infradead.org>
Content-Language: en-US
From: Yiwei Lin <s921975628@gmail.com>
In-Reply-To: <d329da11-d33e-4f6d-bf1b-c2466ffb3165@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/15/2026 2:34 PM, Randy Dunlap wrote:
> Hi,
>
> On 1/14/26 7:29 PM, Yiwei Lin wrote:
>> With the kernel update we have more different policy for SCSI
>> link power management. Add the corresponding description to
>> the file.
>>
>> Signed-off-by: Yiwei Lin <s921975628@gmail.com>
>> ---
>>   .../scsi/link_power_management_policy.rst       | 17 ++++++++++++++---
>>   1 file changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/scsi/link_power_management_policy.rst b/Documentation/scsi/link_power_management_policy.rst
>> index 64288dcf1..07fbfd937 100644
>> --- a/Documentation/scsi/link_power_management_policy.rst
>> +++ b/Documentation/scsi/link_power_management_policy.rst
>> @@ -5,13 +5,13 @@ Link Power Managent Policy
>>   ==========================
>>   
>>   This parameter allows the user to set the link (interface) power management.
>> -There are 3 possible options:
>> +There are 6 possible options:
>>   
> These table headings lines (the ===== lines) need to be as long or longer than
> the text. keep_firmware_settings and min_power_with_partial are longer than the
> headings ===== line.
> Please extend the Value column headings ===== line by one character (just
> replace a space by '=') to avoid these warnings:
>
> Documentation/scsi/link_power_management_policy.rst:26: ERROR: Malformed table.
> Text in column margin in table line 17.
>
Thanks for pointing that out. I just sent a V2 patch for the fix.
>>   =====================   =====================================================
>>   Value			Effect
>>   =====================   =====================================================
>> -min_power		Tell the controller to try to make the link use the
>> -			least possible power when possible.  This may
>> +min_power		Enable slumber mode(no partial mode) for the link to
>> +			use the least possible power when possible.  This may
>>   			sacrifice some performance due to increased latency
>>   			when coming out of lower power states.
>>   
>> @@ -22,4 +22,15 @@ max_performance		Generally, this means no power management.  Tell
>>   medium_power		Tell the controller to enter a lower power state
>>   			when possible, but do not enter the lowest power
>>   			state, thus improving latency over min_power setting.
>> +
>> +keep_firmware_settings	Do not change the current firmware settings for
>> +			Power management. This is the default setting.
>> +
>> +med_power_with_dipm	Same as medium_power, but additionally with
>> +			Device-initiated power management(DIPM) enabled,
>> +			as Intel Rapid Storage Technology(IRST) does.
>> +
>> +min_power_with_partial	Same as min_power, but additionally with partial
>> +			power state enabled, which may improve performance
>> +			over min_power setting.
>>   =====================   =====================================================
