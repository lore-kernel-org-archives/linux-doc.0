Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E023362152
	for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 16:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932866; cv=none; b=OEC16fbqr+aRdCfqOrch7uZ2ZAt/z/Q6nH93/G46Vhzl/LFdIgiS0RQ6KRHdQ6s/P/Ca0JfbaDNdXlvPcBFMpIgJwnaa/xz0M2jIKPZDpSINkpZBxSSw4YiJsOUVI8p8kjDrr7wHWB+H3voRCQaJWM5EkEZrhfRqR/I60+VyWrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932866; c=relaxed/simple;
	bh=acaGKz0epgqSOqnUBYPIn/wzR14CgrSAgFYBfAKjmi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hENVM9P2RfvzmUm0+NH2YWjlDYQPKfbF4Ee3P4sFKlx775K0fRiCM8kjj0AX77jgaCv9P6WQ8+mRgEe9+ceCAC65xRGL5cW1QzFVZCEnARU1Ig6AOChrmKJ5t45pVnoZMTxZ/XAOspIn4oR74T/HcI0N3dNcmAZaXGlPBvF3YEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=fYg/JM0v; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="fYg/JM0v"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4b21f09ea42so969381b6e.2
        for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 09:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1787932863; x=1788537663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oiI3nnX2AJMzBD/AQu0wYIA1ehO1e9AZvUik61NexJk=;
        b=fYg/JM0vwRgUFcehHX7OG0y8F/jA+voJ5zHI9LsQqRlK4WsVyB0qIObduaPPAbd9i6
         2Z+brAUeno6b5yjYq3//wAzouiPZxGo0d0UhDmVKOJEK/oHUglY/lhPbKL+AcjcL2jOc
         m6za0QtTbGWSJBaOi9tB/PEf4iojzpKf4UddoSbjCKGJnJtftpwVjR1wuHqiG028Izjq
         CiPCnLhPLohp96CcLHoHIEkuzueuT+mHGKsonWWwXozj79/r1QnmtVLzCvRnTFrbl9iJ
         PtUIWafA5np8U6x+F8y9dXRetZ8ikqugThd6sJp+/OmtpAFzFicSW3/AYtqy1UqMglxA
         TS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787932863; x=1788537663;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oiI3nnX2AJMzBD/AQu0wYIA1ehO1e9AZvUik61NexJk=;
        b=HrxBrO2djEQ7s6II0IX+/RWTtRbr73+GMpsjCES7M/k1idFBmocQX3LYvcyOqcaJE7
         hcFEvL6ghA/uF19h2beP94ZExH311fxP+P5FUjqZK8W94tlG83PwgERzbkBhjHb2cqj1
         I+KREm8XEMdY3RK2BxsU2gHPm82jZYD3qEVc4FU4D2o26g/uMhgUsLme2EdByRkFRsco
         JTbXYDgVET56on4iOTtyLk/HPzxVO8W94usLVXZDX+jCzs+AXZl96p7/J2JQdU6o4hhe
         ONFKX95oAXp/4eHzUNqgRukgr5eh1Urfr75rdJBp0JXihVPm9k1NqII7PhjZeBFx1hUV
         nY6A==
X-Forwarded-Encrypted: i=1; AHgh+RrSROqcJ6uZxEMWk0p0lgsToLeB0pW/Hpq8zD/Z51Ikcpm6BN5zuCsRIWnjKJkknq/6ywvqEFQBhLg=@vger.kernel.org
X-Gm-Message-State: AFuF++lizqALJFr98lhSysfVnsf0ovyH2CBkpcfVHGJOrftDx4KlNadl
	L3epHxU7siQs6u84w42BSna46KtlghuZh8sL1siBiMzrcnDquydmduWXVzFaSWJx3e8=
X-Gm-Gg: AR+sD10VMnpEVgNsTjKmBpaaaj/gqY64t5KATVPa+1eLlqrolaLA4BaSQTqvG0q9Iix
	WsyvSEH3fQnGa46R5k/Ej3uXv76Gfkk3AI9fs5anHUUKdLMW1Nv7h9sBDwyGahmVzFvD6zdDZiX
	5poQIznxSTwta3VHOskdql8KNiDW2U8VBgZH9xj0xLIvIISyJNtpuD+B7v7+/zQCbgGHwlRfiHh
	9R9Y56ETbp6NBiFdKTTnfSk9WFx63TqnhUzNH9bp1wfmcWKjgU1Vmzp7tBKxfH2KsZQen0Kny04
	valb6pZNlfgffLrkFCYVZEzsynGnecIHPrOhTiSXow01fNCknLxiiCAJNsfr2hW5tMSuZFC//kx
	2tctekCEdn59/hJqyVWkXkExgutjmLTiASqM2h9L9xRvt9Xqs6c0qXfi8ItQiJu6jXZ3/+g9Aw4
	XiYTxvgGf2QpYZ2EFeJdlJ9ce0mZ1tBSrR0XkcwOB5NmJ+gTuMYg9doJMANb0GYL7rJkEyeP2JS
	g==
X-Received: by 2002:a05:6808:1910:b0:495:f85b:38c0 with SMTP id 5614622812f47-4b398190d7amr8529387b6e.12.1787932862988;
        Fri, 28 Aug 2026 09:01:02 -0700 (PDT)
Received: from localhost ([47.209.119.30])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b3a1625641sm1595919b6e.4.2026.08.28.09.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:01:02 -0700 (PDT)
Date: Fri, 28 Aug 2026 11:00:59 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Mark Harris <mark.hsj@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>, bergner@tenstorrent.com,
	kito.cheng@sifive.com, dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Guodong Xu <guodong.xu@oss.qualcomm.com>,
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>,
	Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Yao Zihong <zihong.plct@isrc.iscas.ac.cn>,
	Jingwei Wang <wangjingwei@iscas.ac.cn>,
	Deepak Gupta <debug@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: Re: [PATCH v3 2/3] riscv: hwprobe: export the availability of
 vector to user
