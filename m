Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795269682;
	b=qqkqb0wIKMMCJy+FxMl/YoH/oH7aT2Hg5Ss6pPviF9U3lTGSrWNg6WON3tt7LM2xcVja
	 2fw3rdSfKd4CvNbhDpfROu1OWAIJYzzfMIZuk1Vf58Zsi0t/WI2Weo6IHnR15CzeJyBbL
	 tl8NreB63Q3v0g6nr+jG0G7GCzw1v+66ca2ISr3tWK3zu3MGB5W1da5PNxj7B1Lldt6p9
	 EDdYGAB9WRlgjlcq8VaJ98cLtdHg4U4/uLOnuf8pSkZpizGqOrzFEQhlVSG0gcBPl+G1v
	 R8bDOhU7EvCfwxxel8HqBZD79c/RG/o35ZFjHx9SWODsfEhX1IiXtCat2FrMvPWTlJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795269682;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=e2mOK1MMQLYi3VECCKGxNvMEni9pzQtygVngFQX5eIw=;
	b=SICUStzH4GzjQquq+mwIuq92kkdB1GqbV8Xf1tgVsoo/DuG55k0Slm2GL0HROcX6JeUx
	 o5CjffMIJXV+B0Ecfvutcab6DmfyAC2dghwGfuZ4w1HNQyWq0EAl17X6YFZdRNf3y37Ux
	 VVbJEDwSG9LSgTHLTTFmdlhfvLLdNevTh5lP0jsrugGz6FoiSDTb22CGbZ3FyIOo2VN2M
	 c6lmhsRgDWQvGYyTOH8lmJJrVRk/eSw5jK4z52tqpBJLxSkd8ZJfkcC5WNdKnAwFjdbrs
	 DK+y/M1Xd+qRIRHb4tWysWwNJCVrT8Q5Mg68YQDKCtm8/qwN6D29SnFgZFxlNY9XeSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LzAcdpGr;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=O1Tn2CLk;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195C6606A335
	for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 14:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 195C6606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LzAcdpGr;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=O1Tn2CLk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795269681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=e2mOK1MMQLYi3VECCKGxNvMEni9pzQtygVngFQX5eIw=;
	b=LzAcdpGrRW5fsHU56X+r+/Jb19uvGnU7mGKb0AByNd6Db0f7yvI4xbsVMOOZYUz0gu+bDC
	9pezGc/ZKm1qiErmU8gB1mYQAmMAGo9/rVRlzMYJ72DJJn2LLxvq5ebTMHYAIvhnNEn1Y+
	gFmCZckQOLDRcEFfuRqGxyZym3CZb5o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-62Tm9Wo_N5eS-t-PdQ79Wg-1; Sat, 21 Nov 2026 14:01:17 +0000
X-MC-Unique: 62Tm9Wo_N5eS-t-PdQ79Wg-1
X-Mimecast-MFC-AGG-ID: 62Tm9Wo_N5eS-t-PdQ79Wg_1795269676
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4bb6bbc025aso14235525e9.3
        for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 06:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795269676; x=1795874476; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e2mOK1MMQLYi3VECCKGxNvMEni9pzQtygVngFQX5eIw=;
        b=O1Tn2CLk9hyLN4hChofe7oNr8x8KRkmHX2SrOxpjr8bT3BFuUCb6zOQhQ7EwDB0Xu0
         M9/PnFeBcMX2ew/kIFcT6G8l/D2s55YbT3e7H29pckovrltLM4EmAnlNJ1dAJIrBJqMa
         kK6eLFDf9igH/q5evc3bK3Caolypy0jyDh5sm8DhfGtTUMIEECmxLa+72YSQYg/hfY/h
         27zI4vkkTnrR5KGZQYY4XKqYfrI5fGknVaDVon9eKEYwWS+JqIusgjA2k7f1IDFI+vwu
         5Ekx7SjTlsu6RnAkwdjxyzWtD6qurjDGCEgRS8hMrZn1nl16laSbDxD86eQ8GW7We1Lj
         yUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795269676; x=1795874476;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e2mOK1MMQLYi3VECCKGxNvMEni9pzQtygVngFQX5eIw=;
        b=Au3wivRAi94GIzS4eKf93/I4Iyoyyp7X6KSgV0a0QZTAPjAUTbU6IvpJcQFObaCIL7
         8Apjv3g5P7VB10zju9uWjw+sjQOv6cgadWba9Z/sNlS17bPVGc/v/KpAh62EvZx8wuC3
         S1kwQdpDXJcYc+jntvI2k7KC4qldV/q3b1NXRxYtM9k9/NsAznotv8f+wof798WrOOuE
         Z/RyiUPZ0imgSLEdFJQBkiusfcjJDIM2zImngdYaY1A50S3uKQ91SvcDLq6GdE8EQ6uX
         SQ9dq2nwqPU3sYPwqPSpX9LNdyybsVhDBsuww1NZ4oqhcQXYeeanV0mjmEIidrmZFe3g
         E9wg==
