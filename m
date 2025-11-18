Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBFE34C828
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 12:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763467351; cv=none; b=Rd+4UYANg1QyCD9p8cDwO5pq47c65VQw6H2aH8a7GGpfPL1SqqldmF+3Q/a4PdG/a5U9NtJz2z+RNV60exHD2qbkC6qf6wTWxf32c0rgXvSVkTM+prdFwxF2nxWAwKgi1kRY7v9xw7yPGk8Yiaz15axQkJKvs/Dm16JEwEGKbGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763467351; c=relaxed/simple;
	bh=WESiHmXnNlbdDWvUDg2JYyETEusd8ierS+wGRLf1eUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BFeDkDDUQ6hEzjWP0QHETbJJuk6ND+URIeVWRHcrWxRgCVojJ/7r/FymYHjzFhmxfgsDk63xF8vyoLlHmy9osoLJUNHCcMRiGp+MDmQqO8bx8J/W72M9WuCfu5vfjGmgG/i/DRZ0KpOf/NPgrB6oqGD3eS8gBkVHgtUed5XTNTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AU7PzHk/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=R/YRxWQ2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AU7PzHk/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="R/YRxWQ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763467348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c1i1D0Pw7oFyRhkqVPQdxod01xxz5lck/BaJyW2U7Kc=;
	b=AU7PzHk/aGuUt+f4ytRLnCjCxqBbGkIz56sMBPl2nVJ/qpsybPhWs/kdPNQvOSJiMp0eee
	c45u+XPg4f+pj7MhcL9ORVa6RC9PPXa6bnJQ49AfaLCMAuWzKdK6+bUJcmhW4jIsLxE78C
	cjhc8uBE0EtC8WtYoRXv7ttooeBzSy4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-pdRYpOi8O5e9Eh5GXOqQNg-1; Tue, 18 Nov 2025 07:02:26 -0500
X-MC-Unique: pdRYpOi8O5e9Eh5GXOqQNg-1
X-Mimecast-MFC-AGG-ID: pdRYpOi8O5e9Eh5GXOqQNg_1763467345
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-47775585257so41669465e9.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 04:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763467345; x=1764072145; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c1i1D0Pw7oFyRhkqVPQdxod01xxz5lck/BaJyW2U7Kc=;
        b=R/YRxWQ2SMSzQUbsQAvTbRaItCqUi2N1q3QQJzyNCF5rUZXGyzVRA6MX/P3lpSxEPt
         tOIX/7Edg6Qdl9f/O6J+QC8ctoU1LhrjCU0nKI8KO4RuQRrrbZhA7GIO2U7uvz8Tetwq
         NhnjZMvAQ/j1ym3qbBfD4BL6hkaXYJ+vBTrzIA3m86DRZII0T++h9zYPrvqg6cjkhp9I
         eYWPKNNJnapFg/Qm6im4fDZxhZK/YvGPNTR++p/oqclvZEhEej+vuWZ5daLJi+eBXUTc
         t5AYwxZKuVQBZNNGPKRPOFOvDB1A6suX9fPHNyhJLrFGbWhzNUtpzFtKTd/w8epbRPAx
         yTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763467345; x=1764072145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c1i1D0Pw7oFyRhkqVPQdxod01xxz5lck/BaJyW2U7Kc=;
        b=b1QRBkhOwBitSzgv38GYmUnoatEW4DKYhyvK5+iN7D9xo4LZNjc/8Rw+e6pHOi+Nrk
         lSAqYUZri0+GRRMPvSQ8FOof/4c7fN8/aCgAx6OSRnJQKN1SdNA7GkQNISI8Uo+R/TfI
         JVVkZFoQm5cJQvjEVMC8ZKunaokOuBPkAgepsMk72r68q9P0uE1Z9JQnpap/qTf48f+E
         IoaNkGpx5sa1KgrGyj0Fxxbe7E4tXwmby8PVBolMsFA5Q47Ty3wuKAfYmCgb5odDYdlq
         b8QpfMRDQE+rjDomxcgAJ6QlQgvu+nT9/+fWT3B8UtcuOx0IwcYCE+UrtSjK7gJBkncQ
         YBfg==
X-Forwarded-Encrypted: i=1; AJvYcCXLtWp0d4JEfKmgkyj2CszA9p/1KQvPt8NaeW41Kj/Icoa+CRuYSW8H+2ImGT79f9CcNjnN+RPgPPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy131k+PRcFpdYqVLH/qPPaCeBObRgAq/XTkevBnYucm8fyejHn
	SU+KIfN7hmQQPSL8wSAr3peLa6ab00BGc2JZTbyyxoHSLIql5qmadDoVIEuhPDxmapKL/3uBL6q
	bfx/GuwpfglVycC9opHIHvqXMAEmX6Octd2sgvrPIuHC+Tlyo83Q1AzKlYcK6GuKCWbaj2Q==
