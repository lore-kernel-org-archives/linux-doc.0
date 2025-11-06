Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CD330DD20
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 11:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762428396; cv=none; b=lJBu6R0Tpxg/l/SYgpnuOzyjA5ZipcyxMZUq7nd8RKtgxnOJk10ZT6JtqrD0xePEFbqyIPBO1MmIHttjx6a+gaAxyvaB6dAzLop/uB+E7FCClsfAh4jHNSL0j5WUaxvjgUMGH1gsO8sd7s4Ww+8IJpv3azJULTEIQJYWyAV/ABQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762428396; c=relaxed/simple;
	bh=dQJ7UpGrlfHCXR4jDF4h6g+I9lA0nUsBumN+lVkpg84=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=r6gRSNrh8pjPqhNMMJv+8tpRL7uUmHyB/XEYnNlPcoeXXxGkT6hOVZrYy9p0MqBu3frNBolEc8+BilC12y+bx5DMKkH4ADkZegGy5DbFEBjBJZxYAcLq78a+MZSHyMBM0ZONKReYN6QCEX2aqZoXZ/YLBbfHfcASksDEV3QXR2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cxyrdjdc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kPcY+s00; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cxyrdjdc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kPcY+s00"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762428394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U2soIc1bWuVzdGmA3cL/c6qe7E7yX3XgCWZMG0VXc8s=;
	b=cxyrdjdc/acVKs4Yld/RSf4H6hmRVQ4r3tiC45C/rsr7j/bikdcaDTitGKRnzyyT+UUY3q
	39F/Xbf2Hi1EsYyr6aAFHsvy1pEpjp5QegJrS+vShnSWyyorbm3rX5RE+AMt1WTR3f9jlQ
	0IaIe5Cv1TYWGfNPLF9EQbQgdGtrm1M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-JRtDhR_YNqW9EEp7QdRgFA-1; Thu, 06 Nov 2025 06:26:32 -0500
X-MC-Unique: JRtDhR_YNqW9EEp7QdRgFA-1
X-Mimecast-MFC-AGG-ID: JRtDhR_YNqW9EEp7QdRgFA_1762428392
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-429cdb0706aso635714f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 03:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762428391; x=1763033191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2soIc1bWuVzdGmA3cL/c6qe7E7yX3XgCWZMG0VXc8s=;
        b=kPcY+s00ITr3THbMfgpF0p6QxB7953CaH7B3VwfUyWbp0cjqtD0ozlnPRooLq14Nxy
         bkqHhBZwrCzNTa8OxDwJXel+sKO5B6cqcM33HN+8q/rWa8k106m6uDfdT+1oFQqgyk1D
         6nKhOr1AevguJ72DfLXeKqsCxcrFgQhIFTdEMYwmfzzC4D9F4RYeS3LvY+e32pJBusgb
         356NPMcOZbrrDupmHl5k3cfxbvHCrT/jdv+Al5D1weozHfqySCvnGrvE9QSjxMfLINM8
         svnJNIjd5ml1ZNAKWjWJycC9yT0DG1txUlPbEfwCExAbyqu1ZfL+Vjd3zg91NKO6ntxT
         H2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762428391; x=1763033191;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U2soIc1bWuVzdGmA3cL/c6qe7E7yX3XgCWZMG0VXc8s=;
        b=XmBxFf+90tAa4eK5J8wpl95RlbpT1aG9SXJSsKaVfdu0GTjA+DxBx0+TfdXvpVIoTw
         tc0j8E8flLCRp2pH/VZdvl03PtQks78m9wArmIMm7M18FNLGwMGeIJ7jn9EmQmB7j1DX
         fNRDc6zSeF98uxHL0riMaTlMdXUIcpvbyILGObwAl/D5UyhwQdMErX98N1whKsGC+ZKt
         ldifQF5HBSTKkDop10NpDBO08vHJ2jBeeZ5jmsBpI5I3vX0t3vMoe0/ydCaMw5m9drIS
         4mZRj4Hgc9CNiC8OqooTHI3of8J+QhpAccgNTW42CNxYKwXEutfs99XaSZd2ovFEX4Od
         azYA==
