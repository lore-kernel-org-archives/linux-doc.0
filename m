Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFE234DCE0
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 12:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763468063; cv=none; b=TXiPu8AoYEjMPl1ZDAquYbnWh1DX67le7YVqQuOIiszR+nAQZdj5m9ZW4xnjGFLfa2ScE22UITV6KyflPWvt64sABa6ua8Q8j4IdHQpnE6ODE9xMm14w+MQZ45F8KMRo41Z9OB4VjXsObBdOIoY6C7Q96pyd4Xq4DnfuSr0ZheU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763468063; c=relaxed/simple;
	bh=ImZWzph7mTWwkohu9lyvahWKCLQchy6l2VlEx8q1Poc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fKt70ujeYI0soqrmK98jum6K9ME2CHpv9LyMaAhWVF1Lb4rAPFrYV0lLoKd3mfyIYIfMgGADT33NYxsW2KjSlmU1Z2xa0kA1W6C9RBqbwlfYtBP7olEvwGPURLhPRSthZAIfleTIlOW6NtIy/O+c4GrOR/Ikl4gsYPv8TBF50BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NtmhhHlD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oLIeIMCE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NtmhhHlD";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oLIeIMCE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763468060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3BCjv/CGdgcWSx02tEn5XWDlQF9iUwwpCMljkc4+gpo=;
	b=NtmhhHlDHr+Q5skV8Oi9OkYo1XPHL0dB56XuO6NwAwlZCKiFd7qG9cL+udOW4TmLqjOCyQ
	SJVyroCOP1/5xwq189n8OgBsfuFW3HGQnQZcmef+fp2+GdA6pjU+7sXzpfqoQvkrNl1u6P
	WniXR1UVvQCa9Lc+qVOymNzRcv4vXuw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-UAdSp44kPimudErzbb1EyA-1; Tue, 18 Nov 2025 07:14:18 -0500
X-MC-Unique: UAdSp44kPimudErzbb1EyA-1
X-Mimecast-MFC-AGG-ID: UAdSp44kPimudErzbb1EyA_1763468058
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-42b2e448bd9so3447992f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 04:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763468057; x=1764072857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3BCjv/CGdgcWSx02tEn5XWDlQF9iUwwpCMljkc4+gpo=;
        b=oLIeIMCElJTKvOrIRloJeEjKzP/+i8UlXsW3TG37K6DPDuom3PBXUFYoJf/wMcCHyN
         oNebRpWyM/UJjHLDg5AzQmehE9aVF7OiijMX8mR4M/uFi51lL/R95pWLghcFcnJXzSst
         48jORu4dVC3TOaVGaaCg7nQGO1DSthhgzjrLFvcO9FcL/7mMon+1SBY2xlNrJAr+eC1r
         UjgTeseIO70sV+BCldlo2LkwysEhyWoFMjnwcRVSi+3hqR+eFmqMLEhJMSn91d8zQGIX
         y+ScJl29Ocjwn6qz1zU5o9PuNzEY970o+cRC90H99Juo7CEIfUBi3VD6zuPYkI0cttma
         KfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763468057; x=1764072857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3BCjv/CGdgcWSx02tEn5XWDlQF9iUwwpCMljkc4+gpo=;
        b=XwzDPfbEhb36p8+SuI01sAOUJFh4/YfOrSxht/ITB05uV62RcwRSTQD/2ZtzSSZOLw
         Y+q3yM4nGCVaZpjjJcfw3qUL10gBPeL95fgylhfUpp/YvCUDdlzJbs2zJWkbSCUzB4nh
         xy8rHiMOZG1nJuoIgWlyHG8ouhEDcRhs7VNfBaXL3c2Zd5Pkuthiacch4T/NHTwvn80Z
         AgnljwrkO6o5M2zHNTUAvXqn0vUI1+efEpJw+IzMGH1gnAzth+7wPxHv8UjSpsmMAeWK
         sL0I3K2lRg2CLl+zr4AiM/l/cQGgMLLj+Gtqd73v6rHy/TcXOMqpQLd8yh3JYP2OZNE4
         ATCg==
X-Forwarded-Encrypted: i=1; AJvYcCV+YwE70Ykuz/bpNtAglyP3hWnloOViN1ElO1e1AlTSKn5yZ1YemmowItwW4LFJDImBnI//9Ue43h0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFZUSKH17eQVSNbdZNbi28SzV4G/QaU5HO0ocZPodJ+BkwCE37
	/gmS2ZH6UxwG8Yk8bNRU3opbQ7JGpXyX8B8+ClRkOLJZ5ZH/hfURfYQSaT6236ImRdcorUGsivk
	0awIqDxFUIAm0G07Ecvow7joppnlITgDSAETI39xUnk6xirehaefBrnYeP87jZQ==
X-Gm-Gg: ASbGnct30EUc0/bh0lQz606FFPNJe8Qmcrcnw+UmPYfVhFxZ1T6N11HYxrMFlKioR99
	sqI9eUrLJqczgNO6JdULphyFhMJFutTYhggHpDkBTIrPjzfbXPsPqJayqWrbqIifyaAl0Q+70yq
	Ig3vj6aUaqWUtKLm2I6Wdy2XDMOwFLUozCf3JD4bxeYf/ZEuuae9cre1XmGKdOK0lZlW93WuEoU
	qxoowCBbMWdpPzWddoKjRcvGYQ60vnH+2dbADZMp6OB8WfpwBhjmEO8ptI8P6v54HsMnIP9V3g+
	qQuToa5aL0xKMOAkd1UPnA83BxlOhRIe1Ti3c2dWZbS2jg9XOAmDL2MPXhWMFVh7c7vxD74ah/i
	n4jAToT7cpD60
