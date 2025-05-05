Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F005B259CA4
	for <linux-doc@vger.kernel.org>; Mon,  5 May 2025 15:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746460285; cv=none; b=YQWH1CiHD/ZGawdlEqPTEzJjBoVMkMVCr7+VXfmXW/YJk4BOOnic4xydaikIbJ2PcnaqHGe2OtJoNk5U7IwGzO38qUUIQJ9d905+yEFet0XysRdVxE5+A6uy73XO3MAEHnW3mFyPSxwCPxHECBreJ479XT45M+W2eZAhqy+9v0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746460285; c=relaxed/simple;
	bh=ajZZgUulqRNQnYH/U78ZrIlZ6v46eCd19mKY/YFXRGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gheKll8RXVwNDZipbFw3aYRbkrMrk1gamo2WzH52c4THVy0hX+9N0jS3fUQHbJfBJbNr18UysE/4Jvddgk1QHKfURhujb5L4qG2KlbgleLKPqMbu6EBzaHeRyxNnb/yUApx/8YmxBvYa+Wkotj0btbZ4y4fRJR+ZI+nmWPKrwNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xm40HrPN; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xm40HrPN"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-acbb48bad09so848126666b.0
        for <linux-doc@vger.kernel.org>; Mon, 05 May 2025 08:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746460281; x=1747065081; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2+3PIdJC3Ht+VlEO5rW2bxgqfN/WfvLUVhrpIT2zCns=;
        b=Xm40HrPNoWR2GYOF4NuEWym4dNOWB2TjM/D8AT6ASyOI44YTSarEl8olVT6o5QrZVd
         AnCsg+K6dlG3QZSpA/E2BRWwd9aBF0UHXhpZKissscaSxTFJuzZPebABmyadpPzOFTkM
         sAGoW2dda6EejF5lCs5TzpKn5AOVc2zHHtCOAO6uXYvmIhwp4+gWSCbrQJheyLK8mpR0
         6FCGb+cV1LrKOkvdFKemuxXeGF40gXzh0IsgfwRRxPf/N849qR8q4Ndfg7suT8nATI3s
         bqXvF4OEdQPx0Z4ytinrX/6Wp+baxYswhMEsf0GVhPkByN4gp0gQHr++5sqNnQENULvh
         +MmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746460281; x=1747065081;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2+3PIdJC3Ht+VlEO5rW2bxgqfN/WfvLUVhrpIT2zCns=;
        b=vfY/yfQAS+BqhVEjkZHX2ebdSUE/QdGWWXVOtO1hauniuT3yGYVHbwLdt5RsWN9QB2
         OkAlBDpSkuJRYoPcZQBy4i93U3BGkv6lvNmTsUov1fioZCXDkK28jRLkkY+ECW/EylK3
         QOG7UlvmXsEmQ74lnTzo5QbWOe6JmKigH8epN/aNJ7Jc4uO/SGeDBU6+j2QzqnlsNnoM
         LERB6KyIbhFqnqH4Qa1RnFXEqULo6U9l+ERJjknmQrE+h85PEqOzk691mfQ6qQ7tlVSa
         GQoxQgIgNJ13vTfBFTPb5ZnYPe5WsHuZGPFMdtfbPLzrYTEyw2SL1OTle07IrK5zgQvX
         GnQg==
X-Forwarded-Encrypted: i=1; AJvYcCWG0Y93vr2xqn6BOen4GSkejMw0/Gpv8YR9/AZzKX1dqJD7e0pW/24fisEfMWCa+Bxi657q1M97CEM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD6TBl+KR9CFyTAN+79gxAXiC268f4fZz0jnp10BJnlRzRN5pu
	dncwwKBDqrfqujXMjaNubFE91m4M1qNLLYKic3Q7H6/RgqPwtDDDuERkfQQwp/M=
X-Gm-Gg: ASbGnctDgp4r0t3IIG5dw32bQdBoDsD62K5dud/mNPERT1LwTliP6WAGcCJwWzkhSCB
	3EavTQR86xHAUEHZS7vPwvRV+SJWkAfBc1EGIF9A3WwWCwVH2Uh62Z5Kk4R4h2CCsuCcFEqoqef
	eNR+ONqTm5HyfsfWsxr8SkX9smkvJ0gb7UWBJM0NMplh8IQq4RPnS1o0o2GeavjlQHXpgLHhl3o
	xtEzGGYPg/wwaBTPpgNDSQU1EOG/6kDHlch44a/H8LaMCSqJjmPEB9U8WXCSaACEafIp/c6eM2K
	BjxB0r/QI+Hixz+1HnD/MrFVknNjXi7mT0YNtYMin4MVxJgd
X-Google-Smtp-Source: AGHT+IFeHXSBcW5a6cMPyYFCWSmdfc0Kw0YJs6QfCUivNSYazQwUq3W3k9Emuwo7XD2iieH/6V66Yw==
X-Received: by 2002:a17:907:8dcb:b0:ac1:f5a4:6da5 with SMTP id a640c23a62f3a-ad1a4a8d95cmr752485666b.37.1746460281158;
        Mon, 05 May 2025 08:51:21 -0700 (PDT)
