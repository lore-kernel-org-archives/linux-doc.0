Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732543E95B7
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 07:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773128475; cv=pass; b=GSjGcN0HVSWlogxaVbziR6//HcBbL88tuui4wBRx2polA2pNLg6OjA+eDwh3LyqgzfC0QhFS7ZMwKzax9zFzbPwdEOW2ilV4FH6S6Naci88TrTVpEe2SrmGpGiyevbxtk+UzPw9TCjHKUc/b1mAFYazOe+1JALitbfmrklfyJvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773128475; c=relaxed/simple;
	bh=7cTgaURun945ZBxkV8bmKWLaXe5u+DBTf6pF7YLrF4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NL7lCthdJW0J9Yj0mqYIvV6svnds3Leb8gdCKHafYqlY1bqRI0rvpiYoFNnbVWKLmULoEuSe0zg/27HCdKY/HJIS+FsnbQmSrU1QStk8AvZh5SEccCN4coi4Hv1XUgcgfSiBAJdVWfU+0PJxoC/biuzNwmu+O7Sqz1A5m3tTNrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aXVrHKTx; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aXVrHKTx"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50917e02532so25458871cf.3
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 00:41:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773128469; cv=none;
        d=google.com; s=arc-20240605;
        b=TmJntJY5yRVIdlaMwVf5QOnvsqbCA10VR2q4XrJiKZOEEwtIw+n46iaGq/2YopMHpZ
         8koJKWcMTzhnfM7gkce19AgUAkthwuEYhg6CKflK+8DxoAalhjtm9fB92F6k8bzss0el
         oCCeaXkX5xtVqcXz+A0+PY/gN5dypXmRdrXa8bDlFdugfrUShD1xTadbc9QY4yYvdWc+
         rbQMEwgHrb7rnyupgHuFRI0QVhX60fMkkblNAtCBDTYpKM0rRz1wa1s4TAWHzki6k2Gm
         wPGkKEcv96xAZQjqOs3uavjU+oy9WmFo73zhXOCd5dZPen3cx+mxsv26DeqxGBODd+oS
         8bYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rcMzOrru+dNP0H3b9Nuh0ONkl84RLF9HUfefvP22L6g=;
        fh=yAVEsv2WdCSslveU4Om4/tWUrYP2Aw/MiKcff57kods=;
        b=JemfyGLz8HGxu6K0lP3Efp6+xrU/98Qy7HiNsP94TTTGL75PPOh6QDvUWBB4XH0v2O
         UyVBvnCvKCajJz0iZSmqpusz2iTuHDeLpGwxLf+OEdUDjBswN7WSEMOff22TUarNUyih
         6yZ1Y4FclkqMEciivj80eXMzD1JYkCOyElECatGhbndpbhiKwEUwRF8zQCT2nuk4Xmo5
         BJ0xnGvAL2bQc0uTNEdXJUeKMz9iTvtdzO7dl+tigs5mHPeNwy2fJT24J2xSLhmVuDTL
         RLxkGSO/vuitI36B184DLdKw23zcfGCgoaNtrLi4Vn62KmyURRgG7WAisNQYa+H9GDyh
         EYLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773128469; x=1773733269; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcMzOrru+dNP0H3b9Nuh0ONkl84RLF9HUfefvP22L6g=;
        b=aXVrHKTxHQAxiU/zPZOLkC1z6p8cJocbwkVWQbLD6aegwfelc7y3aC+RRkXHga1Sie
         XCo3HdWFhKcXWrm1LIqa7cF35EwGqzbRq6neMd5gF8fCGZg9WEgfuYEbiviOPDj6oZ18
         aIgsniUYS25+4tBcFH4BilSRm72bCzdY0Y7JClg3yh3YudwyR/dsVWyssX/yVopGxAGV
         xNkahW+xAZ1ImQkuJn3O1GCcLA5V0WY4ced7lwzOF83Gza94gSykTR2rsbgT/NGlVk1K
         OWHRnNlj74CwW06+xvfUd/gfN+GHVQEaosZy49zX9VnwIZq9L0MRBp8yiUYqAX+vzXYb
         KFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773128469; x=1773733269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rcMzOrru+dNP0H3b9Nuh0ONkl84RLF9HUfefvP22L6g=;
        b=QEIi2WPraV927GzoFMlmLb2NFsoUkwp/KS4QwNoxoJ6F1+uIseyT4rHje4ewP1SBCL
         7jSOkVO/j1Dgfk1YdRERO1nZdFSbQfUC+Xsdk3dB4loCLTCXv5DA3EYyzpyX+hPEQxn7
         hSJOCIfT6NU+xhiyF2SroOZS8XD25iulb38KldAMc9RLz83l8CGvEt4ZWhGrXTqZkfgD
         yZDGsc8LMjevJmNgslETPPprm84ioteZ8YKTG7HEI/sea+efeMmQsw0mPKOlcmQ6JQVG
         q9NsERSx0pf6tPrdrNlpYtYq8qpKaS4YWuaO/DaXAcs6B4ddVKyUBRBjTAIGA2IA6Mih
         jgzg==