X-Received: by 2002:a05:6000:4186:b0:429:d19f:d959 with SMTP id ffacd0b85a97d-42b5934d6f1mr14360747f8f.15.1763468057542;
        Tue, 18 Nov 2025 04:14:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErQTLe3bQ/i474JHpwGcSyu8Y7j1VvytPeuMCoBPNChkmE/I6UW+IYqaTo4xS93xhgJz9RAA==
X-Received: by 2002:a05:6000:4186:b0:429:d19f:d959 with SMTP id ffacd0b85a97d-42b5934d6f1mr14360710f8f.15.1763468057114;
        Tue, 18 Nov 2025 04:14:17 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e97a87sm32474774f8f.20.2025.11.18.04.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 04:14:16 -0800 (PST)
Message-ID: <92c77477-9945-49c2-90bd-6e05761e2a3e@redhat.com>
Date: Tue, 18 Nov 2025 13:14:13 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 net-next 04/14] selftests/net: gro: add self-test for
 TCP CWR flag
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
 <20251114071345.10769-5-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251114071345.10769-5-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/14/25 8:13 AM, chia-yu.chang@nokia-bell-labs.com wrote:
> +/* send extra flags of the (NUM_PACKETS / 2) and (NUM_PACKETS / 2 - 1)
> + * pkts, not first and not last pkt
> + */
> +static void send_flags(int fd, struct sockaddr_ll *daddr, int psh, int syn,
> +		       int rst, int urg, int cwr)
> +{
> +	static char flag_buf[2][MAX_HDR_LEN + PAYLOAD_LEN];
> +	static char buf[MAX_HDR_LEN + PAYLOAD_LEN];
> +	int payload_len, pkt_size, i;
> +	struct tcphdr *tcph;
> +	int flag[2];
> +
> +	payload_len = PAYLOAD_LEN * (psh || cwr);
> +	pkt_size = total_hdr_len + payload_len;
> +	flag[0] = NUM_PACKETS / 2;
> +	flag[1] = NUM_PACKETS / 2 - 1;
> +
> +	// Create and configure packets with flags

Please use /* */ for comments.

Other than that:

Acked-by: Paolo Abeni <pabeni@redhat.com>

> +	for (i = 0; i < 2; i++) {
> +		if (flag[i] > 0) {
> +			create_packet(flag_buf[i], flag[i] * payload_len, 0,
> +				      payload_len, 0);
> +			tcph = (struct tcphdr *)(flag_buf[i] + tcp_offset);
> +			set_flags(tcph, payload_len, psh, syn, rst, urg, cwr);
> +		}
> +	}
>  
>  	for (i = 0; i < NUM_PACKETS + 1; i++) {
> -		if (i == flag) {
> -			write_packet(fd, flag_buf, pkt_size, daddr);
> +		if (i == flag[0]) {
> +			write_packet(fd, flag_buf[0], pkt_size, daddr);
> +			continue;
> +		} else if (i == flag[1] && cwr) {
> +			write_packet(fd, flag_buf[1], pkt_size, daddr);
>  			continue;
>  		}
>  		create_packet(buf, i * PAYLOAD_LEN, 0, PAYLOAD_LEN, 0);
> @@ -1020,16 +1045,19 @@ static void gro_sender(void)
>  		send_ack(txfd, &daddr);
>  		write_packet(txfd, fin_pkt, total_hdr_len, &daddr);
>  	} else if (strcmp(testname, "flags") == 0) {
> -		send_flags(txfd, &daddr, 1, 0, 0, 0);
> +		send_flags(txfd, &daddr, 1, 0, 0, 0, 0);
>  		write_packet(txfd, fin_pkt, total_hdr_len, &daddr);
>  
> -		send_flags(txfd, &daddr, 0, 1, 0, 0);
> +		send_flags(txfd, &daddr, 0, 1, 0, 0, 0);
>  		write_packet(txfd, fin_pkt, total_hdr_len, &daddr);
>  
> -		send_flags(txfd, &daddr, 0, 0, 1, 0);
> +		send_flags(txfd, &daddr, 0, 0, 1, 0, 0);
>  		write_packet(txfd, fin_pkt, total_hdr_len, &daddr);
>  
> -		send_flags(txfd, &daddr, 0, 0, 0, 1);
> +		send_flags(txfd, &daddr, 0, 0, 0, 1, 0);
> +		write_packet(txfd, fin_pkt, total_hdr_len, &daddr);
> +
> +		send_flags(txfd, &daddr, 0, 0, 0, 0, 1);
>  		write_packet(txfd, fin_pkt, total_hdr_len, &daddr);
>  	} else if (strcmp(testname, "tcp") == 0) {
>  		send_changed_checksum(txfd, &daddr);
> @@ -1163,6 +1191,12 @@ static void gro_receiver(void)
>  
>  		printf("urg flag ends coalescing: ");
>  		check_recv_pkts(rxfd, correct_payload, 3);
> +
> +		correct_payload[0] = PAYLOAD_LEN;
> +		correct_payload[1] = PAYLOAD_LEN * 2;
> +		correct_payload[2] = PAYLOAD_LEN * 2;
> +		printf("cwr flag ends coalescing: ");
> +		check_recv_pkts(rxfd, correct_payload, 3);
>  	} else if (strcmp(testname, "tcp") == 0) {
>  		correct_payload[0] = PAYLOAD_LEN;
>  		correct_payload[1] = PAYLOAD_LEN;

