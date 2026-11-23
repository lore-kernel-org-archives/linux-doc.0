Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421958;
	b=je/0BibQEJ60DugT5KenTLvdWBQQktYEDx3WNoFfNyKi+LQuNYxuTVMno8ahH60RUvid
	 cJQSSGHPW36SRGaBlIP3AlS5LEQHSAYdKCT2K/JiXut282RB3hGpkXDtpx6nt11U1BFFi
	 ozu3BV9tuXSYJ5chphwQ2oxsjYfKFh6fkbLNd/FO5cSmDvhLSF5vlYz1EaitX2mel+Z/d
	 eMQv9Jqa7bDUe7kx5micPQL41YUu09wiwpyNr19BHGae3yMQla8Dy5oGH1FF06Dc1FZEX
	 nP9vdEmU/M1YZ9bPahcd7/lsJLTG0FmCje4zvcu8hOY1BZrL2bJSTusjgg7KEtTEqKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421958;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=9jE+uofMXoiZymIaqbcidfP1LV+ue1j2jIO0vLCpJvk=;
	b=cIIyoFOtrX0w+H1rxa/62PAKQ9LHM0G5mZqT23aVh267gNkF7yph738IxLzDPzj7AvuS
	 sEirXDB0UJ19OEpGc9/jSvvrv0mdTrtpOeO9+C7J/niZCQA2IobIphcQLcpdpRwHHMhu8
	 X/v/cTyaUnxYGjfsumeHQ75BFidxVNBlatJ1+iZTQoGD996XYVaFXfhDJXcW1HGUiPL6+
	 ImPDgPioVqANs6bjVK9emkaqVIo2XS+tvUtgE9C9DGcrewrb3NetiPOMdSMhZ1zRFU7Zq
	 ZAIRm/i/OEvZEMXOa1mezmVuQ9BIGONFTHlbmvYSUifYNml+bILu1s8YP7kAtiqtucw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GzOGyHkU;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="C/HjaBH0";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98937606A31A
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 08:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98937606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GzOGyHkU;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=C/HjaBH0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795421956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9jE+uofMXoiZymIaqbcidfP1LV+ue1j2jIO0vLCpJvk=;
	b=GzOGyHkUZXgCxd4vaHgTOjjf1VLEVtr0wrrXaGY7EBYrWJGsuGudrTftGOid/P5/xOb3yx
	77xrHg7PZqUF3YrIEawnKq4J6geWMHAgWpS1gHK6lImHUU9DG2HeU5Z0v+N/+FCD7D5WHb
	HRtTjCNSLlOuL0dMkcLY0N3HQrTQqeM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-OpL75wyLNB2FLWBEBc058Q-1; Mon, 23 Nov 2026 08:19:13 +0000
X-MC-Unique: OpL75wyLNB2FLWBEBc058Q-1
X-Mimecast-MFC-AGG-ID: OpL75wyLNB2FLWBEBc058Q_1795421953
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4a68703d177so1267412f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 00:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795421952; x=1796026752; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9jE+uofMXoiZymIaqbcidfP1LV+ue1j2jIO0vLCpJvk=;
        b=C/HjaBH03iWAtdLmxWFN2An/aXGd516gPLSr04eU78BljXlPBSSKdfFnk4ShKfjg9a
         7if0XbFestA1HHI9g6hwbUH4IhwXIJ5CDlr5vbzYzvrrYiBrihBYrp08RUjdAnZ7xdGr
         6qGacTGUEyVKEwgcTXFHZkPVgEFbvpa0835TwrSwng+23iXkbjhlasdWTe28e21vHr7Z
         bpRZUMk/+/TLTU5yvxGn8vpOzRz7ddkS98vnrAEcfrHW/9Hovljdp16yF6KzINNfm/9B
         yyS0SWYXJjrtIFfB94e/9znXdCqwzBmo9icsmficllNTW7hrlpr5qUKrwtHYdyBHHyF1
         9Hsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795421952; x=1796026752;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9jE+uofMXoiZymIaqbcidfP1LV+ue1j2jIO0vLCpJvk=;
        b=otpfE6/QbIFa2o64Dm8vaDAq91k9uU4ro5bkaofzVGLCzMOeVBB2CMbN9xqbO1bM99
         LbjDUeW71BmJly7Hjx69lOVGfIuV7coPd2mPS+haBZRIIdFeoGaachWS3iHPQb/pxzBt
         pOil6SjzUOks9QZeSvJQQi+bMTc4ix1vKucguwP6OKEjtN1W8xAQ0TMY91uLv6NEa19x
         ZMY3xr2zGdl4kFm/cJvgD8UhB0IQet5qem3BHYckhliDooMo1cGSFawKDe4ffcksD7Lk
         u91LSDsrynOYgkGVM3vM6oDqNAZIT3rfUbikX02xmyhsMBw0sSDpmcYJRSL8oA7LpRg4
         3R2Q==
