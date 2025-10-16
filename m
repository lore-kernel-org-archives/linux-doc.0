Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED0E26F46F
	for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 09:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760606237; cv=none; b=uKFePi8U4I+/h6fqEuaT9iHKitvjr8VK94wykLNsARcFEoZTEoHb7qsz/+FQiQ9HVltsK51Lj5cn/NIAvw7lrTZGUF2FiBeDEvUtUwnjJsvju0hpX3no0EhwMZ7LN7FHQhnURBfRIKJ3gaipWGLAMNKca86BdBHofyYmGdooQ9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760606237; c=relaxed/simple;
	bh=gfUY6k3Za1yX/HAAk7zG4178blXNgWT89fTHHoWhQPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MRetC4x0KgLSM/iMdxjdyGPEBAF3qq+FSFK0/aE2NKk0Z4X7hKbtxM3zVVVS29TDp/sOu/79tj5+xOFJ7xrfz4O0R4sf8b9dkqPYLNxcjL+MjZM3WAGhcZ2JqXyikJlKdERIpvPBetHmXd4BQxAeMlsY8icnkWiX9r2hA0tQK8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YjC3i+Nk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YjC3i+Nk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760606234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UPLteLwS/Ol+pKkRNcrWyR6iIyl0F/A5LRNN9NP4s6k=;
	b=YjC3i+NkPHTayS3b759srOGUNUUPkDH10L5CbHKTy3Y2AegOJtawVzD7JXPOUFAOIIsbAX
	NhiMUwp0wcux9NsSDYij6AJTKxQfkdX/MwiTTGMlelSPHclEDV5q5zohjyTYZMG/tkJuut
	GoUuIPLz0ovSA5uU/zNr6sXsPL2bL+E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-araJkymrPC-lFKrBlQ6pdg-1; Thu, 16 Oct 2025 05:17:13 -0400
X-MC-Unique: araJkymrPC-lFKrBlQ6pdg-1
X-Mimecast-MFC-AGG-ID: araJkymrPC-lFKrBlQ6pdg_1760606232
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-46b303f6c9cso5094205e9.2
        for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 02:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760606231; x=1761211031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UPLteLwS/Ol+pKkRNcrWyR6iIyl0F/A5LRNN9NP4s6k=;
        b=NkgO32jHySkXOrTF5FNnNGJMm2w+1bdrnt9NbxHRiCz8xQ6WL/eqXBbw1dj1HkOkem
         KNSUHVML2B0HmBs+6SHK2xDhtIHjoGcxLRL1fjjfPPWSDcNM17VFdKn4kVo2cd8GmuDA
         Mt+/GlASNiwmNluuey2vdCbsiUcrRnB4pzfQIWK/P77SCJzM9Jj3osh4ofAMCJXkUhFL
         re0Y84nFFt8H3EvqyTRbIHXj0SZuUuNndu4qSc33Of55aYdEPi56MjLAUrW+b4xwsEoP
         XHukq2UEw0X90F+YecuJPrRv3z0WNSXxeAFRijYNiRGvbvdPSG295MFP4wdORQcIoT+7
         GxzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4WwlKEOClPdOlNvGcVZIidsX0ebrgrzb/AFG8EczTcJoVmecgbEyQPDURRswgE5w8li84hpiFYyM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb9BoqvLNCk7S/Zbar5IG+FET9VoOob2C58L6EUhhXbuQcGzKN
	GV4Uj9+tgIOSavYYjBYLV7SwDrEYd+9QQQcQVD9S5KlCszrWKuH4+Z7x5Qjj1YGgLED2Y9qw4y8
	dIJ++tdA8jEeJHDWVbONg2tHLXBEJyVx7LF7KXdxysBs3VDDw3PvVUpl43cMWn/DanaxSCg==
X-Gm-Gg: ASbGnctJlmhKBe97hvnJS1QtC1EPayHi0g/MO9Z/FewhijkR4+oOSCC00AAj/ehylaB
	IdhbGI4+VAae+gdxMDOVa6oE3bMMZ+aLqkEL6zLKNF0wzs7iVjQ3KUuGiy7ihJppl9hEUwxWbQm
	VKiurKlIK2YTRzaD1yQILXRIdvhbPQ1QCaFxKRsVEAT/cFE1c/mHxr70m3fynDBjeUXHW3vr5Yb
	k9zFJQd/e0Vr1SAkLxnVQujOvlLYrzKFk/FComqp+okYeSY3qWqmaZwQATV/b4Z+ZJt9CkqQBp2
	8HXB52gJIyl/y3AqOhCfZK69F4Ss4xyurn1fkI8k31WKoV/qMzm7meBddA32OE698TLuMxwMDuT
	ZEDP5UwZWOW85U1AFAasfzFqT49ppI8lO6Z9i68l/HUm+lgM=
X-Received: by 2002:a05:600c:138a:b0:45f:2ed1:d1c5 with SMTP id 5b1f17b1804b1-46fa9b171f2mr222149435e9.36.1760606231085;
        Thu, 16 Oct 2025 02:17:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtQayMfbwHyZG1M7ESHO0HokLA6DuGP71NEXIAOvlVT9W48cYSOggIbCg6sBW0bsUEfsGNsg==
X-Received: by 2002:a05:600c:138a:b0:45f:2ed1:d1c5 with SMTP id 5b1f17b1804b1-46fa9b171f2mr222148895e9.36.1760606230619;
        Thu, 16 Oct 2025 02:17:10 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47114428dbfsm14301785e9.5.2025.10.16.02.17.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 02:17:09 -0700 (PDT)
Message-ID: <98342f21-08c8-46de-9309-d58dfc44d0a0@redhat.com>
Date: Thu, 16 Oct 2025 11:17:06 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 net-next 02/13] gro: flushing when CWR is set
 negatively affects AccECN
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
References: <20251013170331.63539-1-chia-yu.chang@nokia-bell-labs.com>
 <20251013170331.63539-3-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251013170331.63539-3-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/13/25 7:03 PM, chia-yu.chang@nokia-bell-labs.com wrote:
> From: Ilpo Järvinen <ij@kernel.org>
> 
> As AccECN may keep CWR bit asserted due to different
> interpretation of the bit, flushing with GRO because of
> CWR may effectively disable GRO until AccECN counter
> field changes such that CWR-bit becomes 0.
> 
> There is no harm done from not immediately forwarding the
> CWR'ed segment with RFC3168 ECN.

I guess this change could introduce additional latency for RFC3168
notification, which sounds not good. On the flip side adding too much
AccECN logic to GRO (i.e. to allow aggregation only for AccECN enabled
flows) looks overkill.

@Eric: WDYT?

Thanks,

Paolo

