Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AB0451056
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 18:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768933332; cv=pass; b=E3DNOHIm49R9bijKn8+CrVakgAcSmvOS/IrUk6H04ZskPX7UlclhBqt2BulT0i8fDSEDSICDp7YKcNAnGDojrQmpmata0LCURyzm2WRnt9IbzdWklyx45mMaBLDmAEI5XaSggmu7FxWvNsSV/nxV/PmzK6OcX8r8Eq3/7hKRBRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768933332; c=relaxed/simple;
	bh=ZagQrHQFuN6e2A4tbUmN0iCJ+Oxzcz6Xqi1hSuy4FGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C0CAjju2FKop3ljE5HEhnYulk2TK43kkv2g0pZ308ZHhbW8kI7ZRq+eqKnYfeqll67OGVZeMTDwIrPU7gQSvzGcRSA8fYo4brFBQinZTkajlQz13SbxXSs0sQErwST5p2izw/XgDavIfVSNYqM3PULSQsxw6YGkR7+bmgRtZ/Xc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V1twhqfN; arc=pass smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V1twhqfN"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8c52f15c5b3so647406285a.3
        for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 10:22:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768933329; cv=none;
        d=google.com; s=arc-20240605;
        b=GMilbATTzlw1ZsX4682pfjFyvq/JDsYLK0OZzif5ubHDtWeV+E8o9eoJMT4896ZlEf
         IfDr/v/K0lwVBeapu3wcUp6dXrWihrKxn8vJxSvCdy+5r9xodc3364da/lYLApxHjyY4
         W0oRLIGR0k7Eyn5ya32qvV+8g1rtyoJGzPlDkcgsMjpnu7nWFGgCLnIwMjS9hinfU+wq
         XhrseQobs3KrYx4n92bcGvrrY4I6yCRE89dEs44o427scAyFYe6V1wTxvExfRR7ii19+
         CG28P9lUGqyl4yJR6vVIiGfVpBGvwW1CPkUs5MQ7mJCjpZu+3QSgZ5Z/pC6/G2OtNhMF
         f9sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZagQrHQFuN6e2A4tbUmN0iCJ+Oxzcz6Xqi1hSuy4FGA=;
        fh=F0Tld65yzEGJHj/O3aNV/PDGjXtpp+hIAPCY2o7lbts=;
        b=KaC6XUnQlL1tlpzsGnMMm/ZZrkas6V4VdiuMenpD/XPgr8yx9FIBB2ri/KlveD+XCe
         kPO6ICN98IsQhHsehnjziA1MK8HudZb2lu+fD07GkrYQO/CtdDONE4HVg7Sg1lAH/0Wp
         mUkHWCrsBVc74NbS2toz7WR3qr64JiITA5gNQF17yI1aZCtuQf3sR1b+KQTXnXpoESyi
         NT56r+HaEXxXHVgrx6Ohv0+5A2lVoXHNR/59UhcnD3lu4keXmYJP74DmUYRzAiWS/NSK
         jficBpdkDPF76gJPTev4asR+UVFBlBWJoY++s/pMV0SmiNpls4qpVD/ioyZAVBQrGn6N
         tc1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768933329; x=1769538129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZagQrHQFuN6e2A4tbUmN0iCJ+Oxzcz6Xqi1hSuy4FGA=;
        b=V1twhqfNQgxIqAL86UhV6eZ5ewl1/+v1oclnw3QqGrQ+4Efb5K5rcNuQwnoPMEk/iM
         MedsZuiGr2botbP8R9adTT78c99XtNZ0e1rcB3fkasa3i8QT+wtFnUypT9PqHmc8Qi1f
         0z555qgfXkq+ft1tx7Ki/WOaJAyQZrqM+Af6/YSYb6fImgkhnSnQPw5dnlYmRDkYunlI
         py5Sj9CvGbgStbZrcTxi/AUJIXJjqoBjCh6//Qls/ZJG9KBuFNTA7+IMHa/W9ksBidi0
         HstoMirl5zMXIwoUKPrDf1arq8oeiNJeXr8KuSIvIlfhKahPRUAPph1w7tsS1pyTcjKm
         b8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768933329; x=1769538129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZagQrHQFuN6e2A4tbUmN0iCJ+Oxzcz6Xqi1hSuy4FGA=;
        b=bsuIN/Y52Yl30r1JlkqWhIcHfKRhHKWPXswNgow9vFsFv34wtcCud+Hq1/dxfEeL5C
         CHqjZo5qtAvPUSRRjclJG7bXn0eQj59QPedKuS1dsiQ+gjxkAo+441NR6f4skBLJMLON
         yNXR1piXvh8tFiNyLKVWiD+XMvewrHset4Vispff2WstYSH14o/K8u94sBQEDzMMGNFB
         eBsM/DKpWKAp4nP4i6H5kgap68Z5sLg1ENWaaNdVbGitVuRI0CToCdYdJtHm2VEr0QnV
         d4mLslJ4wqWnH6DUBLDkPvCqrYx/Kq/PZSwS0H419VYjKSBw6hkGJnY5QJSwdwnqX8Tr
         nP5A==
