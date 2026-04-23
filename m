Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C301E9906
	for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 14:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776956087; cv=none; b=NrNLTFwB6lFxeEb2ZejHMuvSHnBDArhkjQbm7rbcfYldKbmPKLpYUHRMM++onhiUafV9AmhuyTISqo2l9AtdAqbia/UXiKUFCEiiQz7JfzC2cZV0918C9i8MD3ksRQWyzwgZqgAi74rT+NBzQzJZLGqhYrkALDwrT08cprYOvH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776956087; c=relaxed/simple;
	bh=hfUHLyKJSvrgtYgi0uQNctjhIyNjTTEmXV7g3LiZRcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=er7bv3AfLpq5JThgchQZvEjOnpyx2BZNLAhkHwByLHvM2xue5LjT1E57T0JRLM6nSCFNy7aJaCP0p/Z+Yc/v9Pyq7RWpbf6uf+/iRWGW0ZuUqu1QW6VuBQaPPFTJZj4GzQZxmrKhTV/UU+XEkJuB32OkWlrYzbeiMOpv/6sxibs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YbQ6iYAT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CnA0t39G; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YbQ6iYAT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CnA0t39G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776956085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TdUVkFiLAqBCJes+oJ0QB0pTbT2jdIw+uaSjtun6geI=;
	b=YbQ6iYATt5NUbplav7SKxeDrulN/+FkodsovL8ngB80+OdZPWa/WJxCtCL+Ihf1XNbLl/a
	dR6eZU6WJG8PwAdStf9Jg8xvOF4OH7V5SxtJeJctY0WrWmn+w61JMK9IQ+hEiP9F5QPBF4
	xj7mat0QX79wQj3Dm1sLgrEPWgfYPpY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-KDB8D8GvNNmxmByCIOhGhw-1; Thu, 23 Apr 2026 10:54:43 -0400
X-MC-Unique: KDB8D8GvNNmxmByCIOhGhw-1
X-Mimecast-MFC-AGG-ID: KDB8D8GvNNmxmByCIOhGhw_1776956082
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-43d780757eeso4185750f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 07:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776956082; x=1777560882; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TdUVkFiLAqBCJes+oJ0QB0pTbT2jdIw+uaSjtun6geI=;
        b=CnA0t39GN66aBCJ4CDapQLEd1l/vYCwSFJVzw3qIP3LONwah90G/Q3P4BoRjL3USHz
         tlOtLuR5Y0ss5TTjpQe3njEOdeveV068jGv89jjpLnQYln0ZleIpCcJMi9xrBS/9Ntsm
         s/H6E2YaeTs6uFA7TanZZHwDwQbcJ2rqKI5s0uSDpTgiuOREN4w9JVWTKwXA3jqLUvwl
         CCfhjaQvTG2pmQ9JqeqQJe5VMtWaIqQn0SxeX4fu89daIa+IbvmplirS96ucOMLOJgFi
         0ExVMmPcmx3srJbPUgKDIB7HRFXG6bChJez5ViuIwziPCcsjoB4YCtadti4McbKqCOMq
         NsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776956082; x=1777560882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TdUVkFiLAqBCJes+oJ0QB0pTbT2jdIw+uaSjtun6geI=;
        b=AR3dX+gJudH66+w5RkJCkiDlHIai1sukSdYzAt3uEXby4gji3762C49r/6oDohpXTA
         ipKWlTKYl3+CktDjL+YWfOEzuyEag4TJP9hocH0CpwcVIKdSD7P/60w+rJk7QTLXmgQV
         j6PiRxLe2PDRjESeRW19iCa8TCBnZbLkpf27DCbvyLTIx4JBABlShQdftdj1MN+aKh0w
         lU7gZ2nnjuRQjKm6srCdIa9vVMISezgfFOmrh6dKNrgZ4+1Xnri8e2vAtYZ/cSLuE9ak
         JR3XFvNXlKJh6PU4UDjz6LykIed61J2mjA2r6W5dYdSI/rqZSKgAIXtG+517LeCD1yMf
         72YA==
X-Forwarded-Encrypted: i=1; AFNElJ99g6cRtHcXBWFN3IafkfpUIoLc0EtCvhweYc/jo9kYsc8YofJrG5+//xjimzKagc6Rt+e8mDos8fU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf0k4eUoyAVH3vHcfXJL6ik/qoRDfpJ3WH1HDHwTwD/5r8Hmpr
	kBnXFiVIWOb2CFZe/5MhNQds0OpnoITVUPu21YKyhp/IsiBfodx+Q/gSJ4HgQrbpDBNGhZd6q3/
	nuBaU6YffSfTBjImB/whhIAeE7JiK5cPW5btuF6CnNWIXv/lK6xwJCrsMvpGsTQ==
