Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0660E48AE3D
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 12:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908819; cv=none; b=oX0vsnoNgLRdssWZ7OAmnh+/mI5g91ZtWM/8rosEY0SLVZsA7P2ThAH5GShp5XIDPlpduk/S9KhwTZg5+iv5/H5mV/CAuIl5dbMCnp+WNQytge1m8FsF+LzTxP9eBOi3R9QqlPQ9zxiL1oUbWINzqo3RR0I98L3DaaFywbSg9ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908819; c=relaxed/simple;
	bh=1oy6yYsFIa4tkiku09U9A3W8leiavm3SrlWQsBeINWs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kfgNcqvZsyMYpMnFl6k5DquPcxMT9R4cgBp+iM2YC1yv3wGW6vHpZKPkIAsG8BAVojzJf8RR4iHL3Vq9Bbl1s8K4lb65+VyEIdULiIh6CGc7zAm8VWB/itVGv8lOavqF3Ct+5v5Tft1QRLNOjdcNXTMGkVYqnQZ+DBvOwuw4748=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TGjFmb7I; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=t/YH8diw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TGjFmb7I";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="t/YH8diw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782908817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XGzPh4RZs7guwUzUy8JZigwRdcEdUWtzLIpj0iGZF90=;
	b=TGjFmb7IqCt1DPbo1ZERMZxO8+A+agYObtKKWeEyELtO2/2W8Fo9+NHbumevIUnE54VKqS
	5AKiQ57z7xE08F0Fnew/2F3fcgTh+i+ZoXgdWrboRhSJs4oG0JvhwwXtS2LhYwrL6qFYcN
	j4GiQutY8Ou9XNKCZ2iGQwVPYFnpC9U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-_56PhR2IOiCP46l14Hp_8A-1; Wed, 01 Jul 2026 08:26:55 -0400
X-MC-Unique: _56PhR2IOiCP46l14Hp_8A-1
X-Mimecast-MFC-AGG-ID: _56PhR2IOiCP46l14Hp_8A_1782908814
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-475eba52438so468542f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 05:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782908814; x=1783513614; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XGzPh4RZs7guwUzUy8JZigwRdcEdUWtzLIpj0iGZF90=;
        b=t/YH8diwrvYNanVSpXeUNQY8DTnGlnQQOiBoDS+sE24eiI4CVYAbPdPmL9ss5uC1Cb
         0SzQyoxPaMGn4ZwyXLIXg/4SdjRKqvFeSkwZx+7hDRzGllkIy2ti4ZEN165R4iN81ARq
         /yEuQrH2P30y5bKmpRVHzqR4YbEpldGyEyGhz0YEBcxibWk02KTREshuvRqEz0fnFrNR
         8yBdbWfVxe9uxAmzI1lRzKNlhIV1KWbDz5m/CZ3N7DzeEfJXpd1F5NdOs/6Ml655Nly2
         efmaiOa98mzoVPu8UcCKI8EJvTnMH3efF2qyTDUbr7FrbXLRa6Oarxley3TpIUgovr9x
         /xbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782908814; x=1783513614;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XGzPh4RZs7guwUzUy8JZigwRdcEdUWtzLIpj0iGZF90=;
        b=mZI6mrB/PpXWiGZUpXhRk6tHtum3favjhbkVEUeiCtkLUKHv533M5jt5zbqKf4QFOm
         3LFICctVar9EkaOyqAWH2aDhJQjOs+l9SG1AW44B48CYlzFmm6XcdMupqYZa31UeSk3e
         FDlwsq0HNrlToq1klGxGntMEz3mpxRlZ5lqMP/gZtZrPlGXy1pEuM9r2Swvax37JvAzg
         78kGdqP/XKqiVLe2bSE3iHS3JKPypeaxCxfZ6ysuVWmkxhzGiFRnegs/t2J2hftm+Y76
         E7y4QSNXEn5v77JPeM2y9qpuZKczkSSU5JExyj95Sbb/ZXviCbLVFzngcsYR3867Vwz3
         svqA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9/lqSZjRN79ApCU37GKyczTHY9IE4WG5y0zHvzdMSuG5ulxzTvb6uiQPYBhRqVZalMwjAyySKtdU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1aDi8r441pWmpWevIeVsU93YKZwWUvRzfZlWN52XDKrCN3Rml
	U9Fq1o9TP1Z5vxyW8KOGPI1n/3esjkyimC7D7sC92gE4ygY7SsxzRoLm+Z4tRYUS5Ojt4rxgP8M
	YHKASEhEp2JZ5hhTSfX4U84xScfl6udqBKyUsySxxuCrPDFRNsKsQWjKCqi2Zng==
