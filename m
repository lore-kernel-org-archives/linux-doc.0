Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497706;
	b=zG+fP4W8GK1u/sb0EJkI4q5AOk3RF4PwgUeHyecXj5GHaYCFpL4ZIgu+klf22A9NByCp
	 yKKYTAKurZfmgKKSN5ctdin1zIHD6cKsp3fWQihQdwZDIO8M4xKd+v/5RVD1zdStr1Zqt
	 mv6u/lB1+zuITiirDDl0N8gzvITg50Q9BCAzQw31el3RI5L0nXZeBwPSLmEhxKVRmXzDn
	 ip8JDyIL7PUsvlP7PZxhJ5kGuQA4ghsVRV7l5VCwjIqNbwjQlXuV+cxYs8VTWFD/4biBb
	 xI0abHhOck15g+Ims/Ts8lQyHtd/srlaAJ1cu+WK6A3mV5dAuJNfvRKZ25+GuJvGD1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YoiKgrlu3jS2oBRKxPzmeURp2GOIi7ThEavPNJNThX0=;
	b=SMIehdGLVUa8CYIZpk6eAa1+1v5ymaJTpKLTsbx76PlkyZSZ7j+LfsZCs3OfHmqRzAVt
	 Hd8sGB56S4AsXaCM4KIM2AZpXudQRkERdY59kf9zXkx+gXteeD+OWWi71Qv5Y7FUf3+r0
	 a467agRoVniKeq5RGIbHHNuT/rAqYjToEFSXsMBiKz+puxJdKkBsJdHGjtdCVWliPobMa
	 b1WKJ4IEjALariNXi2P6wjNnPhSt9joHzmBkQJoIiEQoRPlgBRQpN99+wGp4+qaXZOz5I
	 34Di8uVzS2BhM7sDbNkq0Bi3Z7h/6yTRxMbecFkMP4Pp1RqDlJ564tWSnZVIbUm5q7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SQOsxBsX;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FF6606A31C
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 12:01:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7FF6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SQOsxBsX
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4395d31228so283173466b.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 05:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792497704; x=1793102504; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YoiKgrlu3jS2oBRKxPzmeURp2GOIi7ThEavPNJNThX0=;
        b=SQOsxBsXEbXiKPJrnySY4R5dDFZGHbbd7tQBYHKByjD5Qp77xHQ8nVJyJOhC5D+O3Z
         i7rrzT7JsvM/eWVn8EPuwfbjU3i9iX/FWfKiertquMaJ3mHTQZqAGQz0HH6t2zIQkR2n
         xli52Qpb8MUcY1dAvD/neD3t1kujEy+8OgIi0ATFH1sZFAR06HsxB4UsxUR/qOqx62TJ
         siNWEadl8OYvbrXH/U6q0M4iNLnsmC1X1hhDWSYQxM2TzgZTXBvI9DwHjx312x3aB0I0
         80WNmZL3/YPc4LCV1JlHhGg3VHGeabd+btAAQZP2ap9Ueb4M/9vKMZtp7De+piGJmDlz
         pGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792497704; x=1793102504;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YoiKgrlu3jS2oBRKxPzmeURp2GOIi7ThEavPNJNThX0=;
        b=1bl0G4RyoHUljQaEnLmkBFDBQVRpx5az0Lj8PoH3W5bOVNhUKcfbvfqq9K6MWcnogR
         nws6yI2w6upw56Ol+9N4T3pgwNcqO5Z2eCeH6EKYL9ffhMEfntFObGaN/ENcs9/rXObC
         ndMCz9Bwo+UkKElAr+64bIb4Wqg+h/c+GofjN7y6OabkEmQjh0Y+8O4j0cKfM5eA5ONl
         elVRTw2JSAquBs5dvM448ji24HbVKY8fGcvDUJahxC4kgU1wR7ZdkTzVR0yef3mLPJzJ
         pzyWlz55A8581isSecwtWv95yZ/M6wSgvjJifbnGNEhwC7Cz+O3R7gioli3oBuv3yz7U
         Ycxw==