X-Forwarded-Encrypted: i=1; AJvYcCWdJVOJkTjZzmaluRb1ga95ruQq/PaRWQG4CApG4HzOKNXDHriK/9vZdtLIj66r2rERasGnHWyibeo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIS9UqK0DQFzH7J6aZ45+XkY7qpjtIp8cW0eI3gAZOtw8+y5Z+
	S2ySkea/yV4Cl1s5pE+Lt7ErbO7uMHJ2TokJKZCNbu7CcyLW9OEVdSgLso2aG4J6KpTSx0brM49
	g9dGUB4NSxY7w6klqqaN1T/ffdm8zEEBH73TQks45ThtwBqzp/4gQUsM6BhPvFw==
X-Gm-Gg: ASbGncsDa3ZgsLVMlW7lKb8U+J/Pw38dbmFrgpbDNg++v1D5zs8arUXt+jeerhDxaya
	8I0zAqTAS9hgqsztDoGc6H+Aj57OkaAExtO356DQwbKFk2WdkgMROXAaOej/HVvtnRZKA9pW7lt
	4x0xJ9jHybOlE6rIm32HJXK+BaGEVfrE7sQK9uZQwnxiChI4YaPbUN7taNM8UuToxOvG2LyvemO
	NCDwaO6TruPiAiXB0r+2eMoM/S8G+DaKDuhyM6ymSpZzno7ok+55HNukXJaemxDVgkZitcvFe3h
	n1hBKwsOYI4iCMPQGupwaUaLI3pNJC34GTZfA16p+X6iwtErwj3UPegkRlCu5Q2W7SAa5T+d/q/
	mOg==
X-Received: by 2002:a05:6000:2882:b0:426:f10c:c512 with SMTP id ffacd0b85a97d-429e330aacbmr5599517f8f.43.1762428391632;
        Thu, 06 Nov 2025 03:26:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTk4Fgt0+Mi1XCDO47kQQbIjxqGs2on8RBp/UBF82QmihADe45xfIjJ/TRK2eqLeeu+VVD/w==
X-Received: by 2002:a05:6000:2882:b0:426:f10c:c512 with SMTP id ffacd0b85a97d-429e330aacbmr5599487f8f.43.1762428391189;
        Thu, 06 Nov 2025 03:26:31 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb49a079sm4564491f8f.32.2025.11.06.03.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 03:26:30 -0800 (PST)
Message-ID: <1c79daaf-c092-4c49-a715-52aeb9688b48@redhat.com>
Date: Thu, 6 Nov 2025 12:26:28 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 03/14] net: update commnets for
 SKB_GSO_TCP_ECN and SKB_GSO_TCP_ACCECN
From: Paolo Abeni <pabeni@redhat.com>
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
 <20251030143435.13003-4-chia-yu.chang@nokia-bell-labs.com>
 <f98d3cab-7668-4cf0-87bf-cd96ca5f7a5b@redhat.com>
Content-Language: en-US
In-Reply-To: <f98d3cab-7668-4cf0-87bf-cd96ca5f7a5b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/6/25 12:06 PM, Paolo Abeni wrote:
> On 10/30/25 3:34 PM, chia-yu.chang@nokia-bell-labs.com wrote:
>> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>>
>> No functional changes.
>>
>> Co-developed-by: Ilpo Järvinen <ij@kernel.org>
>> Signed-off-by: Ilpo Järvinen <ij@kernel.org>
>> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>> ---
>>  include/linux/skbuff.h | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
>> index a7cc3d1f4fd1..74d6a209e203 100644
>> --- a/include/linux/skbuff.h
>> +++ b/include/linux/skbuff.h
>> @@ -671,7 +671,12 @@ enum {
>>  	/* This indicates the skb is from an untrusted source. */
>>  	SKB_GSO_DODGY = 1 << 1,
>>  
>> -	/* This indicates the tcp segment has CWR set. */
>> +	/* For Tx, this indicates the first TCP segment has CWR set, and any
>> +	 * subsequent segment in the same skb has CWR cleared. This cannot be
>> +	 * used on Rx, because the connection to which the segment belongs is
>> +	 * not tracked to use RFC3168 or Accurate ECN, and using RFC3168 ECN
>> +	 * offload may corrupt AccECN signal of AccECN segments.
>> +	 */
> 
> The intended difference between RX and TX sounds bad to me; I think it
> conflicts with the basic GRO design goal of making aggregated and
> re-segmented traffic indistinguishable from the original stream. Also
> what about forwarded packet?

Uhm... I missed completely the point that SKB_GSO_TCP_ECN is TX path
only, i.e. GRO never produces aggregated SKB_GSO_TCP_ECN packets. Except
virtio_net uses it in the RX path ( virtio_net_hdr_to_skb ). Please
clarify the statement accordingly.

/P


