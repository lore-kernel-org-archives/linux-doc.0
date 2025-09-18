Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C9715853B
	for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 19:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758222041; cv=none; b=TJHSdtMJJcxw5MFKnFz1XC62uX/Q/zzZYySHKsK9YHOlqPMQx+0ISCmkT0xFgcuHQtbuOplTUw0/tZmZPGbmOb2KomLA0nMZA08fw41vDAt3qOUxemHjDU5Jdo72XQ+m+JS+IIh438IYX9D9JBYe6j05Y0SzCbeN+G1T7nvV06A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758222041; c=relaxed/simple;
	bh=HOevOAElbfm0pTHT9baxa1QqEU8P+OIv4XnrqiZD+Fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gmPh4hBX91h/InJHuEms4kavNR2FaCpKiftbIc42jAvXQOfs3aPCxXPy0pFF3wqNTdbuWlW+iSOyiTLlofWXmeNQvt6LuNtqxpvyh3htQ9h2XPEgroiH7QzcvTiAc4xdRA52LqoydNYLcHkE6wkfk8Ki0au2CVwZ8drlFkjd4sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iUuFyE6w; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUuFyE6w"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3d9e0a6aa4aso93541f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 12:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758222038; x=1758826838; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F+i9iHMrfZSNqoivyx67SGEamkAUPDlF91tqODtRDok=;
        b=iUuFyE6wQpITd806RzbjYJpfbzG+s9O4cnwLcJ16c9xhlE5766j4rz338LBjo1wF2X
         sEB947XBhIYWJcW0h2ArYbhmbp5+GQGXcvJnwePu/+mYx64RJ4VMoPrcgAZ9FrrCjMuj
         yvORaqvN2tJvST7k5GFHwOhTaIocEsqn4AhZ+P2+3T7Qs1YXdqVEaGs21YO6NLyKZB3Q
         rQa7TqEWRdBqRRsNnzRpyPWZVBoVdvlZKI4yCnJCKDh/2aBLg8X5PWdUxekpx1pvY+1O
         WRgOKl+94Ol2DumtSoYqTLXyGZe/p4Fw2Wb4QLnj2m8lGSAQxoxxu9WVO7ihP+1RIgA2
         zFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758222038; x=1758826838;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F+i9iHMrfZSNqoivyx67SGEamkAUPDlF91tqODtRDok=;
        b=avxRTV9OZCSgh7v5T6UxVm0cv3DGHDGt51QqVq1vW+D2lA4E7Kv7altTFxl2Hm1u2S
         hmDJ4qXv6Ho1XmxRYFff9zaX+KCxtQza6oPA9DTb75Y1aL54dQ6cdtGcIcirFSq6/QmA
         bzVDXsnMnlmVXOkFbPBF3u8u9zksWLjSTGi6g99wk+TsoM2K9kXnB4B6OND+4ThtUQ6b
         C06rQcJBR93vFT3FG3kp68/VQKIgH9NqO33+dNm/brgDKVn+v1XcAWByaxpKzK7OKUts
         RodSPjnMr3vxLAqaPyXlSyjV0HKjPV9Vzpja/njPy0n4PrdhyM4SIspNQS2Du0WQ8+zJ
         5W9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUoci6asEW3kUMu3vkbV+txVbooxubzHJzlIKzFGU0P7fH9gKRXCSXkXIJDZSXc4XVGgtzgMK9dYQY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK6uOB6JFCzZYJ98y09PySBC/d8ZWCcpIZ4hI/OahczZc7EwnR
	VU1+YbI4Foe8/H0t4DLDD/kegVZEP+WScv0FNCZ8bWaTS01Sjba2J4i9
X-Gm-Gg: ASbGncsoR7Iln+UwPcVoTbtYw27PMr75wYYIe+jpjg2xNNRbn0BtmG4hMBAN1hC9IGl
	OKqFx38UrOd/6WjJ7VrGUZizH4La4IXai7726rFPNT50bzXIIL13g8w9b1+pqlI5RpZW5brlNi5
	x+FslyeMVw5WcOK2jYXtAar/qQgFMC9LdiozoWZczRPP4ZGT5l9CaFSD+oqCCxbvkgvSAO+L4yV
	VUBMREtoVS+OSrgM5VT7+zGMXM/TpeTa1bGBM/J/TRsfq6YnUoiBRx+hs0C+PVa6gl8F/9mde2x
	IfKybm+XAmkiZd+WUClc6Ul/CzDJaDdLyiC3zvD90GaQB64X8CrtUQQwOKavE+Bju+h4HlFSMch
	jdqw2+9fF46VM7ot8S9wpdlMFBBpuIcH47mc6XUtAq2YXgXTkMktLjfra+wqQI/viKh3gF/2CO6
	Nfs7LUhKel
X-Google-Smtp-Source: AGHT+IEufi4ClRY4a9e7yea8huaXiy4yZ519x4gYdFB4Nd6ggMP2w+e76/E+j0H8SZ+HE/JV9NrWKw==
X-Received: by 2002:a5d:5f95:0:b0:3e9:559c:13f6 with SMTP id ffacd0b85a97d-3ee81959333mr151172f8f.2.1758222037501;
        Thu, 18 Sep 2025 12:00:37 -0700 (PDT)
