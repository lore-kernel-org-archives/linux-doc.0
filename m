Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0601E25C6F3
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 15:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752505239; cv=none; b=dBnKbzvGs0c/gTOmKrzfzioWDgP/vlx/YiJP/Almfv2sKoBIMlUGRjjdzxocnJ+gsBAKHT02YYz22peUzB2Oqrm6Nj+OCq5D1cDis9WWYBiHVRw8CnSXVHZqGsxrBvPEUE+B6cp5IIcgxDDzQZfAFtsKILGFdUE9WTfmxrreYEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752505239; c=relaxed/simple;
	bh=IHKSZdBg3WcFhFDOVCLrgHqXdaBXMkfRz+CGmXp1u3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kOGhFTixLNsbK2J6jqLH0gZY28ykB5GCMk9nhoKRsRt0RZeF+HBgH8AVtjPOZfcgH7H1ZD4ox4jKQ35myOMnYKO9U8577uWnu31DjE7uRx8zshPTRYcZimLp22/sMeGAbzjS+uMU63yBIfSLlLB1b9MmEwmhoS5MMNpsra2PVb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KXnBfb5t; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KXnBfb5t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752505237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aFwyX6lIQ0fjoLyREcaVc/pevM031iihhbAQ/uu7vB8=;
	b=KXnBfb5tA5kkpIQt0Dk2TKrvJOqEXYF9V6CYMLJq3prgnoVIW13Y0tlb+BbAe45qqFwklF
	UA68ogIum91VPXU896LQVviFa3hxSixfkSaHQbF4IkTEIKXJXUBjDJkHcKmWKIlyGhlwEU
	qqOq3vxcKrgX7/mHXoarEcnQuKGRLic=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-ABrgNlBdMNOS8mCvOS0bng-1; Mon, 14 Jul 2025 11:00:35 -0400
X-MC-Unique: ABrgNlBdMNOS8mCvOS0bng-1
X-Mimecast-MFC-AGG-ID: ABrgNlBdMNOS8mCvOS0bng_1752505229
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4538f375e86so35786715e9.3
        for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 08:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752505229; x=1753110029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aFwyX6lIQ0fjoLyREcaVc/pevM031iihhbAQ/uu7vB8=;
        b=L4CPRfMc934WNVagrlChWn4AnNIo0iEGK2bP1tSUDdTusDlLicnHixdT055xYkE0L1
         Hvudu5rcKIJd6XT71mC6OFYm7u09RrcRI7Mb/PSl5n212PCZzM9n7RfEpwdYf1gymQk/
         tPJT7sh6NLb5TnZOSbGfemngG+oc3faEU/N+A+Ot+4+xU3oI0miSp8jMRTilHbFTINdz
         hDILZj5kJLLTmAmi5N/TofwMKNu4qXKYfZdTA/Ds/vHlQ/bGxfAlXBG3Ivxetmbg6+Ol
         8OEuaURNT1ip4bUco/4n4DxGhMMjcxfOa4ajBEUVWd0+Giy5wuRoaxwLFQhZIxUan9ZR
         6hcg==
X-Forwarded-Encrypted: i=1; AJvYcCW6kn9KJqrwlsSR95MkF3BYcOCYM0NroVf1A+e/fpnomBPIXsX0JQh7Cpv8o+p2cRs6u/eaoWDaodQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yze5yLrPbi5OPfhhAhndPjfj6QqVG/pd2jhMSLSR79Mtmnfj9AR
	VpreN0WuaoqVrqBib9ZAyA0dctEt3CfqEwSVqKtFcm+ZxzTT+IRWKySlZYDHn8qUYDC6h5PbARk
	bjNUNqLkviXD3pc8mMnjFupD+EboFVrDQYJTrcDzMxc+/4Idobhe8YeFgqKJDqw==
X-Gm-Gg: ASbGncs/SrW7oFLOqAa0OXWcZX7j74RnZbYsWy0MMzGR7fYDnthuZe+cXsiiTqhHXb4
	y0/juBxRzqx/I6MhLxEfy9l/vzHnaznHrn7Ff2plF5q0z0LHWT+5Ff148QSD5fWoab1Sja+TNGd
	zP7634uGQfU5JWK2M2VD0IVZ8QC4IfsNuQGJCf2tXmNckgapyBAXV3SpDDiWaELy2TAo4zZi2l4
	7KCu1FX9RoyaqQs6kfeWbQ3ZedywehRh1PXxHu3SlFEFJdmWcpsTd3Ka4NE84NUueFBhfnbCjhR
	aEEwhxx69RH62g2/pFdYQjh/H26+37nekQaUWWcX7nQ=
X-Received: by 2002:a05:600c:37cf:b0:456:fd4:5322 with SMTP id 5b1f17b1804b1-4560fd45573mr66168555e9.11.1752505229170;
        Mon, 14 Jul 2025 08:00:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/DiiAZoBKMtGEbuxHY6nd18x8tIp6jAQkUUQbuvelaXC253z18SXm8PELPhx5Rs/OhWM7Ng==
X-Received: by 2002:a05:600c:37cf:b0:456:fd4:5322 with SMTP id 5b1f17b1804b1-4560fd45573mr66168005e9.11.1752505228616;
        Mon, 14 Jul 2025 08:00:28 -0700 (PDT)
Received: from [192.168.0.115] ([212.105.155.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4560ddf5e0esm69819555e9.18.2025.07.14.08.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 08:00:28 -0700 (PDT)
Message-ID: <0e71834c-881e-4a13-a2c0-3443e2ab7605@redhat.com>
Date: Mon, 14 Jul 2025 17:00:25 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 net-next 13/15] tcp: accecn: AccECN option failure
 handling
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
 <20250704085345.46530-14-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250704085345.46530-14-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/4/25 10:53 AM, chia-yu.chang@nokia-bell-labs.com wrote:
> @@ -443,9 +456,34 @@ static inline void tcp_accecn_set_ace(struct tcp_sock *tp, struct sk_buff *skb,
>  	}
>  }
>  
> +static inline u8 tcp_accecn_option_init(const struct sk_buff *skb,
> +					u8 opt_offset)
> +{
> +	u8 *ptr = skb_transport_header(skb) + opt_offset;
> +	unsigned int optlen = ptr[1] - 2;
> +
> +	WARN_ON_ONCE(ptr[0] != TCPOPT_ACCECN0 && ptr[0] != TCPOPT_ACCECN1);

You should probably error out from this function when WARN_ON_ONCE() is
true. I've no idea about the possibly meaningful error value to be returned.

/P