X-Gm-Gg: ASbGncsu6ijOuTfW9Om5jCrwdHxUt6C4BXJBCv9Bn7zPNPlkwgHYIK85IHMWFKQYqrK
	Fcyf3xKiOW2BOTSSeDUgSn7kyy4eL9GBp1IXhAV/vLudHtOytQP4AlDmLOpMYsjumT5pKgqcU7U
	p446THUlTsL3IbAVfzP8s5vyd7vxIYhAuXKCqrVrciJl28alhyg1fBvnBKRiXDosqsQ7i/ws8hU
	N6wDbqZbWJNX31+wS73h7GBfujrHYQg8e/iwVO9x6tVxzjh588zkabcljS5p23/+6UPHjfgKXFl
	38CF7cUHLba4PREoc29m2NqdDC6sj4FmIf7+x5P25HYyVdBX8aD6PUyXGTsYHYHU/YOwyEM6RFR
	3VV9I+F6LQ6jV
X-Received: by 2002:a05:600c:6289:b0:46e:37fc:def0 with SMTP id 5b1f17b1804b1-4778fe62100mr150045955e9.9.1763467344581;
        Tue, 18 Nov 2025 04:02:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIbPbD3fHl61Z9bqUbxf1dmLAfvuvlg8WHRxbMNqZy32h7ZBzMmci6k7t6kXMAsw9zXDp8Qw==
X-Received: by 2002:a05:600c:6289:b0:46e:37fc:def0 with SMTP id 5b1f17b1804b1-4778fe62100mr150045425e9.9.1763467343987;
        Tue, 18 Nov 2025 04:02:23 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779fc42f25sm156990785e9.6.2025.11.18.04.02.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 04:02:23 -0800 (PST)
Message-ID: <d87782d4-567d-4753-8435-fd52cd5b88da@redhat.com>
Date: Tue, 18 Nov 2025 13:02:20 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 net-next 03/14] net: update commnets for
 SKB_GSO_TCP_ECN and SKB_GSO_TCP_ACCECN
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
References: <20251114071345.10769-1-chia-yu.chang@nokia-bell-labs.com>
 <20251114071345.10769-4-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251114071345.10769-4-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Note: typo in the subj

On 11/14/25 8:13 AM, chia-yu.chang@nokia-bell-labs.com wrote:
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> 
> No functional changes.

Some real commit message is needed.

> 
> Co-developed-by: Ilpo Järvinen <ij@kernel.org>
> Signed-off-by: Ilpo Järvinen <ij@kernel.org>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> 
> ---
> v6:
> - Update comments.
> ---
>  include/linux/skbuff.h | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
> index ff90281ddf90..e09455cee8e3 100644
> --- a/include/linux/skbuff.h
> +++ b/include/linux/skbuff.h
> @@ -671,7 +671,13 @@ enum {
>  	/* This indicates the skb is from an untrusted source. */
>  	SKB_GSO_DODGY = 1 << 1,
>  
> -	/* This indicates the tcp segment has CWR set. */
> +	/* For Tx, this indicates the first TCP segment has CWR set, and any
> +	 * subsequent segment in the same skb has CWR cleared. This is not
> +	 * used on Rx except for virtio_net. However, because the connection
> +	 * to which the segment belongs is not tracked to use RFC3168 or
> +	 * Accurate ECN, and using RFC3168 ECN offload may corrupt AccECN
> +	 * signal of AccECN segments. Therefore, this cannot be used on Rx.

Stating both that is used by virtio_net and can not be used in the RX
path is a bit confusing. Random Contributor may be tempted from removing
ECN support from virtio_net

Please state explicitly:
- why it makes sense to use this in virtio_net
- this must not be used in the RX path _outside_ the virtio net driver

something alike:

/* For Tx, this indicates the first TCP segment has CWR set, and any
 * subsequent segment in the same skb has CWR cleared. However, because
 * the connection to which the segment belongs is not tracked to use
 * RFC3168 or Accurate ECN, and using RFC3168 ECN offload may corrupt
 * AccECN signal of AccECN segments. Therefore, this cannot be used on
 * Rx outside the virtio_net driver. Such exception exist due to
 * <reason>
 */

/P

