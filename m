Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B3D36896B
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 09:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773048173; cv=pass; b=Z9Uxt7HACZigSr3XdiQn3W1yc9tWLg4cwBBr06n8bUaOh8dag8axspFBfHRMDP0mg2WUzAtDqFCSdrRN95V5NqMEcF25f6Z4IqE//IEJZDsLVxiwQXgnB3Z2/b4FF6BNsyyhRXHa4hWaLV+ium7a2WJkmIr327sF6V8KNPaSar4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773048173; c=relaxed/simple;
	bh=upio09NojrFHMRimK65FKWysiVde+qA9+o9ztExC8qM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GUmqyA/4y0Xm3D7Ayk/BBZr5cilwEKy6ja7dAfVlK8YQKc24bXEVHHNLqaICxm1boCs6j0CGZl3uYc5Dt0h4uUXVcUYewIsWfh80PSOYnvSaTS9lVxrVt736Xe9mBp6wnYr/onkQK1l71pMc7vkHhcYdjzHJCzcqsQqEaGeGZJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fexixnws; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fexixnws"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-506362ac5f7so105258461cf.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 02:22:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773048171; cv=none;
        d=google.com; s=arc-20240605;
        b=hT4ovw7HP996ITkjSXuvV+DLjvrYc+M8x5d0fIME6+3idx2TjSDrPHe28z8zIhRpIF
         5wQ13xO00Sq8EbJAvODc6CcWN53+ycd70Ee1WoKBlINpzUG4Qp+kg+g1itxkR+N8zY8q
         lF5/lvwNK1GZbBBqhtOF8eRQZD2sG0jamYmG2W4Z88vqPF1X7N9NuHsb0QwgVEwiE1I3
         1D9b88yrvlwdcuwoD0KwkVXJpDE2WbWyQZdA6iDJYC9yRJ8/IqtCxuxroigYDFMFR8n7
         eOdu7xLwGq1PAUj7SxuEhuK1zS3MpUZz0Br2FlO9CZTrIgcIgiSX3k27SW9LPXG/RDE0
         vS3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N7fC3bjKwQcF/Me1NQG71BV/tCAMZf7S0tDB0ddNnBM=;
        fh=+YgOUnBnj7ty1E/lG0uSS5Gke6pG9lqKpcXtuXYxHsg=;
        b=D+YpYMPxO1getqlfyU933i9cn3S5dt90ga8G433xp0GUyGXYoLVWCyw6n6Nk6gFNca
         SaXhphwDO4bfQkoA3wr9NgPwBCCyiS05RRol2HNgp71PTj8UMo819QUj7g/jiDwBW4rE
         LJINBiQ/LQMW0a+o0yXljk5WHRGenexco+azN+9zNLNRX5FT/Hw+bQR/lxSCSF2VnAdJ
         vVLyoP9qBP2+BwskhxrHE4MxoYNTW0Yf5KkGweRVCW7ILVa16nzc54vd/FNDiDSMmKWR
         CGohJyWG/7qxwKD5a8HuiNyTJoRndXTlTbvPVf71ygMGJi+PkDPhgburRewJbI+Hi05d
         CSdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773048171; x=1773652971; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N7fC3bjKwQcF/Me1NQG71BV/tCAMZf7S0tDB0ddNnBM=;
        b=fexixnwskWyap/xV0vuQW1vre2lrsKvrlUl4bS1mgw54DXmcLrk0oZJimMGz8kIarm
         Q3ELG5dzOKm6C5zpFk+F5FrL5QJFHGhnDCU13/B0yhT2a8HHxfZdOsbSRnyxhoxB/S0D
         yllytPkipre5Wq8gYM4/c85/LFZQS03gacEkv6bbKbQlyp/u1c4E/Ze0EbH1Oy/6i2Sy
         jeZiBBTSt1G8SRsAwldNqm5V/4Cebb0t36JrukuhrGTxwKAUc576eJXoYXIrEFAXM3l/
         Ba2HHiCLRMVQou9gdxUyP9Vpzh8HzjcDumT2c8HlRaCLamc/1Sp2sIrSQBmKd3860kcW
         DCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773048171; x=1773652971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N7fC3bjKwQcF/Me1NQG71BV/tCAMZf7S0tDB0ddNnBM=;
        b=apNKtHi6cYk//dGMxuu8eX7r/k5UZGbATvhgjywhGCLdQnExrF6STW8CTnK/JsgrfX
         qxBES5sEt3avALAcWiHx2Qt5goz1PSG8zcBiJcpl8KUk6bsMu/y+SpIXaNEF5iVWLRaw
         gOQabv3bUlsQuIDHzIUWtRkrnIRNyk8nhTj+cmj7Bj+AMX9OKTA72b8zueVRTUUkJRl5
         8eUCzk6EZwTM4sdOeiNfiH6+9/bGZQ6o/LUogy13HDMKdf+kSbIbHejvDdIYZ+DCkxBp
         M7gAXzgOH3zl7kkEQH1QR8FDkBUGEjtOe0D4msMbV4xUM221+yW5zaxP1pwBdnA2EB0F
         0xAw==
