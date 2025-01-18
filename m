Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D7117B421
	for <linux-doc@vger.kernel.org>; Sat, 18 Jan 2025 15:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737212619; cv=none; b=mjZ4EcIfNyUyeQn4gWmfbK2ZOHnlCZ8G1rT4tMrH2ri5hxsFoRwqOTmbLfHI3alhX+YMcHrinLV0/zMMiaEOIUQiD0Z/LCCLLGY2VNpycxxIrice3DI12eQaqnhThGz54xVy3RF9uMqPlNVurA1hWiErgRHHnVtFk4bbpPw9tTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737212619; c=relaxed/simple;
	bh=NablIjmRy2nMx39DICWLlVTQ1be/IJAFT6T9D7/baDk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eQwaJa2HOi7CHKsDdYMkRR3XMg0P7RQqnreRi3FPEdsNK6FMRn+AqswFlT87DEdojUEtIoXfnsdcIHNy1CiBNpNvytjgubNsHMHq3gNiYMtR3vEULmcJlWZ6go3iUAdR8M8McqPjUP1VjByTqUpjTCv2L9/bGA7hacboDGTszPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=DuSS+wiE; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="DuSS+wiE"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so610878866b.3
        for <linux-doc@vger.kernel.org>; Sat, 18 Jan 2025 07:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1737212616; x=1737817416; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BsU0V10dN1yqoMT6qC2L8DSBzvmEhUqKxrypw2scHJ4=;
        b=DuSS+wiElEwB1O4ZL0hpejwnJ5OJfYMvapKTUjF5pkEWbcyKGsWaRZpjqHczNQ7WZj
         aAJD/d1D/rAw34tmjbnXzeZEqHkHWXRhQirJFQ7TeE4/Y2Le8PBM9E6HxerF6XETU8ko
         zT2UgIor+hHlG7m4FcnRTzEf0XUOeQ3IUnwMN7HhGNkmFGJnLn/lEbT7Oz8dqV/C9gJO
         +QwUU8UnKzrYIPkwXLLP4RkODM5dKuf/TmhGG1aeC4VPG2da+Igxp+rMUzBEPdMbsHnx
         UGs2mjI5gkSo5I8sv4001QqzMGHPeVFHvf6fPz/k3lr+ywtljGZq4fapmBSLLvtra1yc
         x0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737212616; x=1737817416;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BsU0V10dN1yqoMT6qC2L8DSBzvmEhUqKxrypw2scHJ4=;
        b=r++KUgtoajPMJKFogy6BGDS2y8m+x6OyAO6fk7VMLvZ3wRWyj62i4VbZnytoODecYP
         2zolRHWfL1dII2TI16OlhXUfYZUWHEpB51GZj7tKfkSbp+d+QNaVpdmWoflheY7rzu9O
         MVWhguPgSv+n5ar0XMbhvvrp1DvNg/tO3MOruxFW7PLn4ra9XkBVO4jvtfN1SZrbG4Qr
         mj4zR5+K8Dl1hvNGkI4WsBtWUaJTjpTWC72AHfaHMq4Ani67S1Yji9711Fn5d7sg4bW8
         gm8xT8GIKs+1aBjwHkemXEMeZ7b6bWxNLdjuK34tjQPs3zAAGpQsqLE9AQG7/KRJLvG4
         cfcQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0Plb9HM9gZWO+8ey5AyLKbsPd+mXy3W+JU4FkVXqNp1eg8VTPblImSBuxkcB1zbgAejGXLEGFflY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKJA7CGatWNjsqDsnJ7zAYPTo99b4lGlefkrHRKgEJ9G5KNiuN
	/Mum33U8l6b0CPrY3G5/53Lsx2PcK7kMg/M2ngd4UZ6NhCV6V4ifkypeUl45Q7U=
X-Gm-Gg: ASbGnctFCb0ymmGQvZRk3vLfyccJ8snaUSBEmXHqA0s7Kg/wqyHHZDdkCKnRTNMxsfq
	iFEDiM6cJPNkS4msT962Qaj0jyTdkJcheKg7T7RaAVlmAeusfbExwr9C/BWVpnuQSByXTUUNUFI
	Hh3u8/xpufxYXUKtuVJrmrg+yy/CHwpdJg+fzK1H+RairWq3DKgL7qlB9rpnBpIf+9BUv0nqaV9
	G3QCahDL5yB5pI14a6fwnpSjKNK4SfsdXfLJtG5UDE4dFkZ/BZ1u00QI0Wk1w==