Message-ID: <apGwuxgYZsZHiB8o@Tao-Chiu's-Mac>
References: <20260725001614.2578617-3-tchiu@tenstorrent.com>
 <20260813233854.86799-1-mark.hsj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813233854.86799-1-mark.hsj@gmail.com>

Hi Mark,

Sorry for responding late, we have been thinking through this internally
with the team and other community members, and here is the reply

On Thu, Aug 13, 2026 at 04:38:54PM -0700, Mark Harris wrote:
> Andy Chiu wrote:
> > Userland IFUNC resolvers use hwprobe to decide whether to dispatch to
> > vectorized routines. But RISCV_HWPROBE_KEY_IMA_EXT_0 only reports what
> > is present in hardware, not what the calling process may actually use:
> > when Vector is disabled for a process via
> > prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_OFF), it is still
> > reported as present. A resolver that trusts this and runs a vector
> > instruction crashes with SIGILL.
> > 
> > Add RISCV_HWPROBE_KEY_EXT_ENABLED, a positional modifier key that carries
> > no value of its own. Within a single request, keys placed after it report
> > extensions that are both present and enabled for the calling process,
> > while keys before it keep reporting hardware presence. This masks out V
> > and its V-dependent sub-extensions when V is disabled for the process, and
> > lets userland obtain both views in one query:
> > 
> >       [ {IMA_EXT_0}, {EXT_ENABLED}, {IMA_EXT_0} ]
> >           present       modifier       enabled
> > 
> > The enabled view depends on per-process state, so it cannot be served from
> > the vDSO's process-independent cache; requests carrying the modifier are
> > deferred to the syscall. Unknown keys are still reported as -1, so the
> > feature is detectable and existing users are unaffected.
> 
> Currently, each key has a value and the order of the keys does not
> matter.  If the interface needed to be extended to support
> process-specific values, or thread-specific values (the prctl() is
> thread-specific), I would expect either new keys to retrieve those
> process-specific or thread-specific values, or a new flag bit to

Our concern with the new flag is that we have to call hwprobe twice on
an old kernel that doesn't know about the flag. It takes a syscall when
the VDSO finds an unknown flag at the first call to hwprobe. The kernel
returns -EINVAL immediately, leaving all probe values empty. So the user
space has to make the second call with the flag bit unset.

> indicate that existing keys should be reinterpreted in a new manner.
> Using a key as a modifier with no value and changing the keys to
> be order-dependent seems like an unnecessarily confusing ugly hack
> that we would have to live with for decades to come, just to slightly
> simplify code needed in the short term to handle older kernels.
> 
> Additionally, the approach of falling back to the syscall whenever
> the modifier key is used could lead to each check for the vector
> extension, in an ifunc resolver or almost anywhere else, having to
> perform a syscall.  Callers wanting to use other extensions may
> even use this modifier when checking for them, because given the
> choice of knowing whether the extension is potentially available
> or is available, the latter sounds like what they should be using
> to be future-proof, even if there is not currently a way to disable
> the extension.  That could lead to a syscall for every extension
> check, defeating the vDSO cache.

Likewise, I think the new flag bit can encourage the same user space
behavior, because it is the same low cost change to get more
information.

> 
> On some non-RISC-V platforms glibc allows its own use of specific
> CPU capabilities to be disabled through tunables (e.g.,
> GLIBC_TUNABLES=glibc.cpu.hwcaps=-AVX2 ./my_x86_64_program), and as
> of glibc 2.44 tunables can also be set in /etc/tunables.conf and
> applied system-wide, even to specific programs.  This is more
> convenient than a prctl and it would be nice if RISC-V extensions
> could also be disabled for specific programs through tunables, for
> any use where its availability is checked beforehand (in an ifunc
> resolver or elsewhere), without the need to go to the kernel for
> each check.
> 
> Because ifunc resolvers may not have access to external symbols
> beyond __riscv_hwprobe(), it is really attractive to be able to
> obtain extension availability information using the same function.
> But that doesn't mean that the kernel has to be involved.  The
> function is in libc, so it could call the vDSO function and then
> optionally modify the resulting values according to its own
> process-specific information about enabled or disabled extensions.
> This extra information would ideally come from the initial hwcaps

Unfortunately, I think the riscv community has decided to stop using
hwcap and move forward with hwprobe. Although I agree with you that it
is a convenient way to add such per-process's extension enablement
status.

> (which reflect the vector prctl) and any tunables, so it is
> process-wide, can support arbitrary extensions, and can be checked
> without any kernel syscalls and without callers having to know or
> care whether a particular extension can be disabled.  If the prctl
> was used to re-enable vector in some thread that may not affect it,
> but that seems like the desired behavior, at least for ifunc
> resolvers, since they are assumed to produce the same result in any
> thread and at any point during the process lifetime.
> 
> If implemented using a new flag, the libc __riscv_hwprobe() function
> could just call the existing vDSO function but with the new flag
> masked out, and then if the flag is set, modify the resulting values.
> That would probably be the simplest and easiest to understand API
> and would not require kernel syscalls.

I think the argument comes down to: do we expect the mismatch between
an extension's availability and existence to grow? Using the same set of
keys sounds like a good idea if we expect more extensions comes with
per-process enablement status. On the other hand, if future extension
supports come without the ability to turn it off, then this
implementation may be an overshoot.

Cheers,
Andy
