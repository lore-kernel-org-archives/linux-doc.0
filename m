Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C193FFABF
	for <linux-doc@vger.kernel.org>; Mon,  2 Mar 2026 14:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772462276; cv=none; b=I8Bam12Xa4yY0l77yoxMr5ms4MrxVNspOtvNmjzqk3W7Cd6vnfopqpyxEhGAgUmpmQ6mmoHAXtElta/bZCP/5yEfjUBrV+G5HoFqJ3A7W0GvTIkFuzwpFrhzug/2GJJiiZC8xnd11fx+aP+wlQVX2YSJX8H+vde3l3sHwZtpkc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772462276; c=relaxed/simple;
	bh=SG8Nvfo7w+sgi8qsb3e/oi2kuPyTcOKT0aLGoFOWCGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m3J+sRiTkb7it8Ui4rQo7Tx8iHql8gBQsMuwf9LsVFVtJEKCxaqf3SZDexTfPZnYXr2ByCG+JyKwi0EM6MclioTON+LNdZXhOSGVyDUEOZyX06DuOhg5SdjMkV+btB+91ZEeT5pl53RzmxQIxdDFz0cYJtSKHdr/B2K+CvrdFcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=US15FsXc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gf+KLn/X; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="US15FsXc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gf+KLn/X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772462274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8sJlSZs5xrhC2dH3em7lfnyFktrvfkJs63IZ5CWmLzM=;
	b=US15FsXcWrW7cwRretuuP6b2n9seRS7dbM0m7FzjlT3duWXsWe4nQAf5IKrem8BwcIu4La
	WQovAbs0C1u0eIPcu+TYfM4oauZsiZt/JSvSzWne27jDXffONqNgY2Ja2kEEaThJSgZqvf
	HhRAQNxkd6wIhiQSqGTeLFF/WBo1+j8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-0h5trE3bNQG-oQtcFpOyFg-1; Mon, 02 Mar 2026 09:37:53 -0500
X-MC-Unique: 0h5trE3bNQG-oQtcFpOyFg-1
X-Mimecast-MFC-AGG-ID: 0h5trE3bNQG-oQtcFpOyFg_1772462273
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-48379489438so42992575e9.2
        for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 06:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772462272; x=1773067072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8sJlSZs5xrhC2dH3em7lfnyFktrvfkJs63IZ5CWmLzM=;
        b=Gf+KLn/XKOgksvfhZxEZ0o70hX1fVr39SygTIzr9s15oI8JdJUxjqcZtcZ/yZo3mcI
         r3OFoz3xI0haY1bfblvoHSUg3xSyH8FpUo5RtqYvggS64D5dhp7GG4NZtxuPBdVqKaSY
         IA0x4bpREMJx8Rg+9C/CofjvodCzkLidBXNPozi048Bp988SWeUV9gUmZBK5vwzw/8rn
         bi6rT1772r1A2Q0CU0MH4h4iYYzzVEPpeOvE9DKcZzI0z+JPJf11PAv/mPO56KVl/3ku
         SYs1y4w11JiEIP2cit4MIveloH9NFn3eVaEsWpCludge66JX2bceZy60AO0dRIQ5Haad
         vV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772462272; x=1773067072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8sJlSZs5xrhC2dH3em7lfnyFktrvfkJs63IZ5CWmLzM=;
        b=stz3MhMoS83CSSuW7fePhbEPBnyETrHXkiFhr3FmlAO3/911Jq2jOKO1BVk+AqQ5vt
         nOh+epKpEVaxO95DOkWAA6n0Jy+dMfVHr0/3xtjjBOpCzczZFD5jKrMa+1iaDhGW5SZk
         USkvgNlwtDOGscO6QARap4ZDgziLANOhMiCQQpvXWUyOzLCA+mHr5fnoMiKPqQqljW2Y
         DFWwD3dOp88tSGvGSIE8ORFkys6QyH8UrFks3NsHnpnJyKlUy/PYQ2QnPHWsTtfM7wa5
         H6Wl4Bk1FbN8UcJfM331BCjfMMuevEiGdLrJ3g/fD4tFAwLc1WRvx4+ZP2GltsKevQ+S
         N76Q==
X-Forwarded-Encrypted: i=1; AJvYcCVO5TfFMJyGq/MFBk6/S6s7wc+8nlswWz35FR/l7Qsi4vWIp4kzrgA6k9770v0YXkCdooRe8qp3ObM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0d8IcpX3YDW9QAixQQ9Q+rrQC7/hK0CrPY5W67tfL9iwavNk7
	uVnT3I72dYjnwsmuMIVIPm1DlgBVRtPAtG/3/ZOA5tpTCaViwVMNtIKuyPFCELVLxsihKtPJcCt
	MwcKxKnURyeazKPhsf/Hr1XjkbhArMHyLLHYoBJFA8ZkeDWFDNsAkqR7+7Kg/hfMyYB+tgA==
