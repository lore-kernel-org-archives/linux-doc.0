Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44284A5EB3
	for <linux-doc@vger.kernel.org>; Wed,  2 Sep 2026 15:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788362042; cv=none; b=b7TvrG3wg8JBJOUbbf4g/oiOK9LT0mgAFEg91a4JnBZx+ENNN4kNvWM/3T/NUK48q+nH9PsNYNBfHZauQEf+WrsAaIE2yi/zKhNY8JBECqO2G4axfLJfrjg82gCQUWHZzi9+xbJGdbFwn/6q9iKnWUSg76JvQss63J/J4JX+fPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788362042; c=relaxed/simple;
	bh=zXpySTe9c/CONcavlK83lPvE3iwBTQZJH7PLz86J6R8=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=XqPhMa2Oz5tZszqtz0hg40X+qDtKbmwu5vDTbXgR1QG1fRmFiN+uSCDNT5X/+vxFgFHnx3QtGpxzlK/uOc9tinJWmdO7EKIM7kKJ2U+rV9HCuLocEBX//DCO0hxIs9SUuarulR7ZoMo/0VDECegHiaZjmx0GIAg7gGjjk+UxVxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20251104.gappssmtp.com header.i=@dabbelt-com.20251104.gappssmtp.com header.b=GyVRXWPe; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20251104.gappssmtp.com header.i=@dabbelt-com.20251104.gappssmtp.com header.b="GyVRXWPe"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso1411837a91.0
        for <linux-doc@vger.kernel.org>; Wed, 02 Sep 2026 08:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20251104.gappssmtp.com; s=20251104; t=1788362039; x=1788966839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:to
         :from:cc:in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lsfjpoWU5W1nFbaeVq9PkGCOWjt0Vb5QIPHyPQ5fb/8=;
        b=GyVRXWPeIQ6wq9PQixTHwkP6IpPTVNdkYI5KIR//aCuoC6nSS0m3MnZlZh7QxHfy2F
         VGeOhHgU5WJNd80yeQwnFSDZNvhbobbzjuvIzEdzbqR/MnLLa437e6m4hmzGBSURfr48
         v+1e6/Hb4/8MO4+3vqCUA6Y+t2Qt9EU2gr+Yu0ydpXApSU9nh/oI8bg0FGux++HaByNO
         uwrYugIjPvhBUTWfVmQ7Gts8TtMiYMFMWuhm7+ATXxWLRtBC3JOSe+yjYOKG7bPUPXr1
         tiiKqRH230LmQVecHrylVEPnTCB8vw3tYeTRYXe00q5iu2znlR0x4I0aBOuzP0BkZt5+
         Omdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788362039; x=1788966839;
        h=content-transfer-encoding:content-type:mime-version:message-id:to
         :from:cc:in-reply-to:subject:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lsfjpoWU5W1nFbaeVq9PkGCOWjt0Vb5QIPHyPQ5fb/8=;
        b=TwKvB6QA67Z5Bcpv8zpHcMeqf/P0kEYCWCxvaKc7SZlNK6Qa9Ys75b0xwoVh5b3KXb
         3OszUV69GE/EHbZWOf6m+wHorJfyiOhS4zoZ0lhSrZG1TT68LNvjuOIns22iVBukVye+
         dmh/B1UNRjgGxEiLnGutrAOIVHfE2J36ioANDvwNQmxMcZSnBajPzB6YPIEDfYv75KPp
         hf9+PnQmdeE72zrZ1c6B5SGxzB0Bb1tUssy8rzoBQ7a1jFj+HhBK4DFfKApGsU3YNXkf
         2oqlYPutblGSKTkEzkdOdaNRyJpbRAsptbXP3/1tTbguXtLKWFYq1WPQgclEqZ/8Gk0u
         IOcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbdtY7iTrjo+1rD+q+EsnwA7v4ervkQmMzjmPoCUt44iqEzSiaBNonIOdqA4Q0r0If1Xn6bTG5wEY=@vger.kernel.org
X-Gm-Message-State: AFuF++mswZWG5sOn/f595GX13GHDM2I0H36PrzcuNuY3lQkDgmkPqg+h
	YKpdTNkSCpq466uVwoNigCBdxPzJw6svQvA/cS59W+2zpZtFl60e9Khi0V5XuQS1Q5w=
