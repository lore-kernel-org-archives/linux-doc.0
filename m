Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15BF1AAE17
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 11:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766487603; cv=none; b=KQEL0PvCi6E2GXyGpHoPCmqH3bWz9kqZCIiMjXfesWNAF7YjHoI503bgfneYbxVrGGQnJAN8NvTCTwGeJ13j5PV9tWGYLD/Uohn/CmCUcfgQVbKWayvIzLtyVHeKekzQdS9egUsktFM308NVbKHL6nDgMT4ELWAkPbpMyQ/MYPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766487603; c=relaxed/simple;
	bh=exDMAq/h2GKUuEGGzdMyph1AJA3f2RvGq5OEfZ29ohA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hM0o8rkd1nVj3RJLrnnKb/OP1kWH52q3ayEgm7fnU38GcQwcp2OFnWGnj+zwWhDDa3wEfe8Z2OenK4JCK5wo8RhPAWCwMe5npWtjS6vTdXsLd0LfLNVC2Jqen8IMYMX+JA/pNPT6uZXACN2hf/8II0TkC539pF+Xe2bdU9OzxrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FLLk9nQ9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qbm1Wtj7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FLLk9nQ9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qbm1Wtj7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766487601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7e8prqN9qrQUnG40gwOc6ZnlIPJonuHZkFyNzxEWkZY=;
	b=FLLk9nQ9c/ZXV5PuAHexJWNyGDkDTtzO5MaUsFg2E1JfJVWOfMLbihDyhbP3nv+QOMsSUQ
	RegOVL9tCL39MgWUxnPNGCRejvqoqTod9oq0KKDMvAB1fvICuURPNNdbdMXQzMFp67OZ/N
	ezMhU934ECMIjyWvB1AnMdoso3cufDo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-7sO1F98oO7aw5MtPEbkvCA-1; Tue, 23 Dec 2025 05:59:59 -0500
X-MC-Unique: 7sO1F98oO7aw5MtPEbkvCA-1
X-Mimecast-MFC-AGG-ID: 7sO1F98oO7aw5MtPEbkvCA_1766487598
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4779d8fd4ecso25999365e9.1
        for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 02:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1766487598; x=1767092398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7e8prqN9qrQUnG40gwOc6ZnlIPJonuHZkFyNzxEWkZY=;
        b=Qbm1Wtj70UsmIhEDochVCYLITXRWLbEv6yyGRGuGfeOR9OQK92Zt7LT9bQqd0N/ecM
         A/uGAInttJb3Yk6fFLWqoaHY0E0C5cmGxDJhSdpAOgpRr9ojwaVAKVVP8ZFtkwSYpffI
         MSiBGjyIK+3KsZDiTKZq2dXkJKsKtmRIqjIk8B6VovjqvVHuuoTqqfOgWtCzANo5BBq9
         8VMAF8veO5sCkYc6binPGXlb34TvkGKnytO1vPzYL3sLyNqD+YuaJsGwhEG/tYNzPhvX
         f4UYNvqOcb9/zQEjRgg0QSkmXGVuo4nZVOHKt3K8mXw3VyO84ICjoAXCNzsvrZOwiHO/
         uILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766487598; x=1767092398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7e8prqN9qrQUnG40gwOc6ZnlIPJonuHZkFyNzxEWkZY=;
        b=elGa5Da1Pg65A/VXoXg9Qt8w8P1iSc0EBHSc4GoKG3KprX5wevj3ckREZI3CgAhj9P
         SUKJl6S3Ni/PvC55wIVQJMtCuvqVd9mPBA0kjnf+jLN0+Q1pIlZcahz694w8PCe9smw7
         IKYTAXOf2/LwwYML6dWsmZGIDnsE4D5wbwHFSWEORZqxyarx28eLUHOj3M/AojQnHuOA
         mGkLA6tpSZyql2P6ExX/4XBpVHOGCzErtL41GXeCvqJAdwNQ4f1p1hKN+lF2bHnKuBLd
         2pch1pcjrnvCYPJORNvVvrkOF/jh2KGvXXcw/3i2Rd+3PDeNuWG6iImtxV7fj1bmDONb
         sM5A==