X-Forwarded-Encrypted: i=1; AL+hErFZNZTo24gCjTNm6m757NAtBeqpc28Nv3C93c0XlbFc7e201jr5sgWJDXlpHTlgZealOh21Ksm8DmA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pDE0v1xexvAK3ys6nSvUHarW3AhMkgy/7cTg5mbWG5pUfFISH
	P9AH7xWGzbrBfLYdSPjzvLbEJEKCV2cQWb9wTcFfhtZEJyWaTi8OvTA91gOvFnBnN0oA77Ez0SZ
	eMs+VHeH5yAFT/dSF1352UEs6bBB8Lo8yqhrZ4L9TKcM52kG36taBPg53A9hVjw==
X-Gm-Gg: AZFdTZdHAMv70c/byb8x8RLY7G7PocPWTf8QOZyLknQpNf2UEAQF62GX1gKo2CBlUFN
	w+y6cxLg6b/Ugi/4i+rogWj75GgGmUmaIdqTv4gk1P8EUyJxToGES149m87+l8PX0xjM+eDuqxl
	c9PJ42azSkUHUHn2md20Qly0uFYvnhMd2bHC2iKHwK5qcBNmHQjmaorzrsP+pMwIY+Nym2UfvPl
	ZkYz55Sdj3Ksj9xGZs6pQiKx+yzdLvVCXkwULfHKgD44DKHOCbn1531USqfuWuLaRyAmuxRAr5x
	Wd6ginpSsGRaEuKFDAYxVi0H2vvijYlmxNqUozHBycqlLvyBKUwls1g4yfGMQybjTpgGve1Phvx
	RiDiigm1S/Cy/Ps/+WlSN1jjxsiHW/CPJ0ilSfsRAWIbVGZIGiFjSh+jpkacZdSH91bpYEhi7Rw
	3S
X-Received: by 2002:a05:6000:29ce:b0:4a7:1fca:e52d with SMTP id ffacd0b85a97d-4abb0e46a88mr13607779f8f.9.1795421952525;
        Mon, 23 Nov 2026 00:19:12 -0800 (PST)
X-Received: by 2002:a05:6000:29ce:b0:4a7:1fca:e52d with SMTP id ffacd0b85a97d-4abb0e46a88mr13607762f8f.9.1795421952164;
        Mon, 23 Nov 2026 00:19:12 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c50sm20595686f8f.37.2026.11.23.00.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:19:11 -0800 (PST)
Message-ID: <adf958e52bab320a5568ae5786435979d9a904a1.camel@redhat.com>
Subject: Re: [PATCH 2/6] rv: Update monitors through a quiesce helper
From: Gabriele Monaco <gmonaco@redhat.com>
To: Wei Li <liwei1412@hotmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
	 <rdunlap@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Nam Cao <namcao@linutronix.de>
Cc: linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	liwei391@huawei.com
Date: Mon, 23 Nov 2026 09:19:09 +0100
In-Reply-To: <CY8PR19MB7009AD3DA7BC39C8D5419B1EB7682@CY8PR19MB7009.namprd19.prod.outlook.com>
References: 
	<CY8PR19MB70098BF493A3B67418C7B9ABB7682@CY8PR19MB7009.namprd19.prod.outlook.com>
	 <CY8PR19MB7009AD3DA7BC39C8D5419B1EB7682@CY8PR19MB7009.namprd19.prod.outlook.com>
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

