Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F68B26F46F
	for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 22:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758580144; cv=none; b=qOfwA98xfkjZDzd0SR2iKMXS1bSWzMrq5P0DNit8XocjMUkpv5UzIZvOv6+whRrjO4u1rNm/OTtZjA0HX+u41ezlnXybah7Yscqi3JuSJumFdSEWoelIaYhSD/EcTxFi41u7WjcByCN7yi8T8GWodHpZmLlp7mccvUMWmSkLkMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758580144; c=relaxed/simple;
	bh=bnoVvW7A4MZboCUWUp3uJoL/5QHRg63EHvbJEX0C48k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dw0H2BIgqgnc1h5J+/YcEB7TbmppKyY4FcwQlaReTjuKHm4z+/H4JLoTUfrprB8cUvMy1rd3xXRszCzUcOO7bx7vS8oJLIi/cVoRpXo9339zORp/NTXuUqRA1ZwN8Gvh+LKPWP/QkQG+x9wWNpGTXx+wjn7jzZb01K3ajUiMrPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IX5E30KV; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IX5E30KV"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b49c1c130c9so3314353a12.0
        for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 15:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758580141; x=1759184941; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BtoT7lETDiyBBBUdd6zpmqK1Q4j9ahP216sTNQ0nsxM=;
        b=IX5E30KVxgFPJ6p2dHUpUxJRlT0Z0s83563QpBj3WbExEofAH4EUzOd3Sa4/OvtHdI
         pz0DWgou/hhLEq0Y+bU/L4UEJ/8CWpNBYtOpE7Zx7MIm+7jScXnD8OqztbfRm3QMA/63
         +oxrnjL7NNyg/wXArhqBEgm61tsTA0dGcRDFCZC9bSB3BFjKISIcx12mhZmrpZkBMCWf
         IW/ZVCumH3zDLWz0kVZG9DjWmrOQSM0A4m5cFKzNF2Z3DzNOx8ydCWeNKfgdOrS76iAB
         YH87T9V1nLB2NVBQ0ORRQNcsAwnWaRPmGshhNrDMtRldhPUF91VQlOh/YYdLRASXc6hP
         O6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758580141; x=1759184941;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BtoT7lETDiyBBBUdd6zpmqK1Q4j9ahP216sTNQ0nsxM=;
        b=COiVQz/tLWspuQrkegDYp7IGzyls84k5aPC5wt6V9v6MjFU8MU5sNJBz3yqOEHp79l
         umKOw5AD73J8EjJ8IKaOo7kUJuqs9jNRaGAUMOS28NSY5itovRtoS6kr2SGce9vjeMH+
         /oDGuCpcSF1CcVnOTmIafEGI+qNmgSFirukAFaUPJ/+ECLT8NDc3TznuxVpJSAnfzhJ3
         mBafMRDR1FqPm0B55QZ6rcLLjmhuQI9arGiUw+pTJoJKNiFEhdfDMjR16LWly1gbii+w
         m8egWplUZc/owyaArFoEIIlyIB7WfO5CpkWVCbqhdSgeePKdDsFjbk8Qd7q7c5wgLDa4
         UD3g==
X-Forwarded-Encrypted: i=1; AJvYcCVLswVOZmGHgkaxjId7jUfvrk6NBxEZ3trBrLezAOLo7ufU9i677JdSXNKmHQF2ZhgeOAD56FyVP5I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0syrno7ZUv5UI7EUmnsJCOTlYeuKqY/1bUpPND/C20Sec2qdm
	78Sc03SuIyGzO11jG3nhWUCC43JGsxeM9kvs3PUMdXF3pfO5z9GEjpSag9gzgQ==
X-Gm-Gg: ASbGncuC1VoOpywpnb5+SYsQk3q/tf5w+t9ETWjp7vqLjvzPNM3ejBbFqtMqnOm+s8U
	XkdvhUcMc+zGPv0fgGTjgUTAxNgmPnhnlUfYJZ9NTQRUJ2f0pD+Qcqt6kBBjr3PxoV9ZOgWtEZt
	M6iJUCYpCA291i6Ofd+vcPczTYlFrqWz0Fp+Q4E0oaRwR+tf013PNGOhbHxbc9PV+Epuwf9uB6q
	rrhW00Nidc0KBDtRJTrBx2hzZWoBRjDjRmc+FXpJR8SVQpKApcPWO9JFEWpKbe2Dor11EUm5CFq
	qux5ZFh1lDeOGBZnif3gB/xJ/nnweyr1/W3OuqmJQD38bkeYcQDV8z3Xj2eXZYr8zAFWy1QQvdF
	l4xpwDmDh26F1A3W/5D2ZrZ/6IsP/fw==
X-Google-Smtp-Source: AGHT+IEr9MnnfuaOnEgl5Ok6lmMqyEMDd1YwFlpFnduveoNyqRB+X6CgKFY+fvDTCnEk46JVsmmqkQ==
X-Received: by 2002:a17:90b:3a8c:b0:32d:f352:f764 with SMTP id 98e67ed59e1d1-332a9542d69mr564005a91.2.1758580141402;
        Mon, 22 Sep 2025 15:29:01 -0700 (PDT)
Received: from [192.168.0.150] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b551518480asm10765908a12.28.2025.09.22.15.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 15:29:00 -0700 (PDT)
Message-ID: <864b1042-9494-44da-b87e-d4cd8aa1ec11@gmail.com>
Date: Tue, 23 Sep 2025 05:28:57 +0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: x86: Fix hypercalls docs section number order
To: Sean Christopherson <seanjc@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux KVM <kvm@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Wanpeng Li <wanpengli@tencent.com>
References: <20250909003952.10314-1-bagasdotme@gmail.com>
 <aNEAtqQXyrXUPPLc@archie.me> <aNFYL2Os3rbfMbh6@google.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <aNFYL2Os3rbfMbh6@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/25 21:07, Sean Christopherson wrote:
> On Mon, Sep 22, 2025, Bagas Sanjaya wrote:
>> On Tue, Sep 09, 2025 at 07:39:52AM +0700, Bagas Sanjaya wrote:
>>> Commit 4180bf1b655a79 ("KVM: X86: Implement "send IPI" hypercall")
>>> documents KVM_HC_SEND_IPI hypercall, yet its section number duplicates
>>> KVM_HC_CLOCK_PAIRING one (which both are 6th). Fix the numbering order
>>> so that the former should be 7th.
>>
>> Paolo, Sean, would you like to apply this patch on KVM tree or let Jon
>> handle it through docs-next?
> 
> I'll take it.

OK, thanks!

-- 
An old man doll... just what I always wanted! - Clara
