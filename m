Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFF83396E9
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 17:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773683269; cv=none; b=MfAllX5LW/NNrmKr8wngnbLSjp3LisCvY4DouIQQgJDNSRHGtHrqwtk2uFI3sP/wigPFhOwpaeGbkIwccpCPRQ4K42E9Iq21AtSJE59O94LO5Jg4dfp3Bh66NvdyBJayTHM5EyEQ9Y3/RXBnV44hWSDMG8xId9YJAx5RuAaf4wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773683269; c=relaxed/simple;
	bh=gRVifA1HxZ+4XsSQaEhHgwmLLQrL+5Qxxw1GlMu4spw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WbzZeSxqrB80e2JzRZ3kLxlSyIJ+4fP82XLow7SC19/Cfsr2dFAaybY0ScDqCeD3yxiIyVp0uh38EHNbupU7V+QZ29v6Ntg66qn18+ZiblJ0sr+NprVSB6l/BK/P6GoyT4/a2UM3Fph5Dsf1xf+9zzZpB3TfZQ3svW2F5q9DpOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=duj3MXX+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UeLjPWdE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="duj3MXX+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UeLjPWdE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773683267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gRVifA1HxZ+4XsSQaEhHgwmLLQrL+5Qxxw1GlMu4spw=;
	b=duj3MXX+njab/VmBcvZw8iSHnEVw8y88Qw7L3ta4xobC5cVUB6q191Irw6IgQEuTHApnha
	nuFaS2q6BLjsPjdi2ZLDLAnTRhm6sJj+AnwxMp9f4c0NjjRdCl/3SblC2HzB+LC0qFVPXt
	H8r3v61AXtLQpEsrSuELzOJ5RMokaZY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-wN4vX2pEM6WXumfUVwCkTQ-1; Mon, 16 Mar 2026 13:47:45 -0400
X-MC-Unique: wN4vX2pEM6WXumfUVwCkTQ-1
X-Mimecast-MFC-AGG-ID: wN4vX2pEM6WXumfUVwCkTQ_1773683265
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-439b8bc43aeso4361276f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 10:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773683264; x=1774288064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gRVifA1HxZ+4XsSQaEhHgwmLLQrL+5Qxxw1GlMu4spw=;
        b=UeLjPWdEbLMPJO28dH2NeRa+MttSHYudFRa+KhmsIdInbNh44SWTBvolw470a8An1T
         TK/Rpnas9g1FszbJ/HY+Y73fAMjjHg8VzPkbH3GPzz5CMcuHNqafM04j70ESxAAPWMnu
         A+uKnEGx1SXrGDqAFMN4tIH5rO3qxuCE/xdOiN/DQ/cPXNWzQPBnovtJJZg9LAadB8a3
         cBQt4Fh5Bj+UzrXzfwOEvRhmd425vSJc1OPJTj2Ba+Ri+A/es3ZQfwqUZgJIy5qUwApt
         176a8PfkWaR65l7m1z8uKDY5efTfjWc8rxGqqDnwtx/4FNbz/wDZHw6Mur7cVp/VtgQM
         /ShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773683264; x=1774288064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gRVifA1HxZ+4XsSQaEhHgwmLLQrL+5Qxxw1GlMu4spw=;
        b=gMgDMyuc+Ktt7oHyIP5WdgBJrt5sRD+D93pUrUlGbqBSCk290M1DYTlgba3rAlLSXH
         YVAJg1PN4Ay7g2gt9uXGnol096AEuZjDoRKa6iQ8nxbJ9m8UhCzF2pLVx21nKrMi5RjJ
         GWjq0a4xtUtnhEb/CwAw98inOvYzAJbbyi+b/cBhqCTid+QsD2z9z6reo6iO0YBxD7qt
         qucxeS0tEAIX+hwj/Zk/AivPI3eZIT4badOZAxvB4iP6uWfIDk1Z7mrp3DkzuquMdvy3
         yRHa/4Q3FZR4VYhNKvm6HX9i4AsYRFJChmGEQlGFgmTaAXqy8mYDsKQSwfX/blRBJ9Uv
         Ptig==
