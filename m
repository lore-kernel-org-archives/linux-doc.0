Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B991E98E3
	for <linux-doc@vger.kernel.org>; Fri, 20 Jun 2025 23:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750460937; cv=none; b=DjKBFLt0hxZgSWOXmfamy8f2sHB/OHFo471a+xBXE0c3FAVHWToRTZe0EPQ0jp0Sivl0jYpFWSGXOqDtmBpsAT2wrXkbWWAJonYRrKT9APMvwv2O6NRdFydwr8GC3a5YaIiuVib9UebIweCgiEzAZmF8ovLBqpTn6meVhWTC13k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750460937; c=relaxed/simple;
	bh=LrIKVw9uceU9PNljM3GXHP0UH4jzYFs66QOU9jwX1gg=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=hOpGjJ4wQ0FaC0xHlyRZqR2H2XANdawWLArYnKGYB8VwdtYF+8SidtwSo3TdJpMYtDopERfsss0MJz6tiIZQbjXoSFs5KDs93dPcM++1wE8L6WMS3/hUfhmwoe1Qqce8GJQB1tpdT3vQj6DYPQ00xqhfVUIGbUO7YIEv4SdcYHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=RfxLm+7n; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="RfxLm+7n"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso1952136f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 20 Jun 2025 16:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750460934; x=1751065734; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8K7VF56cCSHOQmH4rrNXHm6nXu5zATs+oNyo/btQdw8=;
        b=RfxLm+7nWNiqEc3PgMtBbYTUw/L+T6OKwGYvm504npYhzBkVknFXzJVDY8JkvVhEUF
         QoK0dq0N+k3NMRe2mDFzZJ6DYCFbpYojE+x2t5fhmoNIrqDPr0CRKSURVARBuYPJzKNC
         0wVarOTZQKbBS45X6VNvSXDjbyUzFYTHwuGaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750460934; x=1751065734;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8K7VF56cCSHOQmH4rrNXHm6nXu5zATs+oNyo/btQdw8=;
        b=QWE+UA80h6KRg//aXn3eXYa6/wyQWR62HIi5R1ll8d8pnwzlgacQ1AebJqRrie7j1x
         cg7Xk9AO7f8o0nO9nflsGnuDs4WkHHfLMH8E6Eb8o+FATf3/LVXC2HmHoOIEVskCi94Z
         Dky33CreX1rlpWRKGTpyyiV7WK157xViIagH5pQF26Y9jaPr/YFEv3jeEbwFDR3YCgGC
         lwex3St4c3JYjwjafEwurPvB+sGwo48fM9mtzojvgQvDnzGJm6aWDubWKBDkCT1HXce8
         rYpZaIOd6EMkw5l0aqgqZxmidMy7awELKc+eq+VZsu37mZ27GvMviqsaMlfTpxV9z6tV
         3w4A==
X-Forwarded-Encrypted: i=1; AJvYcCW79riDo1/0owo/5lPmXyA7mc1lmTVzhuBJiSX5TWgtlu3qN6G8sepu6eFfbCWLkk0UGNAyexx0hKI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt2S6R5eqy5uzdVkloV82ZHE2vd+vCZyi3jDo4jBKXwWf0lztE
	CUBqFL+p5ghtVI+xFkHH88JDZgMoUxyIdlSYJT+nvSVFfdbtJI6PNIicb6Cd4n0RB7o=
X-Gm-Gg: ASbGncupRAWVtOKPJEmPBdsbF9bLu6l1akP7brUuqA8h5/IBgsWkgkkXwAjkpTd1pgW
	wu8YCXB3jae96alWsgaYjl4IaCIvEUQUxAFqOEH6/RM/bTjsrWNBYQghMzmCH8coZbo66yfCDTB
	NwAE/RWU8SZdiLmvCd/JWmCjX6J92JQoo2+Gnzd/u9zf4QF655CNzGfbNM7+4Fo4oPiYZLHq5n4
	Ic7hxDWrSdwLT4oyfxDdX2qI1Tq68x8f9zpmORNhFqmDbaRvLkl1Zw1EuSngaDS++xH0U7QBcg2
	uYClITGomysj7BHe1CB+UMJgnER1YGZxVkcVxSWqX/kK7d1WRpnqoHjlqCta9O0eGZ0zCCb72eB
	fPRiYt2kJf679Mg1FsZtRHofjwts=
X-Google-Smtp-Source: AGHT+IGGVYXzErXFXuqWdpZbidTRzHjqEaCE+CrUvxDikjsokKsYjhP3LOanuYExDelRYdFsSrdp9A==
X-Received: by 2002:a5d:5846:0:b0:3a5:2ec5:35a9 with SMTP id ffacd0b85a97d-3a6d12c45ccmr4299674f8f.3.1750460933871;
        Fri, 20 Jun 2025 16:08:53 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453647f29bdsm36635735e9.18.2025.06.20.16.08.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 16:08:53 -0700 (PDT)
Message-ID: <262c0fd2-ac66-4ce7-903f-4062f1fe1d6e@citrix.com>
Date: Sat, 21 Jun 2025 00:08:51 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: dave.hansen@intel.com
Cc: acme@redhat.com, aik@amd.com, akpm@linux-foundation.org,
 alexander.shishkin@linux.intel.com, ardb@kernel.org, ast@kernel.org,
 bp@alien8.de, brijesh.singh@amd.com, changbin.du@huawei.com,
 christophe.leroy@csgroup.eu, corbet@lwn.net, daniel.sneddon@linux.intel.com,
 dave.hansen@linux.intel.com, ebiggers@google.com, geert+renesas@glider.be,
 houtao1@huawei.com, hpa@zytor.com, jgg@ziepe.ca, jgross@suse.com,
 jpoimboe@kernel.org, kai.huang@intel.com, kees@kernel.org,
 kirill.shutemov@linux.intel.com, leitao@debian.org,
 linux-doc@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux@rasmusvillemoes.dk,
 luto@kernel.org, mcgrof@kernel.org, mhiramat@kernel.org,
 michael.roth@amd.com, mingo@kernel.org, mingo@redhat.com,
 namhyung@kernel.org, paulmck@kernel.org, pawan.kumar.gupta@linux.intel.com,
 peterz@infradead.org, rick.p.edgecombe@intel.com, rppt@kernel.org,
 sandipan.das@amd.com, shijie@os.amperecomputing.com, sohil.mehta@intel.com,
 tglx@linutronix.de, tj@kernel.org, tony.luck@intel.com,
 vegard.nossum@oracle.com, x86@kernel.org, xin3.li@intel.com,
 xiongwei.song@windriver.com, ytcoode@gmail.com
References: <9d351d80-66fe-486f-bdb3-370859dc47cc@intel.com>
Subject: Re: [PATCHv6 07/16] x86/vsyscall: Reorganize the #PF emulation code
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9d351d80-66fe-486f-bdb3-370859dc47cc@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> But, the resulting code is wonky. It needs to do something more like this:
>
> 	if ((error_code & (X86_PF_WRITE | X86_PF_USER)) != X86_PF_USER)
> 		return false;
>
> 	if (error_code & X86_PF_INSTR))
> 		return __emulate_vsyscall(regs, address);

To do this, LASS needs a proper interlink against NX || SMEP.

If neither NX nor SMEP are active, the CPU does not report X86_PF_INSTR,
meaning that fetches are reported as plain reads.

This leads to some fun corner cases in SMAP and now LASS too for virt.

~Andrew
