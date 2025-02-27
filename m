Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCFB1DE3C4
	for <linux-doc@vger.kernel.org>; Thu, 27 Feb 2025 16:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740672767; cv=none; b=e5VXFDwOhFQoC64ziZvn509ajL0G2L4Rtc4bUptZoqHP9NM7YT//ADnSRSAvIHuY3jHNYi0GYOD4FgDyJd/SmykqPK91XF4ILeqT1MBAtx3akUGzuMGjWEIyIFMJLzL+zY2xB2YDVVUYYMKAANZa/Oa/qlBihm/PzOTnvxqX1WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740672767; c=relaxed/simple;
	bh=1B0baukk8wkKOrWBLrryYto1XBCAZ5THIRI3bdA1or8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rBa+q7VbyL2YFNweS4jfHlSyx7/ayP7mnBHkG33rUbDbvEDmgCAeoEu1x646rVdWxUfjnl883Ad8u5v4T4f9flzh3o5MYElz/86o2vt7YcTL4e6CxOBHJqSF1hgCIL0jKFhF8iWm7OJL6yjs22kffslgdlVTreKXSBC7GNYgBbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ylct2VKx; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ylct2VKx"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab7430e27b2so181944366b.3
        for <linux-doc@vger.kernel.org>; Thu, 27 Feb 2025 08:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740672763; x=1741277563; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+URe4l4GJhqH8ce+Ye1sM1VEzjf+QaS7p2yiXPuh81o=;
        b=Ylct2VKxaWZZpvoVaOoS4MSuId6Ql8tcOV6o6eXWJgb+7ku67keuM9q80UjtGO+bx5
         XAT1AqFja0HUenIOPycNS2nhT27CKd0plfG8kHeytllvhk2prM9vJ705OD6ofi+nbDND
         gBRC8va4a2olvt1O1HHUrqcPjnjLT3+hxIN9G6O1TxduWyTsKrgYLsxIf21uxswGrLMV
         SuAKZ5F8s53OUgqvqF7jsznHPYE9iLC7KvRsAiGEoEyD9aEujkeS3//rjsDb2J+4+CTp
         mcd5UrBDw94pYMfRlR+j0iLClRr44iMPPSRTqT1X0Du1dHAh0EkndHtxaUNBJ1X2eUh2
         wxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740672763; x=1741277563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+URe4l4GJhqH8ce+Ye1sM1VEzjf+QaS7p2yiXPuh81o=;
        b=dXunSX+GUl/xlF+us3Ch26OgC9wqvIkDSPvWCqVNu49qxyzEwNJldJKeDeav9YM/dj
         rvUAOYpVLTYdi8SStBD3P6CQSEcujKqUH3B3vhahsSF62zni7H+Rc3s0zS00LVgyltfb
         dmD/6as/a+cb4r1KggPd3BI2QdcKcwmA7rqmaVaeMGSqzXerpx6Eb3P2q55L7A9QW5e1
         OKqSRupRcaWT8crNscwhomIHY06vT+UNlaSmkDhLeEq7k2DwTvkvbFfwlbSpfjpo9uti
         je8mtom3wWY6CjoQzEa62bJ23yktNdLu3mOl+pzNZiLjoGCk6YGRCxwXZ8r1DgCRY4ma
         DAmw==
X-Forwarded-Encrypted: i=1; AJvYcCWsP82H945bPW9UkjozRh/eu/puZbpSKdajuuo+uheZhb5Oh55tby83WTMZ2wQD94S2d+QF3ImzWrg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbifHcoUE3Gh4bK+LkHnVdlvUBoy4Qx4HY90MIefyZhaJrE9fR
	M3QJuVcYksk8tBlarSHGxa8iHRupcMY2UzntaK8aUDUF/avP6rfiCU9g40EZogo=
X-Gm-Gg: ASbGncs9kP57RvThShliGv0Pb++itWclEnl3mN42sk/8ORf3Cm/gZcHfqgAFplSFf7S
	glGJLI6W3VX/oKJQTZXNRTftcYIO1fANef2+xxH8469RjEpuNEaB02DkyDC2/+SjqthOIREIa+2
	+IXdhYj7B7RKvjInmaK+RrirHv/PxIOh43XjeG7C1KaGNwMzpkhJ8P+JCttuR3VnC1TdQqBkqTS
	KNkRqITifr9P0AP1QEYtcP8r305+Bwkrbs6RgttVBLxpdTv4n6w8eVe0NbnDj+8zkvpSdNptben
	L3lWNnKc6qaFLWq8xXqbLN6FehCfF/jJcp4Wm+bhDQPwkCY/cTnCQsFebpqebzaViNfg
