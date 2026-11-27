Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768062;
	b=oY7FO5fW+AF+gzM3MEwY55yYk6Tka7v/TdZJgedyphbLNXKazQUwIgzVTv4B1Nqokyd8
	 FKK6OiYo8IE3Jle5hTPD2vfxJwbE6WNFGPps5JxMEbcuOu7MrVCHKDNEVADfum9o8Ycvk
	 ZjVhnU+kgEbvqMCu4KQjQIoHSViG7uXr6Eja3tZdPWdp3LFLWxHgoKkIXJdnr9p5rHXOC
	 qhdsQvJgtmMK2HZqGDSZWW/WArmKH96o5cER+YmyxLMqAPD/exLcZd+fOkOoTCtGIxf5/
	 Z3KI2SVIaINCABjlD82TkPcOwqQFs3iB5lKa4niXPJfoPhTK1O5aLv/i/6g5uTFe7sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768062;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=SxaqJRgRU9lhQE08/YFU2De44zTG7wSWXgQ5bbce0Pk=;
	b=0RG+dYvVCdWh7RxBEA6W0dARzEzzgjUaRkCB5Nt87S48QUlmLjuUAQOeC2RU5cmsfX0F
	 TQ7rMV19i7Xv0Nj2WrZ6Hv68bGV8mglGqC+vnWgA8FdKjM35bLZySNy7EhHWHg/ko0WV2
	 AAK28wdVNZz1hoTwdBgepFyQuX0eKsCaFlpbcYnj7guhq0iMbNxOui7NGHbdTyKBk4tvm
	 r/28Z0RxRr2JTlxNW1YAJMoeXMFtfwtr6nJkWgB1xJwvnegbzv3XCCeoLLX0sEbY1vQla
	 SPqVKKEmigZ3EWViXVkmXZA1aWgV2l2CRpym9fgM9/GZh5GEkxf/oNy06BWsFRJx5Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EAdjWA9a;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XViJCix4;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FDF606A31E
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 08:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99FDF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EAdjWA9a;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XViJCix4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795768060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SxaqJRgRU9lhQE08/YFU2De44zTG7wSWXgQ5bbce0Pk=;
	b=EAdjWA9aPa+p5Z11ox/bI7IlIIVpIFIGYHevkGuXIyU9wrhZ2iwv1V6utsFfHzYV2e6le7
	hkP3gNbMAI30KZlgf6vwAUFl4ftnBs8joFh78c3A/Xm3uqksErpzt2V+8W7tL4XGMKcR6Y
	fNmZltIN5eQTDPDO6YzO6QQElKQOpHY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-xqTIdEJnPQ2bLEy621ujog-1; Fri, 27 Nov 2026 08:27:38 +0000
X-MC-Unique: xqTIdEJnPQ2bLEy621ujog-1
X-Mimecast-MFC-AGG-ID: xqTIdEJnPQ2bLEy621ujog_1795768057
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a359c7f47bso64556715e9.2
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 00:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795768057; x=1796372857; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SxaqJRgRU9lhQE08/YFU2De44zTG7wSWXgQ5bbce0Pk=;
        b=XViJCix4Lit2FrWSfURaRWvQ4s8fMxUzboCDkqBYcjW1JlXA+XfTIghHWKRny9ITaa
         Bk+vXor7lIbpnk6+qwKzGVtyPsOi/tDBAMoishNEgbs8/LgKXct56hohtPDyO88pwXqK
         aLekpvvd140T1rGqyGVgDNW9E5Vwcac+33xEASa7PUirDhXzAf2ldM2fdaBA6JP95PIk
         MdOYMkiwd5xtPrhrk7z3TkFBsH505oYDb6eFkeOzNMinWpzcjYI3Lm3WO29rtkDl+tAk
         UBh/ziQTTrCLn8RJaXM0cARB2AZtHpcJqHFk8KIEdR20kYuT+zoh0+Nv+7x25bPxGL23
         5UMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795768057; x=1796372857;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SxaqJRgRU9lhQE08/YFU2De44zTG7wSWXgQ5bbce0Pk=;
        b=dWv0NEA5FuSEg8ReGt3UEDfW5tId1ou7kspbz2o+vF7Y9PwCUieTEr09eVWSQgOJ9w
         BwSEX/jhYVhltSifWGmqfcIfAbucHH2V3w4uwM/4vnH8rRZd8SkgvaLumikux78/FA9T
         jjlu06EowVsCGLsFagx3hhPxRKISxYNrkVjlJlXnCvD47R0jZezSK2dW2oIEwdS7YaDB
         IvIf7WusC+ruUgpCtY7S7YwrKiwdn6RQTyLHV2QsQGcfdgVVzRqIDZ6qY1iOADhyr5Ki
         m9MkjDF5Ra0WbAp7CQY2BI5E3G7xvy/QhABa9IVxMHFFy14Ki3xqps0bEldSyv6WDSYE
         ZKXQ==
