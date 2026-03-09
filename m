Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064E43793BB
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 09:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773048445; cv=pass; b=WMwLvMkUnBQsljWkPD12gyze0GZSRwOx09qB4K9zo5cBpzET6yYycW4AlVP1UzJpWExqGxth11FqyzWjdGuYcs2TAqtUhTGy4G6oY7VNmnDdUHKsCYqkrhOSKYmPzm5uVWkGDMPYt8BCGVZ0Rti4tYbC/PXDe1g+IERhMMnnzyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773048445; c=relaxed/simple;
	bh=KRg67KYop4N0GYuq1ulIbzn25MYTnK5W2894J9F0VtQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f+t0uA+g3iiLhMaF7c10TK4mCmsmSL0r05ArI00ygh3+BaaW5yTgyXigOij6tsXhF+lisIc1JyBcfUG8V2trIEVjkolOhdV8KdOxBtSNZ1tg3aJry4OuTRB7FqKVGv+msijVA13cWTGMK1AK426pSiwxaBbYxrndc8WO+Z4QVDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rhpMDkGt; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rhpMDkGt"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5069b3e0c66so162455561cf.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 02:27:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773048443; cv=none;
        d=google.com; s=arc-20240605;
        b=YvU56s7K3Lvxaczk62VdVNLY369dlFheUjU4BTdiFn2FxlCRJfdh2EXWsiKOcP1ZIR
         iH916X9rcZd5MNM+dcf9lrNgVSSKGMegC3OS39R8YEfMK1LZ2C4XupGfYUstTxanm1jk
         9yRib9SVv86EaN2rrnQLLHy+2RxBcLsSIWJR5LFFApnJSLXIOTKWwuH+5SIZDqiFCNmy
         MjIPRdmuFY3Fye2L9UuTZAmR6Vxf9juYuZ36rGTX7ShgJKyZdcqqLUWArlI9p7/Q8jCt
         ohxuO7qYbIB+SbgRGdbpInRNAyGE8jVJ7yIepEgxYYdsPNDz06aerRlUyNZzVOc8L/KJ
         9Ytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V689RnMNCiq5v9NKZp9UJyJzDdaI4f7fA+TJBBF1pOI=;
        fh=NuhefqKPVMkV1tYqSTTznpfVQqqcLNQVAOV07GB8sRc=;
        b=lmwtrbTYKarbJ4OXhDJZhrTb6EYHWccbR2m32DCIqvH+W9eNEq6UINX5oOzexDo2DW
         PyQNLwg6wAIGkgJKydFSQuRO0wneeq+sMC874tIQhEM86xm1LmuBE54iAg53MD9X5xQB
         E4puIyovq5if0L2vskzAR3fxSps6ScbmlIVJMKCAv+PvjD7/cfTiJOoZ0gL42EvIuVdL
         KW98eNyuXBF3U2wKqNp7NQ8twO9734JTr5jO77mRqjipRChiBrvLRHYyGbnTMfTJD9Jj
         uqGxY0Lgxz6BXSaBzmofD8JFsm/iGcx/t6rCOgeAHMrhPLc3241KufHxY2AxORgOsxAF
         ZKDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773048443; x=1773653243; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V689RnMNCiq5v9NKZp9UJyJzDdaI4f7fA+TJBBF1pOI=;
        b=rhpMDkGtGMIEmlnLkfDw2oXrfvhd4gXZfyDb7vS/fo19/8788aB0Xku9llKzqY01+S
         5uM39fHj1fLAansQoDXAxWhMsyYZvJuTli/jcZWgTWhuvXRWeAP7hOJfQryBVsVM/CGu
         XDgsPXWJJLUWxjLZjwx1+FOKJpYmwBCmIelJSsD0IhjVtsUmhyjzLERvX4l19CdW+eEo
         SiJ45CxLYR4GAjM5TX7qZRQwTDi35l/6Aer6Bs2SZhPC2HtS7NX3uM1k+USHB/fGnPLd
         RQg56VDtvn4d2PpeTA7GUqbdPc8t6c9H/ep1ChuXl1TaW0tWNEQ0kzJZM2mYzmDuXLzI
         ksKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773048443; x=1773653243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V689RnMNCiq5v9NKZp9UJyJzDdaI4f7fA+TJBBF1pOI=;
        b=euXALfrFTV9I2EI5AZYZ1PNPEyVLvDgKniyu87UoFOxNjjcMinZhsMY5TBENqDwPEe
         1a2Q0TbJ6Jp7wvnkJI1Id42ulmMH71ZtBEjGYdAXg5QvwSHwP9Z5R4nHv8RvSDSX3zjH
         sC+LtUzHjy56dCFvCLzLBFKj1Pr1h+OPGhXUhnXM/KbAPjhBIbKIHnNw5sC4xKPfRqOz
         kl49IvaqPjMdMlpiwE1HdH9rioA160Da6dW6Yv42xKLYPjui6wVUSxB7+KjBTEKajB7e
         9K9pmhzKe8tsakLL0rQl0JWzP1v8iAnroAoWr4a70gc/YPl3uWzW/LyQKQGxiG5jplM/
         cdbA==
