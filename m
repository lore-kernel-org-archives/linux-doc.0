Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838DF2E6CB9
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 10:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758622460; cv=none; b=j8jSLSSKxIUzRkPNoqL3saNnaT2fDvoUoRY2XO6bRUGVX5k77lymAVwurssu+3DUV9sBS4aQ6kNaxalSImXftTx2VJlHCQCspO8cCzNZvPWzavhfd3eqSoUK03bkSho1wOqNeuWCUDe/DmoZsOpXQ0XAPHOjLqbFWa6FQrmePso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758622460; c=relaxed/simple;
	bh=PB7RTh2tkmTB3/Z3OmF5DIITDSFcvCKR9iFhCuOZMCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZvM+ZKB3Wk4ZhGMbogvsp/rQMlRiq/+vBalEx42RMp2TX3HzlWpd1/ttOsMwOgKI6684UnBXFsGgdz5OH6u4eq8x+dOTTWoOBF1AJTA495nFwYEKag8n5oCHJyZaMdrKuXugS3O6R7PxMZKQl1u1l4tdsYgXDCo3QiRCGtWXPE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OkowXnC1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OkowXnC1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758622456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xvoidjNPKx0LbqZQ6ZyfhvwOmvcCE/1oZtLmb8HEGok=;
	b=OkowXnC1OW0RKcegST2Ir2K+ZsPJ/CmhBLDL2jLRzey/+1DB6v1EsEX0skb8fWAz5tqCLD
	AzwkQ0I2Y2DprrESAs7g4neHEfBhox7PQTG63lM1kXtmsDXRL8zwCHTjL86nBJrtd/QLO+
	g9Ia7QjTVWcnKOlKVeWtf5XKWoID2DU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-dPLsHXwmPsKgD4-Ey-DJjg-1; Tue, 23 Sep 2025 06:14:15 -0400
X-MC-Unique: dPLsHXwmPsKgD4-Ey-DJjg-1
X-Mimecast-MFC-AGG-ID: dPLsHXwmPsKgD4-Ey-DJjg_1758622454
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45de18e7eccso25167455e9.0
        for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 03:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758622454; x=1759227254;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xvoidjNPKx0LbqZQ6ZyfhvwOmvcCE/1oZtLmb8HEGok=;
        b=YF8kg2rHZMRWNtllobm11Q5TUCHmuTrxw2wjjNaljGJQk2DG84zqFrptupcocD4uIW
         5FYmJ0ro7PIu5ALeb4YRufVaLbNXTrppIu8lRnLmDRVmfGrQNgdeZqJzGUv+c2d43ns2
         YWgnnZPTMT2X3L7gbD2ykE64FnEiQX1DdgJ5uCIgpUcUNZxYCMUGeBSr8lsyCWKkxG1c
         TDhLQiwB7atAc2iy01fesjLPb8TjIU+DDyrfqrI94Df8AL9pkRGGSd0NAnDd5G+nC6vv
         wDH6vjnD6/TzlO+kBxCioyoFWfImPeAviVbjgn26Y+f4DIbpvne97sJCRp+plS6Ae/rx
         Etwg==
X-Forwarded-Encrypted: i=1; AJvYcCWSbM/kSLy1b16QimQU4cujWAt7cJXJbN4lwvbh7JBF+MQmsc5DDBYQLUiC06BwNbxvwQYXiIU03Lw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp21E1ro7i9nSR8DbLMu7uEi5sUGg4tRhoDqREPq3zO82sPFN5
	yYkpceB3tZT0oAP21nE4wsYKW1LCeGQSMp9tGwtA6d9wFGdO6gt6PFVgSkvcg2jq6+1kwLTaP4o
	wvEwX1Mm8jwSVzZw5atF0wt1yAMWqySyxrK3AUREcGS9LU/Z6TZ+1//XrjZTIDg==
X-Gm-Gg: ASbGncsYg9djtgvp8XOreHBj04JyHAzfxQ+3vwxl+RCCEWMGe1ZCnT1kujjQmqneaOw
	ADKTS49ZCs9EP0bSrWSc2g0YPLgO6ReV3qo9QKUrvUqddkgSNssUSGAqib7uvLvB4sz2zUvGHuU
	p6s5kAJN2qNZKMGx7EPgnGB7pd7UEVJ615wOgxzysTCsgDYsqDTWN+jZQX/EpJTWul3BSzrHmcV
	FVAg2mRlLHJftto5O8H+NgxazNMU7X1Co0cPqQoPXJC/Eh1BQ+tQZl4gzPu8ymOpGDgnzBP265Y
	B1qNihEfR60j+LDh9++uH1PWdGWgJlI+oUDn5aoAKwr5M0PniTvRSgobgqtOZCaCyUY+BbQ74Gn
	qHIAY9be///ju
X-Received: by 2002:a05:600c:190e:b0:459:d451:3364 with SMTP id 5b1f17b1804b1-46e1dab8219mr23578565e9.24.1758622454114;
        Tue, 23 Sep 2025 03:14:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfxcysg2CPLWO7CKaUjf7VjUD/s/qwqr1QLzNIPiHoxbXJnS5UWMoepWPmpljqyYqsxssm0w==
X-Received: by 2002:a05:600c:190e:b0:459:d451:3364 with SMTP id 5b1f17b1804b1-46e1dab8219mr23578095e9.24.1758622453537;
        Tue, 23 Sep 2025 03:14:13 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-401d7fa1729sm5378032f8f.5.2025.09.23.03.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 03:14:13 -0700 (PDT)
Message-ID: <feca7414-31fc-4eb2-9b25-e8adc70c2394@redhat.com>
Date: Tue, 23 Sep 2025 12:14:10 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next 06/14] tcp: accecn: handle unexpected AccECN
 negotiation feedback
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
 <20250918162133.111922-7-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250918162133.111922-7-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/18/25 6:21 PM, chia-yu.chang@nokia-bell-labs.com wrote:
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> 
> According to Section 3.1.2 of AccECN spec (RFC9768), if a TCP Client
> has sent a SYN requesting AccECN feedback with (AE,CWR,ECE) = (1,1,1)
> then receives a SYN/ACK with the currently reserved combination
> (AE,CWR,ECE) = (1,0,1) but it does not have logic specific to such a
> combination, the Client MUST enable AccECN mode as if the SYN/ACK
> confirmed that the Server supported AccECN and as if it fed back that
> the IP-ECN field on the SYN had arrived unchanged.
> 
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

This looks like a fix for an incorrect behavior introduced by a previous
AccECN patch. If so, please add a suitable fixes tag. We accept such
tags even for net-next material, and it's better to explicitly call out
needed fixes.

Thanks,

Paolo

