Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6865F42E40A
	for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 13:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787663099; cv=none; b=uZQPkIudSCUhLHGJLlAytVPmakwdQmkmc0OyjLi6uJz0ZnQsfJ1zjUj0XpGi9GkK/gC1OmEqgLzZYtvrqr4A7lhbgt/Grv16nLygwTVFsBLoX8bGzvpBHBj2u3XPqQgKeR04K2+MY6AuQYX/cxOLqh21A8/pEzy6wSBKUzUnX3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787663099; c=relaxed/simple;
	bh=S7aRfssWDQ2nLsCC53U4z8DSCtzysrcHj28aPhwBZ4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jcERQBGRpqzbslxy0TDELOhCsO71x8easQOZ9pB9V1cJcCWKZNFzoX/SFhdHabHjwT14zMfgFpT2M7BthEiR8NprpJEqkJ6TnVVdFiAq4viKR4fZAM7L/imjHb+85EJUIH/wn8LEHat8KUG+XCe4hxblMcUNK08qaBtwlAxV3qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DGp+ZJsH; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGp+ZJsH"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c214321dc32so916420666b.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 06:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787663094; x=1788267894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PQylkDyhUMfAxwzHJuOU6RYKfPVocoG2MM8Zczy9TIY=;
        b=DGp+ZJsHpOzEwmDDv9uPdMPFecT4Ce+lOqvmEIAuv3ee9xYwWPJSnXDZB5E7J4k2Te
         y7/3qvMCPNnR8iVLWIB0MT9Z9qgL3VOAR5gr1WyXFhLlTL4nH7Na0bpds6wdX8QgstrR
         HNNfi986llysKm3M4vHdn/uL0zUY/rsZTGTtbptp1zTL9KdZ18xRqY+iDxCPhZl6VQUp
         FgXlHHFlgsVGd/GTZU3s656V8gu5rrvCTEGiiWvLZT5iJciOLFVVRgxzfcz7mQ/Lt7AD
         zL0s6njA33BARbtcW6nR7mupo/jJonZGGl5ECrNnx6sp3V3orF4wWMSuenwpRrf31619
         WvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787663094; x=1788267894;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PQylkDyhUMfAxwzHJuOU6RYKfPVocoG2MM8Zczy9TIY=;
        b=AJc0j+oRwJb5xBcGlY/7ggrQsEUJNmoGWp7lwkg8rOdwjnijRJIekjmLYNsrJNNGIg
         Om3zX+l70lSj4vnt2kcKR5NiQTIjSS30WBgNpaDjEzkeD272ATJ/p7tb2c9VkI/emO9k
         9zjEfQaoXJ3r4n2Q3sF8SQ9CD5Sc/7gQpGOgLKwiRne2r+MH6N+oF5Yc2Vjlmr1eY3TK
         GAX4+e4xfjzCpWvLnYCupOqGQBG7DuGnEBbb3xbFlgb9Al6fWmWdpYrTY90p5/8BFP5e
         CugN5kyglynUgjn+z5S0V50wU22kVF+gAXFdcYB480wghI3jjcqDs0sneyLh+ii8xq11
         wizw==
X-Forwarded-Encrypted: i=1; AHgh+Rpu62WJP/LoYpwQ46+rVAjJrZlia16zjLuQvepJQzsZwEBtFr5EyvaPrc9isAWAG94kMMDPuDyVNKQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nPOLyFJwJRZ8WHza8qogTKY5VhLMZdQ8kt37T5aPh+fcOmpFLe
	nXW90rn4xe6bJ2NPGowT7RSJUsub3O0MOx4ISGZAxALtgO4wEjHlevfT
X-Gm-Gg: AR+sD11fPlF0f5aQ7TbcPzGCZZ4H58jvzr3BKybsIFBQ4JQymN92Z8TFiIP+57TSNYz
	UhacGKsjRb6AC/Kxok9HGhKGUieMTp/kC3PTDnW+3EipTZMERpFRmANdpEH0bADkA5+dXt7cD2d
	FQ5l602KjmPQSdgrTk/ZxweNlkCyDVzjgg60dsKPLgoViO13HZPJkGDuGL16UUE5Pdyz0DXzqgy
	1rPIykHRpGhs7k08BpQ5Oodeb1DUOds6GP752joqZ042ek93hVk+iIL9CHIj78XG02UzwE5WUiA
	B97mBWJII1eUT4DLF4vDuu9XOaTIqWpe3uLyCd6oK5fSOohqFfiqACkk3kDwZSl3y7Ei7DLhZSB
	fblZI/mqWZMzrK66U5CGg2BxQzjo7RfrH1HSqSaZgPpgXZivE2b3iH9PKhxoFM8NrczGzeR6aWt
	qCS1mVt4x+sAR6x9ld2vbmtAFX5/zjTsWw8TtnowTXlTGPreejvt889QsgqNmEVlbSPxufHBFuE
	7ry
X-Received: by 2002:a17:906:fd8d:b0:c25:58e:83ff with SMTP id a640c23a62f3a-c25058e8844mr45353566b.10.1787663093845;
        Tue, 25 Aug 2026 06:04:53 -0700 (PDT)
Received: from [10.45.28.110] ([15.248.2.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b4f1sm1822703566b.3.2026.08.25.06.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 06:04:53 -0700 (PDT)
Message-ID: <f81f8437-57da-4545-9046-28562df3c385@gmail.com>
Date: Tue, 25 Aug 2026 14:04:52 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] KVM: arm64: Add pre_fault_memory implementation
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, pbonzini@redhat.com,
 joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
 shuah@kernel.org, corbet@lwn.net, vladimir.murzin@arm.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 isaku.yamahata@intel.com, Jack Thomson <jackabt@amazon.com>
References: <20260612162354.73378-1-jackabt.amazon@gmail.com>
 <20260612162354.73378-3-jackabt.amazon@gmail.com> <alEXtW7w-rqlNG09@raptor>
 <0365d77d-616b-47f7-a5f2-3388bad692a1@gmail.com> <ao2KmmUd1lVFUUkp@raptor>
Content-Language: en-US
From: "Thomson, Jack" <jackabt.amazon@gmail.com>
In-Reply-To: <ao2KmmUd1lVFUUkp@raptor>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alex,

On 25/08/2026 1:29 pm, Alexandru Elisei wrote:

[...]
> 
> I think there's a word missing there, I meant to say that it would be useful to
> explain *why* the x86 implementation does not mark new PTEs as accessed, while
> arm64 marks them as accessed, and arm64 also does that for existing PTEs.
> 

Ah got you, I'll update the docs in v6 to explain that. Thanks!

> I was wondering if you have any plans about posting an updated series.


Yeah I have v6 almost ready, I've addressed the comments. While testing
it found an issue on pKVM which would case a hyp panic if we prefaulted
before it's first run, the EL2 context load blows up. So I've also go a
fix for that bundled in.

I'm just tidying a few bits up and hopefully have it out within the next
couple of days.

-- 
Thanks,
Jack