X-Gm-Gg: AeBDieuo8yMOJSleSPAcxqeWrsSDfd7IOIKrsqapb+OjwpieSfJXoYTnk5/OwVCOZUw
	qZE2RN4kmZPU4eY+qJU44+Q8nuCJMc6SNsmyJjuZOfHdGxuC/hTQEJKg7JfVoDz8jwKNi7jVjGG
	x76C67TnXdCf4whRQ6jqwg4TXOAmWVJfEOHsQVLlw45LiKdKJ1SKICtSHLeLMUY6RhMj3Skg1Kp
	ga1KB1n//nFSgwy4NapZYNnjGNyGukvxnciFNLbWSFwGBZS5IZ5aSJOcTDYToHJ7VPNTwOaNGWN
	U7QBwnDuObcq4lfSKWAdni0jH7tXsUqbmJscl6pX3CUUJ7Q1RZniOcVXin6bcdieMw72IIfZHvb
	+WrkMEyedGfb10S3DklaHVl/uwShihaqbx+85Y1g8ALwjFn/NCV16N2fj3OCOHQ6EU58=
X-Received: by 2002:a05:6000:4a1a:b0:43e:a8d8:f3dc with SMTP id ffacd0b85a97d-43fe4052190mr36059637f8f.13.1776956081712;
        Thu, 23 Apr 2026 07:54:41 -0700 (PDT)
X-Received: by 2002:a05:6000:4a1a:b0:43e:a8d8:f3dc with SMTP id ffacd0b85a97d-43fe4052190mr36059588f8f.13.1776956081154;
        Thu, 23 Apr 2026 07:54:41 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.93.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4daf2sm52345982f8f.33.2026.04.23.07.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 07:54:40 -0700 (PDT)
Message-ID: <8e81d2a9-e095-4687-ae37-e4328bedb7a6@redhat.com>
Date: Thu, 23 Apr 2026 16:54:37 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-deletions v2] net: remove unused ATM protocols and
 legacy ATM device drivers
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 andrew+netdev@lunn.ch, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, linux@armlinux.org.uk, tsbogend@alpha.franken.de,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 chleroy@kernel.org, 3chas3@gmail.com, razor@blackwall.org,
 idosch@nvidia.com, jani.nikula@intel.com, mchehab+huawei@kernel.org,
 tytso@mit.edu, herbert@gondor.apana.org.au, geert@linux-m68k.org,
 ebiggers@kernel.org, johannes.berg@intel.com, jonathan.cameron@huawei.com,
 kees@kernel.org, kuniyu@google.com, fourier.thomas@gmail.com,
 rdunlap@infradead.org, akpm@linux-foundation.org, linux-doc@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bridge@lists.linux.dev, dwmw2@infradead.org
References: <20260422041846.2035118-1-kuba@kernel.org>
 <aeh0CV3UQw1quCXv@ashevche-desk.local>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <aeh0CV3UQw1quCXv@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/22/26 9:08 AM, Andy Shevchenko wrote:
> On Tue, Apr 21, 2026 at 09:18:44PM -0700, Jakub Kicinski wrote:
>> Remove the ATM protocol modules and PCI/SBUS ATM device drivers
>> that are no longer in active use.
>>
>> The ATM core protocol stack, PPPoATM, BR2684, and USB DSL modem
>> drivers (drivers/usb/atm/) are retained in-tree to maintain PPP
>> over ATM (PPPoA) and PPPoE-over-BR2684 support for DSL connections.
>>
>> Removed ATM protocol modules:
>>  - net/atm/clip.c - Classical IP over ATM (RFC 2225)
>>  - net/atm/lec.c - LAN Emulation Client (LANE)
>>  - net/atm/mpc.c, mpoa_caches.c, mpoa_proc.c - Multi-Protocol Over ATM
>>
>> Removed PCI/SBUS ATM device drivers (drivers/atm/):
>>  - adummy, atmtcp - software/testing ATM devices
>>  - eni - Efficient Networks ENI155P (OC-3, ~1995)
>>  - fore200e - FORE Systems 200E PCI/SBUS (OC-3, ~1999)
>>  - he - ForeRunner HE (OC-3/OC-12, ~2000)
>>  - idt77105 - IDT 77105 25 Mbps ATM PHY
>>  - idt77252 - IDT 77252 NICStAR II (OC-3, ~2000)
>>  - iphase - Interphase ATM PCI (OC-3/DS3/E3)
>>  - lanai - Efficient Networks Speedstream 3010
>>  - nicstar - IDT 77201 NICStAR (155/25 Mbps, ~1999)
>>  - solos-pci - Traverse Technologies ADSL2+ PCI
>>  - suni - PMC S/UNI SONET PHY library
>>
>> Also clean up references in:
>>  - net/bridge/ - remove ATM LANE hook (br_fdb_test_addr_hook,
>>    br_fdb_test_addr)
>>  - net/core/dev.c - remove br_fdb_test_addr_hook export
>>  - defconfig files - remove ATM driver config options
>>
>> The removed code is moved to an out-of-tree module package (mod-orphan).
>>
>> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
>> ---
>> v2:
>>  - keep BR2684
>>  - correct the claim that Traverse Technologies is defunct,
>>    I'm still deleting the solos driver, chances are nobody uses it.
>>    Easy enough to revert back in since core is still around.
>>    The guiding principle is to keep USB modems and delete
>>    the rest as USB ADSL2+ CPEs were most popular historically.

A possible alternative would be moving the solos driver (and others
similarly old, possibly not used anymore drivers into the staging dir
(and let them be removed after some reasonable grace period).

/P

