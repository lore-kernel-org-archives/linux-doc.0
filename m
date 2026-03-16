Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DE526FD93
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 11:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773659054; cv=none; b=CDPuYxABhMbm7L4yLgW+L4ATnWMnR58UeW+BPmXob7KchK8SgY2rgPg4fVlVITnImrjjZWW8DiUHuwmrf0EHbLieGnMlqf8C+C6ZeBg3TOolL8ADpyk2e1a2IlTeAtRymTzyh0m6pXg3G4l0nWZrxKM+gnDpJr+ktVEDIqXSKHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773659054; c=relaxed/simple;
	bh=1Z2K5uAxzV9s8L4/BC8KNuwonWVfjkCKvcQHutx8mBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u5H/dUiqG8MQk41Yn8KlVL4qw2hMu/og+jCAhI/fDGfoHgNGwWx/OmKyRThSsYWMk2nwg7ASDpAQFJfGzsSt+qcaJHHUgI1YIzVUwNDKSCYbTFUoOZVag3A/nCYYcfZw3nWOQ2ZsYEKGCfKkvDbyouolALB8Sr18qJZLoUac138=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OH36HkwV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QtAnVNWo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OH36HkwV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QtAnVNWo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773659052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EGzcfaMu1FLaomn7Oe2DL0qLnEzAPj3x2+LI9gIhWi0=;
	b=OH36HkwV9CBef84YbmCsFQ4gvyNIm58tZlgvXTFpE6vUD/DdxGBA7blsD0CKehCOHXIY+B
	+nybLk46CEMWdMKcdH1ipPqUJKcpLHjU6gbxNTlnbQfKYz64z+QB+R3Yh0LILIBcnghmAz
	M7iFW//l5ihJNastRph7KNoWXXADSZw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-CX5ry1FAPSS5YaqjoR4Z1w-1; Mon, 16 Mar 2026 07:04:10 -0400
X-MC-Unique: CX5ry1FAPSS5YaqjoR4Z1w-1
X-Mimecast-MFC-AGG-ID: CX5ry1FAPSS5YaqjoR4Z1w_1773659050
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-43b3e6eb998so1113673f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 04:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773659049; x=1774263849; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EGzcfaMu1FLaomn7Oe2DL0qLnEzAPj3x2+LI9gIhWi0=;
        b=QtAnVNWo8RDAYP2tynSJuh1yaXc/I/KwuthId2CwkLuKRJ2Ky7ltkEerd2MdzITida
         L0tpSUOcrNABSep9Av9XKMsdGm24g4HXTRpeLv+aXS0vgIIiyfWTr+LpDxVK8qKNrb2e
         VkqUzEmlKoU6Tb1LiwOlxg2ctSE4SmWYO428jIcQsfpY9O5Q2REAlxsXpzZASD9INOZs
         I4gWwuIW6q2MBl2ybkZZHqQ2tOSmKjkBQyI0ld+L5YB8B15AzmAagP0GlK69bKLh/ocI
         EmGF57lM8e1L/Ww5Ja58yVJiBkt1+N1Q78Zmtb6Z6SGsuaCceIDHKZwr/CN8j12p0P3x
         oXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773659049; x=1774263849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EGzcfaMu1FLaomn7Oe2DL0qLnEzAPj3x2+LI9gIhWi0=;
        b=CEXb/3eAAXfB21tZm1UMnUBoPMMVHBPomRkV9ni4B50Rrewg6kyXtYk5pbe1iVPBdw
         56tIH40l45vhY1f+ZGcRxRjL/t3jlab/jJQCbVrBdasyTbw+9u6bhiJZLL+1oaOqNyRd
         Pko9sTxf1qx4eM+0QWtq9dG7NfUVSdU+kuzHeNJsO9leLMyXHrMKZlU9/8q8LIGNOe3Z
         4iiHgNy2UFlBNGIUhKzb2o2nUfadxPW6JQAzXa8sRWJHGkqPfjlnoisAXbh+0e+WniG1
         BYl3Lhgx3E5YEQ9Bnj4LyNYnDLZ475+XcD75EHScTBHJYmHd7kBrrNuEuQs/Ptf1IcZG
         Zo1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2ZxuVwNygNu7nDRfdeT+LOidNA8zrBb7t0i/3q47iYcOYBBTaxjNDkmsp8yu0R2O6oCcuBYNRX2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMEFrvGRRPKu+bAHyXBDlL6q5qO7fRtyonSm7B8Zira1k+S5R/
	2gechaMgCix5ySA3OiA5io7x9cjs6SA+XgkTTXiLaUtBKcGGG9m5AeiUD4brA1WhrC9wfnI1e1+
	D77U79E3mU/jrMOwYiwimJmUdx6dcN/iFd8h2c830k2S9HyDhC+0J8hBBRcY915xXAVWnHQ==
