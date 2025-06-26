Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A95728983D
	for <linux-doc@vger.kernel.org>; Thu, 26 Jun 2025 14:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947252; cv=none; b=IWi2agADECnyuZB8VMwnIxEkqFTL6zKdG5WpLlJaADceVS7m5cbuifXsjeazmmftgHd3yEJ5+SpkkPc3o4ltFpqx7yHhLNZFNAzVPoIkHvu679FC+6nmr0DUDsEhlL61kdt8w2KgmPkq5HOQW8zNeggTnOM89RpvY1v/T6JKt8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947252; c=relaxed/simple;
	bh=gizuTdXSApCvQvSHhO+X0zhvT+cLUrlil6HKej+mKKs=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=hpRm+m0+ceDWUuzwwknjTywD4ea0MgIZHJXOgQ+OnP3TCf/Dt/B+YiLZKtLER5qqnsDBoH/Yi8kl/2X3/nIkU4S1cvEM7NectEHDaUsYKeCRiOutQdYU7zlr5HYKC+CNFH+cWrJyeb/fLRGas46s0+5DuasMWoa26JylcC0sLEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJXvIX03; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJXvIX03"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b34a78bb6e7so798606a12.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Jun 2025 07:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750947249; x=1751552049; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/GhEzM8iQ74OlTe9axuwsW62RaerbTN5F9xJKYM5fOY=;
        b=EJXvIX03SHhD2ihwY8QdVwUFj/kJjMkuop2jAlMnZi6ZACwsS+pqvB4ctxYGUPv+3a
         Z9pQRVXaTKoflpGc+Oba4OQEydoEHgh1xhKIZym/VKWbDCoqlQ0fwAd+cP6cZe3cvBZ/
         HqphqBKmdXngfwvt3Jhi6WBehmsN8zwv3xhlnUqM05q1jE5DDTrjvg5vhzeCnbR6viFL
         gif4lGshjg78O4NM5eNZRxd2egQgXq0gYUw9vnHNC4ECVmuMBWZb+PdUtH/huCjia5T5
         W53JEhJtRRucGxpi2Mcq0mU4OdgIesiKypEr32BcVIC/i+0lV/rdQYJcGeRmB6zgJz9F
         fB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947249; x=1751552049;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/GhEzM8iQ74OlTe9axuwsW62RaerbTN5F9xJKYM5fOY=;
        b=Gv5EXbfG4nUDI8ebrNo0MPTXC++G6VI8Ljz5Ez5+g25CDIHG4NdQEcKAzLkJswi/hx
         v6u12Z5m6Vi5owSP/lj0jeTAnoX9806XnKxnbSx9JnmJtPWrwaxV1PuJsy01VcLSzeRN
         Z3YG3IxAd0+Wp3e9cYEA6oYT8yqdMS2OEiOv80zWdvMIiCyKluIR3AS+khfz9JeYKyLF
         xMn5xArtk5n/1BaiHSzKIWkTfMxzNF4XQOlofF776dlH50Db4/nfpD43d0YzUZQCJ+XB
         wqrFNVKThVH9cCqA1/dQJO+ev3bTsxrulSfogcFR/H4WyvX/0Be7u6Nq9IwHrBI1UQaz
         UL5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXYNALzgyntL9VQRs7oCIVdtWMBjtqm7Zt2tXev/Neqqpqm7Gcc23RC3hwcovgWVDA/ojoEQgJ3Coc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDCWcMQssKfWiSTB4achPlXUzwFNj8Sa3hcZkzO0j+zEHKOUdP
	Vs9Oeb1dk3sztxy5AW0vYb4BNAhhCTJPzxyatkZ8nCe9u0HH3FSL3H8w
X-Gm-Gg: ASbGncsvefK0B4mT/Xdfy++MY2R894r2pOP/tswuj8bHu2HMUBh89b8dwmZqz1FxPHA
	YSTo2QVuMlYnNAI0AqLTQLjl750DI6ClVUdN3MukHDcQafhNy8f49vKRxnnYF/NpdRwV64sbvNv
	buOswcbt9GxKUkVmwELqyXEzZG3zK+UGZGAUHyTfWd/0xdArDwkMzwknIVWoanAOSyn3kLy27oQ
	FiWYgmWkQpWhZCTCyX9JD0uWnrkSXkrJYbb+wTIkFl0XG71+vMD6/jjrkK9Bth9S6g7dRzDLoGu
	j1dSj29wZA5CbAXVKQLXVtFoesnUJnY0ZCxF1qD4Qnvk4dH2Xa/atsgfa/OaH7M/zq3HJAwE4H8
	kxl6ngEszYmXr99hdX+zG+Hh1EdhZeJKMk7/CpfcHUPU=
X-Google-Smtp-Source: AGHT+IF+J3vz2rq7qNesDt2mbvzHCwmxlQCUg9utLId5LtYl9RUEvLvFh63LNLE5wKgCIbN6O8IuqQ==
X-Received: by 2002:a05:6a21:8cc6:b0:21a:eabb:ab93 with SMTP id adf61e73a8af0-2207f19255cmr11816513637.6.1750947249068;
        Thu, 26 Jun 2025 07:14:09 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c8872002sm7300198b3a.151.2025.06.26.07.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 07:14:08 -0700 (PDT)
Message-ID: <902c167c-bb6c-4d3b-a720-011d19d4176a@gmail.com>
Date: Thu, 26 Jun 2025 23:14:07 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: haakon.bugge@oracle.com
Cc: corbet@lwn.net, linux-doc@vger.kernel.org
References: <20250626123022.1525131-1-haakon.bugge@oracle.com>
Subject: Re: [PATCH 1/1] docs/memory-barriers.txt: Add wait_event_cmd() and
 wait_event_exclusive_cmd()
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20250626123022.1525131-1-haakon.bugge@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

On Thu, 26 Jun 2025 14:30:22 +0200, Håkon Bugge wrote:
> Add said functions to the documentation and relate them to userspace's
> pthread_cond_wait(). The latter because when searching for
> functionality comparable to pthread_cond_wait(), it is very hard to
> find wait_event_cmd().
> 
> Signed-off-by: Håkon Bugge <haakon.bugge@oracle.com>
> ---
>  Documentation/memory-barriers.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
[...]

This document belongs to the "LINUX KERNEL MEMORY CONSISTENCY (LKMM)"
subsystem.

Please resend this to suitable people and lists ./scripts/get_maintainer.pl
would suggest.

        Thanks, Akira