Received: from [192.168.0.32] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c01c9sm516621766b.105.2025.05.05.08.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 08:51:20 -0700 (PDT)
Message-ID: <6ce50077-2c64-40b2-82b3-c63c16fa1898@linaro.org>
Date: Mon, 5 May 2025 18:51:19 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 07/14] printk: add kmsg_kmemdump_register
To: Petr Mladek <pmladek@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net,
 tglx@linutronix.de, mingo@redhat.com, rostedt@goodmis.org,
 john.ogness@linutronix.de, senozhatsky@chromium.org, peterz@infradead.org,
 mojha@qti.qualcomm.com, linux-arm-kernel@lists.infradead.org,
 vincent.guittot@linaro.org, konradybcio@kernel.org,
 dietmar.eggemann@arm.com, juri.lelli@redhat.com
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
 <20250422113156.575971-8-eugen.hristev@linaro.org>
 <aBjYbXJL-GJe4Mh8@localhost.localdomain>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <aBjYbXJL-GJe4Mh8@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Petr,

Thank you for your review.

On 5/5/25 18:25, Petr Mladek wrote:
> On Tue 2025-04-22 14:31:49, Eugen Hristev wrote:
>> Add kmsg_kmemdump_register, which registers prb, log_buf and infos/descs
>> to kmemdump.
>> This will allow kmemdump to be able to dump specific log buffer areas on
>> demand.
>>
>> --- a/kernel/printk/printk.c
>> +++ b/kernel/printk/printk.c
>> @@ -4650,6 +4651,18 @@ int kmsg_dump_register(struct kmsg_dumper *dumper)
>>  }
>>  EXPORT_SYMBOL_GPL(kmsg_dump_register);
>>  
>> +void kmsg_kmemdump_register(void)
>> +{
>> +	kmemdump_register("log_buf", (void *)log_buf_addr_get(), log_buf_len_get());
>> +	kmemdump_register("prb", (void *)&prb, sizeof(prb));
>> +	kmemdump_register("prb", (void *)prb, sizeof(*prb));
> 
> This looks strange. "prb" is a pointer to "struct printk_ringbuffer".
> It should be enough to register the memory with the structure.

Yes, from my perspective this should be also enough. However, when
loading the generated core dump into crash tool , the tool first looks
for the prb pointer itself, and then stops if the pointer is not readable.
After the prb pointer is being found, the crash tool dereferences it ,
and looks at the indicated address for the actual memory.
That is why the pointer is also saved as a kmemdump region in my proof
of concept.

> 
>> +	kmemdump_register("prb_descs", (void *)_printk_rb_static_descs,
>> +			  sizeof(_printk_rb_static_descs));
>> +	kmemdump_register("prb_infos", (void *)_printk_rb_static_infos,
>> +			  sizeof(_printk_rb_static_infos));
> 
> Also this looks wrong. These are static buffers which are used during
> early boot. They might later be replaced by dynamically allocated
> buffers when a bigger buffer is requested by "log_buf_len" command
> line parameter.
> 

I will double check whether the crash tool looks for these symbols or
only the memory, and come back with an answer

> I think that we need to register the memory of the structure
> and 3 more buffers. See how the bigger buffer is allocated in
> setup_log_buf().
> 
> I would expect something like:
> 
> 	unsigned int descs_count;
> 	unsigned long data_size;
> 
> 	descs_count = 2 << prb->desc_ring.count_bits;
> 	data_size = 2 << prb->data_ring.size_bits;
> 
> 	kmemdump_register("prb", (void *)prb, sizeof(*prb));
> 	kmemdump_register("prb_descs", (void *)prb->desc_ring->descs,
> 			  descs_count * sizeof(struct prb_desc));
> 	kmemdump_register("prb_infos", (void *)prb->desc_ring->infos,
> 			  descs_count * sizeof(struct printk_info));
> 	kmemdump_register("prb_data", (void *)prb->data_ring->data, data_size);
> 
> 
Thank you. It may be that in my test case, the buffer was not
extended/reallocated with a bigger one.

> But I wonder if this is enough. The current crash dump code also needs
> to export the format of the used structures, see
> log_buf_vmcoreinfo_setup().

It appears that crash tool looks for the structures into vmlinux
symbols. It can be that this information is not available to some tools,
or vmlinux not available, in which case all the used structures format
and sizes need to be exported. But right now, the crash tool does not
work without vmlinux.

> 
> Is the CONFIG_VMCORE_INFO code shared with the kmemdump, please?

I believe CONFIG_KMEMDUMP_COREIMAGE should select CONFIG_VMCORE_INFO
indeed, which is not done in my patches. Or I have not fully understood
your question ?


Eugen
> 
>> +}
>> +EXPORT_SYMBOL_GPL(kmsg_kmemdump_register);
>> +
> 
> Best Regards,
> Petr