On Wed, 2026-11-04 at 17:21 +0800, Wei Li wrote:
> From: Wei Li <liwei391@huawei.com>
>=20
> The reactor swap inlines the disable-update-re-enable pattern in
> monitor_swap_reactors_single(). The nested flag splits one helper into
> two behaviors. The container path re-enables every nested monitor,
> including the ones the user left off. This abnormal logic seems to be a
> temporary strategy from the comments.
>=20
> Add rv_update_monitor() helper with callback for generic update
> processing. A monitor is updated with it quiesced and keeps its enabled
> state, including the children of a container.
>=20
> Signed-off-by: Wei Li <liwei391@huawei.com>
> ---
> =C2=A0kernel/trace/rv/rv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 49 +++++++++++++++++++++++++++++++++++
> =C2=A0kernel/trace/rv/rv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 ++
> =C2=A0kernel/trace/rv/rv_reactors.c | 34 +++++-------------------
> =C2=A03 files changed, 58 insertions(+), 27 deletions(-)
>=20
> diff --git a/kernel/trace/rv/rv.c b/kernel/trace/rv/rv.c
> index 29f155c6968b..4e689d4590ae 100644
> --- a/kernel/trace/rv/rv.c
> +++ b/kernel/trace/rv/rv.c
> @@ -289,6 +289,19 @@ static int rv_enable_single(struct rv_monitor *mon)
> =C2=A0=09return retval;
> =C2=A0}
> =C2=A0
> +static int rv_update_single(struct rv_monitor *mon, rvmon_update_fn_t up=
date,
> void *data)

So are you passing a function and a void* only not to export enable/disable
functions?
It's probably simpler if you handle this directly in rv_reactors.c
Kinda like it is right now but with your new logic.

Thanks,
Gabriele