X-Forwarded-Encrypted: i=1; AL+hErETIQOmiDjWwAIBpT053n7UUV1Yt/KswE7iwEQpYwJDraqhs24gCY1y6gGBYcPP6WDo7CT4En0xOrc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IJIzWX8rTM3GzMXmH3lOawUO7dxIThZ5QXsUFcqmNdVOjebxi
	eHq3sce7PgrQfKULCY8jNfii7vfZRE70kM1GRZdAPo4L3DbY5LUy/wSpECYyjuCUio2By1zfyFy
	B1+++DnwoY7uXIN81f5jK1t+Jwjjqe9AzffekB2wHi0Y4DhGaK46cd/sL2g1lWw==
X-Gm-Gg: AZFdTZfyAiSXHF8DJXQ9wYB6hFeKg2RIBGCLujrCmXrQIs6CB5V75lbv7g71O7D19OM
	P3lBHxUCM+btZI4z1L2zOhzdjnEugDTsOoebrzD6MZ+hTtmGXwsvjX4N/VmfRVmAZEuqRYwORWB
	The6+gDjLRyvrqneqoiAFGa/FIG432TRgTqGuCRcyxhDnRlKBv2mqMcZYY6TUxud6RzQ4j3XJIn
	Q4bGCpa4Z2Uu4CWuXTbQshSplOu0j+KF/aHq2mMhhnaQgBHNefAZuU6a0G9fVHSqS5enU+R0UtG
	Q7XIHio8JWzu/XKFDKivDCCDaVWhSDYQMQ5bqEamYotcNcvtru4eUcdGZOmSEsJF49izo48iBxR
	SYmbNrtyG/9lRdYRKDHL7mLv+Blq5QZmqWWZTN3CeKUolrc8DTZZixDpRL2umN6OvxomkNWNLmP
	NC
X-Received: by 2002:a05:600c:3b94:b0:4bb:6f41:39be with SMTP id 5b1f17b1804b1-4bb8880ca3cmr589964515e9.15.1795768057013;
        Fri, 27 Nov 2026 00:27:37 -0800 (PST)
X-Received: by 2002:a05:600c:3b94:b0:4bb:6f41:39be with SMTP id 5b1f17b1804b1-4bb8880ca3cmr589963995e9.15.1795768056658;
        Fri, 27 Nov 2026 00:27:36 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bbab390cf5sm180472695e9.7.2026.11.27.00.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:27:36 -0800 (PST)
Message-ID: <6ee9fd02caec10b09c8f25913a2c0e619f5dd4e7.camel@redhat.com>
Subject: Re: [PATCH v4 3/4] rv: collect per-edge dwell time for per-cpu
 DA/HA monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: Tobias Schaffner <tobias.schaffner@siemens.com>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Randy
 Dunlap <rdunlap@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers	 <mathieu.desnoyers@efficios.com>,
 linux-trace-kernel@vger.kernel.org, 	linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 rpm@xenomai.org, jan.kiszka@siemens.com, Shuah Khan	
 <skhan@linuxfoundation.org>
Date: Fri, 27 Nov 2026 09:27:33 +0100
In-Reply-To: <20261127070545.64265-4-tobias.schaffner@siemens.com>
References: <20261127070545.64265-1-tobias.schaffner@siemens.com>
	 <20261127070545.64265-4-tobias.schaffner@siemens.com>
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

On Fri, 2026-11-27 at 08:05 +0100, Tobias Schaffner wrote:
> @@ -110,10 +111,11 @@ static inline void da_monitor_reset(struct da_monit=
or
> *da_mon)
> =C2=A0 *
> =C2=A0 * The monitor will ignore all events until monitoring is set to tr=
ue. This
> =C2=A0 * function needs to be called to tell the monitor to start monitor=
ing.
> + * @state is the initial state, stamped with its entry time if known.
> =C2=A0 */
> -static inline void da_monitor_start(struct da_monitor *da_mon)
> +static inline void da_monitor_start(struct da_monitor *da_mon, da_state_=
t
> state)

So the idea is that monitors using da_handle_start_run_event() would end up=
 with
a few nanoseconds more in their initial state instead of a 0. Right?
Maybe more if preemption is possible.

I don't particularly like changing the prototype of da_monitor_start(). It =
isn't
used by existing monitors, but is a public API, so I don't want to send the
message that monitors can start from any state.

We could either:
1. document this timing discrepancy and live with it
2. reset the timestamp just after da_monitor_start() (done only once)
3. create another da_monitor_start_notime() (can share code in a
__da_monitor_start())

What do you think?

Thanks,
Gabriele

