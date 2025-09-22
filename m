Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7092C187
	for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 22:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758579832; cv=none; b=NhPdR2dr+WyLAsU9udapn4WXW+LIyyORDycMURAZ+QXce+tkrFeSUpS0AWJT6+Mm/o3kyWAlFYWQVm1JbJuquXB4KoC9Z1FuUc+HrutYm8Nq5Q5qlwrs7FsoNHVmpbRum6n1zJ6i7C9GVe6NlFkkvbMUzaWr+IlPARNBO6VUNgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758579832; c=relaxed/simple;
	bh=Sxgi+qzzqkTw3Plt5ecLA21mEANLQWQfDdkvQU9u55o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IZqF7p9v7C/QHc+hpUmqlWHILfKd9ep7gJznadZOOiGpCk/fYAXk9pKNLQJIqRFEoq7qbaC4UQDvi8pYTVC7tEAjHmEt0F2rRB6mSCCKMKL02rTqFcjBu2HxFzFO+XlGdPQAJl7q75jtNXZAHMU/iHiS988RwV5XXZ+zeeJOLd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xy8Cy55T; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xy8Cy55T"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b55562f3130so804003a12.2
        for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 15:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758579830; x=1759184630; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MRsFo/EuRH2UoqiV9syGz1Dqlotoo0X01FdBzIc3c+E=;
        b=Xy8Cy55T8c4uGVKoNiPCsJBzJVGGJx7JY05Bsuf4yajr48ORgpH50OELV02eCt7tXa
         tSKvdIImAaqzKpXE5IReM4iElZuNLRLkrnTNcoUZHQEq+F+Hi+Qy+jH15NEtTzQOjJPQ
         RyC0ZBA7MBZPEX7KjWF4uIJ/ad4TLLStV3F27F6Umg6JH3SIS94NRKfneae/2dgKg4Fy
         jK92DAohVolsA/JUxQsA6TjbGqqT7HhxGKS0gb62yxR7NuJuSgiqPHsqUfkR8hiyBSz5
         0pzW76TmwtaAaxwiqf+foB2o5LCHNIzGvLyguxZ6wlSc1XkUykMGgGTnHt36B0r0jM64
         H2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758579830; x=1759184630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MRsFo/EuRH2UoqiV9syGz1Dqlotoo0X01FdBzIc3c+E=;
        b=fGnqbPXjEfP3yTUqf9nmhm9TP3EX6o9AkGL62pMbwxeX+r1gR/FQDVHw38m0Tjp13/
         Cqa70dTp+YB8rM9VIcaxeWaErYTapTr0PZ5z19Ml0gBAt2rDFWjJpWEItUtfFD6yTeoE
         xbepktE26m6sOhCOKeHC9qEk7bExJ8tjZatG5Wyl+Uvm8GoS71pnermi23371u/lyX5n
         C4I0zOpm/EvdJqxB2TIXwD4v5gqlLxqxkHe72ZUuH/Bm4HY20+/wU8PMCGGhr1FARSXA
         PuwjKZbvs3AnZEooZ00vTHdZ6lE/e8spX7wyaiCHMCp63UMXiEwx/G1K1d0M3sy7e9on
         Y0Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXBzL2ykA7nOeLbPwNFAs+awFRDfYmpKzulUwpWCLaM16HihVZrmLC/2N08ykb0uRmHHLIlDYW+71w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGby2V6H3EHmBrFD7RvmLj1fke/0sI8G5XI181DQqEhxvvtU6G
	aHCuuHwW5GDEAnnWT4Gqa1NTc4yCGc99xBDa72806ZA2B53Hmgxz4FxK
X-Gm-Gg: ASbGncsa79iUzHLpsnPqm6IuOPclMaJ5SyNR42XMn8fRN3Ct7dA3fLdCPqQL8fFraAp
	zq5DanlHJvof0aGMIpleS4VV7URetPbqFwoyVdYRA4b8pMKYgVOGbXCIJ9KCrEtHIwyUPsYFVbs
	36hdNfEPw+MHHr6RMa5U+lKuvPYiXA1zsBIuU9C62HTXvuadIQSdeGREox4OmmcArme9l6LdG7H
	wr0564xLGfDUj0ItcQSEueOqUZ6hNpnql/9zH9OqTQ8bg9Se/05feWVbWJBoQIYLxsJLmVrMncs
	d16ZkPYWcGfr07SCY4B19CmB6e7qvWbmwQw9O24kfsG7iFx88k9FMGMl+6SFJqw7KKJTpvD7YTL
	9w23mPmDLP/I55K3UWVjmD8J+jLFx8/Ci4f6qRt68
X-Google-Smtp-Source: AGHT+IE8ZDXe+4AoRHXjewJQ1kqq5SzJmZMgTWVHsKxdYcEj7QnvITb3KlBf7Gm4ryAb+XA979ghqQ==
X-Received: by 2002:a17:902:ecc4:b0:24c:7b94:2f53 with SMTP id d9443c01a7336-27cc09e3ff4mr5390975ad.6.1758579830332;
        Mon, 22 Sep 2025 15:23:50 -0700 (PDT)
Received: from [192.168.0.150] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802e00b3sm141736545ad.90.2025.09.22.15.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 15:23:49 -0700 (PDT)
Message-ID: <8beb54ba-4b88-43db-8e12-7a7f85c9a9da@gmail.com>
Date: Tue, 23 Sep 2025 05:23:45 +0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Documentation: process: Arbitrarily bump kernel major
 version number
To: Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Workflows <workflows@vger.kernel.org>
Cc: Dante Strock <dantestrock@hotmail.com>,
 Randy Dunlap <rdunlap@infradead.org>
References: <20250922074219.26241-1-bagasdotme@gmail.com>
 <87h5wu8x7o.fsf@trenco.lwn.net>
 <ff092ff5-8ee1-4e91-b7f7-e5beb1d6d759@gmail.com>
 <87cy7i8tsj.fsf@trenco.lwn.net>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <87cy7i8tsj.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/25 21:07, Jonathan Corbet wrote:
> Bagas Sanjaya <bagasdotme@gmail.com> writes:
> 
>> So it is slated for 6.19 then?
> 
> If it's not in docs-next (or some other subsystem tree) now then yes, it
> will wait another cycle.  We are at -rc7, after all.
> 

OK, thanks!

-- 
An old man doll... just what I always wanted! - Clara
