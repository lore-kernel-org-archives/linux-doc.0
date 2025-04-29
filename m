Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC14269811
	for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 23:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745969590; cv=none; b=Lcv3dCkiQWO3bMq8/HZWHCEVYsQ00qGNinIx7X6HQyapgAngzLgH152XJoeg9q4QZYi9atG7MkI2Nnq614R9rxnG+Lolnv1R+RKEiCxIK4xKj+Nb0VNT+d80N3eFEiF64LDomtP9BPuOlh5mS2oilPQSWgjCNVOHPxu10TtpfiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745969590; c=relaxed/simple;
	bh=91lQyvhQ0vUeR2C5rjMPbLayVwhJTn0+N8ztV6/O+FE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=syNUTtVSreZNPQWM/w5zqvhOkl9UXqPRkroSSaefmkZWm++Q2n62hR6c/MT5V2o+3sUufzQTps4In+0mt+Piw5kbkOgaMNXI8sbj9+gGJlXyloORbATXHCDuhWMxo+14thzinYxr+38pCuJH9E9OWGTmpkXDIS0Kh6FwID8t3Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XvOjz2Z6; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XvOjz2Z6"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3d817bc6eb0so21758925ab.1
        for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 16:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745969587; x=1746574387; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=57VBGGVBY85MK2UKVXxeo+EoMCdb9fTe1GaMwG8NQ00=;
        b=XvOjz2Z62vKzRHJ1GfxUhlkG3jS/VRjAY2VIOgqSyZilWjplmYeE53Db7viuRjL6c6
         eOrcu5fM+5unfQ4ty9Dm6OYlI7J3C/eej/8cKvYjx4CF9TIB/OlO1S5/mg5bQYdPLW8h
         UZZ9khG30C3crwfmvY8SunPMacIi1jDIV+TA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745969587; x=1746574387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=57VBGGVBY85MK2UKVXxeo+EoMCdb9fTe1GaMwG8NQ00=;
        b=BcUuuo98Vg8GCfcCr49jwXDDilrLOCCL6rSvKYtFKK5GzaDsqFxavvzHfYdJPHEYOZ
         t7r9MJut+cSE1s5v8LJ10f4mX5JzJ8tIUF7sPQFo0KFWGU5ENWPqv5KQG7ydydM1ifwo
         KdTs8A3O+NPOzGxhyw7aqR28GMrndefSKjUhGYv3s74UAEqs4/e17Bvka+m6NDdz7CgG
         nz/cjjanN+qVA26DpVwNUeFewdq1r9J7jk+odqiaCwARhWOWCmJRq6KSW7MlzgVf/L9a
         29QKoXHtgh2iFnnVYtI0+8s5Mvw5WrWf+0n/zNqh4jLT09x2cIrFtUc+d4MAOCVcc3Bq
         lhVw==
X-Forwarded-Encrypted: i=1; AJvYcCVvW7DcN/nuYZYiq7DITJt9htH/wx0WyWij95veZCenAGZMurzYAwf2+YR0+K1639A/hm/+V9mOxmM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw688B75N5thZHAQjcGvd66Y93BGmVgAWmT4P/s118m1oKJLjY4
	2hUG5V6LAItP0YPpz5XqUAbMN5AJaenipSmCkiAWfQJ3OorTjCp3YSU4Ex9c4ZY=
X-Gm-Gg: ASbGnct7U8LU+4fRpsM5U/puTkQ037Gl70Fua/vEaVzrIfwlZSlppAxaITLlxxCRc37
	CAgf8KrSOMaRyMY+t/bnVqQhLpLWg2yWk09F24zzGnQjOCBEawtKWMzvftVJ4YL57bDGO8SAHKk
	C92+70pzro+37qtj4HigidqupB4y4oBpvqAgoYcv4J1hKxYJtRqbu+cra0FQQwWS1gu49QvGyQW
	vzepOoOkiimhDMyzKTlV3TG7ROexqkagEpwcQoEpGnK4XFU2TZ6eGTJS4jEmoZO6hM6RPMZ2hYF
	ldl1agpaM/nPGQgRIaK0mtV9GK90Hs9T4neaaFg5lWVKl3/7IjY=
X-Google-Smtp-Source: AGHT+IGmi1rtml3AlLb1Q65Dbn3WTPaIc0r44Elktf5kpSPRnHKwm8fFiAMDfsyaGULJj9rb9LE01w==
X-Received: by 2002:a05:6e02:2502:b0:3d6:d145:3006 with SMTP id e9e14a558f8ab-3d968009f6amr4296895ab.20.1745969587055;
        Tue, 29 Apr 2025 16:33:07 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d95f476892sm5211075ab.65.2025.04.29.16.33.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 16:33:06 -0700 (PDT)
Message-ID: <589336a3-4df5-4f58-a627-2b75716f7b61@linuxfoundation.org>
Date: Tue, 29 Apr 2025 17:33:05 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] doc: kunit: add information about cleaning source
 trees
To: Randy Dunlap <rdunlap@infradead.org>, brendan.higgins@linux.dev,
 davidgow@google.com, rmoar@google.com, corbet@lwn.net
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1745965121.git.skhan@linuxfoundation.org>
 <7104475f60568f6a580b03d84e61abe311d63e46.1745965121.git.skhan@linuxfoundation.org>
 <c3333ef9-f266-4260-8f75-0da65bcff1da@infradead.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <c3333ef9-f266-4260-8f75-0da65bcff1da@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/25 16:29, Randy Dunlap wrote:
> 
> 
> On 4/29/25 3:27 PM, Shuah Khan wrote:
>> If kunit run happens in a tree in which a x86_64 kernel was built,
>> the source tree could be dirty.
>>
>> "make ARCH=um mrproper" will not clean the x86_64 build artifacts.
>> Running "make ARCH=x86_64 mrproper" is necessary to clean them.
>>
>> Add this information to the documentation.
>>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>> ---
>>   Documentation/dev-tools/kunit/start.rst | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/Documentation/dev-tools/kunit/start.rst b/Documentation/dev-tools/kunit/start.rst
>> index a98235326bab..568e29aebd6e 100644
>> --- a/Documentation/dev-tools/kunit/start.rst
>> +++ b/Documentation/dev-tools/kunit/start.rst
>> @@ -39,6 +39,18 @@ can run kunit_tool:
>>   	``make ARCH=um mrproper``, just be aware that this will delete the
>>   	current configuration and all generated files.
>>   
>> +	You may see the following error if a prior build leaves behind
>> +	header files which 'make ARCH=um mrproper' fails to clean:
>> +
>> +	"undefined symbol sev_es_trampoline_start referenced ..."
>> +
>> +	This is special case scenario when a prior x86_64 build populates
>> +	the source tree with arch/x86/realmode/rm/pasyms.h. This header
>> +	will not be cleaned by 'make ARCH=um mrproper'
>> +
>> +	If you encouter this problem, run 'make ARCH=x86_64 mrproper' to
> 
> 	       encounter

Thank you. Will fix it.

thanks,
-- Shuah
