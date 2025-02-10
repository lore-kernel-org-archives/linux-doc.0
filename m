Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954A922097
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 07:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739173365; cv=none; b=kfZfE/aVrO8Cmg0PpheBiWpUjdtjGMxaOBw9hBANzEUF4Q7xkK4n9UFlgtUx2zyDT2P+FjV3pr61LXhvKFnChgv0kri++3ogYLuGTGt+d6Ij4NLEY7LrzYD1f3tQeFDSHvK/fx/PLjXOprwABgTmWrg2p7ZeQcFKN11toPDiXcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739173365; c=relaxed/simple;
	bh=uELykYu2UfnPFrcbXaL5ytU50E2XF8fxhOESv8wBqLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kSUvFaZbFoJ2Q9LCLSIMcw82T68UU5Qw0K6pYiE6MuMqA3qnCGszocEP1Vk1sEW8e7lSLoDwsoa6FoWJCtsPeqEU+w1zYaIIkrN8YvDrzX7lzE0Gv6qVgon3aS1AwoDL+1YzBq6557crkq37jcclTsoz1RHhI9xjYHlH0nxZ7oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=hEHhEnub; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="hEHhEnub"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-436345cc17bso26805565e9.0
        for <linux-doc@vger.kernel.org>; Sun, 09 Feb 2025 23:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739173360; x=1739778160; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jki0b2am8yzlz3QyhCDEFnMh6r+K6Xff5FC3zmcGxIQ=;
        b=hEHhEnub9vJ60lxT2vbKKBzRLmTMTfzEohjaxyIuLzLiow2SvvpkSatF4AZQxAJjnt
         GldSg7omHp61iZ44O1NoCTj6O106Fa44wXsTEgwrO3V6PzE0XKFkh6b/1ZhCnDiUMPLD
         iwdjtrUpH14ypIzDoUIvMM99VMZk3yMbhrAuLsSxv/dZnbni6dapXkUUVW/cIaTFVxpU
         G5YOpqgvdH6tvuTG1XbLoQT9/+QjN8WaQ3SBagZb0OxHRyre8cxLMu7PshbV34ULqsvb
         gv/zLIyYV/g09f6i49Cxt3Z9AKBh7vYEdtAS2ASA6AqW2u06PJmqX7yjLhHIybimdYpn
         yLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739173360; x=1739778160;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jki0b2am8yzlz3QyhCDEFnMh6r+K6Xff5FC3zmcGxIQ=;
        b=PHCsti+ltB5u1ChEilskwCcoGmfz/al+CPsPwoMXXCqQz/Z52/z73zazm1oW229cVL
         yDhXVpeRuHl0vG8+Y7M+lDWb2fSlP0XEIuNsChFbzbxaY1H8kZhykMqS/7/AjV2xRbRs
         uBF5lZHRiYebVN8FdNAQZlD2lgoncgbJwGWeiZ/LGQPznBbHGMXb/smNXRW+IwOPCRQa
         Sz6fXZogSP0MbLqG8vpWejjwhyX3FVsLAtSRqXYxPQf3EkQzeDjc9/g0mNZpgD0bTKxG
         3IAPk03Xhz5XLG/bCjt7symyB5WNAdsQU+M3tSQOtgg96XG+wjBZBEqDrYIuyz3yy0nk
         dE5A==
X-Forwarded-Encrypted: i=1; AJvYcCVZc54Oi4qGW3ffnpm+fAydRxloC8Qv1aQ/ynpasJaN/uI1q9htzOlqDf56dS+1MWkvPhvSpKATBXw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdq1evCLOp9sM0hRwMvsLAKtiOb10LaH8hHkKEc3K2M5evGrN1
	hY8+h65RIrREWSmP0xLwkgnejVZ9aNZwWUJNa+bbRCm7A+LKHGkMPHIKhuRpwjQ=
X-Gm-Gg: ASbGncsByHdTEGYhinkb7IkPt2Gw3IkTOWZJ+U11DG/lg3snvc7+uLqk00IbmCQRmnu
	vLsspVgMAfFkOKnTguf6ZRhT8v222dRemCNMZuP7yLcrNrPAtONbxDuHiAIO47jaB0Tx2QpO/sL
	G5n/GeEE5Urf2LX2IklrSau3LVG/Spg/mxzwtXkRkP+Qi16prSTN8hRiWpY+k2jVawCLDZbXpoT
	gt5c2gO6FP/lGOkJVC8h0wPpHkGzMPKtS4U4wqxCoXiPlLTYEZjGO1lMHCVifi1/wAheUanBydV
	FgwV7HC8wyAHSaGAMDrw3nnvIMiCCjtvHO6hJoc4Lua6hev/dCA0VAQI/aDb
X-Google-Smtp-Source: AGHT+IF39BdEkA9ZgcBIHbLRArZRwyqYfhbYwkkcPtQvR89C0KQhk8Xnq25iZkfcHIflDsp+ppJQFw==
X-Received: by 2002:a5d:47ad:0:b0:38b:d7c3:3768 with SMTP id ffacd0b85a97d-38dc90fdb89mr7501603f8f.12.1739173359748;
        Sun, 09 Feb 2025 23:42:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d896d70sm171375435e9.0.2025.02.09.23.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 23:42:38 -0800 (PST)
Message-ID: <4320b0be-acce-43b2-b148-1577c6a56dff@rivosinc.com>
Date: Mon, 10 Feb 2025 08:42:34 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 14/26] riscv/traps: Introduce software check exception
To: Deepak Gupta <debug@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Christian Brauner <brauner@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com,
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com,
 atishp@rivosinc.com, evan@rivosinc.com, alexghiti@rivosinc.com,
 samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
 <20250204-v5_user_cfi_series-v9-14-b37a49c5205c@rivosinc.com>
 <fec3b7be-4259-4eef-87f9-b2cee5718cae@rivosinc.com>
 <Z6Z6mhiQ3DmsNZe9@debug.ba.rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <Z6Z6mhiQ3DmsNZe9@debug.ba.rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 07/02/2025 22:26, Deepak Gupta wrote:
> Hi Clement,
> 
> Thanks for looking at it. Inline
> On Thu, Feb 06, 2025 at 02:49:09PM +0100, Clément Léger wrote:
>>
>>
>> On 05/02/2025 02:22, Deepak Gupta wrote:
>>> zicfiss / zicfilp introduces a new exception to priv isa `software check
>>> exception` with cause code = 18. This patch implements software check
>>> exception.
>>
>> Hey Deepak,
>>
>> While not directly related to this patch, is the exception 18 delegation
>> documented in the SBI doc ? I mean, should we specify that it is always
>> delegated when implementing FWFT LANDING_PAD/SHADOW_STACK ?
> 
> I don't think it's document in SBI spec anywhere. Should it be ?

That's a good question ! I don't know the process to document that part
of the SBI but that would probably be nice to document it anyway I
guess. Atish may know what to do with that.

Clément

> 
> 
> In code, opensbi delegates the exception (SW_CHECK)
> https://github.com/riscv-software-src/opensbi/
> commit/110524441a827e026db3547ed03c5723b9c9e211
> 
>>
>> Thanks,
>>
>> Clément
>>
>>>

