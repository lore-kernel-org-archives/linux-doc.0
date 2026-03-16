Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0E8365A0D
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 11:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773660685; cv=none; b=PhegS5Ry4v9+/UfAZyM8Ud/rCTuMmGU2D8oRMV3AsF8TbXEF30vVK52xQSzvgpxpWhbD7VPRo78fLw25+CKpnl4JE5GOGhQ6R1y3404nUdrs/d5I4wVaXHZAmnPBIDKcE1/KuyxHSlPAhpGR2prR6jAX4E8pw+MjRgoSW2Xbypc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773660685; c=relaxed/simple;
	bh=RnzcoqiCgiO1PMBkGL95IiCkLD+8z6QAFA5shSuEMyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iKCDgIcGMFA+3zDKxKr5SnLAsA3Ou/YvVh+OTa5g/+e6ao89s+fF8OFXs/FhbCtkeebIeBEaEkWP1htJD1x2v/DhzJgiy9cWoFglTp56NXhg+b82VOy78hNdpi69CMsshCJugR9ptzHwwAjHNu+qMxczLOFPaumWn2gAU4fyktw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d/yymGbn; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UDppKzRu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d/yymGbn";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UDppKzRu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773660682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WoMK2QRfTtUly3K0u8u4VXZMMCNoL+hLg9jh7niAtnw=;
	b=d/yymGbnR6Zo4Cp56EDz80mzlMy73/hUUT/ZOtUs3LWua/Nq+o1rsGONOBkzMkgAdn+rY6
	GVD5Ei4bDiHg0biABtDnPnmVWTC0PDUTLQ9q0teeZLXYoprPVZMrl6D77bBIo6Du8+uIsQ
	57JpZ/JmDN59mc/Zwze0R8yPmGkLerc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-IAoDsKEnMNemKl0ynq_D5g-1; Mon, 16 Mar 2026 07:31:21 -0400
X-MC-Unique: IAoDsKEnMNemKl0ynq_D5g-1
X-Mimecast-MFC-AGG-ID: IAoDsKEnMNemKl0ynq_D5g_1773660680
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-439ca4b3d0bso3807708f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 04:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773660680; x=1774265480; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WoMK2QRfTtUly3K0u8u4VXZMMCNoL+hLg9jh7niAtnw=;
        b=UDppKzRuU7Pe/GCKKqNYcueBD/LliCnEK3jXMx4fh0840B2SsiFqRidgEEIePWreL9
         5Mf0ZttplO9N+IdusUXUFUS7Sv2fP17FngrSaqIcxDn3T+0tGaORf9IkRCm/M7yZl9TT
         wZR61g1b1LFXUEICy3rRgeQH69lsBzd8t0XA55QmuJVRFIxJ4a2nrT6rk0JuqrY52YuX
         l4YZaIqIEwY/xVvDXZy93egx2P1b3S7E/yxMEq+aGm9KImJOZFA8qX0NrdewW9Qar2jK
         K5lLAcJyXy32WtU+ohOVQL5Uv/3c0ZpxJMxL4reuLFykINnhp78lAJ4iNkORGmACj73r
         7DvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773660680; x=1774265480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WoMK2QRfTtUly3K0u8u4VXZMMCNoL+hLg9jh7niAtnw=;
        b=iQ1GEZH5X56O+bzAy9hlOIzWT9w2TLO+3lS1L9KnMEYPzICvDtfvY3NX6z/dYhNxD6
         dU1BHWaAL+10Lbt77jqGyeWKMjd+Ly8MnLaBi/05F3M3xZ0QyucPE+LGJ1lSFYqzkiLv
         HObQi+9P0+YjpIy2/4FD5d+ROJd6RjjMQ7uREu+3J6IRCbUn2yWM2idEbdOB1YT2pFhl
         2B/M2XTMHVDW5HMJnG9c7GabMc9s/bK9FVDQdbL3Ja21ItxcxaLC2KRRlezkS3LAPRe9
         5ezQGxgkLGqOhzmDGd8uX01VlT3QzgEhFx1N7YrE9P7GISvN2dBzbWSc0NYFFz0yxO8W
         GoMA==
