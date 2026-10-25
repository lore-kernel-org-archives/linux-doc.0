Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792936674;
	b=pFBMZtzfjHFqy5jGGVntEKuvcXNkxsnHlt4R9VU3GVx/ZM76Yj1oFLd1Ztgbt9HLOoA5
	 80xWoSax4zuibcDhxOCTfskOWLwHsPm4ZewtP4mpffLUFfA0gTdFFuAxL99OZy9GKl45x
	 /XWB+Z14KACrDbBPKhenqanoOB4fI4fyptiiB1gqFT92JNtH5TUPgtYSmXewa4aQw8qnH
	 bOECQQV5Abrkvu1jPMj7DCyCW+23v06ilrxj0+8jLqi2gM4tcMeEhPDkh0+aUFcZ7rdk1
	 cxbkiIopjeLYjz3qGGGbMK6EChcNX+yW20VwHZPQvyVH/gyxxIRuhy4b/eLwK293sMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792936674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=sXEhBct+PhNYmN9lYZyMJ4pWfRbHwzH6Rf46QPmY3Ug=;
	b=dRMIQmNRzMzln1KUpjVEMixPPu0dKGInhlMA27AJnGNYnvfmsVh02CYu9JKZ9ZZTYrKZ
	 qaDrq3CfAywBQ9oEO1zpzQUtM4T/QvXRLqxeGhEdZ3yUoGwCFNL7aon7stC/Psk8XJg6F
	 M5WLyMMFW5+Q0I7BZbii79A4jhO8MAy4T06Y1dRAEIOR9oqGYMK2RzgzuAx89EbKI5gak
	 8LGVq7qi4LRj6riBymqlZyfxphbOJ3su07ZsucMa+rSWPBqpw4cctstnISq3UyMG/50NB
	 3PT3m9cIx5iu7MP3iBF3T8gIidD3xlCqh5dig8x3Cz9/dYVb1icgwXyuozcT/n75AlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cZaNp2lm;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FD1606A31B
	for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 13:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09FD1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cZaNp2lm
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-353804b591eso4093820eec.0
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 06:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792936673; x=1793541473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXEhBct+PhNYmN9lYZyMJ4pWfRbHwzH6Rf46QPmY3Ug=;
        b=cZaNp2lmqMZzZ4zqxwOg/YylfAdvi0UI9cps+A4iZdFRXxBcE+FAqGZ8ra3rhNbbkk
         ZAaAK/cTbvgDKdNObP+tewFrPIy0nj2rxrkOer9RjypGIAMQldA6DaN1EA5dRKj8NE+i
         OcihRazayK1/yJGh9PN8WLBWNGiF9jBkib2qPHMAXLDPP3M/tjkJBqcave8gLtbg+byI
         oa1ouMNLZoA9tDDUd6ZhhZ6Jb1bsnQI2VQ7pBwxEmp0r3EifR/+d0EdAc7jhEkAC4jrm
         f0QijZNQkAxG9qCAqThFhhirZx/mIEelwuPNP2c1nQ+qiZplUcXyQ52uvfMpyQWQlLSz
         FPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792936673; x=1793541473;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sXEhBct+PhNYmN9lYZyMJ4pWfRbHwzH6Rf46QPmY3Ug=;
        b=g073L/70dnmR8qeL761Pc3cHVXJXL4leyb2ZgXwUJSgZBZO4KlTcrFCU3Lg89+I1+I
         xzPSfrPa4x63Mg97GvgAC2y1jtDvSKAfomn5dyTRoaF6X6XOxchMneYKNWw+HA7O84qU
         uaSWG4+jhGgIvRI4B+ujsLtJ30Ni9m73NXzWeUstKgxUT6lDNTf7qWpVt2o117ISwvBN
         JM/i2CCjs2s8zNr2L13yDVKR0fvahq2tr0KLnL9/WcFsS7BEK5KTxXcv+snXxUuAOGKy
         2c4r2UX8ZnMvGxOOmCSZewT3/k67j870HAGlIGNCSDxFW/5q2Uq++V8svqV0Bx+MuHKT
         ZMeg==
