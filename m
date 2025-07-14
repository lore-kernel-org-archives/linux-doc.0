Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA26E246773
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 13:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752498655; cv=none; b=BwlJ2jH8R5Ex4FET+7T5wSYM/Dz1q3iTU2qFDsc5Ve2QtIC4it5aSR+2OxnGRvrE0qWRWfIXFSdw1qQmFY2RLd3eAwOOjoFZXqkTApIg6TLZ9t/NT9Z54nYAPIr1K2HoCBjk1VGnmaIojCeAsbB1Att9Ijyuc/hdDFiXqLfL3Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752498655; c=relaxed/simple;
	bh=OKHlmd7Qcr8AGinaQ5iuxYV6lu1d4kRrK0yKJPeVqJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HNtMkuKVPgtsGJG9WxXMbGkGw9M08OyAJTvfQGuVhUW6FYERFMLR3fQUlErbJpndN0mbrp3aXYKTp9Cy4UezBdmkFax9ry5RmNyR9xzWE7F7DD40KnllHxb5HhkI/uZORq+Tyvu1WbsfXhsFgg0lVBl/5EctM5ig8jBjzRVIBn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IlfYztwt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IlfYztwt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752498651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Slopq6lqfpeoL26O5BVE+c/eBR9HrgDvIWj6vuGUSOU=;
	b=IlfYztwtlW0ijPfXF3w0ifZc8sUciNeLBnCYNF+JkerEX42d+TfaZCWrrkaWIdC9Y7DurQ
	XLdjMyji0EiT2mowu0EMdilU/CFPg99ea4XTqnZUx4pDIUYzO0/fd8rZhMzFGOwjQ4a5z+
	WkFa+h4WHbYBQYqYe9EaPIQCTaAJ09o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-B7V1K9VcM9-wRGvJBsOkGw-1; Mon, 14 Jul 2025 09:10:50 -0400
X-MC-Unique: B7V1K9VcM9-wRGvJBsOkGw-1
X-Mimecast-MFC-AGG-ID: B7V1K9VcM9-wRGvJBsOkGw_1752498649
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4561c67daebso2564505e9.1
        for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 06:10:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752498649; x=1753103449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Slopq6lqfpeoL26O5BVE+c/eBR9HrgDvIWj6vuGUSOU=;
        b=pFzGIMU7ql3nfgSK7LdEfZ1/gsi6MTu/tkR2TQFuF+0Ke7OUaLWla0YZ2ZJwvlJ7WP
         /Wa4Yv5kbsyHXJV5KJ3+z+Z1Xad2Lpc9mrwF6jVmHsibMRzNNQA7rTNOOpl22UEr1Gef
         dsLbTZMG896byBRSNFDYlAHUInJKPGejFWfwxd7nxFsmjqAJYNaiyDgh/27BsUXHToSK
         Q6B2eNrerLTjUyQBOm5YVhcRPqs3bN51Y2FPheTUIqJmrmyfp66IwZ16u5paFCmPhlqU
         mmnU5qdl35XgHNMWFxCKxVH99FLTIWZ8v7ESZn07PgldLDC1al7ToFnYtUOrggoGnus5
         7wNw==
X-Forwarded-Encrypted: i=1; AJvYcCUoWCuOYm+EDAn/arShMsqGkjHxVA2e3UZXvfpBPN9le5odWFoPitEAzdoN/1wbYIxPiGxhN9VHzqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0mHR60hnQ++bw7mYeTxlkK/l2aWCsdjzpN8e+mSoEKDhbJIlf
	YBAi3Pm88+JNqOMoKdlKN8U3pPk15fu2oJp1jtRuYxnsOfxjCbwPd7jCA864cEoIybnsRkbEIYZ
	iQDE5qjrjEhloWIXPYj3H1YSXQWgxv3z1nQ/PGBxi5qTvU2y7b9UaU4dTClb/GA==
X-Gm-Gg: ASbGncsn3eVOGa3z0kyFCz5mdn+b06XmFrIdQYvggv7VwVotiwFH6+qd5RFAxITG0ka
	p2PZ+ftWPoQjVuPN7k4Dnu8N7je+04AxQrdJcy+K8gU9OUCzaGzqihafoZ2IH8M6z00jRVUuQJ1
	JAd3mfOy2fFq2oWIF4dBLwHu4iaLv9YhnYji19qTUHMiYI73JU4f1aOrK2y5cok2wgFGgA1ChG1
	yikRmkGbvRH1q3S6YIeZIXdP/rH0Rcf80CFAkNXL38TdkcLKuJ3aE3f7F7i52vgMHhxmVMeAs0d
	jfN9fBitxj3JiWY1S8vEnRx3JY7amKy3RMCE04j3fcM=
