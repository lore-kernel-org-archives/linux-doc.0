Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156AB1A9FB6
	for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 16:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754930135; cv=none; b=gD+PEgLZbguXhaEduxjuNkGS3qrFPSAU3A2pUpsY7HO8DbSOqMlFtzJL3iwf4YAzrXgyLGpk3+r4XSxTFwkgwC/W6Ie92fBh7S7RcbiJ0kFZClkzrXe7QjraZVCHDRmC0/PPOMLqNAWN+6rxRD/VIaD5tGqZg8tqF3mthtBS7FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754930135; c=relaxed/simple;
	bh=z9v1AIbKTQe7fSyT3cnvCa2jZB8QliVNY9+fFmmW7eQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=R0HI03pUUGmfuzsCW/7iNcq7Pe59n8Zm9e79pT6bXFkL8YvZX7FLILPJ/qx+/NKQ0Vz4dlm4p2Tp4FHz2Dx/qi0vrSCbQrOUwMeTATNYyOHZUKSbAXFp9jrXnLX6DsYuidXHsO2boO5YVRdjmHqu7pSfjTgrL1LUcQYl+RvpavI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cRU9dqwD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cRU9dqwD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754930133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w0QKG6wBAV1bkVMISWx2XgFahcH/Eaz6cooDhL34CFg=;
	b=cRU9dqwDPx4SjFPkGIleJtxDWZTAgFm5YRAMu4FdJLUrhX2v1Iu86+UKM4u8oXXDQdz+CN
	Aw/dPzC546IURVpjU5Bm6ApVsjCBObuWwXF6dIMoi5MFeeMBqA5Q5zeSKOYEkB0BrdKcWE
	icrkItx3jAHGhH4CBHYZXR+XHjNg+tY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-578-sJe6CNw4Nl-k4flKg5LhhA-1; Mon, 11 Aug 2025 12:35:31 -0400
X-MC-Unique: sJe6CNw4Nl-k4flKg5LhhA-1
X-Mimecast-MFC-AGG-ID: sJe6CNw4Nl-k4flKg5LhhA_1754930130
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3b780da0ab6so2316745f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 09:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754930130; x=1755534930;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w0QKG6wBAV1bkVMISWx2XgFahcH/Eaz6cooDhL34CFg=;
        b=MQDaiMPG2IwL8gSL0Hp/zPajeLbQ/bVRrOhiKAFmkvn0nZ5fhFctv7JIT2iQ7VF/ra
         L+abSzQzalz5B/SlXhoUIaHzfhnYzWzNj64VDNqpCdl2euvJ9O39rSLyw9WYnDv+AKHr
         IdPssOK5fXwDebqqDnTmu8U4OpUuv52KljPGYF3IqLNj8PnWcPadsLW9nqLuJaNEcRTv
         0XfQ3nRV4aS/NpMKDcVD2UBFGqbUVYiuA7E0YkVPjfiDEYdzgiiZfQY73lB9wKmR4pgK
         7tOVgddVITYXK71PNp658z5N6wUN138kQyhrlte9UeOjObXGRUH/qiELPx4aYQZ1/BUi
         4dYw==
X-Forwarded-Encrypted: i=1; AJvYcCUwJD0tculMSJn63NG3e5PS8I4kBbC/R1H3R+QMADHR+of7lhVqtJz3s4xDSMbwARjUoZPJ/jKFrUI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeEFg4yk/sFusvsQzvFf+yC+vQ7I44x8H0yLogsVYNIgfW7O52
	Wma3atD3AGv7aVpOl2Z0jva8S8LgPUQ0rf4ZqdFzGxz2NWSjUqLJBWZ/B3ijm1t2QBI4JEaIibj
	etvHFPgZA/xYokwAI8tjFHuD4rdaLaDuKwhOM2GeQLtbWWFS7FxvzOiXsZ49767gXfpDE9O50q9
	Ecyh+9Sv1YVzOH7vteS8aygDBSHdzEtk7+GXARbiBG1Cyo0g==
X-Gm-Gg: ASbGnctjBJijxAD2S65CAcTd02EJVldUTYeq0AmyFSLWFsMgipxt3vn70OHD4KmXGIK
	0zcKOOd6QiKYpbgTSqYLUvesfUNlcHnvvelCLkINMj22Ty3ia65xMxF1WJwYBCcTBQuy/4MLcRt
	2wXyFH0noM3tnGtaP0I9mc8WQ2Q+O/rL/tjUgSHL2PlqQgUzG+Tf00llEPguVR6Ah+pfRex7ilD
	7uQ7k8TncwX7xQUgVq4tVn0IkaYVKGhk5qBy9Mx/Z62zTFkwnarSyqpOej0bqNt2iCJJGgK9bD0
	Vwdi0KhoHG/h+IvHf1jmjWiCFa/IrH5tsbnaRCNjJzlh0jwXYWRmyABtpBBsDO2D8S3icKLUDKC
	bPM4XLwykfC1Vo8LcvfjRLIsb
X-Received: by 2002:a05:6000:4305:b0:3a6:c923:bc5f with SMTP id ffacd0b85a97d-3b910fd9fefmr319706f8f.17.1754930129575;
        Mon, 11 Aug 2025 09:35:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYcvsRE2HaDC7ziZhryNH9YA7n2OJOaJVhOuz86thiRjeyohANnUt1UvvZFEtz0r2qQXvOAQ==
