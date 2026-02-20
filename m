Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4C03101C6
	for <linux-doc@vger.kernel.org>; Fri, 20 Feb 2026 08:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771577896; cv=pass; b=COPw9c0cbACVp4b2xy8VGfbr5aqR7teb3ROKy2jhFsGgnasVQedj174swFJllkN22n9acNzbbasmFw0jVWPtaEHTGJm3OBn9ECY/ZokWkeL6HJCiO9l9tDMg372j9+FE+W7NniD/KVPnK5cmnDm9j0G2oXgTQmwZTQoh30QhDXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771577896; c=relaxed/simple;
	bh=AEujbFKlh5JFD3bI6CQBE5KWHB6cC0DGmBfxGY4HZZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aCswpPdCFs7ywyFE01fnpCNafcwtrpoU3ahj470hjqedvFe0Y3Y/HE2AObUk90F6bGPuNiuTL1+XL7korz2tcubhezGj46wM9XXRTmvKw15Njb2z5ASB38yWn4USv8yGLKyyUV0UEBQRG96Cr5kZJq8VDZMBqVQZCtlYJUgGTxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2yjdCw5w; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2yjdCw5w"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-506c02ec1b3so21301511cf.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Feb 2026 00:58:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771577893; cv=none;
        d=google.com; s=arc-20240605;
        b=LotaIH6g9ZK7xveI3ihAt9NedPekHOhE/HHn1kVRRtZM2w9fnaLaH327YKvDHPM6Cr
         RghiQAJ6sDIq/aSlyuao1GDvgG3blx40+kNwrpxJhr+TKZiJflRfR+O0hHbMemjN+osZ
         J5HMlFoE7SL7TODq9qXUhpW5hSTaHgK2VyBHhMNuAosSpc2KoeaNOJrCdIbB7mnQWtVw
         Uqe2Y5X5OG5wPtXJ1LujjmkClRFtOMfHQFG5+ETiFhNPeKsDfebJDapLTZN4+BydOifc
         O8plXkbxwDfAt5T3zvxee/0ZL9gU+v8KoEkP3YRmhBoU/7EdkboiEtA56sREo+AzOSQF
         W1GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YyFN0Kson+AYNlRNbkY4e10Iy1AdaN1ujO4FPzKIE34=;
        fh=UEP1Wit2EPAcvNxz5ZkdjyAw9zjvzBLzXvs0NwKzxRE=;
        b=PCQHi0U8HDWeKpNRL8FsdekVVKdwaE5zOKQHQuQ8Ru6bUo/Qqtz8mhqswcAYsakMAZ
         sMdA6OKvLq2m9N9YuXovYC0EaKlsbD4qQVIrLLRvZnWRBNv6WmYe55NTdmxjahd2drHE
         JMa2V4eo8aq1kdTHLg+mV4eyayq/V6bhhPFzACM6qe582EgS2w6p2ESTqOLqG4+qsBEd
         571wte9UBVmFeXn8p3+SjRb6mQf6grtzEGOAm1QC4BYtfAWqRY5bY36Si1qxnezffADS
         04uV1A0DwAZqfLULUtiLIeEC0QjpYHLte7kR9IUDZnTbv3KQtf2zTfVtHOGtYxug/q0r
         DgOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771577893; x=1772182693; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YyFN0Kson+AYNlRNbkY4e10Iy1AdaN1ujO4FPzKIE34=;
        b=2yjdCw5woH1kQa/4t8QQasjpBpkrkO0nh2t0avKUumsWB65E0P4K5askFl3cTTm6Ch
         AZFzvJr9I2wzS8IJbULFOzOmZZ6ngGYLVL8xZYc42yUdqTItetbOZXqXSnCI6nyP+vBd
         Dtq+Eg8s7wo5AdGfzAIPHSqFuskTrHa6wCNXzpzzrPQiYsKfKwH/qotLJZBEyPV0vaou
         4Fx8g6FG0iA3i4CwRe1Cpu3/Qk8p4QihtjBA8+r9E6Y9+g3i/L8uJscmKqWFRJdks4OA
         R6XG6KETxtNWTNSSqC7YnHo+DVX0jp7fdFZO5D2L9XPGcdhNO1x4zFDgEEqyY4NIYxUa
         7/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771577893; x=1772182693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YyFN0Kson+AYNlRNbkY4e10Iy1AdaN1ujO4FPzKIE34=;
        b=V2rvDU2H/Vngd/CTi1UTIvRqcRTGSpb856Vg4ayMPLmRi7z9NzwGOOCvqvWaVMs+E5
         MTql02AIKHemO/+dACzKS/eukd+tJuuerDNjj+mnCb6MSxKxmMtWiu3ZZOm2xxHIh6Qs
         LIoi+17OFU5+v8WrA3SIuWPACsVDnYeO7ep551jNne7ALsmZxc44hSF/roRr7pF4Sb2Y
         0Hck6QOhxDPmsYGOqU/oqMwjUDUSxIX7+o6Q3iw8SEnuAGmCgrhTl1RKJGJdDJNj8G7y
         hfdTbiSUYcyEG4Ig2pINI4YLhMdb3PkJqcChadW4+F+knN/K2GGkrMl/YbL86vwm4L/r
         MOGg==