X-Gm-Gg: ATEYQzyVVursIE7qHNmPEAOPm1utPYn5o19nkBiINeTVjtr5jHmxUwUO/DKxfPb1o0g
	s/szkzWnJIZVANShhNmg+3QpsJT1CGjn/0WvphdBxdk1cbRnxg+l9CrKbB0yFWNf1NCdIViKeyF
	ExZ47PX+AUuabi8vTCrYfSXJR1zoXNLqRreZPKzOv9Hpq810DCyC2pWZCPM0tlFx/ObxJX1/nT7
	V+TscwWb6fLEN7htdQleScQzh8P9OOVHR8bW/ijeTT3LYFfn5Ec9gsJCKwo7iqHRz1n9B/7uGKd
	/ALqf/C5tV21EeFSKzreAtk/Rdyjp5ZEwZkBNy9yf83FpQ3uvAqk4gUuYF4EpTzrM8JXfYmBYFY
	QGUDsLdPaEBwA06wnFldswJAVmKxCsFg04MzeBPwK2MzjfzfkS/4SsSI=
X-Received: by 2002:a05:6000:2901:b0:439:b3d2:376b with SMTP id ffacd0b85a97d-43a04d86856mr21339372f8f.14.1773659049165;
        Mon, 16 Mar 2026 04:04:09 -0700 (PDT)
X-Received: by 2002:a05:6000:2901:b0:439:b3d2:376b with SMTP id ffacd0b85a97d-43a04d86856mr21339273f8f.14.1773659048589;
        Mon, 16 Mar 2026 04:04:08 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19aec5sm41595197f8f.4.2026.03.16.04.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 04:04:08 -0700 (PDT)
Message-ID: <442cfa35-78b1-48f4-9565-e884e7e60d79@redhat.com>
Date: Mon, 16 Mar 2026 12:04:05 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 05/14] tcp: grow rcvbuf to back scaled-window
 quantization slack
To: atwellwea@gmail.com, netdev@vger.kernel.org, davem@davemloft.net,
 kuba@kernel.org, edumazet@google.com, ncardwell@google.com
Cc: linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, mptcp@lists.linux.dev,
 dsahern@kernel.org, horms@kernel.org, kuniyu@google.com,
 andrew+netdev@lunn.ch, willemdebruijn.kernel@gmail.com, jasowang@redhat.com,
 skhan@linuxfoundation.org, corbet@lwn.net, matttbe@kernel.org,
 martineau@kernel.org, geliang@kernel.org, rostedt@goodmis.org,
 mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 0x7f454c46@gmail.com
References: <20260314201348.1786972-1-atwellwea@gmail.com>
 <20260314201348.1786972-6-atwellwea@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260314201348.1786972-6-atwellwea@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/14/26 9:13 PM, atwellwea@gmail.com wrote:
