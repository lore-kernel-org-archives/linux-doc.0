Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595342E11D7
	for <linux-doc@vger.kernel.org>; Thu, 21 Aug 2025 12:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755779069; cv=none; b=hmfpxcmuzovYvi5NT7wXqQqjgX8IG6QT0Dwxwv5tEA9U1VgRHgqxGfF4l23O7+duiRQND4TOJxbOh2CwdTlNfwpsByEo87I0osYSCot8d5xst/dqmTvnW6BVG808qkHkNBf7akdznirkntZVEMFPaakr1FbPpzy9A1aijHm0bvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755779069; c=relaxed/simple;
	bh=f1AbBbvLlmetpbm2cknoVOkum8sEWbncoukC/4LrwuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dTuk15QGlSESUBk9gL0XevWO9SfWVtvgM8ud1sayH9N2xMw7gmdUUTOsw8G48WH61unmE/JN2pVBIWCvlkAOuApzylYaQrk5/VfYy1IFrkIVpUc3PNJKp32iO+FLoszPqsqz1yfEI+sX+1CZl3IEbECYJKnZ0PbDykGSFaIP8js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1d0O64rI; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1d0O64rI"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4b109c63e84so10337651cf.3
        for <linux-doc@vger.kernel.org>; Thu, 21 Aug 2025 05:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755779067; x=1756383867; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1AbBbvLlmetpbm2cknoVOkum8sEWbncoukC/4LrwuI=;
        b=1d0O64rICsWpfp1eb4Q5gc2LxsR6uLVDSPIZcm8PyqVlfeafi0vD4fErSm4wlrEwGY
         /1C5qgn34lKV/0q8/M2nkGtaLrphZRFmZJxRp1sq+trcmeasboSJlozEWSfuMVj5v2ln
         pS9wSyf7yCWv01yYzqo27s37v/XmdSFrHvIcVpyVn6NtPjWJRsReafak0htJaHRKJe6N
         il5/tD0mWSvOwIaTSwHaqHL+w1QjF5BxZScQ8x4Z4m2EzA9dpcH93fFQfASCSCdWVMDS
         eis4A4mS+ZKuiweh7NLa8za4Hc1zI02G+ScsdFmibuMenFxbz/1Z008uPaI5wDi9Sex0
         QTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755779067; x=1756383867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f1AbBbvLlmetpbm2cknoVOkum8sEWbncoukC/4LrwuI=;
        b=IpU8tlRPrW3Wb6khw+cb3EloOWzZUmnvRviW9IlVLz5xBaKtjeP4zNdM01YwQzL7WH
         R9HcgBMOhVFEUtOk2v3SnUYhoBDc0DLl+v4Wiiz8zTd+ks3Lj23JFHIpphoCPFZYjLgG
         1YfL63GG+4aYy7Rdrdd5FxLfKBVmnY/oD7A4h9EGMebi34tK2HRHFGbnEDY1yU6xz9XC
         rkdbJ+v1F/wuxxm4TObXF5W52PyB2MQjZwIWEdtbMy/ZpSz1B6ORoFjFgWBcyQx0DQkU
         AcTCdZdYs9Ndny4+BCi8WxfXM4QcD/2i6W+W/CJjjOyVtLaLAI3O3r/vSu1y6XoiqP+z
         yV4w==
X-Forwarded-Encrypted: i=1; AJvYcCUKgNLfd7Un4LN2qKq1Wxq8X0ijiMRBc96tjHOwC/fZ+q8gC6gR1ePe3JtyTWDPReUDPa5u6GsQ0oE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4dhiqYPSVW2OTsYDPBtQ9cazZMbNAjvlGPoLe/m+ZQwI59yQN
	cTeaNDAiYJu0+RiM+jTYXsO3SwBDSk/M4b0TfOhA4OwYeMu+tWqdHduo3Zr2OBgeaPXXLhZhBLH
	D7xi9vt+m6ZJf1DozuHiTveXFQvND7knzX5vD/Vwc
X-Gm-Gg: ASbGncsZpIvb96qQGfwveYVdzHad189mqdcCBU+etymprUJ7b6nRzd6V7jfN7kpi1KZ
	BgWdrkleMQ1E3+M6Zsgie5UaOHwDYDE6O1JiOrxYWWOn6KYoCi+gUE7eBui+s+FAAnaUhnxeCQK
	HkvC2zE0h7kYHwr3E2hDsBIsIgDK4a0HyIjUscFOC2v0dJXBFTEUOAbGH3aGYZbG1DoS5MkRtxl
	za8Beh26cwOK6oENEoUac2Ogg==
X-Google-Smtp-Source: AGHT+IE9nHthnuO3iyaaTFTophq+5yluqv4flsuTIbWyobQg+AKCHWYdoAelc0nDHS8WwCDQgE8Y49CEmLBBB7iUtng=
X-Received: by 2002:a05:622a:5e17:b0:4b2:8ac5:25aa with SMTP id
 d75a77b69052e-4b29ffc2c09mr20057031cf.83.1755779066699; Thu, 21 Aug 2025
 05:24:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250815083930.10547-1-chia-yu.chang@nokia-bell-labs.com> <20250815083930.10547-9-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20250815083930.10547-9-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 21 Aug 2025 05:24:15 -0700
X-Gm-Features: Ac12FXz4ItLodbd6ls4z56PUPr7M6ZV9VCYXJm2RKx6YiZF5T39E5oM6J1bp_oU
Message-ID: <CANn89iKvwM4EFwzuLXOr8OzddQto_rPfdBHUMLzS=xxG3USzTg@mail.gmail.com>
Subject: Re: [PATCH v15 net-next 08/14] tcp: accecn: AccECN needs to know
 delivered bytes
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

On Fri, Aug 15, 2025 at 1:39=E2=80=AFAM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Ilpo J=C3=A4rvinen <ij@kernel.org>
>
> AccECN byte counter estimation requires delivered bytes
> which can be calculated while processing SACK blocks and
> cumulative ACK. The delivered bytes will be used to estimate
> the byte counters between AccECN option (on ACKs w/o the
> option).
>
> Non-SACK calculation is quite annoying, inaccurate, and
> likely bogus.

Does it mean AccECN depends on SACK ?

>
> Signed-off-by: Ilpo J=C3=A4rvinen <ij@kernel.org>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Acked-by: Paolo Abeni <pabeni@redhat.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>
