Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293E828EA7B
	for <linux-doc@vger.kernel.org>; Thu, 24 Apr 2025 18:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745518586; cv=none; b=DfM77JLbdvwmMK4DS1WFbNh8rzjO333eJDv/p3vHEsMOLRK4ASWPLWba1lnrViLT0v/H7EyeN3Jlv4Z05oFWMEslce1jy+JJ4HL/pPMfSLYxtH5CVRHuA1o9XianXsWwsvdd8LDo7EZHbbfjOi/OJ685cV4Fc8PA9q2jWrVYFTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745518586; c=relaxed/simple;
	bh=xwIJYlS8Mxej9Ue36QIm4SREbYsNaNZe158F8eJvF30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ttcw+hf8OrShf+SVlIQ8Z8EPYvn8patqaF2B/7AdM2zE8H7zv53jHdxg+2saQ3Sw0ai5VjPFO0iDPKkNoq7fkKUYUI7aaObSVkO0UJ4XMayceSnqAv0Ul8S14r9xlb0qSQpVz5kqQiOziosYOOQRaEWxd3G+4WKopvhxkONMnFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=NOK+8qnl; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="NOK+8qnl"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736b350a22cso1180814b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 24 Apr 2025 11:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745518583; x=1746123383; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T9sHYezjUq6l/x/6C81DhRiO6Hkx3zNHx6RVEna5xiI=;
        b=NOK+8qnltocl7IjsIDqxYetNVinHbSt9qBQwhXvmJSzZm/Uj/A+EmAwPtIXsueGmIj
         m+XPDNBpYdajzutI+CSSyCjBf7HjgMqFV5tzTuvVtSkIK3eBz59mRmxbiO0UBJytArVJ
         JwbIsuvj2ZoNoLvKSqPlotq7uiV3tqPJhkh+4datkYvfGhyOgDt7kMovCVzgiIpfstBk
         S4v/2M/Ds4YsAEEEQlfryl2sv4S/tt+DeE3VGGSG3emgoJpBwato5wcWUETazw8nIdLn
         z56G++pZ3eW8WcfzbpGHR4a8Rf5DIByZE1/v3D4yk7znJHeBdY590OLcMTSOC9jC4C69
         3d9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745518583; x=1746123383;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T9sHYezjUq6l/x/6C81DhRiO6Hkx3zNHx6RVEna5xiI=;
        b=CfCYV3HxBXLz3vwBi0b8WLHYqCjpdRlzqMIgCmrag6/Qrg3hH2n/W8XeekfllIHW17
         Qm/nAd1EmTZmbPMu0TlZUDvVxfXyaWq/gyIjT+Nvu3AWuB00ezryqHtzYjuxZ+33KmXZ
         X69RWJ5KGM5bSMegjeFiSijQs8gyrjH6/FJt2a925DuL22g9Z+6vyv9G5HFSXJ9PTpdQ
         7HIGUDQusOkV80HqqA89GHMI1h9RJkdQL3nsQnMLxAG/iUMMxj8YTbFuXvivV6tQxq3j
         Vmsh/1xeSYrT0h1vZL6X/lXPRN6toqoMnn8potuzk5Yknu2652gmR7f5S11VI8a7301P
         9FTA==
X-Forwarded-Encrypted: i=1; AJvYcCWu4SKIYgy+SJ96W+fSzZrNZL9VQ182+8pT11407DBPOaAQm+8xvfJspjtzo4pAEiCt6iVS9TOXS04=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJfGZfjbK7EqeacraeertsNg0r1SgrwhtDwkDnpDTVerP8fUI2
	21rysUIJwQqwcXOw4RhwvHq3nPmFwGZoGch41MMOXdJTzqtRcVHxg++QF0hJxl4=
