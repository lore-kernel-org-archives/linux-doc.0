Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795088987;
	b=g6xXt8aOaQyUfErnjHoQdgf7YP4uPOQR+L20uyOHP4e7Iz/Jtq0jk4Zuc0iE7BaZiHQl
	 O0Tz1hbLMT364lfDRIpZNUkICpCYq9Y7i75yizjDk9mFNhDUh98Y8/SjcIzICTbE4jmRv
	 l0SPMuAuLsBiif6A1YfkOxpY09gu3WqY73yXVKZaWk3hDtGmDyEG0AGZO/FaZvYviahZm
	 tgvCXiDmbjvC1DsKOMhPN4fgshePAlRhJC5fIfwTXazPOY5SWfUtWLf2YxpwDR57CL7Ld
	 b/OlL4kiSHpUBQve7nzHSVVxc6HUpHLh7fZcJ8jxOp9I9zOXYkDGxSOelbRadcfUiRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=0v8Qwz2j1gJFY6/8JHaQ0pCMABY6UQgwRHSnLdGgoSo=;
	b=iA6mtxCz+m1ODr89N6ZgWyHwsN4dMqHA3ieIdtql+VTCKTrKf2SzBuuqBeR8Lpj0gt4Z
	 2Ew56e+UrqjIlTC0KeFUjkDjGVWcRw71FmYTPiafaI1dVrKGgFeqQ5WlRy/uZ5QXMjifX
	 rkH3jjwiIDMxLTSK6ZewTlsPO9mk6ccLKisYuv2WOFZG92EGy2D7WVl8A8BbPbUcFsIo0
	 FDI43RWc7+z/PnM7m5fd2wfGmQB+iKCjTX+6bXIP1K2PD+YcmXj/Mb+58Rc4Ja+rqzeAe
	 eb4+zOkGPufnBH7Pq+77NNYTDkDtwHdUhQae+0tgFx5V8gzr3XhFAG9PTb1k5cW0f5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z23fiON6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DD2606A320
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 11:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2DD2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z23fiON6
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ae3b5b1027so2376061fa.2
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 03:49:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795088985; cv=none;
        d=google.com; s=arc-20260327;
        b=PAtmjctByCvhy38xu4Agv9629nP5XChKGzEViuUCka9FUeJjYU0SmwFq0HA2flZbGJ
         lQMsaq6PH11GLMQpjQkAunJj1rU+uk88NCoc8zmpfQ9JcWpxZXaXQhmAwld4rqg4tzQY
         xDbqUsZGuIamG2NSDpe33wxwSTTPXvm2TkIVJELSfvNvQfa0T1w+FDV/ZeznA4h8vJHl
         NxoRD5H1g8z8XuFmy5taCky6BRFJD7Gv2nn3f/FkxTzloS5kVnxy5s+BPqHQ4VcRnXSA
         aQgYhsgQYqYUApmwpautsUyIT9cQYDoE9A3cogeEOSmRb+VnLPOeBDwrwZg7YIrZ+elR
         KJSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0v8Qwz2j1gJFY6/8JHaQ0pCMABY6UQgwRHSnLdGgoSo=;
        fh=qOh4V2WfMeKhyReiT9z3NALGYVAi6grdPXZcYflbWPM=;
        b=tBqJLKXbPIEWPhWaVo8ko2mKdfZAhDr+wRjzmvtILLQoR6f5nu5FJJJIt8PIDfiej0
         5VL1DOiRP9qxKGqzWABWoOoprThDiEakMTJ2lHYaXz1iJmubs9Jif6Wcs1hxAh+ilglN
         7/nR4RMrCnz79J98lBfLli16Z6gCt5EuBFSrZH5wTZu2ZNOyNc9URnflK3sRzrVr3sF1
         Gm0w1frnoJXdCkV/vBYMGtmEScVwAMkk22YEGr5P6/PzrVkulgw7K+XcioOEM1rpPW7i
         VF6XvDiO8l+zvFvLX8yySq7qbgo6jwkjEN3Iu4fto4B4BjMruDKXBBEes+8yAw26Jf0w
         hHfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795088985; x=1795693785; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0v8Qwz2j1gJFY6/8JHaQ0pCMABY6UQgwRHSnLdGgoSo=;
        b=z23fiON60VDqRZJVWbZ1efJNn/LOmgGSb3qJoydq7gra7IPdLTFjElS8MzhzTZk3oF
         ATDPMr7JAZiVz4J4GvNGB3fvZy03S4txliQw9YWFLb5oPjuhZp3VP9Rdv8ZC00pwwROV
         KmXIbyvdPtGeMsZNUQLocoIXSzxG8Yq//8OdahAWyfWrRtUej3dLXmrQ9uKNwlTX/E7b
         Tw3oXiFldyOl5oIzWXrt5ODq54ExhLvKbMNId7hrPsWODYp748RFqhbF0p/oNJveRmMI
         55YF/caa1kHgv7ZU+4zhbPDOn7S18N7AtZfWHnjfdojffeySUOTDoagmd5LW+R4Kn0q6
         2vAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088985; x=1795693785;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0v8Qwz2j1gJFY6/8JHaQ0pCMABY6UQgwRHSnLdGgoSo=;
        b=VbzYKfNwvhpY26CxsdzN6iGvFUhsIvB4uBcwDFCdS1s43puPTljWzSE8JV4IgEpxLn
         FUxVlfHa1pp2XI1F9FAN5aqjbzCrvdq2NZN9ppMDaJ3+gcinbv/3zZeS3ycW8y0WH9cB
         INaTH512SqesUoc337qDNGcZsTs6j8z4+3TFq3kxTb8SKWlEoVBocSNZXhW+VxKWotOU
         +4NZP1GSIUqZDqDwLvwckxsbQbaqji6bhXGzM0awxEVFzHWwC7KU8wSXsQN4ZgX7jWls
         gQryonUDC9rCAG4M9+fMKCZe3UFRSszz0MOGveIH8vP4FUYp1qUadS8XBu0QlD4LpJ9h
         f9TA==
