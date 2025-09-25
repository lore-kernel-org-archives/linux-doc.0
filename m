Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5208B1A2541
	for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 07:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758786270; cv=none; b=rbjX0D+WmjptaMwGAr632b/TkjxVS5nphPb+X1Lu2tE/7yICp97LROTikYQFvLHdJHPOjt3LuECsso+jVUUjG2TM7QIOC0Ip4cMmAMzKM3f8KxgSoFDCf2nnHxugLwl7Cv7VUFn7RPbYWMW65PraCPijz43cGTzPtjV8frNK9yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758786270; c=relaxed/simple;
	bh=ugLehOMIQJ+Et15CIYTCGD2MzcB90KpcWiFwRf+O/xI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AFPq4jpqd27tH8i/fN31SH1tPWGU3y81MlxDiQFOR+mdSy33tOCGt1M6Fr6DSXFXZHxgGOEBKLt+64k8nWXOyw2oM7dA5FHyJ4zWFFWKVaplYgDg3MXqAzqXhOISCcTIdulfqzirNs+ZeRXN6N2n3nr6X1uPFV0xVMblHIiJtL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uf2tRVHz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uf2tRVHz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758786267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eEtIyjQBQWhfMNa18kEW2ePRbLcIzRH3NXOv/vzbj6M=;
	b=Uf2tRVHzVz5Vi98CCrtmAis0WlsJfO7MmL8ybjjSsJEXWmCgF6ck+vgeNNAvegP6iaaYye
	ASPFARFzBiAxh8x/9PoV0PMz+pprXQYJei9ixR6S0JBoJXqBttWv12352HfA2L8LUhSgtH
	fiEt8r+LfaS1Dmym/k2jyysVFxNbY8o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-TaTIiXg5OFWHABJ1CWFJJw-1; Thu, 25 Sep 2025 03:44:25 -0400
X-MC-Unique: TaTIiXg5OFWHABJ1CWFJJw-1
X-Mimecast-MFC-AGG-ID: TaTIiXg5OFWHABJ1CWFJJw_1758786265
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-46e31191379so3958715e9.3
        for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 00:44:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758786264; x=1759391064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eEtIyjQBQWhfMNa18kEW2ePRbLcIzRH3NXOv/vzbj6M=;
        b=GNtN+K6n1YlHqyBm2zdOdA83byMK9MwsUCqxFSt/oHACvY20uXg2UWP9GwpD5rsMxw
         vRXSAt8UmSkR7l2YQV0Dwy0x7x6VIeCFvOmTpzEKkmq92TJ9X73eDo1QScOKYvRaJvR6
         s11wVStDEZ4ltiTvBvi6anPKvPY3JRCE833fkBNda+KVBj5jq1maZmHe+ybp/J7QtfKz
         5Io+qCrJx8cSELkmUABuwv/ED++VCrIpHOpaXkE26/9hf4Nq06uy/qIC7C4wHcxTXf55
         Rg41NwNwb9H2XAgUvF6qO2syaAphaAiZtstNIwq1coG6m+Ajlnpl2dv1G1YomFrf1/1y
         2JDg==
X-Forwarded-Encrypted: i=1; AJvYcCWpMvQEcOhM31g7mSW2MNbbcFECvQcxlPPH5HtJ3DCx7g0cXNvFkiGFpcljRPiwL+vwiSLSLuMtdBU=@vger.kernel.org
X-Gm-Message-State: AOJu0YypESohqV4cJGuqnfSqn7u5K2atvJqrkBZojRs1rl7MbjzNjO+3
	LIIFWhgNO3yyOXe3eOvirSsBBAxoEd3sYQ9dxKmQLnuaS2XIiPJcGnPmSlISJUyeBoRz+Mg8Vse
	ilpQt0+U6XcdpQ2/uckPveZfuENGSPay0shk4KGXBCRFzhB46ki947jPflyAtpA==
X-Gm-Gg: ASbGncu9KSuHtquD3j75FZMUAdySKCM5BXfdxdy53MJ0Yih3UW7Cpznv+YIsOjSRsDs
	xnOvVjvp4UnfCje7S6auSHymGSN00Em2j/QobJeZkWS8g8mDJTaXnyLb5JjqMNNeQ7Ck9CN3VG1
	1tz0cuqfygQSA7MO2RKX1XI0pKMZ3umlZGa7WApeHy/swk+wpBNj6obVck2uN5l9cxWbMfksDcL
	mpVHTrcpfE/0+poarFY0Ws5t8T2eGZOzWPnU+M9qQ/DDzeBVw6Jnhz1Uqc51kA/xq/OElcv4sIy
	9+BAhyupLHqtlN6fJzk7pTRZZmrvEmmmZF3/7ohCFaVgw0RFBrQUtc56IX5EQJtIAShnlXP60A+
	7jwvSRgvdj1pg
