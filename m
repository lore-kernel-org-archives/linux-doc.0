Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE9F5473E
	for <linux-doc@vger.kernel.org>; Fri, 16 Aug 2024 04:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723782939; cv=none; b=OOKoU9gkCCReRkz1V46yd6z8mRRBJV56osphGhdzTJnjK2RjrrC4VWndGbgVJM2DbRLU+Tgc6orP890HlEoEVC/O6qjikr/aK/Wbh0hciw8YSueH5Hg0EeCOzD3fiahBvArX3SO1eeeK++G5UTAjPzdC0dY+roau0XAOC11Ex1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723782939; c=relaxed/simple;
	bh=X8AMtrm1ZHCQabBnimXlNX0HajqjyfZ5uTTwg3uIXBo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=M60VJvzpRzhjzqryjgSsj1qvvXMqCh4cnmGH2yBn4R5yL+mk8OOsMnLJ93MpG1WN6DCjcq8WMVScd9m+OAEtyC/vSZ94MUi1qBU1G41aBPPUU6x6UiVzHSVyHhtENVz8VHFglrS/vEkjeI1gUZP0AlT8nILEMOA4E1gFRAQlce0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nop1MK0c; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nop1MK0c"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e0353b731b8so2671427276.2
        for <linux-doc@vger.kernel.org>; Thu, 15 Aug 2024 21:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723782937; x=1724387737; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tJugbr/dHQuuxv90S++EnZzgWp8LwpjAc7rxg2dQsxI=;
        b=nop1MK0c/tNfg3ceiC5eaODFJUu4xh0CdwCCJgrfIzQCeWLULuvVs0WW4rN47FJ3/z
         /LfNcu4TYAPNPRAw9JGaLYeoNC/uyczi4wguTENx6/WORoj8GdMD5QLx3FliVDeNNSYw
         bWKI1tz2FTdJqyvGLDFIK+XfaHkGydXesMJoqFyCKHfUCW5ksizwv4OaXwKppB8thUdx
         9/AunbCk1Eh0+DflsPD2rEKHY1DxlxJ2F15IrfSMkHRDOx8OYAu/V27fDAdnNCQTtnR9
         T7le3smzJ6oE92pHgctevXcj5nkI0xWIhGzeAYoMlTjLy6rzb0DrDxbptaiTHwQSjWFc
         xpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723782937; x=1724387737;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tJugbr/dHQuuxv90S++EnZzgWp8LwpjAc7rxg2dQsxI=;
        b=u9fB8Hwh5Yz7JqqVxS/8zTUMd+5caUh7prKiHJ26U791xjuGKPbsn/BsAW7L7HF3MS
         GiPNQsGzmqn1gkCTZhbI3PK7IirH835mIB26pUPFczJpEg8Q4NIlvO3CyjpkcXRxNzan
         NWRxxHRLnWD6ZRtGbSgxGgDH9esCBhA/lWk816pG0zcTskQT2+nAJyooy+uZt6PWQNMZ
         CjOMd9pgWopCvvD0kpiGGHn3Vgtsxq7piKWq9yJ2VJ0+YGUJW6XGAS7BNTmsvVf/62l+
         /0oIWVeNc0J9uDYKhw6kq3D2T4TFtL74yS+o8cQtQUN8J5xU5n78wT+e3K8yvRFwhfq1
         /uPw==
X-Forwarded-Encrypted: i=1; AJvYcCW3Fb36tQuopyVxuJwKMt6kYu+/DQTAnJWUXliEjI+W+HZPo+iPoIVFbcGWGcYA0iQaz8uz28wJRB1tSxT0snUc/Ihp3Syg7cZP
X-Gm-Message-State: AOJu0Yyb1WxVWzsSMMRdoXxVRo20gCLe8qIxEnnZCTPAa/YetzQj1bI1
	4RcSe2+lbxaDDk/3hDFK/3lBkfKPIEnxqn+aLy2QinPEDK+bvFq464wO63YCAa/izHYn2JGlRaE
	fuA==
