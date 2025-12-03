Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0D0398F88
	for <linux-doc@vger.kernel.org>; Wed,  3 Dec 2025 16:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764781139; cv=none; b=IXhqI6MYd9WrZoPKXv7AhiHfRCtGE1FkSu6YPMp3xtdVBpz0vj98EwDA9Y73CeFh62RHdebbz/4qTl2YmtIaEWoKGS3wXhJkiNo315uT6Y9ke5lD+rPHAcY4Pc3Ugmz7/3ZG/7sSUepoCppAUZJpQrwpOOHSI2EquVbFYHHeARM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764781139; c=relaxed/simple;
	bh=+w1fh0CLrnEXL5kEY/A4dLuPSBwVUZezWvTx+H8HRaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g+Kf54AEkgw4dHf7e3QenZ16n0uKL+owVj9Ib08NaZDLK6T3gcSwmQmOUntpn98p8ViKijyoHgQPRkVk/P3Uceos8DfcLNMq4tdCK3O1/JL4ABxJeZJPeu9tRnLxwEzs6Pj2e7VS9qgYmFhQEJrVrqbZUdNlq506jtnBB4YtXRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QUjeT7Tx; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QUjeT7Tx"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4ee147baf7bso529911cf.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Dec 2025 08:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764781132; x=1765385932; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWXC9hyoBsRhxJFVF8r6pSxMVZV+OmkuKYv5ee8pQww=;
        b=QUjeT7TxvEEL30tY0/6agvAhLIFLvr+dVNKhmQr6F6MQPF6yjtb4d+7wq47cjPUfjn
         w7ihOu6UIo0n3+MkhYgngm+cDW8Y0eoS0elchOjV9fEHCv5/97tPw2ocqfLwL2/yaKIP
         NLHOWOZWjnIR+UPjMUEVO+TwKP1AOz5IjMBGjMw8ZsLD+Y0J9zSm1/tbpIaYQXCUgMxX
         z7+VYZDrlI1u/bYB+z5PoJQqTckxemsKtqPz8Pss+SDQ6H1mk14mw7N5txQEzBUjU3mq
         l+1hf7CC1VELwKEhpIbgfuV96s/PlyJH2ZIHAdilAYPxy1ZomBQNH2VJ1xHT2nIi1Msd
         NC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764781132; x=1765385932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aWXC9hyoBsRhxJFVF8r6pSxMVZV+OmkuKYv5ee8pQww=;
        b=DxnQhr6xXhVohXjYB7groLLx3wKltckrdPIJ18zuakuaLVRf9efqyheWdj0Cp0xC01
         1LPVEythmTX6vBNrgo0/wMdVhe6CuUWSW0t2+piRtVa1CrbGaBZkDa4lkQJUcLhno8hM
         ybbBi3PkrLuUn9EccByTArsqHeep7kYlWdhpLvfh3xaVcOMbX3T3xTHyYKZ65QgUkPMD
         siIGJiFQzzD/lPP8NC+KK2SON8/5Y0mCFm+UPObsj/iKx/zde+arPLOBL/dAz76t7fFQ
         2Bfe0oVnjLtetGHL09gLyfEessb/wjY6QYNVV+FfRxPivoG6q7PFesTc5JAX22ipnLL5
         ngOA==
X-Forwarded-Encrypted: i=1; AJvYcCVEyC0t7HJVvXeyQlzvfPOwFSZ3qgviqsbBwzzSzAkGpxNSGfZy478v1bJXRgw4bxvN+2V7wJaBxZw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeMnNqz2UPktYJRLPxw34nvWsFHI63V9+oNp14Y36DxloGs1AA
	n8rpSHXc6jsQFYtBnvL8f5eMSKoeYS795vayohzJ695GYurNCbeaYNy6Pt00cEY1ret7IlXYTRy
	CzCdg/zp3y5Zn6mAzO9AxxGOYQLFBYfwKxYg5hlND
