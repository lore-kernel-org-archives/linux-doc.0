Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612345;
	b=G0Rp/iGIumL78EfOoCW4zp+ptnhGu5/4TffYLuF+kB0pxWci5jnTME0Ok3mjuJJf0JCq
	 I+vh88/ebDV2S4Me1t5W/BLCvlCSfI2YUNJyvQPrVmr7EHpfSM+U1AcMyp2+/GNKAluMI
	 F3vd7Uz420b32OCqVMeDTazHT4cYZJj6sAPpfpM4P0vxX3CRGIops2md5NDUYz2m4777Y
	 ACwBXv9yz35OsA6GrOwZ9q6jZCYFZI4YE/POKavbgF4qB8yisNWLcsjcUiZFyFGFa5iiu
	 2JHyTeQb4BrQSvGykwxKh0bF0YO3OyH300UC3XAVzS+yCvViQS7FTpWcRunna7lkJvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=CSy0760iv92AUsgP20PxMm7qkWdFkHwobtNBYYjUqJ4=;
	b=SFiKN5mk1PM3iTcbFbFpCCyDR9ioJmae/NoWgNEq6amyeWCk3+PLuFiJq9KjfxTiycT1
	 pR8NKsSoldp1ONWl56rWKY1b6mO/agWtnbYp5KSJjLL+HUQpkbMOJ8bTmdby4MJJJDSL0
	 fKK/By+9IkLp9UnuzxlY8ibKXa76A0a9LET2wCgl8LpCDcVe1mZ/F7Ns3pMBVrBxcidLX
	 nOkv4bWT/1DwqidOW1fvZLzqvE8jPQVIyMv7gAdX5Sn6xWF3k1vviWX6xj2tbIatJRLTf
	 C+a4+gXDYo60AqpbDURVFlhjOyO/LsaNMJk57PZSBvjUYHV7uB4j2DRnsQWq4mS8Zgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fzOaOKNR;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA47D606A32C
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 13:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA47D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fzOaOKNR
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-55c48582654so64750581cf.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 05:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795612344; x=1796217144; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CSy0760iv92AUsgP20PxMm7qkWdFkHwobtNBYYjUqJ4=;
        b=fzOaOKNR08ayDz631qIR5YM6RbDX4cXMRZT7PE5kvvn/ZKKFy8OqDo0kxL/CGZipfh
         yXsGpHHPH7x4KIMUFiT0hBdTKg/FHDQ+cFEBZ56hKsPDzqho3JjjnjCYeAOgQuhqrCCx
         Kyuv2Qgb2LwbL3/jeN6fbvh05cZA5VXL+0kBnF+1toR/jZjXSZvEN7CM5ELf3o5aREvn
         Eluy+jaX3sWqlm/AYzmzvCNEWh8yt3FwyrbW07O1L9zQIfpd2BGAQi/jkH+nk0STPApP
         ptq4+5w9OImGltbnF0OW7sw20wlbr2yCaaAbLC2GzlR8rCvoWGScBAMjYdoKnZdgnhiD
         xAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612344; x=1796217144;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSy0760iv92AUsgP20PxMm7qkWdFkHwobtNBYYjUqJ4=;
        b=2yp9fuR891Z2mvBNo7G0nMLFmtTn4BY1SpOwHEI2m+QNwkLigTPQYuM5j3EuVBo3VP
         A11pTtDA3qSMkLN6reJLbCxs47LJK/hdQvNjbas4xN8Z8Pg3WROuI27ctj5n4+xWgu1G
         kGGLQ4HzOIy+KCmskdVcahxr313zzQH+rj/A3LD3Wlv8hJiBBCt5tFARUxxyx5S9Nn6r
         7SaG1ulBBBa4/t+vXHxZiFwBcLrYPSVAUWgqOBzQwvcRQKntKfm/RrXMYYJiX4SFWSwa
         PrRmkCiEGEfIYUonx59YKfyVmqlq2X7U68bn63lpLycMOTtoRZg4hIW6OZ39tiiIp0Ba
         W0nA==
X-Forwarded-Encrypted: i=1; AL+hErEoZMriR4Vk9N0C0wa3I1H2O9sa06PizYZBHTTM7cbOt1Jec9JqsQ84+stZbJWUxBASY6um38dj8xU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DlR5z2gP3/LC3Siil1QNq7uI4u1MRjIB5l6+PV1i490YEn1sZ
	x1h0TuxdKmslv9WcPdH6EisZ5SEGQqR4lZdzQEcVlExnl1zHHFVVCgo=
X-Gm-Gg: AZFdTZe6jxDmjpMEMyg3cVfk6rdw2jGV9K+K03KdE3svAsxs2eJq9jQdwuBopajJ9FI
	aLNPx2aXB6ntyEMsWnjVCtTnUQrrMQhspe8yDG5dVaRJqDnqz2Tp+EJEiuIEQMwJAVjzc6SJjEf
	CxdNkEVZOirNkKcoiJZE+I3H3yLpENgydo7VV/ZN6wQDRw7VOJsrgp1jnW3XC0vh/BqB/zWvbbb
	Qxmi2J62K0GlHkEZ5OhTnNQRdaBCJiT+7aiz5yYpnN2lJVkl/3nDt3j4/x9oCWCTnAIHo/iYtdw
	LlSQ/X+EdDfp8v0YMoRRZYRmG6Gs7WAOArIiThOr+cYGxFdWVvvA1MpVmwFy33oEVdAFefR58xI
	eQHeptlCJk7WeS+xmnzbpmZUoRICmFKwc2lj3o1p6tBXWRGULClIS0/qTX8rta1H9v0vscBNwB9
	nyPWe0LKnYhYZ/cD/8U5jkqcvdw91Xjic87jEddIFeG+r4EKr3s/fuqCRhBiTv2JMJGzha6fq9q
	jqbdXKCn7DamRdKmYFahSLYjp8OADSIL9W+CtQ0JVlnBPjBDbcor3a2C6jpUReOjnyOIN1OJ6ez
	39gqfwyEOm+7sVO/+PGFFnSA1VjpUJl32la6xSAL3YU5z517CXLlBj7MKDHJjLw+Iu2krY4IAo6
	etni3e67jOfjJUNoHxbHUlj0KBJwXHfeyZ3iJxjA9rEcg5jk4BX2+dN3BPkYYbPuNsSeGGw==
X-Received: by 2002:a05:622a:410b:b0:535:157b:ea22 with SMTP id d75a77b69052e-55d76ac5e33mr308582181cf.40.1795612343642;
        Wed, 25 Nov 2026 05:12:23 -0800 (PST)
Received: from [127.0.1.1] (207-237-119-98.s2383.c3-0.nyr-cbr1.nyr.ny.cable.rcncustomer.com. [207.237.119.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889f8b6sm155981971cf.28.2026.11.25.05.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:12:22 -0800 (PST)
From: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
To: david@davidgow.net, brendan.higgins@linux.dev, corbet@lwn.net
Cc: danielmaraboo@gmail.com, raemoar63@gmail.com, skhan@linuxfoundation.org, rdunlap@infradead.org, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2] Documentation: kunit: document --summary and --failed options
In-Reply-To: <179558107134.36587.13120861622026385297@gmail.com>
References: <179558107134.36587.13120861622026385297@gmail.com>
Date: Wed, 25 Nov 2026 13:12:21 -0000
Message-ID: <179561234149.225312.4673144866194884043@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi David,

Thanks for the review, good suggestions. v3 follows with both.

Thanks,
Eugenio
