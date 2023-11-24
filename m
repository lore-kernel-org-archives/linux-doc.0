Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RVexKku5"
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20C6E199A
	for <linux-doc@vger.kernel.org>; Fri, 24 Nov 2023 07:57:08 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9fffa4c4f43so295562966b.3
        for <linux-doc@vger.kernel.org>; Fri, 24 Nov 2023 07:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700841426; x=1701446226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZF6yae9bb5tDXC/CsnvGYPJ3X5s4815eVzyjB3BR8k8=;
        b=RVexKku5lciK7stmLKBVUIcyJ/EvkeoI2yvaHDdoUJrWwmzZNdDDN5uHDs+3VnMFUK
         zBUlvNmOZOoTfvEw+F9bI1F8MF3DxAz2eOJA6VwSbWpuICdjALsTbyICPaU7UwlIURCf
         ChQzkJLMRnAxm9d0WchcYDH0Ia6xuNTPitggNAZOMsMgPRiyHfuhkPN+NoVnM7QRJs7+
         bGEWyF+a7F6rWjqJGakN6yenzs3RhUv3GglOen0c+tNpbybGHhAhcQfoeuN00yVLEb1r
         WWAOiFUtnooVlUJMLZ/1BCCh6HlOhZG+NYmwEE6TXvVPiYo3hW+3KB6Ud8MzPPj4SKIL
         5RMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700841426; x=1701446226;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZF6yae9bb5tDXC/CsnvGYPJ3X5s4815eVzyjB3BR8k8=;
        b=PRZ7sVZNSUEcDOvKuJIYZMZFrwsnxOCDZtZVTfwMSfcnMNrXorHLjULQR0RQ1s63Sv
         oB7VjuKOvapZ+vO6Vpw3fxBeeGeNcgsg8T2d201IRI3f43+pY759+29uyzDho8dVofaU
         BLJz9NF5mNgMGJdNDhUNm/l4R1IB8GzIozVnqI4OxU1PHCLnulZqV60vGMJwcJJW0cJW
         TL9mV/vohvDJiE4cKoYYK3tI727QOZ1E3+GI9TPfW7LJ4Lhi40Dg3aqA6jWN3tfZ2ZH5
         ngid9rXkN0G1p+EII37BFlG6pr7OYTPubcgnKQigMzdJl0bfsw3EZJW7ooNAcGYZ0e/E
         9RKQ==
X-Gm-Message-State: AOJu0YwZPqL8LdWlT0o9E7PkQeLZruIuy/RcSdLRB44wU20yacAR1VZR
	S5FjwflUXN4j8vJDQfwE1y+XdEbejiV2vMhNUzQ=
X-Google-Smtp-Source: AGHT+IFEf8Zmz3QMkGFpwb/grFbBwT9wDbpNPDHQrgCCp5UTdMYETULTAfdNeVMu4HrvKK4xKSxTEg==
X-Received: by 2002:a17:907:740a:b0:9e5:d618:d6c1 with SMTP id gj10-20020a170907740a00b009e5d618d6c1mr2310550ejc.19.1700841426518;
        Fri, 24 Nov 2023 07:57:06 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id jj13-20020a170907984d00b009b65a834dd6sm2195878ejc.215.2023.11.24.07.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 07:57:06 -0800 (PST)
Message-ID: <42cc0ae2-d61a-41cc-b46e-132dace301b0@linaro.org>
Date: Fri, 24 Nov 2023 15:57:04 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] docs: mtd: spi-nor: add sections about flash
 additions and testing
Content-Language: en-US
To: Pratyush Yadav <pratyush@kernel.org>
Cc: michael@walle.cc, linux-mtd@lists.infradead.org,
 linux-doc@vger.kernel.org, corbet@lwn.net, linux-kernel@vger.kernel.org
References: <20231123160721.64561-1-tudor.ambarus@linaro.org>
 <20231123160721.64561-2-tudor.ambarus@linaro.org>
 <mafs0sf4vdxqd.fsf@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <mafs0sf4vdxqd.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/24/23 14:36, Pratyush Yadav wrote:
> Hi,
> 
> 
> On Thu, Nov 23 2023, Tudor Ambarus wrote:
> 
>> Add sections about how to propose a new flash addition and about the
>> minimum testing requirements.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  Documentation/driver-api/mtd/spi-nor.rst | 189 +++++++++++++++++++++++
>>  1 file changed, 189 insertions(+)
>>
>> diff --git a/Documentation/driver-api/mtd/spi-nor.rst b/Documentation/driver-api/mtd/spi-nor.rst
>> index c22f8c0f7950..cc8e81e09544 100644
>> --- a/Documentation/driver-api/mtd/spi-nor.rst
>> +++ b/Documentation/driver-api/mtd/spi-nor.rst
>> @@ -63,3 +63,192 @@ The main API is spi_nor_scan(). Before you call the hook, a driver should
>>  initialize the necessary fields for spi_nor{}. Please see
>>  drivers/mtd/spi-nor/spi-nor.c for detail. Please also refer to spi-fsl-qspi.c
>>  when you want to write a new driver for a SPI NOR controller.
> [...]
>> +4/ Use `mtd-utils <https://git.infradead.org/mtd-utils.git>`__
>> +and verify that erase, read and page program operations work fine.
>> +
>> +a/ Generate a 2 MB file::
>> +
>> +    root@1:~# dd if=/dev/urandom of=./spi_test bs=1M count=2
>> +    2+0 records in
>> +    2+0 records out
>> +    2097152 bytes (2.1 MB, 2.0 MiB) copied, 0.848566 s, 2.5 MB/s
>> +
>> +b/ Verify erase::
>> +
>> +    root@1:~# mtd_debug write /dev/mtd1 0 2097152 spi_test
>> +    Copied 2097152 bytes from spi_test to address 0x00000000 in flash
> 
> Perhaps mention that the 2 MiB region should already be erased.
> Otherwise some flashes might refuse the writes (like the ones with ECC

right, then maybe we could do a

/erase
/read
/dump and see 0xff
/sha1sum to have the 0xff checksum
/write
/read what was written
/sha1sum on the read to make it's different that the 0xff checksum and
that the write worked

> -- Cypress S28 family comes to mind). Experienced engineers should know
> this already but it might trip up some beginners.
> 
> Looks good otherwise. Thanks for working on this.
> 
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
> 
>> +
>> +    root@1:~# mtd_debug erase /dev/mtd1 0 2097152
>> +    Erased 2097152 bytes from address 0x00000000 in flash
>> +
>> +    root@1:~# mtd_debug read /dev/mtd1 0 2097152 spi_read
>> +    Copied 2097152 bytes from address 0x00000000 in flash to spi_read
>> +
>> +    root@1:~# hexdump -C spi_read
>> +    00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
>> +    *
>> +    00200000
>> +
> [...]
> 
