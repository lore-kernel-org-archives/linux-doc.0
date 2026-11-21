Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795256812;
	b=DRiGZw2Cxh14Am0JJmhVAPGH1aE/KKXGmtYqeWk8cIAKPlK8ZBUDJ1vplN+Exz8CFvjq
	 2RQsUfLZU6LqiAahbDdjCgObPAu/IRe4vKEUuwsakxdeSxM3xo0zyqgpwLiCBERphyWfE
	 asbibC3JZAYscpuVGUyZ/FloGFRq8yrH1/iu8gjBUEypCknCvipvefIkZ8p9rdD2IUV/2
	 LiIjF0kqD0/GOyJbOQL3mJkcQkm6HIo1PtuPP1vtPOHZdz1aoBUZv8QrcOi7o9s+A9tLb
	 uHllq56k7505gysLIuo0zZmXvZau/zctZaHbqXtb9be94zj+dyRhDHWgM2P/vdyDHUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795256812;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=o4cYPm4nikQRXCKmajkr5M1HuTe4y5SdQDfgOMYEdEQ=;
	b=QNhw3QQeiiUZv/p5Tbb47o/gyDHMnisyIhT0tKpNwWOM4Aw9VmB7VrF7vcT22kdVozpR
	 UJ60qkvSAmiOI/11KTsSKOqyyvOWxjL8SFPeepyvP5TXfNiNEAVvF82Zp5tB1O0Jl99gr
	 rZX4amlhWpiLQx2suC7Pe2o9lxYo9IUCcj7GqlpmieGQ7UE9DA3iv+zI7mYLUj8ohJO+7
	 IMv6mQZ8V6DS27I9sx/CCT7GD0q9JjsRZeUYqapkSgL8JHk2p0q370rMHS60MsXgRtA7a
	 gTQEnmYQxj55vxeOAxT/ARHg3TpEl19sle2jImjVNAlEh6hWQ4k1MpMgktXnmDP5m4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="U5mIerW/";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gaB7QzDy;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1492F606A338
	for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 10:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1492F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U5mIerW/;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gaB7QzDy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795256811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=o4cYPm4nikQRXCKmajkr5M1HuTe4y5SdQDfgOMYEdEQ=;
	b=U5mIerW/P2+TefYsaUU3Si79wfcnaUevwIDKvepdzVNf6h47jdA4BPcFvTyRUJ5IZCCJ9d
	7hYxa8hUIPtHbE/EZ0ofuMrmYNVCyFtu++CCLCafC4H3Y1hSiDRy9FclQ7IqVgKwlUeolA
	7TGUiCfuSCq0c7GRlfpCVk5N2nyphns=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-dmthUKQfOiOmpcN2Lvt2lw-1; Sat, 21 Nov 2026 10:26:48 +0000
X-MC-Unique: dmthUKQfOiOmpcN2Lvt2lw-1
X-Mimecast-MFC-AGG-ID: dmthUKQfOiOmpcN2Lvt2lw_1795256808
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a35e1d2dddso14604375e9.0
        for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 02:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795256807; x=1795861607; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o4cYPm4nikQRXCKmajkr5M1HuTe4y5SdQDfgOMYEdEQ=;
        b=gaB7QzDyzvvVNfn+EoNpc++kSPVrbtuDYK1ssBsZIITP/j+uc+QwGqOtgFaP8/6ybf
         zzK6NU1DeChboDKDBowB0njamB5lzCHGfF8OeoJNiS6lcqEbur2m8UrGvt2cQXOhIOud
         FynS+UcuHrA6jKX32O58aVUA0Cn7fJXFsb7L5h+4kFbSGqbi/gAZDRkW8f2F9VcTFfm7
         9xvh3yOX0TnksPVj6kZ0j1/JFBeKe284yjXDwTUPiW/51H0ReYmPzruNWs6X0zqafQV7
         BLnLSvwfUlAXc1ewbIfXWoIIprT9HhPztkL7yosTPAeL9TDuebRHJQwa+YVUmbqQ/MAw
         gEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795256807; x=1795861607;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o4cYPm4nikQRXCKmajkr5M1HuTe4y5SdQDfgOMYEdEQ=;
        b=GrAyFTPl5htwJdFP+594FIZw7mBEESdWqBIFtMc/hROXkf1IzScajeUY/G3WhIxCPP
         27/rfuTBzGs1t1OsksjvroviJtQylEHKl5lNsOM5HvozeHiIGdTu8jLcqowEn2xieS5Y
         MQOi+f+R/ywTnX9pI//4/HrLnTly+t+Dp+KRAXH+GwFE11hGtWjgMR0aAdmNozVFPhv7
         FjjwFqFN+KqF7ovWnJ05qvZ+rN9cIf/vR2dSVLVvwkWhnYCp14kcGMoPgJ0b8UpyjiW8
         9crO/qXi52bmGgWpO4tOh1EDXLw9NxxGXCrpMtO2oINSvrt4tcfjahL8bpp1vgQrWxmD
         L1/Q==
