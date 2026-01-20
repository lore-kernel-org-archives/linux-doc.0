Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EE63D1CB4
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 09:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768901501; cv=pass; b=kqdKxkaq6C56OBAGWmnhDCtC1gNJ1TGOoQtGTxTcAd7csD69aMfMNhkELGbJ2eQsrMvnU/fUiqNInuDBGXYjLtan92A4bVQmUl84E5SkeWcAWAC2R2xTe0JsKNNKDSBhQzdSYNcsqcAoiPXxQr+PwjYE8YsKJBaaD8zjZwnWDWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768901501; c=relaxed/simple;
	bh=r2OPr/mJb/5L9shYQDg8Js1LfKdBpkN1T6SX5DgIz24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z6zfhRlfJgRcDkMZK0pxEDCxj9W6pb7eilaIFnr8ofYQkEN8I7e04dd7Zamz/mfhA6dRupbXhuAYYMM76L7btzgA1ZleBVm6Z7PJeEakMqgGg4PzX8lFx9fxMp5ssRZBMfmEnFxLBooN0p93DhRvLlOP7o92yZmLtTWk4Xx+fmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cfLiBtRU; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cfLiBtRU"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-501502318b1so42105181cf.3
        for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 01:31:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768901498; cv=none;
        d=google.com; s=arc-20240605;
        b=AUI2XVAxwD36rlOqU/9chVPfhNHeaFdlZGrq0PW+DNFyM2yynDF+UeazhCjP2fop7k
         MEa3bgoepde5dCG7RaDz6GBD4kQ9UruIFe0CC8Y9tRADPWIA4Qimi4/2TxQcrPf+byh0
         bUjlCSaxqIq2tAeyiyJezBd34TdNtESLcQs376EgBCmJatSE78a/PRYaeOIEsPSbofxf
         F2ImKxeoB9co3Xv2//kpusJgUufzakwE20CfLsE8Y3msCpJQTRAMsaUUluXUFRqJL43+
         eiQlDmJz1bpndzA0dd6ZSqZHvr5SOMPkwOV9avMNSfM/Ijr1JTwjDWkiml7qLcUMipJz
         2jhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r2OPr/mJb/5L9shYQDg8Js1LfKdBpkN1T6SX5DgIz24=;
        fh=NaTAxJrpPAVAtpTgznKSMbf0PeTkGzE9Tj66ME2v+zA=;
        b=fyxprg9ROyZo6Ao2v28DgHvapFpIAfnmBeniqe4F6utDemyV0XV8xQaOON3cPGTeCT
         dVznK7I9Nolz6Q7Tc3tS4a4FnBle5w9BAeAl+bIzIiRD4evzCP5aaPYNDiWUuPJR1MeW
         1pBPO27dhgc5nCm/Sgq+/K4xaaXNaL7anPJB97lLBjdRMhLzOjZ7ZEB42S/cbcUlOPt8
         0UwPg9oDOuQG1gZj/BapX+HT2+aIXzYUOr4vGJSeJJ0RYwajp9WS+19c6wJzSaYlP04X
         XVFNusyO/igSvL4HmjSYR6GqQyPulzStoBAYhlQ9vpJ9x2X3pj2CDw6NH7zOqvn3wxJI
         lXLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768901498; x=1769506298; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2OPr/mJb/5L9shYQDg8Js1LfKdBpkN1T6SX5DgIz24=;
        b=cfLiBtRUY91o1o/2kdjpF6ig7LYi7EPEZBSDpd6sW+a+YUXfBhjr2fEpeJHr/015Cc
         y3f+JrmBg1mKHTe05WzmWcYGC03H178P2oJgzcw/O9Fm6NRXwFO8u2bWbUpEkHP9mLvp
         t+xAIGzN4zaDvXk1aK93G4QDnyRb3DLhJ73yFixua2wxE32One8eS93fCOLb+uiNxmAy
         BScqEPXqiiXneMfSKZwiWmSonyS3UrrWuGo6aNOAzDakMSUK85syqFqGfWFLiWPXPyVH
         Ze4Q3kxWmFwXuahQBxI7ix6gS2n5U+Jn5xmg1ALoVlYeiXEz5IVEQq/KSULpY1uXg2cQ
         u3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768901498; x=1769506298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r2OPr/mJb/5L9shYQDg8Js1LfKdBpkN1T6SX5DgIz24=;
        b=tsJgGBKNKmoiqWiH+8hBYIuedWlX51dcuFlGgk0BFg7C8zjUndUZ17sSt1A4C6ElJ8
         ixgtfuylwSGnLnErB44Tyi64KTDTEAK8PAC5DFf1eIiwZ0xVU7ikdUcs2FISO1/qBXbd
         N6yqA3JvTQ8DDG0XLHLyOxoxanYIqztxrxkvHyson+cPnkEfnc/iGeDfbJ9OidFe1Y6w
         xDjyyHu/v/XRVbrL2E8M47QRIwhIBYfTqDPwkdXYxmfTO9CIeT9v7r/m84IuQQxmq3iM
         JyxdD/BlyQi4BaPucfa4s5tW4txlFAUA/7vXFKsvFFxY2VoE3FdaFQiEOqikd49KJ42D
         qnXg==
