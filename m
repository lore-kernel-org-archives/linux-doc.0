Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30DA303CA8
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 12:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763469163; cv=none; b=tVZiSADU3d5XRc5OSqz1a6t8S061k6lhiH+DdeHA5ZKMafOdEMmh5JTXnA97ydAjMfyfk5l69sItoM1bK6WbprXaPF0Td6TN8bvPEr6bnjD7xYiPTDds0Bak2HPvvf6nHbHlmTlvpO4duaPH9CcDKoHKNKS2VoUFtSHA3I+VH9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763469163; c=relaxed/simple;
	bh=DTaU0Q9eSCt9Q5BWyjMoRvlzd8ouWytjAvoYZ3iv3cM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qVYlrfkx/JvWVJAdv0sjS+d1fDystW78+isZz3Cq8Me5KkYRGW+iAv5DBJ2KbrXxKKFjLfVPdQc9sJJHzwsS+5TrS57aJdjxRm4zB6eOQFpEFjAKJEsqdaWug0q9zr1iyV0o9PAcKS6gqMevhCXMp+appDZ2CL8flit2l0jfvlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J+iyfp8W; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cQwhlZbs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J+iyfp8W";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cQwhlZbs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763469160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8bFq98UfncIM6fG2qDwD7snvwH11yQoURKT7uFfWCO8=;
	b=J+iyfp8W1lyPLlRzjdJT7VDoQC9FhRMP8vU85oPS+Qw9nGiEhs36NmxcopzvdnBq5ckomD
	/VtfkVWgxfPOFgdZaltZzcRqP8IC6+UxVVpzM0Sm64vVgkCOjHNm9kdWtXQ7kh86jkJa4p
	o98pavgalf/zi940kwMI6n0K/qv0u8k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-880wGVa-OuOa4856PGgujA-1; Tue, 18 Nov 2025 07:32:32 -0500
X-MC-Unique: 880wGVa-OuOa4856PGgujA-1
X-Mimecast-MFC-AGG-ID: 880wGVa-OuOa4856PGgujA_1763469152
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-477a60a23adso11711555e9.2
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 04:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763469151; x=1764073951; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8bFq98UfncIM6fG2qDwD7snvwH11yQoURKT7uFfWCO8=;
        b=cQwhlZbs4zt13LJuvvTf6u1L+WO1lo44p6vuzpc8B53pMNYeLuELmvr35iuQUjNRSC
         Siugvu0vQLmCD1dK76BGviJchMu17IFt6NZbG3MryiU2H39SsdCfya8GyFQUBXmnRf5q
         ZG6xGv+CDjfjo+xPQecaPF0L2kOuboCSHQVf/gIJG/acnIzVJduB3QET9Awej2br0KvU
         O8TmMQPBrkS6LN1GBUpuMRSnLj37BXbm9e18LlzfazVk40fqAvV9cDke7FWLChb1qHhR
         qb0jv0i7OwN5/1/54t29Ls9VdXDwE1C1ze2LvGSeRRezq/UgFcxNaUewQxToEbJNNMda
         BRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763469151; x=1764073951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8bFq98UfncIM6fG2qDwD7snvwH11yQoURKT7uFfWCO8=;
        b=kAW5Fw26w1Ti5uD60EVPdnSubiE2xfyYvSSEa5q6VgWh/uGns1X/DOmVDcHJQyua5l
         5DohFVlCifdxMKdMoSA7jA53YUuuxrj+7Ys4kqQDkprfKa24M1RVoRgL5aE/V0rsbfvz
         i1Jgu86P/lV18M4kuMDH6boEBvreD8wg4vAbAVq6NasVDBVuL8qF9Q3iUA5ljQE9/POs
         yNGb/xKAtFxCJfY7vay7m7UEjUABfLd8O72kFVMAFaGofB/H0Mqmy8qWB4iUGBJ50Gjf
         Ze82I07nmS74QQ/X9ywxrRzbxeL5TjJd+1gZ4ZN2xD1uqY/gR3IbcgCSVp4gu02xmAZb
         u0Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWA36xWwVGHJmuNntif/sb3rQFL6TOLV6PPEwYsUgeLo60W4Q/6cBlUIWpn0JYVwpjIPIuiWJBUyPo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4uo+B0TvVIDx9D7dDzqN50oyZL9QgNioDDzPCrj1x2PTKCVR+
	WA23ARhayaha/YP0cSl2kiz6YD0cXq9HYHMFhHkRt7w/FWyjbRzjcM6TpQ/1//rxWUlx5c9MPjW
	DegdgnlZr0cwJK7oxRuRQcTJWKtM3pnE9k+SPxPErCbWF6c05onWuwvDQqrCtEg==
X-Gm-Gg: ASbGncu9MhXaYIkLjg38D2IkbWvwAaRlISSj54Im8zhWX1EoLS6TVLNWYlz39DdpIgv
	app6/Nb+ynv1j/CIo0nb8A8RgQ96mHgVbqI55SMV8HQstnTjehK0PitAx2TzE6yo0FKS0B5C27g
	MVjOLhD6pKvRpF9QJJGIomcbboWaH8/ivsxXCC45DGWQtRyx7MKX9h5eM1iJk5KNtL6Q25bN/Fl
	V9ksjYkLUCAO10varK/CmdHm6c4ZJlatldVT4iyf4ZJOU1r26SuznOXa67ByE7rCzkRnyub5bSG
	jFMu6q+cAUMlg9Wez1/KEvvjDCl8Es/6Rx5u7WUHUgrRF8lemXMNVst2a8g6dj4257WoOAvjtbr
	VhtdRECxnf1yX
X-Received: by 2002:a05:600c:46ca:b0:471:14af:c715 with SMTP id 5b1f17b1804b1-4778fe4f06dmr157483475e9.3.1763469151633;
        Tue, 18 Nov 2025 04:32:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHFPZWLtIKBW62/sV/sykL4J1KL6tvHkeTFz5Ymr6cDp9e0U+MBYs0Z/GsHEyfY0VQ+h19FA==
X-Received: by 2002:a05:600c:46ca:b0:471:14af:c715 with SMTP id 5b1f17b1804b1-4778fe4f06dmr157482965e9.3.1763469151084;
        Tue, 18 Nov 2025 04:32:31 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779a2892c8sm187622705e9.1.2025.11.18.04.32.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 04:32:30 -0800 (PST)
Message-ID: <6332df88-2d49-4dd6-8089-567129f1ef83@redhat.com>
Date: Tue, 18 Nov 2025 13:32:27 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 net-next 09/14] tcp: add TCP_SYNACK_RETRANS synack_type
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
 <20251114071345.10769-10-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251114071345.10769-10-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/14/25 8:13 AM, chia-yu.chang@nokia-bell-labs.com wrote:
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> 
> Before this patch, retransmitted SYN/ACK did not have a specific synack_type;
> however, the upcoming patch needs to distinguish between retransmitted and
> non-retransmitted SYN/ACK for AccECN negotiation to transmit the fallback
> SYN/ACK during AccECN negotiation. Therefore, this patch introduces a new
> synack_type (TCP_SYNACK_RETRANS).
> 
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Acked-by: Paolo Abeni <pabeni@redhat.com>

