Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B75C47772
	for <linux-doc@vger.kernel.org>; Thu, 22 Feb 2024 11:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708602620; cv=none; b=dxXdiHq1gtTyrhUAjy9W4mmbwnf3SklCHSYk/G+SSZdiW4Nk9bgoLA42eVXA4IKEn41td1JBcDA+my/zbehpu4GaIAHq6IdyphPPgrFH0rNSt6zYGkmRWXLUBvPuM6rqESeJXI++mcopYXNJ7tY79sCwbYpwRtTsCJR4l/xuYSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708602620; c=relaxed/simple;
	bh=ma9DfQIGiAa5vr3ks75PfINXo2TPrC0w7A/88yi8pA8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VmJZJTnW6kkpzpuRhVpEqDaS2EMygcF5SvOkR5ZdQzegPV2avFddb3oJ33WHQYGgdyKLhmjOUNIEJ9MH0Gu+5lmNCvNpsDZ6USyC12nmw2ZYpui+nBgdQNmQBIfgIxiCC+CRZ3I6+kN29DhlJ+eQZiwQQqZTDxvrNP/354N8R84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hrt90nRk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hrt90nRk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708602616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ldC5iLR/TjfHxpr5I8kE+2L9PTCMZ2jj1k9txMQpdfM=;
	b=hrt90nRkXMJU2uhYGsRzxnbsCelUZhBL4PN8IwevKm0NbP7Dib1ZvrtIOQrGSkMPXybDe+
	mDT3K+vh28yJQXmdVX4W8actnjQxW+HWNXk3R0xchuFs7Fmts3hm6C8++fye9+EycOC306
	OfbHZw3xLHYlgiQbxoTZAElFOTtEQT4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-oJxpjKkzOoeGzBvuV0WmVw-1; Thu, 22 Feb 2024 06:50:15 -0500
X-MC-Unique: oJxpjKkzOoeGzBvuV0WmVw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a3f56a2936eso84707866b.1
        for <linux-doc@vger.kernel.org>; Thu, 22 Feb 2024 03:50:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708602614; x=1709207414;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ldC5iLR/TjfHxpr5I8kE+2L9PTCMZ2jj1k9txMQpdfM=;
        b=NlUsjqY/rQYnowLzQodv99H1uTOkx1pwF0/hbDqJatwwrw3qA3pZYoTE5AuTank/OL
         1PsOcYlC4v0B2ZM60iMCLKh2UQDv71CVUmxZ89Q1nJlMevCYTBP3PAZJbXiw8KSzeqxG
         4ncDwvi84p3ENu7doURm8GQD6imkxBoamRkGx0uQYnrjHQeL05wrxdfiSOybBbhRn+y8
         AV/KZOMeoAOZdFz47k+AkfH66eKG3KdfENW/QVLDusszb7Y4NnLNXRTjj8rv10ySN/gx
         GVQncY9zXW49x5X/msQgQFlzAxWvsoJ6Wi+yEWsmqVUUs5Jepk96+s8wcyogf525HZwt
         NjwA==
X-Forwarded-Encrypted: i=1; AJvYcCVDofdo62y0Hyait1LuCJvz4AyVUHBDINDcd8eBGIwaQ7waFDqgjyMYPXc/5wOenVi4DVndFqaZhrsrzJL/DBh30LItfssS13K+
X-Gm-Message-State: AOJu0Yw47lUG3zQUFfU8ZyckW/Ev5lKCxNeXs4fEkqqDz8TnM7d0qgKX
	0Ee31n47Orjqz0N/6UigFhl90lDG7IdGyFboT/LyP7pnn2EgUWOla1XbPs7KQBgdFMdcdcpgR1f
	h7q0wTvLCYLNWGLjBI2Cvo479gSris/efI490OsfP7qR9bty5nIsURzUK/Q==
