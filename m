Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8773BB124
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 10:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677670; cv=none; b=OoO3vrEYsvB71l07yblAic5DUyIXfz0lc+rclHSq6ftjB/9s0dLhuWabA+aPp7ld8XdkTuraE50V4OZNWryI9+tuPuLrjIlTDn+/QkZ6UoSYykcs8IzNpkzgC5XlIMtxczPrq6lp3gFHPUtjEvnQ3H1DTQ1I5xkeSZDEZH6/iMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677670; c=relaxed/simple;
	bh=oQucex6RZMs50tBRvSFd4gxrcOSnqTOU+r9tuuJZYTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YXTM1tG3RGecy2YkYRMq7X7fJdEVI8Ukl7IOnZxBKOhvg0EJhS+asVe+Iuv2ixoGeXNcrZMbHf9UqEH3yv1V6CTs1JnzhsOxoUoYJbLv8uxe5f++jIS4Dv/XbSrEtFfEHTbh0EzuMmqt1x+rF3js+24136e/mjwcO7BUY83av/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RBR4fXSG; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RBR4fXSG"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a0061bf0d3so33545e9.1
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 03:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790677651; x=1791282451; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f5Y1Bj47kFdGtgtMUGRUSsPhxIRB2mIpZUPvY4e79ZM=;
        b=RBR4fXSGaVY8aXl3WvdLyjrCE+NU93bkFIRarGoOCEsJ3oDUaWxvv8lD/Oaos30v6R
         cOVjoTrYu1x/+eqMii1oZlXfgWcmvz9M6N4IzU0U74oxRZpHB+PwY1s4vMXkg8zuluY3
         7urf5oj4szap2KOso/2K5L9yyleoQ1AG68J+SuNb8hyQX0FG5wgKXh1PKHkEVowEqzhS
         P1QJjm8A4OtYW4MSWSngGgdVIzep11HO6cfJuk4AFxdryyRptk6KAPrZQxdCrPMSulqn
         o6gctvaux52mCtX5lvBw95LHRj9LbnPZcS4Uy/6+sZrhYd6zxPecWK4HGYiTwp4mAQyh
         gx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677651; x=1791282451;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f5Y1Bj47kFdGtgtMUGRUSsPhxIRB2mIpZUPvY4e79ZM=;
        b=yenY3DchN8rrF+yu8Td2V2+Rx5xag+OMOiJLnbPXWEDDx96+XOy3p5cTmqBYbl10UO
         otHrjFbyMTiHrFEnHDOH92+8oAu3QpHx/s2y1x71KpnS1hAlRhJOpI4RwjjXoEXJQ71Q
         Fl0YvO5BMYvnTVUMjhmkBCr4V9xc4r54ozl2NkNC+rgIzqfoi5u0nxCOep809UcT/7Rn
         02O9L4AJbYrUtdYZ+zWVvRRIiPZvyH6jsu19DsgjS1G3Z2RoGGS3rzHp9miIcq3Pd+GL
         7MMBbG5N0wd4VkaJ8c/nlkan/jIDAbridUVoN4op1RZUOZjqhDyIGD+srH/OeGAYV6Lg
         Lwjg==
X-Gm-Message-State: AFuF++mil0XcZqs4LZ0meFzC2DfvOZiPhXB7i9+AqLJI52H79q90hr0a
	MBpVfFLTyO5pqosSDPtq9j9AE3ao6QPrY4hVZjAy0ndpljZX1tlOUCN97RasyprN+Q==
X-Gm-Gg: AYBFou3VOiLFbhSe6qMcih4lo5uextlOIF+2qPl2vbqCwXhG2aW3zcMuZGkofhXWlZD
	iknQ9QCqpZ1FdSNP0ezDUvhHA3ErVC0BF4JsEEDuoxFrYr/wCjxjIXbqYQX/EFICRU6V5SwSdqQ
	W6vJjtbRpMFiEmek7JtMYBt/y3DSpHSy4dXf7LJCWFXjHUY4A2m/tZrhvSdlB2cke1B35jYDVWF
	qb6+4GH2sGt1s0cP0Sr+QAI+Uj8rfg1Rz6DVjSl39Wci9RqOyRHEwxIdS9we2KV//3VHQOYPQtG
	RzVUXoG6iGjuLAYsueklNRSFi0q/k9HZdSYyyi6dRSVXLO6OpJ7bLSWVUPiwPpT6WP8m2Rvo8Jv
	TPS1BXbzq7TRT63p4sIoDCotbXb9R4vzWcHLbyE+L9txXutHGTfwXRCBlsiuP+ggI4F6HP9Qj3f
	VTTnJy0MBHjh/uTNkHbHfXrH7FknuPwlsMMGp/dhcQtvmJIZeldftaTfW9CMEOpWCROn/30bIgz
	hXUN2WQCD2V0gYkxrLIlI7yPzDA0XXKhb/ELIE2
