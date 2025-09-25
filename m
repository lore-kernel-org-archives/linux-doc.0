Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B4C3009FF
	for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 15:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758815199; cv=none; b=kJxRxwJcelwXbCdmROiHmCj/ZgaEHLms3MZ0e8nAXTVbo7Um5lYNeFIhm/HrjKIyfb0LLsm2n3Bi4zjnH48wF6RaSPC9l/q/pO3P7WnttmtpeWTTYDB4XWhtPdz01P5b6y1XQ3VYb4miQlR8CcC6QI4KRnWYPyZBBWtMVeWaunA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758815199; c=relaxed/simple;
	bh=5CJLjTtW546J8tpkufLvEmsJirZuPDW94Wu+LVkFf3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=f9VXt07NLbjns0Ry5EkYX9hvJ08JHkIJOE02/m6Hrwocmi0ZVS8Rdr6nf8l8ev4n4mMm7ZZGVP/NXB3ivARWS+54/VSEyiFgd5KX/kXWohvii1U8MqlJyFdWD3/PoyJi5goIsXf51Sw1uX0qmAo/8CqgqiHyy62dqoRN0bCdkbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y484IEMM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y484IEMM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758815196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qxessgCFqOIjkxN8E3V+AacX2DwtplcyNFIAKPJSduY=;
	b=Y484IEMMqth/JEbEiL0j+BJFy4JptX07yOHZ5ZoqbPDdY1t7Hex+DTi8vb52gqv1vV0Dmg
	w91h6bIlli5vWnC+B4LvxVDrE/Laq02N5zytXr/IGm3OAljXW2sPdurLb377Pzubp3m/DX
	7WuPb6XsYx5PZFy1AxpcUlsmfwvS7lo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-cX_qaAuGNsOouOk32w4_vg-1; Thu, 25 Sep 2025 11:46:35 -0400
X-MC-Unique: cX_qaAuGNsOouOk32w4_vg-1
X-Mimecast-MFC-AGG-ID: cX_qaAuGNsOouOk32w4_vg_1758815194
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3f7b5c27d41so630963f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 08:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758815194; x=1759419994;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qxessgCFqOIjkxN8E3V+AacX2DwtplcyNFIAKPJSduY=;
        b=ZHgdPG76Nw+pDuC2cOBDTkY8UlsFPZko+Y88lo2k+e+O3Gnq+rEe+M4cAcdfXQYDd1
         1NDIIvWwSCTUO5MWdY4Qh08jkdsbN58O+e6rNsq7p417AGQFXcfdUiVIu7INqIx+yrXP
         zMNDqiVgvUokPLGsCnNa3gom2VDI2DZ+KCgV8+B8TLynQIYlnaJvk25bstpYqqPXRJiy
         OaJWO/Ts9yRtBjR7l9yzJFCLk9+2wD9VMzHCJt/7OTRQY8V92vL/WJHnqMX0oQpYp3Dw
         R83q98f+v1XIXmA3scp6bYStzIDfXQiwW8W/7NQkxpxI/JQkq4bKislsv6URfsOzMTRS
         YGcA==
X-Forwarded-Encrypted: i=1; AJvYcCXv/cxKl3vu2mhNPxplGti5VKjzIumm5jTKbH4mOJyw3am/Xz/NS4vNNgS9YDeI8tWmisENMRHc0cc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq9MuR56FwBlROAxFOWrB9+ZgBCWLlu1pK1YSxJXY0wsuDbDT3
	OtgW5rdQh5oR1UZ9XTDz2S76i+8lqgJmOoYa1uNMRRgRMMVx5skEjvkHiFjZHwLPskeXzfa9Tms
	cVNn626wgcKdtn1DuHdsMFVm9Hsz6taNsL97WiD7x7unSpWJxQ8EFvSYK+K5l1ytmaNtDSg==
X-Gm-Gg: ASbGncuHfQR9rQuc78P7QeW6TgM4wRWtMY0qPM3ERqDbIGGBbFctyHYO+XNW2gRzYrq
	O6trteuAw4HQnvMJpnMewdf6GFgu5exm170v+7Rw/GJAOY7A6jTfENhlkxO8+I3Od2JdBvkJVEq
	ViaqH+7LEmq6QoLZpQm+JSVoYu9iHgVlDRlLtDtt6FXaIEL2SRUQHMhTBEPYfx7wsovNYqAPOnP
	JuDIySq7WLWHyNILEzUMHdcdgz/oxdVT3ta06+0hIBoBEUQz0J1OLyy+nsDiQkw+7kevN0QuRZI
	hOseY1N5P1VioZNz8itknt6fpAC2C7Ud07Lf1vYQpfmCB4i5KnmjQV+LC26m98zDW1GArOKZZP6
	uPCKr1m8H7whw
