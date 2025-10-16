Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53F930EF9D
	for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 09:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760606717; cv=none; b=Zi2y9IvdNcroFz3X3eetxmkpqQSoSQ9CodfYPrYSIWN8CmnXzv2kpCh6IZHSmJPW1Yqhc5K1+ygWLucRuk8NIqLva06fLfKLZPym+z1b8ys3I7PIGqvGpZbkH3qwCdyWqWTVNf4nnY3NZp355Bpb3qogsaX1MsQLKa1TP/Q0sPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760606717; c=relaxed/simple;
	bh=m2KeARvuTRmdyoLiLI4saJD6ImG7emQEBqfOCbuYQQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bcaWUzSZp00ERvJbAOGq59dmB1ldZrChZXh6t2HpbPAwh/vQHVfuN0FDfmwQisqyS9A+xaNSQWIfvV5Ko/H7KzV+YzHpYu1CeKooodP86KT6RenHI9L52ID6rEMA8OAUgCCrQuF0Fmo9q5nsTt71yg+EJMI6eSsMSMKBsiq4QIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XoKCLfig; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XoKCLfig"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760606714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U6o+0dlH/LO6+L4uMhml00siHNkD8OlJHU5sP6Kvv18=;
	b=XoKCLfigCuDOIdckgLC0yYhjNUUXOLlE3GF4ejj5IuP40pJBmZb4vzY88S2hV/qDraTYUj
	V+3TtRszR+4Re0iyAVnIDgjdRsFntdChfwYFDIEFxaPntMtyx8/L0I8OKLAcE/AMNkBDlm
	ZYJya+NVz7q7212KoIAh7oF+XQvCKMc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-ShdfjZ4_O6GXK7RunBZftQ-1; Thu, 16 Oct 2025 05:25:13 -0400
X-MC-Unique: ShdfjZ4_O6GXK7RunBZftQ-1
X-Mimecast-MFC-AGG-ID: ShdfjZ4_O6GXK7RunBZftQ_1760606712
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-471144baa7eso2969035e9.0
        for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 02:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760606712; x=1761211512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U6o+0dlH/LO6+L4uMhml00siHNkD8OlJHU5sP6Kvv18=;
        b=sZHUGl/egr0dXbatGDmt36Hl8UvYCA+QoV35XTrDdfl/mohUKpmvzn6iq1JlVN9Epr
         7ncNWGjg13SLqeuwlVudGi2mbDilXRrA4kxJjeuB7lrRm5onmIxGgSKK0AKjPOvUfYM8
         shg69inFG/3vbWUs9N5i5DL7ovwk6ubQjhYpGUVyZQkHXiC19+mfUup3tr+wjJd/5vSN
         r6hgF3S5RJH28DyfnTn/OugH3hJj/b8O0zc8GQ0Y836yUd/c4IpXPtcYBO2V6q0/1qoY
         e4NinuSitPsznACn39NFAgENPiHIAHCvxHiN6Eucn4XwGbtVF1GQneTtB+/yLIPibiHn
         Zwbg==
X-Forwarded-Encrypted: i=1; AJvYcCXff1l/k7kbEzHssF5HM9l1IL+NIXNcWuaJ/CWW5uukQm0nSOXfIxaMPlhJub2N38CvyiqBiCErigg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuZ4erStmFTRAQ86OrTJY53OJiJkiFPmFEgjb3x0b9BnYpNAwP
	AJWUnzEz1SiK8FQq5mC1EjDY5RG+BYs8mGOJc01rNMmIZsYh2eSWT0g9/lJa1wYs86TP/69KcVu
	DBXTcRJbaOQJUAsnNnPZO4WTZP+n1P2UWjEqvEhepEXlgH74E5pi+HOH85DEAFg==
X-Gm-Gg: ASbGncthZur3hE8d+7EJVVMEzuo+dzNqeVR/o6b9XnjlX4vbshOKK5VeEZh6UQbSTMb
	KqYtr73Xt2CAuubz+OTr0/4dtsHKMfeA5RH5ESjnab1XG9L0+cN0HoUT+aUkcopOJuYt9utlVvS
	RG/eTP/WRR1u1QsEP99HAdqAZtp+4IYw395q7lwc2mYQ1yGe0vGjiEG0dd//GPp0WjxHQpwopHP
	7TBKs8KHqdornqvrrAueXcWhI8b8HggRsgR7OH6ZVpnBOf7QuYckGc4WsJogTXe2pqM6Ig2Cytp
	nDNuO8mEupBbGXEugrWwKPNJR7KPqAU5IRlpYfujRx42b1/BOhYrCPjp1XTkZ/hefTfBlSRiJoN
	41fneIq2iE88Ky3Wq1xezYnuH70vcV3obPnLi7gpAIS88lYY=
X-Received: by 2002:a05:600c:8487:b0:45b:80ff:58f7 with SMTP id 5b1f17b1804b1-46fa9b16570mr237048765e9.36.1760606711790;
        Thu, 16 Oct 2025 02:25:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHODLXNXbl09HgER/Hf+hYD5m43sAstxJrTZCO15jaacFlZi4yisRDZcg7tAy/BjWtv6IsDQ==
X-Received: by 2002:a05:600c:8487:b0:45b:80ff:58f7 with SMTP id 5b1f17b1804b1-46fa9b16570mr237048295e9.36.1760606711423;
        Thu, 16 Oct 2025 02:25:11 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47114428dbfsm14687365e9.5.2025.10.16.02.25.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 02:25:09 -0700 (PDT)
Message-ID: <9ad5cdc8-c900-4ada-ba62-5ee313829bac@redhat.com>
Date: Thu, 16 Oct 2025 11:25:06 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 net-next 12/13] tcp: accecn: detect loss ACK w/ AccECN
 option and add TCP_ACCECN_OPTION_PERSIST
To: chia-yu.chang@nokia-bell-labs.com, edumazet@google.com,
 linux-doc@vger.kernel.org, corbet@lwn.net, horms@kernel.org,
 dsahern@kernel.org, kuniyu@amazon.com, bpf@vger.kernel.org,
 netdev@vger.kernel.org, dave.taht@gmail.com, jhs@mojatatu.com,
 kuba@kernel.org, stephen@networkplumber.org, xiyou.wangcong@gmail.com,
 jiri@resnulli.us, davem@davemloft.net, andrew+netdev@lunn.ch,
 donald.hunter@gmail.com, ast@fiberby.net, liuhangbin@gmail.com,
 shuah@kernel.org, linux-kselftest@vger.kernel.org, ij@kernel.org,
 ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com,
 g.white@cablelabs.com, ingemar.s.johansson@ericsson.com,
 mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at,
 Jason_Livingood@comcast.com, vidhi_goel@apple.com
References: <20251013170331.63539-1-chia-yu.chang@nokia-bell-labs.com>
 <20251013170331.63539-13-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251013170331.63539-13-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/13/25 7:03 PM, chia-yu.chang@nokia-bell-labs.com wrote:
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index 61aada9f3a6f..edfcce235d2c 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -4808,6 +4808,7 @@ static void tcp_dsack_extend(struct sock *sk, u32 seq, u32 end_seq)
>  
>  static void tcp_rcv_spurious_retrans(struct sock *sk, const struct sk_buff *skb)
>  {
> +	struct tcp_sock *tp = tcp_sk(sk);

Minot nit: An empty line is needed here.

/P