> =C2=A0{
> -=09da_mon->curr_state =3D model_get_initial_state();
> +=09da_mon->curr_state =3D state;
> =C2=A0=09da_monitor_init_hook(da_mon);
> =C2=A0=09/* Pairs with smp_load_acquire in da_monitoring(). */
> =C2=A0=09smp_store_release(&da_mon->monitoring, 1);
> @@ -276,6 +278,11 @@ static inline void da_monitor_reset_state_all(void)
> =C2=A0 */
> =C2=A0static inline int da_monitor_init(void)
> =C2=A0{
> +=09int retval =3D rv_edge_stats_create(rv_this.root_d);
> +
> +=09if (retval)
> +=09=09return retval;
> +
> =C2=A0=09da_monitor_reset_state_all();
> =C2=A0=09return 0;
> =C2=A0}
> @@ -287,6 +294,7 @@ static inline void da_monitor_destroy(void)
> =C2=A0{
> =C2=A0=09da_monitor_reset_all();
> =C2=A0=09da_monitor_sync_hook();
> +=09rv_edge_stats_remove();
> =C2=A0}
> =C2=A0
> =C2=A0#ifndef da_implicit_guard
> @@ -689,9 +697,11 @@ static inline void da_trace_error(struct da_monitor
> *da_mon,
> =C2=A0static inline bool da_event(struct da_monitor *da_mon, enum events =
event,
> da_id_type id)
> =C2=A0{
> =C2=A0=09enum states curr_state, next_state;
> +=09da_state_t old;
> =C2=A0
> -=09curr_state =3D READ_ONCE(da_mon->curr_state);
> +=09old =3D READ_ONCE(da_mon->curr_state);
> =C2=A0=09for (int i =3D 0; i < MAX_DA_RETRY_RACING_EVENTS; i++) {
> +=09=09curr_state =3D da_state_of(old);
> =C2=A0=09=09next_state =3D model_get_next_state(curr_state, event);
> =C2=A0=09=09if (next_state =3D=3D INVALID_STATE) {
> =C2=A0=09=09=09react(curr_state, event);
> @@ -699,7 +709,8 @@ static inline bool da_event(struct da_monitor *da_mon=
,
> enum events event, da_id_
> =C2=A0=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 model_get_event_na=
me(event), id);
> =C2=A0=09=09=09return false;
> =C2=A0=09=09}
> -=09=09if (likely(try_cmpxchg(&da_mon->curr_state, &curr_state,
> next_state))) {
> +=09=09if (likely(da_state_try_commit(&da_mon->curr_state, &old,
> +=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 next_state, event)))=
 {
> =C2=A0=09=09=09if (!da_monitor_event_hook(da_mon, curr_state, event,
> next_state, id))
> =C2=A0=09=09=09=09return false;
> =C2=A0=09=09=09da_trace_event(da_mon,
> model_get_state_name(curr_state),
> @@ -737,7 +748,7 @@ static inline bool __da_handle_start_event(struct
> da_monitor *da_mon,
> =C2=A0=09if (!da_monitor_enabled())
> =C2=A0=09=09return 0;
> =C2=A0=09if (unlikely(!da_monitoring(da_mon))) {
> -=09=09da_monitor_start(da_mon);
> +=09=09da_monitor_start(da_mon,
> da_state_entered(model_get_initial_state()));
> =C2=A0=09=09return 0;
> =C2=A0=09}
> =C2=A0
> @@ -751,8 +762,9 @@ static inline bool __da_handle_start_run_event(struct
> da_monitor *da_mon,
> =C2=A0{
> =C2=A0=09if (!da_monitor_enabled())
> =C2=A0=09=09return 0;
> +=09/* In the initial state since an unknown time: do not time it. */
> =C2=A0=09if (unlikely(!da_monitoring(da_mon)))
> -=09=09da_monitor_start(da_mon);
> +=09=09da_monitor_start(da_mon, model_get_initial_state());
> =C2=A0
> =C2=A0=09__da_handle_event_common(da_mon, event, id);
> =C2=A0
> diff --git a/include/rv/edge_stat.h b/include/rv/edge_stat.h
> index 8b99e8520e1e..16c28aedabdd 100644
> --- a/include/rv/edge_stat.h
> +++ b/include/rv/edge_stat.h
> @@ -145,7 +145,10 @@ static void rv_edge_stats_remove(void)
> =C2=A0=09rv_this_stats_file =3D NULL;
> =C2=A0}
> =C2=A0
> -/* A zero timestamp marks resets, which can run on a different CPU. */
> +/*
> + * A zero timestamp marks an unknown entry time: resets can run on a
> different
> + * CPU, and da_handle_start_run_event() starts in a state entered earlie=
r.
> + */
> =C2=A0#define da_state_entered(s)=09da_state_pack((s), local_clock())
> =C2=A0
> =C2=A0static __always_inline void
> diff --git a/include/rv/ha_monitor.h b/include/rv/ha_monitor.h
> index 6e1c7fe5449a..78d1bb80aefd 100644
> --- a/include/rv/ha_monitor.h
> +++ b/include/rv/ha_monitor.h
> @@ -312,7 +312,7 @@ static inline void __ha_monitor_timer_callback(struct
> ha_monitor *ha_mon)
> =C2=A0=09if (unlikely(READ_ONCE(ha_mon_destroying)))
> =C2=A0=09=09return;
> =C2=A0=09/* Ensure consistent curr_state if we race with da_monitor_reset=
 */
> -=09curr_state =3D smp_load_acquire(&ha_mon->da_mon.curr_state);
> +=09curr_state =3D da_state_of(smp_load_acquire(&ha_mon-
> >da_mon.curr_state));
> =C2=A0=09if (unlikely(!da_monitor_handling_event(&ha_mon->da_mon)))
> =C2=A0=09=09return;
> =C2=A0

