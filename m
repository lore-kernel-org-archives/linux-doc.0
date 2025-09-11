Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903F023506A
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 10:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757587056; cv=none; b=Un3WIsNEASeAvHWFioj59Ayit7qx6QjavVKW4N/EUiXLJThK6WhtO1cHr6eg50olesJrHa7b3y2yT6/t8RyR0+yHFBGRZ56UksAz5EkcWM+Wx4fNPb5/5pRk3daKah7t1JKmiR0GCFAjcsj+qAvQmMzW4xyQQmNg5gi0XhFkjvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757587056; c=relaxed/simple;
	bh=gBJAhqvEHPrcQ7AuGOAnRt88ljqyRo1HkemhDWzHqMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SCkQKcDRkeC9TCyvJmzSVMefkhtG8Y0ELtmPW7wxmZqAIzMXzCAnVezdMXCfcBWrpzlZwo9mk95w7iJ+s4U6Sk/D/NSmqbtGUa2GBEBB3lDvWubEz3Mx9isFljAGSz7PMSsgkW7YvhFtZzU2eURNXJt3epBx7oRTxt0USpHQ7hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G/SMOWFm; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G/SMOWFm"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-765936cbdfeso1779346d6.0
        for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 03:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757587053; x=1758191853; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBJAhqvEHPrcQ7AuGOAnRt88ljqyRo1HkemhDWzHqMk=;
        b=G/SMOWFm7C0PlMXZdxkgFZD+AsTFtUjBh6xfVFkGJWtS3gcJJAGefDTAw6+YdzOVxz
         ykyPFnG8F7V418YTJ0XwEbJ6uy+0SGAgyNr+6TzT4ZwVij62NP7cPStiL/gXwnV1c7Hk
         3ORrsOwdD756dR0d3xG5GPpFwOIgk8glcOJIb8nuFA+KoxrFHL+qORzQ8pECyf0KtDs6
         G1yJS2orINxkLoLfC0ZcQJ/zgd9pZE/pz2A9Zq4iAGpSUWz2rrNLP7DrpxhklRiNnEQL
         RuuSdz2tvKb7pvQdMPoQof5vdIqzPTnCmN67X8cAB71mMJkJ1EGDXENSQwCNRu7H/vfd
         aM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757587053; x=1758191853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBJAhqvEHPrcQ7AuGOAnRt88ljqyRo1HkemhDWzHqMk=;
        b=YImGnxVd68Ra03H4/swVD+AMc+oP63jBczo8dGQrPMVMHwcc/UhlXcRl7itx6MGjNa
         4w5XF6R7u0NCxfP2mPhkVBCkHnZCZr9vVMOSGxP2VLk0USIU5XrlvNVSYelmHOqvP19r
         vRa/b5zdYRSCqkXDWCeXJ2BMFloYzO8gmiYDzuARClM2DNqhgircPjIsxmX1j4dbcRpv
         GhKxcCVGvdqJtKf+gl44+qTCBxsgnMf1Ueh9PGO9oDKjFM/VXPRB1ILSCMT/k1tOmBDh
         OyWsmMi/yBUtMXg3ZvBbpHc+70Lpa/b5lJGA+EsJZ1nI+3xD19pG30OXIYi8Usu7JjEK
         kYtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVhUhLQxnc3IbVnzyUCKE3upPmd1dC740BwgbEAAtm0TgBpRc9t393gfZDIBUpWHXxGSrn0SPLurM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOTJLFqSZOEoWL2gi785UT5pN6hBghlWok3+2a1vOt1xqOGnvr
	LpRZBWDEbPuYsfyCoWhtBSgo0J97cHLB4ea1Vb53VTAWFbXZBGXu8XXijU3N073vd9yxIzKUvQ0
	F6qiakitbi4ojTSbsl1IUKeYKB17lLVfObRKw32o3
X-Gm-Gg: ASbGncuIHi5V+zp83c/dmj8GhAI5j6MXfeSsHrApwl+4NzCvsuzyQACmfBmhQJ9/M35
	fF4Kr3GLgcsFBRLK+Z1pe9zJFkvR1/YZ1gWg3vf4+52UjoWToJ6KHh0O/d6bPppyabmBSgk3Jlj
	zbYNDi3cVTi2yBR/DXsa8KpkHkwmBVpMKLG1nlAPHHBJsuzPw9lUnY26sRFM1fkH0ND1JQh7Uk1
	kE8eg2Jc7rH8Q==
X-Google-Smtp-Source: AGHT+IGIfwTrAX+eEwWNUP+gqA0VWd7OCs6gHhATUwsNn4thDtgWH+7/hdJD/+ZIYnscPVsLZtgwRe3URHJuJj1RLH4=
X-Received: by 2002:ac8:588d:0:b0:4b4:9590:e08a with SMTP id
 d75a77b69052e-4b5f848fd2fmr189486841cf.67.1757587052957; Thu, 11 Sep 2025
 03:37:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908173408.79715-1-chia-yu.chang@nokia-bell-labs.com> <20250908173408.79715-14-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20250908173408.79715-14-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 11 Sep 2025 03:37:20 -0700
X-Gm-Features: Ac12FXwkEN44-LdnfGfkXsCmivrlKxkPkl7EsRk6tBWM_mjIrqCCXjB3OREkXDo
Message-ID: <CANn89iKaM5HbOT2wU_qSaSxzyLRfRKz6Y3+AXq9ZmQhWjftMWQ@mail.gmail.com>
Subject: Re: [PATCH v17 net-next 13/14] tcp: accecn: AccECN option ceb/cep and
 ACE field multi-wrap heuristics
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
> From: Ilpo J=C3=A4rvinen <ij@kernel.org>
>
> The AccECN option ceb/cep heuristic algorithm is from AccECN spec
> Appendix A.2.2 to mitigate against false ACE field overflows. Armed
> with ceb delta from option, delivered bytes, and delivered packets it
> is possible to estimate how many times ACE field wrapped.
>
> This calculation is necessary only if more than one wrap is possible.
> Without SACK, delivered bytes and packets are not always trustworthy in
> which case TCP falls back to the simpler no-or-all wraps ceb algorithm.
>
> Signed-off-by: Ilpo J=C3=A4rvinen <ij@kernel.org>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Acked-by: Paolo Abeni <pabeni@redhat.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>
