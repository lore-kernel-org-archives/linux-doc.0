Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9795E32B99E
	for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 17:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773508030; cv=none; b=Jvg/wDAkgg/eqd70soTzpbsfuLyXfpZX9sHGvv7bLwzsQ4WEaPEFA8SNWSkH4LUDnQR/zbpmsrrIT3jr7FiJKl8/YJ+dohhvZHtcVG2Oh7yaszwvs+zAYIgAtRdu4RsKovnYSVehfDPlVJwH8NHZuIO+ZxQsK1JeTv+Wjd1hqhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773508030; c=relaxed/simple;
	bh=JmwWTR8tdLBqN2ZJaJyR7rVbXUX1qdfFYCxVt/hEa7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FbMpaXNyLXHK/tszCcOHfTKzEqcmn2BFQLigNjN9FhZT5hHc3N8SwYE+wiCY6B+/FDSKwSK97XUB9Kf5UkdnHAK3HXuDs9UgSrdSHDUViHA7MN5OtJ4Qm1BfqRwCHG1k+foDNH9b3xMEXE/KdDxmNEGtXcv1jeiKh4p7RB4jPpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWFty480; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWFty480"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439b2965d4bso2264137f8f.2
        for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 10:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773508027; x=1774112827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n5sXk7QR4yMzNPBEKkRLre6dWWa+kcD2gx8NHV2qKsY=;
        b=BWFty480jywnAD/7ZFee5N8T62z2IE/FjH743p1sW3j17wAr5gxT5uOk0v5dUt8eAF
         0aMnMQfCtlSFyPr5Wc+933PTvHAujBjbejXVa56t7DE6aIdKUeHOCnfmoWEpmUkKvu1b
         gzePfN+a4Wz3urK9FgP6GEm1Ou8oZYWfPDpcxZhr3jdFc0ScCLv0B6Tn+iAm6PZO+vP3
         kMHCTQZTZsWrdjrXfoHySO5b4H2ataeyA7TVJNNgh1mCLq8mgPxqa541+tnsSc2Du6+c
         6Rdd0LvkvOjGXb6kVP92TTUgYYD9yXJgujIHdlf0gn7+JmZ2tLY106r/y3H8AOvgq4FD
         +enw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773508027; x=1774112827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n5sXk7QR4yMzNPBEKkRLre6dWWa+kcD2gx8NHV2qKsY=;
        b=Hdapoij4RVPrAMZqOcLmwMy0Xjg4/y/8wDc/wA81/cbAqZHnmnLg80VAbwP0Oco48s
         J+Odo8j/Pkf0JLT15gJoHV5Oke0Kl4+/sKpMGcjdZTFmfX9WVRbJXyiIdXXCy5JKrTDe
         WcbUrok4hfDuAqoG59phTjvkratnZAeb3ijVMnMA9aegwZD0/PYsqBGIb1GQ5dEW4Wf0
         z9Qnl/oQBcLP/aNhpDhkgePM2bgpLhOEMVeKpZzPeLjpaAcumxf+XzzoGAr6K2LcV7FF
         VC8GMg8JnKvCw2xjqTUchAMA1VorZKKcLXKEzXm2d/bLNWmGXuixlvsbR6REquhp+EiP
         yFnw==
X-Forwarded-Encrypted: i=1; AJvYcCXH2g7oScgrBCVGzk6n/9aFQnaWzI7orStsIvuiD7El90HnapC8P3JsqIvDGbd//88bmPjK7zulZTo=@vger.kernel.org
X-Gm-Message-State: AOJu0YytH2aSm7S8Ze4baI6C3Zw7bm3fcdMlG0GS7dM1RaFNKI0dxmwn
	yG3EC18gu14kvvN/sbZp9/HqcXOT3tyUqgvTs4da+sGgBq3Y330Goj72TKdf72Ut
