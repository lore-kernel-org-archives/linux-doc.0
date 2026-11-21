Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795270996;
	b=xWW9Xqts8WN9BPeur1t8JNzOinbecwVJetwGsxnIsctzSZkpziikxnv8s+/8S8d9SPYv
	 vmS2L6v12L730OAUxMcHi2bYVaN5RjQTHWbRMCq1CFu3Mh0E5El+MW2SQS/taQGPq2oKa
	 g3NAdq9GUftePVCCbfQ7EbJpT+oWBDqXi8KGjdGVjY9soy7D3MhHjaTpvYuRuKBlMqsHW
	 zg6ohcgb7CsZuuyq3PqDtFgpI6w3vcXLWP6c5GRGXx/isgBR4lKFIpNqJeKTaPSwLudjM
	 wuypO8nfQDquTLvXC4584v9QAmPqazsUpNKb3gzQTxPAOQDPohXPQTaa0AXaTNSY1Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795270996;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=WqzN6zJ4R2jqDldWJTZ9k5y4S9ZfXvzqjQVQe1JBsIo=;
	b=uu49m3cwxb1QrsEmWSQvipcDPZJBWDsDi0yKYO0U5i0hMwi0SPy6fSDs6Wtr6v2KOo9M
	 +bKKeQYaSpyHWqJcBtSKSIm3dTSTNHxZ+mtXqZkolx2WDhiOht2JKnCWioanQt5mc0bFL
	 RTu+/KXinJvrnnId2Zz5q3H27blBXbJ0vMSJSt0AML53rPg12p4SuinxzPbQK1N7TqHGx
	 m2kK/8imHagudCbwTZw4ZmMyf8FdwCYTUKWIUrFCPZlQo0n6zzntGOOz4A7whjneow+fj
	 4S9xkLwP4EHqiClFAPHJjVKB4ntM2nEF3iVZKNkRZ/g9VfEZQFEh1OQ4N9DekyWVK+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gSmgkcqx;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=AUKUqEb9;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE85606A330
	for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 14:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CE85606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gSmgkcqx;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=AUKUqEb9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795270994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WqzN6zJ4R2jqDldWJTZ9k5y4S9ZfXvzqjQVQe1JBsIo=;
	b=gSmgkcqxubNWIlYYc8Ry7rjMOdcLZOiGCQNynXH7+mUPoRacPCUbYNvsgUgEyUdgnopVcc
	nFFllVhP1ypfvO9V+RLlBSlBQHDVwKrVDQPFnN0My4tY0eD98GyESJN6/2fMMAjymE12Ox
	uzHNvT/8tpApVmAUsMcTlYP314L4i3w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-328-pIFgic6rOHmB8d6sPnBI8A-1; Sat, 21 Nov 2026 14:23:12 +0000
