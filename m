Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B2F43901E
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 08:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132912; cv=pass; b=tzqT6hJJKE7/ZX4Bc9Gah6jIiQkSBEuXDWQbDW18Q72Y5NoG5Wbz8I2ZoowPI3xxauRB1Sx0dwUicU6nSjc+eyjAGeq1k8vhjpPldqWBFHsXIPwpTWuXnawLr3VXMZmAHk+9zfQZ2G5bcTtQ/AotiD1ilypNoncGl8bDq7GFn+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132912; c=relaxed/simple;
	bh=MTpfFIjKFrgdOM/fNUp2/tdXoh0iY9f5YiOgrsaFrPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xp+T+cHQEne5UFQBrl4thekjic0rQepLc70xbfU4FQIlQDbyVVLGS3B2LhwqBcf9oLbOWv0cEI+nGvXJlmX4KxVIrZTOghZzN9BDwYmwCXmkhJfDSuuhTw7IyRDIpIwNM/tGuVPu3FXtSrSTAOvlRv9ndzc58hahd7i/0wm2U+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Na+svgUq; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Na+svgUq"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-509101189f1so22670401cf.2
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 01:55:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773132910; cv=none;
        d=google.com; s=arc-20240605;
        b=Neyan5w7fTFHefyPli3nXcNuhJR4Hdua9K4AjcfHsE5h4qD77MyRL06erFMoeWU+rP
         TyxebvBm02mTWDiOPrR9mI/wOtHTFnEoZUD/zsZB06GFI4Vycx/Y3E+ZwvTqWcHhWCwx
         /9oTEXTuHlIVaiHi+Jy2z4tcQIHXvJVxtcg60DUTKnxVlhBxWbY8Cxj5y4CL7l7JU8GV
         PEsIPwUxafTZEswP2Wk9GI/RP05SxzjKxrQ0tsCkx6faHz/2VLsF3+F2QxlqyMSs92RR
         XTcCPOwfG2JO6iuEIIi4VW9mpl+B1qSRnbxGfQ1QLBFS1pU+m+4ZtY+FWWHDVYV96B2+
         nQZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=57HCSNZqdX/pE4pNruhHCDIUKjmgpBGDki8+akqS8UU=;
        fh=y/kqGhKFq5QCMjHzNrxnWUvxAVAnFYR+/HBx6fCwjZE=;
        b=d9ozAr+f4aZo545mNUBvf6BuldLqut6Mcuv2qtbWCSuZUYnsdMapY0pDoZc0wPf8WT
         ofMMzXqg3K8REPQi0OBv8mgP8lpq43W/ejlEyZ+CYKy4hQbI3il2rJBt3+s2QbPqcvqc
         wU3gpxk79eFvu6jVNETCzhOtckzHFksyn55p9Q9wjlqmvHyW7Y/VVkbiFrw6dXBOfR0g
         fLWgck/VEG9q7VdLkmvvkEowH1dt8bnyacv6GXe3RsobtVyZ8KY7QYFGL5Uy7QqLGOQY
         sPKu0yddMJB87ErzIvK8Q0kVGVcQVjlquHyo1ixCcQp5CQypfNOt5uHlk0uK6IT55m6g
         0FwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773132910; x=1773737710; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57HCSNZqdX/pE4pNruhHCDIUKjmgpBGDki8+akqS8UU=;
        b=Na+svgUq44IuBfIMo7Klc0RYjv/TsrLaKTwoey9HZ0bXK0wo8C00IFs3Jv1+ms5dUl
         p/DxQp3wfeVNluCcoAGu/2FXSmUm/2wMM+kB6H3jBWhMue0QQ+mw+JOHsqUP8RDahWNg
         d1FV6Pzd3gC8T6rvTQbp3BtxxlinrVXfspaik3PpSNVS8dVuJI+d2dkPIRRMq71r0reR
         D17ZozN5YC22WBM94XO85aaydhrSSAvotl3mRbTHdAxspt28345+x9xEIRCMXUs9CRUv
         6T/AgUH90TpT1ktJphoZEbnR5EqPORJVZTozklqgPWOMa9Q+rotpTUnE5HlycLQJ7aaB
         wpRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773132910; x=1773737710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=57HCSNZqdX/pE4pNruhHCDIUKjmgpBGDki8+akqS8UU=;
        b=At1tGJf45quZzLYJiaF/xfkdXVqPvHRE2BQW6XKbIJ7RdineCx+99Cy7ksj59rhAeC
         nlRN9SJmwAUqO+y4+03SaeJXjJh2A4pgBXRxQcECkvWJDb079celH7fLSoz4i7b97IY+
         miEpSNmN/Y3y3Ju1A5ZqNrHL8R0LKhXbuML6ZKWxcl7UURgvDVB6+uHC3JF5pyaCA9t0
         5xfPRqCVlGE/3K2RfUeZADbdMqo4SLrKssvQcSsbSXQHEUtHTB4kfIVtEuOLrDr3bC2N
         GDalFeskzSVOPVuEugTgizxjtBwpGZWUFuH78JtZfmVbPECOE9rFdxX78nqfxmG4EmMn
         E2yw==