X-Forwarded-Encrypted: i=1; AL+hErH7fGDzfWhNZeM+XGgG/E+XSpZi9mVCH6BeIH/uiH8nnQBK1UKgesExgrshty3N4a2U0MG2YCWMMH8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Brj2lbJ4YzNe1LjsbMkeRtqSNd5UoRZWbj1p3nyHwij9um0dE
	huwDcSQmqP7TLEhW6A5Mzh0MdwuzQwxx3n+eoZRx16YqW6ZYo+fc6TvZh7XfAbQDvdxwolIRHI9
	i4dIKVXd7YuUZv2YQbBJvKfQn3mBta+VBg6vY2rNgz4B0w8v+A7XO4ZWEbeTaOA==
X-Gm-Gg: AZFdTZcy0XvOCj68elrnMybwUEB4M4Hu88X1ChEOlvl/Vcd6cHdTojl/ePUXtUnjNrL
	DMX5u16o/mnziPxT8EODbgBGkHfXw9iFUA8IPqsBiVWZNC/wEuWIQFXBR1LuNyX+sYzHbTKu/XZ
	uH8pyu8tpUU/iNT/jqjnMsDwJ2M8b04KQYxDUOKTuaANhK1O7Ii0PgtwGgUDpq29bVUOh9q/e2P
	CA0fQXyvQGwTqabb1KwdilmFkxEB+Q1UGmzhoDhMy8OuDIwtW4Zvw1pYHVwOfBWkwjDkz7Nh3aK
	0YiI62dArPmWIWofXWbRIadGTk6SXRsAtMG7XkXuswSOIbfa8RhvpD6hsHiFBiNte5IOhz6GTp6
	UHL1d2zEz0+L4Y4GlcZBAtQc4rjvwC0KvdQQSknoV9G1h4LeoW21GwVCVdYHuCPwHv6x+GCRmEZ
	Mn
X-Received: by 2002:a05:600c:5306:b0:4a2:5ca:767f with SMTP id 5b1f17b1804b1-4bb887c9af4mr131050175e9.4.1795256807689;
        Sat, 21 Nov 2026 02:26:47 -0800 (PST)
X-Received: by 2002:a05:600c:5306:b0:4a2:5ca:767f with SMTP id 5b1f17b1804b1-4bb887c9af4mr131049895e9.4.1795256807347;
        Sat, 21 Nov 2026 02:26:47 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9065744esm39169705e9.1.2026.11.21.02.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 02:26:46 -0800 (PST)
Message-ID: <661a3aad86b215989dfc916fa9f568c66e18a466.camel@redhat.com>
Subject: Re: [RFC PATCH v2 1/9] tracing/irq: Add generic IRQ context
 boundary tracepoints
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
Date: Sat, 21 Nov 2026 11:26:44 +0100
In-Reply-To: <20261107171252.25090-2-kmehltretter@gmail.com>
References: <20261107171252.25090-1-kmehltretter@gmail.com>
	 <20261107171252.25090-2-kmehltretter@gmail.com>
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
> =C2=A0void __local_bh_disable_ip(unsigned long ip, unsigned int cnt)
> =C2=A0{
> +=09unsigned long trace_flags =3D 0;
> =C2=A0=09unsigned long flags;
> +=09bool trace_serving;
> =C2=A0=09int newcnt;
> =C2=A0
> =C2=A0=09WARN_ON_ONCE(in_hardirq());
> @@ -200,6 +202,16 @@ void __local_bh_disable_ip(unsigned long ip, unsigne=
d int
> cnt)
> =C2=A0=09=09}
> =C2=A0=09}
> =C2=A0
> +=09/*
> +=09 * A serving interval starts here, before handle_softirqs(). When its
> +=09 * entry is traced, keep IRQs and task switches from observing the
> bit
> +=09 * before the event. Any blocking BH lock was acquired above.
> +=09 */
> +=09trace_serving =3D (cnt & SOFTIRQ_OFFSET) &&
> +=09=09=09trace_softirq_context_entry_tp_enabled();
> +=09if (trace_serving)
> +=09=09local_irq_save(trace_flags);
> +
> =C2=A0=09/*
> =C2=A0=09 * Track the per CPU softirq disabled state. On RT this is per C=
PU
> =C2=A0=09 * state to allow preemption of bottom half disabled sections.
> @@ -233,15 +245,27 @@ void __local_bh_disable_ip(unsigned long ip, unsign=
ed
> int cnt)
> =C2=A0=09=09=09raw_local_irq_restore(flags);
> =C2=A0=09=09}
> =C2=A0=09}
> +
> +=09if (trace_serving) {
> +=09=09trace_softirq_context_entry_tp(!!in_serving_softirq(),
> false);

Probably someone more experienced with this code can comment whether the
tracepoints and other things you do make sense, you're going to need an
ack from these folks anyway.

From the tracing point of view. You're doing good avoiding any extra
action if trace_##_enabled() is false. Since you are already checking
for it, you may simplify the call to the tracepoint, essentially

 trace_##_tp() <=3D> if (trace_##_enabled()) trace_call__##_tp()

As you see, you're basically checking for the static key twice. Not a
big deal but you can use the new API and skip it:

  s/trace_softirq_context_entry_tp/trace_call__sched_set_state_tp/

Obviously you do the trace_call__##_tp() function ONLY if you're already
checking the static key.

> +=09=09local_irq_restore(trace_flags);
> +=09}
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(__local_bh_disable_ip);
> =C2=A0
> =C2=A0static void __local_bh_enable(unsigned int cnt, bool unlock)
> =C2=A0{
> +=09bool entering =3D (cnt & SOFTIRQ_OFFSET) && !in_serving_softirq();
> +=09bool trace_exiting =3D (cnt & SOFTIRQ_OFFSET) && !entering &&
> +=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 trace_softirq_context_exit_tp_enabled(=
);
> =C2=A0=09unsigned long flags;
> =C2=A0=09bool sirq_en =3D false;
> =C2=A0=09int newcnt;
> =C2=A0
> +=09/* Callers already disabled IRQs around the counter and its events.
> */
> +=09if (trace_exiting)
> +=09=09trace_softirq_context_exit_tp(!!in_serving_softirq(), false);

