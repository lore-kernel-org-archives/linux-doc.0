Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95248421A1E
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 11:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768907995; cv=pass; b=H723uz5KfyCsjqfxIcCZWJ20bH5/UIeUKHoXJlfZvm1/d41eMwa2zNKT/0STOXVBZnWdqD5yOKpmPThqOAh5jyP5bkUkGEpabc2X1e+YJK+xs8UWUPj7oIl/1i8oKm7m7jaPF9SH2rSpXLi3NTtDue63GZolalPW2IAVX2opf/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768907995; c=relaxed/simple;
	bh=2SaI+Uz3QGNZurl++WnxVltgVZ/pVYMSpuX7ISsHQbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gbo5EPAnWnlJ4+fhGuI15duysQr2sUDCvqZ2ucVgpGTYSf7iG4v1297bn0OLkqQhicNkwzi8nH73EKis/8Q2yE9lP3nAxkhOHzi0va0LIYZeSA+qNhSpTXwosegLYKjHqJkbBIAhTZ/kpJ20sx5EDg9Y0db7K1Z3FO1OgxKWYps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3L+6hw7+; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3L+6hw7+"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5029aa94f28so39891541cf.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 03:19:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768907992; cv=none;
        d=google.com; s=arc-20240605;
        b=JEdBIIqR1W0o77uAcGMchiSmuko4+YlBmz37c1Y3aoqEkB1tE8z1yPKyVXT58LTwh9
         jkyV79hj6WkzR5WVNbKfIG1e2uKYjNVGL4JmMbpLD3rhNJHT4mHTR2EfarWcUS8pUwv5
         IutbGAID/xLxiRb22ntoMlO3IcOPKpGNpyq0S7nrCUKP1rAyyMmOpA1PhmAaR23lmVK+
         OBUSa83q2ORdODVRbuNBUc2eiuJrN/fe62yGrfyD5KJn4K7nCHAsFkWA0OzTlPN0243n
         VzYBeahJTmJUa0GOP5+WaK/Zv5XhPBVxeXwIovMdKhdReB/5/Qs98H60M2G0IHDUJiMi
         fCkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VqnDOdzFUDP6Yo0/hl8kW5DFgiqEg80gO7B+GBRDshA=;
        fh=yjOiPl9tvH9UntyUt6w6UqoLcnppPVn0it0gG0/w3j0=;
        b=MEYRRInsyZG75ZuAhlYqPGYyDtkrlHh+z2LZV6A1kdA5IHad0HI2Lr5NNw9WdhPqNt
         6S58l5gwuiSne6xdlSYEpWtkqglruLRp9ks/QknOMwvxr2avgKF8v2m06VgmErD89s6I
         m8s+TlijywdawV/dL3mu4cgOfKmzW4dc2XC1FMzyug4T3NxUbDxvT2g4+laXmSiuzsFH
         iBABTrp2mEkcyFvnyb181GQta8/ucSdbeKup7QMTL40cHdCF+/n9Zi9Rup2P5vrPcEH7
         Pjpr3FaNz2wy9W0278UIQ74iFoDzQHC/10lwrC8PLyk2q6pjcz8jxZyu7NkEBaD3qHl/
         Ay8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768907992; x=1769512792; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VqnDOdzFUDP6Yo0/hl8kW5DFgiqEg80gO7B+GBRDshA=;
        b=3L+6hw7+J/bvuzDos2PmP/fEqPXW6Vv/PafJcFx6vJQWpS2lDQhi9uQtq/88F954o7
         vd6e8kufz3LdVkvcgn5AsHHXaqNSpGEYnePLRl9cSosx1tHx37i2+GEW1svJZz7rbSfg
         MVwdzPKbpeMLnZ9CwwtLryrxZr4mBubNjBBu9KkyZcUeQiBgQ7vfBuHGvQk+C4+1GaAZ
         LxpLlOj40rEyQqWfrEGhYFBEkurwtlBWUERzWK6+uNh11EU4Wso03UFCiB1C8dxESqRi
         9IhG/DqVbR2qB3E232HcKoyLKpS6vbr9KoB07TtGlLQLXYEyzTbgkDL437C6Q+jl+ZKc
         0deA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768907992; x=1769512792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VqnDOdzFUDP6Yo0/hl8kW5DFgiqEg80gO7B+GBRDshA=;
        b=Z94QfTCHv0JcufVgyD4SvMXt3zBgW+EIsKtwrBxxBSl895lLwTc8a8/UIY9VYgslY1
         FoDn8bdpvbet3s8f0EL4/G1e/08f7jZQ0/Go9k37v1s7+pB6pQZE/bQK/Y5ehx4qZNlv
         YTpbia/c5p5NOL2NjeQS71UIuw1YUDViCD5F2Q09pNB5e+Zab9DEqqF66D1ALR5Dm4g0
         jXiuyAwHIZXjj/XB5wq7kqmtday2VQsVi5CEgzYuC1zcarBYIP+D4yQr/HCVCEZQtTbc
         scvlJmYATrwA32VZc7pAoxapJ9s833pmUlyNVBgulqB03GD+ISr8FOzvm1gxFRg2Cc2H
         vcxg==
