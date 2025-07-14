Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BD7252903
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 13:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752500044; cv=none; b=B7N7RGDkX5Atxwpqe51vXWKDjAaN6MQPQjcABzyJdP15cSAREtjwc8kjWIkZDiMBLC3OpIZgEyL0TwZ7YHZmdG1lh+GH6PEd0lsMBI+f7uNxYBGdl53fEumpsiXqEcwKIHk8IbBcm+cHobeEj2JsnYVWn/pXkloTAbAV2Vo0f2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752500044; c=relaxed/simple;
	bh=dknSdYPDMo76cFz0sXYbOIhIT5DVtRwgwQqMWZ1ploE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sUBmqo937oIKZUiAGUau9n9pFMaWKlnQu67AJpi/SQJx53uFuz8KXVS7I8wx6s3UXZPuYexrsErFJlLau02ksUSGCvM3i84xnQ4x7zQ6dP/xJnCHGRUeXCc6s2ZqGRMr6FC4chfoFAjNIQ6Ub0l0xbO1Y2hJOafMydB7SqqAZmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J1TaBqm3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J1TaBqm3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752500041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ib61hPCB4AUA3/+sodbduYae96rRA8xkreivfOor25Y=;
	b=J1TaBqm36XjPkUz4JVqwae1kpWEhJVbywbxD0m2tQKnU5hot3VpTcIGzVAFWtRkKIWGZSq
	RRoyM8pU6kQaf60imKmqW2ZzrEeJiCqyljnLtmcLfI3GBRj950/Qjmliv5jKmj2E+XXTR5
	9BomOg/PCuExAdjauaOl3KO62vaYEs4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-lLjXI5e8NkuKat31YsA3Mw-1; Mon, 14 Jul 2025 09:33:55 -0400
X-MC-Unique: lLjXI5e8NkuKat31YsA3Mw-1
X-Mimecast-MFC-AGG-ID: lLjXI5e8NkuKat31YsA3Mw_1752500033
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4561a196f70so5759135e9.1
        for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 06:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752500033; x=1753104833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ib61hPCB4AUA3/+sodbduYae96rRA8xkreivfOor25Y=;
        b=kaFtbGUkrUo7TgpI+m6LIUlXERGjEGg1/paBIZYyWu1VOPFb4ZO+CR0J6HZSAT/89y
         fa3ev82ymD4eiHDa0QKdb3USftvdK8acOuyRoOijXxIpF+gj17EqRk9SLirERurUn+CB
         kqf7Jemq1vVBRjarUMUcasNwDim192GD41R0hgFojwCvfZ2/tVimqfe0ctZT6wKqGK9x
         tTLPRdQq25mZ206jfzjzFKE6sNW6kD5hmzj++tmzeJN4l2o7An1bW7dhBv+hlAP+IiN+
         NrEmipEPGbTlM7n3kstnwcfodYyb3MYVuSk9dXO5PbCy8xGWQQ5QSmSzppVC1+yNGSlm
         PEkw==
X-Forwarded-Encrypted: i=1; AJvYcCXyPO6Pk9fUljfYQaLYlBWEcuaI5IGHKteygnLd2HiZ/EcEuZiB62ajn2SBa4WE8FFIQ+wpaLCHV7w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa7RGUUCoY7csAsS3iVt6y9oII8SmYnohzE9laYfpg0cz4ya1i
	4dEQZyMPg9X4zAQ0qo/z86nagNuesH+4sQhSVJN2FQcA3opO1cjcgZv+mLzV1PEce49KYXxtMMN
	Q3VMXAc+HEitmoGN2EkTRn+jejUWYgycTD2xy1NXj+3zj2LIK2dINrxTmavxejw==
X-Gm-Gg: ASbGncs3qay3UG/1QJr1krMCuEJgwekPUirNK5aKgZ81tuX0JflI4tAA6wcRwy1oMeh
	R/MkXlhE/mBL5OaOuW0+JM/oujbcifJLpYJ6nSttM11QA1q5EkR8njax9QYB1aXXdjjEq8+2hzt
	hn8JyQVHWWyy02DIgoGdMYS9gURGUxOCLd9rXSPOrf21F+2qZXmrINkJmpduCOhVlneKU9/YvZq
	5BYZUd1NHxZHhNHevvxNdeXckrfLaexL+PvhwvcDAqUOwB/WaQ6O3rBEt3fE02JrnZ0RCLlchfQ
	2GG5mzYdADYYKfKJ5/4dHBkrN9ZWNWtrvcFkcwpw0Tw=
X-Received: by 2002:adf:e194:0:b0:3a4:e393:11e2 with SMTP id ffacd0b85a97d-3b5f35795c3mr9445146f8f.34.1752500032670;
        Mon, 14 Jul 2025 06:33:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcwfUCJlkG4jBfS0/HPnRj2f8oJvU/65bj2WaKyheEy4Aut2WkWbMl50W+qZ6Yk9d4ozuegA==
X-Received: by 2002:adf:e194:0:b0:3a4:e393:11e2 with SMTP id ffacd0b85a97d-3b5f35795c3mr9445096f8f.34.1752500032183;
        Mon, 14 Jul 2025 06:33:52 -0700 (PDT)
Received: from [192.168.0.115] ([212.105.155.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e26f22sm12633688f8f.94.2025.07.14.06.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 06:33:51 -0700 (PDT)
Message-ID: <226c49dc-ee9c-4edb-9428-2b8b37f542fe@redhat.com>
Date: Mon, 14 Jul 2025 15:33:49 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 net-next 09/15] tcp: accecn: AccECN needs to know
 delivered bytes
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
 <20250704085345.46530-10-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250704085345.46530-10-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/4/25 10:53 AM, chia-yu.chang@nokia-bell-labs.com wrote:
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index eea790295e54..f7d7649612a2 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -1050,6 +1050,7 @@ struct tcp_sacktag_state {
>  	u64	last_sackt;
>  	u32	reord;
>  	u32	sack_delivered;
> +	u32	delivered_bytes;

Explicitly mentioning in the commit message that the above fills a 4
bytes hole could be helpful for reviewers.

Otherwise LGTM,

Acked-by: Paolo Abeni <pabeni@redhat.com>

