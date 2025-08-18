Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FF732BF2B
	for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 18:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755540407; cv=none; b=rySF8N8KW1Wg9yxIGStY2n4isO57tFPFvV7XTFjz0jSyE8K9Ic5s5aklRMrTyJERVDP4VCScCTaT716yMzQP/KQ2f4PF2PGozBWjF4OxkYmjgOKxXhwphC+dfr7fCsUv4YBxQUCHfnUCoydGg8jWGFwha+lFYi/bSIszcXLOmQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755540407; c=relaxed/simple;
	bh=lMTqoKlk7xLY3zTY3FQIhHuKUdbPnwdeP9KDNAfowxQ=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Rp8XbumPBk+mzsRkPCQEq8XjTybn49CMPmdlNGCO5NRrjECjPlu+zmwA5hXD+PQ/nNdCM9ZMkXdryPWb184aBL32dfc/6dCSVtF72McCKhfBtHkV24uKjXzDUqTBWDpFSzG/FxiZ0mCGGnFqazpobFI44CuDExzo96USp7D6OOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pt0duiDa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pt0duiDa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755540403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hVK3uDEkCghC3XgwhOYge6qWtR3Uke3YIdcaNnS7G9w=;
	b=Pt0duiDaVHoS5U3A6jmS5X2lZHVULguWngN8GLvvV2p3kzIYNSkB9xx3ZB0ic8iSEjOLXT
	PX6cbSnFVoHqMs5doIspLmiVr4Ps6PixyiGn7fo2JMfuWWCR/sRaKc9ZSGv+yfd/WHtbq0
	mwdv2LO1X+C5A+xwwWp8RHwEWkBnGhs=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-fUSZ4DsEM12syAdZ_IoshA-1; Mon, 18 Aug 2025 14:06:42 -0400
X-MC-Unique: fUSZ4DsEM12syAdZ_IoshA-1
X-Mimecast-MFC-AGG-ID: fUSZ4DsEM12syAdZ_IoshA_1755540402
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-71d604e54baso57879417b3.2
        for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 11:06:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755540401; x=1756145201;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hVK3uDEkCghC3XgwhOYge6qWtR3Uke3YIdcaNnS7G9w=;
        b=QU9LMJyetAr83rzsoTH4auoVxzOKEkZjZ6KQi/NzwHGaoyzvkc/p4k18NjePNmsK4v
         JA1bxa7iWCKxC0T7fmWkGvikvEcXBIkja435F+we1ZIIkzSSCvSFtByYTSomAYsq1mU+
         ZiP6E4FQ1mQTMZbVgfUTDpFoJJPyMNpl5UzoIKczEdvFhd6RJ5sNj3HxO9Se75gQ5dMo
         s3GElXiIe/eUnF7muwm7dNaT6uwciEdmWSmE4TNLshe0mnBIjxE+gGR2M5SllTms63Yq
         jZILy4THXGyRuKzq/gNGdRMS1z44xrD04EO1VNfGxbUEZbK8zBmmuDhAT9Q0QXktC65f
         yvaw==
X-Forwarded-Encrypted: i=1; AJvYcCVRA9t8OBunduHVE3j8qZ0Lo2xhxQy5krmjLp8X0Uefd9Xw9KiW1SVBr2jMbHLfgnqf4AFnu00ZPtE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoQ5hezk7nAFCuo+uhe/BQIi3Gk/ktzPBBPKdaH4Fl5VvSFpXM
	jLaRrv0YMxuqlYXkQ48tNCeRaHlUsgGKCHWceeBScOXqeIbfxUhzdPPveZk+fndAWczThF26VGt
	/yaTciP5qfvVUtJFuHwk/Oj/x4rhSR43IWu4CVCvObGc6ahJpweXsGED9N3C0HQ==
