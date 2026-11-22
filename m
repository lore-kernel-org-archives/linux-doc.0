Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378869;
	b=mL3WM+SuioPmYRMYWHG94FWpx+Jbm3h2Fr4mARgFg9FP0c3ts25zQMT+4oi8JIllkPtl
	 ihJFXwCFnYalXN3FIBoFBfEgrR4+giTU6qIN3ow+rDa0lRMV1UjzTZBSxRds1AHmKHyFL
	 ooWGDZtHUQVKawPfCUF/jWkkjpNji95IsW1l7Cz+pEfOK7EtGoE/ywOHj+QQrAwkCmMRP
	 F8Lqx8MUFG6311FLdSGGC8n5fyFwNdOW7qA6wpzl1y7VkelRYunl9LJmsaDoD2w70cDOu
	 KKLH4vzORoqEt4ASLWvF4sQe3oIz3hwf8/KXg6DtpBgvySpcmGqS40SkKti9+NqhRog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=KoXhXnM3oUjZYemCskQWf/r+E20vle0w0i0hVE/eaXs=;
	b=DkkQw5uJhhc8tTSUZRn1QKEcjmWwxOtwtyf2FVR3AYeJdmAN9sAQO1lpj/XKKiJA56Pz
	 jR03+n1kPddfJRDssjFOLUz14RsrKnssDqgbtNW1jPW9V3T30eOlSu4JT0dW/xMW2/zpx
	 A9FHSOZNeWEnKn4nSFNX2qiWHaXi7wtwr0a3jnyKXSi68i3WCCytUrfTLIl0/U+MIOOqU
	 4meCb61kXtnRlYaiyxS0duBQXVkixgvyQOfkzopb95vH1OEh9b9cAM0trrVevXGAKtT5p
	 tPvozPR1EPztd815hmMNZ6UTR1mz8zn02xBoiTlZIZ0+tC3SkirjCycysSILsajeicw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Aiko/QHp";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF11C606A31A
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 20:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF11C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aiko/QHp
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso2022877f8f.0
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 12:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378867; x=1795983667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KoXhXnM3oUjZYemCskQWf/r+E20vle0w0i0hVE/eaXs=;
        b=Aiko/QHpxS4m+8HRxXBSv5+ixx06RuTCPhMu4FgAhsd94YdYr+nyapSE+UdjBEyQDX
         aFhMRUB6psPuLOJcrI6+rwr7lOWuSVpFW3qDdkr/dzfmJ9imzuedEJ398ConmVuXFwVA
         Z6WsFP2ooogDcTrARJ6/mGNpR746L/52C2OD8qmO7H8dW1fbp8oV6AdSmVXV3BYsomDU
         vad0Lv8VSl9s6j1c8CLaJFyW7TC55nAIzu4wZphZhEsFL4YkzOh3EWywDQ1NaJUuIGEm
         68MFJujoTgXIXv3zPKYfyqdgLaE+WnSn+G0+s2qnVFHHt92q34NMz3/nLB86jorPq5LC
         32VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378867; x=1795983667;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KoXhXnM3oUjZYemCskQWf/r+E20vle0w0i0hVE/eaXs=;
        b=VNaKrFlMwTReycUPA1+kKDuYv9VktrNjGgC3fcrAFZtfDZJ26aqvVVrGbSVCzFJKdu
         olyE3OoxDHXZFa4lIna8WEQyJZM0TTtNFl/cinOU648l+SQju3Sg6pzGMa2dsQZjYUSn
         T8y1B1+hoerulneYrjz+LxU7P6NYEt9+mIf1Zyd5vvzzBdwhGTVgK2W1kzPwQ6PDJg5X
         572WaTv4viXUJ4DRONAkDk2R/lPxtGKQWJE0re+4t97SMpaMEM4jbSNZypHmw5li2H6w
         WfEhvSHby2rZK+Lgm34LxnGqhEUmCmyQEL64+UFCljLGrN9iXUEpRN5+qwuUagxA92/H
         wLow==
X-Forwarded-Encrypted: i=1; AL+hErFCo8BEhPeBDz0zt/JagRNrqYrJwdmOqKrEU1rjj+foLPCrpaoDYHXvobaIU5rT0fKGKXcBSIWCqSI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UBkKE7INqQg/osAcfI4SOb+SgNlH+q6QHz4jlQ914piSpjD81
	dH2lGhju3mOW5Pht8y7AQG/XARIjssG0hwLaN93a/mOpvkSYXQ4GC9o+
