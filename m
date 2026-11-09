Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227454;
	b=nOiudGE/8iZd2QAeHgvt57SOzgNzU3uvQJa6jv8ieLYtRlrYBKqr189tO81NVQrEhW8A
	 KptPr7t/q9P807KdykO5LYTS6C7UNe3fmILYfjTBmUuruccEqtoIzG1sAX8lqCRGMf8lY
	 ZuOD3BfAAmeuEeW3SYR/nn2yBpod/RfsThl4JU0xh4Io+e2lakkQM83zXIOhxuJTNQnzf
	 K+vPoJzEtfRbqFr9JuwEIGoW36v1uGPxMD/6PH0ICoUp345TJe0h6mvxYpzjfLYoyW4Ul
	 x0W3G3RgKRFC7YKg2PFmJQNJCay7dfThtOUe7pQBJ4jaCbeoShpvLjdLYnrmDgQmVNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=GQFncqVueaFrQl85+04mTmZiBnBccR7JgnqJBrw51EM=;
	b=oN0mZuD8Jqv/DGgQASoqCg3CA+qtCScrrxJ6wyoZix++Fi5K8dkdXsaPzpCZSOR3yLwg
	 BUa36AENYwtPN9J4i6EQotN5OxmDYUNM8ygl/vhYA/hkwUuhaV/md7NzVMZu0RWNNLJB3
	 rw/bdtl8GmjoWcfzcU7mDe4vdpyHQfAeW0In20pLKa9eKqAUHxCMv0cFCSCsj6BcZAbxP
	 keeLPIwE5/wreSS3l/vqoDZQRABuz5WhUxo9zqXen2BjyC/lNlkSvUVKb2lHQxx7ImjJW
	 HYK5oVvwEVuvevbpTNLgDnvLYh75crP2/EaLKg1v2x002Q1GQ2sCmCs+3RXZcPr+GcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y58Dbjcn;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE53F606A321
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 12:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE53F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y58Dbjcn
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c14e307f29so773554e87.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 04:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794227452; x=1794832252; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GQFncqVueaFrQl85+04mTmZiBnBccR7JgnqJBrw51EM=;
        b=Y58DbjcnkyPQ1CZRralTMZTIGZBHupsTH/Og90s0MQFBmBQYwYdDQ7GQnuN0UWK+Df
         zL1rszlu1x9PSyXNo7wZHtrTF0m4lfuq1Ni1lvH7SAA+eEKiCSSjrFd/u+uIw/vwLALH
         sDdKpfomvP+ZwGpfyz1gP9S8x15+nQ8MmIVOl6gU/Wv0XQAC9FpewRQivFm4Nuk1M6NC
         8L+KDCMHsM7MUnd8w08/FeT6DEoouBOfI+sq5029haSyZwdqcPYlWaplHFbiD1mQCMMl
         tkt2v39ZU9yuV1j97WoskoirDA1lHKrBZsKMsDDt+NSnSaOh6s34fjijnid4W2ajqUnC
         Vleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227452; x=1794832252;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQFncqVueaFrQl85+04mTmZiBnBccR7JgnqJBrw51EM=;
        b=oqiG+iV92vKcp1d/636EtCDpwU3xO98pvWhzDDmCmYHpLNnPYsc8OTZskfiz54bbO4
         2YpbNQUCEjXMKhTpieJELf8ydk+xNWKT6Nbiopuyx7t9H4QUGy+nLk2+LoF/qOuKLGj4
         aIipvsZB1cDB6pLjblO7QMkPZfWMchcS0tvyGXml7XYllYhvE0Ncp0dG097stNjsDTB0
         Sk3ebWB7daTuu4fVY1YzE39O4AkNw6lS3xD5rap1SKCNe0mhH4my14YLMDfJauee8OAb
         6YM5MF19VwuJmgN/AIm+1f7KcyVa7amyIQrwEvuH+9T1TYR9RIYnbPGLHBHl8Ybg2Pce
         VuLQ==
