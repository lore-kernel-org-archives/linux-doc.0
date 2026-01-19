Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2D23590CE
	for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 11:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768820687; cv=none; b=TuYPs2XtFB3+P2ykmd40Vc9PYOczCrOz6En6ZksUysO1JJt4XxSHzcaqjW58TJm5e1RnwAajJsrtAft1XxZ0FxqF0Sk0dN975YB4E3szijtHCQ1dAsc3+ipZwuXuLghaOYCHlYDrmIT6O6F16AeK8hYp3DyR9IY6ADp8BevT81Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768820687; c=relaxed/simple;
	bh=/muiXxKbxDRdO0MB+mCm4SfaD5B3F+0ImKkl0B9gKiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYVFyT23pUHQ39oOLi+6EuYTrpcTSgzb6FDarxL/Bov0adlTOZp9pp/xBU3H8mxkqiXrJ3xke3xEJkXVJQf1H+MkFlm+NKRXc1aEAoPaHJ/aF83RPec6oVKveh4ZCv/o8oLrGx/J8Qo1NeJ0RYfkKFqzNdl7vXsPCrl8pmqkysg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IUWqQC0C; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nSyY1rrM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IUWqQC0C";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nSyY1rrM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768820675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hNfGrzoWgmkgHbgWpkrQnRoddNG6uHNGHcsuvEPWnR4=;
	b=IUWqQC0CI4DWj/FbZf+8lBDAWwZzwRD/1uvRMC/t7kNlUOmunzGEgFePVLfJSZ8wY5lClI
	fu60WM4Zx9LXqstwGoP3GYbwIU9EvnJN8DsLIKQkCyfJHvEVzK3qKC8qoanQyj5gLDNJ3f
	/0nTlsPalBRWZQUfLiCpAlUiVEzxv9s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-rleLTbH1Nue8KFyn9OyQrw-1; Mon, 19 Jan 2026 06:04:34 -0500
X-MC-Unique: rleLTbH1Nue8KFyn9OyQrw-1
X-Mimecast-MFC-AGG-ID: rleLTbH1Nue8KFyn9OyQrw_1768820673
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-430f8866932so3545069f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 03:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768820673; x=1769425473; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hNfGrzoWgmkgHbgWpkrQnRoddNG6uHNGHcsuvEPWnR4=;
        b=nSyY1rrMvzEgw5q5ekPkpYf+X7bEsGR2ZnMi3a1KsILuFhjGJyOKSEzUYU6lmU+oCD
         ao9N0vEHTBgp+qJIEYl6Z2JA7ejBbZKiqBO90y42uS4b11Vjm8BhoPf+bHY9qS/PuoK0
         4ndt3DkZR116lRCo8ZANW0zTtGJxvDjgaa9rajLS5IXSHr3LONPGb/FLzFvER1wzo4ye
         SbkklVlkkz/L9JbjvHCPgXyzp8TYtdDcUQAujbI3YXVeSJkk7HgZek3PulxwnoNsHH9L
         U2amH4MxoZUzf3VbaXaM5aiSPasIHYYTABShZAw9czJ2WN7R+1KIir859nNBaWFK2hS6
         hA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768820673; x=1769425473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hNfGrzoWgmkgHbgWpkrQnRoddNG6uHNGHcsuvEPWnR4=;
        b=rsyLNeryghCDRLZHynFhQzxdry9Zoj+z7IzVl4Bi0PlCqxXMdfrwbhnuVSu9XPvVfQ
         BQfseDR1rh2golk12Ep1w/W+16g8Kja5KiCmw0YQV1zWmenEi5e/DP4EwYKOJ2BN91Xk
         yLZ/NXaESSZJi2JLCvxxG4il+FhMGhLRNwOO04FS03TS0cZfvvCmpnXgZ77ppBrju3QE
         hZIDuofXiRbV8R20M/4aSm8i0+fzhbjUqzejO0OK5eRzBnT+kPgFuQdSQH4LQR0P1BjP
         8/CWhvEZst53a4jY4uhXZFafPNc3C2X72GWCR/93ujIzBHZuWonYAjyvBlpKJTVvwEEU
         qLeA==
