Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B1530DD15
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 10:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757587169; cv=none; b=E6DkiRvPSxTc2dExBz1cPS1+ieRPaej9eiBWDf0T1fJ9Y1mCcvKIr0fw1rJg2zsmQe36j8ZtGv2VTnpCt61vXAfXChrZlJToZqK82MWdomszv9NliE2L1PDluDleyjodJdyaFxRpRdg2No9w4omLeFGFf6DN+iifyFWp3yOqJOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757587169; c=relaxed/simple;
	bh=i3K4Fxf7hfpTZXUakuir9VBvWZAWa30Q3SjDrMBWzpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m2lveYK23RHfjlo6HGPAUGMWJDKl6PR+GycJ9q+YXCrc3pj73co7mRMD4FerOLhLDuxni1AtgyvCtRhVqlZ/HWHRFKjPr5DlDwh9yFObv4U3g4WF0swjR3Gmst6NGTWquf4Do/U9D3OgtuS6jGP/e7J2tNwjh5PdL7VdLixQz3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G/vy/uXH; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G/vy/uXH"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-80e2c52703bso46880685a.1
        for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 03:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757587167; x=1758191967; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/5NZRakXMPSefxzoUTWOFF7jXrb0Qk67PQkNmcLMfM=;
        b=G/vy/uXH4hHaInZrUtcu+gbfF2UZyccQx4XnA3wTYLPdasbltn7qXFSemjaE8ktMAa
         TeWwTnYowdTL3bHAjQ8IlQJmJl8R+4HKZgVnQNCl4VBz0j7FAdZtNkMYOTFZyagPJmII
         mxzM4xeJ/OA8vH4kq6taAJaboA08DoDCA09qxRFP4/WpS/ibDfDYKtrC1MZLWVeTLajV
         1YMRyBRe1TIUYzz3mReZALnmrUdiWDCX/zcZbK87z2J/exJDSOGk9ouZSux9etq21L9K
         pwKow4u2vwEgcuB697KarH8VZcWnv8LVW0WqRkYv4W0wSkUKGd3dvQPC0m1NSHNZdETo
         JY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757587167; x=1758191967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n/5NZRakXMPSefxzoUTWOFF7jXrb0Qk67PQkNmcLMfM=;
        b=MhSMFQVpPldB0fCT6ca2ShG8Mw8CwfB43Cxcy1FQSkM3CEAdEVMAyXFgk8HmnokDqb
         YkADBeeZOqd/2MT5yrH826x7YuDLto10A8y7A3wsSs9Xn5JvvkN7Qoqp6j+3VoQ+Es8y
         DMJt16tMkhj13WayEAeGcuRcXHOsjFSh5InbYopVkRaufHDvhG80dFMX968SyAcWppNs
         XyzGA6cEd6L0lYm7byxuhEbVEzb5hsZ+YJTTaW0esRJcHHs5CqoMbVMzjYDvgXOXlwMS
         sggtD+Lj8t+2HYhSMuElh5OAJKxgNjPeFm5LSmrNbvxf2lkV2NYfJKXKHyqQwPy7oKtf
         5cxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnpvsNuR0aGidu9u/WmddJk/C55YH7DeccIugRsX+9T8MWEYDryDikyt4ezXHNBynVUI5KyNIIA0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMlGd2GU1w7qtzX4m6oLfXZwCOBUSZWaFwzX/yuxQRWDD8rQY1
	qK6wCvqNCK+JDyV44K9g3dCE+eqQ/M/BpOwMlx2piZhLBJJxvj2SBBFdatIcBih/lZureTuhpgv
	lElBI9mYLB8/zxqhDrtfYPBMs3TxxgSoOwvp0nLs8
X-Gm-Gg: ASbGncuBK3Km6wDtPtQZYOIUgbIunv7kPHUoyI2Dyht9bP5rXExdUx120KyUNdevjkI
	sATeKcxwV/00JmLdFj3X4TjjXB68r6Yok/q4u4YHXDMBIaachMZl5DxLiHEgObOxxP10xMYLJUQ
	1XiwoxqrGEUEaIMMRBTGsnWhHkqLKBMBHxufNjVf9coGFGF5xX5sr7yiHHt8yQ5s+PuOxlIcDsr
	672rqcOdkJatLXo2pFLcspQ
