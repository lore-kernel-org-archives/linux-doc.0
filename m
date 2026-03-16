Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45150390CB8
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 11:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773661468; cv=none; b=i9fMUOkb0s1T7P8EHLB8nD9AMMazWGenrUa3gavqgy42lZZQZYysFeM3Oep937Lj0e6WyXNsPWZjS4MKnYXKLgLhdLNYNn/QgQt0DmV1K8pDDyGkyd5tGiXruAoAdDGC+c5y5BLNeQfE92fu9ysBJKHLOVOZg97M2pvixd5XIb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773661468; c=relaxed/simple;
	bh=XYZ/Z8E6vtXI8ekr+HAC+mYeXCVml7M5yCUGxNj3tfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GQKwDn+qMCBDWnhVBifciQCahUjXrpXHs0n2XvWoNrOryagKB1jNf2qBIStOE36epm2oGl2xYv9giJMLJa9pxCyB69rabz8n37vdnhbT24sors7Rdq7b/ulFc9SfeAOgBxzCLPPQHyk7fvcD3ukYUgGMDq3+TgLLpQfLWS7wNpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WLdiH2iA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sH39Iz7J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WLdiH2iA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sH39Iz7J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773661466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BjOWdH9YOd3q5jDpZy3h9DKwR4CFECAPPaRdY128lqI=;
	b=WLdiH2iA1Fj30KikWqsTr882TlmQNJPxWsd0yhTZuWtCrsmTWGoe98gePWbWrQ62SYG6x0
	VQGKKM1la8NrwjL/yG5UQzFfbbI/xKgbkJB1xQT0r5ntW+WkifUQzM/MX5IhIpbXwo2b5C
	Ls4NSIj5HCfVsA39eD/a2Dpf0JKsyYQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-MftaoewKMXSrIy-NDFwjow-1; Mon, 16 Mar 2026 07:44:25 -0400
X-MC-Unique: MftaoewKMXSrIy-NDFwjow-1
X-Mimecast-MFC-AGG-ID: MftaoewKMXSrIy-NDFwjow_1773661464
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b979df03fc8so138370166b.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 04:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773661464; x=1774266264; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BjOWdH9YOd3q5jDpZy3h9DKwR4CFECAPPaRdY128lqI=;
        b=sH39Iz7JhqEO7BE2yyd3VoO8NN5Sf/SVeBsxg/KeAiRczBZfWz91QuEltU0LeIBgph
         wXACfytY2IJTtBDn8D46ZjhbvqVecAcVtWCf9Tmcwk/k5PODKOMw72hprMQVMsI4LJrk
         YgDZ3kc1ljHr72WiKVDDv1fHqJajN3+gzQJNsFuJKkSXrzrnNF3K3uOMrg94aC7kD8ST
         aV69KkCmXxsB9+028EkCEzcYVkWHxFYad9gU9SzDLkE1SE3zTviemydUaozDx4gBRol/
         Urb6qZmgEnwiOaJgKS1sldpEqiu9Jl2ESxN4ppP379pJSTgTNRq590ou3jlrndb9sHgA
         xEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773661464; x=1774266264;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BjOWdH9YOd3q5jDpZy3h9DKwR4CFECAPPaRdY128lqI=;
        b=fATsgoNfbh733jDL/jKa1sWuh3jViO1J3Zz6g7vFcHesBbXbJDR2/RQueZJ6Sfod44
         G/knyt1mmw36fGo1hER2+ahF/cRuTnXkBubQziJXYVLU9bL5+bt9EoDCSJPwDq4Lu6dU
         jjC56OKJ6K6lYr773d/2spGXWK98Q20YTcNsOut3DP/hrgR1cpm2gfrrxl7jA5Uzplr5
         7/3dFCAG+oRDns52av7lSOXmRkVFexeDZdABMHdXLUsMvXDcix3vkZWNOtl+hdqkTQpC
         BV7Qk4Syr8fDkyFSBQhvqJhpD0ms7YiHR3RpEgnAGKGmpmUyMJEu4FHX6KzgHfita5ii
         +B1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUP3TOo8gwndwGhaA4fM0gPMYYvWKfzEKXqu6X+DbOE3wRlr4domxglu65C7/JDm6dV3GZZsRigE+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF7CmdVFkGOL610JhvV2FFsbQGfbf8Qx0by9e8hPH+3DcT4irr
	fApm+36eO+IZoiNauk9CmxnDRGGhhP1w9oqWGA175JC43jfPxeA3KOfA4YbayyxIINtF+Vl6p3d
	0FdFnGRj8PMbMFnHS4NQ45FMjoKFisT0Aeo79MAtgjygVdtIIeWCBm+I7C/jTXQ==