X-Forwarded-Encrypted: i=1; AJvYcCUWUU7Q/rl8y9EIiNsKjJ6QhREPegby12e+L+ca4l7oordZ/33Kv7Fkefn8jN7iGn6rv+ZE+SH8mz0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGgDBvKSF9Qm+1Cj3pVWDQtnPb59QShLvWWmq71bRaZWNYszH7
	qfVcWNBhwnzvnAZfolOfHRCY7uuMTPv1vHgi/rTmbIg6fpA/UEoWLu/FO5FrKY0pqrFgtfrWE3s
	e4oxOV8v8gWivMLYzoPUV8Xb3elRGCaU2VI2mX/h1
X-Gm-Gg: AZuq6aLfn2j/1AQYoGh1eOPlU7edSBrtzMrB2KRmX1hL+vXrolF3UjkntOd5vCEBwMe
	FC5KVUl78++aqiRxxYBC2IaF4MHpOd3Cae00GjxF2We8GfSgiJ7yF91qzFH3M9WXuG9dcJnyPC/
	edQnepknXsr5aMD0Gg5RdarOPoynWnRwQWPzu6dNR3zCmYhhvP0VdHnKakzNE3RkgJKP3OJ6aag
	RHIRSF/VBSYbvu8evHZed6p/QaAPv1bml7pBqaoEpWoCkVgErYyJqKNqJ68UgwQn2YScHsjEsom
	RXKbpw==
X-Received: by 2002:ac8:5acc:0:b0:506:a394:ca77 with SMTP id
 d75a77b69052e-5070034506cmr7771591cf.13.1771577892700; Fri, 20 Feb 2026
 00:58:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260220-tcp_rfc7323_retract_wnd_rfc-v1-0-904942561479@gmail.com>
In-Reply-To: <20260220-tcp_rfc7323_retract_wnd_rfc-v1-0-904942561479@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 20 Feb 2026 09:58:00 +0100
X-Gm-Features: AaiRm53-S4oAp4GvF5WoYf1aBo1ioPswOgMfvyIgUiOruJtUswhbFk9_n4l6ygY
Message-ID: <CANn89iLd=P2nftdMReVkc+d-8+0PGi1ACxhrhnVCxFVxNOhvJg@mail.gmail.com>
Subject: Re: [PATCH RFC net-next 0/4] tcp: RFC 7323-compliant window
 retraction handling
To: gmbnomis@gmail.com
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