> +{
> +=09int retval =3D 0;
> +=09int enabled;
> +
> +=09enabled =3D __rv_disable_monitor(mon, true);
> +=09update(mon, data);
> +=09if (enabled)
> +=09=09retval =3D rv_enable_single(mon);
> +
> +=09return retval;
> +}
> +
> =C2=A0static void rv_disable_container(struct rv_monitor *mon)
> =C2=A0{
> =C2=A0=09struct rv_monitor *p =3D mon;
> @@ -321,6 +334,22 @@ static int rv_enable_container(struct rv_monitor *mo=
n)
> =C2=A0=09return retval;
> =C2=A0}
> =C2=A0
> +static int rv_update_container(struct rv_monitor *mon, rvmon_update_fn_t
> update, void *data)
> +{
> +=09struct rv_monitor *p =3D mon;
> +=09int retval =3D 0;
> +
> +=09list_for_each_entry_continue(p, &rv_monitors_list, list) {
> +=09=09if (retval || p->parent !=3D mon)
> +=09=09=09break;
> +=09=09retval =3D rv_update_single(p, update, data);
> +=09}
> +=09if (retval)
> +=09=09rv_disable_container(mon);
> +=09update(mon, data);
> +=09return retval;
> +}
> +
> =C2=A0/**
> =C2=A0 * rv_disable_monitor - disable a given runtime monitor
> =C2=A0 * @mon: Pointer to the monitor definition structure.
> @@ -355,6 +384,26 @@ int rv_enable_monitor(struct rv_monitor *mon)
> =C2=A0=09return retval;
> =C2=A0}
> =C2=A0
> +/**
> + * rv_update_monitor - update and reenable a given runtime monitor
> + * @mon: Pointer to the monitor definition structure.
> + * @update: Pointer to the monitor update callback.
> + * @data: Context data passed to the update().
> + *
> + * Returns 0 on success, error otherwise.
> + */
> +int rv_update_monitor(struct rv_monitor *mon, rvmon_update_fn_t update, =
void
> *data)
> +{
> +=09int retval;
> +
> +=09if (rv_is_container_monitor(mon))
> +=09=09retval =3D rv_update_container(mon, update, data);
> +=09else
> +=09=09retval =3D rv_update_single(mon, update, data);
> +
> +=09return retval;
> +}
> +
> =C2=A0/*
> =C2=A0 * interface for enabling/disabling a monitor.
> =C2=A0 */
> diff --git a/kernel/trace/rv/rv.h b/kernel/trace/rv/rv.h
> index 2c0f51ff9d5c..d0e89b8a66ac 100644
> --- a/kernel/trace/rv/rv.h
> +++ b/kernel/trace/rv/rv.h
> @@ -26,8 +26,10 @@ extern struct mutex rv_interface_lock;
> =C2=A0extern struct list_head rv_monitors_list;
> =C2=A0
> =C2=A0struct dentry *get_monitors_root(void);
> +typedef void (rvmon_update_fn_t)(struct rv_monitor *mon, void *data);
> =C2=A0int rv_disable_monitor(struct rv_monitor *mon);
> =C2=A0int rv_enable_monitor(struct rv_monitor *mon);
> +int rv_update_monitor(struct rv_monitor *mon, rvmon_update_fn_t update, =
void
> *data);
> =C2=A0bool rv_is_container_monitor(struct rv_monitor *mon);
> =C2=A0bool rv_is_nested_monitor(struct rv_monitor *mon);
> =C2=A0
> diff --git a/kernel/trace/rv/rv_reactors.c b/kernel/trace/rv/rv_reactors.=
c
> index ea52f50e6453..06f21bcdd6cf 100644
> --- a/kernel/trace/rv/rv_reactors.c
> +++ b/kernel/trace/rv/rv_reactors.c
> @@ -177,45 +177,25 @@ static const struct seq_operations
> monitor_reactors_seq_ops =3D {
> =C2=A0=09.show=09=3D monitor_reactor_show
> =C2=A0};
> =C2=A0
> -static void monitor_swap_reactors_single(struct rv_monitor *mon,
> -=09=09=09=09=09 struct rv_reactor *reactor,
> -=09=09=09=09=09 bool nested)
> +static void monitor_update_reactor(struct rv_monitor *mon, void *data)
> =C2=A0{
> -=09bool monitor_enabled;
> +=09struct rv_reactor *reactor =3D data;
> =C2=A0
> -=09/* nothing to do */
> -=09if (mon->reactor =3D=3D reactor)
> +=09if (mon->reactor =3D=3D data)
> =C2=A0=09=09return;
> =C2=A0
> -=09monitor_enabled =3D mon->enabled;
> -=09if (monitor_enabled)
> -=09=09rv_disable_monitor(mon);
> -
> =C2=A0=09mon->reactor =3D reactor;
> =C2=A0=09mon->react =3D reactor->react;
> -
> -=09/* enable only once if iterating through a container */
> -=09if (monitor_enabled && !nested)
> -=09=09rv_enable_monitor(mon);
> =C2=A0}
> =C2=A0
> =C2=A0static void monitor_swap_reactors(struct rv_monitor *mon, struct rv=
_reactor
> *reactor)
> =C2=A0{
> -=09struct rv_monitor *p =3D mon;
> -
> -=09if (rv_is_container_monitor(mon))
> -=09=09list_for_each_entry_continue(p, &rv_monitors_list, list) {
> -=09=09=09if (p->parent !=3D mon)
> -=09=09=09=09break;
> -=09=09=09monitor_swap_reactors_single(p, reactor, true);
> -=09=09}
> =C2=A0=09/*
> -=09 * This call enables and disables the monitor if they were active.
> -=09 * In case of a container, we already disabled all and will enable
> all.
> -=09 * All nested monitors are enabled also if they were off, we may
> refine
> -=09 * this logic in the future.
> +=09 * Update the reactor with the monitor quiesced: enabled monitors are
> +=09 * disabled, updated and re-enabled, disabled ones are only updated.
> +=09 * Children of a container keep their enabled state.
> =C2=A0=09 */
> -=09monitor_swap_reactors_single(mon, reactor, false);
> +=09rv_update_monitor(mon, monitor_update_reactor, reactor);
> =C2=A0}
> =C2=A0
> =C2=A0static ssize_t

