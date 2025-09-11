Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E515421019C
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 17:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757610049; cv=none; b=EOF8Se9akCHrbJNwGhW1kxr4QBSztm9FzGc1fRUQ5/XTNQF752wOQSs2RNm6t4+Qlz7JHN+WseER1W1mZ3d2oeqnAcdixZhg7fbHqBfM2ZR3S/zxsccWTjt4NEvDYUJ8Mg4jAtjy/ZUrEcrkgyBOnbzyNvc4vqDbZRXCxgqKMEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757610049; c=relaxed/simple;
	bh=y3ENDcuottwL/DKrenKbQJZ1eqbV0Flkl/Xv//bodSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B1R5qIs5k/Okkk+ME1lVHE0UmFk/Hcur/OnIlY8/5rTECfHL1OjjKhdpgjKdmaZowkhY5x9lvKUeQ82Ibd/NW1WoKnxRFwvGJAm4y3kOHIwae8rmwnnS1qHu2b3Tnig1GhxBmws7AiJd9e7waBPR/WQfQvt1qgmsp5Noex2MFfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WB7FGuEg; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WB7FGuEg"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-56369a999d2so107601e87.0
        for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 10:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757610046; x=1758214846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=69yPHnIsLNbjSOnGkb91deN9ujmIDIbQEy9l+ZyKWrc=;
        b=WB7FGuEguO+dYY55g/XFi4KCU0jRGHuGSL9+qp9LdxGIDf2yI4Gi17Jx2dtnNIAiVa
         jN1zWB/qdU1yFy8Kp4fdEPnFSR1njgIUZA/p6G8GE3ikUfZ4fTRSGeqRh/3HbrhfD8RG
         GQEvncpTXWA7A8+ww5oUQv/aoE2hE43lk1b5T6ai1+EI8QeY8l6zLcHDtkxjDSXIoMPo
         wJIb/5eBgdrfthTMoL/VDodIamBydoef/c9sarbqXPUBKYBN2ZPqg2dxvFPKX3ITAcnl
         4ushg6y3FL3AUGOyGpHDRKXuVftol+KSiJkuTd/d7+6jL1C0LMN53KXbBSZMbB3p/9Qg
         XB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757610046; x=1758214846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=69yPHnIsLNbjSOnGkb91deN9ujmIDIbQEy9l+ZyKWrc=;
        b=txr1VJF5RRqeO34Hq+ULR7lnCAvL7IsRpN/OBzZFZ79sPVfmKiXPltiP27TGaMEcYm
         aUJtuBVe2lQg05xVDIxKu1N/a0CuS7o6yu9P6eY6NvY5MR/zbJVs649KcDMr4scF2atI
         chNhcIJZao0rui7pV37AYERqi+UGn1lsDN8V5kjD23qF1Iq1T7Je480gcS3YYCDrWulV
         WdcTpsxDbooUUaLJ/3PiWfGN2g8mlxLDSLM4KK3sysyhDHKoliTTRFBT65aUTuwuYvmg
         Lj8IGL+Kv1s/Grd8iHg5yZzZW0EfxG6ewSXjuzS75K1JlgwE8W11FCgU4RV7Fn0QHRUb
         nasw==
X-Forwarded-Encrypted: i=1; AJvYcCW2KJZrNj0nPA4Y20yzaoHqQHizBV9+xaMCGI9Wmc6y6O+M0WiDMlwbNqvtvX7GGvqXKgi4lJml8RM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yycu9QnsO9wnRzU1ZXJaDjf0tXtCzPyxS4jz1L+ofJ7Rua4suaT
	0vdc5o52cExhn85tIqVd0klNkTgkcnuYiinPO7Fwpchm9U0LntiOO9MU
