Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC658171079
	for <linux-doc@vger.kernel.org>; Tue, 30 Apr 2024 12:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714480431; cv=none; b=E5lGrOCdZnGlhdABs665VYO8TuOYLQBDAe1JOYPdM8/w5hr/M6WdL4BXJSgJYQs7YoV7lRBXZvD9WavD/9bPVaDICZuQ4QuCr1wM5/gWISstohqyd5IHqntoCyXGZk8y6jY1wGOMbsfpb+NdK7XAxKHE2e7A5x4DMXDqM5ZdeR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714480431; c=relaxed/simple;
	bh=8qRGv9BUyqVd6XtlXFdWfT5zPzODEmCn5lc+lyDQMQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jDvfOXB4FduKq0/iwT3ASqTn/fOO1cAmzESOPenOkWr3jR0Mvywlh4NpgIJjKQ1MiABc5/oribYHRH4wRME09gl0V6iRmeU4cnaLOCG45IX4SSwbkVGvkRR7HY/JVZUXYuB+YDBw9vnK5DNE8qC0kF+ot/SedrJZ56yq+VnnkbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Bg/I1oz7; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Bg/I1oz7"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51d9af6bf36so346807e87.3
        for <linux-doc@vger.kernel.org>; Tue, 30 Apr 2024 05:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714480428; x=1715085228; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8JYnpful/x3DE6HE/Q8pSIRWAs5wjh2Z17X6El2O6XQ=;
        b=Bg/I1oz7Fb9DgA6vYFCZ/Y5HynGpEMOEpF5OzKXbUCynjMGP7QoDW3mpSl+/W3fH0V
         +al2uHC0RAAeo4MDgAjuPeEdsiBxvYu494vHrrL/nGpYJB5y28YRPWxvov6tCwYbOwAM
         /p4pwYuV2diJZ7QTBRVvfuzuyI/yjymKAELkrrKbDbh2l/O3vmxz2q0v1RnI3I5puG3G
         PQtwA2oznCVbXeUO4vxD7MDN1pLnp/O/2rF6rSk5mT+bmNgZTy3RrgjUVQYwkKnLsGN/
         8Q65S69a6A+lu5ZOP80/p9axP13UgzOR/8a3MJjERrXVWYLaASsDZdHx5SqZYrOnf150
         7L6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714480428; x=1715085228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8JYnpful/x3DE6HE/Q8pSIRWAs5wjh2Z17X6El2O6XQ=;
        b=FWnwTxmDhW+xWzIl+aug/E8iOXfgV0b3R43c1DMs8+cbb1oeM2oVgodYYYonyfNKvk
         4sDRMzN4IA1ilOf8aH+5bStl1XB4HIRY8Kx3ZgH9RKEvGNGjA1nSquBrwUXeb0+LaI5l
         /U0M8I3aUpw1bnQ3On4DjhTUn+qQqSFz+7OAIeGSeGOyHIXjc8Jv2x9SQ+HW2YXP5s0+
         oUWgPMux/alz+v6yFWz+PhxVlVzXtLt08DtVG93TdrJ/Ff4hiZTHkK4Q8ElxT3NZbRy3
         ucm9vQCaJAfeO2H1vUrV4EVx37+wcuoDOPDIbinv9oQckuvZfYWUz8opOpdi7WkK/xOs
         06Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ7TuF9dEG6CNHArIrLkusghFT7yVtdCBvjeRrNcIG4NVtQGByoxsCoc3kbO0WQivkYRHpgQBNBhgOuSQdjlfVNOycrEZMcxIJ
X-Gm-Message-State: AOJu0YzgGug1JsHV5wZv3AkMzCrQ+RXC+1bhLWug0PUqO573y8CClZ1z
	uYenSIfb0jx73+MCc3OalxeI3rpc1cVWOOzhL3t/peHOtNF7lCEWUlGb17QkIx4=
X-Google-Smtp-Source: AGHT+IGh50yRx9fgD9SXLf1xEw2mn31RrUC8rB0v4vouvrUtYjpyhg94cyY1iBQpCTQRoHim5SrX3A==
X-Received: by 2002:a2e:910a:0:b0:2dd:60d3:7664 with SMTP id m10-20020a2e910a000000b002dd60d37664mr8644774ljg.5.1714480428077;
        Tue, 30 Apr 2024 05:33:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:c21b:67fd:90ab:9053? ([2a01:e0a:999:a3a0:c21b:67fd:90ab:9053])
        by smtp.gmail.com with ESMTPSA id c1-20020a5d4141000000b003436cb45f7esm550771wrq.90.2024.04.30.05.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 05:33:47 -0700 (PDT)
Message-ID: <770710b3-2495-41a6-9822-d9af9b13cef5@rivosinc.com>
Date: Tue, 30 Apr 2024 14:33:46 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] riscv: add ISA extensions validation
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20240429150553.625165-1-cleger@rivosinc.com>
 <20240429150553.625165-3-cleger@rivosinc.com>
 <20240429-subtext-tabby-3a1532f058a5@spud>
 <5d5febd5-d113-4e8c-9535-9e75acf23398@rivosinc.com>
 <20240430-payable-famished-6711765d5ca4@wendy>
 <dbcf0be9-eae6-4776-bc5b-c6fad58df9c3@rivosinc.com>
 <20240430-gratuity-refinish-29abb136c958@wendy>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240430-gratuity-refinish-29abb136c958@wendy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 30/04/2024 14:12, Conor Dooley wrote:
> On Tue, Apr 30, 2024 at 01:58:11PM +0200, Clément Léger wrote:
>> Yeah, see what you mean. I think we also need to define if we want to
>> expose all the ISA extensions in /proc/cpuinfo (ie no matter the config
>> of the kernel) or not. If so, additional validate() callback would make
>> sense. If we want to keep the full ISA string in /proc/info, then we
>> will need another way of doing so.
> 
> If extensions aren't usable, they shouldn't be in /proc/cpuinfo either
> as there's programs that parse that to figure out what they can use,
> possibly even only checking a single cpu and using that as gospel.
> That's why there's that per-hart-isa thing that was added by one of your
> colleagues last year.

Acked. So indeed, validate() callback for F/V dependent extensions makes
sense.

Clément