X-Forwarded-Encrypted: i=1; AJvYcCXXXa7Re7FgJPOYGEA8YLYWz0FbW+iRFi6CePBFNBLbCDIXw5lmPq8TULJk575hj1EiYNGLotIQFBs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv5SihcVFdF3XovA2iUmXTOyZa+Knyks1p8FqsGeTwBYe65FyY
	mhwN/ig7872IMnHx8ZrVNsfyAE5No28HnY2KoAmUGNeB6ZTNSs7qxT/PO+x4PFF2wAlGOCePLYb
	E0ngDbOn8YQM0jEaK/MZdcSQYjdREtQzlTg7rrSuqnI7x9/sKFe5jKh3DTCrx8A==
X-Gm-Gg: AY/fxX5JTScea1feMVDDpFVd+XlfVY8SksedIb4HRhyvvYm1VljOJ9lfMSY4ix6YMIs
	/xxL4eKTqJ9cv+UotUrl9+xiIakl4MpaZjX4rg+LFvR4aa8LC/JCGS9c/MR/ELi6sPHadGftqzq
	fy96FQ8e0Xzt3bWF+FznRQgK5QPBkGEwTXFGcFOUjN+PT9PK+ucOEy4Q2KgAntSTFqFgo3g89Xi
	q4WpshWUwSCMlFVY09AJhJlzkhaZW6/Lzlm1Ol3rdWmlAge0Cpl6GEesaZexP1oX7EJ8tHcKqoK
	z9o2xOUUw15xWS36Q/X1xoI/RMjKnZBslCm2VqidebZKKzJZN3g9UtoIRlRSuJIGXdOjkO5FZMq
	V1y8D8WSigvmU
X-Received: by 2002:a7b:c454:0:b0:477:7588:c8cc with SMTP id 5b1f17b1804b1-47be29adacbmr116656215e9.7.1766487598068;
        Tue, 23 Dec 2025 02:59:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkrQ8ropbitAp5IN6grRc181zuj+oDJatbka2bonXqMH16VVO9pVEQzrfe/dc+B1EkcHXjVw==
X-Received: by 2002:a7b:c454:0:b0:477:7588:c8cc with SMTP id 5b1f17b1804b1-47be29adacbmr116656075e9.7.1766487597685;
        Tue, 23 Dec 2025 02:59:57 -0800 (PST)
Received: from [192.168.88.32] ([216.128.11.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be2723d19sm315996975e9.2.2025.12.23.02.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 02:59:57 -0800 (PST)
Message-ID: <90e2fe83-c8d5-4948-b06b-3bb5161def1b@redhat.com>
Date: Tue, 23 Dec 2025 11:59:55 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: docs: fix grammar in ARCnet option description
To: Abdullah Alomani <the.omania@outlook.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "edumazet@google.com" <edumazet@google.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "horms@kernel.org" <horms@kernel.org>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <SEYPR06MB6523D44E490FF177C47BEEBA8EAAA@SEYPR06MB6523.apcprd06.prod.outlook.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <SEYPR06MB6523D44E490FF177C47BEEBA8EAAA@SEYPR06MB6523.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/16/25 2:15 PM, Abdullah Alomani wrote:
> From daadb4f6826bf2d5369acbca57b570269010c761 Mon Sep 17 00:00:00 2001
> From: Abdullah Alomani <the.omania@outlook.com>
> Date: Tue, 16 Dec 2025 16:00:35 +0300
> Subject: [PATCH] net: docs: fix grammar in ARCnet documentation

It looks like the changelog is mangled, the above lines should not be
included here.

> The sentence "It following options on the command line" is missing a verb.
> Fix it by changing to "It has the following options on the command line",
> making the documentation grammatically correct and easier to read.
> 
> Signed-off-by: Abdullah Alomani <the.omania@outlook.com>

Do not apply cleanly to net, needs a fixes tag, and the target tree
('net' in this case) specified in the subj prefix.

Please have a good read to the process documentation before the next
submission, thanks!

Paolo