X-Gm-Gg: ATEYQzxsNWeZbakDieWT/1lhWYz94+c5uXZ2J+KLUTvxUivnnLmp2fqt2d+zcsg3qqt
	xdffUJdXQ2agp3Fy/gmqdn/mDciB/igt62X1egP9KeAFLWrKzAA21XDIAH7qAGFswzZvkCAsEaY
	Ua9p75fCLbS9pkTp94oCQTSK69jJyU04SqkIMsuPDGDCNamY8HInr01d7ehYt6tqD5m++FMXTUB
	Bqr81IBgHvqrwpVMnauYTw2J99oGAlqOXkcfrjTLnD8VDMrPW+ptkh9fp5bcMaeJojkTnpSeRzQ
	c3kSlMZENU+2g1ua12bSoiCt+EfFM5Tlg8KvmvuVWemaw+YJ8SmxtX3VfFgYoZM/ilIFQmrzTlV
	MdZ0XxlUpZDtAq1/T00RYTwDIBmRZvXV/0iYrc89mYK2rpHmW3W5xkyE=
X-Received: by 2002:a17:907:3c90:b0:b97:acca:fcf4 with SMTP id a640c23a62f3a-b97accb064dmr285765666b.11.1773661463840;
        Mon, 16 Mar 2026 04:44:23 -0700 (PDT)
X-Received: by 2002:a17:907:3c90:b0:b97:acca:fcf4 with SMTP id a640c23a62f3a-b97accb064dmr285762266b.11.1773661463375;
        Mon, 16 Mar 2026 04:44:23 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976d096d58sm533417666b.62.2026.03.16.04.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 04:44:22 -0700 (PDT)
Message-ID: <dddab568-a7dc-472c-8799-095ab96cef0c@redhat.com>
Date: Mon, 16 Mar 2026 12:44:20 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 07/14] tcp: honor the maximum advertised
 window after live retraction
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
 <20260314201348.1786972-8-atwellwea@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260314201348.1786972-8-atwellwea@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/14/26 9:13 PM, atwellwea@gmail.com wrote:
> +/* Sender-visible window rescue does not relax hard receive-memory admission.
> + * If growth did not make room, fall back to the established prune/collapse
> + * path.
> + */
>  static int tcp_try_rmem_schedule(struct sock *sk, const struct sk_buff *skb,
>  				 unsigned int size)
>  {
> -	if (!tcp_can_ingest(sk, skb) ||
> -	    !sk_rmem_schedule(sk, skb, size)) {
> +	bool can_ingest = tcp_can_ingest(sk, skb);
> +	bool scheduled = can_ingest && sk_rmem_schedule(sk, skb, size);
> +
> +	if (!scheduled) {
> +		int pruned = tcp_prune_queue(sk, skb);
>  
> -		if (tcp_prune_queue(sk, skb) < 0)
> +		if (pruned < 0)
>  			return -1;
>  
>  		while (!sk_rmem_schedule(sk, skb, size)) {
> -			if (!tcp_prune_ofo_queue(sk, skb))
> +			bool pruned_ofo = tcp_prune_ofo_queue(sk, skb);
> +
> +			if (!pruned_ofo)
>  				return -1;
>  		}
>  	}

The above chunk is AFAICS pure noise. Please have a more careful local
review of this series before any next revision.

/P

