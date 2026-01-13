Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54074378D8E
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 08:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768291652; cv=none; b=KYFUwHM2KjXssSykt91Qdu5/7nCvpGk00uZ8KhRS0U77vjYPRsnOw4GqNx7661mgrn0IW421/ZI/BhUvDZMTaum3E1CVDNBObzk6HjOH+8WrDzG9Uaq/ZrJOuSvPW8N5SJ5BJR3Z7wP/YSUYCZhRgyu6/z7jrMkxZAjxwIZUyeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768291652; c=relaxed/simple;
	bh=QqHS8tGSO+lAiUJDu64Fy3Z87MlLp6hIRj3FncezFoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vEhmdhh6yaPIwN7+Ygjhk/eNfMKFvkPvtSZrhf7VgbR5J3aVe2fL48nrVB1k7s+n6kne6Gp7rQa+eKIUGiMSZkCULR3W0xKWcpB/SxufYSSGp4Ep9x+2DTk17+WtCcE/003DBAXds7MZoz4CUE0M705TWSILIpg4r1iRObCmRYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CBz7Dsth; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ed8CfGmy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CBz7Dsth";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ed8CfGmy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768291650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xpFpD/66JMzeRmJEIFuITSB9NnlDWQx+ollnQo+GVf4=;
	b=CBz7DsthE4vc27GB1wvMHrqnNeLj1JTsEyDIMHP4UfexI+5JebCBp7cZ3VJ0wRhHaYKrKf
	8NnErHCaMoNUA1DpAz2IDuY8jN0LrnfuX1a3hTKH4U7g6MPU9NQCyHCQTWNdo4WaYhKK1J
	AqsDWaaTQWGTfSOzcTr64X8i9Zwg5qQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-xOwLo3g9MR20o00HVER2VA-1; Tue, 13 Jan 2026 03:07:29 -0500
X-MC-Unique: xOwLo3g9MR20o00HVER2VA-1
X-Mimecast-MFC-AGG-ID: xOwLo3g9MR20o00HVER2VA_1768291648
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-47d4029340aso74775115e9.3
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 00:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768291648; x=1768896448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xpFpD/66JMzeRmJEIFuITSB9NnlDWQx+ollnQo+GVf4=;
        b=ed8CfGmyBD0iCkq2DLkqoHqtkOvdr3HG7Mll8xuZHKEdRpfXzcPQVONz0+4ffq9hE6
         snR0Qi9dIyKDtDrhH0XEXRGyN/obMzHpXslvCD7B31CctHBVY5TamnJ/MZb+p/LmDXpO
         5akYvGgcebbhmDh094ZBGHVX1tKlfCnVniTjTInXfuhlNnB1MC3FV/UorEcJGFq5pHyc
         Jfp7xu5bZrTqDDG8ankhVybdnnH41pAbe+ynm4jQq3xuKlTHM6d5rNK5h1pty+ZwE+4O
         EaxImmAcQ1n9mtT4WgsM26lR+H283+fumPLLzLVOn4IK79i01yJMZqZBBuB1M6iUl3lj
         Xc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768291648; x=1768896448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xpFpD/66JMzeRmJEIFuITSB9NnlDWQx+ollnQo+GVf4=;
        b=EsU1k8AqazfuyyEDlBzt58750E5gyNELPBJiGTeSPJop6Iy8T2BBS8QC/R1CIYOV81
         mRN+hz1+rrVfVUT+oyHhIRmi7LUqVxd7Ni8qKQhKBWsUxTIzS23sW8F6ZmkIb6IN/CCj
         7WvVcot58xv5zWL0xNCY7M4sQb6zlzosHRJjaZD/XVwUJZ12Yr0F5ueSkwJWxtvT+I1n
         xhfk4hBINQrCFS1y2R+bOGMnh1IMvr0qPv0D43rLv6s+ae3JB+CU+C4qKP7grWBh9s7s
         j6V+PxGJe298vEfffcT+1yf9kPaIc2PyPQLA1MeClmj7pYC1gjm5LT0NCrg8PcNXM9ra
         DP7A==
X-Forwarded-Encrypted: i=1; AJvYcCXZATSrIVAsOqMF7XY91LWIHxegRRvUXxawZo62Y5qKVNBv0dDesZL5NsXtltl7umwur3L+s38lPNw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5fdsinGXsLIQSWzc5uxsp2zqwx8H0EPk20p4TQv/FZ5U6vR/G
	MM1UeyEwW0nbbdUM6BL17GeOTl7uSjxo3UZlNO3DPrI+ZbJeakjyaT/YdLEMJzhDjvfN/fAd66Z
	V56uAFf4g25VRuiew0YX02XEBfLdjAXz5O/rMWfxwNicMEkX2UXJ0Qjy9A4FtPw==
