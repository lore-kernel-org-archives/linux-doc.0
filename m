Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695DC268C69
	for <linux-doc@vger.kernel.org>; Tue, 20 May 2025 09:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747734250; cv=none; b=Nl2rU3Ru/C3ZMI1jcTv5WuRG3owbD2KdRwejh4Ad0dv1fPyLUp5pZksETFNHpf+Hq1KJEa4wbaXKoIlZNvFQVEivf5hlH1S7NYSzKD+tfEdCdlHMACgXbsbX8P6ypDml+ZZou9rlkN4XCJ+Eee8yv7T6gtsvX7Ow+wR2cJweZJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747734250; c=relaxed/simple;
	bh=GdfrJ9wEalOSO5bv0hmoFkzoT7yB2DwWV6SQJUpoaZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=M35QhkcNVbpZSLqy4o1SAd5/PiqWTdwtf8Yf8b0bIQpsGAJ+yGauQJUE+ERjzJDdhf8UqHKYWI9l1fgfsEu6JiVI2ujVRLU3F5WTRyz51DhVWq9zdjhFgAl38I015uhJUg+KM13Caw6MfEn3lvx5E5xSHspqlszAeFZ8G9DdMI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H20gj8sS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H20gj8sS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747734247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oVjYCglGOjhQOwhRRoCVF9gAuVp//nFBUyUL3xi0qNE=;
	b=H20gj8sSkKnuFQyMUepG6DhvAQXcSVeyQGpMPZexZDAIN+neRxihb5drYJtDAR7oPEdEyB
	p45hTz3bmuxLesJOOoixE2wRy3SO+rbGcb4IDJrcZr1OaanrZnruzldF5IQfc1+bfP55r4
	IsYzBDxeq1/kzYA2dk7SYTE+Sle/drQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-ub4XIlHpPQOcRodp0jZPYw-1; Tue, 20 May 2025 05:44:06 -0400
X-MC-Unique: ub4XIlHpPQOcRodp0jZPYw-1
X-Mimecast-MFC-AGG-ID: ub4XIlHpPQOcRodp0jZPYw_1747734245
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a34f19c977so2560523f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 20 May 2025 02:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747734244; x=1748339044;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oVjYCglGOjhQOwhRRoCVF9gAuVp//nFBUyUL3xi0qNE=;
        b=DIWisncWRMb0Rh2AJgIBWgbKsbqMq71BlDuAwGtJ4/klMwAKkO1leDLVatII59JqUt
         HLOttYNKBNdRZQMdP0KU/CQNV682+dxC9iSoc4igTkpcnoaBsPnrGThqvn/hdJGDomoc
         QTiGnax4yBfIWbfgl6a31iO6XY+chzhsOH7vI0bxeQ2vRPO5HYT0gz3fBu/SH4n4PICt
         uYd6WiKpiUEjanV1QL/ybh1yO/7rBMAvcM23AgwGjZ3tF/3UtmL9TLnFF3O9PAh7Egre
         /5iXGH0t6MDgquLHKNlZ32EWBILpHEb41vhZdArfBkpsvLeT3cvc2j60pPn6ETD7TnGC
         kYig==
X-Forwarded-Encrypted: i=1; AJvYcCWuaSmzlEm4CosPX2nY8D+8Pg4kHjZaJuRPDZdtMWJ99MzCbfMtYxBG03BAk17qwJ+0vOitAEKgaZY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3On0luVYTlyyAC+lwGFICXEI0c30kajdkSDb9dQRjrVgrrHwR
	qptu/8NxEQtk4n4IL2nH4JsHBAoKNHDvQfBhi9UJCLMcx7VepP8feCPuTy6zLqJq/6j268UnLCE
	Vz1CPjOLm2tTpBRGjSAbtFwJ+fGueb7Jnh2zaOawcH9wvlXHf2qAOMHpyQCJV8owfCwqT46Y4