X-Forwarded-Encrypted: i=1; AL+hErE9YvpQ/nfxHEyYnPLFZf8nH6WJp7YHA8jHFtf2qnSTBTayJAGw2n9JkGXnIH01/RJutcdxCI0Xeyo=@vger.kernel.org
X-Gm-Message-State: APuU4Z87eN+9t3kq3bKfLt3wbgTV0gL4lLFrNdnchuULllkkhS/46EtH
	eICGbedR8qA6zmYWqOJUCfg5Gihk5ttnHABvpWn+dpOnjJRk7igiDt/QBMJKhxLuS1nfnlyYo86
	p1NYZwpxM7b8z+rFVa/SyIKg2N3NYCtU=
X-Gm-Gg: AYBFou3CmLM09m/WLZe5p+seaV/htXiV34JIdkJLMcXfTDQ1DG83xIrc8GnkURN4XCO
	Po16cle4b7pNs9WqTh7EwYFyzDQII5cVjXzyCGl9k/F5gG8o11TS/YvsRdjjdBEuf8aJSPAfiQY
	229yai3oG9mIp9qJmpeUONfbct0wA9RIUezH0lcir0+aOwKio3ymSvNZ+aW+Jt3la7A/h3XxtAc
	bzImU72PVIGBV8OBT6ZvwaUKPgMgLzOTBCxc9QgKXfWArE9UV8Q+RndvbZhRVG3PiZhzTLu0RqV
	jR2dV7cRtQNBVh0vapXP0n0TMBIfOg+RY+rJNqXgsrXJ0g8IBczsNy4gUKch5LXgQMN1ha7BANO
	L6PXjvlT2UPtZl8Q6o0fMc9E2tpplIMfcjyzj55W7HhshTLRPSGZk2CsMAn1UcE1ohjFIAe7CiG
	Dt+3GVaxwU8n9zyUD4tg==
X-Received: by 2002:a05:6512:3a8d:b0:5c1:57b9:90b2 with SMTP id
 2adb3069b0e04-5c1a9bfdecdmr2184343e87.1.1795088984723; Thu, 19 Nov 2026
 03:49:44 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106113142.706783-1-chenyou910331@gmail.com>
 <20261106113142.706783-3-chenyou910331@gmail.com> <avR8baubOL7Aoeh9@wyuan.org>
In-Reply-To: <avR8baubOL7Aoeh9@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Thu, 19 Nov 2026 19:49:33 +0800
X-Gm-Features: AclHuK9EM5hdpbT3TNdOeN-dnx4idoMkonl-YP0dj0CdZKOeHCEG-FJzfj6Fq-U
Message-ID: <CAKspUhKRkx_UW9mep2h2HuDy5Rj7OwurdsmEe6+1f04Rv=2YWw@mail.gmail.com>
Subject: Re: [PATCH 02/25] docs/zh_TW: process: sync 2.Process.rst with the
 English original
To: Weijie Yuan <wy@wyuan.org>
Cc: Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Yanteng Si <si.yanteng@linux.dev>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 11, 2026 at 10:32:13PM +0800, Weijie Yuan wrote:
> The Enlish version uses tab here, not space.
>
> Is this a big deal that requires a reroll?

You're right, the English text uses tabs there and I expanded them. The
rendered output is the same, but the translation differs from the
original for no good reason, which also makes future syncs harder to
compare.

Since I need a v2 anyway (see my reply to 03/25), I'll restore the tabs
on the lines kept verbatim from the English text, i.e. the URLs and
Andrew Morton's quote. For the two tables I'd like to keep spaces, as
their rows contain CJK text: editors and docutils don't agree on where a
tab stop falls after double-width characters, so tab-aligned rows easily
end up misaligned. Does that sound OK to you?

> For the label thing, as discussed before, let's clean up after finishing
> our goal.

Agreed.

Chen-Yu