X-Google-Smtp-Source: AGHT+IF13RHUxixDCnJaQJD5HYKG53fEjs1UREQfhmAQiVkkh3Z8KzpXFO+znykAoH6YQe4Wu+wBZD5IVHQdxauw0gI=
X-Received: by 2002:a05:620a:191a:b0:812:693c:bce4 with SMTP id
 af79cd13be357-813c596ff46mr2299523985a.39.1757587166519; Thu, 11 Sep 2025
 03:39:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908173408.79715-1-chia-yu.chang@nokia-bell-labs.com> <20250908173408.79715-15-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20250908173408.79715-15-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 11 Sep 2025 03:39:14 -0700
X-Gm-Features: Ac12FXwjNGPxnTzV9uOkde1KbfezAZ4pzyFGGkehM4wIScw1o9g0Jk-pKtQTlfw
Message-ID: <CANn89iJzdnwtJcEwdyAzNF206bYzmHKqNGoBF7G2pR101ZWS+Q@mail.gmail.com>
Subject: Re: [PATCH v17 net-next 14/14] tcp: accecn: try to fit AccECN option
 with SACK
To: chia-yu.chang@nokia-bell-labs.com
Cc: pabeni@redhat.com, linux-doc@vger.kernel.org, corbet@lwn.net, 
	horms@kernel.org, dsahern@kernel.org, kuniyu@amazon.com, bpf@vger.kernel.org, 
	netdev@vger.kernel.org, dave.taht@gmail.com, jhs@mojatatu.com, 
	kuba@kernel.org, stephen@networkplumber.org, xiyou.wangcong@gmail.com, 
	jiri@resnulli.us, davem@davemloft.net, andrew+netdev@lunn.ch, 
	donald.hunter@gmail.com, ast@fiberby.net, liuhangbin@gmail.com, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org, ij@kernel.org, 
	ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com, 
	g.white@cablelabs.com, ingemar.s.johansson@ericsson.com, 
	mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at, 
	Jason_Livingood@comcast.com, vidhi_goel@apple.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 10:34=E2=80=AFAM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> As SACK blocks tend to eat all option space when there are
> many holes, it is useful to compromise on sending many SACK
> blocks in every ACK and attempt to fit the AccECN option
> there by reducing the number of SACK blocks. However, it will
> never go below two SACK blocks because of the AccECN option.
>
> As the AccECN option is often not put to every ACK, the space
> hijack is usually only temporary. Depending on the reuqired
> AccECN fields (can be either 3, 2, 1, or 0, cf. Table 5 in
> AccECN spec) and the NOPs used for alignment of other
> TCP options, up to two SACK blocks will be reduced. Please
> find below tables for more details:
>
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> | Number of | Required | Remaining |  Number of  |    Final    |
> |   SACK    |  AccECN  |  option   |  reduced    |  number of  |
> |  blocks   |  fields  |  spaces   | SACK blocks | SACK blocks |
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> |  x (<=3D2)  |  0 to 3  |    any    |      0      |      x      |
> +-----------+----------+-----------+-------------+-------------+
> |     3     |    0     |    any    |      0      |      3      |
> |     3     |    1     |    <4     |      1      |      2      |
> |     3     |    1     |    >=3D4    |      0      |      3      |
> |     3     |    2     |    <8     |      1      |      2      |
> |     3     |    2     |    >=3D8    |      0      |      3      |
> |     3     |    3     |    <12    |      1      |      2      |
> |     3     |    3     |    >=3D12   |      0      |      3      |
> +-----------+----------+-----------+-------------+-------------+
> |  y (>=3D4)  |    0     |    any    |      0      |      y      |
> |  y (>=3D4)  |    1     |    <4     |      1      |     y-1     |
> |  y (>=3D4)  |    1     |    >=3D4    |      0      |      y      |
> |  y (>=3D4)  |    2     |    <8     |      1      |     y-1     |
> |  y (>=3D4)  |    2     |    >=3D8    |      0      |      y      |
> |  y (>=3D4)  |    3     |    <4     |      2      |     y-2     |
> |  y (>=3D4)  |    3     |    <12    |      1      |     y-1     |
> |  y (>=3D4)  |    3     |    >=3D12   |      0      |      y      |
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Co-developed-by: Ilpo J=C3=A4rvinen <ij@kernel.org>
> Signed-off-by: Ilpo J=C3=A4rvinen <ij@kernel.org>

Reviewed-by: Eric Dumazet <edumazet@google.com>
