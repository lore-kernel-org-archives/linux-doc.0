Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795361168;
	b=FmU/xvSw+blIg24tlIGKolJ9FhY5EpQxy9d0NfE9iQyZTwA1LvDkCs2h/CB2HNsq+tQi
	 KweAh0SFJQFzrzG9bpBjsJjMTfuRxswTUSPKmSyXBYSfRog9kcv1uX36d+I/zdkRBmtsC
	 awDAs9yk9bJgQ85jg4eZBIysrUg3I1huBSZMOgu17q0YvXGCsvAwAVfUP/3tr+XS4Qako
	 y6V0mAdllye9EiPrPLBtkpXNEuLzqQsF6bH+BVgCCok5OV1CaKvuCVJt9qmXN5f3D4GoI
	 JYZk2pCxMDeQ0AfmTT1sTeBF/h0Pxd+9UbDq/4El8M/Qpas3UORKNrXQ7qKth5/2/2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361168;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=//YIOMEB7pO5HIt2+HrvRrWKfZwNj2jYg7bNCW39l8I=;
	b=pTiJtafwSUlMnujeVLB9ZVs1BHCbrxCnlwwSY6m88nQjhONVq+hYgc2aA89piRZzR1xl
	 FgFiKZmlmUxg3QgxQ1EoIgGIs2vX01Sq2YSSfbYqtiBeF6oQYCXZ2nxxdLyJ/ioHM38nu
	 Ehd2J5cgyEOavSmu03l8EA3b+/PR9caZYmX7CxFHRp6knUjtxnr0ZO4vW7a2FNM4Tk0/B
	 oLmR1iv43UNashxH/M740CuijhbFbU9z+7lT5sPpZwafBeKGaG6xnyEApQNEKWjxpFguL
	 V9jiuKYGUjA6AlGt2b2wWZYdiPoKECakIksJ9y1Vf4ZrbqSzFjfXzTFnZ8GJPr+fIFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qKXgsI0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80237606A320
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 15:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80237606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qKXgsI0
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-9213922de73so46415216d6.1
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 07:26:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795361167; cv=none;
        d=google.com; s=arc-20260327;
        b=DcVpl+h5CAR5conJJNTXBOEVs8XGbotpkot1CVXXU6Qsv5LjHGkpF5VygRGK2MH017
         X8XixXolgDlvuYw/VBA2rSnhfqRG6qup5di+9Wn6z5kscf89LFpdKxP74ynMAU+Oh4vO
         0qn9CtV576BQbGNBSIzgyEo4fVuL0ijIghuqcID1SQPOy0ns0HC7gOZiZid9qG3cmEsu
         JpYj42bBDknvmhae9xwM2BQwawPeTFvurToVqAKxomtRLsKjIj1cUMK7GOUuXRXnXthy
         niDS0pO/ykaHVtbeT1S3gHfZ5hxl3+GYk3B3ONpKXJME+JV2qeTB+K9PL1uDlxE+iD2n
         OQGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=//YIOMEB7pO5HIt2+HrvRrWKfZwNj2jYg7bNCW39l8I=;
        fh=jm6o8MDvwbQK3Kip2/DlCShPmALcHJbX6Hn/WQzipxE=;
        b=rrScZUgVJ6cCwohOjPW76SYlqvtz+aS1Ov8gV2zxNNyZ5De6EVpavH8lwzFZOIkwln
         eZcPmxuWj1FgdeT43SN99kYu/m2+GTA4Ku79qlhzz+96z/i6/YaUaIFflOzgYZeWTCcK
         eV1sNljTL7tp5qG6abyWfLNQm2vRfQcv5//lz5Qc9Vt56G2ZRZJ2NSpZVJxAN0hmkdtr
         pFvC1gh5rGgMazvdZoF+D/rgctCPsCMwlepHnvWPCEzT5PbwtQ4o03nVXYbpJqdg1cju
         g5vXfpbf/152cd+fOapAghc2hcPT0CblLBBoclpv7vgQWyYYFU+muNwxDsA0C4P047GQ
         hTkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795361167; x=1795965967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=//YIOMEB7pO5HIt2+HrvRrWKfZwNj2jYg7bNCW39l8I=;
        b=0qKXgsI0U+ltNqUdn2RF5Z0f5ObzGlGNa2cKi9Hjogp3h4CbaflzwQUevCJEPE9Mlk
         yh+guVCI+4n5cOfdT3yZ3sGMzNT28s0b6LsiQbPvnDCHsivxkgIRri35hdj0t9wqCC0m
         Nwmr6fIvQ9DkCBXLsWo00m9fxSqsu+XkPbqiqBc0bSm/a3VI/VhjMVMoXhfo+revI/YN
         DjAw2gcOeHZJHoGQ6RcaMpdWjZSy7Sn8afsGMMLNSyencfCiEe0Zp8BIa7skymxrxjls
         fbsPKEtQ7CTPRV8XGRCBp7t4Bos10wvWig0TEcXcvXFFul7tFDxBE2g82VDNP+0JC53m
         ibIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795361167; x=1795965967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=//YIOMEB7pO5HIt2+HrvRrWKfZwNj2jYg7bNCW39l8I=;
        b=IijwZG0nsrDTfkwJ6klwygnFkTce17QVfXQOLoafGsN0Uq9D3N6tEVeE1B7a3RtGde
         plXmKw+Q4DmrlO9ApVzI0EzPzcTlkz3F1PlH5VEdW1ZlBVqp0lwD8hmvbc7KINDQvaLv
         mLV0z68Qr8d2SzP4wg+D711Buhkrm+UYCGm8BSfjlP6mQhDGSqin4zVB2ex/Qk4dT4Gh
         cGzvjYBLSTkEdO0RvfvqWDNwdCZcrDQuheDjkYUi7cDWnlz4E29K7G/6nqDa1oye3GK0
         k4gGbPqv8nxDjSp4Nwrbj3h5g0rTHapswgXowxYvZDFsrLNyE7ndUADhGZENHUNqXYTp
         uNbQ==