X-Gm-Gg: ASbGncuu74TGL3vT88qW4xSAfOwlhOx+Rp1ARkJV/uOeHEi8utl9lE+Hu6ks/H4+hjc
	mOZ51o7Nss+LrTW4aimi5EzfbsFdKZRrpZC+dIpf94QiWppCuSp06PbxKO9u342eeXyhw/5iQBF
	A1pFsEepSoJrZbOrhDzRw6MNK2r6oKEhpkgj4Gl0ojQecFoGp6yghh5AlFNDxmYECVSXKjP1aYj
	IXUQVbCn2N+9ZIHxJhtlKJax0v4U8r5QHaofdJpRZ59ttq0EaFi8+iPvIbGZSS05gypO7j5QFfz
	X/tdQdxo8GZv+bLex8O9/iwfL/X+VefNK4a3dWVPZeqIXHwyiYmMpVHWEFwUWRK+Mr2pqCvnDOL
	9sd3iPoqh315Ko+2iptBkh4Zm4eKXZN6yM1On5Jg=
X-Google-Smtp-Source: AGHT+IHnjKPKaFzoMDps2A1lwwHuk+aMxy5X6+2P1DS5X0ZAITIfcYgwM13XJrpIiuwwI6P6z7dSYA==
X-Received: by 2002:a05:6512:3da1:b0:553:252f:adf4 with SMTP id 2adb3069b0e04-57051f3c81cmr19486e87.10.1757610045703;
        Thu, 11 Sep 2025 10:00:45 -0700 (PDT)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e6460dec4sm523403e87.103.2025.09.11.10.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 10:00:45 -0700 (PDT)
Message-ID: <9f548efd-babf-45f2-99bb-e013c810ef72@gmail.com>
Date: Thu, 11 Sep 2025 19:00:12 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] kstate, test: add test module for testing kstate
 subsystem.
To: Randy Dunlap <rdunlap@infradead.org>,
 Andrey Ryabinin <arbn@yandex-team.com>, linux-kernel@vger.kernel.org
Cc: Alexander Graf <graf@amazon.com>, Mike Rapoport <rppt@kernel.org>,
 James Gowans <jgowans@amazon.com>, Andrew Morton
 <akpm@linux-foundation.org>, linux-mm@kvack.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Baoquan He
 <bhe@redhat.com>, kexec@lists.infradead.org,
 Pratyush Yadav <ptyadav@amazon.de>, Jason Gunthorpe <jgg@nvidia.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 David Rientjes <rientjes@google.com>, Pratyush Yadav <pratyush@kernel.org>,
 Changyuan Lyu <changyuanl@google.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, Chris Li <chrisl@kernel.org>,
 Ashish.Kalra@amd.com, William Tu <witu@nvidia.com>,
 David Matlack <dmatlack@google.com>
References: <20250909201446.13138-1-arbn@yandex-team.com>
 <20250909201446.13138-6-arbn@yandex-team.com>
 <1c79b3c7-5847-4960-9454-0c70d02a6441@infradead.org>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <1c79b3c7-5847-4960-9454-0c70d02a6441@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/10/25 2:33 AM, Randy Dunlap wrote:
> 
> 
> On 9/9/25 1:14 PM, Andrey Ryabinin wrote:
>> diff --git a/kernel/liveupdate/Kconfig b/kernel/liveupdate/Kconfig
>> index b6ea861006bf..af9a25bdcd6e 100644
>> --- a/kernel/liveupdate/Kconfig
>> +++ b/kernel/liveupdate/Kconfig
>> @@ -69,6 +69,14 @@ config KSTATE
>>  	  state, save it into the memory and restore the state after kexec
>>  	  in new kernel.
>>  
>> +config KSTATE_TEST
>> +	bool "KSTATE test code"
>> +	help
>> +	  Build a simple test/playground code that is useful for kstate
> 
> 	  Build simple
> 
>> +	  subsystem development. It contains some structure with different
> 
> 	                                          structures
> ?
> 
>> +	  kind of data which migrated across kexec to the new kernel
> 
> 	  kinds        which are migrated
> 
>> +	  using KSTATE.
>> +
> 

Thanks, Randy. I'll fix this up, and the documentation as well.