X-MC-Unique: pIFgic6rOHmB8d6sPnBI8A-1
X-Mimecast-MFC-AGG-ID: pIFgic6rOHmB8d6sPnBI8A_1795270991
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48fbcf023dcso764152f8f.2
        for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 06:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795270991; x=1795875791; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WqzN6zJ4R2jqDldWJTZ9k5y4S9ZfXvzqjQVQe1JBsIo=;
        b=AUKUqEb9Jv5sEBL8RqHD81ZYnnJdkbD7QPEYrsk4NofCasIi7sHa52S2B4P89+me9u
         46ykO0/K5eYaeLJr8y2f3XEUcv/LwEgg0d5H61uXZiWoIMs9qYA1TBVBbJtFRLwGy/gl
         VHJTDHAv1wyF1T9dSpZk8Zg68y1RQf2nSM17mSfLgq/FscaiONF04jIZq1a8HPnBZUX4
         O+pYBi0nYNHo6gC999PYImo7s6iO5SROafuLo93uE0lvwUj2uQTiB6TBctsBwOIFYbjb
         nH2uQRbDZXS9pq6XmLAJX/ClGxGNz71TlLMj99u/ANmH00yjveuxhskn6IanD9XaO0Mr
         jyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795270991; x=1795875791;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WqzN6zJ4R2jqDldWJTZ9k5y4S9ZfXvzqjQVQe1JBsIo=;
        b=ogs6qWuSL/YGhkJrpaUZAkZrcip3NJW2gAFvrb3/PMY9ZUaK7kP9LG442AznM4MozV
         1r/sh/Elfzs9dsuOYqAv1TPM+Lpb4TsiDLMWagGRidog7brrjyQEBzKue43ZCq3xcfQx
         3HXHRVGEK71PvYmVf3KfaJHzZkNwCgTwX4Vuc/jYvHYEtvgFSwi/viYBUQdVtBZxGXfp
         5GHzRdTWmZfWoPLwda3RWNchF6O7jdsxfgsQHGRaBhs9RtBFP2DiW6q0zGbJ/mB7O0oE
         FmUj9FvBATl0wbzOT+TUEaWJ+Pxf6F9TBEmCYSHu4cdsGhpGs3dpcIWQ6KFOhp4EF+X+
         XOCg==
X-Forwarded-Encrypted: i=1; AL+hErGhUl4GnnZnrhIbzxQo0oxBh+LQg0FQGDF1/uvVBDJY+QvIvWo2VHp4kEo0qtkeKz+ni600wz5mSS0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xxJwma7p7gYAzXjSppZFtcUOep3Nks+95wmdSYGkDazEPRCNw
	a4FBE7p+HGLoznk3nrHd5Jh5COqB9CIEgTbyc/F2vGBoXFFgXRhlLuO+EomyOwOBVnIJRqrRVmF
	mriBjC0wBgsWni9dYY8BuWae9Z3WDkDkenTm0eHDcwOmrZoEhvlemigUhoz0KMw==
X-Gm-Gg: AZFdTZfe7Nqg5KcrOqa8G0OPziPkeNm7mISsh/yDtEGkZtpxrQn3jY10DjpXuJAK2GJ
	bJUdx6THIB5SHIwCvcDOsQv4urqQ5VSgwxQspBfQ7rzyHt8RSd/NRaJy+rF/Jg9vFI4QlqK5fsy
	EUbdombEHgz+qMTTlcKo7cogMqWU3VJXGwJZ50zs/IndwJ3SMxsQ9EpQ08Yv/fPTc6O5fLi5VJ+
	ojV6kug9E/h3+ombjRWx34FHJSW0Gh1eTXo+oX4/+TWjnx5D1fhbK+NKdmKXYMdtKtJHckOnX/s
	4ouQhT7HESp2XZLztFBq+2ZZk8etewNZaMS9cyeWFzovkpinjKizopUpvCe3XFEic0yCqh2XGjp
	7Ik2+uPxW790XA7STlwzhv8fGz4lAxBbDfDhlgbj4b44kHugf+UpfMDb6Xkl99kl7oTZUmBmLb6
	fX
X-Received: by 2002:a05:6000:47d4:b0:4aa:5396:a7bc with SMTP id ffacd0b85a97d-4abb4b849fbmr9281753f8f.40.1795270991199;
        Sat, 21 Nov 2026 06:23:11 -0800 (PST)
X-Received: by 2002:a05:6000:47d4:b0:4aa:5396:a7bc with SMTP id ffacd0b85a97d-4abb4b849fbmr9281710f8f.40.1795270990742;
        Sat, 21 Nov 2026 06:23:10 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm10354767f8f.18.2026.11.21.06.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 06:23:10 -0800 (PST)