X-Gm-Gg: ASbGncv99nNilDz4LH0VmKSEDWgcTdx3305bMOl30KqBuusIN8Y8sOIFD9pM/kTbPVf
	D2ceVth2qx3G4efLmdUwhg0hkDkFTZmg6IU+8HEwc2KBrXqI1y9fTNi/pchFsKJRGd/FRTcpKRd
	qcr22YiExzYHdFZGAZGjdF3QxLmmIsq+CM7rnpB/VbiH0RbHo+ITJd3bR1S6vk/GUTE32jOZkKt
	vnICb9szEf1SC3yuOxi+HUFJOxQ14jQCt0KocoKXCahlXZQhsv05tQ1X1tEZzw7qDNDgogxM+ou
	Cmd9BgIkHvuv7xmiryffpw4rmGIs2/PSP5ecr/MXOQew6rtNQQ7r+SWPczGZ
X-Google-Smtp-Source: AGHT+IEwQDGOVT8Lgzi1wTqV6Us8oL3zoJ/xquBSspLWs/EEWhA+DJcMaq/DF7hunAbCMnNSctvo80o0agoxsFagOgY=
X-Received: by 2002:a05:622a:15ce:b0:4ed:8103:8c37 with SMTP id
 d75a77b69052e-4f015798fffmr13757201cf.12.1764781131112; Wed, 03 Dec 2025
 08:58:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201163800.3965-1-chia-yu.chang@nokia-bell-labs.com> <20251201150509.6cd9fefc@kernel.org>
In-Reply-To: <20251201150509.6cd9fefc@kernel.org>
From: Neal Cardwell <ncardwell@google.com>
Date: Wed, 3 Dec 2025 11:58:34 -0500
X-Gm-Features: AWmQ_bmmK0qcQ0MMg8A5oddcgrqcwdNw6rP5OvhiWOfo_lx74r4d17hh5ndUNnw
Message-ID: <CADVnQynFTrWf_waxGPH6VVPSZapSuxUb6LFdFUGj0NfiADAa7Q@mail.gmail.com>
Subject: Re: [PATCH v7 net-next 00/13] AccECN protocol case handling series
To: Jakub Kicinski <kuba@kernel.org>
Cc: chia-yu.chang@nokia-bell-labs.com, pabeni@redhat.com, edumazet@google.com, 
	parav@nvidia.com, linux-doc@vger.kernel.org, corbet@lwn.net, horms@kernel.org, 
	dsahern@kernel.org, kuniyu@google.com, bpf@vger.kernel.org, 
	netdev@vger.kernel.org, dave.taht@gmail.com, jhs@mojatatu.com, 
	stephen@networkplumber.org, xiyou.wangcong@gmail.com, jiri@resnulli.us, 
	davem@davemloft.net, andrew+netdev@lunn.ch, donald.hunter@gmail.com, 
	ast@fiberby.net, liuhangbin@gmail.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, ij@kernel.org, 
	koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com, 
	ingemar.s.johansson@ericsson.com, mirja.kuehlewind@ericsson.com, 
	cheshire@apple.com, rs.ietf@gmx.at, Jason_Livingood@comcast.com, 
	vidhi_goel@apple.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 6:05=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Mon,  1 Dec 2025 17:37:47 +0100 chia-yu.chang@nokia-bell-labs.com
> wrote:
> > Plesae find the v7 AccECN case handling patch series, which covers
> > several excpetional case handling of Accurate ECN spec (RFC9768),
> > adds new identifiers to be used by CC modules, adds ecn_delta into
> > rate_sample, and keeps the ACE counter for computation, etc.
> >
> > This patch series is part of the full AccECN patch series, which is ava=
ilable at
> > https://github.com/L4STeam/linux-net-next/commits/upstream_l4steam/

Hi Chia-Yu,

My understanding is that you still have a set of packetdrill tests you
have been using to test this AccECN patch series. For the Linux
networking stack, the recent best practice for a significant patch
series like this is to add packetdrill tests to the
tools/testing/selftests/net/packetdrill/ directory as a separate
commit in the patch series.

For a recent example, see:

  selftest: packetdrill: Add max RTO test for SYN+ACK.
  https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commi=
t/?id=3Dffc56c90819e86d3a8c4eff6f831317d1c1476b6

When you next post the AccECN patch series for review, can you please
include a patch at the end of the series that posts your packetdrill
tests in the tools/testing/selftests/net/packetdrill/ directory? In
the commit description for that patch, please include a mention of the
packetdrill SHA1 you are using and a link to the packetdrill branch
you are using, somewhere on github or similar. Then I will look into
merging any packetdrill tool changes that you are depending on, if
there are packetdrill commits that you depend on that I have not
merged into packetdrill yet.

Thanks!
neal
