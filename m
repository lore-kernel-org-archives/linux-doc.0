Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC8C48AE34
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 13:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782911515; cv=none; b=IWZY6hwuOU71vMLrcLtLm7XlGtGLNOwESYXqJAcZuwbqSa5HblbYEsYHkC0bYfGBFRZjhO+Dvk4BjT+T5LAtIuMtJ3novk5qIdrrznsKLYkI4ISEcGtRgISDEVUkJOSfetz5WBcu5zdMzYUrdPykU69kp6RZZKYPnvX+jlDh7t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782911515; c=relaxed/simple;
	bh=SaVIdm5ltW/d1p4HAoF10IoSMzzzMzCzlQiv0hpoL+M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EA8038TbAVBxFfyCz/0xw1hM60BK1swvCeir738L3Je6d2h/FosXNtBTZKW2NLCvzCaADfNzlNUcj9nnxovNe6g21LosVt0wDOJs3PSl5UZ52e4fVW/GtYJACiLPQ6Jn3LaSB1xi0Ee42Mymk2i6H0+rSKyQHTNiJFfB+x6XXYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fjtec6vH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xdhce9CR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fjtec6vH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xdhce9CR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782911512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Yt0xBCqeWoRJYvuEg2PYnPwtGvcwgU1CZOMs8phmh8g=;
	b=Fjtec6vHioucRbNHPJGFx1SIN+y/swJSIFCJuwte2ivFRVWEAMHk+fQ1rYZTqoWotxoEOj
	Edmurwxl5X27jp6athr+q9RC/xSv8w6h83LJIaDiyJv8x/Z/ENdbw+IAWNB+dBW3INVCld
	4TaThOhBiikadsh0++8Il0zbHdaLCWo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-NEwhhDExOomC8gtKj3y42Q-1; Wed, 01 Jul 2026 09:11:51 -0400
X-MC-Unique: NEwhhDExOomC8gtKj3y42Q-1
X-Mimecast-MFC-AGG-ID: NEwhhDExOomC8gtKj3y42Q_1782911510
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-493b54823bdso12598055e9.0
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 06:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782911510; x=1783516310; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yt0xBCqeWoRJYvuEg2PYnPwtGvcwgU1CZOMs8phmh8g=;
        b=Xdhce9CRuopMurgJxA1WXgycfZSa4vuRq0tiIGd4utisl+MvgrdFKHfGizXzU8a4hv
         s10+kAYq3lrZhCZrJ6uE5NAlqHXatNLMmZZmSDF4yWhjoV2XYGcLbQJlbdd+jMcsTzts
         jveHwq+gEo1T9wbe8wBHKZaAv44kefJBlcjm+YglmNTLQdMN3dhZTr6jaTeQhCN2ULzL
         P5nPb3U+IpNmOkLBUSirY1NmBQx+FaYK++aNwRSUg8mDnW3dfGCh5Dd3+bri356eZagu
         m37fgyJ9lKrC989KEbhVrccVN9kvL7iZqb8ETNLduNTHSNlHrk1HmCqQIl8kDFz1QgkN
         oJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782911510; x=1783516310;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yt0xBCqeWoRJYvuEg2PYnPwtGvcwgU1CZOMs8phmh8g=;
        b=G4XrckcXwI+8VSFjNQFfGf8cEyeTzlBQX1zhHd3TBzmdyetK6AX0a3gvOVMRDP1Jy+
         p284Hy/oY6/5eJtcl53/XZbJRo2gi+KedBzklBclzn9xq/mbT1j0aiGAx4rMDXwIA8T5
         181yNfk3iIzL1u862/L3AltOycWUYGSUpymy0Ow3CReqmm441nvN8kER/aqP4AGtkEAk
         5KQrp1MK5zyeJjw5vUXp+Cvgq7SyXmUSKUP5Oize+eReZwK6X4pQMFDDRSaROLvSxtZL
         RaKBqIfm/qFSEg/vsumW3Uw/LoiWatMsGhYGhsV9pg5egUGupopaSvxnx9VzuanTNQMJ
         yqig==
