Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6509532ED42
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 23:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767914460; cv=pass; b=LKvcfZ5hGD4DNyouWlo0Gx/VnzY832qROLuH6qrcv2atav9dHmIdKG7H/ns/4OY7YYPBm8F7o40d3P6qvTpLaE8cGsme6ft4UJzjuvWyGHKPbQv3PNabcdDdq9kwuc38V+aDgrZQI3Q2+kMQ4SlfsghQyRLngcVnw8YSmiw87M4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767914460; c=relaxed/simple;
	bh=rhCQWH/yPA2hIsQ82SImjkWBzo10eMRYT8Mz8RFa9JE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n4uu0dwdVYwFwqxJp/PXQbR65zqU/mVtnEHakIb5qD1O/ySPi1XdKdsoxkX7unQj9MYzZrPlsTkXOTnJcF09xRc13Pb3zRBxVQSFjshpsj5A0+J/NJKWLlya2aq7xtrTH9n8pzWBJYbgHOWu7QVJdplBctiS49+IMsCNs5wKsbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PoYU/nyR; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PoYU/nyR"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4edb8d6e98aso194811cf.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 15:20:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767914458; cv=none;
        d=google.com; s=arc-20240605;
        b=E4+GU0fOgPkRNlrOjLos6YL3HA0TgJ3bGXhEBqTQNjeeBf+cYXRlkiV4ACzGANrxYD
         3sap2r2SZc3Mai2r0bgOirzgPj7HBK0V5esfa2Zvl5ky9fSbXHuykcaO8aIc4GeIoDuM
         KSzGAnZ0mXV6zfvTEheyQZciIFEIuydaTeO+bqYoh/sII8OCfivN5fjVua1iu7TkLYQZ
         XaRwkfDB2tFr1Kk/H5QTUqXzBcHGRNLgnJRbmwAiePkto/IGvOc9A6MmC68ODaBnOMDn
         54rACXWF7hIsXNZxV5zJD0ciQtrcNdw7M76tbIwE+JHvpZTazRvXT/EwZaChp/5JnvEd
         MSYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wj+2ERqBcujhHCH9Aw3uOT+r18qxiQCPwhg6TrYRXaA=;
        fh=rgIxvIxmRbXv8VxKnu21Xfg/kkFOK6s/3xOfcI8AcaE=;
        b=YzS1EfQESKBcZDCZxxjWMVZcp7FZZYPUI9auWtUDC7qX1xWrZkY4YxCHz25HeSCCf+
         /dNDbZNNNAeotbLIEUZspQVRVEXSbMZs0pza7KQOMB1ntd2SA58aS3WkPLOHBonXlJd6
         FiAj+7S5ouL4g+c1nVIzgH4Nfs/9a5oVYAhKl1xturJroHQdW0Kgkl0GjS1ZErFmyGki
         TY8vEFmLe8S0oiE8tGk8PDfQGitlxm7tLAa7ODhQnaBQFs0pp2nsSRfPCGXX8kJAEFyJ
         Fd1wuiJ+uaS2ZLOKyueed2ewA7UIZBLjxUFRU7O9Jr9QBeiU1lwo+caoU5DM6sNnIAfs
         SxkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767914458; x=1768519258; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wj+2ERqBcujhHCH9Aw3uOT+r18qxiQCPwhg6TrYRXaA=;
        b=PoYU/nyRL6U8AMm+w6+xHu6Rp4iz1e1Zjwndtf1P91rPFzimAMia/xk5fhd449Yzxq
         wOals5bwl/YzYefe3/yTZAjAWkISnRAZn8K1QbpSXs2ccRYiBBAN7hFiMcvfG2xwNXC1
         K57zh+rov+V7kAdpWShLKBCoQ9SSw7P9vZDUIf9q4Q8vTWZJ0QcuRBaPhvGnNIkmk64d
         tEo937ako0z2KeIh2dBrKuWwBp5257PoYUZg7RYNYYdqCoTlndR5zq6h3fwcT3bizaPf
         M86h+FD6RdajgFP379GAaSe+QJc4JG99+Zv5ieYjS26cJc7oZwDse17dx9FHSYA2SaM6
         5gIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767914458; x=1768519258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wj+2ERqBcujhHCH9Aw3uOT+r18qxiQCPwhg6TrYRXaA=;
        b=A3o+TWuOL/ZySJR5G44ayconzZrH1jv9CODUkVZ1281BKreXYoejVd00oFRQsBFIU6
         9dk92Byq/Tiv6jnXk37ca52fr6oHHxhyrmJzv4ODUNU1wkyYZqe9XaTFH1UpD18cEQ27
         IeVqjlmHda8md5SrvjM6uKJMFiRLLf14qqrZv7/udZTLKYJ2kIRtKDCwSSZ3ResCFVAZ
         UyDrMfPpQmsji+s2R0PZyQePrThN2O15joHE99vV+gPcnid/2QNFtFRJK6SZTNJ1uVgA
         67GdqCUfqZL6srjBZVhmFXVwQaKGenZcPiMF+CDfbezv4y2bwEpsIAjfsTz7glSns6In
         6EBg==