X-Gm-Gg: ASbGncudt3CuzABI9I3lfRuKfGYT4doP5aQMQ1ZN859c8jsE7Tu3CXb/cIodQWsZqHw
	Dqe3LSaY6i/vqMNkil3p0tIVJLR6eeT8Wd0HQkf5enJO7M+cI92EOrAeixymTQZjkmU7pgaiIa1
	BPwC5zRBhh3YV1DFEenXFLj/r5lJnZpH+/2ZKAvue3ZIh38HoydiAwI6LHaRy6y0B9ZDdfpdKEI
	YxPw1JvuJQBGXiZmz6hl14X0YeUDqq/CX30sja/Vt0hgjVIzHX/Zc1oJH9NCPM7kDsyx+6xZWAE
	KiAXWTQFqYv6RLnk4ZCGxX/BtINeI6C2A+xuk8TVMcD10Xq5keo=
X-Google-Smtp-Source: AGHT+IF0jVzUPU4VWGuVNQ17BhULhOztKBekv2BW5HkIJsQ1IRCAo1z8B5DG3h77AtgqUMysW+802Q==
X-Received: by 2002:aa7:9315:0:b0:736:9e40:13b1 with SMTP id d2e1a72fcca58-73e24ae7b45mr5236452b3a.23.1745518583417;
        Thu, 24 Apr 2025 11:16:23 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e259414c7sm1783697b3a.62.2025.04.24.11.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 11:16:23 -0700 (PDT)
Date: Thu, 24 Apr 2025 11:16:19 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com,
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v12 12/28] riscv: Implements arch agnostic shadow stack
 prctls
Message-ID: <aAp_87-Xr6gn_hD7@debug.ba.rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-12-e51202b53138@rivosinc.com>
 <D92V2NPNZYV0.136MJ2HOK48HE@ventanamicro.com>
 <aAnBmexbL4XmVxQk@debug.ba.rivosinc.com>
 <D9EWR3RQK0FD.3GF55KNS53YSR@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D9EWR3RQK0FD.3GF55KNS53YSR@ventanamicro.com>