X-Gm-Gg: ATEYQzxwYJedk2qi5gQz3SrEReF4JSF5YSiSKk4R73PMVXoptMr8/RHGvD/tfccTgXf
	E/ZwWhVFAHBctIJ5AModgNbd2K+fK7taI88tTMPjic9rElhKKoFmQYWZLkmhq0lw1c0N3We3/a5
	heLsRlpRB6ovr1r5wz5S0Cmp8EQG70fzproZS1oxWvxfcyR9Xi0aXdVhauGtLr43RRode2Ls56O
	Nh7pXTDYgXZf9UEV8Ms8iozImpbFa1bAGMX8EnrKcwGQ31n6J02fzhJNsLWc7go/dBYffRJs8LQ
	xyicD4haAb6PXPqPcVQxghn+NTB9IDKKQ9RpyA6OivTGeYPZVYzq7sl0DiJRXLAss1oCyz4eJ32
	4YiqBYPsbhMKR7mHxtb6S609yXcue/Fm3AzQZfXR1gjI+Pbv9jiY=
X-Received: by 2002:a05:600c:3486:b0:480:3a72:524a with SMTP id 5b1f17b1804b1-483c9bed89emr249011815e9.19.1772462271938;
        Mon, 02 Mar 2026 06:37:51 -0800 (PST)
X-Received: by 2002:a05:600c:3486:b0:480:3a72:524a with SMTP id 5b1f17b1804b1-483c9bed89emr249011255e9.19.1772462271471;
        Mon, 02 Mar 2026 06:37:51 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.73.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e6c9sm361018285e9.8.2026.03.02.06.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 06:37:50 -0800 (PST)
Date: Mon, 2 Mar 2026 15:37:48 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
	Nam Cao <namcao@linutronix.de>, Juri Lelli <jlelli@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Tomas Glozar <tglozar@redhat.com>,
	Clark Williams <williams@redhat.com>,
	John Kacur <jkacur@redhat.com>
Subject: Re: [PATCH v6 15/16] rv: Add deadline monitors
Message-ID: <aaWgvBXaNg48qYRl@jlelli-thinkpadt14gen4.remote.csb>
References: <20260225095122.80683-1-gmonaco@redhat.com>
 <20260225095122.80683-16-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225095122.80683-16-gmonaco@redhat.com>

Hello,

On 25/02/26 10:51, Gabriele Monaco wrote:
> Add the deadline monitors collection to validate the deadline scheduler,
> both for deadline tasks and servers.
> 
> The currently implemented monitors are:
> * throttle:
>     validate dl entities are throttled when they use up their runtime
> * nomiss:
>     validate dl entities run to completion before their deadiline
> 
> Cc: Peter Zijlstra <peterz@infradead.org>
> Reviewed-by: Nam Cao <namcao@linutronix.de>
> Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
> ---

...

> +static inline int extract_params(struct pt_regs *regs, long id, struct task_struct **p)
> +{
> +	size_t size = offsetof(struct sched_attr, sched_nice);
> +	struct sched_attr __user *uattr, attr;
> +	int new_policy = -1, ret;
> +	unsigned long args[6];
> +	pid_t pid;
> +
> +	switch (id) {
> +	case __NR_sched_setscheduler:
> +		syscall_get_arguments(current, regs, args);
> +		pid = args[0];
> +		new_policy = args[1];
> +		break;
> +	case __NR_sched_setattr:
> +		syscall_get_arguments(current, regs, args);
> +		pid = args[0];
> +		uattr = (void *)args[1];
> +		/*
> +		 * Just copy up to sched_flags, we are not interested after that
> +		 */
> +		ret = copy_struct_from_user(&attr, size, uattr, size);
> +		if (ret)
> +			return ret;
> +		if (attr.sched_flags & SCHED_FLAG_KEEP_POLICY)
> +			return -EINVAL;
> +		new_policy = attr.sched_policy;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	if (!pid)
> +		*p = current;
> +	else {
> +		/*
> +		 * Required for find_task_by_vpid, make sure the caller doesn't
> +		 * need to get_task_struct().
> +		 */
> +		guard(rcu)();
> +		*p = find_task_by_vpid(pid);
> +		if (unlikely(!*p))
> +			return -EINVAL;
> +	}

Not sure I get this comment. RCU is released when the function returns,
but then the task pointer is dereferenced by callers?

Thanks,
Juri