X-Forwarded-Encrypted: i=1; AJvYcCXKlR9qEyRmzcuzxloJx5dHAUKEIJ9fvtZzgS8uPO0/mwQgzsuj/Z7zjyXQ1pnbHMwASrwTRXRkNkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZFWAwR9LCeE0iPyAVQymxeqkazyA42MAJQ2bQxBmenwxL9/wy
	hPQQSQR1vhK1/Py9pVlQOOCF7IpVg8j2+bOSSIi1cJsK5/V7UIIi5wGZRl94wKaPLg2wXVzfqJU
	0lvYiS9mmCZQmbXWFp6FkbwpNRhrzJ/vpG09TSuV8
X-Gm-Gg: AY/fxX5+yjw/MS69csRaKtlsReFEBaZDUvd4hngEI/XAC22nleTybQvoDOfb4z44byV
	0Rj9RuHKo9B6pHs1nta5ZItTtPso/Xa9vl4YKkrssM3qkZpweLsOI2vcHwgqyrooxD1MNxCCz6j
	AjlXtcaqXOQHr3FmLL7BF8N5XuAfNJqbzxrtL9v+VJq89cRgwRZFEhtY2tZg4pB22+y9KJU7bvZ
	Njx5DqtnBPKefK8RYjsrRE4SFQd2SmRck7sXNFKq6qArrJkVegGLZPeg/mtKtWGDIYn2Sp3cv+R
	mz645/60ElB13EdNcIquuM+KdVxHqeNJhac69+I6aqbwzKFTgx6dg0v3H7Z2lPg4UKInzg==
X-Received: by 2002:a05:622a:451:b0:4ff:bffa:d9e4 with SMTP id
 d75a77b69052e-4ffcb20efa3mr2340841cf.13.1767914457681; Thu, 08 Jan 2026
 15:20:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108155816.36001-1-chia-yu.chang@nokia-bell-labs.com>
 <20260108155816.36001-2-chia-yu.chang@nokia-bell-labs.com> <CADVnQykTJWJf7kjxWrdYMYaeamo20JDbd_SijTejLj1ES37j7Q@mail.gmail.com>
In-Reply-To: <CADVnQykTJWJf7kjxWrdYMYaeamo20JDbd_SijTejLj1ES37j7Q@mail.gmail.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Thu, 8 Jan 2026 18:20:40 -0500
X-Gm-Features: AQt7F2pqVzz9M7qiJp7DfsnUleYfVSMGUfqYVX43z4keU7aZSTGIZ7pkvS8mv_0
Message-ID: <CADVnQynohH4UyvyKm9rUNcCMbnepJKMwhOCPRFzM5wTvpDR1ZA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/1] selftests/net: Add packetdrill packetdrill cases
To: chia-yu.chang@nokia-bell-labs.com
Cc: pabeni@redhat.com, edumazet@google.com, parav@nvidia.com, 
	linux-doc@vger.kernel.org, corbet@lwn.net, horms@kernel.org, 
	dsahern@kernel.org, kuniyu@google.com, bpf@vger.kernel.org, 
	netdev@vger.kernel.org, dave.taht@gmail.com, jhs@mojatatu.com, 
	kuba@kernel.org, stephen@networkplumber.org, xiyou.wangcong@gmail.com, 
	jiri@resnulli.us, davem@davemloft.net, andrew+netdev@lunn.ch, 
	donald.hunter@gmail.com, ast@fiberby.net, liuhangbin@gmail.com, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org, ij@kernel.org, 
	koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com, 
	ingemar.s.johansson@ericsson.com, mirja.kuehlewind@ericsson.com, 
	cheshire@apple.com, rs.ietf@gmx.at, Jason_Livingood@comcast.com, 
	vidhi_goel@apple.com, Willem de Bruijn <willemb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 5:46=E2=80=AFPM Neal Cardwell <ncardwell@google.com>=
 wrote:
>
> On Thu, Jan 8, 2026 at 10:58=E2=80=AFAM <chia-yu.chang@nokia-bell-labs.co=
m> wrote:
> >
> > From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> >
> > Linux Accurate ECN test sets using ACE counters and AccECN options to
> > cover several scenarios: Connection teardown, different ACK conditions,
> > counter wrapping, SACK space grabbing, fallback schemes, negotiation
> > retransmission/reorder/loss, AccECN option drop/loss, different
> > handshake reflectors, data with marking, and different sysctl values.
> >
> > Co-developed-by: Ilpo J=C3=A4rvinen <ij@kernel.org>
> > Signed-off-by: Ilpo J=C3=A4rvinen <ij@kernel.org>
> > Co-developed-by: Neal Cardwell <ncardwell@google.com>
> > Signed-off-by: Neal Cardwell <ncardwell@google.com>
> > ---
>
> Chia-Yu, thank you for posting the packetdrill tests.
>
> A couple thoughts:
>
> (1) These tests are using the experimental AccECN packetdrill support
> that is not in mainline packetdrill yet. Can you please share the
> github URL for the version of packetdrill you used? I will work on
> merging the appropriate experimental AccECN packetdrill support into
> the Google packetdrill mainline branch.

Oh, for that part I see you mentioned this already in the cover letter:

  The used packetdrill is commit 6f2116af6b7e1936a53e80ab31b77f74abda1aaa
  of the branch: https://github.com/minuscat/packetdrill_accecn

Thanks!
neal