X-Google-Smtp-Source: AGHT+IE0fDWdYp4mhDV4izDKRhRUb/i7cABjqRBwrDib2YU3lQR3wBE+FeIurjA8jt4nIowndYjJ4A==
X-Received: by 2002:a17:907:d2a:b0:ab7:fc9a:28e1 with SMTP id a640c23a62f3a-abc0de5a487mr3052219166b.52.1740672763076;
        Thu, 27 Feb 2025 08:12:43 -0800 (PST)
Received: from [192.168.1.57] (93-41-52-155.ip80.fastwebnet.it. [93.41.52.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0dd6ccsm146200766b.57.2025.02.27.08.12.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 08:12:42 -0800 (PST)
Message-ID: <e052eb20-09ff-4917-8841-95af889afd9e@suse.com>
Date: Thu, 27 Feb 2025 17:12:42 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: livepatch: move text out of code block
To: Jonathan Corbet <corbet@lwn.net>, live-patching@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jpoimboe@kernel.org, jikos@kernel.org, mbenes@suse.cz, pmladek@suse.com,
 joe.lawrence@redhat.com
References: <20250227150328.124438-1-vincenzo.mezzela@suse.com>
 <87bjunqtg8.fsf@trenco.lwn.net>
Content-Language: en-US
From: Vincenzo Mezzela <vincenzo.mezzela@suse.com>
In-Reply-To: <87bjunqtg8.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/27/25 4:48 PM, Jonathan Corbet wrote:
> Vincenzo MEZZELA <vincenzo.mezzela@suse.com> writes:
> 
>> Part of the documentation text is included in the readelf output code
>> block. Hence, split the code block and move the affected text outside.
>>
>> Signed-off-by: Vincenzo MEZZELA <vincenzo.mezzela@suse.com>
>> ---
>>   Documentation/livepatch/module-elf-format.rst | 17 ++++++++++++-----
>>   1 file changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/livepatch/module-elf-format.rst b/Documentation/livepatch/module-elf-format.rst
>> index a03ed02ec57e..eadcff224335 100644
>> --- a/Documentation/livepatch/module-elf-format.rst
>> +++ b/Documentation/livepatch/module-elf-format.rst
>> @@ -217,16 +217,23 @@ livepatch relocation section refer to their respective symbols with their symbol
>>   indices, and the original symbol indices (and thus the symtab ordering) must be
>>   preserved in order for apply_relocate_add() to find the right symbol.
>>   
>> -For example, take this particular rela from a livepatch module:::
>> +For example, take this particular rela from a livepatch module:
>> +
>> +::
> 
> The right fix here is to just delete the extra ":"
> 
>>     Relocation section '.klp.rela.btrfs.text.btrfs_feature_attr_show' at offset 0x2ba0 contains 4 entries:
>>         Offset             Info             Type               Symbol's Value  Symbol's Name + Addend
>>     000000000000001f  0000005e00000002 R_X86_64_PC32          0000000000000000 .klp.sym.vmlinux.printk,0 - 4
>>   
>> -  This rela refers to the symbol '.klp.sym.vmlinux.printk,0', and the symbol index is encoded
>> -  in 'Info'. Here its symbol index is 0x5e, which is 94 in decimal, which refers to the
>> -  symbol index 94.
>> -  And in this patch module's corresponding symbol table, symbol index 94 refers to that very symbol:
>> +This rela refers to the symbol '.klp.sym.vmlinux.printk,0', and the symbol
>> +index is encoded in 'Info'. Here its symbol index is 0x5e, which is 94 in
>> +decimal, which refers to the symbol index 94.
>> +
>> +And in this patch module's corresponding symbol table, symbol index 94 refers
>> +to that very symbol:
>> +
>> +::
> 
> You can put that extra colon here rather than introducing a separate
> "::" line.
> 

Hi,

You are right. I'll send an updated version.


Thanks for the feedback,

Vincenzo
