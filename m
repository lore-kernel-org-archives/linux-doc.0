Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3FB2DC771
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 11:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762429677; cv=none; b=pWHq5Ylw+eqn6aQ8vDFSxav9na+HXg/9cnj+w5IdDv9jXEitIoDxXy6Q2sc6P77TM5VJTEoj6dE7fnQtknmt51jqqbgY7UvCqUGB5HU9utE4gFgCvbqAe2FHPJmq7zxPrELwgtEQpCkTNLZ9ss5XTo35Gv4Bwt94VFlaUPhe4PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762429677; c=relaxed/simple;
	bh=D0ESafiFnrAHx1xAZJLjIGxN45DgsIeRyNfJcnFl56Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RUtHMCysdKMk2PDRIWw0vnqCp+J8kvjgNIwqwQ6wzyWIEb+PjwgeQe0xiMSgYfinxO6Vis+nDr1L+48ReZhIzNIAYxHPhoFadrLVn+dEbrSi7vE1CQMzqiwOq2l3aVRwUbRtBDy0f6a7yqYrLIMoK5cMqubjlVShAZGZuJjGfu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UUaY63x1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QykzFlY0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UUaY63x1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QykzFlY0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762429674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0JviuZOYT5VOJubSBo7kcaUm1NAOOfzcTxwXg/1vMe4=;
	b=UUaY63x1cO40/wbCYMQ3MnWBd+yJ9BQtSze8PMeRUOQht3AwVqCdMW3ks+YqsBq+jWkkFi
	KE/m9umDapcOvE7SqvDtTqvMaMG4I2Up9rFSBFitVJVxB19K88+mttfKDLocGJeJbllB/h
	o3kVEcJmW1iYpK0HigSVjVauCPRqfS0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-_Yh52_ncNaKCpG9nOmhALg-1; Thu, 06 Nov 2025 06:47:52 -0500
X-MC-Unique: _Yh52_ncNaKCpG9nOmhALg-1
X-Mimecast-MFC-AGG-ID: _Yh52_ncNaKCpG9nOmhALg_1762429672
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-429c5f1e9faso674597f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 03:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762429672; x=1763034472; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0JviuZOYT5VOJubSBo7kcaUm1NAOOfzcTxwXg/1vMe4=;
        b=QykzFlY0LZCuy3V4UnKJjHEt87nA2uZY8ivl9Bs6bCXUVr0Wtjg/AW8OF41QPjaUY5
         SxQpQm+u7NDV7tYxnmmBBbs9y/ofVzOskLTsMHAIupmjBmEVQslSYEY2m8uDkDrxw05t
         0UwORE/od097juxNbnNi0yt/TBKQvwr2bykKtxT7z3RFaSRvdHtoPvX8j9zDM2DzUvKx
         1v+duEob9eLRj1cHep5PESbsYVFgvD0Wp1RquD+IgNorrZg/En6uH/zqHs7UB5Ta/JRX
         JuWG3OVfMRaeQioyzF8GBxYUlbJT7z8+y4mnaI/EpFa9bs8U4KiQS3TrUTP96l2DVX79
         HX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762429672; x=1763034472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0JviuZOYT5VOJubSBo7kcaUm1NAOOfzcTxwXg/1vMe4=;
        b=upSxIcNkx2yvvjOgHexnOhwYx+XZKdjLeGiLk1kpAHH/xqir+sCQP1Up4UQa4346gf
         Rug/k01Ygte7uP/kh8ZR3VjrTHY/byB7xMyRq+TqtrYGlmbdvvuw4bP8oI5BX6maDmMH
         rBCAxr/YmSXS8FT3bG/ZYhh6NBWu90kE/yp1V/0FNjhfeO0aie7PC7/Jnn/zHxJbYDMx
         O2WuopiGKuGwz5aJBAqBfZPGnGtptJwu5DczFahPJ4p70BGVFltYvhALp5IjOroq61jF
         6yijujsrKrd3HyNhpTgwKiZftX2Y/ca50vOi9+uMipqcnknUFVxDv39ggYw2hEhK4Am9
         gnew==
X-Forwarded-Encrypted: i=1; AJvYcCXuln1jgFUcVxGV1cVQEdHwSu0Q6o+u3+vDEN6hrekhPUb4rMzHteCyLreUAcSSQnHUXORGIXRpcWo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yywojy81P7bvjUvJknmn+u7AJARn5CDnehpG05RCKWzoueEseWN
	Gtt4PmnsSVUf3Ksx8+SdUzCvg65N4CJOWz9p2WHuNvxx5nb5YHp1qHM0TOYaP7D26GmHqsSGNuz
	j1QEaGDAji15IlvOSrOtF+GtKWnF5G4asodD+qzPfLogz2s9VGVRIWcKHYOhvHQ==
X-Gm-Gg: ASbGncsLcLhoDNBvQGQdxqpJY3WX6FZF83WKCeYmpdbRRiM86Ddvum0MOFId6sEOdtx
	Ix7GLPDgvDqgCnTOs/8EDZy4AUv6B6l/mwax3g4V0CK8bThZk4rvg0wSpOl+oy+l6wueGnkm9V5
	fQ0ZbL4z8CTCGxKz/GNoG5EZjREtGWlV0t94WwBjw/cAHIDTJHU6bClMLCAvLhvtsVoUMQ1x6rT
	oW2W9x9ux2U8oWeOAeqc8Q7RoEpqPerUNv1QIXW5d9t+j5pcFz9MRCKXToMhOFojZXyhy4E7jDT
	UJZQ/Ub48LIIOo6zAc0OT2iu1UXaMJcDShg9IrwPO1zYM9EIa38yF5U82raGJfWND0F0MN57Bri
	5SA==
X-Received: by 2002:a5d:584a:0:b0:429:d0f0:6dd1 with SMTP id ffacd0b85a97d-429e33396cemr6851003f8f.58.1762429671743;
        Thu, 06 Nov 2025 03:47:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHyM0CqjbrXAtnYkiBBxwxzEmqQL7alB7xzeOenRekpIf1Zfq6usduu0337jFWK1+wDdZonKw==
X-Received: by 2002:a5d:584a:0:b0:429:d0f0:6dd1 with SMTP id ffacd0b85a97d-429e33396cemr6850974f8f.58.1762429671254;
        Thu, 06 Nov 2025 03:47:51 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb49c2fdsm4632849f8f.39.2025.11.06.03.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 03:47:50 -0800 (PST)
Message-ID: <981dbc10-0833-418e-b389-93e0daee8acf@redhat.com>
Date: Thu, 6 Nov 2025 12:47:48 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 08/14] tcp: accecn: retransmit downgraded SYN
 in AccECN negotiation
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
 <20251030143435.13003-9-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251030143435.13003-9-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/30/25 3:34 PM, chia-yu.chang@nokia-bell-labs.com wrote:
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> 
> Based on AccECN spec (RFC9768), if the sender of an AccECN SYN
> (the TCP Client) times out before receiving the SYN/ACK, it SHOULD
> attempt to negotiate the use of AccECN at least one more time by
> continuing to set all three TCP ECN flags (AE,CWR,ECE) = (1,1,1) on
> the first retransmitted SYN (using the usual retransmission time-outs).
> 
> If this first retransmission also fails to be acknowledged, in
> deployment scenarios where AccECN path traversal might be problematic,
> the TCP Client SHOULD send subsequent retransmissions of the SYN with
> the three TCP-ECN flags cleared (AE,CWR,ECE) = (0,0,0).
> 
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Acked-by: Paolo Abeni <pabeni@redhat.com>

