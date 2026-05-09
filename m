Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0628332720D
	for <linux-doc@vger.kernel.org>; Sat,  9 May 2026 19:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778356248; cv=none; b=VOXHkNxgkcfEglWm/6ysfWnqNz7TyUAZZQjhTmNp5zl7T7Jr6KSstN+VOzz9XRMOHAUEdItTNOVh51DPo18pMv6/+DtXf3rVl7DccPysAsE2gIfqXkUBpVgvPdJLWhOif+xSG3JMlL4H0mrhgu32xLirFU2C8UW8MaPwHfAcyiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778356248; c=relaxed/simple;
	bh=BZAC33LW9M88FFJnXaznzhlecqWn49FnqF1CP0Mwktc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PwSgTeEKsTz9R/hPUvG5yWQL+rT4CBbELxUMw8NZ/kBeUlSR6doeaZKAkxioHm0KO+S7y6/FKfQ6Y7MWZHCY4At8WhBocdoaFzUR3sAPrU218RzBQJ293sC+lUzDss2dbEy3p8JdPY1XdKFK+/38p9aTAIktOBrQ5bAXoK6JbQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=V7woRIQi; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="V7woRIQi"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-479ef2b78f3so2633798b6e.2
        for <linux-doc@vger.kernel.org>; Sat, 09 May 2026 12:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778356245; x=1778961045; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xCSnyjxgyQ4w6cuT2O95eDPh9tDRVoHZ8wE9o2lR46E=;
        b=V7woRIQi1EpDkoI0JNXHVyvZLat4PyiK/oTN/O4iAipRW0VJ52gztIkYrKAnoMsOoA
         3wkIPBGYwLBIVuH/8Gp9L0g1sqgWldRcflVUbrtVLK4VVeRsmP3skV7SXqY4EPW2oPP/
         8f4r6Z6dFSekZmBhVBx8Q3cBK8BKUg8lZdtU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778356245; x=1778961045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCSnyjxgyQ4w6cuT2O95eDPh9tDRVoHZ8wE9o2lR46E=;
        b=XuUTeV4FrtCH4eO3G7dTsK11U53gnm7rBYUseOz2cUd7bxtRpvh57ncSI8dUAPMFn/
         N4fn+aqAXaShLsvFlH4aD9nBwr9ol/O6t8t2HN5Mbdl/iQeRzIfJDaluBc97HCI0RBgH
         TO3h/4/1eNV8j0qnBPakKQ+DUQI4D3qL4sA6NnMbzWhttGhHEoxYVSRdv/j9LhL8rmMD
         EpAcgEGBS8kHFQ8DNdGDsXpihj59VcAs+vxIDSJqZNASmOnK3B3KvNWyDAf7ygoyl6mM
         RzCqEn9hwvKi9ysPafKIB/2TW8hMviiG5cUip7ghWqlCJ/HPFf2zIWSet4ElZ0xaK04c
         WSXw==
X-Forwarded-Encrypted: i=1; AFNElJ/Xjp8oOowNlckgskQBpoyB5cBerl2VOE8Opsyss/+MHn3f8J581e2Jzmnh3DaghHTXmuN27HIUi4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOIvFmvhNFSJg1rW6TfW1xRJZPxaO1kUGkMs5+kSagZTkL8GvL
	hQ8zWjJJsyHNVBVHmG/urerWGLPl04t04J8yr8MvWIyvciD40Y7ZzWla5+xo9D48oAs=