Message-ID: <9419fa94de8acc8f1ae445004b77d20d0be3e98e.camel@redhat.com>
Subject: Re: [RFC PATCH v2 0/9] rv: Verify generic IRQ context transitions
From: Gabriele Monaco <gmonaco@redhat.com>
To: Karl Mehltretter <kmehltretter@gmail.com>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers	
 <mathieu.desnoyers@efficios.com>, Thomas Gleixner <tglx@kernel.org>, 
 Sebastian Andrzej Siewior	 <bigeasy@linutronix.de>, Clark Williams
 <clrkwllms@kernel.org>, Ingo Molnar	 <mingo@redhat.com>, Peter Zijlstra
 <peterz@infradead.org>, Andy Lutomirski	 <luto@kernel.org>, Juri Lelli
 <juri.lelli@redhat.com>, Vincent Guittot	 <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,  Ben Segall
 <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
 <vschneid@redhat.com>,  K Prateek Nayak <kprateek.nayak@amd.com>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,  Randy
 Dunlap <rdunlap@infradead.org>, Wen Yang <wen.yang@linux.dev>,
 linux-trace-kernel@vger.kernel.org, 	linux-rt-devel@lists.linux.dev,
 linux-doc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Sat, 21 Nov 2026 15:23:08 +0100
In-Reply-To: <20261107171252.25090-1-kmehltretter@gmail.com>
References: <20261107171252.25090-1-kmehltretter@gmail.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, 2026-11-07 at 18:12 +0100, Karl Mehltretter wrote:
> Questions still open from v1:
>=20
> =C2=A0 1. Are dedicated scheduler tracepoints the right way to follow
> =C2=A0=C2=A0=C2=A0=C2=A0 preempt_schedule_irq() across task switches and =
migration?

So I'm not quite sure you care about running outside or inside the exceptio=
n
context tracking. If you don't, an fentry/fexit in BPF (or fprobe in the ke=
rnel,
not supported) could work for you.

That said, we do roughly the same in __schedule(), so I don't see anything =
wrong
with what you're doing, as long as Peter is fine with it.


Maybe, you could somehow reuse the __schedule() tracepoints and understand =
you
came from interrupt context, but that would obviously not match the
interrupt/preemption counts, although they are (now) guarded by a BUG so yo=
u
don't really need them.
The loop should work fairly well anyway.

The nrp model does something similar with the nested_preempt, flagging a
schedule entry after irq as an irq preemption. You may look into that, I do=
n't
exactly remember but it probably isn't really accurate and you might need
something else.

> =C2=A0 2. Is the KUnit-only hook for an empty ksoftirqd invocation
> =C2=A0=C2=A0=C2=A0=C2=A0 acceptable? Outside a KUnit run, its worker chec=
ks take a disabled
> =C2=A0=C2=A0=C2=A0=C2=A0 static-key path.

I mentioned it briefly in another email, but I don't think you should touch
softirq code at all. Just simulate events, don't cause them.
As a rule of thumb, if your RV unit test creeps into other subsystems, you'=
re
doing something wrong.

Another story is if you want to write softirq KUnit tests, but that's beyon=
d the
scope of this series and I'm not the one to answer it.

Thanks,
Gabriele