X-Received: by 2002:a7b:c7d0:0:b0:49f:e312:54ea with SMTP id 5b1f17b1804b1-4a00f46d761mr379975e9.12.1790677650115;
        Tue, 29 Sep 2026 03:27:30 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00c10c656sm103565205e9.2.2026.09.29.03.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:27:29 -0700 (PDT)
Date: Tue, 29 Sep 2026 10:27:19 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com,
	will@kernel.org, mark.rutland@arm.com, akpm@linux-foundation.org,
	urezki@gmail.com, mingo@redhat.com, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	kees@kernel.org, david@kernel.org, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, gustavoars@kernel.org,
	bigeasy@linutronix.de, clrkwllms@kernel.org
Subject: Re: [RFC PATCH 12/15] sched/task_stack: Introduce
 ARCH_HAS_VARIABLE_STACK_SIZE
Message-ID: <aruShxHCUWEHr4i1@google.com>
References: <20260928174122.3380703-1-smostafa@google.com>
 <20260928174122.3380703-13-smostafa@google.com>
 <5c6edcfe-8332-4db6-b0fa-ca5d137a2075@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c6edcfe-8332-4db6-b0fa-ca5d137a2075@infradead.org>

On Mon, Sep 28, 2026 at 01:37:37PM -0700, Randy Dunlap wrote:
> 
> 
> On 9/28/26 10:41 AM, Mostafa Saleh wrote:
> > When CONFIG_ARCH_HAS_VARIABLE_STACK_SIZE is enabled, the kernel stack
> > may not be fully populated with the THREAD_SIZE virtual area.
> > 
> > Teach task_stack_size() to return the size of the vm area and not a
> > fixed size.
> > 
> > This propagates to end_of_stack() which makes functions like
> > stack_not_used() and set_task_stack_end_magic() to use the lowest
> > valid stack address instead of THREAD_SIZE which would cause data
> > aborts.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  arch/Kconfig                     | 10 ++++++++++
> >  include/linux/sched/task_stack.h |  5 +++++
> >  2 files changed, 15 insertions(+)
> > 
> > diff --git a/arch/Kconfig b/arch/Kconfig
> > index 45c657772362..d6fa2ccb0599 100644
> > --- a/arch/Kconfig
> > +++ b/arch/Kconfig
> > @@ -431,6 +431,16 @@ config HAVE_ASM_MODVERSIONS
> >  	  <asm/asm-prototypes.h> to support the module versioning for symbols
> >  	  exported from assembly code.
> >  
> > +config ARCH_HAS_VARIABLE_STACK_SIZE
> > +	bool
> > +	depends on VMAP_STACK
> > +	depends on !STACK_GROWSUP
> > +	depends on THREAD_INFO_IN_TASK
> > +	help
> > +	  An arch should select this if it supports dynamically configuring the
> > +	  kernel stack size.
> > +	  For example the kernel stack size can be from the command line.
> 
> 	                                    can be set from the command line.
> ?
> 

I will fix it in v2.

Thanks,
Mostafa

> > +
> >  config HAVE_REGS_AND_STACK_ACCESS_API
> >  	bool
> >  	help
> > diff --git a/include/linux/sched/task_stack.h b/include/linux/sched/task_stack.h
> > index 4a808f9c4631..07d73adaecd1 100644
> > --- a/include/linux/sched/task_stack.h
> > +++ b/include/linux/sched/task_stack.h
> > @@ -10,6 +10,7 @@
> >  #include <linux/magic.h>
> >  #include <linux/refcount.h>
> >  #include <linux/kasan.h>
> > +#include <linux/vmalloc.h>
> >  
> >  #ifdef CONFIG_THREAD_INFO_IN_TASK
> >  
> > @@ -96,6 +97,10 @@ static inline unsigned long *end_of_stack(const struct task_struct *p)
> >   */
> >  static __always_inline unsigned long task_stack_size(const struct task_struct *task)
> >  {
> > +#ifdef CONFIG_ARCH_HAS_VARIABLE_STACK_SIZE
> > +	if (task->stack_vm_area)
> > +		return task->stack_vm_area->nr_pages * PAGE_SIZE;
> > +#endif
> >  	return THREAD_SIZE;
> >  }
> >  
> 
> -- 
> ~Randy
> 