X-Gm-Gg: ATEYQzwOC7sgmOeBsObCbu47OZbtedvMkpLYgpAW2olQaeDUqptLSIgd+bVwj4aujLv
	ZRx3/uUW9dxYwifiJfdpkTiV/q4fkpnzQy3epRs5jfJ6607VLzyoYhpxIe/yYYgzj3nQ8zWrdVf
	1WPrTb8e40HnxA6Nsnp/FEqsbaG7e90bO9ThmEh3oIXDKlKMbcLsOkRU+CaNLfXaCl4yEXJNh1p
	JklkH4EuFK9ktDaS+x6yGMxcNEcYxjOFYG/hU7H/CWJ1rNm0tCkTfu/Aup59amf1LuXuvywBOGU
	zJPqPAUZNHWc+GW7JpqOff5NpIFcgsv8MDAoi3IRipuyHpilwSkHPuZmG8BlJCKDAoFFmsKmcwN
	8QsVSJCmb4bQSTsDA8Z6a/ISX0LvAp0HASK6RFedxUhEb+g4Lapef6Fa1cPtnjqfwVSI/qSqXfi
	2S4QinKA+XqBt5zAtf6R9K/GSZr1BnurvrsCOqc1sNNlpjBWDutMVIJhWGPlPR1KEiXWDMZ5KE3
	xAdF8WDM0+XXiXKihNj3W4=
X-Received: by 2002:a05:6000:2dc2:b0:439:d74f:2109 with SMTP id ffacd0b85a97d-43a04dc36c8mr12532240f8f.49.1773508026649;
        Sat, 14 Mar 2026 10:07:06 -0700 (PDT)
