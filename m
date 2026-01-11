Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FC234C820
	for <linux-doc@vger.kernel.org>; Sun, 11 Jan 2026 19:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768159015; cv=pass; b=HHta+9j52X7Y8jcCU5Mt0Qb3Yb/9DyagOqqRnBdcrs5N4NUaEnvmjvOXUTfBeABNpQKD/2G4l7DMCh+PwEIIoRaRoyZRuuKfCx76v+uDZKEoORc8en0LW6CWMeou844Zyz788jIH3Ix5E3nS9oG69e5daIekuCgE4qgF6IqQIhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768159015; c=relaxed/simple;
	bh=GK10uFFBfJnUN7pJIA3veOdTRXwgC+DVFIf9jpvuer8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kEX0H1en/UoAGGEpXDqZlZoPn7mGYJB93iauIzPlj4mjDFX0XkOM8O1IvL3CAlBBiOxSwXdw4CCkjZWPkskd068zZzUey4yZuzXrg/kAWtHqHWapXSP2WB5kRwhJB7aNdfssHYvb94x1kXtoI9ueG5cgvbBENOswwNWYBo53EWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s3nGd6dM; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s3nGd6dM"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59b6935a784so3685e87.1
        for <linux-doc@vger.kernel.org>; Sun, 11 Jan 2026 11:16:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768159011; cv=none;
        d=google.com; s=arc-20240605;
        b=GFiNgwlAml4gtosxZgEJjLyUvVhu1FirGUBR+ianvOe0ECQf+hHOQKgwR/kX+4QY4j
         QYTt+VaqeKsxsl8XHvdnzGavAL1D1zSGlQKZjvOo02MMSCH6xmAR/ronX+UdCZnf1V1e
         qbmke+dw6Ysvvzmq94MfB61RPZGsRFcVg0qOj7cxU3mCwqdhLIJxwge6SMoCILAHb1Lp
         IhcDN0evjBlleuATF5tMufoSeTeTTPI3Jrm2Ue046+ewehSqCguc88X/20s9P5V3g38T
         ltKUnqf6vaUE6XqqkDfqvOdCD0hErjc4g2SvWtP9Bat66fLwLjByT9uw7SXqhKmE1/3Q
         NnKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tpRMXwgaiw/um96I4NIndMS1doXfO5B972oFPSt2YCc=;
        fh=zzE4u+Aa9aLWYhD+/VmW/BFgnsqPex1dkmyesVnSRHM=;
        b=MRHBFEC9yRmJMBROmrVttC6wv4po+5p5ceMyp5NIYaS86vd7JON1q2bIeaMeREUDfh
         Dc8V/08QDQvl+R/unLWOFcxzoM20wwfy8DoBC8wp6a9PQXxZzg2CmyaV6ym/TpQX4YDf
         mKfXi8G39Qg2xh9RITfroV/gY/Hpgp83ey7dVQ8ORCVSXYsWitRMWTlFbzAnSshnvsNZ
         DDifdJ3qArQL2bVu9NxJcNb6uv8H0s/gbOuxysm8v/CbDRl/VI7Kc3DjTLv9VLXwOEXi
         DDhnFSPmexjnFBIIdvOWthdsa5TvSObiVDX2SE0Yvr7IbAQt4r1GcKo6DZRT/7MWqsmO
         6jWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768159011; x=1768763811; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpRMXwgaiw/um96I4NIndMS1doXfO5B972oFPSt2YCc=;
        b=s3nGd6dMyfhoMdv06lXdfkER/JtrT4HoSJ3vBu4za87ymCF/PBLC5nvDIxAuN6vsVi
         zKQpw38gzADgTLZm1Hfp3800313WuCaiBz/opRLKThuXvyl1duLUOnfbN+aYVRvWEknR
         ETxVCM0Sr5bJnX0r293bgI2EEK669HhP9l+g8D3KvulVWa3/Xm6JEcvmGemId3A6bKBW
         356/bxF6No6IkFZKkcsySU++qElgUj50YuSPYHcGcaEiOv4IhJgtznkk/7LiPUmB1wLg
         QBRFi/hOeRKW9RocG2pnUZIsR5IlMf0v/okY5q3UHifrBjDGUcrYcqyiMoxaQVTRHtEQ
         WL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768159011; x=1768763811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tpRMXwgaiw/um96I4NIndMS1doXfO5B972oFPSt2YCc=;
        b=FBFPPKuOn48uOofljXKQiWr+toNnIXTzpEsTCuvFb7ba722ccQJKGB1B+s53z7k6NG
         M9w1EpRYWO5JDn3nK1vkJYPqexMtz5ELMiRWyJMXyD4+S5CNp1y0kWo5bzTHCEQCdlyz
         0+rUlwOOSAB3QAb6Utj70eCsbxBisEpa5WTpyRFCctMaoZ6H3GILsLJRGe3Ml7Jf7IZ9
         Wk6fdUZlJLMCBcEozSesBk/YTGik9r7fyxvtxjoDhZ0TDewLreRtrVt9Qw1qiFV0EHjt
         euVk6iigcU7gZMGyYeGtVS26XKX5imC6yIMAOuLR8u9Ix4spLED+5jsmb2CDQD4fpjHn
         vHHw==
