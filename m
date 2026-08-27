Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF0A2DF717
	for <linux-doc@vger.kernel.org>; Thu, 27 Aug 2026 08:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787818970; cv=none; b=hGDtPUU1qDheCCftnyZAZuLRsvzyMZCArVIMQhtQe+ihxXLHg2CnizHI9bg91vSkoNKqhtBTNvG0QDUgGTiuOsxjY1sRAErKnqLawy1/epwddN9bUqqCohcjzbOyP6FWXYylDRejgCx4ooKoqqz24baaR9DHya7xjdK11/52lxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787818970; c=relaxed/simple;
	bh=6M+q8plwytqVuLkezGJ715SOoKUxxSuuUZbsWnkW0R4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q/WBsTiWrVZ4Ue247nT+4Bt0QGXLX4JnnEqsEUmJJpU5l0Jalb2EAAbex5jlEtWZue74wZ8z1bTs9jCXGT4002Cttw12on/xvsRIaF41cxaxUYJjeUyavuyDyk7XYyhd7acNy7vU4K7Ku6EILhWX0uIKcLXaIhcjBrUQijwzxcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SXQ+T1vG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=grt/mEcV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SXQ+T1vG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="grt/mEcV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787818967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SNJwJg0S3fs0+kduUqx/6yRTxLzuM/Ks1tVa5hY73r4=;
	b=SXQ+T1vGtE/lS43j1fR0uHBr7eEizWToBDnouF4t4e3vK78QoauwDo0ziy63NtlPE9KQdL
	j4NcNq4FY6nXCs0UVyCjAMsqO55LhUxe4mbpWkAg48+LvoyU73ilygPawUGtvvForXl8UO
	kfVphpxJRqFGHBDTd5Qmt7kCD7nMxdk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-ly2YyEewMfyS_Jh-21Dahg-1; Thu, 27 Aug 2026 04:22:46 -0400
X-MC-Unique: ly2YyEewMfyS_Jh-21Dahg-1
X-Mimecast-MFC-AGG-ID: ly2YyEewMfyS_Jh-21Dahg_1787818965
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c1f548718d0so194252966b.0
        for <linux-doc@vger.kernel.org>; Thu, 27 Aug 2026 01:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787818965; x=1788423765; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SNJwJg0S3fs0+kduUqx/6yRTxLzuM/Ks1tVa5hY73r4=;
        b=grt/mEcV6q/9puswVEgKmmxGGrGbYlz6Q+pRPMnFMKbMvdx+oUkGcE8iwIZr2KDBVF
         99bOvV5rix8e+TlXZZPu8UWln3ZuSqyKKS9Y7b7f44lXRCMCHSKgX62BTamo741tz75z
         i5AC1VNsuCx862XdxsF6ddpP7GYu7SCfdkzEoXJJkk4wUMRyYVXm68c9kNy3gj5b/if3
         ydY6oADDda0Tiyo4LxWWje8aeiV4bCHP+EwWg0wQXv+y05MRZlBx+/a/0O/gPVDijXJX
         RsToXTOBjNBLFROjcHViWY9Yz6O3SfR0nhmkijAgQjFgu/SudUYEVkDwPrpZq/1mR6Ql
         eqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787818965; x=1788423765;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SNJwJg0S3fs0+kduUqx/6yRTxLzuM/Ks1tVa5hY73r4=;
        b=pTwSjP381QItgNhz3DLxqewlrKeKlUCCnq6THytOs0KGHcNfV8KuWZFlZpiB1XNq/a
         RQC9ItfIDRpVlh72FxN0+Am1ljaPsCR0zQii+KWzf5G5d0K6ssHdICQesAxXNjUQ06R+
         xID2iS5qaeIfGceAvy2WMSX7Lv2ukvGOI/kk8N6r/zV9Nc1ZyQJdAvaPtdp5OSo0XoLN
         cPnMLw64nqMoFRCGNW4eBUtVzGfQsA6FswiozBRleEDBTZSSw9wTdkuddFeYmpF8dn1j
         wBGr6p//Q8K0UHTZdkH1myU8I//WOTjfPXL/xYKktJKQH2al/72W/yaTFI+9v4x/0APK
         lHTw==