X-Gm-Gg: AfdE7cmwHzmoW19sNSt+i9MZ0f5pPVhFIplTRntXFVlmu1+E0PinR1Ux3UgGS9ZOxB9
	1OEIywlfJ68oTFlmir3CN6RNTD7+l/CgK7Sjxgmock+U4f8nGl/NvgbX+JNSoK2T8j1nDutf6AA
	aSkKu0p/oxDMDa3T6m1TQvUzAeKlECY46IJa4XGEclctzlQ/ESkFntmpsdfFqH+Qmkl4hLZ/371
	U+i5LtVj5vU7hivkAoUeSIQ4LBLnC3w02KxcIvDtu/I20qCs/CyIWsuu5HsPt4aLvx03Yk+djtT
	DTbThD7Ms6DCfwiEQSid+8znSTmGV3li5rmYrLVq1QU0PNNBrQFAnvAHJvAmB14W97eM70Eeeln
	4zYIVZO1NI1EHt8XaykLfJuAsATbk/4BulrMsJOBLyGMfp8irVaw5Bt1KBObuKx2Ptg==
X-Received: by 2002:adf:ed02:0:b0:46a:bcab:3c2 with SMTP id ffacd0b85a97d-477b5296a0emr360384f8f.34.1782908814526;
        Wed, 01 Jul 2026 05:26:54 -0700 (PDT)
X-Received: by 2002:adf:ed02:0:b0:46a:bcab:3c2 with SMTP id ffacd0b85a97d-477b5296a0emr360351f8f.34.1782908814132;
        Wed, 01 Jul 2026 05:26:54 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (212-8-243-115.hosted-by-worldstream.net. [212.8.243.115])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47566fe448dsm16621132f8f.27.2026.07.01.05.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:26:53 -0700 (PDT)
Message-ID: <9bc739eec41b6616e9f81cbe50759cefb1c3ad9c.camel@redhat.com>
Subject: Re: [PATCH v2 1/4] rv/rtapp/sleep: Make the error more informative
 for user
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 linux-trace-kernel@vger.kernel.org, 	linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 01 Jul 2026 14:26:51 +0200
In-Reply-To: <d97b4b5c476e5792b6875ec9bbf8dc214f999516.1781852967.git.namcao@linutronix.de>
References: <cover.1781852967.git.namcao@linutronix.de>
	 <d97b4b5c476e5792b6875ec9bbf8dc214f999516.1781852967.git.namcao@linutronix.de>
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
> -static void handle_sched_wakeup(void *data, struct task_struct *task)
> +static void handle_sched_exit(void *data, bool is_switch)
> =C2=A0{
> -	ltl_atom_pulse(task, LTL_WAKE, true);
> +	ltl_atom_pulse(current, LTL_SCHEDULE_IN, true);
> =C2=A0}

Well, this triggers also in a spurious schedule: current -> current, can
that be a problem? Otherwise you may either use sched_switch over next
or pulse only if is_switch.

It probably isn't a big deal though, since there's no SLEEP prior.. But
we may want to avoid the noise.

Looks good overall.

Reviewed-by: Gabriele Monaco <gmonaco@redhat.com>

Thanks,
Gabriele

