Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF7134B18E
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 18:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773081323; cv=none; b=pPfbzTesFi6nird3h/fmdU9QaT/Iu0F/g21aSakWctaIiYpsvBgdGlZXbKZd8oRW2Lchuidq4I0hMcVo0hlaRC6z+yG/2uhdeZT/Qev14g2+j7wiw/MLBCFZ02mscO0SUrgZ1nshQLe/9SSBM+W4F9Slf5ZBAzp1HV+OgrP98rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773081323; c=relaxed/simple;
	bh=srg+dxIhiAQAT4kVm4zitW6wSGv/aiVh6j6o8T2Wnnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oYFO7xxWJmOiBCKVCrHOQJtMelcDnjQ2R0cn5SoCFRhZb04PT9v1aDxd19jKWQffIaVXlsB0ZPof4MZYSd54Cna0+acuRmxqwAFTZRgftEa3qnWUQYnhpkZll8W9VgLsPGzUiAihKxaPtf85rpsX77b1jDmDl9+8cfqGibBQJsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPetDQ0y; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPetDQ0y"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439b7a87fb5so5490279f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 11:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773081320; x=1773686120; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dHSASEtvOfEiBqmxuf7zhZcsqNoilbHkrVseGDfvsXw=;
        b=kPetDQ0y6fBaOc5IIyI/eB4U78IWK7YFrH4bskAlLavqNBSWSmv+zPfRHAx5fE7vn7
         bwH16kkGOJKUeKxtqQNVWzx+gMQKikEf+EHXHlBMtfOWkVtdNisFHJUndOrWB+m52Tbh
         YF1NRGyd5lZX6nVtVsdQDWl/FHr6s4MTQmXm6QznPYNJZQ9cuQjKritvC7CfIGSRvQ2S
         UoX4CM9SIYy7oAtexG3njEUeMyAQLx+ANx+zupdgDi5V1cBKlFfN1oifhqeOpBIDbvdn
         2TqRwFB1FAT89Cs9FWMwvzv17J1Pga4qOYskDm2ZjayvKtsdFRLtDbkD2/2QVTzYoOb/
         ZO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773081320; x=1773686120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dHSASEtvOfEiBqmxuf7zhZcsqNoilbHkrVseGDfvsXw=;
        b=CQpQVDGR8UHWnT9F98UbCwa5rGVOZVylVXwZ9O/s7jtr04yvX7TiuUbKSl+j3tG2Jr
         OphNL7wlkfe+NZ551G0A9UnYLVNKt7nczU3pOOnB8v8Nsu5UTGjNRG63SRbRYopDknkW
         kL30Rwyu15AeBgvcjKHhSKxp5VQOimR8LloAuVlO9REKePb9SQTK0MVGvizMuNfJycKz
         US4F3tNahqmFLmhcpLkRe1Hj38aLjs18m3Be0kkhpdIqS+bkjcDBE9bp8HPgyQOEfKks
         JF9DZbKPeA9eiEERNKxhL1KVIz/wF6RaL2Nql9suIycUngo6mt/pWH2tjORs1P10/8z2
         obGA==
X-Forwarded-Encrypted: i=1; AJvYcCVxVKdI30s/SKMdNaOQw23e4CSwIlke3ZmNff/rvQeqElNZk03wAUWttd9FavJIQS0q2Y70/HcaUBU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNZFJcBdFMQoM58/WRe06i+n0o+/DtZgdFKUvD6wBZ7Kwa9p+F
	cuEj9mHaZTcFk0xZPvJeKne9+OE0cMCEuded2OU/9vUPTeyBtvqcg5i6
X-Gm-Gg: ATEYQzz9A9QGMD4EWxyWh2aFUvB4m244R0YUjzFG09qBruSsThKR8cf0xzfS34agJID
	Nh/Hw5sNdOyQ6qlcQipLBYiBBsnJQscCJJoHT24eq+zQLZ5wi03Zn+HoTgX5FSUJi7G3sBAOvGS
	m3cB5bWOmfDJ/S6HYJV7enYrvHddGLQ+trQ0j4rsOX9wOPCltL3nmmyegZe0Nl9Jw61uMMI86pf
	zmMxmDOVf70XNFXzNolPQmM9FnaCAq+Mg9xk4ARFsCWSqY3R7fMJgDsuZ7SBOAswuFdC9gAvnPb
	prwg8QlTWLbvO3n4x28+9+8K/COUzP2tL/SDUuLpZKQk1DJoJRXoQLJ0eNDFxnuHseKXt9MPchO
	9g9yqRwyNc484ll3d3TQUvoYIOWQQppTfD4PQgSeGJK4iT4LiWCyFNHjKaVb7OMPqN9kMtrejrf
	suH7PtYM6ZlGDH1t2B5dBQUTt5mn9OAhyyrhKbYdSGfJzgsAdWf3XHdYf4607oPXtb30hZYPeQ4
	x27wssIgG/6pD6oHhkCqYo=
X-Received: by 2002:a05:6000:2285:b0:439:c67d:9fe8 with SMTP id ffacd0b85a97d-439da3526ddmr20856163f8f.22.1773081319621;
        Mon, 09 Mar 2026 11:35:19 -0700 (PDT)