X-Forwarded-Encrypted: i=1; AL+hErHARALRBD+A0gTzn2w2fL9o4Gn0r2COZnu4tDbnwlBkI9su/QnYFA1ei4MAZuQdhZ3g0hY1KslKXfw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LeaSTvbH7X1ODPWllyeXVSE+ZZFeyr2UNpzeaLrhweRLMyEcf
	g5u7nv/3Ug6xK+elxmKGmwyOZJGUGGLJ7XSnZ/s5pdINJHuwKseNoYWX
X-Gm-Gg: AYBFou1O4meMkmsJIJyQ0f/pH98TCtAqsZjkz4jNaki1K3mo8bc8q1t2VI7LblWp13b
	QGkEVhjK+2ywcNomM1w9faPXQsNZt+VJb/foh5gODt12lfPFOPLdjI4njKhwg43MyDlmaC96Ruz
	P0L+TKzkczJbPNl7l1r6dq8zELSV2WHg8SGV0nHgZDged6kxBQFEKQAa57PmqjnIEnj29Ei47zl
	AAAJuXzg/B/slJN3wzpfqq/vwU6A2+izASGyzqeQDSD54IkIosuSQCeLxHQDONWBG118PUfk6jH
	9FnRdh0n9I5LDFbPArQsQ5DkX0JOuEht9yRxzMw9Be26RbAn40dsJefD4AyRmZg4WRIZCalY07l
	LD9IuK9ExSRM4gzJOWn4lkV+1kE19qvWjfQVHWa0i8reb58jrtd3K8Gg0RPO+Q5gp6WXCbZASVH
	EPXBN4Rt5I1cHhBaBkHFybxhLzCpsUDjkqszvYKYYKwP3u3GbyziTDbbAomtefBBv0YpDvxWNk9
	OaDu4sHaDfa+rbSXJTwrLVoLnGdYcf+8m/SmYYZDFj7xfnedlUYXWEJ+ZgVk7+MdbYB8bOrOiF9
	n0391CrQaVsyekuM42eBb+a73AW08V7Y7aimrK2emMs4l8LMYuyCxzA=
X-Received: by 2002:a05:6512:3e04:b0:5bf:d6b6:888d with SMTP id 2adb3069b0e04-5c14c00dd3fmr1236728e87.18.1794227451715;
        Mon, 09 Nov 2026 04:30:51 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c14b7fc086sm849084e87.23.2026.11.09.04.30.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 04:30:50 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 07:30:45 -0500
Message-Id: <DMQOJPJ4AT7P.3DUQ9O213TZBI@gmail.com>
Cc: <kuba@kernel.org>, <willemdebruijn.kernel@gmail.com>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <pabeni@redhat.com>,
 <horms@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
 <rdunlap@infradead.org>, <donald.hunter@gmail.com>,
 <andrew+netdev@lunn.ch>, <shuah@kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net-next v3 1/5] psp: support rx rekey operation
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261106-psp-v3-1-a8dd38f5a727@gmail.com>
 <179408516544.994134.848767943937829488@kernel.org>
In-Reply-To: <179408516544.994134.848767943937829488@kernel.org>

