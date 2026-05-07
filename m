Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97374386C37
	for <linux-doc@vger.kernel.org>; Thu,  7 May 2026 08:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143296; cv=none; b=EWsySGsp6RwXm0hxnMKSEO8P+vMzsUPgmK/Ub6IZMsQPDT8+1d+SLk/dTU58ApkUyRlBVx1NrG3BLe/7zrPDjpDsHRxmwnF5krJiVOfCz4tqKNyB+6GW5fDJtsKAflD8VC22FwaCUpNJ4BTE3AAW3n+lpTp3hjn1ExWegVsaxok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143296; c=relaxed/simple;
	bh=pJgf/8K6i1UqZ4sD9tXxKWjDKHpurXxLzcy/xPBEzko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IH1bWENmbAMPmZ9w0+0wM/f4sUTkDOqcdmxwwyZmip6DkgCgi9lI1NgN5OgulMhRIvJGSEk2hBPJrACSuNgLU1F3sIWn8tqPhNw7rVWtnxjOoBwT5T+gi8Zh0LmRCru+g1xNLi4RMgFydmQfy+zUXSWfTv4Wb/kseiUkWo+6t58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T4RnwNW8; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4RnwNW8"
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-c822652f82aso377263a12.3
        for <linux-doc@vger.kernel.org>; Thu, 07 May 2026 01:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778143287; x=1778748087; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tYLd8a4rOgJ0HgA5aFHjScXvqopFgzBf/Pbs3wYF8a8=;
        b=T4RnwNW8ietBMUmVcoZOW6WX/zS313x7qMTXepqdQlrCYRrDTHdt9nfYNaZCLvcaXS
         N89RCMi+uWFuIthxlu7ZxOFXd/CHswqPWQFMurd0eVhEVuP4nKj1Q2GtCixqZdcnV5dC
         sbMsZ8nRvHDJ2C8cVbcZsT5c7VjSiW1kCH2M7P/ifUfP19GuOzID6qxEkAxSpBK5FHUw
         2XOBhoqcgkUD6dS3KknuXj9jVBnvyvEM6nytYh8TkCbslkJHXiWg5z9tGBnVpV3Vblbn
         B0m3NQHQ8k9VNVuZG+W9d8xBT/hisbpbCmYBbde8ED2L0iuHBS09Gs1n3pGHODqIJjw5
         Aiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778143287; x=1778748087;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tYLd8a4rOgJ0HgA5aFHjScXvqopFgzBf/Pbs3wYF8a8=;
        b=dutbuCH9vbo1dkZCliL9sSpDvyHpKvpX5ZgfiaxURLryy58Jicu+OSGmXobgX9spNa
         CSiSGsVoaAr1rXGz8jndJANjVBeB6Yu/u+Gi9y/VuPnvznfxvuvzJuL/r/HHBPoF+Dl/
         cDg6HyU9Ov+lsMGTyRkktkSWcQppZqOf8uV43wXYEX5FaedH2dbMIjPyMzKqzBQqJVge
         vwglDoCKDa8to4enkABTGjdaAeNhlQd2Q/qC1ns616G2ckOStySPx/A5G5QSs89RbuX+
         WRoiBPy43CDKEcj5cRrzqHcH+wODDp8As3PuJeWnx5ede7TI+7bwlql/HEiL//0EZpHQ
         YuWQ==
X-Forwarded-Encrypted: i=1; AFNElJ8wSx6mpV25kthlqfvkTQDVrpfR5bdGe4baGHdMCU7UtNw47HfYkDOxSX0u/VasG5zBL4xZdcCdoQE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaT5nR85PENF9TG8A7jARbpKYSjLW+pnbnb4GPSGo10BOMmfcw
	frmpxAazMJAykHIYu3z2024Jz3DS4VULt05/B5cW0STh4eUki+A5QhtU
