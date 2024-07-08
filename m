Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25BD3A27B
	for <linux-doc@vger.kernel.org>; Mon,  8 Jul 2024 09:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720429500; cv=none; b=VGWwV8krWzIZUrCuqTeYgvYEOmI6RXoiutOnpGLn32lPw9fUOP7PJ1wBjsYMDDuq0SI+eot2EgXBYad/B1dayzQUTZOfFynmLmR3tQVcOcXyckeMqF25XbbOljmAgPV2rMb0ULLq8zsaUmhw9/bv7dnDznVPKbpCSSyJc61rco8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720429500; c=relaxed/simple;
	bh=XMF2MqDns5pCwE8CcsNuQXiO25HOfipCVkWhVX+41Io=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O79xgR7O/OTyU3GDKNZxS4DR21ZqfjLs3KQenjF06czWkN2lFnlCOfz6DxxhbzK3F1q8MqxGrdQ2ht4ProAX7fxCT6lFGCRUlgtHk+EGkLqpspDwoowIBDMs9f/5ExUEJ2ZTtoAuKtBJpsFm7GRAp71lzGjDivH1DolMQsqWCeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=N2qEmVWR; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="N2qEmVWR"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a77d9217e6fso247197166b.2
        for <linux-doc@vger.kernel.org>; Mon, 08 Jul 2024 02:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720429497; x=1721034297; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CLguUnqOILj2nltoMSMd+O56+i+Df9CclOmYvB+j5Mk=;
        b=N2qEmVWRa/O01O195gtQXeqZRs4SRgaDPcUKHHDphEc6YiJzVbbaP0eNYT4wNB8Te5
         M2LmsfWKcExG1exTEYMPL4uWBWIaZmZOGiF2GXy3L/3GjD9wIp4GKXOJ4BI1oUjH8rQf
         Qx0yK9K++UieXKD75LFl1Rz1yvDxZS90xfR8ZzyF2T8MZsaLCvihufYaT43s7hDc6IfI
         uU3el560Yq57B6zBeJoIC428+UtO3LlA4oDU7M5cFAlWlxAId19dxfgPdk2UaQpOYeCh
         HB0fRwdXTyVRm/m44SoVK8rgmx0wBKie4AqmPDYpDua70CqQ4QWun53Ue/DS6KasOxD2
         hpPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720429497; x=1721034297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CLguUnqOILj2nltoMSMd+O56+i+Df9CclOmYvB+j5Mk=;
        b=e6eairvcyQc+TI1/zmnTTMGR29/K1l0ygW4pzjHSYiyh2XOSkdiOQNfjWYhLfcsfvt
         2p+Fye2LIotGZ+c2UbtIGGEtN73dxJwCAb9Ty7TsAalmTOYAgjWyr4LVjTZFdwPqbTyA
         6W1VokqXEFhb9DBFgMQbiUP9zp/RMsnW+9m9G2P05ugPIZgA7y+PFck0sZUFzrcv9iXL
         eQe+1+4UVqF0h+1mBF4YTmM3AQ0XdAxci0ss+Qkn2yNy0JwwBjP6oSE87wA0B06x+ybt
         BXNoVO2fxk0xkctMRYp/HKksYua7CfzeOl6CJjCgx2OCzfdgKuPzb5MQKG3IWmGisDiY
         tubw==
X-Forwarded-Encrypted: i=1; AJvYcCXpYD5ysuBy2kijGY54ADCA+dpDR4oF8BgdKGbNnGEvBft1k/5Iy6zQqTfwq/pYw3/tVGfBmjWsge2XVRoL5VdwYw8XerfogOe5
X-Gm-Message-State: AOJu0YxaigD3+iMkFOgtwSpjcD1vDPhC9nkUMUK4cyIqZ7UPztN60Wje
	WCZpWnM1o+XzJxc4rbNnOBtDcYmtEkL6WOKJjW5KphDdKe4srddDBpT8noW9L7rq0NiwI2h6lZ8
	o
X-Google-Smtp-Source: AGHT+IEfKmbjb7PP9nIF3X70+mcGNp57v/tF5rZEvNSyggSxpN3frMu/fbTIhNoinwcH4OyrIkBJcw==
X-Received: by 2002:a17:907:118e:b0:a72:7c0d:8fdc with SMTP id a640c23a62f3a-a77ba45525dmr798422866b.14.1720429496940;
        Mon, 08 Jul 2024 02:04:56 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2? (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de. [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab065208sm911918466b.118.2024.07.08.02.04.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 02:04:56 -0700 (PDT)
Message-ID: <2d9ffe19-1663-499c-9699-c13ab7a341ee@suse.com>
Date: Mon, 8 Jul 2024 11:04:56 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: make multicall debug boot time selectable
To: boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org
References: <20240703115620.25772-1-jgross@suse.com>
 <d28f8da5-7903-41c8-9213-4e24e376c837@oracle.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <d28f8da5-7903-41c8-9213-4e24e376c837@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06.07.24 00:36, boris.ostrovsky@oracle.com wrote:
> 
> 
> On 7/3/24 7:56 AM, Juergen Gross wrote:
> 
>>   #define MC_BATCH    32
>> -#define MC_DEBUG    0
>> -
>>   #define MC_ARGS        (MC_BATCH * 16)
>>   struct mc_buffer {
>>       unsigned mcidx, argidx, cbidx;
>>       struct multicall_entry entries[MC_BATCH];
>> -#if MC_DEBUG
>> -    struct multicall_entry debug[MC_BATCH];
>> -    void *caller[MC_BATCH];
>> -#endif
>>       unsigned char args[MC_ARGS];
>>       struct callback {
>>           void (*fn)(void *);
>> @@ -50,13 +46,84 @@ struct mc_buffer {
>>       } callbacks[MC_BATCH];
>>   };
>> +struct mc_debug_data {
>> +    struct multicall_entry debug[MC_BATCH];
> 
> 'entries'? It's a mc_debug_data's copy of mc_buffer's entries.

Yes, this is better.

> Also, would it be better to keep these fields as a struct of scalars and instead 
> have the percpu array of this struct? Otherwise there is a whole bunch of 
> [MC_BATCH] arrays, all of them really indexed by the same value. (And while at 
> it, there is no reason to have callbacks[MC_BATCH] sized like that -- it has 
> nothing to do with batch size and can probably be made smaller)

As today the mc_buffer's entries are copied via a single memcpy(), there
are 3 options:

- make mc_debug_data a percpu pointer to a single array, requiring to
   copy the mc_buffer's entries in a loop

- let struct mc_debug_data contain two arrays (entries[] and struct foo {}[],
   with struct foo containing the other pointers/values)

- keep the layout as in my patch

Regarding the callbacks: I think the max number of callbacks is indeed MC_BATCH,
as for each batch member one callback might be requested. So I'd rather keep it
the way it is today.

>> +    void *caller[MC_BATCH];
>> +    size_t argsz[MC_BATCH];
>> +};
>> +
>>   static DEFINE_PER_CPU(struct mc_buffer, mc_buffer);
>> +static struct mc_debug_data __percpu *mc_debug_data;
>> +static struct mc_debug_data mc_debug_data_early __initdata;
> 
> How about (I think this should work):
> 
> static struct mc_debug_data __percpu *mc_debug_data __refdata = 
> &mc_debug_data_early;
> 
> Then you won't need get_mc_debug_ptr().

I like this idea.


Juergen