X-Gm-Gg: ASbGnctddvPyHmwjdkxZR71Lr3Vdd0LJXSacQDska0f/JcvIEN6iuKwagEYwukS9/v7
	/O9GygwdntY4TFEFbYyjgafZOGG3JU+EWq9ekkhKxkXP5NoqdDFEP4mvfpfx5AF/w+xdGitIRGp
	aPyxo3Q+haM+y7KpWwqcv8olJa4MZVDudKKqhgxvdpuYON7UQP55LfLnGMcBdQy2vXwyaVUtLgH
	eUnyWmOnETQr0j8INzstLmRWacwMcCoNTBMqsrBOy2kUbhFA+CqFPMDaDd789ercMbvGRKoYRdH
	EBrCWS/ra6MTXDql0UAt6n4my+NAQ2UyzwWxRb/aeov/tjiCUuJbCsB4O9U=
X-Received: by 2002:a5d:5f4f:0:b0:3a3:6d25:b8e2 with SMTP id ffacd0b85a97d-3a36d25babemr6669813f8f.6.1747734244558;
        Tue, 20 May 2025 02:44:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2oghOI8vAadYac9W7SXycaXiUvUjylnYzfxLoDCc2r39zb/TatFV5FbKXsSsW2LJtvpmuhA==
X-Received: by 2002:a5d:5f4f:0:b0:3a3:6d25:b8e2 with SMTP id ffacd0b85a97d-3a36d25babemr6669787f8f.6.1747734244185;
        Tue, 20 May 2025 02:44:04 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:244f:5710:ef42:9a8d:40c2:f2db? ([2a0d:3344:244f:5710:ef42:9a8d:40c2:f2db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a04csm15574156f8f.23.2025.05.20.02.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 02:44:03 -0700 (PDT)
Message-ID: <f0941549-904a-452a-aafc-f42763d13d9e@redhat.com>
Date: Tue, 20 May 2025 11:44:01 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 net-next 06/15] tcp: accecn: add AccECN rx byte
 counters
To: chia-yu.chang@nokia-bell-labs.com, linux-doc@vger.kernel.org,
 corbet@lwn.net, horms@kernel.org, dsahern@kernel.org, kuniyu@amazon.com,
 bpf@vger.kernel.org, netdev@vger.kernel.org, dave.taht@gmail.com,
 jhs@mojatatu.com, kuba@kernel.org, stephen@networkplumber.org,
 xiyou.wangcong@gmail.com, jiri@resnulli.us, davem@davemloft.net,
 edumazet@google.com, andrew+netdev@lunn.ch, donald.hunter@gmail.com,
 ast@fiberby.net, liuhangbin@gmail.com, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, ij@kernel.org, ncardwell@google.com,
 koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com,
 ingemar.s.johansson@ericsson.com, mirja.kuehlewind@ericsson.com,
 cheshire@apple.com, rs.ietf@gmx.at, Jason_Livingood@comcast.com,
 vidhi_goel@apple.com
References: <20250514135642.11203-1-chia-yu.chang@nokia-bell-labs.com>
 <20250514135642.11203-7-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250514135642.11203-7-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/14/25 3:56 PM, chia-yu.chang@nokia-bell-labs.com wrote:
> diff --git a/net/ipv4/tcp_minisocks.c b/net/ipv4/tcp_minisocks.c
> index 779a206a5ca6..3f8225bae49f 100644
> --- a/net/ipv4/tcp_minisocks.c
> +++ b/net/ipv4/tcp_minisocks.c
> @@ -497,10 +497,11 @@ static void tcp_ecn_openreq_child(struct sock *sk,
>  	struct tcp_sock *tp = tcp_sk(sk);
>  
>  	if (treq->accecn_ok) {
> +		const struct tcphdr *th = (const struct tcphdr *)skb->data;

Minor nit: please insert an empty line between the variable declaration
and the code.

>  		tcp_ecn_mode_set(tp, TCP_ECN_MODE_ACCECN);
>  		tp->syn_ect_snt = treq->syn_ect_snt;
>  		tcp_accecn_third_ack(sk, skb, treq->syn_ect_snt);
> -		tcp_ecn_received_counters(sk, skb);
> +		tcp_ecn_received_counters(sk, skb, skb->len - th->doff * 4);

There is an identic statement a few lines above, possibly worth an helper.

/P

