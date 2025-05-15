Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D2621B9C0
	for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 16:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747325106; cv=none; b=W1ylMBuFev9MNUFKhIphM7Zbs0698oR2TzkbgmzMWA0ekNSrTWBq9iD12334fuqz5bKgFjw19qsGgANLL1SfTB7jXXPgJe9PfH33ZzyyS2ffExgwXMVKMKMVznQZJZJmAlTn28tj747goExBdE0CRX1OGOPVrygrDbmbAlQBlRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747325106; c=relaxed/simple;
	bh=lqqfSNMdSrksNnDgecX0dYoZpavdojtFlDEi6NOHurk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=klMPx1nqBObAT4LoiIL3wJ3pMigvRue3tjIFyorIpQM4KaBAEaDn5h7PTpyqlfU/BKsd40u7nGfnPYUBWcwI9hruhkSK4YDC7XljqPC2x6zENJHju2i+l4OzH1YUDndyXvusrxHq4NArI+emOjXl6j1q5meXt5Mv4fSiJbydEvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FkguSUBf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FkguSUBf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747325103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Q/D3/aT0Ahsv4kPdgtfpkZeNzhWCseM3fk/LmCTRabU=;
	b=FkguSUBf0J4LkSdas0RZv+RoL0F9fCB8o32sXfJzyTLflnC0KZAe/YVSe4Bm8I3tn5y0lS
	m/HwTuMI/FUhw7UQSP79kwRTFDhliLWNCB29qMU6dMTPnR2tlcDN6L2dQujA8yeGUaW0jn
	CM+UiXlA1LHORFvDEVbyJl00nDbx6pg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-LpBn5ShyM2uQqzSBr1c1Hw-1; Thu, 15 May 2025 12:05:01 -0400
X-MC-Unique: LpBn5ShyM2uQqzSBr1c1Hw-1
X-Mimecast-MFC-AGG-ID: LpBn5ShyM2uQqzSBr1c1Hw_1747325100
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a35c86b338so60798f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 09:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747325100; x=1747929900;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q/D3/aT0Ahsv4kPdgtfpkZeNzhWCseM3fk/LmCTRabU=;
        b=JFxw0hjqOQMUvAX6lvnbFLzUAhBK84iwfIDgxRHntVZ0jpHdKvr0vfH/PslakhYReL
         r83FbhTpyiMmJ565cHqH0/7G10LOfCTmKv12p9NxuaqMtBgUNhb159mO0pI1H5ssu/eE
         fxMhV4nDkLylmTKbLRA2dmWdZB6pKuuMrzfG6cO9PKVw5k3C1JWH1wV+tzoC/j8AhqCv
         XsWKtGTqxys0exL5wBGcPCEPufwe75OOzKqEJs6RydJtnmLOAYzUzwcCAQrjE3YBwoKA
         Y4xCKhI4/YaDYJ5llkoQ2Z416FnxSMSfRHePbIX16inL3z5PHeFFdWakzX4UR0Wx7lAx
         ZFuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbH4lEorMwbD1xS0PxiGVNIPUB4VEneeEOy694yZedQwxi2WUjNGlzfDyoeEpgMJprZiMIGLxBwuw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmK96NOjvHu4pBSFGYHAggGIONhZSXdJ+Y6E/TMEaTqu0BFquH
	GK5o8nXgl6dvWY6qvL7zqebZpWS0HLPCJM1G35bKwlueyKighRCisONFwyiCxJg/Mr0/a6fjrkd
	osVAcY8THEHKeH+1BWbUMu9rdRVAGkUibhr0t0pDX+ojTKCjcBtb4DN7VmspnpA==
X-Gm-Gg: ASbGncvI1tCAjxZAyuu/tbqRIz7dLfYXJFu6xBKYnT4umD/K8lSv8hP8johmiCqiGZG
	3CRWB+JBS0D8tfqcppi/46OkGd+srxWBthfIbc2BTDmEbCRta1ZRpjDXSBOug42hdMsF2JcQ7A3
	P0oXzQV3Woj64JaLPnrXsWq+mT5BPe+yPoIl6aA6Mz43cU1xdsnBxjsgDCsjHKwqNq0iM/rxzHK
	RglDo50ZTIMubn8xrLaNQTjpOfyabeQlFkkkYBVQ6Lq6eswB0Tn5/Iz9s7G46YMDsii8uu5hnBG
	Gn/wmoLHmw2gMXaPwW8/WMhXedwPz/SVq98rDIu1tWcMGYBnKe4rgh0NEtNEuPgDFFhMOrpCArp
	5LrVNyOPZEA+uZv1UmSIIyhIYL2CK3JQC3KHR1lc=
X-Received: by 2002:a05:6000:2486:b0:3a3:4baa:4146 with SMTP id ffacd0b85a97d-3a35c825d23mr374907f8f.30.1747325100262;
        Thu, 15 May 2025 09:05:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFl2K0fFMSTjEqLP6qPqDBAxLNpwT13jconYfR5p9OgM8lQ1fVoHvwGDlaQ5mD9XErQgQl4Uw==
X-Received: by 2002:a05:6000:2486:b0:3a3:4baa:4146 with SMTP id ffacd0b85a97d-3a35c825d23mr374845f8f.30.1747325099769;
        Thu, 15 May 2025 09:04:59 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4a:8900:884a:b3af:e3c9:ec88? (p200300d82f4a8900884ab3afe3c9ec88.dip0.t-ipconnect.de. [2003:d8:2f4a:8900:884a:b3af:e3c9:ec88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f3369sm23428151f8f.57.2025.05.15.09.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 09:04:59 -0700 (PDT)
Message-ID: <ba18e52a-f1f2-46a7-8c9e-90a0df04b7dd@redhat.com>
Date: Thu, 15 May 2025 18:04:57 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] prctl: introduce PR_SET/GET_THP_POLICY
To: Usama Arif <usamaarif642@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
 <6502bbb7-e8b3-4520-9547-823207119061@lucifer.local>
 <5e4c107f-9db8-4212-99b6-a490406fec77@gmail.com>
 <e3efdfb7-d309-43c8-be39-c02d886c5b45@lucifer.local>
 <ef6c91e8-19e5-4e86-be1d-dd066a141ec6@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ef6c91e8-19e5-4e86-be1d-dd066a141ec6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> Please no :) 'VMA' is implicit re: mappings. If you're touching memory
>> mappings you're necessarily touching VMAs.
>>
>> I know some prctl() (a pathway to many abilities some consider to be
>> unnatural) uses 'VMA' in some of the endpoints but generally when referring
>> to specific VMAs no?
>>
>> These namesa are already kinda horrible (yes naming is hard, for everyone,
>> ask me about MADV_POISON/REMEDY) but I think something like:
>>
>> PR_DEFAULT_MADV_HUGEPAGE
>> PR_DEFAULT_MADV_NOHUGEPAGE
>>
>> -ish :)
>>
> 
> Sure, happy with that, Thanks.

Yes, please :)

-- 
Cheers,

David / dhildenb