X-Forwarded-Encrypted: i=1; AJvYcCXmVCiCBp4s4j9FmVDZppT5+jo1WqhF70tsVB70uymQ2qBDhA7XlETAtANfh6iutUU/UJhR/5+8aRs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxL0aNqzVk1CjL6M8XY9XgiK2nQ9dEwZL+Az53HfiT9FeFwQM8p
	1ZGl3DF8BiLBAGb3WGGBDOqrt9m+d+3uWk+eph/p/gA/qDUjXOrBXxaDJmbtrdd7TVAZY9+m8JM
	/8qfUd+c40GcrWsYQKVXhDawj9lW2G4zASAtAmXVB
X-Gm-Gg: ATEYQzxUx9h7M1e+ibaDW8cRLgsc3ldcmtUi9bxQa+ERytxZ/bsW3P/WY4rjVjhxjmm
	8B4Sz/Lr/7IWJs3wLidYcw9MzHySNczuvtsIV/9wx0MzRsPJdbVQLRHrHjnYS/Os1CXo/8i5MCG
	AXkjCzwQn9XbDx06DlmaA5m1hYqoWMTGhEOD4mR8ziQOv9HZFx5G3x230O7f7yTyUh03E3WlXIq
	NUxq7LEWrKFqm25Rq3wE9tvdluKFw3/lLJErg7B1NdFTpdzR2rPvrEkx2GaqDia2vLFfWtiPmtf
	Cl95APU=
X-Received: by 2002:a05:622a:144c:b0:509:1d55:6368 with SMTP id
 d75a77b69052e-5091d556a83mr65534491cf.39.1773128468646; Tue, 10 Mar 2026
 00:41:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-0-4c7f96b1ec69@gmail.com>
 <20260309-tcp_rfc7323_retract_wnd_rfc-v3-1-4c7f96b1ec69@gmail.com>
 <CANn89i+38t+PpB5duS_-FX_=PwyCQaN2HYohocJBAvZ7Cd8-KQ@mail.gmail.com> <aa8S5pEbxXIG5oZQ@gandalf.schnuecks.de>
In-Reply-To: <aa8S5pEbxXIG5oZQ@gandalf.schnuecks.de>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 10 Mar 2026 08:40:57 +0100
X-Gm-Features: AaiRm51UmLT8Xio3yOAS3_qG-3b3ZlXXtISzZ5JqQOuDaTGLlV85GE2K7N5HJFc
Message-ID: <CANn89iJeVSfU3_Ub023j5mo5g=bTxTw_A+5-dPw59DaXFrLmDA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/6] tcp: implement RFC 7323 window retraction
 receiver requirements
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

