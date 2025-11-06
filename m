Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12CE315D57
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 11:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762430191; cv=none; b=U5wWB/pHX8aBB7uYMJpICvtShN8gjYaj0efVN/QXQz99PAeCH24uKEfBrrRIKNI1n5rwPC40H0cRmXF7/oj2GcMCuXjRAzu4QNuuuDyAI0/elaJ1eu76l5cs01FoSrHoHGQyVxEfKPO3NdYTJy21pxivU/nXbZ/H3r2VzDjeXz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762430191; c=relaxed/simple;
	bh=YeroezC/007S9WCZ1zjfYLqrdykQ/FoCz8WVrVp3klk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Uxl1JiOOgjrq+FFzAzuKuqQddYUJX3uvEQSEDICsfTqf3qaiyIvcgLsOwhiBwia96ht0Z+CSqRpj8toXOo+/QzLgyUespeOiGZaV+Vp6ved5oiX9UmdU9/MUIJc9cWJyotuiuJaxmL5a6j4t5EEuUraHv4IQObt1ySKp/DOIvL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kz9m2Xjr; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PHLMlYjd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kz9m2Xjr";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PHLMlYjd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762430188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9le/TR6EJL7OtK2G5F8XjAJfAro4XHRnCrWtY3w0ANA=;
	b=Kz9m2Xjr1sKrbmsF7OIaIUdrHXTd6MU4xaWTJfiowSH0swnRQ35FmVOKaeFFCvqD2TYgX0
	d2FRUzndloPqPnXv3+2rH/4Vc99YY1tt1PVCRCqCtnFs9jpuzkjLDJQ7W7uhzIT6z6dEcl
	ohpBaCke5qoMLUQkXeCYk6F0GUbAq9I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-PkLjqEBWOmqxXEHD3xL-mQ-1; Thu, 06 Nov 2025 06:56:27 -0500
X-MC-Unique: PkLjqEBWOmqxXEHD3xL-mQ-1
X-Mimecast-MFC-AGG-ID: PkLjqEBWOmqxXEHD3xL-mQ_1762430186
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-471201dc0e9so7692455e9.2
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 03:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762430186; x=1763034986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9le/TR6EJL7OtK2G5F8XjAJfAro4XHRnCrWtY3w0ANA=;
        b=PHLMlYjdxUBj6bWlLwLy3L+PAqdN/yWe5NFwfbr/v7b74jWR9C0c8uRC+RGNgKtdZO
         mDBQTBUzwU7mhVOLX9x/jgK8k9blURU6S+X82n1DRDLaosRW7m6/SLbcYfIz5ozAIk70
         Ygtr5s6fgN5rrZM3YQlU+1r5rs8rUPlTV3xV5Ft0m4qfWQAImYfXQAtQn6YTLNdRhkkl
         dCQy5hfiSjnrlfAII/EWMrdXAkQ7BUhQp7exFi3PlAyZ4MxG6DFTfpWK+nZe/X0ogRgw
         3I7jgWVG6qen5ZQvtpwME8mu7+VAQ+1sK/dRNGBPRYsRnGJn1FcJJ76KWQPhEHlADMJ8
         5OZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762430186; x=1763034986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9le/TR6EJL7OtK2G5F8XjAJfAro4XHRnCrWtY3w0ANA=;
        b=KvkpyUc/8RqzllToYRMSWi8ZT5hEBFE+qzekDDY3lHjph6qpgnJeRc+iTlCQdvudpE
         KXWKVtP/7P3ZKIAU5x4YGuq5gpXZBeNa+gK4Ag18uXbKpFCYSCIBQN1y48F10XbS3y4E
         Vj2LsAYUVQ5wHRUTAnLRk0JtrTIn5zwNQog5Ma0FH3ptQz/JcBmtArVSG0y84QwfUfGZ
         7xwsNRMKcrFLKpU///do4IXXaCe2XMxE4I/RlxVKUSQ567Y6/aRKA/qWtgd+sTvpztCE
         8PxkaEAb5nrb5HjdjcAiEKtH08qg3/F81xbIAi2IPyuoqIlBxMC++6jX+TWERh19q9NB
         J75A==
X-Forwarded-Encrypted: i=1; AJvYcCUcOM2LVznhf8Zwtz/UpIcC/vxVOsYyYoQf6andtIYPXKXNsvtdRDtF5Mx59pQ/QnEQTlQLW363gTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdSuqcn3R1YDESMITnxl4oCBxCw5kHcMp19mEi779pCrJZZI8x
	t4ps7LFMVlnWk9RmQzn8bP9f6IMvEx/SWkK0EyrdlY2OWscuf/q4MdSn5AD2ScXjgOHYogfpbI/
	IHDIrv02ZG4GI6N0CM1Z08mNLeC7iKV0MVfTjBmaAXvFMj+cfHEoeCEtN5NObwQ==
X-Gm-Gg: ASbGncsWqVwIRLhUqA6iyEfjO7iPzrxar4E8wvrrs1fAyrbiM4mZuWCt1wyhs8EAfGr
	hUSAN7x+wygYdYhqlqjQPTrsIIcelrGBwpSuA2rG1RAfnGaeeG08zXHtmyQA9ZQTEQy4cTBOXdc
	mT44K9tR2Fv7MyJLOxp5qWvxcYQjSlKVXwFHgDrgWpIJRqLjBpQAg5o4CN3EiVwDOKKvDKpGun4
	YXZ/DCw4j7t0ov3XKs8PRczJ24YKmWj4jwbVD7tBwUKBZws/lPI5TrY5+N22bzSszN0NdtG9+/a
	vJkO5LYkfD9/lVXcMxmp9KZwDiJ19iQ2csNwuKatjOdjG6PslkIwJF0tuiIC+M2VfHidR+Qsly2
	tVw==
X-Received: by 2002:a05:600c:621a:b0:471:14f5:126f with SMTP id 5b1f17b1804b1-4775ce206f3mr53397775e9.33.1762430186368;
        Thu, 06 Nov 2025 03:56:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEeNjObPV82BW3NmBnsDhrNmHHpx+fbtiOXZTi7CtBgVaPdD09D56F002RyajJ9jcqH6Y5d4w==
X-Received: by 2002:a05:600c:621a:b0:471:14f5:126f with SMTP id 5b1f17b1804b1-4775ce206f3mr53397525e9.33.1762430185911;
        Thu, 06 Nov 2025 03:56:25 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477625eabf3sm55632995e9.16.2025.11.06.03.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 03:56:25 -0800 (PST)
Message-ID: <4eef8fe1-b2b8-47c8-a21a-bcb4b75c3a0e@redhat.com>
Date: Thu, 6 Nov 2025 12:56:23 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 09/14] tcp: move increment of num_retrans
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
 <20251030143435.13003-10-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251030143435.13003-10-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/30/25 3:34 PM, chia-yu.chang@nokia-bell-labs.com wrote:
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> 
> Before this patch, num_retrans = 0 for the first SYN/ACK and the first
> retransmitted SYN/ACK; however, an upcoming change will need to
> differentiate between those two conditions. 

AFAICS, send_synack is invoked with a NULL dst only on retransmissions.
Perhaps you could use that info instead? moving forward and backward a
counter is not so nice.

/P

