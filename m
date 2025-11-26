Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEB94C9D
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 05:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764135503; cv=none; b=EFGAIUfH1oErAW1S/W6f+w4yQSHwuldA7Rdt9lFZQMTq39xVgY6nAl+kukie17vK0dJSsBHO1IF0JbE61mYOAYYn3W+X40Sf4ezblkrGngfbblR3Ea8nIa7VHvjA0MYcnPSPVj5f7pinpF1k2GnP2AWi94UNWppm1wFJR8mxq9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764135503; c=relaxed/simple;
	bh=RcATC0LHelMnKSxvnC2qY5fHGHTpDByt3y+GvPKBY3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GEbVNEmdY/rcWaXKK9VfSYZhOqUcxwwPYISSrbVhVgxAau1huTehH5xkOw4h0eLAIsapYhESoNh+4DntiqNHRm/vfM7NmzM74aftXS/DXuZGYUO62sQYw85k+q2JMkirtayeBQlRZr4AVuvkKuhUuY4pqNzLxm8YKVrVSJ/cEl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9xoYbYn; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9xoYbYn"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b99bfb451e5so4330973a12.2
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 21:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764135501; x=1764740301; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BO37H3ho9ohG05R/PIRvwUwPiGDA92Y04BPPBsCfG40=;
        b=C9xoYbYnK3B5uNkVfJRVae+WZydOVLwIG8WJq0rA6xIMJDcpvqNaORNVJMXP7EpTpo
         sj0gjAEZ/ZElICS5Eh6OK+zVAKIJWi+Fjbv9FQ37qwI7L0QzeNY8ZJECr1YYT5yrCIBS
         nkHnrxRA2pryXb65rp3jissuPRuG+fcJfgQ7ej78hTkfKryYO7Jx7RwRddHlX6ShZHis
         e1+6teU/fddun2hSMJg9roXTaepAVd58hiPcf0/p00TehHQY6RiOALEUHK3TZr+mHmpe
         g38t51oNGHxauahVRFKXrHrUk1LD4YqtutwWJqUUhG3wDatyGDcQMqdVXwcohhCIJjWk
         Ec0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764135501; x=1764740301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BO37H3ho9ohG05R/PIRvwUwPiGDA92Y04BPPBsCfG40=;
        b=tTj6KtzX85edmtLmW13MS67ntJoXf0E+HX/z9OOwQ9W8fQq0XR1nHlRBRIEogy10O5
         UUvSTnXQtE0bO8YeNr+9MokOoSYav3RSIFSzKuLjCLnM4GF2SHoyLEw3h/JnHvS55DbZ
         LEh6xkQ/RZpHHlWE4Q08zs+dZaSSHFcKZdCGxNy9qZY521HAzDJGbQmfyOBvcAYCuZCa
         XYJBFDWfrSM4wIxoyNCdzpDbi2Yv1btEY97/KrolH2P7R/wyO6bFFjDEBPSH/xKL16RK
         wHukZPLMmJELuaX4VKuOHngiAZ5lwOVVz4BbaNRkYgzED5aETBXEd4XsOUzJDyOGTIzy
         KMbQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/3R28oDSu3v7OnsCnzuhLwt7ezby6gXCEV/SuCrs1dW3SQGoiIR7XBlSD1RZIlpGuPjD2thsaQy8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTY2RbiMOLUPE8NlRLyYblib4hwJq5ZBGvaAyAB4clVwt98XaD
	yM8wEGB+BOlYSDXSoccTOvbnf/KHiQWP5ikOgnGILuSGIeXIXbgbZfbg
X-Gm-Gg: ASbGncuYKB/ytH0v58RSy3LEWtYAymdJLvOFNMla3jPmOmf5ROT5KX1s9I30+FT+lFF
	mJlfFI9s3dhhoW6q8rZ4rJXsV6FKZ0MmkXuxWH2ijrMFUtoYQ0XYC3IYYX/E4B1aUdRjh5nRY5q
	qX+16kmCGhGMcMSpJiW6WWnOnEFT4MsXblsPr9YlWQ6+5zzc4zv3aUWNXYTzM8CkKWdZMyL8ec2
	Xo6Hfxpc6wcHzEtIOI8NJwUA4IbF4ugQPxJaNNVOOBt7HeP05EJmPYBQv6spaf2p9tAyrEWlwfd
	FroNyHE1kPCNMQoc6nQ9ZaknuwYw8N1ZnloVxMbQr6RHCCT1Ai+NplHDiXoYEFEgAmnJn98C1My
	gfaVg2gZBu9orqja52IjBDsNsetGIo8/YA/iNvRpudhYltFGXnLpqp8m4TvDLtJncnErGSPpPTS
	+Dk601MsjErnQuptHuzMDoGj9JODLdDv8w/MXJ8w==
X-Google-Smtp-Source: AGHT+IFPCtyJNH3wQgl9ceI4UzEBxGKwTWFZY6r0glpYRgdfALuTMbIdnApO2KfKYGmUsfBVIdlhrg==
X-Received: by 2002:a05:7022:92b:b0:11b:a892:80a5 with SMTP id a92af1059eb24-11cb3edd659mr3762022c88.13.1764135500530;
        Tue, 25 Nov 2025 21:38:20 -0800 (PST)
Received: from [192.168.2.226] (104.194.78.75.16clouds.com. [104.194.78.75])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93cd457dsm89108575c88.0.2025.11.25.21.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 21:38:20 -0800 (PST)
Message-ID: <9618202d-880d-4286-a817-f88d965ecc31@gmail.com>
Date: Wed, 26 Nov 2025 13:38:12 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/25] docs/zh_CN: Add index.rst translation
To: Kefan Bai <baikefan@leap-io-kernel.com>, corbet@lwn.net
Cc: alexs@kernel.org, dzm91@hust.edu.cn, linux-doc@vger.kernel.org,
 si.yanteng@linux.dev
References: <874iqksqs2.fsf@trenco.lwn.net>
 <20251124132548.36836-1-baikefan@leap-io-kernel.com>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <20251124132548.36836-1-baikefan@leap-io-kernel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/11/24 21:25, Kefan Bai wrote:
> Hi Jonathan,
> 
> Thanks for your review.
> 
> I've updated the signoff to include my full legal name.
> 
> All translations were done manually.
> To improve submission and review efficiency, the number of translation documents
> in this series has been reduced to 8 in v3 patch series.
> 
> Thanks,
> BaiKefan
> 
> On Sun, Nov 23, 2025 at 08:38:21AM -0700, Jonathan Corbet wrote:
>> macrofun<baikefan@leap-io-kernel.com> writes:

It would be better if you use your real name to replace 'macrofun'


>>
>>> Translate .../usb/index.rst into Chinese and update subsystem-apis.rst
>>>
>>> Update the translation through commit c26cee817f8b
>>> ("usb: gadget: f_fs: add capability for dfu functional descriptor")
>>>
>>> Signed-off-by: macrofun<baikefan@leap-io-kernel.com>
>> Please use your real, legal name in the signoff line.
>>
>> Out of curiosity, are these translations machine-generated?
>>
>> Thanks,