X-Forwarded-Encrypted: i=1; AJvYcCXd5m1HUlGBoWrD/bGdVbNMf0ZABDFEuYONZQ8iQhxFSQ5rb6r6dpeGV9hC5yqzR/cbEnbMCjL130I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxPxSWgYJITH7trTdSikeVP3Plv6cBQrD6/1IGmvfvtx3KHaM1
	hXp5GA/gjFY5Gt4xThoD+AULWClwE0iDPgPT7jlCqR5m9HbBCjsiHt0R0rcbLoCSO4zY7baUKW1
	5bEiubCFgkGK05IzET4hYgoXnV7J64x02Ai7eeYPz
X-Gm-Gg: AY/fxX7acYC6I2qXjty5i/eAXSgRbTjkbflEff4zSmUPyJVKYh8nlPZwh+izoAczrwa
	+RYODhQPIrB3PySq9U/yxlpUO6BKE94YVsK/yl1zHPYNYuUXUN3TogBUnNz2FOdus7blVcEjuqp
	F6p71ZyWv9lshv1xJjfTxPo/7xv6MlwtDmlqnz1FEqLlt5gqNccRFYezMwRlGZPn6QFc+CXEVin
	BXd6EECJvT2vBE12T0s8OBOK9eC6bl7K8flCqzFBIkUD0z4u8VvBqEr+yCy1X+ZfcZb13c=
X-Received: by 2002:a05:6512:1288:b0:597:d606:5b38 with SMTP id
 2adb3069b0e04-59b85911648mr136353e87.6.1768159010781; Sun, 11 Jan 2026
 11:16:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109-scratch-bobbyeshleman-devmem-tcp-token-upstream-v9-0-8042930d00d7@meta.com>
 <20260109-scratch-bobbyeshleman-devmem-tcp-token-upstream-v9-5-8042930d00d7@meta.com>
In-Reply-To: <20260109-scratch-bobbyeshleman-devmem-tcp-token-upstream-v9-5-8042930d00d7@meta.com>
From: Mina Almasry <almasrymina@google.com>
Date: Sun, 11 Jan 2026 11:16:37 -0800
X-Gm-Features: AZwV_Qir-cv-IZVpPXwaBdmvkArrdmGky4-Qr_YMN1JPM7e8jq7epyBCPXxohO0
Message-ID: <CAHS8izMy_CPHRhzwGMV57hgNnp70Niwvru2WMENPmEJaRfRq5Q@mail.gmail.com>
Subject: Re: [PATCH net-next v9 5/5] selftests: drv-net: devmem: add
 autorelease test
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn <willemb@google.com>, 
	Neal Cardwell <ncardwell@google.com>, David Ahern <dsahern@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	asml.silence@gmail.com, matttbe@kernel.org, skhawaja@google.com, 
	Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 6:19=E2=80=AFPM Bobby Eshleman <bobbyeshleman@gmail.=
com> wrote:
>
> From: Bobby Eshleman <bobbyeshleman@meta.com>
>
> Add test case for autorelease.
>
> The test case is the same as the RX test, but enables autorelease.  The
> original RX test is changed to use the -a 0 flag to disable autorelease.
>
> TAP version 13
> 1..4
> ok 1 devmem.check_rx
> ok 2 devmem.check_rx_autorelease
> ok 3 devmem.check_tx
> ok 4 devmem.check_tx_chunks
>
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>

Can you add a test for the problematic/weird scenario I comment on patch 3?

1. User does bind (autorelease on or off)
2. Data is received.
3. User does unbind.
4. User calls recevmsg()
5. User calls dontneed on the frags obtained in 4.

This should work with autorelease=3Don or off, or at least emit a clean
error message (kernel must not splat).

I realize a made a suggestion in patch 3 that may make this hard to
test (i.e. put the kernel in autorelease on/off mode for the boot
session on the first unbind). If we can add a test while making that
simplification great, if not, lets not make the simplification I
guess.