X-Google-Smtp-Source: AGHT+IFly84G+OXXo/u1XMLfKGjBq9YlBfFskeFDqv4t2HPmXeMR34kxPqt/OhU/z8Yer8BWZqR6Fg==
X-Received: by 2002:a17:907:805:b0:aa6:7c8e:8085 with SMTP id a640c23a62f3a-ab38b1100f2mr638880466b.15.1737212615807;
        Sat, 18 Jan 2025 07:03:35 -0800 (PST)
Received: from cloudflare.com ([2a09:bac1:5ba0:d60::38a:14])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384c613d9sm348102566b.31.2025.01.18.07.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 07:03:34 -0800 (PST)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Jiayuan Chen <mrpre@163.com>
Cc: bpf@vger.kernel.org,  john.fastabend@gmail.com,  netdev@vger.kernel.org,
  martin.lau@linux.dev,  ast@kernel.org,  edumazet@google.com,
  davem@davemloft.net,  dsahern@kernel.org,  kuba@kernel.org,
  pabeni@redhat.com,  linux-kernel@vger.kernel.org,  song@kernel.org,
  andrii@kernel.org,  mhal@rbox.co,  yonghong.song@linux.dev,
  daniel@iogearbox.net,  xiyou.wangcong@gmail.com,  horms@kernel.org,
  corbet@lwn.net,  eddyz87@gmail.com,  cong.wang@bytedance.com,
  shuah@kernel.org,  mykolal@fb.com,  jolsa@kernel.org,  haoluo@google.com,
  sdf@fomichev.me,  kpsingh@kernel.org,  linux-doc@vger.kernel.org
Subject: Re: [PATCH bpf v7 3/5] bpf: disable non stream socket for strparser
In-Reply-To: <20250116140531.108636-4-mrpre@163.com> (Jiayuan Chen's message
	of "Thu, 16 Jan 2025 22:05:29 +0800")
References: <20250116140531.108636-1-mrpre@163.com>
	<20250116140531.108636-4-mrpre@163.com>
Date: Sat, 18 Jan 2025 16:03:33 +0100
Message-ID: <87a5bodv0a.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Jan 16, 2025 at 10:05 PM +08, Jiayuan Chen wrote:
> Currently, only TCP supports strparser, but sockmap doesn't intercept
> non-TCP to attach strparser. For example, with UDP, although the
> read/write handlers are replaced, strparser is not executed due to the
> lack of read_sock operation.
>
> Furthermore, in udp_bpf_recvmsg(), it checks whether psock has data, and
> if not, it falls back to the native UDP read interface, making
> UDP + strparser appear to read correctly. According to it's commit
> history, the behavior is unexpected.
>
> Moreover, since UDP lacks the concept of streams, we intercept it
> directly. Later, we will try to support Unix streams and add more
> check.
>
> Signed-off-by: Jiayuan Chen <mrpre@163.com>
> ---

Needs a Fixes: tag.

>  net/core/sock_map.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/net/core/sock_map.c b/net/core/sock_map.c
> index f1b9b3958792..c6ee2d1d9cf2 100644
> --- a/net/core/sock_map.c
> +++ b/net/core/sock_map.c
> @@ -214,6 +214,14 @@ static struct sk_psock *sock_map_psock_get_checked(struct sock *sk)
>  	return psock;
>  }
>  
> +static bool sock_map_sk_strp_allowed(const struct sock *sk)
> +{
> +	/* todo: support unix stream socket */
> +	if (sk_is_tcp(sk))
> +		return true;
> +	return false;
> +}
> +

We don't need this yet, so please don't add it. Especially since this is
fix. It should be kept down to a minimum. Do the sk_is_tcp() check
directly from sock_map_link().

>  static int sock_map_link(struct bpf_map *map, struct sock *sk)
>  {
>  	struct sk_psock_progs *progs = sock_map_progs(map);
> @@ -303,7 +311,10 @@ static int sock_map_link(struct bpf_map *map, struct sock *sk)
>  
>  	write_lock_bh(&sk->sk_callback_lock);
>  	if (stream_parser && stream_verdict && !psock->saved_data_ready) {
> -		ret = sk_psock_init_strp(sk, psock);
> +		if (sock_map_sk_strp_allowed(sk))
> +			ret = sk_psock_init_strp(sk, psock);
> +		else
> +			ret = -EOPNOTSUPP;
>  		if (ret) {
>  			write_unlock_bh(&sk->sk_callback_lock);
>  			sk_psock_put(sk, psock);
