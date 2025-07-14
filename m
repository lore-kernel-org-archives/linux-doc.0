Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2712367B1
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 13:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752499835; cv=none; b=h3nFrpDrlrhAhABh3n68PAkV8bdCqHFP8LQHS2l06Pz2q2hP78yhDr7E+adKMJIRpxeKxIpdGP/rpY9/+QF2nZ75xMBzQePED0B5jDi0I4xxQMNg56DyLWVRnGxDh8L+KxdtRjYv52NKyQxDfTm5Q8Ws6P3rpNZ3O6sAGlYwBJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752499835; c=relaxed/simple;
	bh=jE2PjP+eUyYjMNAeVnNr5q6iOIuN3tAeEx+RGEXiP+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cHPaBPgcBpNmY9C/cuhZ6X3MeJ45heFIBrfZJSOVfXcWOMUMc2MsFj2FKmaNFRgzFtHimu8iRzw5zIJzc3+C/7GunJu8eYUzklJhumb9Hl6hXqhbIZOXToghZmpstwb2Ua0Z/PmMapDbXJnvvtmlLXDjdo+cbmRqAo/W1snEgz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MMDXB2wO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MMDXB2wO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752499833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+zrHqcWkaADA2V8M40rY+/BG8BMVb7igefIEkGbRiek=;
	b=MMDXB2wObIBOLuvIUFXpQ5rkMi7gN3J3rIFg/W3xxD/3wmjiymouUCHDkqtLaR8lYoOP2K
	22WmOyU1WRE03t2FC8oOQ57Bpgf66ROuHvGdNo4sS6D47Jt6PCM0gUb16YDlEZqJuO6BOp
	bvN/VoMi98hYuVPSy2Pncqq1JgA2nEw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-kIsopiWvPSGI5x4ni6N2Nw-1; Mon, 14 Jul 2025 09:30:27 -0400
X-MC-Unique: kIsopiWvPSGI5x4ni6N2Nw-1
X-Mimecast-MFC-AGG-ID: kIsopiWvPSGI5x4ni6N2Nw_1752499826
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4e713e05bso1891513f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 06:30:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752499826; x=1753104626;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+zrHqcWkaADA2V8M40rY+/BG8BMVb7igefIEkGbRiek=;
        b=i9P/8dVuMtO+Svq5Rv5MB3+qtb1RewsQmaCmnmECHQDGGZkwvltlQj+gOPUMu1rOq4
         gy+H6Qrw40XFRctzmZOCgXJg96fFyIHENjwPqwMwH6/hTwAaKRraE5R/7jCUFcQ7yoAJ
         DlDSagui3FwJENhRmxwrTolIptfIPkYEXJI9cJlhQXs5XmpPapaMQCbTHZyL8p4MFRBc
         2YRuELLuYZ9txMucXfV8DLGdzyh0/RGp4XMuGKl/Gk5lrv/Y29i7jUOWg9UpF/QbcQU2
         V41XiqEIqSUWENhnd3CjIttg7++mI9hznemwAsyRZZD+87NGEEehDGd/DTL11iROak9j
         b7Fg==
X-Forwarded-Encrypted: i=1; AJvYcCU/TDPXqGq07zSAnBoosjUtrZiMHpDYMullbaZKU/Qc41Mckb20UjVloxItg6I/ITLEV8nUBEuV5Cs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ/CDTeIC+cyjXonKTZGLgw3GkKdfocBV0j5zn62ku7whLNhWy
	0lJ6CwvGNIO9h2xiRRns2BcH/ROT/0tfakgRIIwNQ5unK1TQSE6UfaX8lVgLGLGi/a8AxvRsZ1M
	rRwYmzLJzvjUHEssnlui/mOO/qHXzHLSPrJQxZfSndQcZBC2Z63shSDUYo9mYI3HTh79Gog==
X-Gm-Gg: ASbGnctdwGJ297j4SJt+2KWwdkwISDZsEMX7waMq2Z3muEF21ckVdGG04S9X9PJ95OF
	+yluE2MNHos4tv1H7HRXpj199UW1mXu6YKGr9QWCDNgW3doWZ2UvQUz12eLLynS4ldXnoEZXOb7
	0Qs3t1wTClM5Qnn+GbxWM3PxoiI/4jXQyErqTGW7QyRyb8ZS/mK+YbotL1n23qN49sFB6sRD0ZY
	xsHyY9BjQ/GxPfX8NvtSSmtuk2yekhs3rZ8vJF/3MMHznvxTRFt3FUoZUMTMT38DdJvzXLDfwFZ
	992cA6MOeqIVZP3v1TQ33RR7t5zusg2z39GROUmTjH0=
X-Received: by 2002:a05:6000:1a86:b0:3a4:eda1:6c39 with SMTP id ffacd0b85a97d-3b5f2dc216dmr9064737f8f.13.1752499826104;
        Mon, 14 Jul 2025 06:30:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFaTEcDjTABy5Z9QcNaN67akhbYxVRmsOC1nK6NjQhL0rqHS1s4JU+e5aThLy1SFXDe8sLSA==
X-Received: by 2002:a05:6000:1a86:b0:3a4:eda1:6c39 with SMTP id ffacd0b85a97d-3b5f2dc216dmr9064691f8f.13.1752499825633;
        Mon, 14 Jul 2025 06:30:25 -0700 (PDT)
Received: from [192.168.0.115] ([212.105.155.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4560ddf5e0esm67383545e9.18.2025.07.14.06.30.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 06:30:25 -0700 (PDT)
Message-ID: <dcf822ea-9dd1-47f5-8b2f-9c98013b1499@redhat.com>
Date: Mon, 14 Jul 2025 15:30:22 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 net-next 08/15] tcp: accecn: add AccECN rx byte
 counters
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
References: <20250704085345.46530-1-chia-yu.chang@nokia-bell-labs.com>
 <20250704085345.46530-9-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250704085345.46530-9-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

n 7/4/25 10:53 AM, chia-yu.chang@nokia-bell-labs.com wrote:
> diff --git a/include/net/tcp.h b/include/net/tcp.h
> index 61b103633da4..0d8e1a676dad 100644
> --- a/include/net/tcp.h
> +++ b/include/net/tcp.h
> @@ -971,6 +971,9 @@ static inline u32 tcp_rsk_tsval(const struct tcp_request_sock *treq)
>   * See draft-ietf-tcpm-accurate-ecn for the latest values.
>   */
>  #define TCP_ACCECN_CEP_INIT_OFFSET 5
> +#define TCP_ACCECN_E1B_INIT_OFFSET 1
> +#define TCP_ACCECN_E0B_INIT_OFFSET 1
> +#define TCP_ACCECN_CEB_INIT_OFFSET 0

It looks like the definitions above are not used in this patch. I
suggest moving the definition in 'tcp: accecn: AccECN option'

Otherwise the code LGTM, but I still have some doubts WRT the
significant increase of the hotpath data.

/P