X-Forwarded-Encrypted: i=1; AL+hErEhhK07uERTueZ03oD+dPEeM85Qv+P1A1g0moVjge+w6vODUC3BWq7OKW8unR0qVpg/I6/Vb2zB5Wk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5T6hOHVwakvfBjoLvGCChES7SGyybzVczCdSaXm9mfPVPGTkx
	5WNV84xY3pAQR9VfN7oT1XaiK2lxp6g7kusytXjpZRDDHSW7sw3U+pIPvq1mWZoLD4VFJe8FfIq
	gMTlmnDdaJXuPeIU8U6+BLE/EKKSO3+X9irwpqDlZyw==
X-Gm-Gg: AZFdTZdxWXhD9KfgSIQruqyBVU1X33mEcnbtEYiYu0dJdSZ3Qnz3JAp7nps3a9LxQoh
	JH1zejGVX4Agh/LVwTTjeyB0Y0i5GMi/vTPt6zJ0vc7K9RUBdJLXDSHlI8zSt4tc8mcZHlBYrm1
	gc/uycBNVQM2r8F086/beMjt+KZlFNWOaP+9ejIgb0TkDdBBVFEZuumHXU2dcDwxUiMbfje4ttl
	V3w9I0GZvQbqvfRu4ZwCYwn24R2z2BX9rK44Rp52PG0xm4BwcV9Ncv1u0JifOlVjFC3gk7xMqi9
	XZueZsQr0ak+QKz76K94OgfNhGgswDY1NsGsGsdQeYdIrzJ9ZtYZgubckFyK4+e6GB26BRFaUmd
	lLOjOag/PK/0cAKjseTNynkz/q86MHhf9brDh6AtmOK6g7ZxvFygr5DQu9o38XfD+NRmmuT9uZP
	6LoG7J3YBxELhvUCxEBx2SzCv7jANHtH6T1jJ+yc9bZO0BRk8bUoeMlyqC1+Py6Zi7Z0RtEstzC
	TeRJpd7SWK+LjgOCcuqRqoJB7fdtnjS2D7EcseuOTUk8+c=
X-Received: by 2002:a05:6214:508c:b0:921:143f:396c with SMTP id
 6a1803df08f44-92134b36a1fmr154024326d6.49.1795361167526; Sun, 22 Nov 2026
 07:26:07 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-pt-br-5-posting-send2-v2-1-2a5cf9f667c3@gmail.com>
In-Reply-To: <20261122-pt-br-5-posting-send2-v2-1-2a5cf9f667c3@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 22 Nov 2026 12:25:56 -0300
X-Gm-Features: Aa3M54r3VoHFo82Pn6BOHtvHG01CdpdFD5R6wjpsmOrw_tC7Bm_Enq0o_S8-xgE
Message-ID: <CAMAsx6dRoJXFV17xXMBLnk30EOJ+1WnLrbe8nk3xVM743y374w@mail.gmail.com>
Subject: Re: [PATCH v2] docs/translations/pt_BR: process: clarify patch granularity
To: dreduardocruz@gmail.com
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em dom., 22 de nov. de 2026 =C3=A0s 10:08, Eduardo Pereira Cruz
<dreduardocruz@gmail.com> escreveu:
>
> Reword the guidance about patch granularity in 5.Posting.rst so that it
> reads naturally in Brazilian Portuguese and keeps the original meaning:
> a single patch may be reasonably large as long as it still contains one
> logical change.
>
> Replace the reference to the developer's popularity with a neutral
> phrasing, avoiding the gendered expression used before.
>
> No functional change; documentation only.
>
> Signed-off-by: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.

Hi Eduardo,

The changelog still has the b4 "EDITME" placeholders, and v2 is
identical to v1 (same diff, only the Cc list changed). Please describe
what changed, or resend it as a RESEND.

The commit message says the reference to the developer's popularity is
replaced, but the sentence still mentions it; only the wording changed
("o tornou a pessoa" -> "tornou essa pessoa a"). Also, "um
desenvolvedor" is still masculine, so the neutral phrasing is only
partial. Please adjust the description or the text.

The diff also rewraps four lines for a very small wording change. Please
keep the original wrapping and change only the words that need it.

Please run "make SPHINXDIRS=3Dtranslations/pt_BR/process htmldocs", confirm
there are no new warnings, and send a v3.

Thanks,
Daniel
