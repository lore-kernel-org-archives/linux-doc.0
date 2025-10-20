Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361AA2F12D6
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 19:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760988944; cv=none; b=R5l65nas7ec73plOcb3cN+QDHzAfNKl8eSQI3mB5kuKX7g0VK7qjTp/3nM+iOaSMDoT3ybpCBamDQeDdlifXVqhEi6plk06GTHGoo6jsJjTvTMFRQh8Z9njuAD/9Kl8zJqHhm7HCV2AxfVQNhMWLElNSJI7MRD3r8VLgmc/FK+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760988944; c=relaxed/simple;
	bh=TstNcT24iidk65qQwuHBm8MLWpw+Rgs03+06matpxa4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ewL8rMBuXZpi54HRy3vprDS0fCjq6QUZ4ot1N3eWbmXcj2nHqpdHH2QHOE1UpHLKxEZwc3XYLO3VGbgMUc2gHtFjkmIPWC+WknMT8l2ToMJK1dh52NfcbGYl+M6ZiAP6jvtM4oFl9Nc5c3Bp7J5Yj8UBnkg4/trl8y8GpDEI7DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U/XWckUa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U/XWckUa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760988941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IZ4KHrVXGbKOyfWQ4VuLHo93xGYeDh1z6yDjQj1rykE=;
	b=U/XWckUan8Y4NRNee+WrFmcITFLpMz1xChjjjSwOfyMd1j5wJD1OmR9DhgR3CNYg8j6ltY
	IepoyMyCmlfGe//X17Z5oSUsuWjY/tjIt7fd17Cbvmwrf9ma+KI4HWS/jYhgvl2xZxkZsc
	mHRZGXi6O7qw+C5v4Mp6TED6nAUCZWQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-cENm87hROwy2mR3JMJUTmA-1; Mon, 20 Oct 2025 15:35:40 -0400
X-MC-Unique: cENm87hROwy2mR3JMJUTmA-1
X-Mimecast-MFC-AGG-ID: cENm87hROwy2mR3JMJUTmA_1760988939
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-470fd92ad57so101003095e9.3
        for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 12:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760988939; x=1761593739;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZ4KHrVXGbKOyfWQ4VuLHo93xGYeDh1z6yDjQj1rykE=;
        b=iGN9TALV8INSw1xqo6ANkLsTbBLsfM1DTfug305vLo1Js0JqusRCGsT0dFod6IjsUA
         yebXaeZLTA774StiQHlUQViFyU9H99S7yLRACaXLpfY0Dr4+ItSKOy5iWqWc1G+4BGWV
         Ws0b8YDfG7x+tnRnwEBqvwsWc2EmH0vxg2cVZ0D1yjwiWfL/8hibnvH6H7ocDYgAAXQd
         GzLftrjk1GpEaK5qr31rSoebr5zS9oUUH6L7RI3zbkVfdDCKVEDcUb3j0RA7kQdlLob8
         eMjm5MJ1jimix2EO+DLb4l0lu1rskjlDP02s8wln1MA8WEEDBQe3shAjHPzdI9KAAj3q
         TJGA==
X-Forwarded-Encrypted: i=1; AJvYcCVWqFzHJ334bxevWGQxce1y0IMQWREspOUeelfGLrOC/8ufRvIeVjedoKkfUVDPc0h+cXytqJ+mJlA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBIacdam+2bQDbGcZrtVlH988F80J1cIB3qa9fukFhkokzYb4D
	9gKmfKnv1soD4jDFWAZ2B/8mocnp2Eqdml5B3wTfJa1efQggLsfOqvdiENRUgBvy4kUVrp86G0A
	4oqHnuQ8QNKb85qQ3uJWJHJOXzYw8JiDWW6nXi3dHZ4e77+xuG3BTCF1ROp+1eA==