X-Gm-Gg: AY/fxX5oeROWV+eOLUOs2gosrlkc/uld70Iu5lEekhMHcIiwFwJBYES1kbSznWI4yzG
	e7BBiaYQzzZ5DGZZwf7dfOS+zxNvvHu3I8FQjTqMP7FtoN/szT+K2XjR16fuzLTYgROLvA4sVCL
	rIBDN/cZ6dM7F7H42MzTGTUZBdaY3XVjRH9UohVxn0euEUXLn8LmkKmG0fg0pcaW1RZafkAxSLs
	9/mymV6BT/gVXdD4hratj9Yo4GyNhykhNtdeoJwL/QDXtAzwcckM4Ivc5aOn/f7kTjZoDqjz7F5
	J/giOpswrBa6DSYmTTwXCChUiSIZgBwxyuanxLfrY4WqtT6PvbV8Hmyj1z8mZ2eBYnPL1rT3nVz
	EOa8mNrRmXZG1
X-Received: by 2002:a05:600c:4e8a:b0:479:1b0f:dfff with SMTP id 5b1f17b1804b1-47d84b170famr271324565e9.10.1768291647872;
        Tue, 13 Jan 2026 00:07:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOFVjo+JswERF7bNgzNfXDlKZqG+DpPg56zhYUkxZzuUQMa8aCTbd70GGyky4hiW1KBY5XaA==
X-Received: by 2002:a05:600c:4e8a:b0:479:1b0f:dfff with SMTP id 5b1f17b1804b1-47d84b170famr271324195e9.10.1768291647476;
        Tue, 13 Jan 2026 00:07:27 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e6784sm43665733f8f.19.2026.01.13.00.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 00:07:26 -0800 (PST)
Message-ID: <c9fca0a2-227e-4081-b7f9-ea7c2189f6d2@redhat.com>
Date: Tue, 13 Jan 2026 09:07:24 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 net-next 00/13] AccECN protocol case handling series
To: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>,
 Eric Dumazet <edumazet@google.com>, Neal Cardwell <ncardwell@google.com>
Cc: "parav@nvidia.com" <parav@nvidia.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "corbet@lwn.net" <corbet@lwn.net>, "horms@kernel.org" <horms@kernel.org>,
 "dsahern@kernel.org" <dsahern@kernel.org>,
 "kuniyu@google.com" <kuniyu@google.com>,
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
 "ij@kernel.org" <ij@kernel.org>,
 "Koen De Schepper (Nokia)" <koen.de_schepper@nokia-bell-labs.com>,
 "g.white@cablelabs.com" <g.white@cablelabs.com>,
 "ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
 "mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>,
 cheshire <cheshire@apple.com>, "rs.ietf@gmx.at" <rs.ietf@gmx.at>,
 "Jason_Livingood@comcast.com" <Jason_Livingood@comcast.com>,
 Vidhi Goel <vidhi_goel@apple.com>
References: <20260103131028.10708-1-chia-yu.chang@nokia-bell-labs.com>
 <56f6f3dd-14a8-44e9-a13d-eeb0a27d81d2@redhat.com>
 <PAXPR07MB798456B62DBAC92A9F5915DAA385A@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <9d64dd7e-273b-4627-ba0c-a3c8aab2dcb1@redhat.com>
 <CANn89iKRAs86PVNAGKMUgE49phgZ2zpZU99rRkJq=cc_kNYf=Q@mail.gmail.com>
 <PAXPR07MB79845267EDCDAF9FA379B139A385A@PAXPR07MB7984.eurprd07.prod.outlook.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <PAXPR07MB79845267EDCDAF9FA379B139A385A@PAXPR07MB7984.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 1/8/26 5:01 PM, Chia-Yu Chang (Nokia) wrote:
>> On Thu, Jan 8, 2026 at 1:05 PM Paolo Abeni <pabeni@redhat.com> wrote:
>>> On 1/8/26 9:47 AM, Chia-Yu Chang (Nokia) wrote:
>>>> Regarding the packetdrill cases for AccECN, shall I can include in this patch series (v8) or is it suggested to submit them in a standalone series?
>>>
>>> IMHO can be in a separate series, mainly because this one is already 
>>> quite big.
>>>
>>> /P
>>>
>>
>> If possible, please send a packetdrill series _before_ adding more code.
>>
>> I have been reluctant to review your changes, because there is no test.
> 
> Hi Eric and Neal,
> 
> A separated AccECN selftest patch series has been submitted.
> You can find the used packetdrill commit and github link in the cover letter.

I marked this revision as 'changes requested' because I think a resubmit
after pktdrill patches merge will help the review process.

/P

