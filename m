Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567D536BCEC
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 16:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768407036; cv=none; b=u+I7UhFR+KEDKHO78VB2qvFfDQs80DH4Mv1rFGp9XEJgoRzdC7LpNjWFHV4Tn7gMYKBU/knv+D/20uj2CR6fdfuEjuTv64Dj1CbuHpmbxhNCWfJJAr67sdTp8Fh3oQ9y+JfJRHLdiQynzuR1idmjXoPytsZqqbN9LOeptEZ4drI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768407036; c=relaxed/simple;
	bh=fyFkPzA7jD86HDqzxLlGJw1nUhjO3+Q6huQ4gYgSwK8=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=EXmkvbMXYrQm953TqJqeS3H2Ya2sfnHTi9GFqeY8mWjrKFkMxTbZTeqjEWczAwAf1HCcqxfg1pUGqdzDEusVl3pwSxWcGLHT5iI834sGBCgwEOKUKse6pm10c2rG+shu+BXyUzm6gLqK5vp0c+5/fMTudzzkW9Z4WaXoaetHDok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qb7eD4xH; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qb7eD4xH"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4ffbea7fdf1so48299791cf.1
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 08:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768407033; x=1769011833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyFkPzA7jD86HDqzxLlGJw1nUhjO3+Q6huQ4gYgSwK8=;
        b=Qb7eD4xHT9jGuwayrTyZvBWPmT271w6HvaJfWvoyjnn/XqpFaNCZrQRRfL+5E5xCc8
         EU+KKfI8Z+X1iBsyBusNqg+sZOyWxOVwU0KXbHKQtyfERkVqurpLEnKWVXILWmW95H28
         mp2s5A+Cx1t0X0/c0JbYG4Wqf2pRwTHpY3DoS+v9SpRD0n2UURwD0uQG+C4O/H5E+Mfr
         5igcCA0Roki6SJZSCKQJSgfJVS/H22mHqx3RSJVwSRLvzuieh08eSIlwKRm6M+3Lx40z
         uuwycI+ymtIQXg/8NUVDDhoxcoOosYLsbK+qcvIU+GXcENmMpwTJbn9PB4k1ihLqdxFj
         mC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768407033; x=1769011833;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fyFkPzA7jD86HDqzxLlGJw1nUhjO3+Q6huQ4gYgSwK8=;
        b=JYjLM6OpaF620If+WlCRx9XO+mfGWUOk4JVfLusGk5DZjULAXnyjW5omWhEa4NMyqm
         GEHcbS3Ld1mleJTOfCpD4zkKm16+rLFHItrXJydFRvXZEiXurAe53G9f6skUYhZUXejV
         9ygrR87SaKkwIDyCAt06tvRmevuy34jpug3gUehpKHHItAK5AcHkPWcfPD5y01UnVEvV
         YxLhwJl2Ta82MFn3fbpojKA09xkxXv5c3ArZhMcNvTKy6sMvGCT/FsnmAsuaMeAb+4K9
         AdA2wGJVAPgCTLi421yv1dqkkuWhp4D1Ff+hXTs+kzWV1TiM0tUwIgY+JKgx6+2dfiT/
         hK1g==
X-Forwarded-Encrypted: i=1; AJvYcCWcZR63G5sKWdYyH/AWLfC82dXV7mlxivtc+g66C5wb2xpUwBShHVWqoHRagtFATTKJ7+j3o0+C9rY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfepSjV9Vu4AnCVcCnCVbe3YZaVWsMvOb28yhM//L0qTQUgTP7
	28//+twN1r4ZBnvDsJBuix/28T4Trrycwq5ZoRRxuX1RYK6T1Rit0hlsMY0aWw==
