Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7ED4596C
	for <linux-doc@vger.kernel.org>; Mon,  8 Apr 2024 07:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712562249; cv=none; b=ETp7jcj9tIRlipoFqp7TTEvvwRjrTSK1HpX1LsuaQ4aoDeL03IgmHAFGx8px7P+q3ZStfgvVB4+xhxiOvCzLyi1yRvbWoBbTAXOSgm1NOptNHLhhMfdOhOHLwKYqCxKNRK6lTmwtENZWFTvKofpBA72grJAPiFhi+ixZDWLcwuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712562249; c=relaxed/simple;
	bh=2OnP4cb1z8gIRAZhhFT2S0R4H+4Hqy7YIK4KutMQgdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uvUAID7Hubmpg2w5ijo7f37gA6dDmZtfKKHnVCzLLFncCyiqO+oXRtZUQmkgQ/6+oTLMb06CMxlZoxJH3wrfUDjg2Q02pHvEwf4aJSjrW4onS6qTZhpky/TLJvEmjWxjgECnwSg7MfOdcCZzHyrtuXJ/AOflPfsC76ijd+PGqRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com; spf=pass smtp.mailfrom=shopee.com; dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b=KTNsGiGU; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="KTNsGiGU"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5a9ec68784cso1767609eaf.2
        for <linux-doc@vger.kernel.org>; Mon, 08 Apr 2024 00:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1712562246; x=1713167046; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KehI8KPu4upz8qJpXfAhUFMX8O5R+67ExYXkKnpvrA=;
        b=KTNsGiGU1m4qJu4Lv7QFSK6ZKssMxhD7fAfCGyS9qPlfpOSoqI+2PfOqK0vqlxJqpR
         DUKYGfqkFkE6hjqV4L3U8Zi8SLCSp8t1naA5Bbdhz44Vndp636t9BqIFGoE92ftmgDEk
         fyO4/U7glT9OAg9cVGHswbrk1u0hfe02SCQeK9hUANeK7hB/3YrFR/RD7MJJ5JNU3Jwg
         TZtJieit9+yBnQGdrpL/MYhWtfpRaVo3zeONdZzk4w7CBPP1rwhkR1NoYysDeUqA5Rmv
         QqHmezXZ5WUHVprnv86Su28tu5qYtZ5BiZVCLtgeZIGa4S1upC6DY9DX9QqXkVbpKA1J
         smHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712562246; x=1713167046;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5KehI8KPu4upz8qJpXfAhUFMX8O5R+67ExYXkKnpvrA=;
        b=gva7z9MxhJvNBnN+lQPkCsUp4QbBB0YQZsfsteECEkY+WL3soTIiJJQlTidvrK74hV
         YYJpIjXm/8Jcari/ngEq6VSje8TqaXmvZIcUhfEsOvfhQKwVZVJ5zlFKPU8lMeK8dwKB
         MJvA3+f4silstF8PgyZXihZ69zrNOII9LTGD7+QvY9UFs3vSFdNtmXKyXD2xlrGibgkc
         Uha4+OS29peAmtiJnYJ8wqg9aaramPsvs2GwLbsbssIb1F5nzWkZwxBaJ4phVTMraXUL
         r3S+yLrEV5FZ6LAYkMei0qnVjmKlruuY2kzAqDpOlfkp5bYchSlAvLUNf8UBWYceRahb
         sH2g==
X-Forwarded-Encrypted: i=1; AJvYcCWh22SYqsblzC1/ywg57ZVx5AZpe+9bjHU09IRRXPdUfjKyJ361yr2xJCMhXrOThP7nmV1aJvDuLmh+Zw2FEz05ieOl/5Z+B/rt
X-Gm-Message-State: AOJu0YyU1cVY7MBIj0JT8qiCDeKqPGp0oElU3W8FM0QS8HPvDRcIod6v
	27FgnCr061g2V6MLG1QOh6SKntBGuldq1NuiOcpa0kHEq+EmBZWssDC0b4GzmVA=
