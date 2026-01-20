Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849283E9F92
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 10:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768904324; cv=pass; b=m917z4y8gJqPGbVp107pRgOJy4g9vWrWIfJgCWszlXWh/zn3FxSmWArOAqJ9tIGdxNAmF9CBKiIGPIn5uj82QmkNGYhTXe8Jh6RRkNO+MqD+oEhfyORAxE2UqinFS4pIg64VLkTq5rZH4L/DsLDTZFth9sgZf/w7kDt9x0zABfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768904324; c=relaxed/simple;
	bh=b3/vqEjOYP5wT8rQWVCJ7bEZ9Lj9Z/WoJtk7uoPUAaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=akpu1g8VlTCLm7N2Nq9ZHWPPZM45f9xggjRWn9fjg4WXpVfhQCkubgqLRPkSF47V4nM0dTV9AIu2smOOuXjPwTYdYzNZN72sa1NBG75pcPHsBsxexGyYzcooMq6rd9rSQoR9scNVztVKlXOBRAkW8NPgRCsYAToVGH+pZ4bND28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RaYwrACB; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RaYwrACB"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-502a98c66f7so30775941cf.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 02:18:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768904319; cv=none;
        d=google.com; s=arc-20240605;
        b=kscVOb9ncYUGhr7aT7ne+BQTO3J+JqPURDdrkBG6LYmNBuPxs+0DLpxAxgW2EPOYDK
         w9b6fqUwSxWYFHyZAkkDujdFlsYpVu8KUk2Pq5uUrWPKaUQJUsjgsJJ5wHX06ddelUAi
         C4RoCT+cyPJBdQwUZjUDG156uMmDCRHfmX5AwxMz0cFISMpvHbla0/pIHtr0qLRUqg8X
         dUByFHu2+0xMkfwyzLhy1cncIn8W3Ojn4Vlfuept3Uk5pe5KigMCH6dii0kHSByrTofS
         FKkV12sCR3o8fPL4eH6VtK5dEh7vD2ZZaUHrK2b7QGM2rUMKqYiipZJM78K2VR4X2VXb
         Qchg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b3/vqEjOYP5wT8rQWVCJ7bEZ9Lj9Z/WoJtk7uoPUAaY=;
        fh=qHPQZT2iCXk9m+rX6lnN3LuVYTlRjETz7EF9rZu2qF0=;
        b=RXZi7R9eOM3uQSmBFeCUsSJcJjeBFvYwUPb1Il3SGdhpKjNwDv2QdGgcd1CK/XIYOK
         60daB8LDMR0ZnnT0zuybcaX0iY8Uul9kLUNRhYnOIk5FNr5EUuM5kufjpC7DqMUA7hyk
         Iu4VoBTPURn8JqyfFkP0898eG+hjfQnNi+283u6BnpscuTbeEgjzNTtPFkG9YqolOYLq
         z7RgYxsRSGOoAP7f8njdnVrJNUqELAAhPe7sftUN2Zf9vBKdk3DVx1ugzlZCXMB51msy
         aOQsd3QEenxstqY5f0QiCowKHM88o4YfdacF+lEENUXTXcdhpWQ8vzcHF9HagiSb71Pf
         tASA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768904319; x=1769509119; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3/vqEjOYP5wT8rQWVCJ7bEZ9Lj9Z/WoJtk7uoPUAaY=;
        b=RaYwrACB1pbJO9Q6eDg48UcHrWDmIg6oer89G3yBKamt5wwYLsIRNgBzqeyZqinyba
         XXViknaRsH9GVvVJsQWjHobR+hK20LmZ+kCnvzRCCkUy2htPs/doFR1WyyU9KtpZ1NT2
         ffDFimp/p0rAcoOXBu2185cRD+C54AinpRKF0oWW07214gGokq9p53sGIEIRu73kxYTG
         8/jafdk3orEy3XR3378E9zGmHbEO++wHIohIOy+tgE2BlOqrNRI5pMASS9G8c+SXVhbV
         ks9AucTDVt+4Zbgyqfty4lHAGyWi2A3wX6dIv6RueHd2dxMa+dbhXLrKkRCMGoK/1nlp
         rKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768904319; x=1769509119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b3/vqEjOYP5wT8rQWVCJ7bEZ9Lj9Z/WoJtk7uoPUAaY=;
        b=aceJgbpXWQ2U4cKunZedGFbXqQ06ghugw6CPtDb+wfLakOHBWOSh65fJHEiKQsv8NE
         F3crBClsLCWZ0Psb5kAHUxGMZHS6xvvzfZFQeUCWR5/cFAbozhfkPRgBe9LgbMHyY2FN
         2vLjGvcN3w65ci96oQlfZsVth2iBV9uTblWTlCjS03Gc3xHA5gHpsChSFnxHn27OkuQ8
         Fd4k1JFd5k7v/0xZ/MCr5mMV0n4Yh0+9q01ayuWciBcVky16qj2UuayfMyU30SuaXykk
         qqw9aRRQkD6Z5SaRoHv8WcqhLtpPcP3F1EoRIt1WZaRIUypoXLcPc+h8lIc/DbiENYHb
         ZwOQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8HuEbaA/7E3sARC3a3Hp+kWb2qFKmt/MI2qcXZyrm1LCoHtE+GTyZhw+jFvLBGYoQMPeYRgpFSms=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/CeUnxXFlEkMxFZ6FUWh0muULkcaDDeP7TfhqwTNet+keOLvq
	O6yGF/0GD0uYGvRQOom3zD6aHXeTfjxJob0uLcFAD2KDuKi8EAeYYAHZtNRy2+/STRBZWwLzvAO
	ZdMrPhtV8KjB1DE6bVdA1n0+WTs571MAmCujjP7Ru