X-Received: by 2002:a05:600c:8484:b0:46e:1abc:1811 with SMTP id 5b1f17b1804b1-46e329f653emr17736435e9.27.1758786264601;
        Thu, 25 Sep 2025 00:44:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFt7+vuVFRubxJxrOllWmSQM91xay34blZgLFJjzErhlGB9fkTHJc47Tm6tJsYcxZXKKZ/Mjg==
X-Received: by 2002:a05:600c:8484:b0:46e:1abc:1811 with SMTP id 5b1f17b1804b1-46e329f653emr17736175e9.27.1758786264164;
        Thu, 25 Sep 2025 00:44:24 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e33baa625sm21917375e9.7.2025.09.25.00.44.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 00:44:23 -0700 (PDT)
Message-ID: <ce0f60b5-858e-4d88-904f-5f77bbe82643@redhat.com>
Date: Thu, 25 Sep 2025 09:44:21 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next 03/14] tcp: accecn: Add ece_delta to
 rate_sample
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
Cc: "Olivier Tilmans (Nokia)" <olivier.tilmans@nokia.com>
References: <20250918162133.111922-1-chia-yu.chang@nokia-bell-labs.com>
 <20250918162133.111922-4-chia-yu.chang@nokia-bell-labs.com>
 <161c09cc-9982-4046-9aa0-d0ec194daba0@redhat.com>
 <PAXPR07MB7984DC6C693DAED54AC14161A31FA@PAXPR07MB7984.eurprd07.prod.outlook.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <PAXPR07MB7984DC6C693DAED54AC14161A31FA@PAXPR07MB7984.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/25/25 9:40 AM, Chia-Yu Chang (Nokia) wrote:
>> -----Original Message-----
>> From: Paolo Abeni <pabeni@redhat.com> 
>> Sent: Tuesday, September 23, 2025 11:48 AM
>> To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>; edumazet@google.com; linux-doc@vger.kernel.org; corbet@lwn.net; horms@kernel.org; dsahern@kernel.org; kuniyu@amazon.com; bpf@vger.kernel.org; netdev@vger.kernel.org; dave.taht@gmail.com; jhs@mojatatu.com; kuba@kernel.org; stephen@networkplumber.org; xiyou.wangcong@gmail.com; jiri@resnulli.us; davem@davemloft.net; andrew+netdev@lunn.ch; donald.hunter@gmail.com; ast@fiberby.net; liuhangbin@gmail.com; shuah@kernel.org; linux-kselftest@vger.kernel.org; ij@kernel.org; ncardwell@google.com; Koen De Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>; g.white@cablelabs.com; ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com; cheshire@apple.com; rs.ietf@gmx.at; Jason_Livingood@comcast.com; vidhi_goel@apple.com
>> Cc: Olivier Tilmans (Nokia) <olivier.tilmans@nokia.com>
>> Subject: Re: [PATCH v2 net-next 03/14] tcp: accecn: Add ece_delta to rate_sample
>>
>>
>> CAUTION: This is an external email. Please be very careful when clicking links or opening attachments. See the URL nok.it/ext for additional information.
>>
>>
>>
>> On 9/18/25 6:21 PM, chia-yu.chang@nokia-bell-labs.com wrote:
>>> From: Ilpo Järvinen <ij@kernel.org>
>>>
>>> Include echoed CE count into rate_sample. Replace local ecn_count 
>>> variable with it.
>>
>> Why? skimming over the next few patches it's not clear to me which is the goal here.
>>
>> Expanding the commit message would help, thanks!
>>
>> Paolo
> 
> Hi Paolo,
> 
> Sorry for my late reply.
> Here, ece_delata will be used in the next patch series by tcp_prague (or other congestion control algorithm) that support Prague requirement to adjust the congestion window accordingly.
> I will elaborate more on the patch notes, or you think this shall stay in the tcp_prague patch series?

I think the latter would be the better option.

Thanks,

Paolo