X-Gm-Gg: ASbGncuKetSsiX21alVjB2wnRFDNuhGTV4lOAFvjdAGWvmI28GqqnFeWXvdY2C44iQM
	kZJWI8wSoQzqDBK7Py+KL26bmORRiEAXSIgVsw3QXKhe+vd+eXKFcLC9OpIxneMl8/x91HGX1Q+
	Vw/K0wuR5O5OY3CM7Bvdw8trwGr0egPE1KO6RrX17k2JT+iog4RCzgvgAlIv864CourNnCEac2z
	/B3AAUI146mStXUt1KLf8db2hjfJUBO4BqOCGDQX4ZHBilMAlTChujEnqAwJf0S48ii6AXmtzjA
	Z9Uk0HVAlm5zj+hTwQcd/JdTOaaF2/rYT0iA0H7zqJsj3UVgosVRAE0TNRQHGJWDOtaCkU9+z06
	R8GXxDBrnmw==
X-Received: by 2002:a05:690c:6ac3:b0:71d:500b:d233 with SMTP id 00721157ae682-71e774ac6b0mr130376917b3.15.1755540401660;
        Mon, 18 Aug 2025 11:06:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZcm9I1hqrBEYRscTw5qICYVgLFE2dN4EwtkxH4owTrJSsthjzp+xz9xDEFbOj3GE+h1JnoQ==
X-Received: by 2002:a05:690c:6ac3:b0:71d:500b:d233 with SMTP id 00721157ae682-71e774ac6b0mr130376537b3.15.1755540401252;
        Mon, 18 Aug 2025 11:06:41 -0700 (PDT)
Received: from ?IPV6:2601:188:c180:4250:ecbe:130d:668d:951d? ([2601:188:c180:4250:ecbe:130d:668d:951d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71e6deb618dsm23430337b3.20.2025.08.18.11.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 11:06:40 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <db8defe4-14bf-4060-803f-e8b09a941d42@redhat.com>
Date: Mon, 18 Aug 2025 14:06:39 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] Documentation: locking: Add local_lock_nested_bh()
 to locktypes
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
Cc: Boqun Feng <boqun.feng@gmail.com>, Clark Williams <clrkwllms@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 John Ogness <john.ogness@linutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Valentin Schneider <vschneid@redhat.com>, Will Deacon <will@kernel.org>
References: <20250815093858.930751-1-bigeasy@linutronix.de>
 <20250815093858.930751-3-bigeasy@linutronix.de>
Content-Language: en-US
In-Reply-To: <20250815093858.930751-3-bigeasy@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/15/25 5:38 AM, Sebastian Andrzej Siewior wrote:
> local_lock_nested_bh() is used within networking where applicable.
> Document why it is used and how it behaves.
>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>   Documentation/locking/locktypes.rst | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/Documentation/locking/locktypes.rst b/Documentation/locking/locktypes.rst
> index 80c914f6eae7a..37b6a5670c2fa 100644
> --- a/Documentation/locking/locktypes.rst
> +++ b/Documentation/locking/locktypes.rst
> @@ -204,6 +204,27 @@ per-CPU data structures on a non PREEMPT_RT kernel.
>   local_lock is not suitable to protect against preemption or interrupts on a
>   PREEMPT_RT kernel due to the PREEMPT_RT specific spinlock_t semantics.
>   
> +CPU local scope and bottom-half
> +-------------------------------
> +
> +Per-CPU variables that are accessed only in softirq context should not rely on
> +the assumption that this context is implicitly protected due to being
> +non-preemptible. In a PREEMPT_RT kernel, softirq context is preemptible, and
> +synchronizing every bottom-half-disabled section via implicit context results
> +in an implicit per-CPU "big kernel lock."
> +
> +A local_lock_t together with local_lock_nested_bh() and
> +local_unlock_nested_bh() for locking operations help to identify the locking
> +scope.
> +
> +When lockdep is enabled, these functions verify that data structure access
> +occurs within softirq context.
> +Unlike local_lock(), local_unlock_nested_bh() does not disable preemption and
> +does not add overhead when used without lockdep.

Should it be local_lock_nested_bh()? It doesn't make sense to compare 
local_unlock_nested_bh() against local_lock(). In a PREEMPT_RT kernel, 
local_lock() disables migration but not preemption.

Cheers,
Longman

> +
> +On a PREEMPT_RT kernel, local_lock_t behaves as a real lock and
> +local_unlock_nested_bh() serializes access to the data structure, which allows
> +removal of serialization via local_bh_disable().
>   
>   raw_spinlock_t and spinlock_t
>   =============================

