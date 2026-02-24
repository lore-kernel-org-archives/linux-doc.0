Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF48366DCF
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 09:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771924955; cv=pass; b=FuiEkK6ndL3IUMJMZ1YCEzW3sbTvuXGjGaNY2f0DROhLgP2Bulmg/d0jyYQY3tn78LdDd5WYzusY+rMdf+EV9rvVt4f/hqAHv1tC9I3bpB+3MrJ/LscI/JgbUHMJQ8ZIgETojU25Gagjz/2vp77PbYPnSWaUrriwS3Sv/AYP2zM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771924955; c=relaxed/simple;
	bh=W1IR9WScIDkn/Ldtj14H5MHS1TFfCVSY4+W1vxZj6aE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GCr4ShmceODqDjJ1UVPfK1v0s8mC379x5fgFY568gZyE2dWLpuV+6rW79+Nbdy9DenVliMjr/F1esZYBddkbwaca6ZQTI82QpS+l5qzZZyhHJB3yqohf/GBkblpIdFWXNKUN2HbnhJIH6n8icHC+0szw+kiSjd/iEmzk7hrOfZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cKmojdgk; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cKmojdgk"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5033387c80aso82645031cf.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 01:22:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771924953; cv=none;
        d=google.com; s=arc-20240605;
        b=bhd2z1NNta2PcLuvIVE+kz29WDzxbixWc2bHa6WgUBU5UuCJz1GQR0c/6sJ0OvJJcT
         UCG6oNijrNrqaKJAmG4HhHvMkJh5MjVbwOlj2PKoeqWZ6emAMci5tlpOjjZrFzcm7Qty
         dcHJpaGcOgYxZ1kmoLwPs6Y0a93hAXcLtZ7gouiF01qG6XdH0s5hmmWxHpc7toDlGG+N
         vx3Fbbe0OB83qNVBF1GyhAqbbH0SHVCUPzoORTn4JVqqennYzRFT6atx0+YdsTkJOfKB
         PUqNEPKQPkDuyeYSVJpGWNjYt5F2wHaSbhLX/35hYytLPKUt+yeTlr201oHvtDIIMwrp
         ehPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bK9XwEb9y6Wjy1j2b+uWduqpfjZe/0b6JObJU2L/7Zc=;
        fh=EcoHiGiU32CmLgt9VFMDfsyAr+vYWgNhtO8IfitFSo8=;
        b=LBol5GGu3shZnR/xObBEbhmZO97kZyBJngpTqvPXkyH6vE4l42VSNKjl/y5+LM5gt2
         EEuK9nViIsCQsU3H8KGX8aJxM00z7zik+RcVQW/TTAZhglPVKhAmOUww7ClOEC0pL67g
         PrHE55mE5f/9u6E6xjZUZwoMm52TGE35h7zZbJhbzZUQtkkWMu4fUIY0Jmg9ywzCqnRm
         e2k6flla2bHsGqj0fd5f/oOEpDg3CpWEtxMCjrQVhBvLxw4kUUcnP57JOUG1o3di78Dx
         KXczrOGLpN3S/sY7xQ6mXGXJnDf25QWKDElmO9rH/rrx/nxweG2qXdGIT34S5HqGr3ls
         FgVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771924953; x=1772529753; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bK9XwEb9y6Wjy1j2b+uWduqpfjZe/0b6JObJU2L/7Zc=;
        b=cKmojdgkRw4js7rFJxZ1jn65i1bqplTVNCvpA6hkpBQeDVtcB8FH/vkbmTbnDqFaup
         KHNMv5VSsuDxqvMuPofBmFzQXO8PjB61FDeAhCxPPeifvPXoPz0ZNGcy75zjWfR6m7Ra
         HriuqCv5gxqMIDKPGksYZEg82wFhsztUf5IOGjBZbPNYwEgth+niDzLjr5oFguEoVH8O
         6mJTzLH9+GGaL3zVccwSUIiVkdTTnbT9EyZGMC3mtO5p478s5HC2EnHwz5TjSu8KZORN
         aK4nCVoav/Vxw2FtesI65/YoEc2KWdotuub7RsCe4oQU9F41wuxDX3aq6qptWWzbYtdF
         3GTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771924953; x=1772529753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bK9XwEb9y6Wjy1j2b+uWduqpfjZe/0b6JObJU2L/7Zc=;
        b=Q5icHuF2AecT/oMzkYAyuvTovIe8VGdgEayQbYI7DZw0Wng6Rp2wPYht+BP9PxeWzh
         Et7ko9Px/2o78Y7x0xj31Qx0M1EspOL/TaazO0BDdsuFIp8z0JfZ8/1JnlmM2Ixq/i9q
         SCpjjDyiGP02u5sZY63AAv53Z2IY3KYPLkACAx4p70sjEroVvA8A5TXM18D47ZLJ7W8g
         dQFfC89O9KKSaHcLOxmgOuPArkCQvblEy0ki8RYeDjTTu7oCKhCQMcn0Ck94MTDatY6x
         MfNvQnXAP2gPoAf77dD0D4Z9S0b5UV43rJcfmYNNbCcXtZqF09NZBvbOBFiaFrByOGBN
         Z1fw==
