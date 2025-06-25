Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E56E20E01E
	for <linux-doc@vger.kernel.org>; Wed, 25 Jun 2025 08:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750838916; cv=none; b=IdS3ePf/vogTcyqAQIvzfVfS1o7dbuoLvGIMtyeRWOBQC7NKaPSk7E6Q+8BwSzm7gnQq3AF6Yn0h0Xzu08lWqttzQDegsfbomgNniqSFF6H+3bWIy4K/tVRhBTfYPzC/LuaePZU5rTdIaAOlv0Ni8q6nOoWVo3LzXPL3nd+pKtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750838916; c=relaxed/simple;
	bh=zpwNDepzoTzzaxm0I9H9fOZHI8MES0vs8xLBUSVMd94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R3TkErZn0VpVoRdhZ96viOjxaGwJMxZZ6M1b0wb7qDEi5fo3IPxw96DMHNnFWXsZ6uh7RxZ/BdQ9wJpT7RTbPV7BzfhiIoa8ZP1YFzKezEiVm1uF0tMrm+Dsu97HsrXddW55gp6PMr44SfXCo0ZwpepxKTdnp/o+gajHEDZRGk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cDli5+K8; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cDli5+K8"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a4312b4849so14708451cf.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Jun 2025 01:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750838912; x=1751443712; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nJWUBaRn+NFbAiZsctR9Sk0rJwoQVmEaF8vNrJMha0=;
        b=cDli5+K8H0157CJRrliEULCG1ImmT23LgRW9zs5uWTXWtjR3MYfnR6xfWJFBUKFqa8
         yFuL75yfM5pBJoFxGGO9nwl0kX4KjyCwoQ53xO4uGltcKKPS9APMbI1mzCOx534VLYI2
         RkJUsUYykepxGLVgoyRrglOAao8bxwgILqL5Pwc2BpWyP4FRDXPAoqpOCoH0x/D/swOx
         ZtCgRXV7sRapZwB6/ExxromsmV+tv6EeO7xcw2sbVJ4+8WB1VHecDXDxj/GcZM9YRdi8
         uUa90ntT9APYjRQMWodVc/WSqy4YOF/baC3lEyoxm7GRkywTkVOrpofltvF/KU1Ox7eg
         tEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750838912; x=1751443712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0nJWUBaRn+NFbAiZsctR9Sk0rJwoQVmEaF8vNrJMha0=;
        b=dcYEo71tYRN6UZp1GR/Cl2dQs8ZpyVyeWd3XequrXN1h/7IwyBQhxoowA4mLuYwH0+
         98jeHsvuFb7+gh6i5m9COqLBpNmf+ixPAtdomRPnAWLPrgGRTzlHX9nTbMyM/YaOF/Yx
         g9qbSuAoLNuPSWTRzqBR5HJRk59dFLFL0u0mExsTEexwm92g8346Odqy/NSZ3LuVqkdJ
         FWFROBohXrL8Jz5v8ZaRm2lMXZBcJDJVbzlS6cdOPDreObka6CLWfH20nOisbmfKmkAc
         3sKHntJPIF8ve+HSqYgKerTgAb7Z5k5/46sXW21bPBC66O/7TBvc/XECt/egNJZnWLCG
         yBUg==
X-Forwarded-Encrypted: i=1; AJvYcCWu39JHXbD3KrDKOlUxXn+yWCHn542nFe1eFYKAfy44JKFVhVX6WOEZPLKrSR7PICiN+MITTpC8Lt0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdzvII3dNKoNBhC+XQaFO7vfbskHyErrgEoAT0iRnb4tbgw06C
	A4q6jexKLKoToXwc8OxEhkh9YaWtv6SwZoJX9eFkU66UttCt/HRvcYPeItJ7wcDeWz7v8xMQDFA
	Lg69jFM5BHIpxSR7fD6cOH2WBRqVF7kTgGnVDbRDk
X-Gm-Gg: ASbGncvuUauQpz7Uk+pwpLjVt2PIDeM7OfBqxlzN1ovilydT+bxSqfHX1yFR7N0GfVJ
	k3exKWpdqoO4PTvaN6SUKObKd24FCh0OHrzvEkrzsYhgnHE5dfJVDx0unPlUqdDUbX9FfVoUioE
	N+CmGw0RyNSz1flKPnVIwUZM/n4Bk/ItEA0ZtDIoKDRnsiQkssqeUA
X-Google-Smtp-Source: AGHT+IH2l04goDte8C6MTfBkwicdcfLuBSPT0rwaeShXKmoGSohwlRGdRNtjkixcZ5WnAvB15y3GdC/wXCD1WKJl+GM=
X-Received: by 2002:ac8:5a55:0:b0:4a4:369c:7635 with SMTP id
 d75a77b69052e-4a7c0699e85mr36557401cf.19.1750838911907; Wed, 25 Jun 2025
 01:08:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250621193737.16593-1-chia-yu.chang@nokia-bell-labs.com> <20250621193737.16593-9-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20250621193737.16593-9-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 25 Jun 2025 01:08:21 -0700
X-Gm-Features: AX0GCFtvmPCOCoMB53ZiS7lNiinqU-Ptn3ytwDVPBB0CYTmRz2Bl-m-tFudAibs
Message-ID: <CANn89iLmLeUxBh8kU-RgLZ764QsKUqb_4NiwpwhryPi=7RiZ8w@mail.gmail.com>
Subject: Re: [PATCH v9 net-next 08/15] tcp: sack option handling improvements
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
> From: Ilpo J=C3=A4rvinen <ij@kernel.org>
>
> 1) Don't early return when sack doesn't fit. AccECN code will be
>    placed after this fragment so no early returns please.
>
> 2) Make sure opts->num_sack_blocks is not left undefined. E.g.,
>    tcp_current_mss() does not memset its opts struct to zero.
>    AccECN code checks if SACK option is present and may even
>    alter it to make room for AccECN option when many SACK blocks
>    are present. Thus, num_sack_blocks needs to be always valid.
>
> Signed-off-by: Ilpo J=C3=A4rvinen <ij@kernel.org>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>
