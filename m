Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA31A257853
	for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 09:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760605353; cv=none; b=broJ/PzbAA37fTofB7XbxNdYbgd505i6ThQwn6fm/AvDz1l0jMeDI7RG6wlDRt5rPmH1x0o450I5Z+ZHsd4LDNpRntrMXbgt+/1gftrGa+BknGD1u+JVzjgNaFg9uXmoHt72GVp/rPwiocXab1YZQePm0knF83MHmJ+F3NWHqUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760605353; c=relaxed/simple;
	bh=+AtvyGqwUgALdVZc2SXcYDz/237PjQqovYd5Z7PxSbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RBIy2ReXZGMxhHoNXuKqy8IydaL39qJGhPWWEhE6nUO3RxVRn79qlR60p46gtEdiJ6v7VOXyFtgCuVLVH+MzPo2KfXlGOnQLVJ8qYW9doN903/gowEWgxDX29fX/ZyIQS2kYdRkYehYTYupDr6+MEFwvlCW7pKqQUu+4QkX0ItE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CU1XdXuw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CU1XdXuw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760605351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5GQfxStX9qdjnF8aD6SOVhJPa/g/zUO8yOqhMVk2ON4=;
	b=CU1XdXuwXtAlN5+0UwA9INA9S1zJFuFErCFuDBVib8hpMsHqU+fvDv6znfBqA5++GdNgxs
	w1RS3BWwwhBvlB1kJrTo1XKV7GPfPIC3ktx6VH91l8Yexg5e57V8Z6S3z17PXl33ZKIkME
	iQmRMazQZ53TEa7EIA6RlcMH6phv7GY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-RmbPQaLLPlyhib4962kKig-1; Thu, 16 Oct 2025 05:02:29 -0400
X-MC-Unique: RmbPQaLLPlyhib4962kKig-1
X-Mimecast-MFC-AGG-ID: RmbPQaLLPlyhib4962kKig_1760605348
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-471005f28d2so1789075e9.0
        for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 02:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760605348; x=1761210148;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5GQfxStX9qdjnF8aD6SOVhJPa/g/zUO8yOqhMVk2ON4=;
        b=iaKOt/aXOdSF7rD5vdiBgR5Epq6mifCv0GIgM/grxKI6snNPKW3ZLU5iVUDjM9A2BC
         yoAeNHhNyNeDBQMgieCMngP/OYCko57aanEB/4BBC6aOGdnndIh5kbu3I9Q6cbOwrCud
         BRTRMWlz6FUTMU5PTcXmDxiUrGH1ZphLf5717RQR7oZvGDRXGzdxdeI91id1NffUUMf5
         RrBJPB7+0Nw0BKguH2DfxfD07S9WirXJXCrwGRdB/r6mw5TUC4/zZPLXn1Mzb+srlwkg
         8OqNbAiEeE70BE0gNmHFOC3e+V7BPxH4sxo5o2xN7+faHd4B5ZyT3u1gOWIt6V46wNKw
         /Oag==
X-Forwarded-Encrypted: i=1; AJvYcCWLU5T7JM6Lp58H7ORdHfimS1FX99VxkLR78IBvKVNhioXCv25SQEZ3rTZJ62ibeMOlu/urZbFkjgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq8tL68STCwT+/tEh2mkrCAIltBwiFXT4z7IeLItEKnww3sFy3
	H2DbCGm0yVsKAN+ExArULM8ExfldTqyKvc5cKgFLAzoZgJXKHDlIqaSg+HnwNl4jtdV1jddy7Xt
	LdDLnruJ/W0EvI0qjz+oNiTvYGONhtqy+d5bxKpwGnXztjL8r4I9GD7i6E5X3dA==
X-Gm-Gg: ASbGncvJbUlCa7eNk8yTowNyi/fXaBqGTbILfSxD4FPYHvUkevs4kRgaj2QjTAiX3/F
	I2zFe9Ddsqua/0Zyx0hAuFxdRi6P5mJgE9AyujSMUQniGVGrnm+gU6GjR0vQKyyCWEsI/2MoNfv
	2j7xGM+qKihlB2Cq3KB5DhgV6wLI2kesjRZ6Aij4nGXm7Iyr5dI6KbUqSeKfuOyfQ//Lb1hZm6Q
	Qb31BKUJ+5OErKh+Nml6zEaQXFctBXP7y30Z5LloY/4BIFugLHqRUUG7JKQbUf+J4W5huJBwywP
	JLZfqaWrVJP8rNHxxgvoXgELFf+WpOALPuUumFuGmVZxPi7Cmz3b9XW8eL8iaZbIHKzLUGoM2uo
	mk5zxJntUBctP8L1odyVRvGRx8SG6HZGUeVRq8+h//TF9+JY=
X-Received: by 2002:a05:600c:3b08:b0:456:1b6f:c888 with SMTP id 5b1f17b1804b1-46fa9af364bmr194084305e9.23.1760605348004;
        Thu, 16 Oct 2025 02:02:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBKaKCixlap2LGsrCQoy/ztjbrbjTMc5FWNVc5/WkapPDjvhhGgdyb9Tum59RrTjzgqDuQQw==
X-Received: by 2002:a05:600c:3b08:b0:456:1b6f:c888 with SMTP id 5b1f17b1804b1-46fa9af364bmr194083915e9.23.1760605347524;
        Thu, 16 Oct 2025 02:02:27 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711444e3fesm14977005e9.15.2025.10.16.02.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 02:02:26 -0700 (PDT)
Message-ID: <4042d1da-a7aa-46c4-87c5-736d74d280a2@redhat.com>
Date: Thu, 16 Oct 2025 11:02:22 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 net-next 05/13] tcp: accecn: handle unexpected AccECN
 negotiation feedback
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
 <20251013170331.63539-6-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251013170331.63539-6-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/13/25 7:03 PM, chia-yu.chang@nokia-bell-labs.com wrote:
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> 
> According to Section 3.1.2 of AccECN spec (RFC9768), if a TCP Client
> has sent a SYN requesting AccECN feedback with (AE,CWR,ECE) = (1,1,1)
> then receives a SYN/ACK with the currently reserved combination
> (AE,CWR,ECE) = (1,0,1) but it does not have logic specific to such a
> combination, the Client MUST enable AccECN mode as if the SYN/ACK
> confirmed that the Server supported AccECN and as if it fed back that
> the IP-ECN field on the SYN had arrived unchanged.
> 
> This patch fix an incorrect AccECN negoation of commit 3cae34274c79
> ("tcp: accecn: AccECN negotiation").

Minor nit: with my previous feedback I asked a formal fixes tag here.

Yes, we can have fixes tag on net-next.

No need to re-submit just for this.

/P

