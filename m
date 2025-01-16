Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABEE13C689
	for <linux-doc@vger.kernel.org>; Thu, 16 Jan 2025 04:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737003508; cv=none; b=j4i1iEX7U060HojSqrC8xJVn3g3An/003fCoU9Xq3PwexaY9tntE8r/7fOw1F7fOWlJt5U+X+Ueg+IoOIiPEXb+gGivRbh/c7JIu+MGYkn0ja0KwvyFV7otUM3bhOh+jOxRO+FU9kgkQrd8ewVLWMvi8To5W0MbKfLt84qppETQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737003508; c=relaxed/simple;
	bh=pM4jq/+t6yMPA0cvFRGfhhuFmtipKif0c3FMYxgpqss=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=TuZGKyOeCY4e+tamexAhtuBuYwOhnpegcHgUtP5PyUN4tPK98mAOl2C+IZb9NnLjKVJUnvq+JruuKbTtt//BrmnZKWAjsM/X9uFg3H1TNrh9ehOH0RZIDX+mFPW0p4unVWxFOLDcDefipQTC8klcflvBaMWMBz7ut6qZBozSOoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=k+um2YUX; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="k+um2YUX"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-844e7bc6d84so20843939f.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 20:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1737003506; x=1737608306; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AFLg8GSDpsapBIGiAyBWLlK/6kmfSioivJ/IsRLirXs=;
        b=k+um2YUXMbe0fDxxWVXwrCQWYptmBxfGBbbQ0mQHTUmnpDXGD9xjWxPjCPp12HFDdm
         WMHn+Yv62cUNRW/DOVunZUGp1BKA9QUCtXdgqNGRYC7Y0JPHeu8+6lXUyH7uidgOvjG1
         +R+EQNHw91zrfCT6R+yqWDN8YKd5N92tDR24vcVCE4bS0B077vRaykiyjfmy5ytNueAm
         pllR7bwvbtXQKOteZJvF0hqu3H/swgTmPyTFH3D8YMT+jh0Kae3Hm64XiikppZMAMv3Q
         KCvHdLgNc6wlbNcnN/qZxoTMvtC37M5x38EzJU9pln8uBQMJKaDx+qpyCGr+2JO2jm10
         ytjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737003506; x=1737608306;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AFLg8GSDpsapBIGiAyBWLlK/6kmfSioivJ/IsRLirXs=;
        b=FnWADHqcQGBVPvwA5t8cMK5jQfKs2gDO5hCNxJbYBndeCYIpTf1CzSoltC2PyGPD4H
         AZC5oK6/BkgtsyRDrLQCTk9JHedQ6yC88WiaZc7POX87urc/XR2sKfkixS36HFZSBBlF
         upWMOOA+Gvnw6GOGCK1rz2CJpRgRCg0Ot1+tAN4NV3VEG6VZjd2Z3dOVB11CjHNrI7Le
         83Y3dN9F8D4HzgA490kG3OFRnbIJa2bDUsono5ufqzxYtxY2p4K99wZamQzhvBPDDGKM
         SUh8ZrgIK9yjBD0kZOTLSE/bVjNI4TdIgNvpQxstNerFo9leaPAkD8KhmyGD33psIiFP
         VSbQ==
X-Forwarded-Encrypted: i=1; AJvYcCX43htBuHvYibCS+A0+UTUUf527pNWb0BDCqtrlC9u4cU/NcYL8W8dTQ2CZXmOqb/sB4nrFJ3jxXEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGeiOBBPxEMxAil9tuu+z3sDNYxFzsFTc6dbHjlDiQXobHYWf9
	Z2sBUUx3TmDUtmy6anF28manAWjpaePBjy0+DW1RCNozKvUhhbtqtHU3ynpVdC0=
X-Gm-Gg: ASbGncvAU1K1jSy/TGiyXD6o2Fs5426fHBRRFy/5Ec30Nn77L0BNZzH9jjFnQxACUKQ
	9Mz9Nxs3h5WsFfSUQleqqZnxbmldaZVKv/OBgyGJjhXbhB+gMgKwdyTOH55kxc8cViGGUOlo9Sk
	V9uBr5xNZAquB25n8qqRGYWQypaeiurAsNxzLT6euuOHbDAkPpPO5A2LueyMpEhoulXe/rRn3nf
	xFeatrm5t8V/REfMM6mCTlyTGhCU99kekMyyxgGZY2xmkA4PU0vHMq+YdFxQ9PLexIpw58ILlZ9
	H54B
X-Google-Smtp-Source: AGHT+IGCURJWIVYousmDxQfZtWRFVgJilSrZTA63b4XTXZvjX1GtlsFKkKGE3cWs27mtEc5QXAwz2A==
X-Received: by 2002:a05:6602:7288:b0:82a:a4e7:5539 with SMTP id ca18e2360f4ac-84f672d8530mr532921139f.2.1737003506302;
        Wed, 15 Jan 2025 20:58:26 -0800 (PST)
Received: from [100.64.0.1] ([165.188.116.9])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-84d61fca4f0sm425517139f.44.2025.01.15.20.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 20:58:25 -0800 (PST)
Message-ID: <8d03404e-c9eb-485e-9280-27a06937c347@sifive.com>
Date: Wed, 15 Jan 2025 22:58:23 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] RISC-V: hwprobe: Expose Zicbom extension and its
 block size
To: Yunhui Cui <cuiyunhui@bytedance.com>
References: <20250115024024.84365-1-cuiyunhui@bytedance.com>
 <20250115024024.84365-3-cuiyunhui@bytedance.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
Cc: ajones@ventanamicro.com, alexghiti@rivosinc.com, andybnac@gmail.com,
 aou@eecs.berkeley.edu, charlie@rivosinc.com, cleger@rivosinc.com,
 conor.dooley@microchip.com, conor@kernel.org, corbet@lwn.net,
 evan@rivosinc.com, jesse@rivosinc.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, shuah@kernel.org
In-Reply-To: <20250115024024.84365-3-cuiyunhui@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-01-14 8:40 PM, Yunhui Cui wrote:
> Expose Zicbom through hwprobe and also provide a key to extract its
> respective block size.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 6 ++++++
>  arch/riscv/include/asm/hwprobe.h      | 2 +-
>  arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
>  arch/riscv/kernel/sys_hwprobe.c       | 6 ++++++
>  4 files changed, 15 insertions(+), 1 deletion(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