On Thu, Apr 24, 2025 at 03:36:54PM +0200, Radim Krčmář wrote:
>2025-04-23T21:44:09-07:00, Deepak Gupta <debug@rivosinc.com>:
>> On Thu, Apr 10, 2025 at 11:45:58AM +0200, Radim Krčmář wrote:
>>>2025-03-14T14:39:31-07:00, Deepak Gupta <debug@rivosinc.com>:
>>>> diff --git a/arch/riscv/include/asm/usercfi.h b/arch/riscv/include/asm/usercfi.h
>>>> @@ -14,7 +15,8 @@ struct kernel_clone_args;
>>>>  struct cfi_status {
>>>>  	unsigned long ubcfi_en : 1; /* Enable for backward cfi. */
>>>> -	unsigned long rsvd : ((sizeof(unsigned long) * 8) - 1);
>>>> +	unsigned long ubcfi_locked : 1;
>>>> +	unsigned long rsvd : ((sizeof(unsigned long) * 8) - 2);
>>>
>>>The rsvd field shouldn't be necessary as the container for the bitfield
>>>is 'unsigned long' sized.
>>>
>>>Why don't we use bools here, though?
>>>It might produce a better binary and we're not hurting for struct size.
>>
>> If you remember one of the previous patch discussion, this goes into
>> `thread_info` Don't want to bloat it. Even if we end shoving into task_struct,
>> don't want to bloat that either. I can just convert it into bitmask if
>> bitfields are an eyesore here.
>
>  "unsigned long rsvd : ((sizeof(unsigned long) * 8) - 2);"
>
>is an eyesore that defines exactly the same as the two lines alone
>
>  unsigned long ubcfi_en : 1;
>  unsigned long ubcfi_locked : 1;
>
>That one should be removed.
>
>If we have only 4 bits in 4/8 bytes, then bitfields do generate worse
>code than 4 bools and a 0/4 byte hole.  The struct size stays the same.
>
>I don't care much about the switch to bools, though, because this code
>is not called often.

I'll remove the bitfields, have single `unsigned long cfi_control_state`
And do `#define RISCV_UBCFI_EN 1` and so on.
>
>>>> @@ -262,3 +292,83 @@ void shstk_release(struct task_struct *tsk)
>>>> +int arch_set_shadow_stack_status(struct task_struct *t, unsigned long status)
>>>> +{
>>>> +	/* Request is to enable shadow stack and shadow stack is not enabled already */
>>>> +	if (enable_shstk && !is_shstk_enabled(t)) {
>>>> +		/* shadow stack was allocated and enable request again
>>>> +		 * no need to support such usecase and return EINVAL.
>>>> +		 */
>>>> +		if (is_shstk_allocated(t))
>>>> +			return -EINVAL;
>>>> +
>>>> +		size = calc_shstk_size(0);
>>>> +		addr = allocate_shadow_stack(0, size, 0, false);
>>>
>>>Why don't we use the userspace-allocated stack?
>>>
>>>I'm completely missing the design idea here...  Userspace has absolute
>>>over the shadow stack pointer CSR, so we don't need to do much in Linux:
>>>
>>>1. interface to set up page tables with -W- PTE and
>>>2. interface to control senvcfg.SSE.
>>>
>>>Userspace can do the rest.
>>
>> Design is like following:
>>
>> When a user task wants to enable shadow stack for itself, it has to issue
>> a syscall to kernel (like this prctl). Now it can be done independently by
>> user task by first issuing `map_shadow_stack`, then asking kernel to light
>> up envcfg bit and eventually when return to usermode happens, it can write
>> to CSR. It is no different from doing all of the above together in single
>> `prctl` call. They are equivalent in that nature.
>>
>> Background is that x86 followed this because x86 had workloads/binaries/
>> functions with (deep)recursive functions and thus by default were forced
>> to always allocate shadow stack to be of the same size as data stack. To
>> reduce burden on userspace for determining and then allocating same size
>> (size of data stack) shadow stack, prctl would do the job of calculating
>> default shadow stack size (and reduce programming error in usermode). arm64
>> followed the suite. I don't want to find out what's the compatiblity issues
>> we will see and thus just following the suite (given that both approaches
>> are equivalent). Take a look at static `calc_shstk_size(unsigned long size)`.
>>
>> Coming back to your question of why not allowing userspace to manage its
>> own shadow stack. Answer is that it can manage its own shadow stack. If it
>> does, it just have to be aware of size its allocating for shadow stack.
>
>It's just that userspace cannot prevent allocation of the default stack
>when enabling it, which is the weird part to me.
>The allocate and enable syscalls could have been nicely composable.
>
>> There is already a patch series going on to manage this using clone3.
>> https://lore.kernel.org/all/20250408-clone3-shadow-stack-v15-4-3fa245c6e3be@kernel.org/
>
>A new ioctl does seem to solve most of the practical issues, thanks.
>
>> I fully expect green thread implementations in rust/go or swapcontext
>> based thread management doing this on their own.
>>
>> Current design is to ensure existing apps dont have to change a lot in
>> userspace and by default kernel gives compatibility. Anyone else wanting
>> to optimize the usage of shadow stack can do so with current design.
>
>Right, changing rlimit_stack around shadow stack allocation is not the
>most elegant way, but it does work.
>
>>>> +int arch_lock_shadow_stack_status(struct task_struct *task,
>>>> +				  unsigned long arg)
>>>> +{
>>>> +	/* If shtstk not supported or not enabled on task, nothing to lock here */
>>>> +	if (!cpu_supports_shadow_stack() ||
>>>> +	    !is_shstk_enabled(task) || arg != 0)
>>>> +		return -EINVAL;
>>>
>>>The task might want to prevent shadow stack from being enabled?
>>
>> But Why would it want to do that? Task can simply not issue the prctl. There
>> are glibc tunables as well using which it can be disabled.
>
>The task might do it as some last resort to prevent a buggy code from
>enabling shadow stacks that would just crash.  Or whatever complicated
>reason userspace can think of.
>
>It's more the other way around.  I wonder why we're removing this option
>when we don't really care what userspace does to itself.
>I think it's complicating the kernel without an obvious gain.

It just feels wierd. There isn't anything like this for other features lit-up
via envcfg. Does hwprobe allow this on per-task basis? I'll look into it.