On Fri, Feb 20, 2026 at 12:56=E2=80=AFAM Simon Baatz via B4 Relay
<devnull+gmbnomis.gmail.com@kernel.org> wrote:
>
> Hi,
>
> this series implements the receiver-side requirements for TCP window
> retraction as specified in RFC 7323 and adds packetdrill tests to
> cover the new behavior.
>
> It addresses a regression with somewhat complex causes; see my message
> "Re: [regression] [PATCH net-next 7/8] tcp: stronger sk_rcvbuf checks"
> (https://lkml.kernel.org/netdev/aXaHEk_eRJyhYfyM@gandalf.schnuecks.de/).
>
> Please see the first patch for background and implementation details.
>
> This is an RFC because a few open questions remain:
>
> - Placement of the new rcv_mwnd_seq field in tcp_sock:
>
>   rcv_mwnd_seq is updated together with rcv_wup and rcv_wnd in
>   tcp_select_window. However, rcv_wup is documented as RX read_write
>   only (even though it is updated in tcp_select_window), and rcv_wnd
>   is TX read_write / RX read_mostly.
>
>   rcv_mwnd_seq is only updated in tcp_select_window and, as far as I
>   can tell, is not used on the RX fast path.
>
>   If I understand the placement rules correctly, this means that
>   rcv_mwnd_seq, rcv_wup, and rcv_wnd end up in different cacheline
>   groups, which feels odd. Guidance on where rcv_mwnd_seq should live
>   would be appreciated.
>
> - In tcp_minisocks.c, it is not clear to me whether we should change
>   "tcptw->tw_rcv_wnd =3D tcp_receive_window(tp)" to
>   "tcptw->tw_rcv_wnd =3D tcp_max_receive_window(tp)". I could not find a
>   case where this makes a practical difference and have left the
>   existing behavior unchanged.
>
> - Packetdrill tests: Some of these seem rather brittle to me; I
>   included them mostly to document what I have tested. Suggestions
>   for making them more robust are welcome.
>
> - MPTCP seems to modify tp->rcv_wnd of subflows. I haven't looked at
>   this, since I wanted to get feedback on the overall approach first.
>
> - Although this series addresses a regression triggered by commit
>   d2fbaad7cd8 ("tcp: stronger sk_rcvbuf checks") the underlying
>   problem is shrinking the window. Thus I added "Fixes" headers for
>   the commits that introduced window shrinking.
>
> I would appreciate feedback on the overall approach and on these
> questions.
>

Hi Simon, thanks for the clean series.

I would guess you use some AI ? This is fine, just curious.

Can you add more tests, in memory stress situations ?

Like :

A receiver grew the RWIN over time up to 8 MB.

Then the application (or the kernel under stress) used SO_RCVBUF to 16K.

I want to make sure the socket wont accept packets to fill the prior
window and consume 8MB

8MB seems fine, unless the host has 100,000 sockets in the same situation.

Thanks

> Signed-off-by: Simon Baatz <gmbnomis@gmail.com>
> ---
> Simon Baatz (4):
>       tcp: implement RFC 7323 window retraction receiver requirements
>       selftests/net: packetdrill: add tcp_rcv_wnd_shrink_nomem.pkt
>       selftests/net: packetdrill: add tcp_rcv_wnd_shrink_allowed.pkt
>       selftests/net: packetdrill: add tcp_rcv_toobig_back_to_back.pkt
>
>  .../networking/net_cachelines/tcp_sock.rst         |   1 +
>  include/linux/tcp.h                                |   1 +
>  include/net/tcp.h                                  |  14 +++
>  net/ipv4/tcp_fastopen.c                            |   1 +
>  net/ipv4/tcp_input.c                               |   6 +-
>  net/ipv4/tcp_minisocks.c                           |   1 +
>  net/ipv4/tcp_output.c                              |  12 +++
>  .../net/packetdrill/tcp_rcv_big_endseq.pkt         |   2 +-
>  .../packetdrill/tcp_rcv_toobig_back_to_back.pkt    |  27 +++++
>  .../net/packetdrill/tcp_rcv_wnd_shrink_allowed.pkt |  35 +++++++
>  .../net/packetdrill/tcp_rcv_wnd_shrink_nomem.pkt   | 109 +++++++++++++++=
++++++
>  11 files changed, 206 insertions(+), 3 deletions(-)
> ---
> base-commit: 8bf22c33e7a172fbc72464f4cc484d23a6b412ba
> change-id: 20260220-tcp_rfc7323_retract_wnd_rfc-c8a2d2baebde
>
> Best regards,
> --
> Simon Baatz <gmbnomis@gmail.com>
>
>
