Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99F815746F
	for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 14:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748356513; cv=none; b=PKA3OwtACNparE7thABWedfgwRlsCXRWbXeubCHtVEJf2xMc1baFixznTholqE5Li1KO6+SaxZ3+ycS4qFHeiTt48f0pKLtI5fO2PZ7tX1ULJ0HgcX6umm7JG22ylVgM+/u/h8iYp/ccW40nzXY4kLBugfGbsdddMaaVTjpKduA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748356513; c=relaxed/simple;
	bh=Eggf1OBO+Ax8tj7dE+qQEGU2Ua47+c3JO9KLjDB03l8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iy9wUqfZm87n6XybjoxkoSQ2BPXnbanDfmrUYHJCOW+gGlRAgZxHFsLDj3Y3F6jyMl6+OzNFUmhwVYNQ8Xuw//E6t9y8NuY08gAARC8Yac8q2evUfu2ZyDcml0b0eIJ+VYb+s+3X+B3t6soGDrUq4c0qlnzan/UD1Us/SPNvzp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Okg1TdMw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Okg1TdMw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748356510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=L3GI2gbUmIa7mOJoCzehrNV7F2gboefZH5wJFgdPvXA=;
	b=Okg1TdMwgi7KHVF55MATCFpz+nqGWDHqbEh029VBMlnFoR00ZLQFE6lMOuhCD/a889N10l
	hVTgbbqdhGlL95kB1roPCPiudkSLzIDZs+oDTwaXxN/8GgCFPgARqvL7JWKaE3EJeifKvE
	c68z2zQPGkj3xdqti93KnNwiQ3jknF8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-OT_pW808M-aHGO989rBV1Q-1; Tue, 27 May 2025 10:35:08 -0400
X-MC-Unique: OT_pW808M-aHGO989rBV1Q-1
X-Mimecast-MFC-AGG-ID: OT_pW808M-aHGO989rBV1Q_1748356508
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4dcfb3bbcso898145f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 07:35:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748356507; x=1748961307;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L3GI2gbUmIa7mOJoCzehrNV7F2gboefZH5wJFgdPvXA=;
        b=FHrbE8iNe52lXYHR4sU92OnPRvEJi29K5liuDszJ5+qBKytUs7OOJP3Yx+aOkgLPE8
         +fJ/A4NRmLSq0iCocxdop8RyBKPyMAYviGkSg0pJ341h0w1FcKJWQpbkPoJBhpiEnncY
         iefXX8e8IuU6yrTrLLMA4WVuHduyx0OVyWmbtqEOWpMV/XuFaFL2pwMwzHlBb/VaFH88
         rSYwN15gW5VChUF5qGER9EvUF9SsTCwSY+r52bn9cIVhHy3VAcGg5Gnq+Pall83eb3Sk
         qyQj/0iPorMSLLdZmAxIvS4+3oXTPWYbfEukP+cHVq3Ssp9yCH2SiYry72kDzBjwn/24
         nyhw==
X-Forwarded-Encrypted: i=1; AJvYcCX5NlKrmzLjsEh4P2qseqjykkVBb0OItfTyQ4thTIXJugl7L6phPHXT8z4vqCCNDtqphgT2TRiJg+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX84xoxbzIfhkSrP+SAKt6Xq060mcN4mssldtvozr0T5PqpUYC
	X0YPE2Zp29G/b1bVrxlXJ4824ZbLHpmDDinCFmL0M3RgBr7LifPxPwS3PIRB17ElzYYd31MHK9h
	mYB81GSd1eiP94eFIcoN1zLV/Ms9D38RF7iUT1/nExUTxViXMrRlmq2iX4oceKg==
X-Gm-Gg: ASbGncsMcx2cz6p+5l3BdGNFKivST8BZ3Kw90eBgnDnTbCkfHvDLfXAPe+/qVJBue8G
	ASfB6SiwDI37qrLX630Kp747/Km5rrhhlisKyzSAFQTwvnolipDrLTnZFgf5jQXm9+FCqZIJKXx
	NABwtF7BJtB1dG5j5TXTtECgtKpqJihYfx55b3CARTC3EDDOTeX/0ArfzTcM2x/KJKlFec7maYp
	3WdENQe3lfxO+olhOr5kalUxjpboWKnl7BZ5WsQlmcjxvVqhDpUzkOZExmnCVwM4V4fu3ZKAaZG
	7QpCDNXE0x1vfRYkIsaJO3RSmbGNKm3pg0JDhw==
X-Received: by 2002:a05:6000:178b:b0:3a4:d6ed:8df7 with SMTP id ffacd0b85a97d-3a4d6eda61amr8126383f8f.59.1748356507396;
        Tue, 27 May 2025 07:35:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRv/OfRRiDQA7X9BzrxYr9prABUS7Bh2GUtwtYTwY+TNdKzDqXiTPEpURBylbaeVKLg3wH2A==
X-Received: by 2002:a05:6000:178b:b0:3a4:d6ed:8df7 with SMTP id ffacd0b85a97d-3a4d6eda61amr8126364f8f.59.1748356507047;
        Tue, 27 May 2025 07:35:07 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d67795eesm7198027f8f.86.2025.05.27.07.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 07:35:06 -0700 (PDT)
Message-ID: <6f33e6b7ad296f4fd0e9c089ac92e53c08cfd850.camel@redhat.com>
Subject: Re: [RFC PATCH v2 12/12] rv: Add opid per-cpu monitor
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Ingo Molnar
	 <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Tomas Glozar
	 <tglozar@redhat.com>, Juri Lelli <jlelli@redhat.com>