X-Forwarded-Encrypted: i=1; AJvYcCXyXyL1dLxBjyFZ7u6BAlLbLWo6qUbKCiulX09PbMe96+AyxcBa/YujxyDcbudr3BonGdefKWizCVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaONNeJDd98QRl4Jm5wWoYAGfmc5CDwapKolCulhm9T58Hnp6l
	RQBBAsuIeLe3yNzxT6BfWjQ4Bv+Iqcuoj+0A7JufCNg3V7eGDqnb/hb5dqUOmpZGEXU181yBB4F
	XMzXwin5empfopjkeIMkQgO/huHlurnHAw3j7X2J2
X-Gm-Gg: AY/fxX7Nf7V+MUDeH1qS7KZuNLU9AW9N13+/kuzRrPksxn4j0Qzd2XYNqrN100DKu6v
	CraKEo28j/nKx7UN50eTbG6p2wba3r2WSUh46XZNvtTwuMP9/kX8WcSgtSX8GcYmNEFpBHaFvzC
	jywgfvNqOlhirnYZ835cimRCpJoJptZ0rFJkFx1kkRKxg5hCHjWB8g4+kndg1gFzTijocG1ayav
	a3Ziqfu4KnGIdS66S8fCklkU2z+jUBMCE096KyiqIh9wEEQS2sil+OofuGpHwrI/iw5QzA=
X-Received: by 2002:ac8:7fd0:0:b0:501:7d6c:2d4e with SMTP id
 d75a77b69052e-5019fafcbc0mr253993531cf.42.1768907991860; Tue, 20 Jan 2026
 03:19:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119185852.11168-1-chia-yu.chang@nokia-bell-labs.com> <20260119185852.11168-15-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260119185852.11168-15-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 20 Jan 2026 12:19:40 +0100
X-Gm-Features: AZwV_QibkXIKRoXdwgvYg4Ojoj32k0JWscBRg_R3cjBAHC3thHUdUCmCY1qsLyM
Message-ID: <CANn89i+fQQvoVhpg3HVh=RerB1tjKi25kGypVh3fwob2HWoH2Q@mail.gmail.com>
Subject: Re: [PATCH v9 net-next 14/15] tcp: accecn: enable AccECN
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
> Enable Accurate ECN negotiation and request for incoming and
> outgoing connection by setting sysctl_tcp_ecn:
>
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> |              |  Highest ECN variant (Accurate ECN, ECN,  |
> |   tcp_ecn    |  or no ECN) to be negotiated & requested  |
> |              +---------------------+---------------------+
> |              | Incoming connection | Outgoing connection |
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> |      0       |        No ECN       |        No ECN       |
> |      1       |         ECN         |         ECN         |
> |      2       |         ECN         |        No ECN       |
> +--------------+---------------------+---------------------+
> |      3       |     Accurate ECN    |     Accurate ECN    |
> |      4       |     Accurate ECN    |         ECN         |
> |      5       |     Accurate ECN    |        No ECN       |
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D+
>
> Refer Documentation/networking/ip-sysctl.rst for more details.
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Acked-by: Paolo Abeni <pabeni@redhat.com>
> ---

Reviewed-by: Eric Dumazet <edumazet@google.com>