X-Forwarded-Encrypted: i=1; AKwUvBztq/1iQp30gEV8hrcz7mfVl8usHFG9OA2gw1d1oOiki/NGZRa23zd9bhmv6al/mz4x/lstfxR5hJg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGIVwEExMg98vmo7reFiimDAGgkAP/ZO0aA/5NpS5Er2aQQLSS
	ArZU7g4lWWTuXNXFBEBY7fNtYubQ/efqZUldG1/GOHkvy8gD5dK/66g9NxLIPt8QjaI=
X-Gm-Gg: AYBFou0E+QKAj8MaEEykdFoa/nEu+3ujUOu17cJ+tZl0nGGyHa0qw/H7TeeqvZEr7kw
	SUX3nJJUiZvuQFkPhDZvEFEy4whBRXfd7uUSIpyhmaStO5fr+k/560XoF6d0csRfhTyjDdgbv2q
	FNQxbL5SJE4NhQsE2n6Xp/2oJS1jQ3n+CQtD1bhtPJv+hJ7B9lziZeSlhkxlZ6UyuJ9A2RyvnnX
	eENvUFF9P9HiUuaVJcgu0lDLx5eJ23wUKHw6wWaI0+1/hpWQ05zkYbE5qhcAzvdpyx/sgyDz1P8
	K637GUvfEr1FoguUhs4kCkbZznsGQmfe3SjFUFxid2JMP0sdMYB6TDTS6EdKMZMXomQNQeNNQMv
	rDICYa5+EjMuxTM8nYvpT5yoj2m/mZ8LOw9ug/eIowLOl0VEBoZs9L5ufWZn58UD/WX+BZy0rgU
	yEhE5tiuk3iZYwPzu+n3McIAOdCRfflatVaypMJchpRNTg4LHNeLBenwhmNbIdyJmOL+vZGTM4
X-Received: by 2002:a17:907:9347:b0:c29:63f2:99bb with SMTP id a640c23a62f3a-c41a10c2ddemr789464366b.47.1792497703502;
        Tue, 20 Oct 2026 05:01:43 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80fc6csm5503140f8f.14.2026.10.20.05.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:01:42 -0700 (PDT)
Date: Tue, 20 Oct 2026 14:01:39 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Zack Rusin <zack.rusin@broadcom.com>, Borislav Petkov <bp@alien8.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, x86@kernel.org,
	Joel Granados <joel.granados@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, virtualization@lists.linux.dev,
	Dave Young <ruirui.yang@linux.dev>,
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Pratyush Yadav <pratyush@kernel.org>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Ian Forbes <ian.forbes@broadcom.com>
Subject: Re: [PATCH v2 1/6] panic: Add a notifier chain for pre-kdump
 callbacks
Message-ID: <atdYIxwz8ksYNty6@pathway.suse.cz>
References: <cover.1790014793.git.zack.rusin@broadcom.com>
 <81cb85568b36273a8e66215b3e6d671b8488d402.1790014793.git.zack.rusin@broadcom.com>
 <bc783856-9480-3944-67fb-675e4c11d8c2@igalia.com>
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
In-Reply-To: <bc783856-9480-3944-67fb-675e4c11d8c2@igalia.com>