X-Gm-Gg: AYBFou1NmE3egY/rwIqA7t0NzsNHJ59lv4RE5jQT9C+JmV6AxEVLz0tO3hVFJ8VSo5x
	uIKNP+ETe1Ab0rRXYse8fqly/0slR+6chwluDWR7DzcBJcLriN6/J69CVt4y7MqRMIRGeEUoi+c
	yVjwCmyhlu8VmWshg6mYLkcZqHwG08cgu7RxQuzJ4XcqBHv4QU/dhy1zp1dZESe31FKoFG2wlao
	t7d9hZSOzyX8G4kCmmgpoU4Y3hy0Q7BoFbs/Gpt5+mDiEagGhCrpBaWiNBSPJijGviokNyHc5H+
	jihaqHa0tD7JvIviBZy8K+xEg0wyIHdecaJZBNRHp5AfXeq+SiM078rs/0VJ72N/Nb4iZgb4ILN
	um1LP4TGdQU/XvNyeGver/Hj/q3+6T5W1pnsCpW/kHeSKrpORBumaH2cQWToUwPkeg1s9CDSB7m
	FWOX7E1+8PjNe/jXO6EF6kwHxi77kW24vzYJyqM7qU6DlWq8/ahnDcKgLM5N2h0oQY9+Q/0slKo
	32UfamkFx/GHElsGU8=
X-Received: by 2002:a17:90b:4d0a:b0:398:bee5:61d6 with SMTP id 98e67ed59e1d1-39aee1476d7mr7195875a91.24.1788362038327;
        Wed, 02 Sep 2026 08:13:58 -0700 (PDT)
Received: from localhost ([2001:5a8:4687:d600:2598:89cc:ed31:1932])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079f1a82sm7956912eec.10.2026.09.02.08.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:13:57 -0700 (PDT)
Date: Wed, 02 Sep 2026 08:13:57 -0700 (PDT)
X-Google-Original-Date: Wed, 02 Sep 2026 08:13:55 PDT (-0700)
Subject:     Re: Re: [PATCH v3 2/3] riscv: hwprobe: export the availability of vector to user
In-Reply-To: <apGwuxgYZsZHiB8o@Tao-Chiu's-Mac>
CC: mark.hsj@gmail.com, corbet@lwn.net, skhan@linuxfoundation.org, pjw@kernel.org,
  aou@eecs.berkeley.edu, Alexandre Ghiti <alex@ghiti.fr>, samuel.holland@sifive.com,
  bergner@tenstorrent.com, kito.cheng@sifive.com, dfustini@oss.tenstorrent.com, greentime.hu@sifive.com,
  andrew.jones@oss.qualcomm.com, guodong.xu@oss.qualcomm.com, aleksa.paunovic@htecgroup.com,
  pincheng.plct@isrc.iscas.ac.cn, luxu.kernel@bytedance.com, zihong.plct@isrc.iscas.ac.cn,
  wangjingwei@iscas.ac.cn, debug@rivosinc.com, cleger@rivosinc.com, linux-doc@vger.kernel.org,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tchiu@tenstorrent.com
Message-ID: <mhng-28F59A83-AAFB-46F4-8FC6-EDE4DD39EB5F@Palmers-Mini.rwc.dabbelt.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Fri, 28 Aug 2026 09:00:59 PDT (-0700), tchiu@tenstorrent.com wrote:
> Hi Mark,
>
> Sorry for responding late, we have been thinking through this internally
> with the team and other community members, and here is the reply
>
> On Thu, Aug 13, 2026 at 04:38:54PM -0700, Mark Harris wrote:
>> Andy Chiu wrote:
>> > Userland IFUNC resolvers use hwprobe to decide whether to dispatch to
>> > vectorized routines. But RISCV_HWPROBE_KEY_IMA_EXT_0 only reports what
>> > is present in hardware, not what the calling process may actually use:
>> > when Vector is disabled for a process via
>> > prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_OFF), it is still
>> > reported as present. A resolver that trusts this and runs a vector
>> > instruction crashes with SIGILL.
>> >
>> > Add RISCV_HWPROBE_KEY_EXT_ENABLED, a positional modifier key that carries
>> > no value of its own. Within a single request, keys placed after it report
>> > extensions that are both present and enabled for the calling process,
>> > while keys before it keep reporting hardware presence. This masks out V
>> > and its V-dependent sub-extensions when V is disabled for the process, and
>> > lets userland obtain both views in one query:
>> >
>> >       [ {IMA_EXT_0}, {EXT_ENABLED}, {IMA_EXT_0} ]
>> >           present       modifier       enabled
>> >
>> > The enabled view depends on per-process state, so it cannot be served from
>> > the vDSO's process-independent cache; requests carrying the modifier are
>> > deferred to the syscall. Unknown keys are still reported as -1, so the
>> > feature is detectable and existing users are unaffected.
>>
>> Currently, each key has a value and the order of the keys does not
>> matter.  If the interface needed to be extended to support
>> process-specific values, or thread-specific values (the prctl() is
>> thread-specific), I would expect either new keys to retrieve those
>> process-specific or thread-specific values, or a new flag bit to
>
> Our concern with the new flag is that we have to call hwprobe twice on
> an old kernel that doesn't know about the flag. It takes a syscall when
> the VDSO finds an unknown flag at the first call to hwprobe. The kernel
> returns -EINVAL immediately, leaving all probe values empty. So the user
> space has to make the second call with the flag bit unset.

