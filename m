Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957C428C2BF
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 11:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773660262; cv=none; b=G5HxcTi8zOcgcFTVzaIsw6YWqTpvHHHFjXyWGlIJRhwzaOCDdzJnC1DkyU86ELLd1LI7AL4noxVnXfxAlrfCcbLt5yKg3z8DJ45OImVKYvDjvj+5btJDaSkvnDn4hmeCLBIlRGP1bZeFBKq51ug4g8+68mBvLmBotqnKJ3QskXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773660262; c=relaxed/simple;
	bh=vExqsQuY0TOh0C4OqHS5ONqjXZPb4O5dkQOinRtjo/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EhIx0XvziZh2qdqndBqC9B8pLgM0uLFZaKbMR/3nIio7hKwTe7YW3JpAKtJT4nfm5/QSUFCWDll1qZRvaqA+6AzGMaTX0TebdNBceR82yeqZ7hLa+t26TQssTpHS86RHpbKPAAvEilKIJIJBIcbxEfG0iBDgRo4RxKfLNIiwiZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B6Fqyz5I; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NV6fEPkw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B6Fqyz5I";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NV6fEPkw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773660258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H9hWHpx6fXvQ6tiAS+Vx6gKKziz7E3xCqMnpnyHx+ks=;
	b=B6Fqyz5IVSt3GT1ulMlu9mvzM+CA70XjObXe+5Gd8yBnDbRV3zsSgLTfcMrhOcE/J71QOG
	Zx2eMifGvjFmI/YyF4iMbpGml7mir8HQ2GfFjhBHsP4haMNshDJt7b35DI7za79IwcDZdm
	EbzAGhVf3jD+0u46sDwYtQzxdKLcTbs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-kZsu8YXmOnGYDDeX65Jg4g-1; Mon, 16 Mar 2026 07:24:17 -0400
X-MC-Unique: kZsu8YXmOnGYDDeX65Jg4g-1
X-Mimecast-MFC-AGG-ID: kZsu8YXmOnGYDDeX65Jg4g_1773660256
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4853b0af42aso67871425e9.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 04:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773660256; x=1774265056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H9hWHpx6fXvQ6tiAS+Vx6gKKziz7E3xCqMnpnyHx+ks=;
        b=NV6fEPkwo3NU6CHi+YqL3sv30eFK9RhGWJQR0Knl42QG5QcFR8RBiOI+JigYlrQ+ft
         LGQ8FC4dvwlQ3gOowpzISZ1VOIpl7/aLKeHBalDrxcaglCK55flHNEs0qPgzy661nEHQ
         z35/UnsD686/RIgK7SWhdl/mXAmJVaWLEV5LEDIot/ba+1/LUZUKjIGl6L+UjpRKWnup
         h+QRARlNlUHN0TOsmfY/Qsndq9UJT3hYuCevWZVnPTlpJWvgBzmptRdqo4KZJcNFxA7n
         fGXpt2MMVTI0W7xknSJXubk/Xxi824XhoEAacu613aezcKyhyoTGMiO0QpYEP7Pdl/0K
         ud+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773660256; x=1774265056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H9hWHpx6fXvQ6tiAS+Vx6gKKziz7E3xCqMnpnyHx+ks=;
        b=DBI3Onn19R7Fkm0UsHnYTfj6rxjvfVRztgOzh21S+/1vGiKoYcSR4sGshfAaTYo3pQ
         ThbztfouKP33u2mo/xuDvcHBMPTBIQFYtwyvelAj+45CWDuOwoiMjhUYd6xB8zy/ncYu
         Oi9osy9XuC9A5r4XK7fsBoe3rPFbLB0prXdx8tgJ/P6t/g/FwPm/aOzwCqp1xLLfKLRq
         JP2dDiqKy1ldh4xOe2KyFJpx0hKx/HRBzel9csvAfPUouOsTuDnwZUoD/jPvSgEFeOI4
         Zkx2tczj0lrgw+PVVRxXt1e5N1yj9wvBjnXg2waG5xvbHxctrKCug5MdCIwqaiyG+NUO
         ar0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/f+CPc3va/jrbC3d2WsW9f/P1Q7iWaywb2YU/BmnYWLdOAgKXzBUD7n9yFYcagitByxZ+xPXJGPk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzESwmPWCf4pmfz6/PUBaFtDBmV1fve8pei/BZy5f+d4VZW1pIO
	bCxpov9IPu4eACvA/jqT1uSRd8XSyBPjkKmV6GK5CngrkIIQLdypN1TlJNLlC3RE5y8gfuGZUw1
	zh/hX9Jf49Fw8UkDOqsfLA+0/Rw+sBNyxIg14hK+KwA7dMz22k7TjwVLzbGzlzg==
X-Gm-Gg: ATEYQzz5hY4hn7z0sCIFPyZv9eOTPUwgckHTd0M+ISqfo1fPi5OnKmxCKThkjNYjRBM
	IUtPbTVuzxULfOxHyvgFFafjA+aKAzSpsMQUBNcBt69ayTlpbNYhbuZQHAD7VQUPsVIMbaOlN06
	/p2ME6hxGNtbJh5oPVkCqQDA88wY8hwvuHvUclAy+Sz5/fWHZeqbDoLml/tvoSgLyXs1XXx4dZr
	ZgaRVdyI0ogEldK/Tu/OsdQCRYjOGWc/3fyv0rlfKNtjbsKC7RNb2YWPR+Dvj2PNn/vd8BktYcM
	sOXjKyR3oBjDTBEruMffR1f2lq3VhxCsn+dXfoF59T8K/41JxyzZU44kZBm9jafgggkNk4DV6mG
	limLGLwmcDyOPOljBc6FniRqrCnc0YxA9TubdKlST5BWRLAE2MD7JPrQ=
X-Received: by 2002:a05:600c:468e:b0:485:3f58:d9d with SMTP id 5b1f17b1804b1-48556714b67mr207129405e9.32.1773660256095;
        Mon, 16 Mar 2026 04:24:16 -0700 (PDT)
X-Received: by 2002:a05:600c:468e:b0:485:3f58:d9d with SMTP id 5b1f17b1804b1-48556714b67mr207128715e9.32.1773660255574;
        Mon, 16 Mar 2026 04:24:15 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aa73dasm1215197765e9.2.2026.03.16.04.24.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 04:24:15 -0700 (PDT)
Message-ID: <2551cc98-5280-4a9f-8345-0a39e0e09dac@redhat.com>
Date: Mon, 16 Mar 2026 12:24:13 +0100
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
> + * their own struct socket, 

AFAICS, the above statement is false, see sk_set_socket() in sk_clone()

> so only sockets that point back to themselves
> + * should autotune receive-buffer backing.
> + */
> +static inline bool tcp_rcvbuf_grow_allowed(const struct sock *sk)
> +{
> +	struct socket *sock = READ_ONCE(sk->sk_socket);

You can just check `sk->sk_socket`. Also you could re-use this helper in
tcp_data_queue_ofo().

/P

