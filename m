Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1003D3D0F
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 12:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773835213; cv=none; b=W6XKaBFdeYC3eDfUVdXJzWldpNQBVkFwbh8dIHM3gev2NAoO1olsjvB47B45HlvI7Ag6TTz7ipcMCw7xq8i68XaGkeb1YnrKzDxsKa1K4skcyYpQIcHBTAyJs90xdDsK4ob/FPsvJ9e/pqaOewKeyJfK2sqmcWGmGu1SHCqu750=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773835213; c=relaxed/simple;
	bh=NfV4LPXC/rDnS7dCcTwHMEz6UFeB2Fnshk9NZggYX78=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AKp//IcrtHigVjU6ti0hbtVLp7g81msIhUHl8FhKs2KnLlJl0jWmgC14Vn0xUb1dxVxLKrL3hQeeh0EA0co77XAlXxR8ap0TRaGbvKLbDTnx8gaLGJiZkaGyeGfxS2I4omnF/kLJeJciGQb5mRYW9mmByZgNWnmyL+ezQGRGkDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LEKtgcTN; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=syzZZ6+U; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LEKtgcTN";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="syzZZ6+U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773835211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZGC0p783LbZSoU5uLQBLRHunnE5uv+G361DRYkF9MWc=;
	b=LEKtgcTN2OhVN9S0PA/9F9/P/0UdP1x2QbPw7oaaFgoy7Bc64/NzNX6k/IYMTG/WS3P64j
	s6cbDMNGUYPSra7CMRG+ZLZE1h5OcLKteB3hoCEt0KsBeFb1sZ/jS5+LBPVn3JL13tuz8z
	fj/jKo8lUsdD+xKiSmilqeNVZ3bdmqw=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-iJXLIbNOMT2Tt-JISFg9cQ-1; Wed, 18 Mar 2026 08:00:09 -0400
X-MC-Unique: iJXLIbNOMT2Tt-JISFg9cQ-1
X-Mimecast-MFC-AGG-ID: iJXLIbNOMT2Tt-JISFg9cQ_1773835208
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-38a4c10df12so36670711fa.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 05:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773835208; x=1774440008; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZGC0p783LbZSoU5uLQBLRHunnE5uv+G361DRYkF9MWc=;
        b=syzZZ6+U3blE6pwB4W/tt7DeUV/opz4J/7JjOmk2Vc6KCW2bIeImkmAJyMdqATdPCI
         mZGieZmwXQbi7jS/OAsrFBzZ+edOnQZ+IFn+8cRYQbF7C/2Keazq9NVLShEs5kKVmANV
         70p8Kq9NA7tNDPJrOrPoXCFeOPgQrqb3Yfm3XZ3RRxmXOs/mDThocgj9iYxwuEb7WPo6
         JX4qljd1j8SaqoCIz+Je65MQRcIbsciKgw8bmSl7fG9rTi6b0C3CzLEUsGym0HKCjwo4
         jCLVTLlleBsqo5YtmRii7UsqbfZwEjCSoA/HZFilSr+SjETkRkBxceDwT3SyT+OZcuBJ
         7W1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773835208; x=1774440008;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGC0p783LbZSoU5uLQBLRHunnE5uv+G361DRYkF9MWc=;
        b=c3g4mEwuKhZRFZgnwaq7cLuQDU3JS1Q5iECfCg4yPWu/OyzxguKgjsR6AD1N+eNJQp
         D0F1BEozRLnckZpA6qlkl12LlHSB4jj47A1qZly7i0l5Av0434wCVtDK5hudSLxKe3oC
         C+aMVgbaLyM3tKyRi5LLk1Vea6TfCFkokEggWXEzUrVcKRv9rH9QBdRSxENr/IUw8u22
         aj+/Ux4/sN3+0vYrIPeyyZ8Iv3WmWYoO/csXLnfeNBNOAiDfhfNNWCHHaiJp4xSJcgXV
         RJWsmPnextfxPIu+qldcyG4AnZ4Wtmk5o84H49+sHaKx7r30BBQ4+1lJ9EhFn/h5T0ZA
         CElw==
X-Forwarded-Encrypted: i=1; AJvYcCUBTF3ze/Q28MHnZGnZbBLrvw/RQgKDE1Ahi47ZEVaypcg6oyv0r8vz5h8ZCSNJrQmms+uH3zsUSsc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZnaJnO5iZTJV7rLQsKaE0w8MJ8DLLYO8RTBuAP6jcph6+VmhV
	vwE5jN9La4Gq/zpOuV86tnbFaXXFQY1aZhjR0/VuYqdBUUDZXzpwYt3nXXqWAI4G1XTuM7lasoo
	oV4ieehhPHx2vJP83tLHn4Kx85w11EkQr4XH7RnCUK517uUtTAvFrFndfpACOjQ==