Received: from gandalf.schnuecks.de (p200300c14f1996009e6b00fffe39b8a7.dip0.t-ipconnect.de. [2003:c1:4f19:9600:9e6b:ff:fe39:b8a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2186e3sm31604155f8f.26.2026.03.14.10.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 10:07:06 -0700 (PDT)
Received: by gandalf.schnuecks.de (Postfix, from userid 500)
	id A232730395F4; Sat, 14 Mar 2026 18:07:05 +0100 (CET)
Date: Sat, 14 Mar 2026 18:07:05 +0100
From: Simon Baatz <gmbnomis@gmail.com>
To: Eric Dumazet <edumazet@google.com>
Cc: Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Ahern <dsahern@kernel.org>, Jon Maloy <jmaloy@redhat.com>,
	Jason Xing <kerneljasonxing@gmail.com>, mfreemon@cloudflare.com,
	Shuah Khan <shuah@kernel.org>, Stefano Brivio <sbrivio@redhat.com>,
	Matthieu Baerts <matttbe@kernel.org>,
	Mat Martineau <martineau@kernel.org>,
	Geliang Tang <geliang@kernel.org>, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, mptcp@lists.linux.dev
Subject: Re: [PATCH net-next v3 6/6] selftests/net: packetdrill: add
 tcp_rcv_neg_window.pkt
Message-ID: <abWVuS1XJaKrndJw@gandalf.schnuecks.de>
References: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-0-4c7f96b1ec69@gmail.com>
 <20260309-tcp_rfc7323_retract_wnd_rfc-v3-6-4c7f96b1ec69@gmail.com>
 <CANn89i+PypF1cK4mnp8L_eCG_z+3Aj6uxJoohm_=DwGfR1=4FA@mail.gmail.com>
 <abCkmiCSPkmxzECa@gandalf.schnuecks.de>
 <CANn89iKYxs644ardFFSKo8d0EXL_2A5eUQjWZ3yp9-Q4tVLKzQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANn89iKYxs644ardFFSKo8d0EXL_2A5eUQjWZ3yp9-Q4tVLKzQ@mail.gmail.com>

Hi Eric,

On Sat, Mar 14, 2026 at 04:58:28AM +0100, Eric Dumazet wrote:
> On Wed, Mar 11, 2026 at 12:09???AM Simon Baatz <gmbnomis@gmail.com> wrote:
> >
> > Hi Eric,
> >
> > On Tue, Mar 10, 2026 at 09:54:58AM +0100, Eric Dumazet wrote:
> > > On Mon, Mar 9, 2026 at 9:03???AM Simon Baatz via B4 Relay
> > > <devnull+gmbnomis.gmail.com@kernel.org> wrote:
> > > >
> > > > From: Simon Baatz <gmbnomis@gmail.com>
> > > >
> > > > The test ensures we correctly apply the maximum advertised window limit
> > > > when rcv_nxt advances past rcv_mwnd_seq, so that the "usable window"
> > > > is properly clamped to zero rather than becoming negative.
> > > >
> > > > Signed-off-by: Simon Baatz <gmbnomis@gmail.com>
> > > > ---
> > > >  .../net/packetdrill/tcp_rcv_neg_window.pkt         | 26 ++++++++++++++++++++++
> > > >  1 file changed, 26 insertions(+)
> > > >
> > > > diff --git a/tools/testing/selftests/net/packetdrill/tcp_rcv_neg_window.pkt b/tools/testing/selftests/net/packetdrill/tcp_rcv_neg_window.pkt
> > > > new file mode 100644
> > > > index 0000000000000000000000000000000000000000..15a9b4938f16d175ac54f3fd192ed2b59b0a4399
> > > > --- /dev/null
> > > > +++ b/tools/testing/selftests/net/packetdrill/tcp_rcv_neg_window.pkt
> > > > @@ -0,0 +1,26 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +
> > > > +--mss=1000
> > > > +
> > > > +`./defaults.sh`
> > > > +
> > > > +// Establish a connection.
> > > > +   +0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
> > > > +   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
> > > > +   +0 setsockopt(3, SOL_SOCKET, SO_RCVBUF, [20000], 4) = 0
> > > > +   +0 bind(3, ..., ...) = 0
> > > > +   +0 listen(3, 1) = 0
> > > > +
> > > > +   +0 < S 0:0(0) win 32792 <mss 1000,nop,wscale 7>
> > > > +   +0 > S. 0:0(0) ack 1 win 18980 <mss 1460,nop,wscale 0>
> > > > +  +.1 < . 1:1(0) ack 1 win 257
> > > > +
> > > > +   +0 accept(3, ..., ...) = 4
> > > > +
> > > > +// A too big packet is accepted if the receive queue is empty
> > > > +   +0 < P. 1:20001(20000) ack 1 win 257
> > >
> > > We do not see the answer, it seems this test is not complete ?
> >
> > Actually we do not want to see an answer.  The packet won't trigger
> > an immediate ACK (it is larger than the advertised window, but does
> > not cause immediate memory pressure).
> >
> > When we then send a RST before the delayed ACK would be generated:
> >
> > > > +// Send a RST immediately so that there is no rcv_wup/rcv_mwnd_seq update yet
> > > > +   +0 < R. 20001:20001(0) ack 1 win 257
> >
> > We are in a state where rcv_wup, rcv_wnd, and rcv_mwnd_seq have not
> > been updated yet, but we must still accept the RST
> > (rcv_nxt == 20001 > rcv_mwnd_seq, tcp_max_receive_window() == 0)
> >
> > > > +
> > > > +  +.1 %{ assert tcpi_state == TCP_CLOSE, tcpi_state }%
> >
> > And we verify that we accepted the RST here.
> >
> > Given how subtle this sequence is, and considering the limited value
> > of this test, I am also fine with dropping it if it is too fragile or
> > confusing.
> 
> Sorry I missed your answer.
> 
> Ok then please use :
> 
> // A too big packet is accepted if the receive queue is empty
>    +0 < P. 1:20001(20000) ack 1 win 257
>    +0 %{ assert tcpi_bytes_received == 20000, tcpi_bytes_received;
> assert tcpi_bytes_acked == 0, tcpi_bytes_acked }%

Unfortunately, tcpi_bytes_acked is the TX direction, it will always
be 0 here.

Instead, we can still test that the oversized packet is accepted and
indirectly verify that no immediate ACK is sent by eliciting and
checking a RST:

// A too big packet is accepted if the receive queue is empty, but does not trigger
// an immediate ACK.
   +0 < P. 1:20001(20000) ack 1 win 257
   +0 %{ assert tcpi_bytes_received == 20000, tcpi_bytes_received; }%

// Send a RST immediately so that there is no rcv_wup/rcv_mwnd_seq update yet
   +0 < R. 20001:20001(0) ack 1 win 257

// Verify that the RST was accepted. Indirectly this also verifies that no immediate
// ACK was sent for the data packet above.
   +0 < . 20001:20001(0) ack 1 win 257
    * > R 1:1(0)

As the series is merged now (thank you!), I will send this
separately, as suggested.

- Simon

-- 
Simon Baatz <gmbnomis@gmail.com>