On Mon 2026-10-19 19:05:21, Guilherme G. Piccoli wrote:
> On 28/09/2026 14:55, Zack Rusin wrote:
> > Selected crash callbacks should not require running every panic notifier
> > before kdump. Add a separate atomic chain with an at-most-once dispatch
> > helper, and invoke it before panic reaches the kmsg dumpers.
> > 
> > The helper permits another call from the crash path without repeating
> > callbacks or recursing into them. Document that callbacks may run in NMI
> > context, with other CPUs running and the kexec lock held.
> > 
> > Link: https://lore.kernel.org/r/aquttpMVKX8e6zGB@pathway.suse.cz
> > Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> > ---
> > New in v2: separate pre-kdump chain, with a set-once dispatch guard.
> > 
> >  include/linux/panic_notifier.h |  3 +++
> >  kernel/panic.c                 | 26 ++++++++++++++++++++++++++
> >  2 files changed, 29 insertions(+)
> > 
> > diff --git a/include/linux/panic_notifier.h b/include/linux/panic_notifier.h
> > index 41e32483d7a7..3ad390764a41 100644
> > --- a/include/linux/panic_notifier.h
> > +++ b/include/linux/panic_notifier.h
> > @@ -6,6 +6,9 @@
> >  #include <linux/types.h>
> >  
> >  extern struct atomic_notifier_head panic_notifier_list;
> > +extern struct atomic_notifier_head panic_pre_kdump_list;
> > +
> > +void panic_notify_pre_kdump(char *msg);
> >  
> >  extern bool crash_kexec_post_notifiers;
> >  
> > diff --git a/kernel/panic.c b/kernel/panic.c
> > index 213725b612aa..d78e90abb192 100644
> > --- a/kernel/panic.c
> > +++ b/kernel/panic.c
> > @@ -82,6 +82,10 @@ ATOMIC_NOTIFIER_HEAD(panic_notifier_list);
> >  
> >  EXPORT_SYMBOL(panic_notifier_list);
> >  
> > +struct atomic_notifier_head panic_pre_kdump_list =
> > +	ATOMIC_NOTIFIER_INIT(panic_pre_kdump_list);
> > +EXPORT_SYMBOL_GPL(panic_pre_kdump_list);
> > +
> >  static void panic_print_deprecated(void)
> >  {
> >  	pr_info_once("Kernel: The 'panic_print' parameter is now deprecated. Please use 'panic_sys_info' and 'panic_console_replay' instead.\n");
> > @@ -567,6 +571,27 @@ static void panic_other_cpus_shutdown(bool crash_kexec)
> >  		crash_smp_send_stop();
> >  }
> >  
> > +/**
> > + * panic_notify_pre_kdump - invoke selected callbacks before kdump
> > + * @msg: Panic message, or NULL for direct crash-kexec entry
> > + *
> > + * Dispatch at most once per boot, including recursive entry. Callbacks run
> > + * with interrupts disabled, possibly in NMI context, before other CPUs have
> > + * necessarily stopped. The kexec lock may be held. They must not sleep,
> > + * allocate, wait for other CPUs, or call into kexec management operations.
> > + * The message is read-only and may only be used during the callback.
> > + */
> > +void panic_notify_pre_kdump(char *msg)
> > +{
> > +	static atomic_t started = ATOMIC_INIT(0);
> > +	unsigned long flags;
> > +
> > +	local_irq_save(flags);
> > +	if (!atomic_xchg(&started, 1))

It is far from clear why this is needed. It would deserve a comment in
the code and explanation in the commit message.

Well, I am not even sure whether this synchronization is enough.
If __crash_exec() and vpanic() are running in parallel on two CPUS
then one path will skip the notifiers but it will not wait until
they are finished.

But I think that the problem is the explicitly called __crash_exec()
is not synchronized against vpanic() in the first place. IMHO,
it is an existing problem which probably should get fixed.

> > +		atomic_notifier_call_chain(&panic_pre_kdump_list, 0, msg);
> > +	local_irq_restore(flags);
> > +}
> > +
> >  /**
> >   * vpanic - halt the system
> >   * @fmt: The text string to print
> > @@ -682,6 +707,7 @@ void vpanic(const char *fmt, va_list args)
> >  
> >  	sys_info(panic_print);
> >  
> > +	panic_notify_pre_kdump(buf);
> >  	kmsg_dump_desc(KMSG_DUMP_PANIC, buf);
> >  
> >  	/*
> 
> Hi Zack, thanks for trying to improve this conundrum called panic
> notifiers heh
> 
> I confess at first sight I got a bit confused, and only after reading
> patch 1 and 2 twice, things made sense to me: you're hooking
> __crash_kexec() directly!
> 
> So, in my head, 2 things that would make sense upfront: merge patches #1
> and #2, and comment a bit about it in the code.

+1

But honestly, the semantic and ordering of all the variables and
functions is very complicated. It is very hard to follow and
understand all the rules.

I am going to think about it. But I'll first comment the 2nd
and 3rd patch.

Best Regards,
Petr
