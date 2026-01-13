Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C347345CAE
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 10:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768299340; cv=none; b=dpWpWCGFeImPcr7jOtQomJnInVe/qYdENkyPtCY/sKJvOqRFm5WABv/y5TLgphszTom4DJ+WZaVJkp/14nUJDwnwURxpv6jAbhOnrF/1jwkEAhM+mK20ru5RURQ20iDgzjL+TbHtKj6l4B+9lrb8Rrw+SsFOlBKgdjc2RI22d/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768299340; c=relaxed/simple;
	bh=39NtxAeqpXvhawaLycQSgS8a7QXmm9U/xmb9EyW+PGc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=PwijKgWoy0K//ksoD65mkswfAnit5wzHbZZR+ZzAr2bqmZxDhMstEZElvz+NhgFdfC3oIeF5sLjqcCzc8AnRHtyRdILqD5+ujUTzMbI2D3tMwY9kr20aG6aheuprjXUGvugnKpTor/hxnrFzfhGdQoao44eZ5Sdd1n6vgXV8BzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FbmZWRQ/; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FbmZWRQ/"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59b672f8e40so8273356e87.2
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 02:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768299338; x=1768904138; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VgnN5gtqEe3Q1O0kTTet9lBrugKrM6JP8dsQeWrl1xo=;
        b=FbmZWRQ/CjC/zAWrHc4TpeuE+vl74B0dKiiGMABvj7nxsNBq7zrQ+4sFgo2Uf7tBov
         61c+pLyudHdgEJjMjcWh8ksLmMKKv6ubE7VrpksCkvrNW0SMKh9U7qdKuk8QR890zVsg
         lUnTXuRrCAQXDoFbgedFpiw+lWnRZYqh7eo6y/k+zecdIKJ4iVXfbhf2D6Z7WT2ThDWS
         oIZfmBHSOiEmSip6DM09cNOfQAF8eDKBrrKmjW8WqXiPe2Gsr8+JV/SbjgQCgukK+lt4
         iTFrdNQFveS9i/F7Pn81VgC5xGTRUNfWqyUaO0T/v4xdzrR5+t9hLyT7tTpMHaND1Vd6
         Sqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768299338; x=1768904138;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VgnN5gtqEe3Q1O0kTTet9lBrugKrM6JP8dsQeWrl1xo=;
        b=BiGJrMlRulw4zq72Y0WPemmejCxdDpynjfyLbieqLky8PqS1EsIAj6pm3bJWis5Txo
         QvnD49qyGeRo/WzK4Is12n5pfqFZ8FgnddYb5o6DPA9uTll9XuA55+y9AA45RTIEk+Ws
         84fzC9WgCmsFkBbbeK5hoHeFar3S+yEAg8T7x991xFpEy3xakWuJDWvupqT/fi63C1UX
         K4ZKK+pp37AfbFE5Krx+8DU7OYXTVmiZpQIdMfF0AyjZtZ8WCmSfbsoPuyEr1Ed2HtkY
         aodxLe0LgnlDcrpnHWP0S+G/T+KDi/UEIPzrfXR0srK2n/n0QmYjG5JTt9u6uNMpmccX
         mWyA==
X-Forwarded-Encrypted: i=1; AJvYcCVThZRLuarrr+XhkuC0xjx0sphASZyRczHGRR9Kbs5D7EsDyukJ5b630NGHkpWYVUfp+DRX9gERP6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSV6KclsTtgyPc0qCwM9u80aXwGHDy6o2kuhM0N56s4IJboEFd
	m7lGp5gddpTmOGKiJHNKY85retHPxTLT5PUL2ZVBtuw0/z6mhm491GGaIN77Lw==
X-Gm-Gg: AY/fxX5f16tbb3y2NsCyFvRPFx57rwDQnJtJJRutoBeU6c5zmnGncQkOkclZNXJ5IxT
	3iHy6Sq8w2Dt7PHg3kUX1HbyACKPU74t+f/r2/IB3T74o+SJufFhYds8i+d/RTaMNgGMFnPKmc8
	jOhoU6JwUkBlOt66hY5Z1vB+f0LisJHtSO29Kru1TRqZ0QwK6vGBOfB0NZRPNJzQyCJnHgLIobQ
	Q/NTXMQvtkn8LBpQOUouqUEqwegakrBSCJRiysARi+8tIa4WPEsvJ/trLMRHmUWIRz3Z365a0p4
	HvLmzyyHGMcGzcQ86Aqx636LZAR/II6mPnu1YUzCIOFnEfyaBvd/WrDdXKqSdjCJYZtDa1/1XfS
	ckvhiDyBQSt13ZWj4uMU+no+f754OtlWDAG1hl+p1V9gSppeDBjOnV3UeqaRZ+Fkh8Q7d1GOu8r
	Cvz6KQp3RmyCJRE+4H1PmOensPg19EG+MML0aXSU3t4mkhK+WWNr019jpG4g==
X-Google-Smtp-Source: AGHT+IEOoK2sWcGzQ5k4NJjsFR/RmdeWAB9vvZrFfNJ0u+S6dsEFK74/fdYnqiqEV2XmHMt6sJ390w==
X-Received: by 2002:a05:6512:138b:b0:598:e851:1db3 with SMTP id 2adb3069b0e04-59b6ef05760mr8236951e87.11.1768293628066;
        Tue, 13 Jan 2026 00:40:28 -0800 (PST)
Received: from [172.20.10.9] (mobile-access-c1d2ca-216.dhcp.inet.fi. [193.210.202.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b72f3ae82sm4416299e87.71.2026.01.13.00.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 00:40:27 -0800 (PST)
Message-ID: <f861a1c6-7ec7-477c-bc42-f9aaf6724bed@gmail.com>
Date: Tue, 13 Jan 2026 10:40:22 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/29] arch, mm: consolidate hugetlb early reservation
From: Kalle Niemi <kaleposti@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>,
 Brian Cain <bcain@kernel.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonathan Corbet <corbet@lwn.net>, Klara Modin <klarasmodin@gmail.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Ritesh Harjani <ritesh.list@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, x86@kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org
References: <20260111082105.290734-1-rppt@kernel.org>
 <20260112142323.495fc43e662e7d276b0fa371@linux-foundation.org>
 <86b974d7-cabd-4913-b5f2-5b62b520e023@gmail.com>
Content-Language: en-US
In-Reply-To: <86b974d7-cabd-4913-b5f2-5b62b520e023@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/13/26 08:50, Kalle Niemi wrote:
> On 1/13/26 00:23, Andrew Morton wrote:
>> On Sun, 11 Jan 2026 10:20:34 +0200 Mike Rapoport <rppt@kernel.org> wrote:
>>
>>> v3 changes:
>>> * fix empty_zero_page initialization on arm
>>> * fix ZONE_DMA limit calculation on powerpc
>>> * add Acks
>>
>> updated, thanks.  I'll suppress the ensuing email flood.
>>
>> Kalle, can you please retest sometime, see if the BeagleBone Black boot
>> failure was fixed?
>>
>> Seems we haven't heard back from rmk regarding
>> https://lkml.kernel.org/r/aVrUDeSkqqY9ZCtS@shell.armlinux.org.uk.
> 
> Hello!
> 
> I will test this v3 patch ASAP and reply results here.
> Collective sorry for the delay; I have been busy!
> 
> BR
> Kalle

Hello!

I tried this patch by cloning 
https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/log/?h=hugetlb-init/v3

Boots succesfully on BeagleBone Black!

BR
Kalle