X-Gm-Gg: Acq92OEbPhwcp4Jjl3GRfoGDYzka9PGzkxAEuwdMlhbbZnv2hSQPKeOfso6cyqmAmWw
	IZFem9upRqf3zCEi/Gao10CIBo40bMHPSj0YQawZslax/8TXsEDXT+MXQUYRTOOHkoUZT+/HOLW
	fW4i1eiLxbrL0lVIeu0yH3IVMjQsz2T6bqLqf03ZKM8x84SdGOJBnX2W8j/TKUf/jtocZiIupjP
	5wSNzEb+bnTc263mfLGtCFCHiphK6RrnXC3RrJ8wg5K+1nUWm+Cq/W7Xy9OS4RJGPvDIG9CwFsc
	NrxygSXxegU/vZcrGFS3G86BDkKibPIqBdJDT2ewezOEhNJNmIOaYjEoeYpHIdkfTcryo1vgnio
	Gd0BJOBXJji3cv1KqmYkmCVuPN8Rada3h72Eh9tBIjbl45ehF8DQqSEM/Q22StvfepOx8i/LF4V
	vH2jZcZD41u6YFR4aOzwqSfvVAUky1iJ0=
X-Received: by 2002:a05:6808:1a25:b0:479:f370:fac0 with SMTP id 5614622812f47-4807fc5c46dmr4472740b6e.18.1778356245561;
        Sat, 09 May 2026 12:50:45 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-47c76936220sm17107594b6e.10.2026.05.09.12.50.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2026 12:50:44 -0700 (PDT)
Message-ID: <7fa0af0d-2c33-4afa-b3f3-5e8a3b397b94@linuxfoundation.org>
Date: Sat, 9 May 2026 13:50:43 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
To: Willy Tarreau <w@1wt.eu>
Cc: greg@kroah.com, leon@kernel.org, security@kernel.org,
 Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Greg KH <gregkh@linuxfoundation.org>, Shuah Khan <skhan@linuxfoundation.org>
References: <20260503113506.5710-1-w@1wt.eu> <20260503113506.5710-3-w@1wt.eu>
 <a3ca798c-40ad-4afb-9c6b-35d53430b6d0@linuxfoundation.org>
 <af68uG2YIoYqnKbZ@1wt.eu>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <af68uG2YIoYqnKbZ@1wt.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/26 22:48, Willy Tarreau wrote:
> Hi Shuah,
> 
> On Fri, May 08, 2026 at 02:52:13PM -0600, Shuah Khan wrote:
>>> +What qualifies as a security bug
>>> +--------------------------------
>>> +
>>> +It is important that most bugs are handled publicly so as to involve the widest
>>> +possible audience and find the best solution.  By nature, bugs that are handled
>>> +in closed discussions between a small set of participants are less likely to
>>> +produce the best possible fix (e.g., risk of missing valid use cases, limited
>>> +testing abilities).
>>> +
>>> +It turns out that the majority of the bugs reported via the security team are
>>> +just regular bugs that have been improperly qualified as security bugs due to
>>> +ignorance or misunderstanding of the Linux kernel's threat model described in
>>
>> "lack of understanding" instead of ignorance?
> 
> I already had "misunderstanding", here I wanted to express the idea that
> people could simply ignore that this file exists (since it's new). Do you
> think we shouldn't care about this and just keep "misunderstanding" ?
> 
> (...)
>>> +The Linux Kernel threat model
>>> +=============================
>>> +
>>> +There are a lot of assumptions regarding what the kernel protects against and
>>> +what it does not protect against. These assumptions tend to cause confusion for
>>
>> Could simply say "what it does not" or "what the kernel does and does not protect
>> against"
> 
> Ah OK good point, I'll rephrase it.
> 
>>> +* **Configuration**:
>>> +
>>> +  * outdated kernels and particularly end-of-life branches are out of the scope
>>> +    of the kernel's threat model: administrators are responsible for keeping
>>> +    their system up to date. For a bug to qualify as a security bug, it must be
>>> +    demonstrated that it affects actively maintained versions.
>>> +
>>> +  * build-level: changes to the kernel configuration that are explicitly
>>> +    documented as lowering the security level (e.g. ``CONFIG_NOMMU``), or
>>> +    targeted at developers only.
>>> +
>>> +  * OS-level: changes to command line parameters, sysctls, filesystem
>>> +    permissions, user capabilities, exposure of privileged interfaces, that
>>> +    explicitly increase exposure by either offering non-default access to
>>> +    unprivileged users, or reduce the kernel's ability to enforce some
>>> +    protections or mitigations. Example: write access to procfs or debugfs.
>>> +
>>> +  * issues triggered only when using features intended for development or
>>> +    debugging (e.g., lockdep, KASAN, fault-injection): these features are known
>>> +    to introduce overhead and potential instability and are not intended for
>>> +    production use.
>>
>> Can we call out features and tools (the ones in kernel repo)
> 
> Sure!
> 
>> sched_ext's Kconfig enables
>> a few debug options including LOCKDEP
>>
>> tools/sched_ext/Kconfig:CONFIG_DEBUG_LOCKDEP=y
> 
> It's still there but maybe not visible enough, I should probably write
> it in upper case:
> 
>     debugging (e.g., lockdep, KASAN, fault-injection):
> 
>>> +* **Excess of initial privileges**:
>>> +
>>> +  * actions performed by a user already possessing the privileges required to
>>> +    perform that action or modify that state (e.g. ``CAP_SYS_ADMIN``,
>>> +    ``CAP_NET_ADMIN``, ``CAP_SYS_RAWIO``, ``CAP_SYS_MODULE`` with no further
>>> +    boundary being crossed).
>>> +
>>> +  * actions performed in user namespace without permitting anything in the
>>> +    initial namespace that was not already permitted to the same user there.
>>
>> This was a bit hard to parse - examples might help here
> 
> Yeah when rereading it now, I fully agree. I think I should avoid the
> double negation here and use a form such as;
> 
>    * actions performed in user namespace that do not bypass the restrictions
>      imposed to the initial user.
> 
> If examples are still needed, I could possibly add: "(e.g. ptrace, signals,
> FS or device access, system/network configuration, network binding)".
> 
>>> +  * anything performed by the root user in the initial namespace (e.g. kernel
>>> +    oops when writing to a privileged device).
>>> +
>>> +* **Out of production use**:
>>> +
>>> +  This covers theoretical/probabilistic attacks that rely on laboratory
>>> +  conditions with zero system noise, or those requiring an unrealistic number
>>> +  of attempts (e.g., billions of trials) that would be detected by standard
>>> +  system monitoring long before success, such as:
>>> +
>>> +  * prediction of random numbers that only works in a totally silent
>>> +    environment (such as IP ID, TCP ports or sequence numbers that can only be
>>> +    guessed in a lab).
>>> +
>>> +  * activity observation and information leaks based on probabilistic
>>> +    approaches that are prone to measurement noise and not realistically
>>> +    reproducible on a production system.
>>> +
>>> +  * issues that can only be triggered by heavy attacks (e.g. brute force) whose
>>> +    impact on the system makes it unlikely or impossible to remain undetected
>>> +    before they succeed (e.g. consuming all memory before succeeding).
>>> +
>>> +  * problems seen only under development simulators, emulators, or combinations
>>> +    that do not exist on real systems at the time of reporting (issues
>>> +    involving tens of millions of threads, tens of thousands of CPUs,
>>> +    unrealistic CPU frequencies, RAM sizes or disk capacities, network speeds.
>>> +
>>> +  * issues whose reproduction requires hardware modification or emulation,
>>> +    including fake USB devices that pretend to be another one.
>>> +
>>> +  * as well as issues that can be triggered at a cost that is orders of
>>> +    magnitude higher than the expected benefits (e.g. fully functional keyboard
>>> +    emulator only to retrieve 7 uninitialized bytes in a structure, or
>>> +    brute-force method involving millions of connection attempts to guess a
>>> +    port number).
>>
>> Can we add a section about problems found using experimental or tools
>> in development stage?
> 
> You mean one more paragraph about CONFIG_EXPERIMENTAL ? Or what else do
> you have in mind ? Do not hesiate to propose a paragraph if you have
> anything in mind!

This is what I have in mind:

issues found by closed source static and dynamic checkers that are
in development by individual or research groups.

I see that you sent out v3 and we can add this later. My Reviewed-by
hold for your v3.

thanks,
-- Shuah