X-Gm-Gg: AZFdTZcbgmlH1Krx3TMu1ST274SKEHLZswqjbkCIRo8f28A5W8Plrz6vuHQoZzgNgo6
	utvqgrGP+YyIn10SPoA3pP68hKnKVhpgCKp0AuqgfQ8jhSBE1Cf+s4saXv0r1CZHUhdotAhGRjd
	JvzZQBsOWTnyHlAo5a+xnWkfNtOjoDUiNouvZmW+BCB4ML4Yq+3v4jwr2p0W2HqsTBa2KNdV9pj
	yMSZQjVfmw/nhfEZDnX0tSKZMIEEqQP/9GjxroRlGWh2QaWNiT/SLpPWsTEh1E1J1GXXNn4kKa2
	T3ETgCDHS9Gq/WlUcMEFJpxDZQ2BZN3VZmLm8iO79Vb3scktAwYo2aek6aSlONcm2GaRIaDEzpi
	wHOdWe+CfW8jHxhOY0sScDTJ/tvvn18b8W6bNyEuy0vovEWhByXD3H5GwIsGw9tlkrbgmN8WMkb
	yuoWiOGtGDCXf284sPELSIFYWosKq051FOMjvO+88IwXgCYKrA2/9DoG1JIOe50oghBugNexcIT
	jAmg5nw4Em3neSrwPDnXnNWAoo/LDsO3eYhHLVMQwFpQlyIUKfHdZdDiI3oHxM4m2tuGzxXRZCc
	s4eybd4b+LjRDOcRKT5U/GOp9ptPruMoVRiDSJdMOhvRogjH2Qd9eOuc4DtxdFG4jsThCGUvJL2
	LAfgRk/NO/h7l2g6zYcROpLTRQlam2+CNnWitZEd7g5F7YqHaE/tFI65fKDwFceEUG0VoK8GnYG
	gsiIe7i7D1oyCKoLgPJtODku0qnff4Jw==
X-Received: by 2002:a05:600c:4f07:b0:4bb:5dbf:af06 with SMTP id 5b1f17b1804b1-4bb88804d58mr235773315e9.9.1795378867083;
        Sun, 22 Nov 2026 12:21:07 -0800 (PST)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a14a-2801-2d6d-9df0-1f3c-62cb.310.pool.telefonica.de. [2a02:3100:a14a:2801:2d6d:9df0:1f3c:62cb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm381533945e9.0.2026.11.22.12.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:21:06 -0800 (PST)
Date: Sun, 22 Nov 2026 21:21:03 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Thomas Gleixner <tglx@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Wen Yang <wen.yang@linux.dev>, 
	linux-trace-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 9/9] rv: Test IRQ-exit softirq provenance and
 handoff
Message-ID: <awNNrVvXCFVPhgk_@gmail.com>
References: <20261107171252.25090-1-kmehltretter@gmail.com>
 <20261107171252.25090-10-kmehltretter@gmail.com>
 <e8b9a9afb9587ed1f41c0fafd486ec9be82928db.camel@redhat.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8b9a9afb9587ed1f41c0fafd486ec9be82928db.camel@redhat.com>

On Sat, Nov 21, 2026 at 03:01:13PM +0100, Gabriele Monaco wrote:
> On Sat, 2026-11-07 at 18:12 +0100, Karl Mehltretter wrote:
> > On PREEMPT_RT, verify that worker events do not report hardirq provenance.
> > Do not run the synthetic inline IRQ-exit cases there. IRQ exit defers
> > softirqs to workers, and serving-softirq state is task-local rather than
> > encoded solely in preempt_count().
> > 
> > Snapshot reaction counts inside synthetic IRQ-disabled and hardirq
> > intervals, then evaluate the KUnit expectations after restoring normal task
> > context.
> > 
> > Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> 
> I still couldn't read the KUnit tests, but from what I get quickly scanning
> these, it's massive. A total of almost 3k lines of KUnit tests for 2 simple
> models is probably a bit much.

Agreed. I'll cut the KUnit tests down to a much smaller set focused on
the monitor transitions.

> 
> Keep in mind you are testing your unit, which is an RV monitor, so you may want
> to stress transitions, mess around with the environment as little as you can
> (e.g. disable interrupts) and use mocks/stubs where you can. It isn't always
> easy, but the fact you're touching softirq.c doesn't look right. Your
> unit isn't the softirq machinery, you should interact with it as least as
> possible.

Makes sense. I'll drop the test hooks from softirq.c and simulate the
events instead.

I'll address your comments on the other patches as well.

Thanks,  
Karl
