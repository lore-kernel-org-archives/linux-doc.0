Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE9E31A555
	for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 03:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773460723; cv=pass; b=KdYGwijDBwjchQw1oN8eVq3cdkCaNP9cx//0lS8p8uFfPeqt5amx4z6zkXZ9Z7vZ46nQZTcysgWlCLOoyw6MlOGjNwPmcIf88JOoVyr85LhnGSpKIpPgXNs+jX3AN6+9+2F9nBmoqo3VtMuP+dcOb13F9GChUWJDwjvCk71eczM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773460723; c=relaxed/simple;
	bh=GcSrDIphKrI2//HgDsteTWBHlxHzmnPMjkm0w3xQYSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CeT56epdPdyvSgrbDhpydxLQ8Bi6t+HeRi8SU9ci0BYtLdqGhYsGlJgM4nmBdPOZD6VjVybTEWCwwab89UqM+ARblbvtmoUpfYN8PjDBFreCEZ6wZ9JyG8FYk5754wj4H//MrY9XH8GQEPeYrKvHSoePGHHN9DoBJU7Y+/H8a8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JTgqP31w; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JTgqP31w"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-506a747448dso24934451cf.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 20:58:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773460720; cv=none;
        d=google.com; s=arc-20240605;
        b=GV2OiWTsOBVXTL+iK2VaFxVNzCph0bqw37Tf/eB04fmczh3o136E/zaB6zh7MMGTYe
         y+yqioTucIfApfGNb0H2oq7bCKOt4m2VRCDs1MU4EbYAIg05UA6dCuzI4raNQiPhR+/9
         fdvjDAuP5rjRCWxF1jWmkuEMW6o1/8IuBLvQJz0iry5xGKsEhve1y4kcWvodbtkDMsGj
         OpAuOewTD60VKQbEvNW6pS3ji+lVAM+03z6gygo1jvgtMUTusNlipAq5nIC6oxznilj+
         dxqHvNKXbpzVBQMJxTC8xdgrAzqR8XGLB5YH2WxfF7ZT261YpKs6OSLqableAU43G/Ti
         XVtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OUQRi5vl7ger1FCyv6fx+Ok5M5QQpxd6KNaAJfpodDo=;
        fh=07gpm/AsrmQRRn5ZFv9MAjZXW/sgeSVKIxnh0feXCOw=;
        b=Iu2FL7bvU26g1A+kegNN60nHYbV1UFa0Wz0yIfHIewp5BERarBlUyNDqa6WxV0/oSd
         fdwmGoVZOGOU/YC2tRcrznECXpjnKaLSYY87t50tzwEVrYU03i9uvu5Mpbya1x7p43MO
         ESYOTqxQleW+u2iUtmu6QAr/jClgyRDJg4Ju4uCHG8occ3YGemTdLW4ZMr+9JVyTElB9
         kYkkPmpV/vU8Dp/9i5nXgAWkOmEuqDVgzS5m27WisdEUHIkStRwiREplRUgKBjMsRXcP
         goODSi7f5XXDT3rrh56ydi3xvmhzKOKCpeprHVyhj24ofUkIQhCS0fvrYUPuNJ+EzeFs
         B4Zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773460720; x=1774065520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUQRi5vl7ger1FCyv6fx+Ok5M5QQpxd6KNaAJfpodDo=;
        b=JTgqP31wUjvJW6J0fs1XR8UDn/WHbk6yG/ugdEzIIaBtN6qVCOZt5ZlJkVL4ze4py7
         vdoUVii8IYXkGuHIJRJP3zprLeUjJom3ZiwoCW2qE9xAh1LW2zI4rLVFNYqFNONbCtm8
         Lbd1gzNK6JkyNFRW5BGgC5FaiCtCyGVmIGG5tayTBrZaFNcIj8sZsPza7i0ZUMTK1Oa5
         Wkn5cZWexZf2YXMryIyu+zoVJ99k/2oE4CGLyaHENCYN+3N1YOq+enZ830YT1Q5529dr
         UMCw/NccyvFo9IDZvLPNfrqa8UYIyd9T8DUfVWpPoYNSEH6GkaZdB0IvHOQjyKCxAWR+
         rxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773460720; x=1774065520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OUQRi5vl7ger1FCyv6fx+Ok5M5QQpxd6KNaAJfpodDo=;
        b=qDyNOw1SdYnAoqbQSVe8VAaYqKMsvIq2XpXmpUX7yYoH97TWjiIf29Y2DRe2qVwQMJ
         hSm6t0I+lLx9r4I9Lz4xbj9TdhMYBgWO2VvUjxQr+tB8o/zFUQHoLMzIIr7AjGj56nMw
         xzMqpaHgFWizfRDNj28eMHhSPGmv2vAotGRBs/BZHc4PqrYE9gs7zqXRgrffaEXmbuuN
         CO+vcWzOZqkMhhVtEWNPChV48T58TbD57iAbHvNpLkrVG2FQgCIs6p38MgmRMeK0Pz57
         3sad1yALpyDonl9AcdKV3/nGMSWg3TCj2W/Nu9V7ekr67qi/VBMxiU8jqCndUgdDJ3KW
         r0zg==