IMO it's going to be more complicated long-term to have this behavior 
where previous keys change the meaning of subsequent keys.

Instead, let's just fix the issue were an unknown key results in no 
values returned, and intsead just return value of the known keys we were 
given.  That way userspace just gets the best we can give it without too 
many round trips.

Then we can just add another bit that encodes the new behavior without 
any dependencies on other bits.

>> indicate that existing keys should be reinterpreted in a new manner.
>> Using a key as a modifier with no value and changing the keys to
>> be order-dependent seems like an unnecessarily confusing ugly hack
>> that we would have to live with for decades to come, just to slightly
>> simplify code needed in the short term to handle older kernels.
>>
>> Additionally, the approach of falling back to the syscall whenever
>> the modifier key is used could lead to each check for the vector
>> extension, in an ifunc resolver or almost anywhere else, having to
>> perform a syscall.  Callers wanting to use other extensions may
>> even use this modifier when checking for them, because given the
>> choice of knowing whether the extension is potentially available
>> or is available, the latter sounds like what they should be using
>> to be future-proof, even if there is not currently a way to disable
>> the extension.  That could lead to a syscall for every extension
>> check, defeating the vDSO cache.
>
> Likewise, I think the new flag bit can encourage the same user space
> behavior, because it is the same low cost change to get more
> information.
>
>>
>> On some non-RISC-V platforms glibc allows its own use of specific
>> CPU capabilities to be disabled through tunables (e.g.,
>> GLIBC_TUNABLES=glibc.cpu.hwcaps=-AVX2 ./my_x86_64_program), and as
>> of glibc 2.44 tunables can also be set in /etc/tunables.conf and
>> applied system-wide, even to specific programs.  This is more
>> convenient than a prctl and it would be nice if RISC-V extensions
>> could also be disabled for specific programs through tunables, for
>> any use where its availability is checked beforehand (in an ifunc
>> resolver or elsewhere), without the need to go to the kernel for
>> each check.
>>
>> Because ifunc resolvers may not have access to external symbols
>> beyond __riscv_hwprobe(), it is really attractive to be able to
>> obtain extension availability information using the same function.
>> But that doesn't mean that the kernel has to be involved.  The
>> function is in libc, so it could call the vDSO function and then
>> optionally modify the resulting values according to its own
>> process-specific information about enabled or disabled extensions.
>> This extra information would ideally come from the initial hwcaps
>
> Unfortunately, I think the riscv community has decided to stop using
> hwcap and move forward with hwprobe. Although I agree with you that it
> is a convenient way to add such per-process's extension enablement
> status.
>
>> (which reflect the vector prctl) and any tunables, so it is
>> process-wide, can support arbitrary extensions, and can be checked
>> without any kernel syscalls and without callers having to know or
>> care whether a particular extension can be disabled.  If the prctl
>> was used to re-enable vector in some thread that may not affect it,
>> but that seems like the desired behavior, at least for ifunc
>> resolvers, since they are assumed to produce the same result in any
>> thread and at any point during the process lifetime.
>>
>> If implemented using a new flag, the libc __riscv_hwprobe() function
>> could just call the existing vDSO function but with the new flag
>> masked out, and then if the flag is set, modify the resulting values.
>> That would probably be the simplest and easiest to understand API
>> and would not require kernel syscalls.
>
> I think the argument comes down to: do we expect the mismatch between
> an extension's availability and existence to grow? Using the same set of
> keys sounds like a good idea if we expect more extensions comes with
> per-process enablement status. On the other hand, if future extension
> supports come without the ability to turn it off, then this
> implementation may be an overshoot.

Hopefully we'll learn from this mistake and just remember to add both 
the "can the this be enabled for userspace" and "has userspace asked to 
disable this" for anything else that ends up having that sort of 
behavior.

> Cheers,
> Andy
