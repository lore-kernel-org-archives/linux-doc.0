Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420744;
	b=QkD6BiRbv46XxkX8QaV9GclCSVk+FUxmZq39ByC+yekm6a6jw0kc0373oHkTkewnPhRx
	 US6+ojoXg1EJN0uLDp1SW1YxtvbSK/Ub4vuUSQvpxFq3KzpO8SUetHO3hgQElLGCsauak
	 e+34i0b8xNZDvLnltXxkhueQ3j1YhUXVlimZphPB+Dq/pSE/jW1cvNnGT0RQPyn0Sn1KS
	 K8sos39NDO9LcdFY2TYouJ+dfn/A4cwBYQpEO8MBHXNBCJKa9Ao8hSrqFBKRx1UPohoaV
	 fu8/ijLBJb/oqrJC+VvzHAUI4x43V/mGhzko6L2jA48R7xVvi5e0wj1t/f/6uq6WRZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420744;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=W+zsJJ1aBB5y23DhHkSQAtsEWnBqQa/ccFUCBqopeOY=;
	b=t4WvW+gArR8nnf13rHcwtC3nX5+Tb0iZatmq9GCDQZNG1WyDz8sV3thzrzs+1aVRWwsZ
	 pBI1Zy+enjtxBZnD/ynE20B8BuC86aeEvj5c+ycjtKyHnOYNHDEoPy+eCQJVXaj525upe
	 tDqaOURTbWpJV4+6ElFD/QQP4cLps58XhZLYnOJ0j4Wwzi56+88zbkKPrycBKOAH0Zav2
	 sz7qToaf/217w6euZ/luuJhlRIvIiqHGYnBu9XuusqU8mDbWR8x/D3CatXOPgSbi/ZxLB
	 lop4FOb/0j2S0pXCnwuy0S/Zx98VlJKR+qaj5GzGXQ6qf4AjS35wApGXiS9T2JK3s8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QISGdT3k;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KQvuf5cZ;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D063B606A330
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 07:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D063B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QISGdT3k;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KQvuf5cZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795420742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=W+zsJJ1aBB5y23DhHkSQAtsEWnBqQa/ccFUCBqopeOY=;
	b=QISGdT3koEGTFcYByJZX8zPTULxzW7fGETNvivrXfNYBNyK4BH45wd1/PR4X7kNMYwrTJE
	3lAiJgiaKq66ISBPGqto8dyRQyJ8ANbt7l0HC6oWFAwqLUOsbUTL51pwDuxJ0vgomhXrIV
	Ckpc9r1wjEmSZllnwzZ8pbb5rOHXGMU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-hv2017iNML2dBXFCl-ND-g-1; Mon, 23 Nov 2026 07:59:01 +0000
X-MC-Unique: hv2017iNML2dBXFCl-ND-g-1
X-Mimecast-MFC-AGG-ID: hv2017iNML2dBXFCl-ND-g_1795420740
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4b0a307487aso13973075e9.1
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 23:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795420740; x=1796025540; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W+zsJJ1aBB5y23DhHkSQAtsEWnBqQa/ccFUCBqopeOY=;
        b=KQvuf5cZtkj4ZJ+o1h/jxXPs9DdgxpjNFQ0MeYZpfR1e6Lr+06OBPxeCnhgMuxUZgm
         PvRVIHXdSScSX02riGJQq7N+dLEEszzbSMqPvyVECYNC5C1lZnWy6j8a0+4GDG7NYMkH
         DGBrv9l00p2G0VeUMSY5Ddsajkaz/b35KqQ4B0KgpS/daTY+S9WcN6Qd0TPt15xtCIZo
         ODFKVJfNrboYaXZdwGugy7M6wMYAr5c3czjprArHPuL4GRbF6lgNLOyDp2MetwqhC21t
         vlgASgBqzYYuFgyjJQ2mvmdU52hIrCMLH+HaVeIs6ZWU3PBlYQduutH9gmq9aB1cGHt4
         IAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795420740; x=1796025540;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W+zsJJ1aBB5y23DhHkSQAtsEWnBqQa/ccFUCBqopeOY=;
        b=oOyfr2Ma8OwDozqjXDIWXto7ZNn5dl5KygzqCWUK6mHdpp1piSsQ6EZGUlpUodpPp/
         BRLUJSewT98xl5ExOSkoBmLcnERjjWveZSCGdfUWK02TfVD9YEnzz+VU8pNnTQkAImoN
         L2vtCPlbCrao3DIvZcpZuqLH1Z4XdNTT0ixone9nH1YxamJycq3HCgOX9CYi64vk7SWS
         8VV3eqNalMDhcrVLJkDLZRCUIn2ONr73jkL19DyBEXJerpK6LwxnXNpsK4cJpEaO6G5r
         Z/Fcft+pb+je1zJM2DgG4EUowKSI7qEAHZohxlIDx/+qO5h+K3HpGCOUAIU+2DwjIbwh
         pxXg==