X-Forwarded-Encrypted: i=1; AJvYcCUJS9iAc8MIsVE7G5egNfYEiz4Yg+rnSYlA3xdyH44QWueUtMpmi+E0lihst5fNaDZG3R5KSAQxEas=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCNFUcOxqWduEpgwqMl+nhOarJZMAI3J6SeQlibOZEqtgYsdPE
	ZC+ASrum5H9XR1bZD+QTCAwFMm4Lx6m6CcBIsh5bSJvSSlOS2KrrsSE86iIQ+ywF9DtG/M/U9Lt
	6GgjxiZFy6lDl4gZl54dFDcO6wIhdlK8ZJvrIyOVj
X-Gm-Gg: ATEYQzwHkfsBGZNIZ60L5KldBtUPcJ3oUODLkCrS0+YaFz2KBSsZ4K1zd/6sKFHx4LH
	RfDcQSXtFlOK3zDrQeToEv19EI8DiJbp22Ii1TSBN1Xct+1qN7wlS1UY2t47ISmwiTlD/9Sh8vN
	18X/tg/xHAKxcL5aIMc01Q8t8nz72ovPwoYzOXENcxAL1SOK28KbfVl5BXCMPsiipUyDn0Vl7QZ
	grRZbeIOHvgLY43f+ORCrB/4a51UZ+dcMuxDXdUfv3bfTT5O2xjf+Q5cW0jb3C0+CAFFrD7nXCa
	JaD62w==
X-Received: by 2002:a05:622a:190c:b0:509:1a72:e332 with SMTP id
 d75a77b69052e-50957cb6dffmr75230961cf.16.1773460719740; Fri, 13 Mar 2026
 20:58:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-0-4c7f96b1ec69@gmail.com>
 <20260309-tcp_rfc7323_retract_wnd_rfc-v3-6-4c7f96b1ec69@gmail.com>
 <CANn89i+PypF1cK4mnp8L_eCG_z+3Aj6uxJoohm_=DwGfR1=4FA@mail.gmail.com> <abCkmiCSPkmxzECa@gandalf.schnuecks.de>
In-Reply-To: <abCkmiCSPkmxzECa@gandalf.schnuecks.de>
From: Eric Dumazet <edumazet@google.com>
Date: Sat, 14 Mar 2026 04:58:28 +0100
X-Gm-Features: AaiRm523CLjVQFOb0ZjB_qB2iBvlpRhw-o_SCZwCK7X6f1nBivXOPbA_-nmtd5w
Message-ID: <CANn89iKYxs644ardFFSKo8d0EXL_2A5eUQjWZ3yp9-Q4tVLKzQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 6/6] selftests/net: packetdrill: add tcp_rcv_neg_window.pkt
To: Simon Baatz <gmbnomis@gmail.com>
Cc: Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, David Ahern <dsahern@kernel.org>, 
	Jon Maloy <jmaloy@redhat.com>, Jason Xing <kerneljasonxing@gmail.com>, mfreemon@cloudflare.com, 
	Shuah Khan <shuah@kernel.org>, Stefano Brivio <sbrivio@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, Mat Martineau <martineau@kernel.org>, 
	Geliang Tang <geliang@kernel.org>, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	mptcp@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 12:09=E2=80=AFAM Simon Baatz <gmbnomis@gmail.com> w=