X-Received: by 2002:a17:906:393:b0:a3f:4ca8:f93e with SMTP id b19-20020a170906039300b00a3f4ca8f93emr2003776eja.24.1708602614204;
        Thu, 22 Feb 2024 03:50:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFqkM/gRLrevRcPSWpe7we5hg0Pbu6lFDxiRpmiSyGCXmYKdK+uwM9zZOtenBwAxZkzrXVHw==
X-Received: by 2002:a17:906:393:b0:a3f:4ca8:f93e with SMTP id b19-20020a170906039300b00a3f4ca8f93emr2003757eja.24.1708602613833;
        Thu, 22 Feb 2024 03:50:13 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id h10-20020a170906398a00b00a3f99497456sm259912eje.90.2024.02.22.03.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 03:50:13 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 63345112DEFE; Thu, 22 Feb 2024 12:50:12 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Benjamin Tissoires <bentiss@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, John Fastabend
 <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, Martin
 KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [PATCH RFC bpf-next v3 04/16] bpf/helpers: introduce sleepable
 bpf_timers
In-Reply-To: <20240221-hid-bpf-sleepable-v3-4-1fb378ca6301@kernel.org>
References: <20240221-hid-bpf-sleepable-v3-0-1fb378ca6301@kernel.org>
 <20240221-hid-bpf-sleepable-v3-4-1fb378ca6301@kernel.org>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Thu, 22 Feb 2024 12:50:12 +0100
Message-ID: <87le7chg5n.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Benjamin Tissoires <bentiss@kernel.org> writes:

> @@ -1245,6 +1294,7 @@ BPF_CALL_3(bpf_timer_set_callback, struct bpf_timer_kern *, timer, void *, callb
>  		ret = -EPERM;
>  		goto out;
>  	}
> +	down(&t->sleepable_lock);
>  	prev = t->prog;
>  	if (prev != prog) {
>  		/* Bump prog refcnt once. Every bpf_timer_set_callback()
> @@ -1261,6 +1311,7 @@ BPF_CALL_3(bpf_timer_set_callback, struct bpf_timer_kern *, timer, void *, callb
>  		t->prog = prog;
>  	}
>  	rcu_assign_pointer(t->callback_fn, callback_fn);
> +	up(&t->sleepable_lock);
>  out:
>  	__bpf_spin_unlock_irqrestore(&timer->lock);
>  	return ret;
> @@ -1282,7 +1333,7 @@ BPF_CALL_3(bpf_timer_start, struct bpf_timer_kern *, timer, u64, nsecs, u64, fla
>  
>  	if (in_nmi())
>  		return -EOPNOTSUPP;
> -	if (flags & ~(BPF_F_TIMER_ABS | BPF_F_TIMER_CPU_PIN))
> +	if (flags & ~(BPF_F_TIMER_ABS | BPF_F_TIMER_CPU_PIN | BPF_F_TIMER_SLEEPABLE))
>  		return -EINVAL;
>  	__bpf_spin_lock_irqsave(&timer->lock);
>  	t = timer->timer;
> @@ -1299,7 +1350,10 @@ BPF_CALL_3(bpf_timer_start, struct bpf_timer_kern *, timer, u64, nsecs, u64, fla
>  	if (flags & BPF_F_TIMER_CPU_PIN)
>  		mode |= HRTIMER_MODE_PINNED;
>  
> -	hrtimer_start(&t->timer, ns_to_ktime(nsecs), mode);
> +	if (flags & BPF_F_TIMER_SLEEPABLE)
> +		schedule_work(&t->work);
> +	else
> +		hrtimer_start(&t->timer, ns_to_ktime(nsecs), mode);
>  out:
>  	__bpf_spin_unlock_irqrestore(&timer->lock);
>  	return ret;

I think it's a little weird to just ignore the timeout parameter when
called with the sleepable flag. But I guess it can work at least as a
first pass; however, in that case we should enforce that the caller
passes in a timeout of 0, so that if we do add support for a timeout for
sleepable timers in the future, callers will be able to detect this.

-Toke