Received: from [192.168.0.18] (cable-94-189-151-62.dynamic.sbb.rs. [94.189.151.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee073f5387sm4558160f8f.1.2025.09.18.12.00.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 12:00:37 -0700 (PDT)
Message-ID: <893401bc-4754-4c67-a82a-0c49c8e7f447@gmail.com>
Date: Thu, 18 Sep 2025 21:00:31 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] mm/memblock: Use KSTATE instead of kho to preserve
 preserved_mem_table
To: Jason Gunthorpe <jgg@nvidia.com>, Andrey Ryabinin <arbn@yandex-team.com>
Cc: linux-kernel@vger.kernel.org, Alexander Graf <graf@amazon.com>,
 Mike Rapoport <rppt@kernel.org>, James Gowans <jgowans@amazon.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Baoquan He
 <bhe@redhat.com>, kexec@lists.infradead.org,
 Pratyush Yadav <ptyadav@amazon.de>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 David Rientjes <rientjes@google.com>, Pratyush Yadav <pratyush@kernel.org>,
 Changyuan Lyu <changyuanl@google.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, Chris Li <chrisl@kernel.org>,
 Ashish.Kalra@amd.com, William Tu <witu@nvidia.com>,
 David Matlack <dmatlack@google.com>
References: <20250909201446.13138-1-arbn@yandex-team.com>
 <20250909201446.13138-7-arbn@yandex-team.com>
 <20250915114707.GB1024672@nvidia.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20250915114707.GB1024672@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 9/15/25 1:47 PM, Jason Gunthorpe wrote:
> On Tue, Sep 09, 2025 at 10:14:41PM +0200, Andrey Ryabinin wrote:
>> +static int kstate_preserve_phys(struct kstate_stream *stream, void *obj,
>> +				const struct kstate_field *field)
>> +{
>> +	struct reserve_mem_table *map = obj;
>> +
>> +	return kho_preserve_phys(map->start, map->size);
>> +}
>> +
>> +struct kstate_description kstate_reserve_mem = {
>> +	.name = "reserved_mem",
>> +	.id = KSTATE_RESERVED_MEM_ID,
>> +	.fields = (const struct kstate_field[]) {
>> +		KSTATE_BASE_TYPE(name, struct reserve_mem_table,
>> +				char[RESERVE_MEM_NAME_SIZE]),
>> +		KSTATE_BASE_TYPE(start, struct reserve_mem_table, phys_addr_t),
>> +		KSTATE_BASE_TYPE(size, struct reserve_mem_table, phys_addr_t),
>> +		{
>> +			.name = "phys_range",
>> +			.flags = KS_CUSTOM,
>> +			.save = kstate_preserve_phys,
>> +		},
>> +		KSTATE_END_OF_LIST(),
>> +	},
>> +};
>>  
>>  static int __init reserve_mem_init(void)
>>  {
>>  	int err;
>> +	int i;
>>  
>>  	if (!kho_is_enabled() || !reserved_mem_count)
>>  		return 0;
>>  
>> +	for (i = 0; i < reserved_mem_count; i++) {
>> +		struct reserve_mem_table *map = &reserved_mem_table[i];
>>  
>> +		err = kstate_register(&kstate_reserve_mem,
>> +				map, crc32(~0, map->name, RESERVE_MEM_NAME_SIZE));
>> +		if (err)
>> +			goto out;
>>  	}
> 
> As I've said to the other proposals, this doesn't seem to be bringing
> that much value compared to just using a normal struct:

We expect to have many such ABI maps across the kernel.
These maps will share common elements - simple types, folios, and preserved
regions.

With the approach you're suggesting, we'd need to re-implement the same
preserve/unpreserve/recover logic, error handling, and unwind code for
every individual ABI map. That quickly becomes repetitive and error-prone.

By contrast, KSTATE centralizes this logic. It avoids duplicating code
and lets us express the preservation details declaratively instead
of re-implementing them per struct.


> 	for (i = 0; i < reserved_mem_count; i++) {
> 		struct reserve_mem_table *map = &reserved_mem_table[i];
> 		struct khoser_reserve_mem_table abi_map = {.name = map->name. .start = map->start, .size = map->size};
> 
> 		err = kho_preserve_phys(map->start, map->size);
> 		if (err)
> 		    return err; // Should unwind the other preservations!
> 		
> 		luo_preserve_key(luo_obj, map->name, &abi_map, sizeof(abi_map), VERSION_0);


On the versioning side:
With this approach, introducing a new ABI version (say, abi_map_v1)
would require us to maintain restore logic for each supported version,
and carefully handle upgrades between them.

With KSTATE, versioning is built in. For example, adding a new field can
simply be expressed as:
 	KSTATE_BASE_TYPE_V(new_field, struct reserve_mem_table, int, 1);
This way, the framework handles compatibility, and we don’t need to manually
write version-specific restore paths for each ABI map.