X-Forwarded-Encrypted: i=1; AJvYcCXFzB/ciXyE7mcRIHRxFOe08xUD9WJwLVk41wKS0comkIgT690K13wr3uNrMLOnDyKvMC0gDYB7zok=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMK7uqVL1/d7pbSh6Izud4vZlXm1YgW0HfxAicnBL7BRo3CrEb
	ZL73anZgSwmkzmsNP4aa/VPNF7+Z4e2pWGLR9rACLR/agFDT8N/sV3lDU/t/6ppeteFo0zYCrH5
	igpOIQSOaOfLriF6TrWL8gajETu6FLybWLqDWAFpE
X-Gm-Gg: AY/fxX4wmyL7W90Tg/AZjPXf6/5sAmHscGkLJmDgwaAauKcqxHSVjIxRYYFwM3wK336
	dUttmA8FQXIsnUTzRnpwVP0zo+ZgDfwJaSjPbr9DRQgjlvzv6OVnw9dG1CG2FadQtUJvYGcxmT1
	Jp3h3gLl3bYyWQd8HMEf2NqzKWWm6iY7hAuyjw4lDD5sJXx37wQ80bkxq4mrUy2xz1yfZoESfrh
	Ydw5JDTyE1OtqPwtMDPob5CdTcWxKwINOdxxDtIDwo+e829LI/HSJhJYeP1KGGBs52YI1w=
X-Received: by 2002:a05:622a:c8:b0:501:51b6:cd3e with SMTP id
 d75a77b69052e-502d84eabe5mr13635181cf.29.1768901497982; Tue, 20 Jan 2026
 01:31:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119185852.11168-1-chia-yu.chang@nokia-bell-labs.com> <20260119185852.11168-3-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260119185852.11168-3-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 20 Jan 2026 10:31:26 +0100
X-Gm-Features: AZwV_Qj1Jnn01ns8cO1Mwqdo9iNbvBF-noKKnseassUVD5Rb4EGhtZz-4l3C_i8
Message-ID: <CANn89i++X8hRu5nc4ChyYxf=J1kT0QF0sMOW8BLkwpNWi+bkiw@mail.gmail.com>
Subject: Re: [PATCH v9 net-next 02/15] gro: flushing when CWR is set
 negatively affects AccECN
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
> From: Ilpo J=C3=A4rvinen <ij@kernel.org>
>
> As AccECN may keep CWR bit asserted due to different
> interpretation of the bit, flushing with GRO because of
> CWR may effectively disable GRO until AccECN counter
> field changes such that CWR-bit becomes 0.
>
> There is no harm done from not immediately forwarding the
> CWR'ed segment with RFC3168 ECN.

Reviewed-by: Eric Dumazet <edumazet@google.com>