X-Forwarded-Encrypted: i=1; AL+hErGCQjUP05bvkvqAncwUCMYesv7u1jZzo2NZ7i7DiD3612sEtdH/Ey7zqS43dE7H3YLzyZFCHEWND9M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3GEPscR5mw/M2wL/6nUNAQnm3ZGvipckLr2w1yThGBldL4OtO
	UgkKZF8CI+Ld9y1eWcvQdfwuY98eIKZneZpCQilTfA0vN2dWvJ2BSx+y1oUUwTAXonXCl23qxns
	zKQtWJSCSn2q13/Cuo2BUar15f0dfv7nenNDa+BaiZo3KhhJRUjXpuEYj3zWgBw==
X-Gm-Gg: AZFdTZf+/EA+4W+Jke7ZY8oLgh8my7b2mJ3ZWBlo5n4QpAAkx50LLj53Pq7uUxgA0s+
	sk4lmr3PI9A8DUquErfT7UMmvagzv4F+e1QghFz+cmPGZpmqjC7scbE3L1wubicVZfRkfLYmQlC
	ikThc2SPv5Xbc4ZQdXu5XOh5yRlTj8PIfbu//4Ad9fPkRk3WgfVVy6hCY/G1D5moAO9WQ38MMDI
	ZjzdYlkQZRH00sABkEhXu/gJ19gpDluJzTC3yb9tS54Z4BeFP+DtjYJYJ1BGFS7hlFdLWMEor2s
	7ldh8n3cSdfKE2m/ywzp8lXf0Cky/xp+Fea5FgJz3Z+OjJgBjCevOOVka794A1koIzGye34fjV/
	PGCV8JeP/uFxL/XAgoYOjnFrJc90VFD76jIc9u5hFGUKVDm36r3za172QYTA/WdKyKAwjeLhhZL
	TE
X-Received: by 2002:a05:600c:64c9:b0:4bb:679a:86ee with SMTP id 5b1f17b1804b1-4bb88938dbemr145650315e9.29.1795269676268;
        Sat, 21 Nov 2026 06:01:16 -0800 (PST)
X-Received: by 2002:a05:600c:64c9:b0:4bb:679a:86ee with SMTP id 5b1f17b1804b1-4bb88938dbemr145649735e9.29.1795269675930;
        Sat, 21 Nov 2026 06:01:15 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm228383265e9.3.2026.11.21.06.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 06:01:15 -0800 (PST)
Message-ID: <e8b9a9afb9587ed1f41c0fafd486ec9be82928db.camel@redhat.com>
Subject: Re: [RFC PATCH v2 9/9] rv: Test IRQ-exit softirq provenance and
 handoff
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
Date: Sat, 21 Nov 2026 15:01:13 +0100
In-Reply-To: <20261107171252.25090-10-kmehltretter@gmail.com>
References: <20261107171252.25090-1-kmehltretter@gmail.com>
	 <20261107171252.25090-10-kmehltretter@gmail.com>
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
> IRQ-exit softirq processing preserves hardirq state until it finishes. Te=
st
> the resulting hardirq-to-softirq-to-hardirq sequence, including a nested
> hardirq and monitor attachment during the transition.
>=20
> Boundary and tick-exit callbacks can themselves raise more softirq work.
> Raise work at softirq entry, softirq exit, the final hardirq boundary, an=
d
> a full-NOHZ tick_stop event. Verify that ordinary work reaches ksoftirqd,
> forced-thread timer work reaches ktimerd, and a timer-wakeup callback whi=
ch
> raises ordinary work gets the final ksoftirqd recheck.
>=20
> Track the synthetic owner and serving-softirq interval so unrelated neste=
d
> interrupts do not corrupt the expected sequence. Reject the handoff setup
> while bottom halves are blocked, attach observers before waiting for
> workers, and recheck the setup with interrupts disabled.
>=20
> On PREEMPT_RT, verify that worker events do not report hardirq provenance=
.
> Do not run the synthetic inline IRQ-exit cases there. IRQ exit defers
> softirqs to workers, and serving-softirq state is task-local rather than
> encoded solely in preempt_count().
>=20
> Snapshot reaction counts inside synthetic IRQ-disabled and hardirq
> intervals, then evaluate the KUnit expectations after restoring normal ta=
sk
> context.
>=20
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

I still couldn't read the KUnit tests, but from what I get quickly scanning
these, it's massive. A total of almost 3k lines of KUnit tests for 2 simple
models is probably a bit much.

Keep in mind you are testing your unit, which is an RV monitor, so you may =
want
to stress transitions, mess around with the environment as little as you ca=
n
(e.g. disable interrupts) and use mocks/stubs where you can. It isn't alway=
s
easy, but the fact you're touching softirq.c doesn't look right. Your
unit isn't the softirq machinery, you should interact with it as least as
possible.

If you really want to test the system as a whole, you do a selftest,
which stresses from userspace, more like an integration test than a unit
tests.

Thanks,
Gabriele