> From: Wesley Atwell <atwellwea@gmail.com>
> 
> Teach TCP to grow sk_rcvbuf when scale rounding would otherwise expose
> more sender-visible window than the current hard receive-memory backing
> can cover.
> 
> The new helper keeps backlog and memory-pressure limits in the same
> units as the rest of the receive path, while __tcp_select_window()
> backs any rounding slack before advertising it.
> 
> Signed-off-by: Wesley Atwell <atwellwea@gmail.com>
> ---
>  include/net/tcp.h     | 12 ++++++++++++
>  net/ipv4/tcp_input.c  | 36 ++++++++++++++++++++++++++++++++++--
>  net/ipv4/tcp_output.c | 15 +++++++++++++--
>  3 files changed, 59 insertions(+), 4 deletions(-)
> 
> diff --git a/include/net/tcp.h b/include/net/tcp.h
> index fc22ab6b80d5..5b479ad44f89 100644
> --- a/include/net/tcp.h
> +++ b/include/net/tcp.h
> @@ -397,6 +397,7 @@ int tcp_ioctl(struct sock *sk, int cmd, int *karg);
>  enum skb_drop_reason tcp_rcv_state_process(struct sock *sk, struct sk_buff *skb);
>  void tcp_rcv_established(struct sock *sk, struct sk_buff *skb);
>  void tcp_rcvbuf_grow(struct sock *sk, u32 newval);
> +bool tcp_try_grow_rcvbuf(struct sock *sk, int needed);
>  void tcp_rcv_space_adjust(struct sock *sk);
>  int tcp_twsk_unique(struct sock *sk, struct sock *sktw, void *twp);
>  void tcp_twsk_destructor(struct sock *sk);
> @@ -1844,6 +1845,17 @@ static inline int tcp_rwnd_avail(const struct sock *sk)
>  	return tcp_rmem_avail(sk) - READ_ONCE(sk->sk_backlog.len);
>  }
>  
> +/* Passive children clone the listener's sk_socket until accept() grafts
> + * their own struct socket, so only sockets that point back to themselves
> + * should autotune receive-buffer backing.
> + */
> +static inline bool tcp_rcvbuf_grow_allowed(const struct sock *sk)
> +{
> +	struct socket *sock = READ_ONCE(sk->sk_socket);
> +
> +	return sock && READ_ONCE(sock->sk) == sk;

This is executed under the sk socket lock, ONCE annotation not needed.

> +}
> +
>  /* Note: caller must be prepared to deal with negative returns */
>  static inline int tcp_space(const struct sock *sk)
>  {
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index 352f814a4ff6..32256519a085 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -774,6 +774,38 @@ static void tcp_init_buffer_space(struct sock *sk)
>  				    (u32)TCP_INIT_CWND * tp->advmss);
>  }
>  
> +/* Try to grow sk_rcvbuf so the hard receive-memory limit covers @needed
> + * bytes beyond sk_rmem_alloc while preserving sender-visible headroom
> + * already consumed by sk_backlog.len.
> + */
> +bool tcp_try_grow_rcvbuf(struct sock *sk, int needed)
> +{
> +	struct net *net = sock_net(sk);
> +	int backlog;
> +	int rmem2;
> +	int target;
> +
> +	needed = max(needed, 0);
> +	backlog = READ_ONCE(sk->sk_backlog.len);
> +	target = tcp_rmem_used(sk) + backlog + needed;
> +
> +	if (target <= READ_ONCE(sk->sk_rcvbuf))
> +		return true;
> +
> +	rmem2 = READ_ONCE(net->ipv4.sysctl_tcp_rmem[2]);
> +	if (READ_ONCE(sk->sk_rcvbuf) >= rmem2 ||
> +	    (sk->sk_userlocks & SOCK_RCVBUF_LOCK) ||
> +	    tcp_under_memory_pressure(sk) ||
> +	    sk_memory_allocated(sk) >= sk_prot_mem_limits(sk, 0))
> +		return false;
> +
> +	WRITE_ONCE(sk->sk_rcvbuf,
> +		   min_t(int, rmem2,
> +			 max_t(int, READ_ONCE(sk->sk_rcvbuf), target)));
> +
> +	return target <= READ_ONCE(sk->sk_rcvbuf);

Same here, and more cases below.

/P