X-Forwarded-Encrypted: i=1; AJvYcCWhtCG5o4fthDNatT0A0z4sWWFlTO5kBydxr9fYjAlKlEi2q5OVpXiPA5RMoSQ+unueqF43V2YxeJI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1msrouIYPAAFqPrINV52B2ATfsuYj22L/l1dPsv5COVenl16M
	W1FQm6Juall+e1oaBKu5svW0lGXXCbBjLD8OeBaNGcPRcW4Jv9TVku6O1RyecOWM9kgvvzpaIaJ
	0Hk4eVcsmRK/ZvvMsmlO4Tr8cUnfMTjwLRfdWWqOP
X-Gm-Gg: AY/fxX757rdb6RqpLLmM/uYlg+qkyIqpjmWAOCWAAb2KKcWEL6KokFfIbO0erPBfAnM
	L3Bkt41/ExjYzO6ERx2SZR+hGSagFFRtHK9z2bMpFHQhYsyDkGier3AIlEAVyRs3AgLliPYHIAy
	0dqAL7SyH15FWigAmxKlKYsJCmmnhyPuKTMqm9f/z2gnxdChVQOlUwfrLeqfHdY3jxcUUbltmEj
	V+ICx/9vbbF4W1HhxYpCACF77IlHlovJFoAfArUgHaKYPADbGduwDZLvqyglazPbachhthZ
X-Received: by 2002:a05:620a:2947:b0:897:56e7:6aa3 with SMTP id
 af79cd13be357-8c6a676db0amr2122139685a.56.1768933328887; Tue, 20 Jan 2026
 10:22:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119185852.11168-1-chia-yu.chang@nokia-bell-labs.com>
 <20260119185852.11168-11-chia-yu.chang@nokia-bell-labs.com>
 <CANn89i+NEyZ+1R1pouUcroarCfNrQEN01azsEhOuZoeR0Y3mhA@mail.gmail.com> <PAXPR07MB7984E2D22D4337CA97EBB9CBA389A@PAXPR07MB7984.eurprd07.prod.outlook.com>
In-Reply-To: <PAXPR07MB7984E2D22D4337CA97EBB9CBA389A@PAXPR07MB7984.eurprd07.prod.outlook.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 20 Jan 2026 19:21:57 +0100
X-Gm-Features: AZwV_QhBrdPdlMbRCuth_kzLC6UfgC6v0TcEzAFsayFTN8n9oL2sLEky-qL_slw
Message-ID: <CANn89iK5jhfO7B1yZK11bEs4DyF3Wjfr6DUgOt-JMDzEAs+94A@mail.gmail.com>
Subject: Re: [PATCH v9 net-next 10/15] tcp: accecn: unset ECT if receive or
 send ACE=0 in AccECN negotiaion
To: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>
Cc: "pabeni@redhat.com" <pabeni@redhat.com>, "parav@nvidia.com" <parav@nvidia.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "corbet@lwn.net" <corbet@lwn.net>, 
	"horms@kernel.org" <horms@kernel.org>, "dsahern@kernel.org" <dsahern@kernel.org>, 
	"kuniyu@google.com" <kuniyu@google.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, "dave.taht@gmail.com" <dave.taht@gmail.com>, 
	"jhs@mojatatu.com" <jhs@mojatatu.com>, "kuba@kernel.org" <kuba@kernel.org>, 
	"stephen@networkplumber.org" <stephen@networkplumber.org>, 
	"xiyou.wangcong@gmail.com" <xiyou.wangcong@gmail.com>, "jiri@resnulli.us" <jiri@resnulli.us>, 
	"davem@davemloft.net" <davem@davemloft.net>, "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, 
	"donald.hunter@gmail.com" <donald.hunter@gmail.com>, "ast@fiberby.net" <ast@fiberby.net>, 
	"liuhangbin@gmail.com" <liuhangbin@gmail.com>, "shuah@kernel.org" <shuah@kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "ij@kernel.org" <ij@kernel.org>, 
	"ncardwell@google.com" <ncardwell@google.com>, 
	"Koen De Schepper (Nokia)" <koen.de_schepper@nokia-bell-labs.com>, 
	"g.white@cablelabs.com" <g.white@cablelabs.com>, 
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>, 
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>, cheshire <cheshire@apple.com>, 
	"rs.ietf@gmx.at" <rs.ietf@gmx.at>, 
	"Jason_Livingood@comcast.com" <Jason_Livingood@comcast.com>, Vidhi Goel <vidhi_goel@apple.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 7:11=E2=80=AFPM Chia-Yu Chang (Nokia)
<chia-yu.chang@nokia-bell-labs.com> wrote:
>
>
> Hi Eric,
>
> Thanks for the feedback.
> Do you mean sk_listener here is read-only despite there is no const here?

It is not const because we probably need to increment reference counts on i=
t.

But if you have 1000 SYN_RECV, they might share the same listener
socket, and we do not lock the listener socket,
this would not scale very well on servers with 10,000,000 tcp sockets :)

So using any listener-fields to store 'per-syn-recv' information is racy.

>
> Then, could you help to suggest the way please?
> Beacuse for AccECN, here we need to set fail flag after retransmitting SY=
N/ACK > 1 time.

Why not use state in req itself ? (Or tcp_rsk())

> And this was done within tcp_make_synack(), but now move to every place w=
here could retransmit SYN/ACK.
>
> Thanks.
> Chia-Yu