On Sat Nov 7, 2026 at 3:59 PM EST, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] There is an unannotated data race on the new
>   psp_assoc::prev_generation field.
>
> --
>
> psp: support rx rekey operation
>
> This commit lets an established PSP socket rekey its Rx direction. It
> does this by creating a new psp_assoc that copies the existing Tx state,
> and it records the previous Rx SPI and generation as a fallback.
> psp_pse_matches_pas() now accepts packets that match either the current
> or the previous Rx SPI/generation, and psp_assocs_key_rotated()
> invalidates prev_generation as needed.
>
>> diff --git a/include/net/psp/functions.h b/include/net/psp/functions.h
>> index 410adb6718c16..5a7a518b9579b 100644
>> --- a/include/net/psp/functions.h
>> +++ b/include/net/psp/functions.h
>> @@ -77,10 +77,12 @@ psp_is_allowed_nondata(struct sk_buff *skb, struct p=
sp_assoc *pas)
>>  static inline bool
>>  psp_pse_matches_pas(struct psp_skb_ext *pse, struct psp_assoc *pas)
>>  {
>> -	return pse && pas->rx.spi =3D=3D pse->spi &&
>> -	       pas->generation =3D=3D pse->generation &&
>> -	       pas->version =3D=3D pse->version &&
>> -	       pas->dev_id =3D=3D pse->dev_id;
>> +	return pse && pas->version =3D=3D pse->version &&
>> +	       pas->dev_id =3D=3D pse->dev_id &&
>> +	       ((pas->rx.spi =3D=3D pse->spi &&
>> +		 pas->generation =3D=3D pse->generation) ||
>> +		(pas->prev_spi && pas->prev_spi =3D=3D pse->spi &&
>> +		 pas->prev_generation =3D=3D pse->generation));
>>  }
>
> [ ... ]
>
>> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
>> index f2cba3fa3a235..c1e38845f08c3 100644
>> --- a/net/psp/psp_sock.c
>> +++ b/net/psp/psp_sock.c
>
> [ ... ]
>
>> @@ -302,8 +333,21 @@ void psp_assocs_key_rotated(struct psp_dev *psd)
>>  	 */
>>  	list_for_each_entry_safe(pas, next, &psd->prev_assocs, assocs_list) {
>>  		pas->generation |=3D ~PSP_GEN_VALID_MASK;
>> +		pas->prev_generation |=3D ~PSP_GEN_VALID_MASK;
>>  		psd->stats.stales++;
>>  	}
>> +
>> +	/* Don't allow SPI from two generations ago to alias one from the
>> +	 * current generation. Rx rekeying under the same device key generatio=
n
>> +	 * is currently permitted, so skip if the previous SPI is from just on=
e
>> +	 * generation ago.
>> +	 */
>> +	list_for_each_entry(pas, &psd->active_assocs, assocs_list) {
>> +		if ((pas->rx.spi ^ pas->prev_spi) &
>> +		    cpu_to_be32(PSP_SPI_KEY_PHASE))
>> +			pas->prev_generation |=3D ~PSP_GEN_VALID_MASK;
>> +	}
>
> [Severity: Low]
> Will KCSAN report a data race on pas->prev_generation here?
>
> psp_assocs_key_rotated() updates prev_generation with a plain
> read-modify-write while holding only psd->lock. That happens both for
> the prev_assocs entries and in the new active_assocs loop. Both lists
> hold assocs that are still attached to sockets and can still receive
> traffic.
>
> On the Rx side, psp_pse_matches_pas() reads prev_spi and prev_generation
> with plain loads and does not take psd->lock:
>
> tcp_v4_do_rcv() / tcp_v6_do_rcv()
>   psp_sk_rx_policy_check()
>     __psp_sk_rx_policy_check()
>       psp_pse_matches_pas()
>
> psp_twsk_rx_policy_check() reaches the same check under RCU.
>
> This means a key-rotate running while a rekeyed socket is receiving PSP
> traffic gives a plain write racing with a plain read. The writer and
> reader hold no lock in common.
>
> Since the field is a u8, it can't tear. A racing packet would either
> match the old prev_generation or be dropped against the invalidated one,
> so there doesn't seem to be a functional problem. The existing
> pas->generation update already follows the same unannotated pattern.
>
> Would it make sense to use WRITE_ONCE() for these stores in
> psp_assocs_key_rotated() and READ_ONCE() for the loads in
> psp_pse_matches_pas()? The later patches in this series don't appear to
> add those annotations.
>
>>  	list_splice_init(&psd->prev_assocs, &psd->stale_assocs);
>>  	list_splice_init(&psd->active_assocs, &psd->prev_assocs);

This was a preexisting issue. I didn't want to move the exsiting
read/write pair to READ/WRITE ONCE as part of this patch. I prefer to
change all of them in a follow up. Also, as the bot notes, the field is
a u8, so tearing isn't possible.
