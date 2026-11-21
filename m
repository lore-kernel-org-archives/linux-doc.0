Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795235730;
	b=yVmuVGt4s4GWi3V0xAAIHdGya3oQS1aN1hTb1ngxikC2SRX8qwLQ6DF+j+ewen8IOZRm
	 jwlGo6h59h3EVeOr1gbDHXas1h1uvWE8Hw4zPfsGBzscW5UujGO88/hTMLvxMZWzmjbr7
	 XJjJD8LVPVuwQO+xoksXBwvu8vxmBn7xxGjXuxatSFx7W6C2pbNEWu13AG9Ep7YpyaOME
	 MLdJoZgb2dGCQkJMwflDfULe5VCED72hc0ajejGPkWqKcvcBPTLQOv3maEatIFmsB+jJT
	 SE4afUeQFeqUnRt/LcdGm2zmpH40QRougjLfzywVrbCj/dpBYp9M6Mfsu5FrXbJq+HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795235730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9R6zaVIvtgH5jzl+qiEpRbTjV5svwtDU6V7VCAEyGSE=;
	b=ue2nUgiEOY1yJr1Adg6BCeztxu0dQFdTysoLkWAW4LhC2Iq1rsFtW3uLI3l2HJkFYdLH
	 boGQW+jSPOKHf3FS2BZ1eJC+uWj1sApCO2mSNYQkcS/bAfhyzsIaV2/f9POmzeKLwKy3G
	 y2RZ3BnPR9Qh7K2AH6owilpAVTDh/GV4fEXnopPjmGa3YfexESfgRxEDn7o/SfDA5xRN4
	 lGLCiLfemugh5QzBcqlMUa43oAzXSIE8XKZfRoEdGl2dVcy2PoXWfGjT5aml62fDpghkL
	 HjBYcef8kSqU1DZ+g7G7B1Ez7h29eLF89tF6Vm1Rpoi+blgWLFpUlMzycK+Mwnb2E/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rJ0c2FQa;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75706606A6B7
	for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 04:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75706606A6B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rJ0c2FQa
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b467581b98so15273895e9.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 20:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795235728; x=1795840528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9R6zaVIvtgH5jzl+qiEpRbTjV5svwtDU6V7VCAEyGSE=;
        b=rJ0c2FQaY85mIEKE24XBYeYjXwakqGKvCspyEqc+nGoiqY9yc0PAHhZJRYpl2fKHn2
         O50f1TU4idsNGR07JZbjcZU0laQtv6liqd+7rrLCV+8p6QmcHXK/IVrFnt3vTLbQie85
         3woJ9AHBJldjrKS+CSpG61enN7z2T8GquENXxfXDL7z6l0JP7DLMBsLx9HByvehXn1AH
         g1ts1UUBeoOhhEcjHszVysVxjIwWNKF3IwPiB3N3AX7UxwtVD3UGs50Gq/00NVq6a9uR
         N7vGunDQWZxzaArUXcroPjo4CKWW+yILZSW7N/gIWXLga+QzSNAgq9FwAwNexgFdkHdS
         wxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795235728; x=1795840528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9R6zaVIvtgH5jzl+qiEpRbTjV5svwtDU6V7VCAEyGSE=;
        b=0BRndCmbA308VE9EEyiSdlSHlyJqTxk03sZgkmJ1PcLpg+YYG1d04HQtaj9qHEsUX7
         owU0vQIgME6ecSk1Xz7/bi74QvGl+wmyNN+YpTI1dhEuTiTNKjdy9liDSFS9lHcb/DXi
         +g+h4cNcL8a+K46iGVXiDNQZoDyAAIU4J6uUZFHVD1RS8c1X5GoYU/kxxgt7WFiSJp3L
         EWkc4AD/fYNKhhvVFmMX+LnmUTYXkPltcrhxZEfQHfB08abCDR5j1VtLk2K+BXxadVrp
         1V56QQlzSHVHO2AcRohkMJfsSbpRjk9DCPHrG3/qj/NvL0uZqFvYYhbp/B8oX6SzV/UI
         E9Iw==
