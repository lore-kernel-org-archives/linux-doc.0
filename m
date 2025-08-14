Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344372857C2
	for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 07:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755157524; cv=none; b=FvmpZnEasaq/oa7hciUP1jACNQkgzJkg9mj2MEy+vTaW/unAwvdlFttHIV6xAmBOqHWxeasejt08/OLGtq1jEkq9Y67aHhPppcEjRcBUvp2LV3/Xpvk2f5RffAnb/vO1x/5viLpa5XGdEXkNdHsDpOxiBVqcBWQzHZBwfbDgXQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755157524; c=relaxed/simple;
	bh=KSWLnoTBOlNzYx5x5XVZJ7YKJEDG7DMm3pzboACqSU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eVxXYr6R3sS4Fo4A9/O2cIeOywgLFelHfDOx9nYTY8RoC1EaoYQiekKhP3x/Rc717wfOuSAnR5YldkC4MVJ+7cAwAVZLpYjp92yc+fIjdQrY5Jg3vTa2PQRjtF/ej30mPyI6RI0bHxf2lxBo4xFOWGYhhTQt1g4LQJ1gDMrM0qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ki5/50s2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ki5/50s2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755157521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fh3fAUzpnwErAtwtO1rLAD+DknqFNguq3c79rP/CRi8=;
	b=Ki5/50s2e0zwaPJ5zlepwjwETpgveZE4LACfc0yXXySoDXdrnzGklobL3Sekl6NFIV7Mb2
	spE+7GA0YIN1wdg+Ymt6C9YmfvNY0WRo8WVcICB7icxPO4bVCGVBQcKmaLqo/pObgHtJip
	iylIq1VcDOzZbH05KijECQWOgHj34ic=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-n8-q_0AOPfC2STAXEHhbwQ-1; Thu, 14 Aug 2025 03:45:20 -0400
X-MC-Unique: n8-q_0AOPfC2STAXEHhbwQ-1
X-Mimecast-MFC-AGG-ID: n8-q_0AOPfC2STAXEHhbwQ_1755157520
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a88dbf013so16437076d6.0
        for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 00:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755157520; x=1755762320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fh3fAUzpnwErAtwtO1rLAD+DknqFNguq3c79rP/CRi8=;
        b=qHK+PWHhxJ3mDrHRtJzOzwt3L3YvLSwMb3VkS0M58hQiTXtSAUXUU4Kdh07tJeomCD
         8kg5VrHpdJfyQHF9FI93ZhAqUZJYiv5R5qZlZoVJKRvVBF22w67ZBhlVjZNP8CUlIEkf
         2iJDoGBmwWNENzOgjLvu5QR4mCiEY/2dxx6T4QUthgF0HjDe1lyfsTVLV+m4p4PFoNQw
         mxnlvzlyv6+WcJMzPcieDvOmb3m1NNw4Qb1ugT4Xp1DlIf30h4zQZmB+DMKH0QFUjpgp
         Tsrb9YKpNL0FCiiBZkWW9nQyTYUZJKtHKpylRz4xbdCfRsKVPMHL7ZLAMYj6wXgrscx2
         GwbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbeEGIfw3vkpgBQ+ibPX9BUVH/teZr9ICuu8ESudVpPoe1fpeNofptJpQ2qzfFJ/OTyiFXkXGW+Bs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqvOCR0m4LP7t3fD/y2HhN7GOBkFklbX3OfUfGXBIbkVgOt1sI
	KdBZzdWXH5BVtJdXeJFLLz8EgT6pZcL07vU3B/twc8SH1BbOiLpz8mXBYMhAS/hi+hJ8ac+DlSM
	8DJFvczEjmYEdN/jEuUKdLXU/GDnPiB8NE+Wg7pTTKeYju3ZL+TvUAUJdmNiRUQ==
X-Gm-Gg: ASbGncuxDyFgUC2K0siL42iN59DjUjzTdMMw7AvEH3Whobm9wV/lU2yOU39jSnqHAzP
	jTJIOsiNgWLfiJOAi+FAvCWWJt6guFR5c90UT6O4RHZ5XHlgBY/Sa9BLY2YbGOZdmMHTWcbNcmS
	dhtWhiWksxi2EQYKQkMXR1tocZi8CV4+htG9CjT2+z8Y+4LDV4QSTLcazBMO3/oAkphrfzLGovX
	jyiQp2Yf0NUOnxygwFsWNilsytWTYyE+UurFAebLR409nP3rOI69XVSl75JVboHR+Z2q++JTWhF
	fQtfESbf15VvE2rhB4Su/WUQZTLspvrDZK6zlu4hwTL/QjzZyqA7n+u6tcQMu5x4aFftLZcXEFL
	LBtUxLOGYG6o=
X-Received: by 2002:a05:6214:2aa5:b0:704:7fda:d174 with SMTP id 6a1803df08f44-70af1cf09bemr31867826d6.2.1755157520009;
        Thu, 14 Aug 2025 00:45:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW6lRrp4NlQG1ZkIRQnCbAccBSIpsmnxNsHLJGiUzBCfXvnS33GU0a29KgbaqXmSBQXEvaOA==
X-Received: by 2002:a05:6214:2aa5:b0:704:7fda:d174 with SMTP id 6a1803df08f44-70af1cf09bemr31867416d6.2.1755157519405;
        Thu, 14 Aug 2025 00:45:19 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70af5b0692csm9715536d6.46.2025.08.14.00.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 00:45:18 -0700 (PDT)
Message-ID: <274729ea-8db3-41e4-9dfa-f33e5e65222b@redhat.com>
Date: Thu, 14 Aug 2025 09:45:13 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 net-next 00/14] AccECN protocol patch series
To: "Livingood, Jason" <Jason_Livingood@comcast.com>,
 "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>,
 "edumazet@google.com" <edumazet@google.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "corbet@lwn.net" <corbet@lwn.net>, "horms@kernel.org" <horms@kernel.org>,
 "dsahern@kernel.org" <dsahern@kernel.org>,
 "kuniyu@amazon.com" <kuniyu@amazon.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Dave Taht <dave.taht@gmail.com>, "jhs@mojatatu.com" <jhs@mojatatu.com>,
 "kuba@kernel.org" <kuba@kernel.org>,
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
 <rs.ietf@gmx.at>, "vidhi_goel@apple.com" <vidhi_goel@apple.com>
References: <BL0PR11MB29614F8BE9B66484A478F6F4C72AA@BL0PR11MB2961.namprd11.prod.outlook.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <BL0PR11MB29614F8BE9B66484A478F6F4C72AA@BL0PR11MB2961.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/13/25 5:43 PM, Livingood, Jason wrote:
> Hi Paolo – If this patch series is delayed to the next release cycle,
> what release number would that be and – more critically – what would the
> timing be? 

See:

https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#git-trees-and-patch-flow

net-next is open now. Patch need to be re-submitted and will be
processed with the usual timing.

Thanks,

Paolo

