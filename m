Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A584C32AAAA
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 12:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762431714; cv=none; b=MUcGaXTZpASXoyIxHzZATd0bwV2+xx354isGBn9kFTZlPMbt2v4uuZlsB4KjPMDSvF7qt9f07IiTITHlCCdIzGh+cinqp+Tm15bTWjhJZwgZfIP2XkRgLjyL97LSo2qhdkYHKOpWrJyfIhQNnwKJ94HUxAdweBOedQSPXkSMg34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762431714; c=relaxed/simple;
	bh=f6B/tbcYYNUY1cwi4BIgQgWXetzxYn720LqQVpZbrbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VoXsfQRyPIg35mCp+F14eZ2O5y+WQ9KUW8GLcaJw+VN9Le0xCEIDQHBrUt9LiLMJjanT6wE2eECwTemFrRM+SN033z5lGR6DP16nHTlAjHmpE6DdBVTFqKNNZPcNH/bdryPMdw/mURDxRBr/YUNoApQiMJEXhdmaTtm/Elp+COg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QUEJfFZV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DWnAcrPw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QUEJfFZV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DWnAcrPw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762431711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v1N4Cl13V8PNbOQcEwPAAvE71VJRJZSQLqVmISUC4TI=;
	b=QUEJfFZVFthCQst1mNi7bi+PhsHPwpULfZ2P1XJXY2LsTyNue+4sH7EU+nW0jb6/i5KlWD
	7eu4G019RKtUxgqfZO2TXBtHQwpPZZpTbpYQm8DbkUAR2btdUsrmd6OyQs6tRt7eUjXqtr
	Px/ebXu+cUf3aQDwi/LFB86FJtjyZxg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-JH4SZI6xOFu1f18UE2Qi7w-1; Thu, 06 Nov 2025 07:21:47 -0500
X-MC-Unique: JH4SZI6xOFu1f18UE2Qi7w-1
X-Mimecast-MFC-AGG-ID: JH4SZI6xOFu1f18UE2Qi7w_1762431707
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-429c5da68e5so1061214f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 04:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762431706; x=1763036506; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v1N4Cl13V8PNbOQcEwPAAvE71VJRJZSQLqVmISUC4TI=;
        b=DWnAcrPwqMo4756CjlWSvsFVEhMpFRwKmngSYToxMYFkJWBkUWQtmZNKNQOL9FPB8M
         RLwGxk9v/T0aen0n8grPyG8VOMDtKY8jZaOmLHCcL+hgpiuUTmFvQPsuUEBh2yOFUgof
         Jpp1FoF7/lKezfPV92HRzZXUWMcsh/x7v1gdC02MZlxLTi35ezDdQX8HRI0FFGgstZ2n
         NApyKtzF1r2rDfzDMAL1TF19i3JuLlhuAAdTT7ckGtea8WKDbgcQr+yLqyK/V6hTolW0
         dMprOa6DJ9ER6V6I3V0Sq4bOdbHFBlD4OaFF13zHmr/ugP5sXIBYLQEszxkzPRnL9pUQ
         nJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762431706; x=1763036506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v1N4Cl13V8PNbOQcEwPAAvE71VJRJZSQLqVmISUC4TI=;
        b=D44K2lBdhX9BzVjrj/Guxbbtrs8o4AouuMTmgFAwHx6b0+A56511uEJ2+hzNezQiZB
         sd27DjvxxPMVyghmqYLMfKhnoG8sszswLLNTxeVOo0kqqO0/mGna0Ph8Cxyz3ZiC72J1
         Vv585ocfxxqpJDtqzLfjpct4WWgp2g7HrNhTju9/gzJ8kupaTtzS1/zwIonVISSwHHxW
         8JxY/r4EQof8RpE+bIb1ipy49zAhQV0SGRoqp+WC7DhC0PbAPJyFy58FNJtMs2bD0Edb
         hqjv8vYdk9s9T6g0vrYBK5ekdKGtuQw94aH83qA3rxDcRS8brdbodjmRRmt3OzlUcjoF
         IfGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrxZD0EW70iADsdyXHsRrXH6DMapBP8NYCl+RrrXfqhlNt307iT2bfBoxKBfh6P9SyaMe1PzAKoeI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQLmF2Qvn2EDuLr40KBiIcQcYkROrkB267o1RPimsEphB2EAqx
	nAR36l2dQz4bMIplQLlj9WuCuQFfwKNPgFuIzmlvRZmFs7HsJBc/O6yamiGEeJS4HrXHE3DHllm
	65xS4HlaRuIewTLJr1yzOv7ry4HRrVuCTJQ9P9dkQgUw6RolL+Kq3izXtrIAtPw==
