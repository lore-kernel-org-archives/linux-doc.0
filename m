Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F7E320CB7
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 10:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758623323; cv=none; b=PgzQuZpG2+mU7QsjKE4WAEvmlAodj8PE0SkRIT2QrEWB9LHPfVweKS8ijg/7U75JE43EyxJoOhfX7DIBrt6M8JwM75dXxcCQxtx0TiMEHBebHjRubkUoXDWT/xW9Jmy9tUPGlGC/17J4a5TWTMO2cdrXSWHBOERm0Yrs1RxAqjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758623323; c=relaxed/simple;
	bh=qNsWtsZJmHIUb0a54dq/Zk97f1zSUhZRzo0hHxDMUiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cAZbxotqpMjnUHeG+TrNVBSWoyd9BGwdtPLcI/5OQkuklxTKo2ttOiHwVhd9fpS+1QhJCzVBsb/UKrCfe/M1bmt3UgQRmTL71Ii/fkpBQH8n+1lRaP89Y+beS/nX+d8SMPVWAwUGqwGZWVlQ+dVwbBYCMImMj4tt0kWsqX1fYVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cuUEtE/q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cuUEtE/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758623320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Seufh+9IrU9b2MywM8OU6QN1JILtHD4ZNUvycpU3ucM=;
	b=cuUEtE/qaACfogZ89fYldwC1qNKrhN8BDTllCLFO5kTzK1zAz7IdVFw+t+ApK6UKlzwqAs
	KlFoiYu2QUxLmzFTTWj6RjNkA+G4LTuPYugcUCXV153ld59+zyiJ3rh9JN3YQiVrVlzsZa
	A7CWZ1mDae1uVLmqi3q45uNwM2gR12s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-gjcSHt2AN4W1eDG3nMGftQ-1; Tue, 23 Sep 2025 06:28:36 -0400
X-MC-Unique: gjcSHt2AN4W1eDG3nMGftQ-1
X-Mimecast-MFC-AGG-ID: gjcSHt2AN4W1eDG3nMGftQ_1758623315
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46da436df64so12701675e9.0
        for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 03:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758623315; x=1759228115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Seufh+9IrU9b2MywM8OU6QN1JILtHD4ZNUvycpU3ucM=;
        b=Q1kynftsRpbs8q+Z7FSQmv1xD9CwILaEoR3pn7Bxo91FgJLAvxYukT/SUZDjcYJfwF
         HhU8wF8+m+tJT791NjXNoCut8n/Vs88ozkII5BzEfCcVlyNhQVhO/e18oU5XHii0zcyQ
         tByWC5vQJ7LpxJDjnlkhaO2Cjj2Z7S2ckvTXQHcauASmus13cJfJ6sMnnljAmx7dboz0
         UJIsZz/wfCJfsMmp7LE0CSYu9b4Bn+Hd1XmnPCA0g6x0TNfPc5maF/DRR01PqOLyiOvy
         YfyjD2VuC+cDOd14TO9kUuHZmjepkSi2tH58BqOqkOnUaqzzcsIjji22116Tqntu3wGk
         ekbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXGMjlRaKaCiIwgka48kd6POnXvKS/qy4cOmpj4ayMwSEbL5H8InKsP0C0x8OO8Qi2QS15Jp9bXRE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuWSm8a5h5zcrmkx0cf+QpJciFqbyc3zZJsb/+tmMxE4IVauUl
	ybMBJtJwvVA5Ez9pIFBdlvZRYpPjzAB3n2IRcLZIROj/iTDxkG5QHUdIZgv4GZDLehanGJGnrMf
	00PoWU7FTF3EBSiMc7Kgw7KFnshuCfII0xOIvKBwL7CPuGQu11SsxUrj6IyRZlg==
X-Gm-Gg: ASbGncsIdggCRe2AlDkWbHF0NAyzeaOwxvbO0JEhUlvEnrBL/yBrBbkhhxHnRXFwToP
	mIf1v09YH5ZqlOJ7msyNsbuO1Ue7o27FKxcYOmW45AtODkHVXPyfG7pcfrrWz+5EZy1ZAZwTccq
	nR4wa5dXem7n0AVQtxB4DC4qb+rVKZJSzT91SkB/KarlcUBQW8yy+CI2ujWrf4cpr5hMrEjWHt5
	8kj8zK/cATnb3woFXZoOHwxbW6TndHE5IaBIkTom685cUnllMI68HGI32ibf5MVf+aNmgYq+wGP
	sk1sKt39YSX8aSW6BPvip6b1w2UDcVjZ1qe+HtuivHUueMKN6pGJ1Y/X5JkRhmaOvtK8s2TrrxQ
	sstpF0CkmbfNx
X-Received: by 2002:a05:600c:b8d:b0:459:d8c2:80b2 with SMTP id 5b1f17b1804b1-46e1d97d863mr18326995e9.7.1758623314766;
        Tue, 23 Sep 2025 03:28:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHE3y5Q9pntwixp7o35wbEMBOVoDHu4y0TA3ICCB6qjtMzYYpwTI3p/PfMW2g4Dp4vpzjkTQg==
X-Received: by 2002:a05:600c:b8d:b0:459:d8c2:80b2 with SMTP id 5b1f17b1804b1-46e1d97d863mr18326795e9.7.1758623314348;
        Tue, 23 Sep 2025 03:28:34 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f0d8a2bfsm247445715e9.2.2025.09.23.03.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 03:28:33 -0700 (PDT)
Message-ID: <be76fdc6-79f3-4cea-bcdd-e88138efcb3e@redhat.com>
Date: Tue, 23 Sep 2025 12:28:31 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next 11/14] tcp: accecn: fallback outgoing half
 link to non-AccECN
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
References: <20250918162133.111922-1-chia-yu.chang@nokia-bell-labs.com>
 <20250918162133.111922-12-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250918162133.111922-12-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/18/25 6:21 PM, chia-yu.chang@nokia-bell-labs.com wrote:
> diff --git a/include/net/tcp_ecn.h b/include/net/tcp_ecn.h
> index 2256d2efa5ec..8317c3f279c9 100644
> --- a/include/net/tcp_ecn.h
> +++ b/include/net/tcp_ecn.h
> @@ -169,7 +169,10 @@ static inline void tcp_accecn_third_ack(struct sock *sk,
>  	switch (ace) {
>  	case 0x0:
>  		/* Invalid value */
> -		tcp_accecn_fail_mode_set(tp, TCP_ACCECN_ACE_FAIL_RECV);
> +		if (!TCP_SKB_CB(skb)->sacked) {
> +			tcp_accecn_fail_mode_set(tp, TCP_ACCECN_ACE_FAIL_RECV |
> +						     TCP_ACCECN_OPT_FAIL_RECV);
> +		}

Minor nit: brackets are not needed above.

/P

