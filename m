Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7364920B207
	for <linux-doc@vger.kernel.org>; Wed, 25 Jun 2025 09:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843995; cv=none; b=VTyKZJRXb5ubEyEiY8fkOryheG+ObvmWl8B8S3MYMgohkj6Ah13SRFxxBsjeo4oaEj/htUcgDOusYkC0W70vKN+o/RJqZRsh8iJv0vRzwzPlBHkZz6nj1BOcQTHO21ZD6CcgjSn1pADHbeVFU6F7MnenGIaXivxKYgD8OV8NUy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843995; c=relaxed/simple;
	bh=EHQEZ9ug+BKYVFfxiYsk5XGLHx7H07bgZOTK3MCyALo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UhkJ8ORYqLiaUCLpufiXp4deWVHQOPxjzppayNxqJ1tVD3tlfqJ5n845VsCPsRQ78nSe9ASwLmHVEb28nklUMS89uIn7Tq0A1G6kRlIZS3rjMBH/BSSimd0SAtL+l6r491Yrk/HOX+L0/dDy48dyXtj/njsmKHahmVBXweUbCvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H3KI95Jg; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H3KI95Jg"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4a56cc0def0so107182561cf.3
        for <linux-doc@vger.kernel.org>; Wed, 25 Jun 2025 02:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750843992; x=1751448792; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHQEZ9ug+BKYVFfxiYsk5XGLHx7H07bgZOTK3MCyALo=;
        b=H3KI95JgPVvSKpWSbt51FkmpBFShBNE7/kJN0w5yW1QK4IAIMz5Nv1C5id8QT6Z/cH
         A4sQvf84GKqrp18jfQ1kTCPyqw0VOeXBrkps9Vl3g7/UYr0B18r54fDy16QeevQ+yim6
         USC3di7fHQOPoGY/kA+BNeSIce6Dk3C3pgaIehbxOQdBHq5frJvnR/ax5e7pKDeUfO3A
         9SMrDRwwedcdECCDnBqXfOiLQj2amWCq5M74f8oei9HBl39uoCRnLZAtsp1bMi8Frn+a
         SokNub3Pt4QCOd8EujzApWr75Wx637ncmrwzbyKB9BlRzLEN293lCCxgnQ0HpLdsDW5Z
         HYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843992; x=1751448792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EHQEZ9ug+BKYVFfxiYsk5XGLHx7H07bgZOTK3MCyALo=;
        b=DrGVlVA/MjpZbdAXOJ5gH8cQwWWLDY3f+M7c8OpyK7loVBD4yc+bAvWuwBMoyi5ze5
         gUGXFoYPGCukZaZKzV3kaggFenxA2li4iTlJyYx5d+okBnz4vPpeVrVo/mcvyOdyW/cd
         HCbOV0Sp4LlQwfUsxso9obd1QEVIGG6bC5ZWR9tTQmhODw7BhURakcLGYu8EUJ/V0GsW
         pPsW+2keaBaj1rBGLKeJQ7aDrzgd0ZE8xxnjnE/g/tvZ/FV/b2gPSi3n6gTjmNFAqCg5
         7UiMpVTJBQLAwR5IywFCLk+ZhslnymId5R+Kbu4mwXPSo0jH5mnnNb+/jGEv8XeyH/Ac
         7IKg==
X-Forwarded-Encrypted: i=1; AJvYcCXSRl7CvXb6U2LE6L7p64YZWu8ZKgQWVSjQr+hsd3ZaTFF6XV3dPrC6aCo49NIJSFBkQhEQ6BpeGls=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK3qOVtFvru/jkoOkJTDe+nrjaUM8BS/86iC/bO0xgVsj4I4Wd
	XQkTTxuNlzrMu77MsWaad0lMryVnfztMkPPEZFYaTAmTsGVaCbW+MnGNZzGCnVXm+TJYXhBIbsU
	jNsMliMbXbGlXzjp488ON6tPAf/d0YE/IhFVUTBCT
X-Gm-Gg: ASbGnctV+UaHbntJX++Il8wEzPK81gE6bZ8zv1ssFKgphEKJio4qbjMZg8mpwHpMRwP
	a7pcmQnujERySXAQGNvo/rYRIvPXO6qoUFOVPJJzKnSdBmi6eqb/DRjlcESit9UhpquBcNO/kFa
	eSQxGIYAQhtSMbkit+7JrxCCXfNvPN2pA8/5EB+qbfHl3la0a+8cmz
X-Google-Smtp-Source: AGHT+IFl2hsx83MoQtHXwzaTy2gdPUKkrnzBZt+R+53c44zwQHWVfxVlZ3qeSa5gcYdHaUTwLPYKINTrqGBaAZX4NCY=
X-Received: by 2002:ac8:5d4f:0:b0:4a4:2c4c:ccb3 with SMTP id
 d75a77b69052e-4a7c0808b1fmr38916781cf.38.1750843992056; Wed, 25 Jun 2025
 02:33:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250621193737.16593-1-chia-yu.chang@nokia-bell-labs.com> <20250621193737.16593-15-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20250621193737.16593-15-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 25 Jun 2025 02:33:01 -0700
X-Gm-Features: AX0GCFvvtwK3EY_HeBJK2lmz3DF6DjV7RiAEa0hah0gNfU2C4uUiuaopSIAF9OM
Message-ID: <CANn89iJQJbggfu63j7cLH1Fr5jPwEh2yP05dZn5pQ=zpk3iXmA@mail.gmail.com>
Subject: Re: [PATCH v9 net-next 14/15] tcp: accecn: try to fit AccECN option
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

On Sat, Jun 21, 2025 at 12:38=E2=80=AFPM <chia-yu.chang@nokia-bell-labs.com=
> wrote:
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
> hijack is usually only temporary. Depending on the length of
> AccECN option (can be either 11, 8, 5, or 2 bytes, cf. Table
> 5 in AccECN spec) and the NOPs used for alignment of other
> TCP options, up to two SACK blocks will be reduced.

I think it would be nice to study how AccECN and SACK compression play
together ?