X-Google-Smtp-Source: AGHT+IGEbmlaJwBINuHg1cdie6g19mPtvC3WId3k4W7HGrMlOoNHRNRveuhmgnKhVwlupKMKRy1OMVPccjA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:b287:0:b0:e03:3683:e67f with SMTP id
 3f1490d57ef6-e1180eaf6e5mr2398276.5.1723782936887; Thu, 15 Aug 2024 21:35:36
 -0700 (PDT)
Date: Thu, 15 Aug 2024 21:35:35 -0700
In-Reply-To: <20240522001817.619072-22-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240522001817.619072-1-dwmw2@infradead.org> <20240522001817.619072-22-dwmw2@infradead.org>
Message-ID: <Zr7XF25TDKN-RR8E@google.com>
Subject: Re: [RFC PATCH v3 21/21] sched/cputime: Cope with steal time going
 backwards or negative
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Durrant <paul@xen.org>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Daniel Bristot de Oliveira <bristot@redhat.com>, Valentin Schneider <vschneid@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jalliste@amazon.co.uk, sveith@amazon.de, zide.chen@intel.com, 
	Dongli Zhang <dongli.zhang@oracle.com>, Chenyi Qiang <chenyi.qiang@intel.com>
Content-Type: text/plain; charset="us-ascii"

This should be posted To: something other than kvm@, in a separate series, else
it's bound to get lost/ignored.

On Wed, May 22, 2024, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> In steal_account_process_time(), a delta is calculated between the value
> returned by paravirt_steal_clock(), and this_rq()->prev_steal_time which
> is assumed to be the *previous* value returned by paravirt_steal_clock().
> 
> However, instead of just assigning the newly-read value directly into
> ->prev_steal_time for use in the next iteration, ->prev_steal_time is
> *incremented* by the calculated delta.
> 
> This used to be roughly the same, modulo conversion to jiffies and back,
> until commit 807e5b80687c0 ("sched/cputime: Add steal time support to
> full dynticks CPU time accounting") started clamping that delta to a
> maximum of the actual time elapsed. So now, if the value returned by
> paravirt_steal_clock() jumps by a large amount, instead of a *single*
> period of reporting 100% steal time, the system will report 100% steal
> time for as long as it takes to "catch up" with the reported value.
> Which is up to 584 years.
> 
> But there is a benefit to advancing ->prev_steal_time only by the time
> which was *accounted* as having been stolen. It means that any extra
> time truncated by the clamping will be accounted in the next sample
> period rather than lost. Given the stochastic nature of the sampling,
> that is more accurate overall.
> 
> So, continue to advance ->prev_steal_time by the accounted value as
> long as the delta isn't egregiously large (for which, use maxtime * 2).
> If the delta is more than that, just set ->prev_steal_time directly to
> the value returned by paravirt_steal_clock().
> 
> Fixes: 807e5b80687c0 ("sched/cputime: Add steal time support to full dynticks CPU time accounting")
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  kernel/sched/cputime.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
> index af7952f12e6c..3a8a8b38966d 100644
> --- a/kernel/sched/cputime.c
> +++ b/kernel/sched/cputime.c
> @@ -254,13 +254,21 @@ static __always_inline u64 steal_account_process_time(u64 maxtime)
>  {
>  #ifdef CONFIG_PARAVIRT
>  	if (static_key_false(&paravirt_steal_enabled)) {
> -		u64 steal;
> -
> -		steal = paravirt_steal_clock(smp_processor_id());
> -		steal -= this_rq()->prev_steal_time;
> -		steal = min(steal, maxtime);
> +		u64 steal, abs_steal;
> +
> +		abs_steal = paravirt_steal_clock(smp_processor_id());
> +		steal = abs_steal - this_rq()->prev_steal_time;
> +		if (unlikely(steal > maxtime)) {
> +			/*
> +			 * If the delta isn't egregious, it can be counted
> +			 * in the next time period. Only advance by maxtime.
> +			 */
> +			if (steal < maxtime * 2)
> +				abs_steal = this_rq()->prev_steal_time + maxtime;
> +			steal = maxtime;
> +		}
>  		account_steal_time(steal);
> -		this_rq()->prev_steal_time += steal;
> +		this_rq()->prev_steal_time = abs_steal;
>  
>  		return steal;
>  	}
> -- 
> 2.44.0
> 