X-Gm-Gg: AY/fxX7jmhy+bg27b+ziosQatUIBN4FzfCIrFZrrPI6q8FemTAlZWQt4cf3XIb4E13T
	mJxT8OyHCteNfkeFVJNQRJ3jM1YgU4NtowUX6ZyRgLP1hwAMdeojAVgR7P7p/pPYLL7U+7wR6ur
	put1vcXHT75gjBvNmYkQneXDKEdC0Yx0kDwLquWR3dZDBdcAmXzCMcgwALXI6pYMmp98TS9jn9G
	V1mAJminu5580QeTixDhatN5r6G318QPGpJFFdBGL0lzpUrnxn9UPASqfyRHkqhDM8Ct45CWm7+
	ypSer3KStx33NwgZ/FAvMSucMJTQLaI0N+qdORhUlSArWWHYimymeYS0QmLhVic0a5vaDGu+G9L
	qHItO/3gGXFKC7GX5jktNppPRjr1evJxl2MimhPjC24iNwyUYElnSs/W9CE20icG3BHMGMYH16P
	i91EFQ5KC1a5oVaKlPP/UFT3VqXbpSQ+5UkJcFd3clmPB7Es+QH9ywGlwHZTg=
X-Received: by 2002:a05:690c:9c0a:b0:78c:25fa:1bb7 with SMTP id 00721157ae682-793a1d6fa34mr22055957b3.60.1768400306350;
        Wed, 14 Jan 2026 06:18:26 -0800 (PST)
Received: from gmail.com (250.4.48.34.bc.googleusercontent.com. [34.48.4.250])
        by smtp.gmail.com with UTF8SMTPSA id 00721157ae682-790aa670ec0sm91265417b3.36.2026.01.14.06.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 06:18:25 -0800 (PST)
Date: Wed, 14 Jan 2026 09:18:25 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>, 
 Neal Cardwell <ncardwell@google.com>
Cc: "pabeni@redhat.com" <pabeni@redhat.com>, 
 "edumazet@google.com" <edumazet@google.com>, 
 "parav@nvidia.com" <parav@nvidia.com>, 
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
 "corbet@lwn.net" <corbet@lwn.net>, 
 "horms@kernel.org" <horms@kernel.org>, 
 "dsahern@kernel.org" <dsahern@kernel.org>, 
 "kuniyu@google.com" <kuniyu@google.com>, 
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
 "dave.taht@gmail.com" <dave.taht@gmail.com>, 
 "jhs@mojatatu.com" <jhs@mojatatu.com>, 
 "kuba@kernel.org" <kuba@kernel.org>, 
 "stephen@networkplumber.org" <stephen@networkplumber.org>, 
 "xiyou.wangcong@gmail.com" <xiyou.wangcong@gmail.com>, 
 "jiri@resnulli.us" <jiri@resnulli.us>, 
 "davem@davemloft.net" <davem@davemloft.net>, 
 "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, 
 "donald.hunter@gmail.com" <donald.hunter@gmail.com>, 
 "ast@fiberby.net" <ast@fiberby.net>, 
 "liuhangbin@gmail.com" <liuhangbin@gmail.com>, 
 "shuah@kernel.org" <shuah@kernel.org>, 
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
 "ij@kernel.org" <ij@kernel.org>, 
 "Koen De Schepper (Nokia)" <koen.de_schepper@nokia-bell-labs.com>, 
 "g.white@cablelabs.com" <g.white@cablelabs.com>, 
 "ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>, 
 "mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>, 
 cheshire <cheshire@apple.com>, 
 "rs.ietf@gmx.at" <rs.ietf@gmx.at>, 
 "Jason_Livingood@comcast.com" <Jason_Livingood@comcast.com>, 
 Vidhi Goel <vidhi_goel@apple.com>, 
 Willem de Bruijn <willemb@google.com>
Message-ID: <willemdebruijn.kernel.a2eb52bfa5d5@gmail.com>
In-Reply-To: <PAXPR07MB7984F8BDC1261BD144D20DCFA38FA@PAXPR07MB7984.eurprd07.prod.outlook.com>
References: <20260108155816.36001-1-chia-yu.chang@nokia-bell-labs.com>
 <20260108155816.36001-2-chia-yu.chang@nokia-bell-labs.com>
 <CADVnQykTJWJf7kjxWrdYMYaeamo20JDbd_SijTejLj1ES37j7Q@mail.gmail.com>
 <PAXPR07MB7984F8BDC1261BD144D20DCFA38FA@PAXPR07MB7984.eurprd07.prod.outlook.com>
