Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DC7410D2B
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 10:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768905663; cv=pass; b=liLwfCwd/sCsTI9Ort/DkpVyKkLWOiOFBCETWW077IrhQDSKhUMuqaGDMDN8o2/4zv6B9jO1goXLNSedQDoYjcIeP9QYQSEShnOhSNiJE3ju1Bx6N35HRbVpKU1Pb28o1EuaxGp8MiE1pBVDd040xQ5olGgyIKVUEhtUhXLcfkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768905663; c=relaxed/simple;
	bh=FFii1bsKXobctKhMNLtq5d1Ip3RYu1nQ6MH14Bs+3t8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O1lkHn94stmr0lv5jI4BYjden3+KnDHpD2r8dO1m+Faa8pWY4eC/cEufOe+rLU0TUV/VeTZmqFPnKQvjMnBPltssOQc7Rl/Je2nHpUNef7MDtgDZHNOXNX5AW3ap66XOeULfbgb+xBoH8ZCNynfmxX51f9Cu6FRihsYa3bTMRjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bLarUOM4; arc=pass smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bLarUOM4"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8c52c1d2a7bso683739185a.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 02:41:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768905660; cv=none;
        d=google.com; s=arc-20240605;
        b=Lmo3wwPZnpPT31R7w8d8ITD+hIbL5pxkSH+bR0UuJ5GE5BMDXlaw4P78CAm5ZRU0ql
         9x45AvMdzOoA/ey7k5M2fnKxyxa5h35Hvi8Ye6S3f/4i9SoCDaoRKbd8YAliGtcailDK
         xvONwZpqtGjSMRvfmfsy6AvolM1/YAxAsLOPHOXhANjfOgzzgNS6wxyQbpeHW+U7q79Z
         Jgar3whmogOBncAMy45go9dZCi/lnX8wWKIVOZGQWA+J3mkhH/7kZm3YeI+xFh/omrCn
         sti+Sn8XcG6BfG/DoJzEuC0vef49RYYq0F/D9Qi6BpaR1TXY2K1CANu7L7GiLsPRLWz5
         RG4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FFii1bsKXobctKhMNLtq5d1Ip3RYu1nQ6MH14Bs+3t8=;
        fh=wgeChxiIhcLVokwgqz5oVGks1SNYAUMgNa0tJ+a+PZE=;
        b=L5ozlZ3rPBI/Xh+ceoOcR8JSU6+B63XdO6T9VFjmbZCrli4oRpvvsHfH9iDXdX663n
         +OtLJAowdMJ5ku1+hf1XHpMowwxhkFSpuyRgSudLSuHdDYMMD7Zhde+Uv7DA7cIITzEd
         fqz4zjnXNqljzt3oasVyhUPfmZFrcJdffwZCkYRQDShA+Wiiie1VU7H0nXaZCmtERpEV
         bm4V/1nfEZKaE8nRXTPh54usUdN5B0Ms6hx213M6EJwdmuixl2Csa6tPJyq8p3HINnPl
         Yo7VmqbGFi4SGwCifNZfBVaXgpn4z+2i4DL9TlaaDZpoge4/L0uGjpN8FA19KTYpBcDW
         H51g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768905660; x=1769510460; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFii1bsKXobctKhMNLtq5d1Ip3RYu1nQ6MH14Bs+3t8=;
        b=bLarUOM4KWKl8f8jZgqdcCHw3/BWGLLM0Lee/em0TyNUn56jxnJiCCMwImFosoG8BG
         bZ4ByuHgsMz229Eg7TzNOWTJZjiKMzDRETJfukjRdQEjYMCehR+z4Y7pAI9Q2auCxG7E
         e1Y54T0Hw7PqbKEqIZgANAaOQL9U5/pRC8TAKKDsc79lCOYpctfKAhJ2Q0SXP2DqD2fe
         f1u1/sh1/2CY3SJYi11hp/VEgmCZuNhxk/9RtFJ+F5kkn6NkkA1HU1Hl+vwEhd7LTXRv
         yw2bhlQNHF5yNZqfgxWMhFfvo0XmZUQNedyaSYVtNgkhtW/bP8azuPcC+vXn6D3LFXAM
         ph/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768905660; x=1769510460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FFii1bsKXobctKhMNLtq5d1Ip3RYu1nQ6MH14Bs+3t8=;
        b=LDGvsx8ORHOVvlkpfVQgGKfHQUNg5dN9xb+NtZFlpfInwopuGezNp7QKQbQoXbkWn/
         uoX019tpyaQBb0ETmIh+Phl5TG2gOXiYFke44CvXzthodMf91NW/nBYpZP/N4SnAWS/G
         Vf+ALU7NLd0R65Ym0w27ajMXnM+xhtKF/R5nke2PiHz8qVny2xzeXmgB9SzQaehQsQKT
         7AsOD3yBbbNj2WKi+jufQeMOFK3a31Uv6mA6gWz5l2lBySiJPU7szNVKTw3U2DxSms26
         2uJ8C8fpxGuUOoDE3jYWZ+xCPkAVpPgPIXgwICR538+5ru/Y/vpMFbBgLn4Pgs800ORd
         r2Iw==