X-Gm-Gg: ATEYQzx+jb4qSiLFSdxscyHSZwxGMcDftSliNEYAbcWJiyjPSYOPTvZZzz+PAeLCp+b
	0ZkQzjIpx3wQf8PiJYTbERw8S7t2OZKh7y0dbOLSAFIO6ukc0tdtbBfj3dCB3pk6a3Daohr3YxQ
	VcNdTLUyd6eqJjr+Az5YJ/VAs7tVgWYJvMt8tT4jjby8E7VLVBSr2ARvZNcoeJApyNeGqapKwAu
	O1fXUmJoTL3w3vATmcCLg9aGgdu/8maD22hM7vadGlX3gCGABI8IKdqhcHzD8Ip9v1W9MupJEhr
	0dGO8Z3vzY61LnPIjoRn/pxomT2/6y4fTxeYhGgmtTz/Mh3jtGG2ukKDz9C7nicXCHArPJjTarj
	W2UstKsZt+uY8FI7on6D3cnm5Pw==
X-Received: by 2002:a05:6512:350a:b0:5a2:7a31:9197 with SMTP id 2adb3069b0e04-5a27a3193a5mr1082740e87.17.1773835207947;
        Wed, 18 Mar 2026 05:00:07 -0700 (PDT)
X-Received: by 2002:a05:6512:350a:b0:5a2:7a31:9197 with SMTP id 2adb3069b0e04-5a27a3193a5mr1082710e87.17.1773835207314;
        Wed, 18 Mar 2026 05:00:07 -0700 (PDT)
Received: from [192.168.1.166] ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c2737bsm511973e87.4.2026.03.18.05.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 05:00:06 -0700 (PDT)
Message-ID: <77a291dc72c038003a41ec11999ada57f27cd386.camel@redhat.com>
Subject: Re: [PATCH v7 14/15] rv: Add deadline monitors
From: gmonaco@redhat.com
To: Juri Lelli <juri.lelli@redhat.com>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Nam
 Cao	 <namcao@linutronix.de>, Juri Lelli <jlelli@redhat.com>, Jonathan
 Corbet	 <corbet@lwn.net>, Masami Hiramatsu <mhiramat@kernel.org>, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Peter
 Zijlstra	 <peterz@infradead.org>, Tomas Glozar <tglozar@redhat.com>, Clark
 Williams	 <williams@redhat.com>, John Kacur <jkacur@redhat.com>
Date: Wed, 18 Mar 2026 13:00:04 +0100
In-Reply-To: <abLBnlqIHVPEcisP@jlelli-thinkpadt14gen4.remote.csb>
References: <20260310105627.332044-1-gmonaco@redhat.com>
	 <20260310105627.332044-15-gmonaco@redhat.com>
	 <abLBnlqIHVPEcisP@jlelli-thinkpadt14gen4.remote.csb>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hello,

On Thu, 2026-03-12 at 14:37 +0100, Juri Lelli wrote:
> > +/* Used by other monitors */
> > +struct sched_class *rv_ext_sched_class;
> > +
> > +static int __init register_deadline(void)
> > +{
> > +	if (IS_ENABLED(CONFIG_SCHED_CLASS_EXT))
> > +		rv_ext_sched_class =3D (void
> > *)kallsyms_lookup_name("ext_sched_class");
>=20
> Looks like the above look up can fail. I don't actually see how/why
> if would fail if things build correctly and EXT tasks are around.
> But, theoretically, we could end up with rv_ext_sched_class =3D NULL ?
>=20
> > +static inline bool task_is_scx_enabled(struct task_struct *tsk)
> > +{
> > +	return IS_ENABLED(CONFIG_SCHED_CLASS_EXT) &&
> > +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tsk->sched_class =3D=3D rv_ext_s=
ched_class;
> > +}
> > +
> > +/* Expand id and target as arguments for da functions */
> > +#define EXPAND_ID(dl_se, cpu, type) get_entity_id(dl_se, cpu,
> > type), dl_se
> > +#define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk),
> > DL_TASK), &tsk->dl
> > +
> > +static inline uint8_t get_server_type(struct task_struct *tsk)
> > +{
> > +	if (tsk->policy =3D=3D SCHED_NORMAL || tsk->policy =3D=3D
> > SCHED_EXT ||
> > +	=C2=A0=C2=A0=C2=A0 tsk->policy =3D=3D SCHED_BATCH || tsk->policy =3D=
=3D
> > SCHED_IDLE)
> > +		return task_is_scx_enabled(tsk) ? DL_SERVER_EXT :
> > DL_SERVER_FAIR;
> > +	return DL_OTHER;
> > +}
>=20
> Considering that, if that happens, get_server_type() will return
> DL_SERVER_FAIR for scx tasks as well (possibly confusing monitors?),
> shall we add a warn or something just in case. A 'no we don't need
> that
> because it can't happen' works for me, just thought I should still
> mention this. :)

I forgot answering..

Well, technically yes, this all can fail.
I figured a silent degradation in this remote case would be alright,
but probably just print it during initialisation wouldn't hurt.

We cannot do much if it really happened and, yes, monitors would likely
fail if both SCX and fair servers coexist.
I'd assume it /should/ never happen, but it costs nothing adding:

  pr_warn("Error detecting the ext class, monitors may report wrong
results.\n");

Thanks,
Gabriele