X-Forwarded-Encrypted: i=1; AJvYcCVZ44DjtIwreOA6vQCNGQ5g8OLCdreTrYyrcR4pUFYY9v2jDTSkohiyidswIpaIjCbXRzLBj2AUNQk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcwRNi3gsB+scbxZwHug51W68suvP5ysmIE4e4FhwyU1oxZjWk
	5F7XrujhSa4YiBImkC+9S26II1yvD9DKmcwNXrWN7QRJly79hYTMqKkJrkY7gmQJy2tDHARPpQJ
	czSq57umvyFYZiEs9kE6Vr1/0q6xU4eoeE09TITgC
X-Gm-Gg: ATEYQzwr/tYiQlMeolxxZ6h0TBp0dkWVuLQZJUQRPNvzsp+TY0TDsVW1WzpehLcf/Zy
	LZe2TGPo96K23CjBMoPtrKC8DW0F4BewjzZyT4UQasSt0Gwg7/0EtFT9KtLEmiCkFCWsAMaW5Gp
	/zJVnMlV1rXAA3oW5X9WHz6FJn6jKJG19Iq2/1U+hqOX7DjhGA3HMn9QQTgfeqXisrTmEszUsvf
	S+4yXunKMxFqCTlgXu2IoQlQDv97NOLu8XFvyy4G4XGRHpMdQDoCETAmmujhfvZTlo60DqVQaFX
	tUyx3NFsyweBEm/Q0A==
X-Received: by 2002:a05:622a:7c91:b0:509:882:9e72 with SMTP id
 d75a77b69052e-5090882e153mr50961191cf.1.1773048170529; Mon, 09 Mar 2026
 02:22:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-0-4c7f96b1ec69@gmail.com> <20260309-tcp_rfc7323_retract_wnd_rfc-v3-1-4c7f96b1ec69@gmail.com>
In-Reply-To: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-1-4c7f96b1ec69@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 9 Mar 2026 10:22:39 +0100
X-Gm-Features: AaiRm515VzWer9rfQTDKEwoECAFtXOyO-47wB6RLAYk2qz4MnRNOLIFCZe96lfc
Message-ID: <CANn89i+38t+PpB5duS_-FX_=PwyCQaN2HYohocJBAvZ7Cd8-KQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/6] tcp: implement RFC 7323 window retraction
 receiver requirements
To: gmbnomis@gmail.com
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

On Mon, Mar 9, 2026 at 9:03=E2=80=AFAM Simon Baatz via B4 Relay
<devnull+gmbnomis.gmail.com@kernel.org> wrote:
>
> From: Simon Baatz <gmbnomis@gmail.com>
>
> By default, the Linux TCP implementation does not shrink the
> advertised window (RFC 7323 calls this "window retraction") with the
> following exceptions:
>
> - When an incoming segment cannot be added due to the receive buffer
>   running out of memory. Since commit 8c670bdfa58e ("tcp: correct
>   handling of extreme memory squeeze") a zero window will be
>   advertised in this case. It turns out that reaching the required
>   memory pressure is easy when window scaling is in use. In the
>   simplest case, sending a sufficient number of segments smaller than
>   the scale factor to a receiver that does not read data is enough.
>
> - Commit b650d953cd39 ("tcp: enforce receive buffer memory limits by
>   allowing the tcp window to shrink") addressed the "eating memory"
>   problem by introducing a sysctl knob that allows shrinking the
>   window before running out of memory.
>
> However, RFC 7323 does not only state that shrinking the window is
> necessary in some cases, it also formulates requirements for TCP
> implementations when doing so (Section 2.4).
>
> This commit addresses the receiver-side requirements: After retracting
> the window, the peer may have a snd_nxt that lies within a previously
> advertised window but is now beyond the retracted window. This means
> that all incoming segments (including pure ACKs) will be rejected
> until the application happens to read enough data to let the peer's
> snd_nxt be in window again (which may be never).
>
> To comply with RFC 7323, the receiver MUST honor any segment that
> would have been in window for any ACK sent by the receiver and, when
> window scaling is in effect, SHOULD track the maximum window sequence
> number it has advertised. This patch tracks that maximum window
> sequence number rcv_mwnd_seq throughout the connection and uses it in
> tcp_sequence() when deciding whether a segment is acceptable.
>
> rcv_mwnd_seq is updated together with rcv_wup and rcv_wnd in
> tcp_select_window(). If we count tcp_sequence() as fast path, it is
> read in the fast path. Therefore, rcv_mwnd_seq is put into rcv_wnd's
> cacheline group.
>
> The logic for handling received data in tcp_data_queue() is already
> sufficient and does not need to be updated.
>
> Signed-off-by: Simon Baatz <gmbnomis@gmail.com>

...

> diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
> index f0ebcc7e287173be6198fd100130e7ba1a1dbf03..c86910d147f2394bf414d7691=
d8f90ed41c1b0e3 100644
> --- a/net/ipv4/tcp_output.c
> +++ b/net/ipv4/tcp_output.c
> @@ -293,6 +293,7 @@ static u16 tcp_select_window(struct sock *sk)
>                 tp->pred_flags =3D 0;
>                 tp->rcv_wnd =3D 0;
>                 tp->rcv_wup =3D tp->rcv_nxt;
> +               tcp_update_max_rcv_wnd_seq(tp);

Presumably we do not need  tcp_update_max_rcv_wnd_seq() here ?

Otherwise patch looks good, thanks.