>=20
> Patches 1-5 add the tracepoints, monitors and documentation. Patches 6-9
> add KUnit coverage.
>=20
> The series is based on v7.4-rc1, which contains the v1 prerequisite and
> Wen Yang's reactor lockdep fix:
>=20
> =C2=A0 commit feb5c9a2447a ("softirq: Preserve interrupt context on retur=
n from
> interrupt")
> =C2=A0 commit 39ccedfd9e55 ("rv: Use LD_WAIT_SPIN as the reactor lockdep =
wait
> type")
>=20
> The series is independent of the early-hardirq series [2], which
> installs hardirq state before entry tracing. Both change
> kernel/softirq.c, so applying one on top of the other needs a small
> conflict resolution in __irq_exit_rcu().
>=20
> Changes since v1:
>=20
> =C2=A0 - Use bare DECLARE_TRACE() tracepoints instead of trace events
> =C2=A0=C2=A0=C2=A0 (Gabriele)
> =C2=A0 - Rename the irqentry container to irq (Gabriele)
> =C2=A0 - Add text schematics of both models to the documentation (Gabriel=
e)
> =C2=A0 - Document why irqstate and irqexit are separate automata
> =C2=A0 - Rebase onto v7.4-rc1
>=20
> Testing on v7.4-rc1 with Clang 23.1.5, GCC 14.2 (x86) and GCC 16.2
> (cross), and QEMU 10.0 TCG, with lockdep and the locking selftests:
>=20
> =C2=A0 - Each patch builds with W=3D1 on x86_64 without new warnings.
> =C2=A0=C2=A0=C2=A0 RV_MONITORS_KUNIT_TEST=3Dm builds on x86_64 and arm64.=
 kernel-doc
> =C2=A0=C2=A0=C2=A0 reports no warnings for the changed headers.
> =C2=A0 - The rv_mon KUnit suite and the reactor suites passed without
> =C2=A0=C2=A0=C2=A0 failures on:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86_64=C2=A0=C2=A0 PREEMPT SMP4 and UP, PR=
EEMPT with nohz_full=3D1-3 and
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 threadirqs, PREEMPT_RT SMP4, PREEMPT_RT SMP8 with
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 nohz_full=3D1-3
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm64=C2=A0=C2=A0=C2=A0 PREEMPT, PREEMPT w=
ith nohz_full=3D1-3 and threadirqs,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 PREEMPT_RT, PREEMPT_RT SMP8 with nohz_full=3D1-3
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 riscv64=C2=A0 PREEMPT
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARMv7=C2=A0=C2=A0=C2=A0 UP
>=20
> =C2=A0=C2=A0=C2=A0 Each configuration ran 13 to 21 of the 29 rv_mon cases=
. The others
> =C2=A0=C2=A0=C2=A0 are skipped because they need a different configuratio=
n.
> =C2=A0 - RV=3Dn kernels boot on x86_64 and arm64.
> =C2=A0 - On top of the early-hardirq series, the same suites passed on
> =C2=A0=C2=A0=C2=A0 x86_64 (PREEMPT, PREEMPT_RT), arm64 (PREEMPT, PREEMPT_=
RT) and
> =C2=A0=C2=A0=C2=A0 riscv64.
>=20
> An LLM assisted with the patches and the testing.
>=20
> v1: https://lore.kernel.org/all/20261022050712.75035-1-kmehltretter@gmail=
.com/
>=20
> [1]
> https://lore.kernel.org/all/FACA54EC-F846-4051-9ADD-DB46E7665FAD@redhat.c=
om/
> [2] https://lore.kernel.org/all/20261028033127.82193-1-kmehltretter@gmail=
.com/
>=20
> Karl Mehltretter (9):
> =C2=A0 tracing/irq: Add generic IRQ context boundary tracepoints
> =C2=A0 tracing/sched: Add IRQ preemption lifecycle tracepoints
> =C2=A0 rv: Add a monitor for generic IRQ context transitions
> =C2=A0 rv: Add a monitor for IRQ-exit scheduling ownership
> =C2=A0 docs/rv: Document the IRQ monitors
> =C2=A0 rv: Add KUnit coverage for IRQ context transitions
> =C2=A0 rv: Add KUnit coverage for IRQ-exit scheduling
> =C2=A0 rv: Test empty PREEMPT_RT softirq worker intervals
> =C2=A0 rv: Test IRQ-exit softirq provenance and handoff
>=20
> =C2=A0Documentation/trace/rv/index.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0Documentation/trace/rv/monitor_irq.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 475 ++++
> =C2=A0include/linux/interrupt.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0=C2=A0 8 +
> =C2=A0include/rv/kunit.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 34 +-
> =C2=A0include/trace/events/irq.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 56 +
> =C2=A0include/trace/events/sched.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 26 +
> =C2=A0kernel/sched/core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 6 +
> =C2=A0kernel/softirq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 324 ++-
> =C2=A0kernel/trace/rv/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 11 +-
> =C2=A0kernel/trace/rv/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 3 +
> =C2=A0kernel/trace/rv/monitors/irq/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 13 +
> =C2=A0kernel/trace/rv/monitors/irq/irq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 35 +
> =C2=A0kernel/trace/rv/monitors/irq/irq.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 3 +
> =C2=A0kernel/trace/rv/monitors/irqexit/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 14 +
> =C2=A0kernel/trace/rv/monitors/irqexit/irqexit.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 172 ++
> =C2=A0kernel/trace/rv/monitors/irqexit/irqexit.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 85 +
> =C2=A0.../trace/rv/monitors/irqexit/irqexit_kunit.c |=C2=A0 540 ++++
> =C2=A0.../trace/rv/monitors/irqexit/irqexit_kunit.h |=C2=A0=C2=A0 21 +
> =C2=A0.../trace/rv/monitors/irqexit/irqexit_trace.h |=C2=A0=C2=A0 19 +
> =C2=A0kernel/trace/rv/monitors/irqstate/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 14 +
> =C2=A0kernel/trace/rv/monitors/irqstate/irqstate.c=C2=A0 |=C2=A0 289 ++
> =C2=A0kernel/trace/rv/monitors/irqstate/irqstate.h=C2=A0 |=C2=A0 139 +
> =C2=A0.../rv/monitors/irqstate/irqstate_kunit.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 2339 +++++++++++++++++
> =C2=A0.../rv/monitors/irqstate/irqstate_kunit.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 25 +
> =C2=A0.../rv/monitors/irqstate/irqstate_trace.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 15 +
> =C2=A0kernel/trace/rv/rv_monitors_test.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 30 +
> =C2=A0kernel/trace/rv/rv_trace.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0=C2=A0 2 +
> =C2=A0tools/verification/models/irq/irqexit.dot=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 21 +
> =C2=A0tools/verification/models/irq/irqstate.dot=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 32 +
> =C2=A029 files changed, 4737 insertions(+), 15 deletions(-)
> =C2=A0create mode 100644 Documentation/trace/rv/monitor_irq.rst
> =C2=A0create mode 100644 kernel/trace/rv/monitors/irq/Kconfig
> =C2=A0create mode 100644 kernel/trace/rv/monitors/irq/irq.c
> =C2=A0create mode 100644 kernel/trace/rv/monitors/irq/irq.h
> =C2=A0create mode 100644 kernel/trace/rv/monitors/irqexit/Kconfig
> =C2=A0create mode 100644 kernel/trace/rv/monitors/irqexit/irqexit.c
> =C2=A0create mode 100644 kernel/trace/rv/monitors/irqexit/irqexit.h
> =C2=A0create mode 100644 kernel/trace/rv/monitors/irqexit/irqexit_kunit.c
> =C2=A0create mode 100644 kernel/trace/rv/monitors/irqexit/irqexit_kunit.h
> =C2=A0create mode 100644 kernel/trace/rv/monitors/irqexit/irqexit_trace.h
> =C2=A0create mode 100644 kernel/trace/rv/monitors/irqstate/Kconfig
> =C2=A0create mode 100644 kernel/trace/rv/monitors/irqstate/irqstate.c
> =C2=A0create mode 100644 kernel/trace/rv/monitors/irqstate/irqstate.h
> =C2=A0create mode 100644 kernel/trace/rv/monitors/irqstate/irqstate_kunit=
.c
> =C2=A0create mode 100644 kernel/trace/rv/monitors/irqstate/irqstate_kunit=
.h
> =C2=A0create mode 100644 kernel/trace/rv/monitors/irqstate/irqstate_trace=
.h
> =C2=A0create mode 100644 tools/verification/models/irq/irqexit.dot
> =C2=A0create mode 100644 tools/verification/models/irq/irqstate.dot
>=20
>=20
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