Here as well, you're checking so you can simply trace_call()

> +
> =C2=A0=09if (IS_ENABLED(CONFIG_PREEMPT_RT_NEEDS_BH_LOCK)) {
> =C2=A0=09=09DEBUG_LOCKS_WARN_ON(current->softirq_disable_cnt !=3D
> =C2=A0=09=09=09=09=C2=A0=C2=A0=C2=A0 this_cpu_read(softirq_ctrl.cnt));
> @@ -276,6 +300,18 @@ static void __local_bh_enable(unsigned int cnt, bool
> unlock)
> =C2=A0=09=09=09WARN_ON_ONCE(current->softirq_disable_cnt < 0);
> =C2=A0=09=09}
> =C2=A0=09}
> +
> +=09/*
> +=09 * An exit probe can raise a softirq while serving state still
> suppresses
> +=09 * the normal ksoftirqd wakeup. Hand it off once no outer BH-disable
> +=09 * reference remains.
> +=09 */
> +=09if (trace_exiting && sirq_en && unlikely(local_softirq_pending()))
> +=09=09wakeup_softirqd();
> +
> +=09/* local_bh_enable() can turn BH-disabled state into serving state.
> */
> +=09if (entering)
> +=09=09trace_softirq_context_entry_tp(!!in_serving_softirq(),
> false);

Here for example, entering doesn't check the static key so you must keep
the tracing as is.

> =C2=A0}
> =C2=A0
> =C2=A0void __local_bh_enable_ip(unsigned long ip, unsigned int cnt)
> @@ -640,11 +676,15 @@ static void handle_softirqs(bool ksirqd)
> =C2=A0=09 */
> =C2=A0=09current->flags &=3D ~PF_MEMALLOC;
> =C2=A0
> -=09pending =3D local_softirq_pending();
> -
> =C2=A0=09from_irq_exit =3D softirq_handle_begin();
> =C2=A0=09in_hardirq =3D lockdep_softirq_start();
> =C2=A0=09account_softirq_enter(current);
> +=09if (!IS_ENABLED(CONFIG_PREEMPT_RT))
> +=09=09trace_softirq_context_entry_tp(!!in_serving_softirq(),
> +=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from_irq_exit);
> +
> +=09/* Include work raised by the context-entry event. */
> +=09pending =3D local_softirq_pending();
> =C2=A0
> =C2=A0restart:
> =C2=A0=09/* Reset the pending bitmask before enabling irqs */
> @@ -692,6 +732,14 @@ static void handle_softirqs(bool ksirqd)
> =C2=A0=09=09wakeup_softirqd();
> =C2=A0=09}
> =C2=A0
> +=09if (!IS_ENABLED(CONFIG_PREEMPT_RT) &&
> +=09=C2=A0=C2=A0=C2=A0 trace_softirq_context_exit_tp_enabled()) {
> +=09=09trace_softirq_context_exit_tp(!!in_serving_softirq(),
> +=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from_irq_exit);
> +=09=09/* The final pending-work decision above has already
> completed. */
> +=09=09if (unlikely(local_softirq_pending()))
> +=09=09=09wakeup_softirqd();
> +=09}
> =C2=A0=09account_softirq_exit(current);
> =C2=A0=09lockdep_softirq_end(in_hardirq);
> =C2=A0=09softirq_handle_end(from_irq_exit);
> @@ -722,6 +770,7 @@ void irq_enter_rcu(void)
> =C2=A0=09=09tick_irq_enter();
> =C2=A0
> =C2=A0=09account_hardirq_enter(current);
> +=09trace_hardirq_context_entry_tp(hardirq_count() >> HARDIRQ_SHIFT);

Here again, no check, so keep it as is.

Thanks,
Gabriele