X-Gm-Gg: AY/fxX4I8gd+VV0uaTpYsPk5A5fvGQTBXn1ZLwbKhYZvgee/cLnvoJ7UuuW1WdELAO2
	M3W7sPP9gRtkHz+0G8u+pOpoMAMDUg6ESSWzuYCx4x2cbHeM5G6I7Ti8jFASsy6i26k4RT9yA+k
	GtDtAVGpv/yWUJqHlS29uXU/KTqmtBoAKoepHkv+fW17oEA8O2no5JjggjUF7toby6750eJI7l9
	yHvtP9Rdel9lL76916i3wpfjvJWxumBDGidvm6V7oni0uKiE6VT4beyf+B49mMLQqStxv0=
X-Received: by 2002:ac8:5952:0:b0:4ff:8fc7:917b with SMTP id
 d75a77b69052e-502a17d35fbmr194387991cf.80.1768904318971; Tue, 20 Jan 2026
 02:18:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119185852.11168-1-chia-yu.chang@nokia-bell-labs.com> <20260119185852.11168-7-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260119185852.11168-7-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 20 Jan 2026 11:18:27 +0100
X-Gm-Features: AZwV_QjH7opN_HPqvhqUNXEbYAFk1K1nGv7G-5WTlprpaA8RI4H5El1vduIS2JM
Message-ID: <CANn89iJHz4ecnqfFY9F4Mkb-aKCiCRhtx8++YvKPZbSHy4NXGA@mail.gmail.com>
Subject: Re: [PATCH v9 net-next 06/15] tcp: accecn: handle unexpected AccECN
 negotiation feedback
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
> According to Section 3.1.2 of AccECN spec (RFC9768), if a TCP Client
> has sent a SYN requesting AccECN feedback with (AE,CWR,ECE) =3D (1,1,1)
> then receives a SYN/ACK with the currently reserved combination
> (AE,CWR,ECE) =3D (1,0,1) but it does not have logic specific to such a
> combination, the Client MUST enable AccECN mode as if the SYN/ACK
> confirmed that the Server supported AccECN and as if it fed back that
> the IP-ECN field on the SYN had arrived unchanged.

I find this a bit confusing.

3.1.2 has :

An AccECN implementation has no need to recognize or support the Server
response labelled 'Nonce' or ECN-nonce feedback more generally , as RFC 354=
0
has been reclassified as Historic . AccECN is compatible with alternative
 ECN feedback integrity approaches to the nonce (see Section 5.3).
 The SYN/ACK labelled 'Nonce' with (AE,CWR,ECE) =3D (1,0,1) is reserved
for future use.
A TCP Client (A) that receives such a SYN/ ACK follows the procedure
for forward compatibility given in Section 3.1.3.

The relevant section in the RFC is 3.1.2 _and_ 3.1.3 ?

Honestly, AccECN is way too complex for my taste :/

Please copy/paste the precise RFC parts, it will help future maintenance.

Reviewed-by: Eric Dumazet <edumazet@google.com>