X-Forwarded-Encrypted: i=1; AFNElJ/Z7RZvUIfAIg6kZXQi0cOl7KTON9ZDo7EAHf5K9Iup1TnE4dEnA+vh24vuPkOuJmyxogG995Z5+wM=@vger.kernel.org
X-Gm-Message-State: AOJu0YysHdgJukxqAF1OwCrFvM2KW7UAKryK97MfFYK8W7sMwDUINZ5l
	FObuStOtRJkaPwLEJALZknyCi0b4OtBVnbLtWPqYEwjFDU96W/kyDZs7pS/aXRWEQ1MlTLC2p3a
	0GyXpkQAn6o1bSBrWntSAJhwhT7XGSRTUp18bd9uftfZ8DpAs1LTmyEgpqFejtg==
X-Gm-Gg: AfdE7cl4Q21KAIrhUcf+1RvxN7W8J+GrKbyGOZYKO1UkQtPZzugSOXivo0ri6HnZCTx
	o2FF4VKlPOuXDJNqLPvK48vrFFwRQZzkEjoIxTdK1k0P3PZCW9ss4s+cVtwYFgmXHNM980Skx7T
	gx7yyHX7zuUoIc50EuwruI2McHWUj8wzwGux88uX/sSwdFmO44zbGxbm070kkfBUDp0VS2ovvgl
	Vsg4kb+EFu5ZgWQxRULuvy0t2vOfLcIGV/wgVo1EaMFXK4uT5iL0hTTRZQclgllUF960EI0k4fh
	PLEkVJJdkosGXQTO5smzfwc3mcwyCsmDpyaM+ca2bxRPftEuvzc4Eqn5X3ryO+KSFVat/r+sG+0
	D2I8DwWUtSR4Cgp15/Y3vdIM2QHUsE/dwolexBUCu1NFHrtEBj4f0yd1W7u3WIzGTYZg7ru06ba
	8Fzzkq
X-Received: by 2002:a05:600c:6986:b0:493:bc4a:a14d with SMTP id 5b1f17b1804b1-493c2485321mr23964785e9.19.1782911509850;
        Wed, 01 Jul 2026 06:11:49 -0700 (PDT)
