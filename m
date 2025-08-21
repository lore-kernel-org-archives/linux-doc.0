Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D465322A1F
	for <linux-doc@vger.kernel.org>; Thu, 21 Aug 2025 12:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755780955; cv=none; b=u3yoPNQX7ixJt8Ln3GCD1WiIEjKBtyg1jr9ENQOJv4VStrFuNbmCzGNWSFuaJoTH0AeAs1ayRQj4GQB3bjon/KN+DguqJ/c/J+ePZnIsxo1h6uzmAgzCUNHerQYa/fQiWHibCKc3gAx+GTL5fMqewjnW+y92s+IkqYKYqC8xpTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755780955; c=relaxed/simple;
	bh=yP4uFd+CVN8QmVu0Qh7N2PPSnM2w3mGXDGkAjb/uMEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OtFyRUd8HTugXRBmETwF/TL4mgA+xCjcdaW0NfLM/Cc9d5dNSvJwyiGcAL63GtYH34tU2hQeymTAalNHxumD+H2jHLJv78jrLczFNg78jgOpRsfmAUiyrKifz0zWpxqvK1/8KpvMtfkMb1cIsdnbupyfHtTweY9SUSKoP3FMAXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0v9oDKlh; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0v9oDKlh"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4b109914034so11102961cf.0
        for <linux-doc@vger.kernel.org>; Thu, 21 Aug 2025 05:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755780953; x=1756385753; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5528SypKxmfUKQp47IYx/CNrd7NN62FARpZB0q9InII=;
        b=0v9oDKlhRpjnuMvP16A2EZtSRJmnIUAzPrkFiknLNjiksyODNmtE5ZUHemXXP8cNVo
         +nWpxM4EhCNHrH+9ykjIKmFA+n0yQY/pFJ+4oqcJ33n8KqC9qRuBljoPXKKzSChHQPGb
         FC8PpKql0hhlMF1UPYzhYMnoUn5FlH+HBiKG30NYdYerqzbKni0ucCZVH7Dil/1Uheoc
         ylMPlpX9UXXs7hkojeuXmJsvCj+WexH49ki8M15XE5ZggqZVEgcC6apRqZfp3g/4zyJh
         HnLxGKxlkhfzI9yNlnc+OhrqjZgRJi5wKoHS9DV2dkL0OxCUS0mEpG1xKiv928QRi5Z5
         GC/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755780953; x=1756385753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5528SypKxmfUKQp47IYx/CNrd7NN62FARpZB0q9InII=;
        b=Bm8PhqYMU/96PUAZ+4A0oDj2W27kEDZ8YgLLhk7y9JTOL+8XgVTvpRafHMHhwlWWsc
         rxA+OgMQ2FFt/0fJd0MWZWCVDz7vAclfX75YFMyX/dFxJZ89fkrp6sCGwEsoUvC0/INs
         QFe4Ct7sH45Q7PJ+I79XvTHqbkSnvX81AHjgYuoQTwRrNJ+89Xgo4nWZoi3QbAe9aXGU
         J8fsoGaz2IVRH/znFcW1MwJ+CS/yuLNP58+DIkPpiOoZqp8kL+gKidqrep1afo65FAdt
         dXeHKLbCzcE6JYhChOTIFAqFn+gdb5CHAphY4F0bPNmUpkuQXYsXQGGAxwzREhA0knl2
         +s5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmL3UzlD9+31y4sQIcLO80J91epQfMj4tzazT7BSaCKk77oECvpydIt+RBE1tUTanF/cgKujL09h8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGdAFOpPYlJKwEJVHGD/pnnYzAhRnCgTk7qBeDsjQRFLvmiWQM
	kROYjlFa10VIcf2vxkTZkPCIHaFldtY/2M6HEJ4A/VMbjUpPRK6km2OhaeTj+3gVAnOJEge5/zs
	QQADG51CTJGQc1Tar3ZTLoJcxDHvyDzyUra1rCsD0
X-Gm-Gg: ASbGncs53BZoHrU3A4xq8onEvn9BECuinApSh1OKdVfncrpHCt8wYfJ5BJvv7zuAg8O
	1uKVKAxBjohcCaIpe7wON6OlHx5gidJb/rMO6mguA4DaeN81cutv4h9Ph1iiv6szQD72ewSSOVo
	Wh3vETGG1u5nLPhh3sLdE3a/9mDseial60CQsURinYzKp5QIvue2FpEuTxTGjje7XgZ4Hxiib5q
	17mBRR1AxGtbUs=
X-Google-Smtp-Source: AGHT+IGxDBe1t3tqBTBMYOGbwfPoYLNM6YX1F3rAdQHXVgz1RYTgaAusYj182uyw4hmqn9/ToW6pADpoA8RYUEd0S3w=
X-Received: by 2002:a05:622a:5917:b0:4b0:f059:74a0 with SMTP id
 d75a77b69052e-4b29fe8f3b0mr29953531cf.38.1755780952620; Thu, 21 Aug 2025
 05:55:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250815083930.10547-1-chia-yu.chang@nokia-bell-labs.com> <20250815083930.10547-13-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20250815083930.10547-13-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 21 Aug 2025 05:55:41 -0700
X-Gm-Features: Ac12FXzVorC3Kl9sEMZivEmtWbDbh3dePBwk2mL_884gL-t00rnVrn0sX3b2dM8
Message-ID: <CANn89i+xNs7jfc3OF42J0jat=-ivrQgTfycJPyKW28yTJPaaDg@mail.gmail.com>
Subject: Re: [PATCH v15 net-next 12/14] tcp: accecn: AccECN option failure handling
To: chia-yu.chang@nokia-bell-labs.com
Cc: pabeni@redhat.com, linux-doc@vger.kernel.org, corbet@lwn.net, 
	horms@kernel.org, dsahern@kernel.org, kuniyu@amazon.com, bpf@vger.kernel.org, 
	netdev@vger.kernel.org, jhs@mojatatu.com, kuba@kernel.org, 
	stephen@networkplumber.org, xiyou.wangcong@gmail.com, jiri@resnulli.us, 
	davem@davemloft.net, andrew+netdev@lunn.ch, donald.hunter@gmail.com, 
	ast@fiberby.net, liuhangbin@gmail.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, ij@kernel.org, ncardwell@google.com, 
	koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com, 
	ingemar.s.johansson@ericsson.com, mirja.kuehlewind@ericsson.com, 
	cheshire@apple.com, rs.ietf@gmx.at, Jason_Livingood@comcast.com, 
	vidhi_goel@apple.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2025 at 1:40=E2=80=AFAM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> AccECN option may fail in various way, handle these:
> - Attempt to negotiate the use of AccECN on the 1st retransmitted SYN
>         - From the 2nd retransmitted SYN, stop AccECN negotiation
> - Remove option from SYN/ACK rexmits to handle blackholes
> - If no option arrives in SYN/ACK, assume Option is not usable
>         - If an option arrives later, re-enabled
> - If option is zeroed, disable AccECN option processing
>
> This patch use existing padding bits in tcp_request_sock and
> holes in tcp_sock without increasing the size.
>
> Signed-off-by: Ilpo J=C3=A4rvinen <ij@kernel.org>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Truly invasive changes, what can I say....

Not sure why you CC so many folks which will very unlikely give any feedbac=
k.

What is the purpose of WARN_ON_ONCE() in tcp_accecn_option_init() ?

Just to feed syzbot ?