X-Gm-Gg: ASbGncu5IppNXw5Iuhzpv0CKLNZrQ3U1XcovRK421Z6jXwe0gHhR/32tIJRKYObtZ9Y
	iNvAYo/+lMdUbhmG/4I1y8ooM58l1oEi9hGxJAvtH8NPkB99Z7qGEg/fwCQKAyyXipQA+n2yCm4
	xYeeMVrq6QvWMpM9mBhzKNjl6rbP8A8Mp6qtplm9cNswQwqQYlF6LtkiQGerNxdQff7L6QoltBu
	V7W0Fq4JNSEDKF8qy+jIkPEUwApm6Obg7IVrO3/jecxuYCejFtLiJHEiHsSpqdqQ06ddG/03aQN
	1Vb03rCvPSOl/L120B6KUBgENY55vPJkiL/00EQ7mjhJhJ8+lchRnUTSSsN61C2Ti3zXgoT46hq
	E9A==
X-Received: by 2002:a05:6000:4112:b0:429:9272:c1be with SMTP id ffacd0b85a97d-429eb151f1emr2335239f8f.8.1762431706692;
        Thu, 06 Nov 2025 04:21:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhC3gPHF44nNLz6WF4vQ+gEkHlkVJdaQMy0UYsfuedwouhI/V3U2psJ1S8t/e2gVWT4Gn96Q==
X-Received: by 2002:a05:6000:4112:b0:429:9272:c1be with SMTP id ffacd0b85a97d-429eb151f1emr2335200f8f.8.1762431706238;
        Thu, 06 Nov 2025 04:21:46 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb40379esm4634350f8f.9.2025.11.06.04.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 04:21:45 -0800 (PST)
Message-ID: <faea7f2c-f63f-4b0e-9c75-1e93fdee5811@redhat.com>
Date: Thu, 6 Nov 2025 13:21:43 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 13/14] tcp: accecn: detect loss ACK w/ AccECN
 option and add TCP_ACCECN_OPTION_PERSIST
To: chia-yu.chang@nokia-bell-labs.com, edumazet@google.com, parav@nvidia.com,
 linux-doc@vger.kernel.org, corbet@lwn.net, horms@kernel.org,
 dsahern@kernel.org, kuniyu@google.com, bpf@vger.kernel.org,
 netdev@vger.kernel.org, dave.taht@gmail.com, jhs@mojatatu.com,
 kuba@kernel.org, stephen@networkplumber.org, xiyou.wangcong@gmail.com,
 jiri@resnulli.us, davem@davemloft.net, andrew+netdev@lunn.ch,
 donald.hunter@gmail.com, ast@fiberby.net, liuhangbin@gmail.com,
 shuah@kernel.org, linux-kselftest@vger.kernel.org, ij@kernel.org,
 ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com,
 g.white@cablelabs.com, ingemar.s.johansson@ericsson.com,
 mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at,
 Jason_Livingood@comcast.com, vidhi_goel@apple.com
References: <20251030143435.13003-1-chia-yu.chang@nokia-bell-labs.com>
 <20251030143435.13003-14-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251030143435.13003-14-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/30/25 3:34 PM, chia-yu.chang@nokia-bell-labs.com wrote:
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> 
> Detect spurious retransmission of a previously sent ACK carrying the
> AccECN option after the second retransmission. Since this might be caused
> by the middlebox dropping ACK with options it does not recognize, disable
> the sending of the AccECN option in all subsequent ACKs. This patch
> follows Section 3.2.3.2.2 of AccECN spec (RFC9768).
> 
> Also, a new AccECN option sending mode is added to tcp_ecn_option sysctl:
> (TCP_ECN_OPTION_PERSIST), which ignores the AccECN fallback policy and
> persistently sends AccECN option once it fits into TCP option space.
> 
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Acked-by: Paolo Abeni <pabeni@redhat.com>

