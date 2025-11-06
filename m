Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841031DF27D
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 11:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762426908; cv=none; b=kgriOP9BC5pVKSiZtKLPdaHlGjJFByyH+1j+TfecmbqpnD9Zk9nmFPPWBXO49cj3jjXPX+BXd3MstYgoVL8ana8Ym+ib6WReqnhGwiajDeUKQHYxcSlnrKKXDtQFK2YJCVUHuLv56giB4uoyDAr4fww/UZ7rFicGTRd4v/eniDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762426908; c=relaxed/simple;
	bh=Dei5euvfk6aFAQ/MRNBfMjoeeHQCZRrQl8W9D/WrzU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IBzxxi579Hq9GbkfvzJECuc0+1sYRxOCPLDoyrYLH/SBpatxOVIrscszk25GX6Zcik06zYLT0fRHGIUZc57fY1Xbh1ZJiSxGnLDM+0dodvoIdOXPFAp1PLrVXA/0bl8m9lNyTros1H9gO5OXwQ5mgHhr/00acJIN88oknQPcSpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hMgrM2SV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aWAkx2MJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hMgrM2SV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aWAkx2MJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762426905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=07X1DhUV2EUqxrRz0+TYJuq8bAIzOYbawmg2oVbO75k=;
	b=hMgrM2SVTyYYtjr4kDwtLfhUjjgg9QL72p8oYzGyjLkK262It4LYS5141P6N+MM9pLxXpN
	W3kW21BY8T7vWAWx0IRAdyzINI6wNF68mS+YgPW4ZTLmcVclosXken/t1rhR1YmQRwd1ih
	BjEfXZsSZ4OUvwIsGT7VtoevEjP3HMU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-02q5reowNZOQvd7tzyGvBQ-1; Thu, 06 Nov 2025 06:01:44 -0500
X-MC-Unique: 02q5reowNZOQvd7tzyGvBQ-1
X-Mimecast-MFC-AGG-ID: 02q5reowNZOQvd7tzyGvBQ_1762426903
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-46e47d14dceso3727365e9.2
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 03:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762426903; x=1763031703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=07X1DhUV2EUqxrRz0+TYJuq8bAIzOYbawmg2oVbO75k=;
        b=aWAkx2MJD0eCUyqTGZpxYU9hbFMcHcZ/vdNxbM+shEexTREhXuDjf9M4BnJFNYNrbg
         9nmxrPbO7lu7oLPyhXVM91baJP5UTHGOw5Kjr6j1qYQMi3IruoTexZO/bcbeGPB2U+rx
         K3jexjeasZcYiMozF07n+GQ0yaWMDHxWxrrl6BYYcE2CzbvazGpiAgeuMoDnyWlDGxSN
         5CRKkZpkCWYQd7FKxxJH+YqzqNuvmLoBIMasKxOZi1ZdHN/ZObfaVZ3FMHR2jNW/XG0X
         OdZ0bKEMxa7RNQSNu5v3LYrRhexsJ4Amjg0fmdZDAKEHK4bw9ErvztjUX1zizh4UGhSe
         XhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762426903; x=1763031703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=07X1DhUV2EUqxrRz0+TYJuq8bAIzOYbawmg2oVbO75k=;
        b=skgG7oyZdS0D/aEYv4T6VYyPx7l/62NbOroHwLjBiLrR/+LM18spHXbPe4xBji/Ixg
         CJj01aVdIk8zUmBATt6qfYePZ8irh/4VaK2C1/kDSABSH+ynx/28TEpuSLM3Y3DKbmWL
         gaXD1GD2gXgzZ6x/vMlO1VUM6FDIRlA3HNo6W/iVgKAKQCWkC7ZxZRwtv7MPbIltQ/9M
         LR3C4gkACbBmo3OpT1wmwptq/Q5T2LYkprcw86EtXv1d3pHSy5TT/P++b+ZA6zvdG6mF
         7KwW5zM4YEkoD+RIWrti+wcCKczDWZy0CWqltmk8+ioqAQvslU04L/6v/5ilMc3qbRQd
         lLZA==
X-Forwarded-Encrypted: i=1; AJvYcCX/5gxIv4ffbFpkYTmXL5ImxxGsuRixhovPC/cDf//vF3Pne3SiMn4Rh0NfhPE9Fj+4pnEM8WXd4gE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0e9+nWTutEuWZ0XZYhJNzrVnZUD6StGLRFhVFK0gMrKP8Nf/v
	Rwgx1IArh4jHS4k2jFWSS51Y9Y9hB/WA/7ZnyZE9CkJ83LY3KotYZOCB44b0+Y8tLThg3UiQbpg
	zdqjIWG8tod1Hdlk8I5ZMqRTnpQo0u2pTGFGj8qWrSb/ZxEmjPavcGD4IRMghcA==
X-Gm-Gg: ASbGncv5SxAlyfm/dfo3GCPx8uxYrEjFXdi6eWDRJ9i5H/i0e8rn8IYcGw+3kAK0F2i
	P1ggU1M5dKo9aaY5sGSlYS6URGGQ3Wzqx5/E/pMsFm7SxZ83nnBDHfWozJ3eEhojv/zK1I/jM1w
	F4Am5jUWspELvZSELpaxRiQyu3ilwo7CBhMEwU1VPUduezNRN3TkA+eOFaq6x5gsSWKuophf7yJ
	gQ59eQAIt2rH70GywFUK5dFGOrI70L8eJr4olo1CDWb1aKAd2iLXcc8xCpUb5+bdru41YmJNd/D
	1QJdPAGKWBbjRLtAsvCvr4HZwVDXhrq+rzbXcIYK8Qf/gWs9tNBASVu7AKBFmB+dLeNtiop9ZXr
	FtA==
X-Received: by 2002:a05:600c:46ce:b0:471:1774:3003 with SMTP id 5b1f17b1804b1-4775ce14b52mr58027545e9.29.1762426903195;
        Thu, 06 Nov 2025 03:01:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG430xjOAqRIvEcdMviVraV1j6ItaKaJ77q7yFj/XLjJ3thQ0llyl6gKxWQm4UuWaaKlMnvwg==
X-Received: by 2002:a05:600c:46ce:b0:471:1774:3003 with SMTP id 5b1f17b1804b1-4775ce14b52mr58027105e9.29.1762426902622;
        Thu, 06 Nov 2025 03:01:42 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eead98d2sm2648165f8f.38.2025.11.06.03.01.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 03:01:42 -0800 (PST)
Message-ID: <8ad4ca21-5b81-415b-b16c-6cc4b668921c@redhat.com>
Date: Thu, 6 Nov 2025 12:01:39 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 02/14] gro: flushing when CWR is set
 negatively affects AccECN
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
 <20251030143435.13003-3-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251030143435.13003-3-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/30/25 3:34 PM, chia-yu.chang@nokia-bell-labs.com wrote:
> From: Ilpo Järvinen <ij@kernel.org>
> 
> As AccECN may keep CWR bit asserted due to different
> interpretation of the bit, flushing with GRO because of
> CWR may effectively disable GRO until AccECN counter
> field changes such that CWR-bit becomes 0.
> 
> There is no harm done from not immediately forwarding the
> CWR'ed segment with RFC3168 ECN.
> 
> Signed-off-by: Ilpo Järvinen <ij@kernel.org>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Please provide a test/update the existing one to cover this case or move
to a later series. Possibly both :)

/P