Received: from gandalf.schnuecks.de (p200300c14f1996009e6b00fffe39b8a7.dip0.t-ipconnect.de. [2003:c1:4f19:9600:9e6b:ff:fe39:b8a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad1cb7csm29257753f8f.0.2026.03.09.11.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 11:35:19 -0700 (PDT)
Received: by gandalf.schnuecks.de (Postfix, from userid 500)
	id AB67F30287C9; Mon, 09 Mar 2026 19:35:18 +0100 (CET)
Date: Mon, 9 Mar 2026 19:35:18 +0100
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
Subject: Re: [PATCH net-next v3 1/6] tcp: implement RFC 7323 window
 retraction receiver requirements
Message-ID: <aa8S5pEbxXIG5oZQ@gandalf.schnuecks.de>
References: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-0-4c7f96b1ec69@gmail.com>
 <20260309-tcp_rfc7323_retract_wnd_rfc-v3-1-4c7f96b1ec69@gmail.com>
 <CANn89i+38t+PpB5duS_-FX_=PwyCQaN2HYohocJBAvZ7Cd8-KQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANn89i+38t+PpB5duS_-FX_=PwyCQaN2HYohocJBAvZ7Cd8-KQ@mail.gmail.com>

Hi Eric,

thank you for the quick review.

On Mon, Mar 09, 2026 at 10:22:39AM +0100, Eric Dumazet wrote:
> On Mon, Mar 9, 2026 at 9:03???AM Simon Baatz via B4 Relay
> <devnull+gmbnomis.gmail.com@kernel.org> wrote:
> >
> > From: Simon Baatz <gmbnomis@gmail.com>
> >
> > By default, the Linux TCP implementation does not shrink the
> > advertised window (RFC 7323 calls this "window retraction") with the
> > following exceptions:
> >
> > - When an incoming segment cannot be added due to the receive buffer
> >   running out of memory. Since commit 8c670bdfa58e ("tcp: correct
> >   handling of extreme memory squeeze") a zero window will be
> >   advertised in this case. It turns out that reaching the required
> >   memory pressure is easy when window scaling is in use. In the
> >   simplest case, sending a sufficient number of segments smaller than
> >   the scale factor to a receiver that does not read data is enough.
> >
> > - Commit b650d953cd39 ("tcp: enforce receive buffer memory limits by
> >   allowing the tcp window to shrink") addressed the "eating memory"
> >   problem by introducing a sysctl knob that allows shrinking the
> >   window before running out of memory.
> >
> > However, RFC 7323 does not only state that shrinking the window is
> > necessary in some cases, it also formulates requirements for TCP
> > implementations when doing so (Section 2.4).
> >
> > This commit addresses the receiver-side requirements: After retracting
> > the window, the peer may have a snd_nxt that lies within a previously
> > advertised window but is now beyond the retracted window. This means
> > that all incoming segments (including pure ACKs) will be rejected
> > until the application happens to read enough data to let the peer's
> > snd_nxt be in window again (which may be never).
> >
> > To comply with RFC 7323, the receiver MUST honor any segment that
> > would have been in window for any ACK sent by the receiver and, when
> > window scaling is in effect, SHOULD track the maximum window sequence
> > number it has advertised. This patch tracks that maximum window
> > sequence number rcv_mwnd_seq throughout the connection and uses it in
> > tcp_sequence() when deciding whether a segment is acceptable.
> >
> > rcv_mwnd_seq is updated together with rcv_wup and rcv_wnd in
> > tcp_select_window(). If we count tcp_sequence() as fast path, it is
> > read in the fast path. Therefore, rcv_mwnd_seq is put into rcv_wnd's
> > cacheline group.
> >
> > The logic for handling received data in tcp_data_queue() is already
> > sufficient and does not need to be updated.
> >
> > Signed-off-by: Simon Baatz <gmbnomis@gmail.com>
> 
> ...
> 
> > diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
> > index f0ebcc7e287173be6198fd100130e7ba1a1dbf03..c86910d147f2394bf414d7691d8f90ed41c1b0e3 100644
> > --- a/net/ipv4/tcp_output.c
> > +++ b/net/ipv4/tcp_output.c
> > @@ -293,6 +293,7 @@ static u16 tcp_select_window(struct sock *sk)
> >                 tp->pred_flags = 0;
> >                 tp->rcv_wnd = 0;
> >                 tp->rcv_wup = tp->rcv_nxt;
> > +               tcp_update_max_rcv_wnd_seq(tp);
> 
> Presumably we do not need  tcp_update_max_rcv_wnd_seq() here ?

When we don't update here and are forced to accept a beyond-window
packet because the receive queue is empty, we can reach a state where

 rcv_mwnd_seq < rcv_wup + rcv_wnd == rcv_nxt 

I noticed this case when instrumenting the kernel and got violations
of the invariant rcv_wup + rcv_wnd <= rcv_mwnd_seq.

So, while not strictly needed (tcp_max_receive_window() would still
be 0 as rcv_nxt > rcv_mwnd_seq), I opted to include the call here to
keep rcv_mwnd_seq the actual maximum sequence number at all times.

> 
> Otherwise patch looks good, thanks.

-- 
Simon Baatz <gmbnomis@gmail.com>