Subject: RE: [PATCH net-next 1/1] selftests/net: Add packetdrill packetdrill
 cases
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Chia-Yu Chang (Nokia) wrote:
> > -----Original Message-----
> > From: Neal Cardwell <ncardwell@google.com> =

> > Sent: Thursday, January 8, 2026 11:47 PM
> > To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > Cc: pabeni@redhat.com; edumazet@google.com; parav@nvidia.com; linux-d=
oc@vger.kernel.org; corbet@lwn.net; horms@kernel.org; dsahern@kernel.org;=
 kuniyu@google.com; bpf@vger.kernel.org; netdev@vger.kernel.org; dave.tah=
t@gmail.com; jhs@mojatatu.com; kuba@kernel.org; stephen@networkplumber.or=
g; xiyou.wangcong@gmail.com; jiri@resnulli.us; davem@davemloft.net; andre=
w+netdev@lunn.ch; donald.hunter@gmail.com; ast@fiberby.net; liuhangbin@gm=
ail.com; shuah@kernel.org; linux-kselftest@vger.kernel.org; ij@kernel.org=
; Koen De Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>; g.whit=
e@cablelabs.com; ingemar.s.johansson@ericsson.com; mirja.kuehlewind@erics=
son.com; cheshire <cheshire@apple.com>; rs.ietf@gmx.at; Jason_Livingood@c=
omcast.com; Vidhi Goel <vidhi_goel@apple.com>; Willem de Bruijn <willemb@=
google.com>
> > Subject: Re: [PATCH net-next 1/1] selftests/net: Add packetdrill pack=
etdrill cases
> > =

> > =

> > CAUTION: This is an external email. Please be very careful when click=
ing links or opening attachments. See the URL nok.it/ext for additional i=
nformation.
> > =

> > =

> > =

> > On Thu, Jan 8, 2026 at 10:58=E2=80=AFAM <chia-yu.chang@nokia-bell-lab=
s.com> wrote:
> > >
> > > From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> > >
> > > Linux Accurate ECN test sets using ACE counters and AccECN options =
to =

> > > cover several scenarios: Connection teardown, different ACK =

> > > conditions, counter wrapping, SACK space grabbing, fallback schemes=
, =

> > > negotiation retransmission/reorder/loss, AccECN option drop/loss, =

> > > different handshake reflectors, data with marking, and different sy=
sctl values.
> > >
> > > Co-developed-by: Ilpo J=C3=A4rvinen <ij@kernel.org>
> > > Signed-off-by: Ilpo J=C3=A4rvinen <ij@kernel.org>
> > > Co-developed-by: Neal Cardwell <ncardwell@google.com>
> > > Signed-off-by: Neal Cardwell <ncardwell@google.com>
> > > ---
> > =

> > Chia-Yu, thank you for posting the packetdrill tests.
> > =

> > A couple thoughts:
> > =

> > (1) These tests are using the experimental AccECN packetdrill support=
 that is not in mainline packetdrill yet. Can you please share the github=
 URL for the version of packetdrill you used? I will work on merging the =
appropriate experimental AccECN packetdrill support into the Google packe=
tdrill mainline branch.
> > =

> > (2) The last I heard, the tools/testing/selftests/net/packetdrill/
> > infrastructure does not run tests in subdirectories of that packetdri=
ll/ directory, and that is why all the tests in tools/testing/selftests/n=
et/packetdrill/ are in a single directory.
> > When you run these tests, do all the tests actually get run? Just wan=
ted to check this. :-)
> > =

> > Thanks!
> > neal
> =

> Hi Neal,
> =

> Regards (2), I will put all ACCECN cases in the tools/testing/selftests=
/net/packetdrill/
> But I would like to include another script to avoid running these AccEC=
N tests one-by-one manually, does it make sense to you?
> Thanks.

All scripts under tools/testing/selftests/net/packetdrill are already
picked up for automated testing in kselftests:

https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commi=
t/?id=3D8a405552fd3b