X-Forwarded-Encrypted: i=1; AL+hErHdseR7CTKLgA+Yx4Fx7PuQirl5ALPpS4YFya1MZjKX0aLcWD2KUmrNgDTRJbRwLWGxVwmRAXN2eas=@vger.kernel.org
X-Gm-Message-State: APuU4Z84yaTAigoJ9nszENb9NGnnJiwIGk9RDODbgiF33H1tNl4U75dt
	RTc0W6QBvTxua+V8hrIFu2G/4Jd0bjope490VMQzOhLKElQcMa34ndeq
X-Gm-Gg: AZFdTZd2A9yrWTmqzsip9WN3o4se7cO7KktZtLh3N00+5sl+2PHkeoCZHTiRjsj7+yA
	aPye3Jn8Q5WZGaSKqSRhIPx3ptmym+mGorv/WrFX/NwQjDCqNPV08cZZRYcpJBU33yUyqtQkucA
	NALiEbsgmqwrwyUzrfG5fhIgprXqil/lDyEQ60fqJTb2ycMWD54bf5wFfBsQzpoMSmlqN5pY4Mc
	s7kaWsmXmch8pUB8L3qWCrZSOpWfz2Fd3nXZ4B0gnLtuxFwg5aaxnd2gQgF0FWYM045BJdmczlY
	lMOvIWpofbigMSZ7Ju92g03K/lBIU6SVQdV2Ug1awTag4qGgg8GWYgmoH3Vv4wht/igL/MZ/E6d
	+ArHBlNjIo4P6FXZ6nEzgmenPZP5NvvTllux9/S4saJU3KwsQZj/OEppb1vozZ2ULjW550MrMGS
	2YIyNyNGO2+b7O70Z+V9dfzY6rZXnIPAvHtaIuGVGyBYQBekeNetScR2rW9PXac45euvW7ftmoR
	sOzimDobII3OReEvfubfw6bur2G/SfWzwCxnJw+uQq95O1YDTZtXm8nuWW/NSRPbfsqsjjH0M2I
	Cu0X+8/wJYetRBjcp8AJG6zQ35ZuzpeGpyxiUUjhtxshHY1B48Z8AUze8YLv+xhh++eI705se+w
	LNYPGsygkRL92X01clxcMjgJmRiGcr91aX2+HTmDTG6YcqBNi+D7sOhY66aNzXUdnwheDBWdjyr
	/UhPX6ushRUMJrczsxxr7gm6t8k5Tbvrjg
X-Received: by 2002:a05:600c:820d:b0:4bb:7b4d:6396 with SMTP id 5b1f17b1804b1-4bb887e21c6mr111271405e9.3.1795235727586;
        Fri, 20 Nov 2026 20:35:27 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-aeb0-6801-ad74-bca0-dc5f-7242.310.pool.telefonica.de. [2a02:3100:aeb0:6801:ad74:bca0:dc5f:7242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm214023515e9.0.2026.11.20.20.35.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 20:35:27 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	David Hildenbrand <david@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	David Stevens <stevensd@google.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Amery Hung <ameryhung@gmail.com>,
	Swaraj Gaikwad <swarajgaikwad1925@gmail.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	linux-rt-devel@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	cgroups@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/3] locking, mm: Add atomic allocator trylocks on RT
Date: Sat, 21 Nov 2026 05:35:13 +0100
Message-Id: <20261121043513.20538-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261020152708.3atPlnSl@linutronix.de>
References: <20261005070625.8871-1-kmehltretter@gmail.com> <20261020152708.3atPlnSl@linutronix.de>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Oct 20, 2026 at 05:27:08PM +0200, Sebastian Andrzej Siewior wrote:
> What is it that you try to achieve and why. Why is !PREEMPT_RT not
> affected? Half of the problems origin from PI-boosst.
> Why has the nolock an rmutex-backed allocator.

The bug still reproduces on v7.4-rc3. 

GDB caught n->list_lock's unlock re-entering try_to_wake_up() under p->pi_lock.
kmalloc_nolock() uses normal SLUB locks. On RT they are rtmutex-backed, unlike
!RT.

> can_spin_trylock() skips hardirq and NMI. There is a trylock on the
> local_lock_t.
> Why do we have this mess and couldn't we avoid having it?

This was IRQ-disabled task context, so the check passed.

> I looked at the patches and there something about hardirq-atomic waiter.
> Wen don't have this. I don't think we want.

OK, I am dropping it.

I plan two patches: move range-tree allocation before arena->spinlock, then
restore the RT check that rejects non-preemptible callers. Does that sound like
the right split?

Thanks,
Karl