X-Gm-Gg: AeBDiev0H7E6XrwN+aK1yeUm4sqhceyAW9h5KcHO7CdCanrXanjoPMzZSfVfGo5z+XN
	CAR21k9mV1nlfUFXkDa/TZO1dm4rsblF+Ir/W2Sy8X/ap8dHhEiTa0PgQpGoUStuW8WJPqA5AbZ
	O93+vgTSOB0BVsjCpvO6m/IfJ6apbO0gbADhg3ALG84nfdgKh+H89fndBZ7W7xyHckFQYTQupci
	dG18pPHaCEKXks0Bi+IX2ifcuY2FvUDwx8e0jh/50ZPIkCIMVnPvTHvP46qTsVKyk+GCuObWqNy
	hd4Hp88G4/J0qBsAWx6ZbFq9+zMCZNrWzxhGPQy1227fMyOjA12srlxCODxZexPom+0vw9TMcaz
	LeCk3XD9cFsaYBpgMt65KT+5alKVQIbb0Z6okJ2tQ3bpNQc9dq291ZEciVvRAa8+4vv9uGSmOum
	Jn7waOZjiNnwkkJvmmPyLVuvVFfee2M8jQBOGWFjWwcA==
X-Received: by 2002:a05:6a20:a106:b0:3a2:dc51:445 with SMTP id adf61e73a8af0-3aa5ab6853cmr7732684637.36.1778143287552;
        Thu, 07 May 2026 01:41:27 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253586c6asm1305583a12.4.2026.05.07.01.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:41:26 -0700 (PDT)
Message-ID: <126f4fd0-0a1c-41e0-8746-fa7ab85d6773@gmail.com>
Date: Thu, 7 May 2026 16:41:15 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] of: reserved_mem: fix region count for nodes with
 multiple reg entries
To: Rob Herring <robh@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org,
 catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, saravanak@kernel.org, chenwandun@lixiang.com,
 zhaomeijing@lixiang.com, everyzhao@126.com
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
 <20260429065831.1510858-2-chenwandun@lixiang.com>
 <20260506014752.GA280279-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260506014752.GA280279-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2026/5/6 09:47, Rob Herring 写道:
> On Wed, Apr 29, 2026 at 02:58:21PM +0800, Chen Wandun wrote:
>> When a reserved-memory node contains multiple reg entries (e.g.,
>> reg = <base1 size1>, <base2 size2>), the count used for
>> total_reserved_mem_cnt is wrong in two places:
>>
>> 1) __reserved_mem_reserve_reg() returns 0 on success regardless of how
>>     many regions it reserved in memblock. The caller in
>>     fdt_scan_reserved_mem() then increments count by just 1.
> Just to make sure, more than 1 worked before the referenced commits? It
> would be easier to just define we only expect/support 1 entry.
Looking at the pre-8a6e02d0c00e code, __reserved_mem_reserve_reg()
reserved memblock memory for all reg entries, but only called
fdt_reserved_mem_save_node() for the first one (guarded by an 'if 
(first)' flag).

So multiple reg entries were never fully supported: subsequent entries
got their memory reserved in memblock, but their metadata was lost
and driver-specific init callbacks were never invoked for them.

The referenced commits made this worse by also breaking the count
tracking, but the root limitation predates them.

I support documenting "only 1 entry supported" based on the
following reasons:

   - of_reserved_mem_lookup() does a name-based linear scan and returns
     the *first* matching entry. A node with N reg entries would create
     N entries with identical names; entries [1..N-1] are permanently
     unreachable via lookup.

   - Drivers like CMA and DMA coherent are designed to initialize a
     single contiguous pool per node_init call. Calling node_init
     multiple times with the same FDT node is not a supported usage.


>
>> 2) fdt_scan_reserved_mem_late() uses of_flat_dt_get_addr_size() which
>>     only reads the first reg entry. Subsequent entries are never
>>     initialized via fdt_init_reserved_mem_node(), so their metadata is
>>     lost.
>>
>> Fix both issues:
>>   - Make __reserved_mem_reserve_reg() return the actual number of
>>     regions successfully reserved. Update the caller to accumulate
>>     the returned count.
>>   - Rewrite fdt_scan_reserved_mem_late() to use
>>     of_flat_dt_get_addr_size_prop() and iterate all reg entries,
>>     initializing each one via fdt_init_reserved_mem_node().
>>
>> Fixes: 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory regions are processed")
>> Fixes: 00c9a452a235 ("of: reserved_mem: Add code to dynamically allocate reserved_mem array")