X-Forwarded-Encrypted: i=1; AJvYcCVFH9HP1zEb2pJPGkKzogtaQVu5FIkmTusFwtieLWJfPg3UDOYQkCNBiFiSh+qakSUqqNB0h63yMZg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzncDBMKlol9kmB4vJUI1cPGdwRg1zXunY3K18m/Q78mlx3wHxY
	cWmjmYKYh9VKlI1g7bPBIGX7A9bQo2u0q4xudGUrg6Jm5Q4/AUzO0otSZq0ba7S+S0iLBGnVU2g
	e6TYo2+y1vkD5FQWB50WrpVh+UdAGsnxJgGYfqpyM
X-Gm-Gg: ATEYQzzr/IXi1OQfNy7NiXtnhUo49wyDKDUG8CbzuaJzyHNoPUTIMj48aGcGlsPkzd1
	6mWvXqeMhjXM0OJhDirrEx/FxvIlfnJiM0kjCK+LTcnW9IyPRgJuuFnp56xP3ak5wbYMY3MRVjg
	Z5G6a/R/AKQJhb9zhF1FXYJILzh+kSIOet8AVtXq6cVrxwR0jhTk6NvB4YvTdbM8Nhf7b/scwvl
	rdYx5raNU08i7bMBCV8Fdea8gDyQD7EBV1TRaN/ApmHApuN5NH2wORT7FtUqZsjXr+9QOXsuvxD
	xnyM8Ss=
X-Received: by 2002:a05:622a:211:b0:506:1e25:c0d3 with SMTP id
 d75a77b69052e-508f4b39629mr125560661cf.30.1773048442380; Mon, 09 Mar 2026
 02:27:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-0-4c7f96b1ec69@gmail.com> <20260309-tcp_rfc7323_retract_wnd_rfc-v3-3-4c7f96b1ec69@gmail.com>
In-Reply-To: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-3-4c7f96b1ec69@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 9 Mar 2026 10:27:11 +0100
X-Gm-Features: AaiRm52XfGKozvuZyB36ujKchA9srFaJs8-SNxpJxUZoRWouiMvaeYGJTNLDzWM
Message-ID: <CANn89iLzOhZ_DbAQytwZrzoZ6cvkkvLPbvUF81k1C2tBYRSFDg@mail.gmail.com>
Subject: Re: [PATCH net-next v3 3/6] tcp: increase LINUX_MIB_BEYOND_WINDOW for SKB_DROP_REASON_TCP_OVERWINDOW
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
> Since commit 9ca48d616ed7 ("tcp: do not accept packets beyond
> window"), the path leading to SKB_DROP_REASON_TCP_OVERWINDOW in
> tcp_data_queue() is probably dead. However, it can be reached now when
> tcp_max_receive_window() is larger than tcp_receive_window(). In that
> case, increment LINUX_MIB_BEYOND_WINDOW as done in tcp_sequence().
>
> Signed-off-by: Simon Baatz <gmbnomis@gmail.com>
> ---
>  net/ipv4/tcp_input.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index 2e1b237608150c2e9c9baf73cf047ed0823ca555..e6b2f4be7723db14acf2ae528=
df17b6d106b9da9 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -5678,6 +5678,7 @@ static void tcp_data_queue(struct sock *sk, struct =
sk_buff *skb)
>         if (!before(TCP_SKB_CB(skb)->seq,
>                     tp->rcv_nxt + tcp_receive_window(tp))) {
>                 reason =3D SKB_DROP_REASON_TCP_OVERWINDOW;
> +               NET_INC_STATS(sock_net(sk), LINUX_MIB_BEYOND_WINDOW);
>                 goto out_of_window;
>         }

Reviewed-by: Eric Dumazet <edumazet@google.com>
