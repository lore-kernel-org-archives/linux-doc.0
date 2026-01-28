Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DAE4086A
	for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 07:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769586259; cv=none; b=uCdaKJZ5TxpjMd0oZDcAXc4KpPT/hg379TbY8nNydiP+nOUMPyqB/TYOVsB0Lvr9G/dzqOGqFLnsEUZi/UVlZ9Xu95Ey6R4O/xB60/TOnpFiA/I1SlIJ02qXQSbZPRv+0pIZfm4BRu1xgnhfsUUSoao/nc2hAyUcEuX/GV7imUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769586259; c=relaxed/simple;
	bh=1sqaxyg9uUfww2vS/d6/pDwRt5NvTGwpHUEkBH22Jkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PnvarphdCFOAToEvxh1+U10LVLQzGQbhC9Ytt20HlvJEy/jiOY9AsHbdaiBNr9IqEqsdxgYZAT8EluJBQv8RoylKf/QhLYiJ5M9coox0eISi4Zz3H8J5Daoljpy/y7EMiVRedsk0KpHzHUzSuItX/xaYPtOfb0gYcFFy3GJ4Ua4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fl0t/UtX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gt+bxbDh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fl0t/UtX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gt+bxbDh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769586257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N2r8/rRraCmZGhd+qX9Y3lCkPKausqhtTQk0k54UGaw=;
	b=Fl0t/UtX00QboYNogMlfPyq7ScJLQkjZEHGJotg+Q0i/UjnOUTrujFDOFIhy+euFQVEMEZ
	pl73dCuAeLyjLpQaJAudPX3RbZ/EgzPF/CDUgOt3QVsV/+7RdxXjcrc4O7ocMXE+IAazEP
	vnOsbHPmV3zhKYcq3jR4zkx3YwqnXEI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-a4Jh00L-NxmuDkg2Ew-_kw-1; Wed, 28 Jan 2026 02:44:14 -0500
X-MC-Unique: a4Jh00L-NxmuDkg2Ew-_kw-1
X-Mimecast-MFC-AGG-ID: a4Jh00L-NxmuDkg2Ew-_kw_1769586254
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-48070c21420so1066525e9.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 23:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769586253; x=1770191053; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N2r8/rRraCmZGhd+qX9Y3lCkPKausqhtTQk0k54UGaw=;
        b=gt+bxbDh5U2i8qh8qd5iT8lTAuLyg1777UtIw/jUElitPWiQV7XztvS7FqeBz8tc1H
         B26eYiAYsC753cKcSNkTD3fPVbeVyto2evz5ubqqnaxkl0/MHlL85QJU3jqMsgDEUZCc
         q0BbCqHDW/p6b8d0EhxKRJdW7xP6RSIeevn5B1oZcqyNj4VK6aI+/DkMnS41NRPnnEN/
         oOjO5aQIkJmMNFDseo6TfMoH2c+Wlp/qyRrgl7ZgoGU4B7IAZAvoCra+Z2APo4f7Xk70
         QkwcgSLOr+NSIOK5oVBtG05OJAFAQLJVm2h51sNt1IjLaPrYYBROCq/ajQMCObLPVCdz
         JFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769586253; x=1770191053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N2r8/rRraCmZGhd+qX9Y3lCkPKausqhtTQk0k54UGaw=;
        b=HE58GUUfPQsSk9Q5O6djKbCMIqRKT0xa01RFnuy0j6GDfwimEa9lyVV+XcVYbYc0WF
         sgqAVqwlKH9p+iOZe/aGFdWHovmbwuOyMi21aNSckMgTAY0tk4mDTfOdDaFDRrRA+uzU
         3w5QZIwQz0bhH/BpFI8O/BNsWVsziUaPlwtnnFhyEHjaRT5WDMb2sKDIb4J0FFIOPiwF
         8aQYh7kHOER7pf82lc3MQOeQGHDk8N9LzkEp3LbJYbuTAXiw4oVHzm53ippeG00X7RWi
         AY7kMr30EbjmsCfsk7k0T9OcJf8Nx0TIRdBNH9S7wfzb7nI2dqRBODu1l12w1FjcjW1W
         lpuw==
X-Forwarded-Encrypted: i=1; AJvYcCXzFfWOQ8G6Wex2TzhvLyaheyXcTbakTvo4NBRZN1ulj9H6EGReREg5N9Z3cAxLs96U2xav6H0gSys=@vger.kernel.org
X-Gm-Message-State: AOJu0YywX7FkjCpgYUuRgtpKCCi/rgBJCaojNT+UsZkNbAZWp26uBLqI
	5uGPiHGCNvpvWAqJdt3JaxH2ruN797NTc71jEJ7NAg19Apqg9JVijTCCtlmipR8oMgmfSmYRUzp
	anp84G7VJ/aFyZ9tIHiw9mSHv0FMLncLlFlvegeBdoZC+3sIiVdyR+QVwXJz2hQ==