rote:
>
> Hi Eric,
>
> On Tue, Mar 10, 2026 at 09:54:58AM +0100, Eric Dumazet wrote:
> > On Mon, Mar 9, 2026 at 9:03???AM Simon Baatz via B4 Relay
> > <devnull+gmbnomis.gmail.com@kernel.org> wrote:
> > >
> > > From: Simon Baatz <gmbnomis@gmail.com>
> > >
> > > The test ensures we correctly apply the maximum advertised window lim=
it
> > > when rcv_nxt advances past rcv_mwnd_seq, so that the "usable window"
> > > is properly clamped to zero rather than becoming negative.
> > >
> > > Signed-off-by: Simon Baatz <gmbnomis@gmail.com>
> > > ---
> > >  .../net/packetdrill/tcp_rcv_neg_window.pkt         | 26 ++++++++++++=
++++++++++
> > >  1 file changed, 26 insertions(+)
> > >
> > > diff --git a/tools/testing/selftests/net/packetdrill/tcp_rcv_neg_wind=
ow.pkt b/tools/testing/selftests/net/packetdrill/tcp_rcv_neg_window.pkt
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..15a9b4938f16d175ac54f=
3fd192ed2b59b0a4399
> > > --- /dev/null
> > > +++ b/tools/testing/selftests/net/packetdrill/tcp_rcv_neg_window.pkt
> > > @@ -0,0 +1,26 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +
> > > +--mss=3D1000
> > > +
> > > +`./defaults.sh`
> > > +
> > > +// Establish a connection.
> > > +   +0 socket(..., SOCK_STREAM, IPPROTO_TCP) =3D 3
> > > +   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) =3D 0
> > > +   +0 setsockopt(3, SOL_SOCKET, SO_RCVBUF, [20000], 4) =3D 0
> > > +   +0 bind(3, ..., ...) =3D 0
> > > +   +0 listen(3, 1) =3D 0
> > > +
> > > +   +0 < S 0:0(0) win 32792 <mss 1000,nop,wscale 7>
> > > +   +0 > S. 0:0(0) ack 1 win 18980 <mss 1460,nop,wscale 0>
> > > +  +.1 < . 1:1(0) ack 1 win 257
> > > +
> > > +   +0 accept(3, ..., ...) =3D 4
> > > +
> > > +// A too big packet is accepted if the receive queue is empty
> > > +   +0 < P. 1:20001(20000) ack 1 win 257
> >
> > We do not see the answer, it seems this test is not complete ?
>
> Actually we do not want to see an answer.  The packet won't trigger
> an immediate ACK (it is larger than the advertised window, but does
> not cause immediate memory pressure).
>
> When we then send a RST before the delayed ACK would be generated:
>
> > > +// Send a RST immediately so that there is no rcv_wup/rcv_mwnd_seq u=
pdate yet
> > > +   +0 < R. 20001:20001(0) ack 1 win 257
>
> We are in a state where rcv_wup, rcv_wnd, and rcv_mwnd_seq have not
> been updated yet, but we must still accept the RST
> (rcv_nxt =3D=3D 20001 > rcv_mwnd_seq, tcp_max_receive_window() =3D=3D 0)
>
> > > +
> > > +  +.1 %{ assert tcpi_state =3D=3D TCP_CLOSE, tcpi_state }%
>
> And we verify that we accepted the RST here.
>
> Given how subtle this sequence is, and considering the limited value
> of this test, I am also fine with dropping it if it is too fragile or
> confusing.

Sorry I missed your answer.

Ok then please use :

// A too big packet is accepted if the receive queue is empty
   +0 < P. 1:20001(20000) ack 1 win 257
   +0 %{ assert tcpi_bytes_received =3D=3D 20000, tcpi_bytes_received;
assert tcpi_bytes_acked =3D=3D 0, tcpi_bytes_acked }%

// Send a RST immediately so that there is no rcv_wup/rcv_mwnd_seq update y=
et
   +0 < R. 20001:20001(0) ack 1 win 257

  +.1 %{ assert tcpi_state =3D=3D TCP_CLOSE, tcpi_state }%



Then add my
Reviewed-by: Eric Dumazet <edumazet@google.com>
