Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2820424468A
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 15:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752505416; cv=none; b=YHJ8SWGxCTp5nqe7vSCEvaBviLYAuiCYr4+K20nsOkE0bKpYQxFrIfX+cY3K+aQiXXWNLlF+2TFKyI+2nz9rjcM3JIvX+7/c+9moi8+cvOE7SXv9nlr3RFg02RgG01FbLC3KqECw+slYTrlp9q2h7twlk6ErvfMsWc8Qg9A9Tio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752505416; c=relaxed/simple;
	bh=HgEdt27/fadF/UDelzRUDfGMNwFhsLgZIGfeu1efcvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dXpB2IkFO1MWI1KPnm+uvzaeL2Dlbc+xbYxzZGf5P7c6ZPsU/5jFDh70TCjtawNZvElEdiVMKzwRe1Qe7xwoAImEXQoWWirxCfZYTT7fiZ6bkEUXmieILtUpwkPJScbTjGOx26jfkVxmQFd3sk7zjuQaqHasDp9C2cofBuPwgZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QcGfJghW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QcGfJghW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752505414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CHjUCxwTYZsQwTU8Zui9gNjcOnUwNl2oic1dvzZPsoo=;
	b=QcGfJghW84+S1uIjJ6HHXmQXnBie+0oAhJTbxdQDJgVzauTTBQmQbVjMPXZ6hAhkAn9DCK
	OZ2rk956l5cjpJ+pihkeDJUcz/oJTzUxVikJV2Pa4NFCB+mQ5w9+BkUMktuQpeak7QKbzb
	IR9iRNULA3g6fKBlleQDNcfkxJQpk04=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-2mxC-j8PP9S5OXDj7aIxBw-1; Mon, 14 Jul 2025 11:03:32 -0400
X-MC-Unique: 2mxC-j8PP9S5OXDj7aIxBw-1
X-Mimecast-MFC-AGG-ID: 2mxC-j8PP9S5OXDj7aIxBw_1752505411
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-455f79a2a16so22116365e9.2
        for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 08:03:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752505411; x=1753110211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CHjUCxwTYZsQwTU8Zui9gNjcOnUwNl2oic1dvzZPsoo=;
        b=QfHtQsMt1Qs5wjmaRJM3UI+9KnLKR7vqMUx9MaVH2o+q0Fu64rV3Iey0hchuR//J/k
         fmj8J8f8AgpKRafzNhQy39fSI/VdLoFfbS9bdEIjLgJNr5BviXHXrr7Sz0VOiZ5WckqO
         HgBCjOZIut8QOjqByuhhU6gjRvSzOvqRVQGZLv0djs2EBMBsaqjoeUvVrgJqlWGu1Mti
         t6x9z+dgvdn0ONU61h830O8EPGJrCgcyvzrjGzrAWVnFFDtisTEO+wPjJEhrMd0c7syd
         emF5Dc+BBjWRH4uofYIyoB6/qDGpxONsIjHVv8khHsvGO3mDtecAOL0zHTTQUoOVHZWL
         JXRg==
X-Forwarded-Encrypted: i=1; AJvYcCWZZ7TDSJZxwa4zrk9mDSAss4A8qNJaXHPyAXtVkkZBYeN13WGuDY7erWdetYuNmRa1bkFw993M5J8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyddCc00wA1lTKgh3diqbhJEyHfcZwX8mq4WHHXxx4ealErLPJ
	7MBNl/AuphYJEeo20eIruvXytEl73Q5vh0RVsRrkScBUmn6ht87AHtDNVYy0PAJxLuPCg+OHm8e
	VY0W+WFgNX7/z2d3M1oBtLHsNXfPB/E8EAijWwfFDzuugiY+o4v5etp6yOGnO8Q==
X-Gm-Gg: ASbGncsq6TlTu97GfZ0W7UJy7bJZVJ82DIFXXwmy+wbRNxk+Z1TG+MwbboGL1q7vChd
	9JS1153T0QFW7O2dbgtiIi0cNO4eyZc+GJcj3+dhFkB1zbySIVUNe8G04eFzr0fsd7ZYJkl6Gib
	DhoBPyNOLtk/d90S19/JJYsADf52EwrV83t3WA6G1fEArxtvpdkRHpdebJKUcWc2QFsDllm4dHL
	LmrrRHVbP5hCNgWa7QADhFthrDVHpNPJARJI2kSD/0qEU/C5+s9iK8Lrm1YsZS+uEP+4xm4Vd+v
	LSVH+xncJMnmTsnG7rTKbMVxIeAI+FUI46kTXYL23/c=
X-Received: by 2002:a05:600c:1f14:b0:43d:fa59:af97 with SMTP id 5b1f17b1804b1-454f4255695mr113362165e9.32.1752505410947;
        Mon, 14 Jul 2025 08:03:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgGUQLi8QIz9qJck9h2onkd29NM35VCq7kR/qUQg+hshIrtci80OF3+t9fpKWQoP0MLQ3vkg==
X-Received: by 2002:a05:600c:1f14:b0:43d:fa59:af97 with SMTP id 5b1f17b1804b1-454f4255695mr113361195e9.32.1752505410294;
        Mon, 14 Jul 2025 08:03:30 -0700 (PDT)
Received: from [192.168.0.115] ([212.105.155.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc201asm12513593f8f.22.2025.07.14.08.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 08:03:29 -0700 (PDT)
Message-ID: <d16bda13-2f84-4d15-a737-d2782cda480f@redhat.com>
Date: Mon, 14 Jul 2025 17:03:27 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 net-next 14/15] tcp: accecn: AccECN option ceb/cep and
 ACE field multi-wrap heuristics
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
 <20250704085345.46530-15-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250704085345.46530-15-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/4/25 10:53 AM, chia-yu.chang@nokia-bell-labs.com wrote:
> From: Ilpo Järvinen <ij@kernel.org>
> 
> The AccECN option ceb/cep heuristic algorithm is from AccECN spec
> Appendix A.2.2 to mitigate against false ACE field overflows. Armed
> with ceb delta from option, delivered bytes, and delivered packets it
> is possible to estimate how many times ACE field wrapped.
> 
> This calculation is necessary only if more than one wrap is possible.
> Without SACK, delivered bytes and packets are not always trustworthy in
> which case TCP falls back to the simpler no-or-all wraps ceb algorithm.
> 
> Signed-off-by: Ilpo Järvinen <ij@kernel.org>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Acked-by: Paolo Abeni <pabeni@redhat.com>