X-Forwarded-Encrypted: i=1; AJvYcCXc1cb5ipyahrVAoJ7dUDW0y8M1IPHBFlyZDsN+ucZ3En96R59Vm9RlMP5Fj1ArXNaRJFUirR7+hnI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywteb+1QZS7W0qflwdNj04htrDYGcNKO1IXf8k+XDqEQ4+Hkr+a
	404tNPeidt4Ew8afzEfxoCeY/atxJkozrhcuDalNbsJpSBKqC2RKNCGgmGrAolWGjA9zW0otE1j
	X8kdNd4CAae2o7mDYVMAwD1CG5Sr7pQFMk3L5rFlJvzNvioleTiS1dG0KcePhGw==
X-Gm-Gg: ATEYQzxz9gzK1MgALEz6HFe2xaGh9ZOkkVxYSOX/ciwxNhmLOg44owR+ZcrgPmGpGNd
	Fg/CjtQ0vfnJ7K4PGF64ix96mytjD2Py0ePTo53/81KXpwz+vymbofnJDVgShkGtfVIixaKhuFi
	TqNxbH75YRETfpTWXiJQi3kVwCSpdWfni3Oe0RrGOZG9HGgkmk0UaMNFFHVtvbtSnFC7MvLHQaZ
	q6/4HOO67A5dCMXwSFqBm+bYyG4ZtQJOYD69b5n0N6D0s5a4aqdvW3tPJ9bzpUZMeaUqT2QAh31
	QqYPV4CG9CFzp/eUl2zqQDjML2yB6xEyeIbrPGDR4DtOHi9pd1tSoEK4/xUkg9Bth21qLnkDrwb
	L1WEFRs9CDHR4aX94Jpdcz75AfGhPMYCeLf24950R42n0u6Use5buVFw=
X-Received: by 2002:a05:6000:616:b0:43b:4352:1bff with SMTP id ffacd0b85a97d-43b43521da3mr8977660f8f.43.1773683264542;
        Mon, 16 Mar 2026 10:47:44 -0700 (PDT)
X-Received: by 2002:a05:6000:616:b0:43b:4352:1bff with SMTP id ffacd0b85a97d-43b43521da3mr8977613f8f.43.1773683264127;
        Mon, 16 Mar 2026 10:47:44 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b41ff92a6sm17659188f8f.11.2026.03.16.10.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 10:47:43 -0700 (PDT)
Message-ID: <e93ce797-4153-4e6e-89b6-3839a0b8bca2@redhat.com>
Date: Mon, 16 Mar 2026 18:47:41 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 00/14] tcp: preserve receive-window accounting
 across ratio drift
To: Wesley Atwell <atwellwea@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
 edumazet@google.com, ncardwell@google.com, linux-kernel@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 mptcp@lists.linux.dev, dsahern@kernel.org, horms@kernel.org,
 kuniyu@google.com, andrew+netdev@lunn.ch, willemdebruijn.kernel@gmail.com,
 jasowang@redhat.com, skhan@linuxfoundation.org, corbet@lwn.net,
 matttbe@kernel.org, martineau@kernel.org, geliang@kernel.org,
 rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 0x7f454c46@gmail.com
References: <20260314201348.1786972-1-atwellwea@gmail.com>
 <b042de90-79e3-4976-9bbe-b6df3266caea@redhat.com>
 <CAN=sVvyNpkyok_bt8eQSmqc4f7g7QoZBUmRmNRLoFz1HasEzMA@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CAN=sVvyNpkyok_bt8eQSmqc4f7g7QoZBUmRmNRLoFz1HasEzMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/16/26 6:29 PM, Wesley Atwell wrote:
> The strongest real anchor here is the already documented regression
> around sender-visible rwnd diverging from hard receive-memory backing,
> rather than a general receive-accounting cleanup.

I likely missed some of the prior discussion. Could you please share a
pointer/link to the mentioned regression report?

When posting on netdev please:
- use plaintext only messages
- avoid top-posting

Thanks,

Paolo