X-Forwarded-Encrypted: i=1; AL+hErETH+pk7xsenYyPEyecRRwUzHeQ6IIFyXJIYrdzFHabfFKrZjka/k+6J+ZUcZCRvjIfKYLlltkjR4Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MwiPiNgMY0Mr3orF9/jdKIEwo8YBAC2bcep6XgwcGcYa15pl9
	M4cLKf0X4jOJLEvrHp60NbCk79QaQIYBIKIZxKakhtccjB5QZmzdx5XqNJ6fvD7mKWMDMESszcv
	9+aOCIGD6SIqtIlaR26Pnl5ix3sbzyZZnuzntsAOmBB7sGyy1stct4ECH1N8mTQ==
X-Gm-Gg: AZFdTZdZUY8PJ4VJ6jrKMdW+HHaKBU07OVFfwgFjtycYPVCTGhkys9yI3WTLfZKgWbw
	b8tWvfw+RYr2D5xEO28o2jx4ABPbDt5eTg7svAVvRxRyW8CQfnYKkzwzPQWeNMmKxcP4F1tnY95
	B3dPKl32PcwCrpYKTbbwYskub5I5uaNOGDgtE+3rswn4SNHegRJE9W6ScqZXbf22H76X2mnVjNj
	IXjQPnUTpdMVhPDEVdCyEzFLI1HPh00DcjUQT2hML2WH/8rvE17Z/Yp0hIC/tspJZlnlBJycJAS
	YFfydbwvtkIFqkQEJsLXgUKcxXHaBtw0w8FstmlwRo0w/m1b1aw7rkrlDRpvR/AyPSP0nO8e9yh
	RK98Vcqdep7ZqH80lu6QDWwMKvj2F7zuKguJYgFIqwffjUhJMAp2ueLrQczrORpvjXIQ2zQILEK
	Jz
X-Received: by 2002:a05:600d:82d0:b0:4bb:818d:8d8f with SMTP id 5b1f17b1804b1-4bb88818955mr254816105e9.23.1795420739736;
        Sun, 22 Nov 2026 23:58:59 -0800 (PST)
X-Received: by 2002:a05:600d:82d0:b0:4bb:818d:8d8f with SMTP id 5b1f17b1804b1-4bb88818955mr254815915e9.23.1795420739428;
        Sun, 22 Nov 2026 23:58:59 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm148906565e9.0.2026.11.22.23.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:58:58 -0800 (PST)
Message-ID: <b8c1ad21d862b1da1cab0f5370f3a2885501e9f6.camel@redhat.com>
Subject: Re: [RFC PATCH v2 4/9] rv: Add a monitor for IRQ-exit scheduling
 ownership
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
Date: Mon, 23 Nov 2026 08:58:56 +0100
In-Reply-To: <20261107171252.25090-5-kmehltretter@gmail.com>
References: <20261107171252.25090-1-kmehltretter@gmail.com>
	 <20261107171252.25090-5-kmehltretter@gmail.com>
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
...
> +static void handle_resched_entry(void *data, struct task_struct *owner)
> +{
> +=09da_handle_start_run_event(owner, resched_entry_irqexit);
> +}
> +
> +static void handle_resched_exit(void *data, struct task_struct *owner)
> +{
> +=09/* Do not hide an invalid return behind enable-mid-invocation sync.
> */
> +=09if (owner !=3D rv_get_current() || hardirq_count() || !irqs_disabled(=
))
> +=09=09da_handle_start_run_event(owner, resched_exit_irqexit);
> +=09else
> +=09=09da_handle_start_event(owner, resched_exit_irqexit);

What's the added value of this logic? As far as I see from the model,
resched_entry is only available from the initial state and reschd_exit
is always going to the initial state.

You don't need to set both up, since both are equally likely, you're
eventually getting to start the monitor anyway.
But in case you really want a start from both, I'd say you can do:
* resched_entry -> handle_start_run (we are in init and handle)
* resched_exit -> handle_start (we are now in init, handle next event)

No need for any further condition.
Or am I missing something?

> +}
> +
> +static void probe_resched_entry(void *data, struct task_struct *owner,
> +=09=09=09=09unsigned long pc, bool irq_off)

Do you really need this level of indirection?
Just give all arguments to handle_* and drop the probe_*

> +{
> +=09handle_resched_entry(data, owner);
> +}
> +
> +static void probe_resched_exit(void *data, struct task_struct *owner,
> +=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long pc, bool irq=
_off)
> +{
> +=09handle_resched_exit(data, owner);
> +}

Thanks,
Gabriele