X-Received: by 2002:a05:600c:6986:b0:493:bc4a:a14d with SMTP id 5b1f17b1804b1-493c2485321mr23964325e9.19.1782911509310;
        Wed, 01 Jul 2026 06:11:49 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (212-8-243-115.hosted-by-worldstream.net. [212.8.243.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef11338sm58189635e9.1.2026.07.01.06.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 06:11:48 -0700 (PDT)
Message-ID: <b33e175467a8cb8011ded2195353bc6743b4cd46.camel@redhat.com>
Subject: Re: [PATCH v2 4/4] rv/rtapp: Add wakeup monitor
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 linux-trace-kernel@vger.kernel.org, 	linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 01 Jul 2026 15:11:46 +0200
In-Reply-To: <ba5658fa13e49ada466b84a2c211f233037180b5.1781852967.git.namcao@linutronix.de>
References: <cover.1781852967.git.namcao@linutronix.de>
	 <ba5658fa13e49ada466b84a2c211f233037180b5.1781852967.git.namcao@linutronix.de>
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
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-06-19 at 09:21 +0200, Nam Cao wrote:
> Add a wakeup monitor to detect a lower-priority task waking up a
> higher-priority task.
>=20
> The rtapp/sleep monitor already detects this. However, that monitor
> triggers an error in the context of the wakee task and user only gets
> the stacktrace of that task. It is also extremely useful to get the
> stacktrace of the waker task, which this monitor offers. In other
> words, this monitor complements the rtapp/sleep monitor.
>=20
> Signed-off-by: Nam Cao <namcao@linutronix.de>

This looks good, but if I understand it correctly, the same violation shoul=
d be
spotted by both monitors from two different perspectives, but sleep catches=
 more
things (e.g. tasks using wrong sleeping ways despite their wakeup):

  # perf stat -a -e rv:error_sleep -e rv:error_wakeup -- stress-ng --cpu 5 =
--cpu-load 90 --sched rr -t 5

   Performance counter stats for 'system wide':

               285      rv:error_sleep                                     =
   =20
                20      rv:error_wakeup                                    =
   =20

Provided I don't really know what's happening down there (I just let the
stressor run free), this discrepancy is expected, right?

Thanks,
Gabriele

> ---
> =C2=A0Documentation/trace/rv/monitor_rtapp.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 20 +++
> =C2=A0kernel/trace/rv/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0kernel/trace/rv/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0kernel/trace/rv/monitors/rtapp/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0kernel/trace/rv/monitors/wakeup/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 16 ++
> =C2=A0kernel/trace/rv/monitors/wakeup/wakeup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 153 ++++++++++++++++++
> =C2=A0kernel/trace/rv/monitors/wakeup/wakeup.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 92 +++++++++++
> =C2=A0.../trace/rv/monitors/wakeup/wakeup_trace.h=C2=A0=C2=A0 |=C2=A0 14 =
++
> =C2=A0kernel/trace/rv/rv_trace.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 1 +
> =C2=A0tools/verification/models/rtapp/wakeup.ltl=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 5 +
> =C2=A010 files changed, 304 insertions(+), 1 deletion(-)
> =C2=A0create mode 100644 kernel/trace/rv/monitors/wakeup/Kconfig
> =C2=A0create mode 100644 kernel/trace/rv/monitors/wakeup/wakeup.c
> =C2=A0create mode 100644 kernel/trace/rv/monitors/wakeup/wakeup.h
> =C2=A0create mode 100644 kernel/trace/rv/monitors/wakeup/wakeup_trace.h
> =C2=A0create mode 100644 tools/verification/models/rtapp/wakeup.ltl
>=20
> diff --git a/Documentation/trace/rv/monitor_rtapp.rst
> b/Documentation/trace/rv/monitor_rtapp.rst
> index 502d3ea412eb..238b59395ff5 100644
> --- a/Documentation/trace/rv/monitor_rtapp.rst
> +++ b/Documentation/trace/rv/monitor_rtapp.rst
> @@ -124,3 +124,23 @@ to handle some special cases:
> =C2=A0=C2=A0=C2=A0=C2=A0 real-time-safe because preemption is disabled fo=
r the duration.
> =C2=A0=C2=A0 - `FUTEX_LOCK_PI` is included in the allowlist for the same =
reason as
> =C2=A0=C2=A0=C2=A0=C2=A0 `BLOCK_ON_RT_MUTEX`.
> +
> +Monitor wakeup
> +++++++++++++++
> +
> +The `wakeup` monitor reports real-time threads being woken by lower-prio=
rity
> threads,
> +which is a hint of priority inversion. Its specification is::
> +
> +=C2=A0 RULE =3D always (((RT and USER_THREAD) imply
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 (not (WOKEN_BY_LOWER_PRIO or WOKEN_BY_SOFTIRQ)) or
> ALLOWLIST))
> +
> +=C2=A0 ALLOWLIST =3D BLOCK_ON_RT_MUTEX
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or FUTEX_LO=
CK_PI
> +
> +The `sleep` monitor already reports this type of problem. The difference=
 is
> the
> +context in which the problem is reported. While the `sleep` monitor repo=
rts
> the problem
> +in the context of the wakee, this `wakeup` monitor reports the problem i=
n the
> context of
> +the waker. This monitor complement the `sleep` monitor, giving user bett=
er
> +understanding of the issue. For instance, to debug a lower-priority task
> waking a
> +higher-priority task scenario, user can enable both `wakeup` monitor and
> `sleep`
> +monitor to get the stack traces of both tasks.
> diff --git a/kernel/trace/rv/Kconfig b/kernel/trace/rv/Kconfig
> index 3884b14df375..4d3a14a0bac2 100644
> --- a/kernel/trace/rv/Kconfig
> +++ b/kernel/trace/rv/Kconfig
> @@ -76,6 +76,7 @@ source "kernel/trace/rv/monitors/opid/Kconfig"
> =C2=A0source "kernel/trace/rv/monitors/rtapp/Kconfig"
> =C2=A0source "kernel/trace/rv/monitors/pagefault/Kconfig"
> =C2=A0source "kernel/trace/rv/monitors/sleep/Kconfig"
> +source "kernel/trace/rv/monitors/wakeup/Kconfig"
> =C2=A0# Add new rtapp monitors here
> =C2=A0
> =C2=A0source "kernel/trace/rv/monitors/stall/Kconfig"
> diff --git a/kernel/trace/rv/Makefile b/kernel/trace/rv/Makefile
> index 94498da35b37..c2c0e4142eb4 100644
> --- a/kernel/trace/rv/Makefile
> +++ b/kernel/trace/rv/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_RV_MON_OPID) +=3D monitors/opid/opid.o
> =C2=A0obj-$(CONFIG_RV_MON_STALL) +=3D monitors/stall/stall.o
> =C2=A0obj-$(CONFIG_RV_MON_DEADLINE) +=3D monitors/deadline/deadline.o
> =C2=A0obj-$(CONFIG_RV_MON_NOMISS) +=3D monitors/nomiss/nomiss.o
> +obj-$(CONFIG_RV_MON_WAKEUP) +=3D monitors/wakeup/wakeup.o
> =C2=A0# Add new monitors here
> =C2=A0obj-$(CONFIG_RV_REACTORS) +=3D rv_reactors.o
> =C2=A0obj-$(CONFIG_RV_REACT_PRINTK) +=3D reactor_printk.o
> diff --git a/kernel/trace/rv/monitors/rtapp/Kconfig
> b/kernel/trace/rv/monitors/rtapp/Kconfig
> index 1ce9370a9ba8..1fcd7a400ded 100644
> --- a/kernel/trace/rv/monitors/rtapp/Kconfig
> +++ b/kernel/trace/rv/monitors/rtapp/Kconfig
> @@ -1,6 +1,6 @@
> =C2=A0config RV_MON_RTAPP
> =C2=A0	depends on RV
> -	depends on RV_PER_TASK_MONITORS >=3D 2
> +	depends on RV_PER_TASK_MONITORS >=3D 3
> =C2=A0	bool "rtapp monitor"
> =C2=A0	help
> =C2=A0	=C2=A0 Collection of monitors to check for common problems with re=
al-time
> diff --git a/kernel/trace/rv/monitors/wakeup/Kconfig
> b/kernel/trace/rv/monitors/wakeup/Kconfig
> new file mode 100644
> index 000000000000..ec3a5c06a8c4
> --- /dev/null
> +++ b/kernel/trace/rv/monitors/wakeup/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +config RV_MON_WAKEUP
> +	depends on RV
> +	depends on RV_MON_RTAPP
> +	depends on HAVE_SYSCALL_TRACEPOINTS
> +	default y
> +	select LTL_MON_EVENTS_ID
> +	bool "wakeup monitor"
> +	help
> +	=C2=A0 This monitor detects a lower-priority task waking up a
> +	=C2=A0 higher-priority task. The RV_MON_SLEEP monitor already
> +	=C2=A0 detects this case, but this monitor detects in the context
> +	=C2=A0 of the waker task instead. This and RV_MON_SLEEP can be
> +	=C2=A0 enabled together to get the stacktrace of both the waker
> +	=C2=A0 task and the wakee task.
> diff --git a/kernel/trace/rv/monitors/wakeup/wakeup.c
> b/kernel/trace/rv/monitors/wakeup/wakeup.c
> new file mode 100644
> index 000000000000..01b47416f24e
> --- /dev/null
> +++ b/kernel/trace/rv/monitors/wakeup/wakeup.c
> @@ -0,0 +1,153 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <linux/ftrace.h>
> +#include <linux/tracepoint.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/rv.h>
> +#include <rv/instrumentation.h>
> +
> +#define MODULE_NAME "wakeup"
> +
> +#include <trace/events/syscalls.h>
> +#include <trace/events/sched.h>
> +#include <trace/events/lock.h>
> +#include <uapi/linux/futex.h>
> +
> +#include <rv_trace.h>
> +#include <monitors/rtapp/rtapp.h>
> +
> +
> +#ifndef __NR_futex
> +#define __NR_futex (-__COUNTER__)
> +#endif
> +#ifndef __NR_futex_time64
> +#define __NR_futex_time64 (-__COUNTER__)
> +#endif
> +
> +#include "wakeup.h"
> +#include <rv/ltl_monitor.h>
> +
> +static void ltl_atoms_fetch(struct task_struct *task, struct ltl_monitor
> *mon)
> +{
> +	/*
> +	 * This includes "actual" real-time tasks and also PI-boosted
> +	 * tasks. A task being PI-boosted means it is blocking an "actual"
> +	 * real-task, therefore it should also obey the monitor's rule,
> +	 * otherwise the "actual" real-task may be delayed.
> +	 */
> +	ltl_atom_set(mon, LTL_RT, rt_or_dl_task(task));
> +}
> +
> +static void ltl_atoms_init(struct task_struct *task, struct ltl_monitor =
*mon,
> bool task_creation)
> +{
> +	ltl_atom_set(mon, LTL_WOKEN_BY_LOWER_PRIO, false);
> +	ltl_atom_set(mon, LTL_WOKEN_BY_SOFTIRQ, false);
> +
> +	if (task_creation) {
> +		ltl_atom_set(mon, LTL_BLOCK_ON_RT_MUTEX, false);
> +		ltl_atom_set(mon, LTL_FUTEX_LOCK_PI, false);
> +	}
> +
> +	ltl_atom_set(mon, LTL_USER_THREAD, !(task->flags & PF_KTHREAD));
> +}
> +
> +static void handle_sched_waking(void *data, struct task_struct *task)
> +{
> +	if (in_task()) {
> +		if (current->prio > task->prio)
> +			ltl_atom_pulse(task, LTL_WOKEN_BY_LOWER_PRIO, true);
> +	} else if (in_serving_softirq()) {
> +		ltl_atom_pulse(task, LTL_WOKEN_BY_SOFTIRQ, true);
> +	}
> +}
> +
> +static void handle_contention_begin(void *data, void *lock, unsigned int
> flags)
> +{
> +	if (flags & LCB_F_RT)
> +		ltl_atom_update(current, LTL_BLOCK_ON_RT_MUTEX, true);
> +}
> +
> +static void handle_contention_end(void *data, void *lock, int ret)
> +{
> +	ltl_atom_update(current, LTL_BLOCK_ON_RT_MUTEX, false);
> +}
> +
> +static void handle_sys_enter(void *data, struct pt_regs *regs, long id)
> +{
> +	unsigned long args[6];
> +	int op, cmd;
> +
> +	switch (id) {
> +	case __NR_futex:
> +	case __NR_futex_time64:
> +		syscall_get_arguments(current, regs, args);
> +		op =3D args[1];
> +		cmd =3D op & FUTEX_CMD_MASK;
> +
> +		switch (cmd) {
> +		case FUTEX_LOCK_PI:
> +		case FUTEX_LOCK_PI2:
> +			ltl_atom_update(current, LTL_FUTEX_LOCK_PI, true);
> +			break;
> +		}
> +		break;
> +	}
> +}
> +
> +static void handle_sys_exit(void *data, struct pt_regs *regs, long ret)
> +{
> +	ltl_atom_update(current, LTL_FUTEX_LOCK_PI, false);
> +}
> +
> +static int enable_wakeup(void)
> +{
> +	int retval;
> +
> +	retval =3D ltl_monitor_init();
> +	if (retval)
> +		return retval;
> +
> +	rv_attach_trace_probe("rtapp_wakeup", sched_waking,
> handle_sched_waking);
> +	rv_attach_trace_probe("rtapp_wakeup", contention_begin,
> handle_contention_begin);
> +	rv_attach_trace_probe("rtapp_wakeup", contention_end,
> handle_contention_end);
> +	rv_attach_trace_probe("rtapp_wakeup", sys_enter, handle_sys_enter);
> +	rv_attach_trace_probe("rtapp_wakeup", sys_exit, handle_sys_exit);
> +
> +	return 0;
> +}
> +
> +static void disable_wakeup(void)
> +{
> +	rv_detach_trace_probe("rtapp_wakeup", sched_waking,
> handle_sched_waking);
> +	rv_detach_trace_probe("rtapp_wakeup", contention_begin,
> handle_contention_begin);
> +	rv_detach_trace_probe("rtapp_wakeup", contention_end,
> handle_contention_end);
> +	rv_detach_trace_probe("rtapp_wakeup", sys_enter, handle_sys_enter);
> +	rv_detach_trace_probe("rtapp_wakeup", sys_exit, handle_sys_exit);
> +
> +	ltl_monitor_destroy();
> +}
> +
> +static struct rv_monitor rv_wakeup =3D {
> +	.name =3D "wakeup",
> +	.description =3D "Monitor that real-time tasks are not woken by lower-
> priority tasks",
> +	.enable =3D enable_wakeup,
> +	.disable =3D disable_wakeup,
> +};
> +
> +static int __init register_wakeup(void)
> +{
> +	return rv_register_monitor(&rv_wakeup, &rv_rtapp);
> +}
> +
> +static void __exit unregister_wakeup(void)
> +{
> +	rv_unregister_monitor(&rv_wakeup);
> +}
> +
> +module_init(register_wakeup);
> +module_exit(unregister_wakeup);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Nam Cao <namcao@linutronix.de>");
> +MODULE_DESCRIPTION("Monitor that real-time tasks are not woken by lower-
> priority tasks");
> diff --git a/kernel/trace/rv/monitors/wakeup/wakeup.h
> b/kernel/trace/rv/monitors/wakeup/wakeup.h
> new file mode 100644
> index 000000000000..6f80da64e0e1
> --- /dev/null
> +++ b/kernel/trace/rv/monitors/wakeup/wakeup.h
> @@ -0,0 +1,92 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +/*
> + * C implementation of Buchi automaton, automatically generated by
> + * tools/verification/rvgen from the linear temporal logic specification=
.
> + * For further information, see kernel documentation:
> + *=C2=A0=C2=A0 Documentation/trace/rv/linear_temporal_logic.rst
> + */
> +
> +#include <linux/rv.h>
> +
> +#define MONITOR_NAME wakeup
> +
> +enum ltl_atom {
> +	LTL_BLOCK_ON_RT_MUTEX,
> +	LTL_FUTEX_LOCK_PI,
> +	LTL_RT,
> +	LTL_USER_THREAD,
> +	LTL_WOKEN_BY_LOWER_PRIO,
> +	LTL_WOKEN_BY_SOFTIRQ,
> +	LTL_NUM_ATOM
> +};
> +static_assert(LTL_NUM_ATOM <=3D RV_MAX_LTL_ATOM);
> +
> +static const char *ltl_atom_str(enum ltl_atom atom)
> +{
> +	static const char *const names[] =3D {
> +		"bl_on_rt_mu",
> +		"fu_lo_pi",
> +		"rt",
> +		"us_th",
> +		"wo_lo_pr",
> +		"wo_so",
> +	};
> +
> +	return names[atom];
> +}
> +
> +enum ltl_buchi_state {
> +	S0,
> +	RV_NUM_BA_STATES
> +};
> +static_assert(RV_NUM_BA_STATES <=3D RV_MAX_BA_STATES);
> +
> +static void ltl_start(struct task_struct *task, struct ltl_monitor *mon)
> +{
> +	bool woken_by_softirq =3D test_bit(LTL_WOKEN_BY_SOFTIRQ, mon->atoms);
> +	bool woken_by_lower_prio =3D test_bit(LTL_WOKEN_BY_LOWER_PRIO, mon-
> >atoms);
> +	bool user_thread =3D test_bit(LTL_USER_THREAD, mon->atoms);
> +	bool rt =3D test_bit(LTL_RT, mon->atoms);
> +	bool futex_lock_pi =3D test_bit(LTL_FUTEX_LOCK_PI, mon->atoms);
> +	bool block_on_rt_mutex =3D test_bit(LTL_BLOCK_ON_RT_MUTEX, mon->atoms);
> +	bool val9 =3D block_on_rt_mutex || futex_lock_pi;
> +	bool val6 =3D !woken_by_softirq;
> +	bool val5 =3D !woken_by_lower_prio;
> +	bool val8 =3D val5 && val6;
> +	bool val10 =3D val8 || val9;
> +	bool val3 =3D !user_thread;
> +	bool val2 =3D !rt;
> +	bool val4 =3D val2 || val3;
> +	bool val11 =3D val4 || val10;
> +
> +	if (val11)
> +		__set_bit(S0, mon->states);
> +}
> +
> +static void
> +ltl_possible_next_states(struct ltl_monitor *mon, unsigned int state,
> unsigned long *next)
> +{
> +	bool woken_by_softirq =3D test_bit(LTL_WOKEN_BY_SOFTIRQ, mon->atoms);
> +	bool woken_by_lower_prio =3D test_bit(LTL_WOKEN_BY_LOWER_PRIO, mon-
> >atoms);
> +	bool user_thread =3D test_bit(LTL_USER_THREAD, mon->atoms);
> +	bool rt =3D test_bit(LTL_RT, mon->atoms);
> +	bool futex_lock_pi =3D test_bit(LTL_FUTEX_LOCK_PI, mon->atoms);
> +	bool block_on_rt_mutex =3D test_bit(LTL_BLOCK_ON_RT_MUTEX, mon->atoms);
> +	bool val9 =3D block_on_rt_mutex || futex_lock_pi;
> +	bool val6 =3D !woken_by_softirq;
> +	bool val5 =3D !woken_by_lower_prio;
> +	bool val8 =3D val5 && val6;
> +	bool val10 =3D val8 || val9;
> +	bool val3 =3D !user_thread;
> +	bool val2 =3D !rt;
> +	bool val4 =3D val2 || val3;
> +	bool val11 =3D val4 || val10;
> +
> +	switch (state) {
> +	case S0:
> +		if (val11)
> +			__set_bit(S0, next);
> +		break;
> +	}
> +}
> diff --git a/kernel/trace/rv/monitors/wakeup/wakeup_trace.h
> b/kernel/trace/rv/monitors/wakeup/wakeup_trace.h
> new file mode 100644
> index 000000000000..7e056183f920
> --- /dev/null
> +++ b/kernel/trace/rv/monitors/wakeup/wakeup_trace.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +/*
> + * Snippet to be included in rv_trace.h
> + */
> +
> +#ifdef CONFIG_RV_MON_WAKEUP
> +DEFINE_EVENT(event_ltl_monitor_id, event_wakeup,
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(struct task_struct *task, char *state=
s, char *atoms,
> char *next),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(task, states, atoms, next));
> +DEFINE_EVENT(error_ltl_monitor_id, error_wakeup,
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(struct task_struct *task),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(task));
> +#endif /* CONFIG_RV_MON_WAKEUP */
> diff --git a/kernel/trace/rv/rv_trace.h b/kernel/trace/rv/rv_trace.h
> index 9622c269789c..2f8a932432c9 100644
> --- a/kernel/trace/rv/rv_trace.h
> +++ b/kernel/trace/rv/rv_trace.h
> @@ -241,6 +241,7 @@ DECLARE_EVENT_CLASS(error_ltl_monitor_id,
> =C2=A0);
> =C2=A0#include <monitors/pagefault/pagefault_trace.h>
> =C2=A0#include <monitors/sleep/sleep_trace.h>
> +#include <monitors/wakeup/wakeup_trace.h>
> =C2=A0// Add new monitors based on CONFIG_LTL_MON_EVENTS_ID here
> =C2=A0#endif /* CONFIG_LTL_MON_EVENTS_ID */
> =C2=A0
> diff --git a/tools/verification/models/rtapp/wakeup.ltl
> b/tools/verification/models/rtapp/wakeup.ltl
> new file mode 100644
> index 000000000000..a5d63ca0811a
> --- /dev/null
> +++ b/tools/verification/models/rtapp/wakeup.ltl
> @@ -0,0 +1,5 @@
> +RULE =3D always (((RT and USER_THREAD) imply
> +		(not (WOKEN_BY_LOWER_PRIO or WOKEN_BY_SOFTIRQ)) or
> ALLOWLIST))
> +
> +ALLOWLIST =3D BLOCK_ON_RT_MUTEX
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or FUTEX_LOCK_PI