X-Google-Smtp-Source: AGHT+IFsrY4ZpM3SAF0h5M/wjAh7CCTDQmcxT7QFjm1k9lYJqPJRb9dp4KkrAB1d1fuYX++MqHlz8g==
X-Received: by 2002:a05:6871:4cd:b0:229:8236:ae9 with SMTP id n13-20020a05687104cd00b0022982360ae9mr8836690oai.59.1712562245841;
        Mon, 08 Apr 2024 00:44:05 -0700 (PDT)
Received: from [10.54.24.115] ([143.92.118.3])
        by smtp.gmail.com with ESMTPSA id u21-20020aa78495000000b006e580678dfbsm5812798pfn.193.2024.04.08.00.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 00:44:05 -0700 (PDT)
Message-ID: <ca45f32d-b526-4bcd-b177-08698babaf3d@shopee.com>
Date: Mon, 8 Apr 2024 15:44:00 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/2] x86/resctrl: Track llc_occupancy of RMIDs in limbo
 list
To: Reinette Chatre <reinette.chatre@intel.com>, james.morse@arm.com
Cc: fenghua.yu@intel.com, babu.moger@amd.com, bp@alien8.de,
 tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
 hpa@zytor.com, peternewman@google.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org
References: <20240319083039.223088-1-haifeng.xu@shopee.com>
 <4244b729-2eec-4999-9427-00b5c9f3e6fc@intel.com>
From: Haifeng Xu <haifeng.xu@shopee.com>
In-Reply-To: <4244b729-2eec-4999-9427-00b5c9f3e6fc@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 2024/3/30 07:06, Reinette Chatre wrote:
> Hi Haifeng,
> 
> On 3/19/2024 1:30 AM, Haifeng Xu wrote:
>> After removing a monitor group, its RMID may not be freed immediately
>> unless its llc_occupancy is less than the re-allocation threshold. If
>> turning up the threshold, the RMID can be reused. In order to know how
>> much the threshold should be, it's necessary to acquire the llc_occupancy.
>>
>> The patch series provides a new tracepoint to track the llc_occupancy.
> 
> There seems to be a problem with the DKIM attestation. Here is what I see
> when I download this series:
> 
>     $ b4 am -Q 20240319083039.223088-1-haifeng.xu@shopee.com
>     Grabbing thread from lore.kernel.org/all/20240319083039.223088-1-haifeng.xu@shopee.com/t.mbox.gz
>     Analyzing 3 messages in the thread
>     Looking for additional code-review trailers on lore.kernel.org
>     Checking attestation on all messages, may take a moment...
>     ---
>       ✗ [PATCH v6 1/2] x86/resctrl: Rename pseudo_lock_event.h to trace.h
>       ✗ [PATCH v6 2/2] x86/resctrl: Add tracepoint for llc_occupancy tracking
>     ---
>       ✗ BADSIG: DKIM/shopee.com
>     ---
>     Total patches: 2
>     ---
> 

Hi, Reinette,

I can also reproduced it. After digging into it, I found that our DKIM signature header
has 't' and 'x' flags. They are recommended as a means to help identify spam.

t= is the DKIM signature timestamp.
x= is the DKIM signature expiration time.

The source code of DKIM Validation can be seen in dkim/__init__.py(line 351), I paste it
here.

 343     if b'x' in sig:
 344         if re.match(br"\d+$", sig[b'x']) is None:
 345             raise ValidationError(
 346               "x= value is not a decimal integer (%s)" % sig[b'x'])
 347         x_sign = int(sig[b'x'])
 348         now = int(time.time())
 349         slop = 36000 # 10H leeway for mailers with inaccurate clocks
 350         if x_sign < now - slop:
 351             raise ValidationError(
 352                 "x= value is past (%s)" % sig[b'x'])
 353             if x_sign < t_sign:
 354                 raise ValidationError(
 355                     "x= value is less than t= value (x=%s t=%s)" %
 356                     (sig[b'x'], sig[b't']))

The expiry time is less than the time point you download the patch, so the validation
fails. If I comment out these lines, this series can be successfully downloaded.

The signature is only valid for a week. So if you use b4 to download the patch series,
It's best to do it in a week after the patch is sent.

Thanks.


> The patches look good to me. Thank you very much for adding this.
> Please resubmit with the DKIM attestation fixed and then you can add:
> 
> | Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> 
> Reinette

Thanks for your review.