Date: Tue, 27 May 2025 16:35:04 +0200
In-Reply-To: <20250527133712.CFW5AcNE@linutronix.de>
References: <20250514084314.57976-1-gmonaco@redhat.com>
	 <20250514084314.57976-13-gmonaco@redhat.com>
	 <20250527133712.CFW5AcNE@linutronix.de>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



On Tue, 2025-05-27 at 15:37 +0200, Nam Cao wrote:
> On Wed, May 14, 2025 at 10:43:14AM +0200, Gabriele Monaco wrote:
> > Add a per-cpu monitor as part of the sched model:
> > * opid: operations with preemption and irq disabled
> > =C2=A0=C2=A0=C2=A0 Monitor to ensure wakeup and need_resched occur with=
 irq and
> > =C2=A0=C2=A0=C2=A0 preemption disabled or in irq handlers.
>=20
> This monitor reports some warnings:
>=20
> $ perf record -e rv:error_opid --call-graph dwarf -a -- ./stress-
> epoll
> (stress-epoll program from
> https://github.com/rouming/test-tools/blob/master/stress-epoll.c)
>=20

Thanks for trying it out, and good to know about this stressor.
Unfortunately it's a bit hard to understand from this stack trace, but
that's very likely a problem in the model.
I have a few ideas where that could be but I believe it's something
visible only on a physical machine (haven't tested much on x86 bare
metal, only VM).
You're running on bare metal right?

> $ perf script
> stress-epoll=C2=A0=C2=A0 315 [003]=C2=A0=C2=A0 527.674724: rv:error_opid:=
 event
> preempt_disable not expected in the state preempt_disabled
> 	ffffffff9fdfb34f da_event_opid+0x10f ([kernel.kallsyms])
> 	ffffffff9fdfb34f da_event_opid+0x10f ([kernel.kallsyms])
> 	ffffffff9fdfba0d handle_preempt_disable+0x3d
> ([kernel.kallsyms])
> 	ffffffff9fdd32d0 __traceiter_preempt_disable+0x30
> ([kernel.kallsyms])
> 	ffffffff9fdd38fe trace_preempt_off+0x4e ([kernel.kallsyms])
> 	ffffffff9fee6c1c vfs_write+0x12c ([kernel.kallsyms])
> 	ffffffff9fee7128 ksys_write+0x68 ([kernel.kallsyms])
> 	ffffffffa0bdbd92 do_syscall_64+0xb2 ([kernel.kallsyms])
> 	ffffffff9fa00130 entry_SYSCALL_64_after_hwframe+0x77
> ([kernel.kallsyms])
> 	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f833f __GI_=
__libc_write+0x4f (/usr/lib/x86_64-
> linux-gnu/libc.so.6)
> 	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f833f __GI_=
__libc_write+0x4f (/usr/lib/x86_64-
> linux-gnu/libc.so.6)
> 	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1937 =
thread_work+0x47 (/root/test-tools/stress-
> epoll)
> 	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 891f4 start=
_thread+0x304 (/usr/lib/x86_64-linux-
> gnu/libc.so.6)
> 	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10989b clone3+0x2=
b (/usr/lib/x86_64-linux-
> gnu/libc.so.6)
>=20
> stress-epoll=C2=A0=C2=A0 318 [002]=C2=A0=C2=A0 527.674759: rv:error_opid:=
 event
> preempt_disable not expected in the state disabled
> 	ffffffff9fdfb34f da_event_opid+0x10f ([kernel.kallsyms])
> 	ffffffff9fdfb34f da_event_opid+0x10f ([kernel.kallsyms])
> 	ffffffff9fdfba0d handle_preempt_disable+0x3d
> ([kernel.kallsyms])
> 	ffffffff9fdd32d0 __traceiter_preempt_disable+0x30
> ([kernel.kallsyms])
> 	ffffffff9fdd38fe trace_preempt_off+0x4e ([kernel.kallsyms])
> 	ffffffffa0bec1aa _raw_spin_lock_irq+0x1a ([kernel.kallsyms])
> 	ffffffff9ff4fe73 eventfd_write+0x63 ([kernel.kallsyms])
> 	ffffffff9fee6be5 vfs_write+0xf5 ([kernel.kallsyms])
> 	ffffffff9fee7128 ksys_write+0x68 ([kernel.kallsyms])
> 	ffffffffa0bdbd92 do_syscall_64+0xb2 ([kernel.kallsyms])
> 	ffffffff9fa00130 entry_SYSCALL_64_after_hwframe+0x77
> ([kernel.kallsyms])
> 	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f833f __GI_=
__libc_write+0x4f (/usr/lib/x86_64-
> linux-gnu/libc.so.6)
> 	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f833f __GI_=
__libc_write+0x4f (/usr/lib/x86_64-
> linux-gnu/libc.so.6)
> 	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1937 =
thread_work+0x47 (/root/test-tools/stress-
> epoll)
> 	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 891f4 start=
_thread+0x304 (/usr/lib/x86_64-linux-
> gnu/libc.so.6)
> 	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10989b clone3+0x2=
b (/usr/lib/x86_64-linux-
> gnu/libc.so.6)
>=20
> I'm not sure what I'm looking at here. Do you think these are kernel
> bugs,
> or the monitor is missing some corner cases?
>=20

As said, likely a missing corner case, I believe it has to do with IRQs
(which is what makes this monitor more complex than it could be).

Thanks for the pointers, I'll try reproduce it this way.

Gabriele