X-Received: by 2002:a05:6000:4305:b0:3a6:c923:bc5f with SMTP id ffacd0b85a97d-3b910fd9fefmr319661f8f.17.1754930128886;
        Mon, 11 Aug 2025 09:35:28 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3c4beasm40068633f8f.30.2025.08.11.09.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 09:35:28 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>, LKML
 <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Gabriele Monaco <gmonaco@redhat.com>, Ingo
 Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Marcelo
 Tosatti <mtosatti@redhat.com>, Marco Crivellari
 <marco.crivellari@suse.com>, Michal Hocko <mhocko@kernel.org>, "Paul E .
 McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Phil Auld <pauld@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, Thomas
 Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Waiman
 Long <longman@redhat.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc: Add CPU Isolation documentation
In-Reply-To: <20250809094247.8384-1-frederic@kernel.org>
References: <20250809094247.8384-1-frederic@kernel.org>
Date: Mon, 11 Aug 2025 18:35:26 +0200
Message-ID: <xhsmhldnpizox.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 09/08/25 11:42, Frederic Weisbecker wrote:
> nohz_full was introduced in v3.10 in 2013, which means this
> documentation is overdue for 12 years.
>

12 years is not that bad, it's not old enough to drink (legally) yet!

> The shoemaker's children always go barefoot. And working on timers
> hasn't made me arriving on time either.
>
> Fortunately Paul wrote a part of the needed documentation a while ago,
> especially concerning nohz_full in Documentation/timers/no_hz.rst and
> also about per-CPU kthreads in
> Documentation/admin-guide/kernel-per-CPU-kthreads.rst
>
> Introduce a new page that gives an overview of CPU isolation in general.
>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>  Documentation/admin-guide/cpu-isolation.rst | 338 ++++++++++++++++++++
>  Documentation/admin-guide/index.rst         |   1 +
>  2 files changed, 339 insertions(+)
>  create mode 100644 Documentation/admin-guide/cpu-isolation.rst
>
> diff --git a/Documentation/admin-guide/cpu-isolation.rst b/Documentation/admin-guide/cpu-isolation.rst
> new file mode 100644
> index 000000000000..250027acf7b2
> --- /dev/null
> +++ b/Documentation/admin-guide/cpu-isolation.rst
> @@ -0,0 +1,338 @@
> +=============
> +CPU Isolation
> +=============
> +
> +Introduction
> +============
> +
> +"CPU Isolation" means leaving a CPU exclusive to a given userspace
                                                            ^^^^^^^^^
Eh I'm being nitpicky, but this doesn't have to be userspace stuff right?
"someone" could e.g. affine some IRQ to an isolated CPU to have the
irqthread run undisturbed there, or somesuch.

> +
> +Scheduler domain isolation
> +--------------------------
> +
> +This feature isolates a CPU from the scheduler topology. As a result,
> +the target isn't part of the load balancing. Tasks won't migrate
> +neither from nor to it unless affine explicitly.
                                 ^^^^^^
s/affine/affined/

> +As a side effect the CPU is also isolated from unbound workqueues and
> +unbound kthreads.

> +Checklist
> +=========
> +
> +You have set up each of the above isolation features but you still
> +observe jitters that trash your workload? Make sure to check a few
> +elements before proceeding.
> +
> +Some of these checklist items are similar to those of real time
> +workloads:
> +
> +- Use mlock() to prevent your pages from being swapped away. Page
> +  faults are usually not compatible with jitter sensitive workloads.
> +
> +- Avoid SMT to prevent your hardware thread from being "preempted"
> +  by another one.
> +
> +- CPU frequency changes may induce subtle sorts of jitter in a
> +  workload. Cpufreq should be used and tuned with caution.
> +
> +- Deep C-states may result in latency issues upon wake-up. If this
> +  happens to be a problem, C-states can be limited via kernel boot
> +  parameters such as processor.max_cstate or intel_idle.max_cstate.
> +

Nitpickery again, I know it's not an exhaustive listing, but I'd rather
point to the sysfs cpuidle interface (or just mention it too), since that
means deep C-states can be left enabled for HK CPUs.


Should we also mention BIOS/firmware fuckery like SMIs?

"""
- Your system may be subject to firmware-originating interrupts - x86 has
  System Management Interrupts (SMIs) for example. Check your system BIOS
  to disable such interference, and with some luck your vendor will have
  a BIOS tuning guidance for low-latency operations.
"""

> +Debugging
> +=========
> +
> +Of course things are never so easy, especially on this matter.
> +Chances are that actual noise will be observed in the aforementioned
> +trace.7 file.
> +
> +The best way to investigate further is to enable finer grained
> +tracepoints such as those of subsystems producing asynchronous
> +events: workqueue, timer, irq_vector, etc... It also can be
> +interesting to enable the tick_stop event to diagnose why the tick is
> +retained when that happens.
> +

I'd also list the 'ipi_send*' family, although that's emitted from the HK
CPU, not the disturbed isolated CPU.

> +Some tools may also be useful for higher level analysis:
> +
> +- :ref:`Documentation/tools/rtla/rtla-osnoise.rst <rtla-osnoise>` runs a kernel
> +  tracer that analyzes and output a
> +  summary of the noises.
> +

I'd want to point to hwnoise and timerlat as well, so maybe point to
rtla.rst?

> +- dynticks-testing does something similar but in userspace. It is available
> +  at git://git.kernel.org/pub/scm/linux/kernel/git/frederic/dynticks-testing.git
> diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
> index 259d79fbeb94..b5f1fc7d5290 100644
> --- a/Documentation/admin-guide/index.rst
> +++ b/Documentation/admin-guide/index.rst
> @@ -94,6 +94,7 @@ likely to be of interest on almost any system.
>
>     cgroup-v2
>     cgroup-v1/index
> +   cpu-isolation
>     cpu-load
>     mm/index
>     module-signing
> --
> 2.50.1