X-Forwarded-Encrypted: i=1; AJvYcCVvh1QZb1FiLNE268TffFt6LqhOcwa/RvLg/V7yOEspQlyrWwDeWcEGtcsGqvxZ7wUsmNDdiJx2zCw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA1Oe/O7lbO5McdC8h+7ePNNeTDah5TPWFMhWFXPJmm938zEau
	DMPxVjuMXd08LxTi0KCxN9JmfgmdVBNJNArt9W9wE6fZGwwZL3j1M8F/8KBz0cFkUDW15KpJUiw
	P92JTpp93DrgS+8CQ5LjoAatwW/ZhvbbYFGRIFbZY
X-Gm-Gg: ATEYQzzkzFpPtOkqyS9OCIFOgRVzDV402NKkjStYgypeDsBKZS2QbBZbUVUEOzNhSWC
	SAa8mbyCPM6AlIZAe/yOSRCWECLT1fEwNMptYHPSSEBTj0sk9RQLz1qobpkTmCztvZA2+lb9YnJ
	yEyIxWYjIKH50jX7QgGgfo4joIORYtZypR+kb6bNc5XfRwaGVXaENbj4csqPgjcqQg5EG/qDMSY
	QoI6mpk5I4kF8x9ZT2dNrmrO2+5yWXdtJ5xzTzmeiOX82/N7aHQNFzHsUCF3hTSaUN18+PL1vuP
	h2Bv5cQ=
X-Received: by 2002:a05:622a:283:b0:509:272b:b3ef with SMTP id
 d75a77b69052e-509272bb73bmr26369351cf.35.1773132909710; Tue, 10 Mar 2026
 01:55:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-0-4c7f96b1ec69@gmail.com> <20260309-tcp_rfc7323_retract_wnd_rfc-v3-6-4c7f96b1ec69@gmail.com>
In-Reply-To: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-6-4c7f96b1ec69@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 10 Mar 2026 09:54:58 +0100
X-Gm-Features: AaiRm52hpqwFLhiGxunf2HDckqwt_QrtXyTul6g4VBswXcYgEk1a2sH7NGzoxSg
Message-ID: <CANn89i+PypF1cK4mnp8L_eCG_z+3Aj6uxJoohm_=DwGfR1=4FA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 6/6] selftests/net: packetdrill: add tcp_rcv_neg_window.pkt
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
> The test ensures we correctly apply the maximum advertised window limit
> when rcv_nxt advances past rcv_mwnd_seq, so that the "usable window"
> is properly clamped to zero rather than becoming negative.
>
> Signed-off-by: Simon Baatz <gmbnomis@gmail.com>
> ---
>  .../net/packetdrill/tcp_rcv_neg_window.pkt         | 26 ++++++++++++++++=
++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/tools/testing/selftests/net/packetdrill/tcp_rcv_neg_window.p=
kt b/tools/testing/selftests/net/packetdrill/tcp_rcv_neg_window.pkt
> new file mode 100644
> index 0000000000000000000000000000000000000000..15a9b4938f16d175ac54f3fd1=
92ed2b59b0a4399
> --- /dev/null
> +++ b/tools/testing/selftests/net/packetdrill/tcp_rcv_neg_window.pkt
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +--mss=3D1000
> +
> +`./defaults.sh`
> +
> +// Establish a connection.
> +   +0 socket(..., SOCK_STREAM, IPPROTO_TCP) =3D 3
> +   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) =3D 0
> +   +0 setsockopt(3, SOL_SOCKET, SO_RCVBUF, [20000], 4) =3D 0
> +   +0 bind(3, ..., ...) =3D 0
> +   +0 listen(3, 1) =3D 0
> +
> +   +0 < S 0:0(0) win 32792 <mss 1000,nop,wscale 7>
> +   +0 > S. 0:0(0) ack 1 win 18980 <mss 1460,nop,wscale 0>
> +  +.1 < . 1:1(0) ack 1 win 257
> +
> +   +0 accept(3, ..., ...) =3D 4
> +
> +// A too big packet is accepted if the receive queue is empty
> +   +0 < P. 1:20001(20000) ack 1 win 257

We do not see the answer, it seems this test is not complete ?

> +// Send a RST immediately so that there is no rcv_wup/rcv_mwnd_seq updat=
e yet
> +   +0 < R. 20001:20001(0) ack 1 win 257
> +
> +  +.1 %{ assert tcpi_state =3D=3D TCP_CLOSE, tcpi_state }%
> +
>
> --
> 2.53.0
>
>