X-Received: by 2002:a05:6000:4305:b0:3ea:63d:44a8 with SMTP id ffacd0b85a97d-40f625fb96amr3794190f8f.15.1758815193831;
        Thu, 25 Sep 2025 08:46:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/k0nNfesW/BrVX/GL2okFEQbeth/drP6MINltdb5SEkxjqx61LbE6DaCG/45opkpod6jG0w==
X-Received: by 2002:a05:6000:4305:b0:3ea:63d:44a8 with SMTP id ffacd0b85a97d-40f625fb96amr3794161f8f.15.1758815193392;
        Thu, 25 Sep 2025 08:46:33 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc5602f15sm3410601f8f.39.2025.09.25.08.46.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 08:46:32 -0700 (PDT)
Message-ID: <b2a0cbdc-776a-42c8-8e19-051a12a1a7bc@redhat.com>
Date: Thu, 25 Sep 2025 17:46:30 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next 13/14] tcp: accecn: stop sending AccECN opt
 when loss ACK w/ option
To: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>,
 "edumazet@google.com" <edumazet@google.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "corbet@lwn.net" <corbet@lwn.net>, "horms@kernel.org" <horms@kernel.org>,
 "dsahern@kernel.org" <dsahern@kernel.org>,
 "kuniyu@amazon.com" <kuniyu@amazon.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dave.taht@gmail.com" <dave.taht@gmail.com>,
 "jhs@mojatatu.com" <jhs@mojatatu.com>, "kuba@kernel.org" <kuba@kernel.org>,
 "stephen@networkplumber.org" <stephen@networkplumber.org>,
 "xiyou.wangcong@gmail.com" <xiyou.wangcong@gmail.com>,
 "jiri@resnulli.us" <jiri@resnulli.us>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
 "donald.hunter@gmail.com" <donald.hunter@gmail.com>,
 "ast@fiberby.net" <ast@fiberby.net>,
 "liuhangbin@gmail.com" <liuhangbin@gmail.com>,
 "shuah@kernel.org" <shuah@kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "ij@kernel.org" <ij@kernel.org>, "ncardwell@google.com"
 <ncardwell@google.com>,
 "Koen De Schepper (Nokia)" <koen.de_schepper@nokia-bell-labs.com>,
 "g.white@cablelabs.com" <g.white@cablelabs.com>,
 "ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
 "mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>,
 "cheshire@apple.com" <cheshire@apple.com>, "rs.ietf@gmx.at"
 <rs.ietf@gmx.at>, "Jason_Livingood@comcast.com"
 <Jason_Livingood@comcast.com>, "vidhi_goel@apple.com" <vidhi_goel@apple.com>
References: <20250918162133.111922-1-chia-yu.chang@nokia-bell-labs.com>
 <20250918162133.111922-14-chia-yu.chang@nokia-bell-labs.com>
 <03d6dba8-2586-4ae9-8a16-26b84cf206eb@redhat.com>
 <PAXPR07MB7984B98035A3D3A1570F4AF4A31FA@PAXPR07MB7984.eurprd07.prod.outlook.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <PAXPR07MB7984B98035A3D3A1570F4AF4A31FA@PAXPR07MB7984.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/25/25 4:46 PM, Chia-Yu Chang (Nokia) wrote:
>From: Paolo Abeni <pabeni@redhat.com> Sent: Tuesday, September 23, 2025 12:52 PM
>> On 9/18/25 6:21 PM, chia-yu.chang@nokia-bell-labs.com wrote:
>>> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>>>
>>> Detect spurious retransmission of a previously sent ACK carrying the 
>>> AccECN option after the second retransmission. Since this might be 
>>> caused by the middlebox dropping ACK with options it does not 
>>> recognize, disable the sending of the AccECN option in all subsequent 
>>> ACKs. This patch follows Section 3.2.3.2.2 of AccECN spec (RFC9768).
>>
>> Is this really useful/triggers in practice?
>>
>> AFAICS it will take effect only it the retransmission happens just after an egress AccECN packet, i.e. will not trigger if the there are more later non AccECN packets pending.
> 
> Hi Paolo,
> 
> This is a simplied implementation than what is mentieond in the RFC9768: 
> "Such a host detect loss of ACKs carrying the AccECN Option by detecting whether the acknowledged data alwaysreappears as a retransmission. In such cases, the host disable the sending of the AccECN Option for this half-connection."
> 
> However, to implement the case that not that just after egressing the ACK with AccECN, I was thinking to modify struct tcp_sack_block but that maybe an over engineering.

I agree touching tcp_sack_block looks overkill. I think that the
simplified implementation is a bit too far from the RFC specification
and too simplistic to be effective. I suggest dropping this change.

Thanks,

Paolo