X-Received: by 2002:a05:600c:6095:b0:456:189e:223a with SMTP id 5b1f17b1804b1-456189e2325mr45725375e9.10.1752498649111;
        Mon, 14 Jul 2025 06:10:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4isJE0VuC1C1kTueLpR2HySlD/dQQOFEyhiZwFlkFPA9n3aecdOCB/5t4HOGIGIIR/iCaiw==
X-Received: by 2002:a05:600c:6095:b0:456:189e:223a with SMTP id 5b1f17b1804b1-456189e2325mr45724915e9.10.1752498648590;
        Mon, 14 Jul 2025 06:10:48 -0700 (PDT)
Received: from [192.168.0.115] ([212.105.155.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e262c6sm12199695f8f.85.2025.07.14.06.10.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 06:10:48 -0700 (PDT)
Message-ID: <dc03363a-36d0-4a56-9247-baa75d516620@redhat.com>
Date: Mon, 14 Jul 2025 15:10:45 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 net-next 06/15] tcp: accecn: AccECN negotiation
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
Cc: Olivier Tilmans <olivier.tilmans@nokia.com>
References: <20250704085345.46530-1-chia-yu.chang@nokia-bell-labs.com>
 <20250704085345.46530-7-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250704085345.46530-7-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/4/25 10:53 AM, chia-yu.chang@nokia-bell-labs.com wrote:
> @@ -375,7 +379,8 @@ struct tcp_sock {
>  	u8	compressed_ack;
>  	u8	dup_ack_counter:2,
>  		tlp_retrans:1,	/* TLP is a retransmission */
> -		unused:5;
> +		syn_ect_snt:2,	/* AccECN ECT memory, only */
> +		syn_ect_rcv:2;	/* ... needed durign 3WHS + first seqno */

Minor nit: typo above: durign -> during

> +/* Infer the ECT value our SYN arrived with from the echoed ACE field */
> +static inline int tcp_accecn_extract_syn_ect(u8 ace)
>  {
> -	tp->received_ce = 0;
> -	tp->received_ce_pending = 0;
> +	/* Below is an excerpt from Tables 2 of the AccECN spec:
> +	 * +================================+========================+
> +	 * |        Echoed ACE field        | Received ECT values of |
> +	 * |      AE      CWR      ECE      |  our SYN arrived with  |
> +	 * +================================+========================+
> +	 * |       0         1         0    |         Not-ECT        |
> +	 * |       0         1         1    |         ECT(1)         |
> +	 * |       1         0         0    |         ECT(0)         |
> +	 * |       1         1         0    |           CE           |
> +	 * +================================+========================+
> +	 */
> +	if (ace & 0x1)
> +		return INET_ECN_ECT_1;
> +	if (!(ace & 0x2))
> +		return INET_ECN_ECT_0;
> +	if (ace & 0x4)
> +		return INET_ECN_CE;
> +	return INET_ECN_NOT_ECT;

Nit: implementing the above with a static array lookup would probably
make the code simpler/more clear

> +/* Used to form the ACE flags for SYN/ACK */
> +static inline u16 tcp_accecn_reflector_flags(u8 ect)
> +{
> +	/* TCP ACE flags of SYN/ACK are set based on IP-ECN codepoint received
> +	 * from SYN. Below is an excerpt from Table 2 of the AccECN spec:
> +	 * +====================+====================================+
> +	 * |  IP-ECN codepoint  |  Respective ACE falgs on SYN/ACK   |
> +	 * |   received on SYN  |       AE       CWR       ECE       |
> +	 * +====================+====================================+
> +	 * |      Not-ECT       |       0         1         0        |
> +	 * |      ECT(1)        |       0         1         1        |
> +	 * |      ECT(0)        |       1         0         0        |
> +	 * |        CE          |       1         1         0        |
> +	 * +====================+====================================+
> +	 */
> +	u32 flags = ect + 2;
> +
> +	if (ect == 3)
> +		flags++;
> +	return FIELD_PREP(TCPHDR_ACE, flags);

Same here.

> +}
>  
> -	wire_ace = tp->received_ce + TCP_ACCECN_CEP_INIT_OFFSET;
> -	th->ece = !!(wire_ace & 0x1);
> -	th->cwr = !!(wire_ace & 0x2);
> -	th->ae = !!(wire_ace & 0x4);
> +/* AccECN specificaiton, 3.1.2: If a TCP server that implements AccECN

Minor nit: typo above: specificaiton -> specification

Otherwise LGTM,

Acked-by: Paolo Abeni <pabeni@redhat.com>