X-Forwarded-Encrypted: i=1; AJvYcCXJIuAXHQ5DWq4c6EXWzBPq79K1Pyl4S2UaFAcdnO0JY+TAIkUSDgQO8t79eMajuaQ5KgRevwlfgbw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK045Gt3A9VwEKwhJGoJoSPGuWaK3NUDo/1IO0K+tSrL8kZ4JP
	nD7VJyrPg/5i2wi1blEYtNTSw3fKAXv6ppU6ZXRXYvx2lYIfubP1C0Hk/kVaQHxpyidWifZ1xpB
	ECww3Z5pSKdGkVf8zd3Rgh0AocyktrLTseDrPeMWldPBK8wBn49XN8W2pRxRZww==
X-Gm-Gg: AZuq6aLfvXVcF7TQusTQYS1DA/oM1s1WKsTXMMZK+G0dv/rxivmo6ySQbdQWuFkUekn
	Dabl8Cd+5TtQH8LjSPYrNMarKVH7TrE3l9C2DubcJdCRYo579YI9njJc/lJk8c4CN0EaQfVQ8s4
	LbdAerrv/FrXanWN0N0zaAT0e1mzWeWgZy1pnChwWsfokPWGNk6fDz52b46OdHD03TQJNZJWVtP
	/epJVQLcEL3J6/jiEmqFQPnk4TVm9r0PVx5hosv5eJP9gWSnw8zQXHrH+zZx4r9TUDiwkK0Wvkp
	DwybiA7RhpTIBn4oDS646kazf8MFq6Kb32y/ljw6E8TiwjeWDJpHvG+FZTklFLP32YpHjA2pOyf
	Ov0A0mzmeBvW+w6bwgeO89TqCiHmsGazTwgVUri4E
X-Received: by 2002:a05:6000:1843:b0:431:864:d492 with SMTP id ffacd0b85a97d-43569bbaf7dmr13975628f8f.36.1768820672840;
        Mon, 19 Jan 2026 03:04:32 -0800 (PST)
X-Received: by 2002:a05:6000:1843:b0:431:864:d492 with SMTP id ffacd0b85a97d-43569bbaf7dmr13975591f8f.36.1768820672434;
        Mon, 19 Jan 2026 03:04:32 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.129.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996cf33sm23073587f8f.25.2026.01.19.03.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 03:04:31 -0800 (PST)
Date: Mon, 19 Jan 2026 12:04:29 +0100
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
Subject: Re: [PATCH v4 14/15] rv: Add deadline monitors
Message-ID: <aW4PvcDxBJnDLJFq@jlelli-thinkpadt14gen4.remote.csb>
References: <20260116123911.130300-1-gmonaco@redhat.com>
 <20260116123911.130300-15-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116123911.130300-15-gmonaco@redhat.com>

Hello,

On 16/01/26 13:39, Gabriele Monaco wrote:
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

> +/*
> + * User configurable deadline threshold. If the total utilisation of deadline
> + * tasks is larger than 1, they are only guaranteed bounded tardiness. See
> + * Documentation/scheduler/sched-deadline.rst for more details.
> + * The minimum tardiness without sched_feat(HRTICK_DL) is 1 tick to accommodate
> + * for throttle enforced on the next tick.
> + */
> +static u64 deadline_thresh = TICK_NSEC;
> +module_param(deadline_thresh, ullong, 0644);
> +#define DEADLINE_NS(ha_mon) (pi_of(ha_get_target(ha_mon))->dl_deadline + deadline_thresh)

...

> +static inline u64 runtime_left_ns(struct ha_monitor *ha_mon)
> +{
> +	return pi_of(ha_get_target(ha_mon))->runtime + RUNTIME_THRESH;
> +}

Why use pi_of() in above cases?

For the first, in case the macro is called while the task is actually
boosted, we then might continue to use that even after such task gets
deboosted?

For the second, current PI implementation (even if admittedly not ideal)
uses donor's static dl_runtime to replenish boosted task runtime, but
then accounting is performed again the task dynamic runtime, not the
donor's (this all will hopefully change soon with proxy exec..)?

Thanks,
Juri