On Mon, Mar 9, 2026 at 7:35=E2=80=AFPM Simon Baatz <gmbnomis@gmail.com> wro=
te:
>
> Hi Eric,
>
> thank you for the quick review.
>
> On Mon, Mar 09, 2026 at 10:22:39AM +0100, Eric Dumazet wrote:
> > On Mon, Mar 9, 2026 at 9:03???AM Simon Baatz via B4 Relay
> > <devnull+gmbnomis.gmail.com@kernel.org> wrote:
> > >
> > > From: Simon Baatz <gmbnomis@gmail.com>
> > >
> > > By default, the Linux TCP implementation does not shrink the
> > > advertised window (RFC 7323 calls this "window retraction") with the
> > > following exceptions:
> > >
> > > - When an incoming segment cannot be added due to the receive buffer
> > >   running out of memory. Since commit 8c670bdfa58e ("tcp: correct
> > >   handling of extreme memory squeeze") a zero window will be
> > >   advertised in this case. It turns out that reaching the required
> > >   memory pressure is easy when window scaling is in use. In the
> > >   simplest case, sending a sufficient number of segments smaller than
> > >   the scale factor to a receiver that does not read data is enough.
> > >
> > > - Commit b650d953cd39 ("tcp: enforce receive buffer memory limits by
> > >   allowing the tcp window to shrink") addressed the "eating memory"
> > >   problem by introducing a sysctl knob that allows shrinking the
> > >   window before running out of memory.
> > >
> > > However, RFC 7323 does not only state that shrinking the window is
> > > necessary in some cases, it also formulates requirements for TCP
> > > implementations when doing so (Section 2.4).
> > >
> > > This commit addresses the receiver-side requirements: After retractin=
g
> > > the window, the peer may have a snd_nxt that lies within a previously
> > > advertised window but is now beyond the retracted window. This means
> > > that all incoming segments (including pure ACKs) will be rejected
> > > until the application happens to read enough data to let the peer's
> > > snd_nxt be in window again (which may be never).
> > >
> > > To comply with RFC 7323, the receiver MUST honor any segment that
> > > would have been in window for any ACK sent by the receiver and, when
> > > window scaling is in effect, SHOULD track the maximum window sequence
> > > number it has advertised. This patch tracks that maximum window
> > > sequence number rcv_mwnd_seq throughout the connection and uses it in
> > > tcp_sequence() when deciding whether a segment is acceptable.
> > >
> > > rcv_mwnd_seq is updated together with rcv_wup and rcv_wnd in
> > > tcp_select_window(). If we count tcp_sequence() as fast path, it is
> > > read in the fast path. Therefore, rcv_mwnd_seq is put into rcv_wnd's
> > > cacheline group.
> > >
> > > The logic for handling received data in tcp_data_queue() is already
> > > sufficient and does not need to be updated.
> > >
> > > Signed-off-by: Simon Baatz <gmbnomis@gmail.com>
> >
> > ...
> >
> > > diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
> > > index f0ebcc7e287173be6198fd100130e7ba1a1dbf03..c86910d147f2394bf414d=
7691d8f90ed41c1b0e3 100644
> > > --- a/net/ipv4/tcp_output.c
> > > +++ b/net/ipv4/tcp_output.c
> > > @@ -293,6 +293,7 @@ static u16 tcp_select_window(struct sock *sk)
> > >                 tp->pred_flags =3D 0;
> > >                 tp->rcv_wnd =3D 0;
> > >                 tp->rcv_wup =3D tp->rcv_nxt;
> > > +               tcp_update_max_rcv_wnd_seq(tp);
> >
> > Presumably we do not need  tcp_update_max_rcv_wnd_seq() here ?
>
> When we don't update here and are forced to accept a beyond-window
> packet because the receive queue is empty, we can reach a state where
>
>  rcv_mwnd_seq < rcv_wup + rcv_wnd =3D=3D rcv_nxt
>
> I noticed this case when instrumenting the kernel and got violations
> of the invariant rcv_wup + rcv_wnd <=3D rcv_mwnd_seq.
>
> So, while not strictly needed (tcp_max_receive_window() would still
> be 0 as rcv_nxt > rcv_mwnd_seq), I opted to include the call here to
> keep rcv_mwnd_seq the actual maximum sequence number at all times.

Fair enough, thanks !

Reviewed-by: Eric Dumazet <edumazet@google.com>