X-Gm-Gg: AZuq6aLgN5KD0f57z9UEJK9tEulXhmGxZ+ojiUogi5I2hvnHsp5O7GrdZmMbirLhjdK
	3oKJBIfxemvVu5OTIkbUsKTcynuFyZ+rAw+zaeL9dYI48vEUakJvGP6DVETfCyqUAp08i6jMckL
	Kve3u3FeGkziUuHSNlP77ZhSAiNMjLzw7p3SMmRDcd3KOF9mGbWFW5JOu4WpV3ik4rcYNj2FvY9
	ZJOYMNnSxpY/kND5RWAQDx65152NbXVmdDyYBPRqGCKHcrw7Te2HABRn86dyQNAZ+wsH0dp1EzO
	Nn/rSvTRWpvXz5ePWD76TLMnkRhCWDD73fRIN51iP1+WL4RaVm59et/lcF0Onki2wQgRtCK7K9U
	SFsphnKAnxcPb
X-Received: by 2002:a05:600c:5742:b0:47e:e0b3:2437 with SMTP id 5b1f17b1804b1-48069e24623mr37363585e9.5.1769586253603;
        Tue, 27 Jan 2026 23:44:13 -0800 (PST)
X-Received: by 2002:a05:600c:5742:b0:47e:e0b3:2437 with SMTP id 5b1f17b1804b1-48069e24623mr37363235e9.5.1769586253131;
        Tue, 27 Jan 2026 23:44:13 -0800 (PST)
Received: from [192.168.88.32] ([212.105.153.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c428basm116931625e9.12.2026.01.27.23.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 23:44:12 -0800 (PST)
Message-ID: <13f7664e-af7e-4c78-ba0c-b58b3ab59075@redhat.com>
Date: Wed, 28 Jan 2026 08:44:10 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 net-next 10/15] tcp: accecn: unset ECT if receive or
 send ACE=0 in AccECN negotiaion
To: Jakub Kicinski <kuba@kernel.org>, chia-yu.chang@nokia-bell-labs.com
Cc: edumazet@google.com, parav@nvidia.com, linux-doc@vger.kernel.org,
 corbet@lwn.net, horms@kernel.org, dsahern@kernel.org, kuniyu@google.com,
 bpf@vger.kernel.org, netdev@vger.kernel.org, dave.taht@gmail.com,
 jhs@mojatatu.com, stephen@networkplumber.org, xiyou.wangcong@gmail.com,
 jiri@resnulli.us, davem@davemloft.net, andrew+netdev@lunn.ch,
 donald.hunter@gmail.com, ast@fiberby.net, liuhangbin@gmail.com,
 shuah@kernel.org, linux-kselftest@vger.kernel.org, ij@kernel.org,
 ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com,
 g.white@cablelabs.com, ingemar.s.johansson@ericsson.com,
 mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at,
 Jason_Livingood@comcast.com, vidhi_goel@apple.com
References: <20260123100721.42451-1-chia-yu.chang@nokia-bell-labs.com>
 <20260123100721.42451-11-chia-yu.chang@nokia-bell-labs.com>
 <20260127120957.76e52cc5@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260127120957.76e52cc5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/27/26 9:09 PM, Jakub Kicinski wrote:
> On Fri, 23 Jan 2026 11:07:16 +0100 chia-yu.chang@nokia-bell-labs.com
> wrote:
>> Based on specification:
>>   https://tools.ietf.org/id/draft-ietf-tcpm-accurate-ecn-28.txt
>>
>> Based on Section 3.1.5 of AccECN spec (RFC9768), a TCP Server in
>> AccECN mode MUST NOT set ECT on any packet for the rest of the connection,
>> if it has received or sent at least one valid SYN or Acceptable SYN/ACK
>> with (AE,CWR,ECE) = (0,0,0) during the handshake.
>>
>> In addition, a host in AccECN mode that is feeding back the IP-ECN
>> field on a SYN or SYN/ACK MUST feed back the IP-ECN field on the
>> latest valid SYN or acceptable SYN/ACK to arrive.
> 
> FWIW this series is marked as Changes Requested in patchwork. 
> I don't think I did that, IDK why it's in that state :S

I was me. I went over the AI feedback and it looked legit and relevant
to me: AFAICS the listener socket status is wrongly updated instead of
the request socket and likely corrupted.

I was sure I sent the feedback email before updating the series status,
but I see it did not land anywhere - PEBKAC here, I'm sorry.

/P