X-Gm-Gg: ASbGnctvFDZbQPKZOta30ZGzjEpua2Eu4lqCwPFjgOos1qPdlcWKX6qqpchCwNaI8i2
	qVoZF4HnSu4r59dd/O6Ib+damj3sGBzn56B8+wgJ00r5CQOJzxKZ0dyl+S7z2gD+D9PRA4pc7Jd
	Peyza6YVgc6VYgIg4M9wi5Qy8t0yj6ZEqTBplvUr/xpOnfhSlA6OLJ7ceRP3DWsFn17IL08crH9
	nXqVQHgVFDiB9cLbrDRJ1YjAGBCZTNjJqbJGkSdMk+IiHE0bKs4PQq8JcZYQeLCzzI7ar1P4+me
	fRwR01G5xN9RinyStEjpVfwUnFb3xCbh/4WN1Nmv+E5tDboJjJiLSSpZGFiDTYxHG/P7imgF2ob
	wAnyNw0rs6an8ZxfdpVGGiyrR/BDhUmQESZo5opP8N1BSucFbHFQkl1k37P13duzpizRnbWrNtq
	NH3oWOySrryGmgkRfa0XjiMmQOXf8=
X-Received: by 2002:a05:600c:528e:b0:471:7a:7905 with SMTP id 5b1f17b1804b1-4711791cba1mr138573235e9.34.1760988939345;
        Mon, 20 Oct 2025 12:35:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUD1Q58X1dirbdln4YyEHe+ZrBTn2g3MQBkfJH1bO18P6uDwJ35vA6zo0kQDMsN8QQTSSzUg==
X-Received: by 2002:a05:600c:528e:b0:471:7a:7905 with SMTP id 5b1f17b1804b1-4711791cba1mr138573155e9.34.1760988938928;
        Mon, 20 Oct 2025 12:35:38 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0c:c200:fa4a:c4ff:1b32:21ce? (p200300d82f0cc200fa4ac4ff1b3221ce.dip0.t-ipconnect.de. [2003:d8:2f0c:c200:fa4a:c4ff:1b32:21ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00cdf6csm16661954f8f.43.2025.10.20.12.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:35:38 -0700 (PDT)
Message-ID: <85166a8a-ad54-42d0-a09f-43e0044cf4f4@redhat.com>
Date: Mon, 20 Oct 2025 21:35:37 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 PATCH 1/3] Documentation: add guidelines for writing
 testable code specifications
To: Jonathan Corbet <corbet@lwn.net>, Gabriele Paoloni <gpaoloni@redhat.com>,
 shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-mm@kvack.org, safety-architecture@lists.elisa.tech,
 acarmina@redhat.com, kstewart@linuxfoundation.org, chuckwolber@gmail.com
References: <20250910170000.6475-1-gpaoloni@redhat.com>
 <20250910170000.6475-2-gpaoloni@redhat.com> <878qifgxbj.fsf@trenco.lwn.net>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <878qifgxbj.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> +------------
>> +The Documentation/doc-guide/kernel-doc.rst chapter describes how to document the code using the kernel-doc format, however it does not specify the criteria to be followed for writing testable specifications; i.e. specifications that can be used to for the semantic description of low level requirements.
> 
> Please, for any future versions, stick to the 80-column limit; this is
> especially important for text files that you want humans to read.
> 
> As a nit, you don't need to start by saying what other documents don't
> do, just describe the purpose of *this* document.
> 
> More substantially ... I got a way into this document before realizing
> that you were describing an addition to the format of kerneldoc
> comments.  That would be good to make clear from the outset.
> 
> What I still don't really understand is what is the *purpose* of this
> formalized text?  What will be consuming it?  You're asking for a fair
> amount of effort to write and maintain these descriptions; what's in it
> for the people who do that work?

I might be wrong, but sounds to me like someone intends to feed this to 
AI to generate tests or code.

In that case, no thanks.

I'm pretty sure we don't want this.

-- 
Cheers

David / dhildenb