X-Forwarded-Encrypted: i=1; AKwUvBxwxRn8g8g83j+eIWzrdlD+b8pKaUq3u3l1jg+PFouwNo3MCbgalGxSFPgycoRqpI+cprH7vUcBVa8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFE714Q6nJBV5opPystItRlkGyO0gjczGmHIaz7tV6p6QRea3c
	DpMuRnI82MLUJ3sUYSc3d1zZZjVAw95Y3isX1QPVUfuWw5qyqr9Uf7Br
X-Gm-Gg: AYBFou1e3OQvZOIyJhlNWH3A+liUQMxxRDtktxJFmT1lzEBO6WugUVbWx+CT7iEyRXP
	8Z6mhZqGUkkS4ADcFuXtHBwrcc4ZLMD4tyq5mKYW3FE+p55tQNN3bsFrZfhliQQgoMCoYUSe3h+
	1eIxlYhK3stPxYe6DnvHLWby5WV1ST6g2U3ChslhUBsrYYjQEkC65da/mdH/hNSQBaFiK2GzEwK
	XmpCYu4u7J/0PEJk4nM51GTe9Es3O2MDvXL9O1pLCW1ix4X7mNH9WfrH0MRJNtg6Tw3dqOBT/gu
	/cms+lfEctwavehujV+YYHfd/zcilP7N1eVwW3gmY4Ilwu+7FuXdFsQBapbelV7jbSO+KQbJ3K9
	hyKGKloASDLvoiuB/vfYznoXBreBy4fDNoAWwxOnSx4ce329wyzoH7vPIjCfPYZprz0ST9sYvZu
	rfuRWTCGyjQ9XazA67r8GbhY/4kaFkoEZhg0tVbBCiS1wh42bbRTfdlZZ+Wd0qoRWjL0R0RAhGW
	L8qydjkv/if1pKuUvKDy72a7xAlo/dCzUFCtOFoV/Zm/YZoyuFmmGCZCgXeBQDo5C02ZWGLxZZn
	GCPfFEsOTM/MFQ9svkdStvCv
X-Received: by 2002:a05:7301:6195:20b0:358:eccb:af79 with SMTP id 5a478bee46e88-369e850e3a2mr6198418eec.34.1792936673011;
        Sun, 25 Oct 2026 06:57:53 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d578casm18897783eec.6.2026.10.25.06.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 06:57:52 -0700 (PDT)
Message-ID: <17b1aebe-9621-460e-8e0e-8d4da2912e74@gmail.com>
Date: Sun, 25 Oct 2026 22:57:49 +0900
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] docs: doc-guide: add a guide for translators
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: wy@wyuan.org, jani.nikula@linux.intel.com, alexs@kernel.org,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 si.yanteng@linux.dev, chenyou910331@gmail.com, federico.vaga@vaga.pv.it,
 carlos.bilbao@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dzm91@hust.edu.cn
References: <20261015125644.12908-1-danielmaraboo@gmail.com>
 <20261015125644.12908-2-danielmaraboo@gmail.com> <atQ_mXYNqs4tnDpW@wyuan.org>
 <79dd90f0.11f3f.1a15272eff3.Coremail.dzm91@hust.edu.cn>
 <CAMAsx6eb3X7GLheOaVoumORnvKftFYkU0VHynZYyx9m74+CTTw@mail.gmail.com>
 <40aeaf0a-6e04-461c-a507-52f791b45541@hust.edu.cn>
 <CAMAsx6fk=k1aXT3gvyZ4k8hG9KN+YCmvEc42LGdmm3Y+p2J1_g@mail.gmail.com>
 <8ff98b43-248e-4568-a5fc-6f84f9cdbe33@hust.edu.cn>
 <CAMAsx6fha-ZKkiph+nG14hbNduGs=G3qRjHNUNxLSktTTQY+gA@mail.gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <CAMAsx6fha-ZKkiph+nG14hbNduGs=G3qRjHNUNxLSktTTQY+gA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10/25/26 22:10, Daniel Pereira wrote:
[...]

> - the .txt files in ja_JP and ko_KR (stable_api_nonsense.txt and
> stable_kernel_rules.txt), which I think are for their maintainers
> to convert or drop.

Yes, I will take care of .txt files under ja_JP/.

Thanks, Akira
