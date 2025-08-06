Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9852B2BE7B1
	for <linux-doc@vger.kernel.org>; Wed,  6 Aug 2025 20:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754511298; cv=none; b=DpvENGtIYsy65AB/zmpgs45PazrcOlK4WayzdnYanGbFLR9bXKykuDsh8W9hVaEWyXXDZ2JIX7aJFhVDZIXLasSnPmnhnYjH1Hudj6fYIAXkjf1QZZ90W6IRWaIRMQ8YYr4gX8Q+ZOTGR8pwWmXqkg3xjMlQzgXpTKEHWpyHsew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754511298; c=relaxed/simple;
	bh=ZDHpr0+0p20pkDv2mu3Q9yjs57G8bc2Ou1cKrq4mu+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UJieHw+7DrfIpuBPRSIxfzx7Qz5ySLMNaJwWbkAQfE1AyFoQ6p9kzShi3OPZaOMYjdrwCryxeMAi2y/OEcPD2fQ9rmadYUL13bqIJbjU/LB98ls3n1JisoGAlHtpYloC+IqTKKL8/1KKq0bwR5zYvPMmf+IjsBbJPTIdhkZm4QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=BV3X5JA3; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="BV3X5JA3"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4b0862d2deaso3215851cf.2
        for <linux-doc@vger.kernel.org>; Wed, 06 Aug 2025 13:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1754511295; x=1755116095; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDHpr0+0p20pkDv2mu3Q9yjs57G8bc2Ou1cKrq4mu+Q=;
        b=BV3X5JA3dDtbNQxiVnQw1uFN7WwqabrDUNcPeXHfZTHPHAKlHLXxGurjs1DLjmkV93
         tqtLsb8ysYSzBROuOkhmBA/pSY9zwqItwnNaokyLJ+vR+7TXgpz+a8MqzJg+L1P3zczN
         iIVU6OLx92d7v4s+AIEkuX+w79g2pZngaOplGIO71IDwwBANVyaRPgsrpqHXvrHJazT0
         vHSjr5bBkdrHp9SAyiv//bzm5cimoAuNFdmKpPOJNbJ2kZJt4gOvIslC63fhB1G7HrXA
         rTlc1MAA4NRLDHaxa5sX48Jjz5Bsf3p9laLIxUB9aUHYxymqFwyFzRGvyuwPWLJIt1iO
         VF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754511295; x=1755116095;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZDHpr0+0p20pkDv2mu3Q9yjs57G8bc2Ou1cKrq4mu+Q=;
        b=IgfegYBfgtp7RzkGmwVIJ8JexoTsJJE1MTh1dVDtK1V+SdUzG2OLoG8tyFvSO9dAe5
         ZO1sHKhXDpArwY6Gmi4LlHIbBKODFsB9GijrGPY1po4EWO32D1+o9kaM5ps3sUhvh2Do
         6ebqLWhssV2UqkK3mZN4W9T0zjnKzr2yCnJvmb6fNoaCNSiwLFS0c/p2tv7rXfYej+nj
         fb8zTrQTegnIYkqJXlZKgXOLZ8QZ6C4nMZJfy8u0g2sZRAFcJJzm6fYnDBU17Ud2QEGt
         AJ9spXWVMU9IMzpw2L8jHgutFF/i2FZ7OjwwDbJRBgP9y1iqypHrHzy7EBbNMrj6At+M
         rgdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwFQZP2nXgj+2oaWr9gqL65U70Y9DHVL4QSbA3ISUQdOtGr9/Qb981sP6OZn3G5JUF7PvWRllhog0=@vger.kernel.org
X-Gm-Message-State: AOJu0YztrlKGtEiaObiRz3m2RtSPHRpYAHicu5VEVue9cm36HKv/tl3P
	JcP47TADMnnjZjY7RXTo5ZAeDXcHwzg3veC+h7InMmJzbTgVk92fM6orJnRE3M9IdlNxLUTi8AW
	dkOF0gAXDDcifcrhGhERY0T02xQ4aLwYOUg/uzyL69A==
X-Gm-Gg: ASbGncvI5lwsWBdQ5TW35i4X9k8kBpzbXoztV5OHdFnYXoIgzWUx19deZeA3TswYdoW
	QL2tP0eiZgAPE95cfQIMW50HY6a4SdypNwY249OpItJdyvXhU6mjAKwGjX7dKeqIjPhT9RQupad
	thvS4nSDsYrrksvNmE0Ombci8+iqv2yd7e5Q3/PuSrnRcgxnmfrWnPiBVsWCOyFcgrQM7HgFUBi
	Kfr
X-Google-Smtp-Source: AGHT+IG1pTZIp3NhezI/eRT45NKH+mtzWFGAo+1iZoAphp7Sfj8eCIzIiMWt+Cx51Yqtbvyg1UAKQ14ylzy/wQGMu4A=
X-Received: by 2002:a05:622a:3cb:b0:4b0:7950:8cdb with SMTP id
 d75a77b69052e-4b09267f8cdmr58173331cf.31.1754511295380; Wed, 06 Aug 2025
 13:14:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250723144649.1696299-1-pasha.tatashin@soleen.com>
 <20250723144649.1696299-32-pasha.tatashin@soleen.com> <20250729161450.GM36037@nvidia.com>
 <877bzqkc38.ffs@tglx> <20250729222157.GT36037@nvidia.com> <20250729183548.49d6c2dc@gandalf.local.home>
 <mafs07bzqeg3x.fsf@kernel.org> <CA+CK2bA=pmEtNWc5nN2hWcepq_+8HtbH2mTP2UUgabZ8ERaROw@mail.gmail.com>
 <mafs0ectod5eb.fsf@kernel.org>
In-Reply-To: <mafs0ectod5eb.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 6 Aug 2025 20:14:18 +0000
X-Gm-Features: Ac12FXzhqMjLum8cECX_x2Yzk_OzuXfSOe_mHCnoev6H-Zqbf5NvubJCxtWA6gg
Message-ID: <CA+CK2bCwe-9QzEbG60csWAWwKC+XMrv5=3DHOJFkBVLgkzTsEg@mail.gmail.com>
Subject: Re: [PATCH v2 31/32] libluo: introduce luoctl
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Thomas Gleixner <tglx@linutronix.de>, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, rppt@kernel.org, dmatlack@google.com, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, anna.schumaker@oracle.com, song@kernel.org, 
	zhangguopeng@kylinos.cn, linux@weissschuh.net, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, gregkh@linuxfoundation.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org, 
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, lennart@poettering.net, brauner@kernel.org, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, saeedm@nvidia.com, 
	ajayachandra@nvidia.com, parav@nvidia.com, leonro@nvidia.com, witu@nvidia.com
Content-Type: text/plain; charset="UTF-8"

> I didn't mean this for the memfd patches, only for libluo.

Makes, sense, memfd patches are going to be submitted together with
the rest of the series as PATCH, sorry for confusion.

Pasha