X-Forwarded-Encrypted: i=1; AJvYcCWYXvgtnuJ/DkoeV9vgvWhR1CcV8FtZ28ogrGeMjSy99yd7wah0lloCO5oN1/E0/IjtFjuANoBEUFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvDz98HrGKErjl5EdzDa5dz+m/f9SIwDMHah4jFqYa97CeYhbO
	phVV1xyEkhLRWzNaF3AyDz+40cEebMM+DCk/zqFwTCaeufU2Mrn6VrL25rK1zed7B9Vlp/wZY74
	KGaF7qgvQmovCtQO0nCd8or29zyqx7dEYHjK0p9RNTYTNkCzxHNBfXlAF
X-Gm-Gg: AY/fxX4xfEp47iGEQFWKHAfdP3OL2NZAa5hrIdl0Z8iLbgjD1U0nfSe2n7GbzKJIaPz
	V0JlzR77KjDs6QG2B6DWEw2Z8yU30OVwF62ztGyM6kAoPvkY9wt/YEKomSpOCDHnQLQdJ7Hjp1s
	RIrLpOCZmx8L4Dwqt+oig1OT+U8sQOTFdzJzQu+xIkJHouc8oRAG7bxdFIvUgTSiBhoY26Fihhz
	4S2SZSj/sKabSQfVP5MvraQPhfKZZI0X7zuR8VtWDNitn0kFfKKAUrJp5LmF+JU8CV3LSrdgDWO
	+hyCsA==
X-Received: by 2002:ac8:7d16:0:b0:4ff:7eaf:6fa1 with SMTP id
 d75a77b69052e-502a156ae5dmr191196621cf.11.1768905659838; Tue, 20 Jan 2026
 02:40:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119185852.11168-1-chia-yu.chang@nokia-bell-labs.com> <20260119185852.11168-10-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260119185852.11168-10-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 20 Jan 2026 11:40:48 +0100
X-Gm-Features: AZwV_Qhir59xi47UnYx9OyC5NKVZCvDNZj7hbofVsggQLWG8gFaqMb9MOW1Nco4
Message-ID: <CANn89iJPE=rCExzfFw-eKe5PiukTnmUogaLJSXgo6JfDeZiezQ@mail.gmail.com>
Subject: Re: [PATCH v9 net-next 09/15] tcp: accecn: retransmit SYN/ACK without
 AccECN option or non-AccECN SYN/ACK
To: chia-yu.chang@nokia-bell-labs.com
Cc: pabeni@redhat.com, parav@nvidia.com, linux-doc@vger.kernel.org, 
	corbet@lwn.net, horms@kernel.org, dsahern@kernel.org, kuniyu@google.com, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, dave.taht@gmail.com, 
	jhs@mojatatu.com, kuba@kernel.org, stephen@networkplumber.org, 
	xiyou.wangcong@gmail.com, jiri@resnulli.us, davem@davemloft.net, 
	andrew+netdev@lunn.ch, donald.hunter@gmail.com, ast@fiberby.net, 
	liuhangbin@gmail.com, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	ij@kernel.org, ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com, 
	g.white@cablelabs.com, ingemar.s.johansson@ericsson.com, 
	mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at, 
	Jason_Livingood@comcast.com, vidhi_goel@apple.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 7:59=E2=80=AFPM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> For Accurate ECN, the first SYN/ACK sent by the TCP server shall set the
> ACE flag (see Table 1 of RFC9768) and the AccECN option to complete the
> capability negotiation. However, if the TCP server needs to retransmit su=
ch
> a SYN/ACK (for example, because it did not receive an ACK acknowledging i=
ts
> SYN/ACK, or received a second SYN requesting AccECN support), the TCP ser=
ver
> retransmits the SYN/ACK without the AccECN option. This is because the
> SYN/ACK may be lost due to congestion, or a middlebox may block the AccEC=
N
> option. Furthermore, if this retransmission also times out, to expedite
> connection establishment, the TCP server should retransmit the SYN/ACK wi=
th
> (AE,CWR,ECE) =3D (0,0,0) and without the AccECN option, while maintaining
> AccECN feedback mode.
>

Reviewed-by: Eric Dumazet <edumazet@google.com>