X-Forwarded-Encrypted: i=1; AHgh+Rp/FFS7AYpOPpGOHyfEixtjjp0i0rkA9twvbIs9JPqC9iamz/A2sERTi5SPOjU90h5VTkl3hyBBGkI=@vger.kernel.org
X-Gm-Message-State: AFuF++mHqcQNuwGLG5c9PuIEnGxYzWyS6oqhHJhXEvYmc76OLyYcTuaA
	XYsAHLXAcbBB4C4ZLykKh0bLi0K2CMJ02Oie1/eaWH4l3aCV6TOkCzWATb8eSQoUe0362Pa1NXg
	zNDSOd2SbbKd1SG/w8H+rEkHHDI1yezp+b02iwtiRcRNsBQZiJRakvP25wDk76Q==
X-Gm-Gg: AR+sD10aSqv/BbWjiSPU1N+LdwV1tsQjy/z2h9CmWsB//GuDqwtGYictrwybsEVJa9X
	+9Nnmw7ZzeariNsWAVa4q1A0q8xLtjiFEiPzOQOAancwNz8TGXueHwHAVaMB6WIz75Ek/jYqxj1
	kFjr2jguuXfHXjTob0b5T6FAlpretV7rCrQB6U9QCSIFV4vP06s6TEpV0VoJ/qKzmCvXFA3idRM
	i3ShHT4CtE/OjaP554ehKHUb5WYy/2rS/w9kIzdvo7foLaIOc7Rv3Ns2nCEN1Pbvd3hmO/RS51p
	w/uBqC5EXqo7uTqFkT2Ve48g/cwzUGJl9OyIxEDEtwkRvvubngZqW/GqaOsuOtKJ9dSYdmxf16I
	3/l8jMjWOZ/4D+mi3UVj1nE5KkTq9igZe4GNzSjiJuJSecmM2CPoChamWLD9lDC+l9Mfc/g==
X-Received: by 2002:a17:907:6091:b0:c1c:2007:298e with SMTP id a640c23a62f3a-c250c408972mr1556837566b.24.1787818965163;
        Thu, 27 Aug 2026 01:22:45 -0700 (PDT)
X-Received: by 2002:a17:907:6091:b0:c1c:2007:298e with SMTP id a640c23a62f3a-c250c408972mr1556832966b.24.1787818964786;
        Thu, 27 Aug 2026 01:22:44 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (212-8-243-115.hosted-by-worldstream.net. [212.8.243.115])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25127b66e5sm711301566b.45.2026.08.27.01.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 01:22:44 -0700 (PDT)
Message-ID: <ba9a55fa6aeae4ef17873afc7373302a3fadc82d.camel@redhat.com>
Subject: Re: [RFC 1/3] rv: add per-edge dwell-time statistics primitive
From: Gabriele Monaco <gmonaco@redhat.com>
To: Tobias Schaffner <tobias.schaffner@siemens.com>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Jan Kiszka	
 <jan.kiszka@siemens.com>, Philippe Gerum <rpm@xenomai.org>, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 27 Aug 2026 10:22:42 +0200
In-Reply-To: <20260827072400.45734-2-tobias.schaffner@siemens.com>
References: <20260827072400.45734-1-tobias.schaffner@siemens.com>
	 <20260827072400.45734-2-tobias.schaffner@siemens.com>
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

On Thu, 2026-08-27 at 09:23 +0200, Tobias Schaffner wrote:
> Add a small primitive that records, per automaton edge, how long the
> monitor dwelled before taking it with a count, a sum and a maximum.
>=20
> The counters are per-CPU and lock-free, so a monitor's hot path can updat=
e
> them without disabling interrupts and without perturbing the very latency
> being measured.
>=20
> Signed-off-by: Tobias Schaffner <tobias.schaffner@siemens.com>
> ---
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0include/linux/rv_edge_stat.h | 45 +++++++++++++++++++++++++++++++++=
+++
> =C2=A02 files changed, 46 insertions(+)
> =C2=A0create mode 100644 include/linux/rv_edge_stat.h
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8014b9f8253e..04589dda0873 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23654,6 +23654,7 @@ L:	linux-trace-kernel@vger.kernel.org
> =C2=A0S:	Maintained
> =C2=A0F:	Documentation/trace/rv/
> =C2=A0F:	include/linux/rv.h
> +F:	include/linux/rv_edge_stat.h
> =C2=A0F:	include/rv/

Any reason why you don't use include/rv/edge_stat.h ?

You wouldn't need to touch the maintainers file and could just

  #include <rv/edge_stat.h>

Thanks,
Gabriele