X-Forwarded-Encrypted: i=1; AJvYcCViwSz7TrPYmY/KPp4t33JcNFjdyolsoQoIuz7R61j4FLtHq/TANdjTegJF09x3t6HVaRq2JqdSjoA=@vger.kernel.org
X-Gm-Message-State: AOJu0YypyjO0rIi5ZQSzfx+87H0XdQR3JGn8sCheSAOIzxyt2Yv9Wyqv
	cdEzRYThNgyvhDcxeY7IMVs8naJWVdqId5zCPH0KlHSRzxdngkqSw5K/mX/d6I9eQw+Y2Sdmifz
	gp5ehI7xP//WwmYycRgNH+SeLUZ0GoWC5vhhnkr8d9VbtR+orswugnMzf56az/g==
X-Gm-Gg: ATEYQzwjly6YkPEBoHeo8VB//KGlNDBeQVuo0BmX9NksqoPgXRWZ+15UzMSTwUI2oq0
	4ONrMIlB796two8JFEeexcyQfULNXhmmXpzTZglOVGGolfdKNRVMLD2t18t+GRISFtEBzBI8rU6
	ZKemNSNG/SgAQNvohnMEpaq6N5rFEDdHWnlFEuZPlezb1zIUyUS/16ulDDM8Nl0N0YIGTkmmh/K
	qzbut50Ox9lUO4lzOrSWzqC7IJZWG3l7UX6dP8TnmJG9HBN3UZMx6FJ0Hj9TLowXS2whLiLZfpP
	QWFJzKirAzI1x947IsFjpzbi0YF8Znk/35OwOEaxMuHRwsccrOJ8OrCdySjeNrjW1CWciZDTYSK
	qKvwsqstcnis1NllAi21gkrmvHeiQwl4zk9mmDNFdqs/cOXxx/UORE3w=
X-Received: by 2002:a05:6000:1887:b0:439:fe98:20f9 with SMTP id ffacd0b85a97d-43a04daf124mr23932766f8f.27.1773660680223;
        Mon, 16 Mar 2026 04:31:20 -0700 (PDT)
X-Received: by 2002:a05:6000:1887:b0:439:fe98:20f9 with SMTP id ffacd0b85a97d-43a04daf124mr23932679f8f.27.1773660679649;
        Mon, 16 Mar 2026 04:31:19 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43a0b2e2c71sm28145619f8f.22.2026.03.16.04.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 04:31:19 -0700 (PDT)
Message-ID: <95ecd36e-e32f-4ca2-ba35-6d251a64ad30@redhat.com>
Date: Mon, 16 Mar 2026 12:31:17 +0100
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
> diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
> index 57a2a6daaad3..53781cf591d2 100644
> --- a/net/ipv4/tcp_output.c
> +++ b/net/ipv4/tcp_output.c
> @@ -3375,13 +3375,24 @@ u32 __tcp_select_window(struct sock *sk)
>  	 * scaled window will not line up with the MSS boundary anyway.
>  	 */
>  	if (tp->rx_opt.rcv_wscale) {
> +		int rcv_wscale = 1 << tp->rx_opt.rcv_wscale;
> +
>  		window = free_space;
>  
>  		/* Advertise enough space so that it won't get scaled away.
> -		 * Import case: prevent zero window announcement if
> +		 * Important case: prevent zero-window announcement if
>  		 * 1<<rcv_wscale > mss.
>  		 */
> -		window = ALIGN(window, (1 << tp->rx_opt.rcv_wscale));
> +		window = ALIGN(window, rcv_wscale);
> +
> +		/* Back any scale-quantization slack before we expose it.
> +		 * Otherwise tcp_can_ingest() can reject data which is still
> +		 * within the sender-visible window.
> +		 */
> +		if (window > free_space &&
> +		    (!tcp_rcvbuf_grow_allowed(sk) ||
> +		     !tcp_try_grow_rcvbuf(sk, tcp_space_from_win(sk, window))))
> +			window = round_down(free_space, rcv_wscale);

It looks like this can cause the advertised window to shrink even if we
are in the 'do not allow window to shrink' branch.

Also why the other branch (shrinking allowed) is not touched?

/P