X-Forwarded-Encrypted: i=1; AJvYcCWTnp5/NN41RFFQZAou6IegSPWILCB2xpgc8pgfAaZUwvhYm3FtMq9zj23cubRyMONVblJFCXfH+Qw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyJNgMLHjQZUsPxsJk4uobV+4dEevW9R5DUq6iRlt5+v+MKZUg
	++B/sLqnIcAHLMlHvgqFs1eb1LgH8xHuV0ytEcrCVk1C1LfdUruDo0JfWLAdKnFssFCTR422N3w
	MXnMlnYYy9Z2F9AOt/mfA3SPGBE5/YJbobBFvDY6s
X-Gm-Gg: AZuq6aKqMKQphIVAv8gvQeFHsViYxBmTesoBKQrZjGdZo5Pz+RDoQWPksbSGY3x4Ko0
	cFwFxkMTa3/PlafS7Xu2M5b5g0GSoO9lOB4xd6c81KYVKBMF/8/+KMFpyONDC6R5xeBlySRZRMY
	lMKql50TGRc9coPxowUQqV7K5DgmLeElOnvV2937rsRLnRyMlUv6ENcTm5JowIzM+4riDYqP20F
	Ja1jh2J18aQucuwKh/82ock7CsQ9UgXQdXVO3Vg9dS/3JqIPSEMbGhSsRn1hfq0jvASIjqjNvzA
	KxBUAKu0rV9z9Ou6Rvlr4o+RX1NNzjJPCtnbLBDD/A==
X-Received: by 2002:ac8:7fc1:0:b0:4ee:1dd0:5a50 with SMTP id
 d75a77b69052e-5070c2bd60amr156825011cf.17.1771924952622; Tue, 24 Feb 2026
 01:22:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260220-tcp_rfc7323_retract_wnd_rfc-v1-0-904942561479@gmail.com>
 <CANn89iLd=P2nftdMReVkc+d-8+0PGi1ACxhrhnVCxFVxNOhvJg@mail.gmail.com> <aZuaQSdsuWaAZza8@gandalf.schnuecks.de>
In-Reply-To: <aZuaQSdsuWaAZza8@gandalf.schnuecks.de>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 24 Feb 2026 10:22:21 +0100
X-Gm-Features: AaiRm522a6qXQbkPHi8t91KDO1mc-rlMizziA9EwmS69J1Clnl3Iw5_n02w5ZPk
Message-ID: <CANn89iL1rQ=ZhuQwNsxt2H1LPtigJbbNx+WtSjqDqJ1dmpF_ug@mail.gmail.com>
Subject: Re: [PATCH RFC net-next 0/4] tcp: RFC 7323-compliant window
 retraction handling
To: Simon Baatz <gmbnomis@gmail.com>
Cc: Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, David Ahern <dsahern@kernel.org>, 
	Stefano Brivio <sbrivio@redhat.com>, Jon Maloy <jmaloy@redhat.com>, 
	Jason Xing <kerneljasonxing@gmail.com>, mfreemon@cloudflare.com, 
	Shuah Khan <shuah@kernel.org>, Christian Ebner <c.ebner@proxmox.com>, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 1:07=E2=80=AFAM Simon Baatz <gmbnomis@gmail.com> wr=
ote:
>
> Hi Eric,
>
> On Fri, Feb 20, 2026 at 09:58:00AM +0100, Eric Dumazet wrote:
> > Hi Simon, thanks for the clean series.
> >
> > I would guess you use some AI ? This is fine, just curious.
>
> Thank you!  Yes, I=E2=80=99ve found AI helpful for getting familiar with =
a
> new code base.  I also use it to refine or clean up the wording of
> bigger commit messages.  Code generation works quite well for quick,
> throw=E2=80=91away code (like reproducers).
>
> > Can you add more tests, in memory stress situations ?
> >
> > Like :
> >
> > A receiver grew the RWIN over time up to 8 MB.
> >
> > Then the application (or the kernel under stress) used SO_RCVBUF to 16K=
.
> >
> > I want to make sure the socket wont accept packets to fill the prior
> > window and consume 8MB
>
> I suspect generating 8=E2=80=AFMB worth of RX data in packetdrill won't b=
e
> fun (unless there=E2=80=99s a trick I=E2=80=99m missing).  And using regu=
lar TCP
> sockets on both ends would probably be rather uninteresting (no
> packets sent once RWIN =3D 0)
>

8MB was only to show my point.

A packetdrill test reaching 1MB should be doable.
