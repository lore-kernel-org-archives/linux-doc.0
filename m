Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934CC223DD5
	for <linux-doc@vger.kernel.org>; Sat,  2 Aug 2025 23:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754178051; cv=none; b=d+HwJfXEE3BAhUv3QEhixkZyey4AUUdDh/hxWtWCm2Ndt5nnzkAr1VTV/FwishXcEMUim4BGdpSg/CW1yBt42H0CmYoBDiuqmzP7a3bEVnxmvYOn7RegiX7Miyn5tnBb7hNkkRynQSMOf/RomT5Cb6F+2xRbpJTajVxGBCr6T9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754178051; c=relaxed/simple;
	bh=JuDgEE+wyALjlXEPLq5/uDToxeWVIRpzyYUtDB1K3fg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AuYe9+d8HW/ZR8sKd8VK1fSY0iYixXUZuzZTPAv3fBoQW5g5/2XVgbzx7phH8Q+noup7i24YSxWa/LW4k7weCXSEkT8ifQxt2e1Cr1aDOeksg/xpWgfTFFbRVUAwcKLSnETIebo+4OInJ2fPIMouSKFeHy5f4ctfBpgnsH03I9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=L5GwLM9P; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="L5GwLM9P"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4aeb2e06b82so8445791cf.2
        for <linux-doc@vger.kernel.org>; Sat, 02 Aug 2025 16:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1754178048; x=1754782848; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1Kwf5emshHgumx5UQOn1IaM+oO2QbnhutbCNNGQmoso=;
        b=L5GwLM9PsG2Nt29xfWCfezz5rV7uMZu7C8ALXsk/0vBvupwhmKLmG3p/8NMJaxHChX
         eotAtl4o6/zWLcdWa1gIq2gwXuygxIIxAz/3r1gXN8hE+xTjEqNzbKtoeMyRhXBGhWsV
         /W55c7d6XlZER4YGMxxFxtxQlznuDMq4tX5Q5D/Uke6ZkRBuXMSEQhy9QKOUhqD8lPyN
         LSCxfFbwGRZJN6EKBBV4QR3RQ+f0amnDPK+53NIaR4vqpdFZELHxkf2G1uLzd9yCPNyJ
         s6lr7hBkXkdFNlK+mtdx1zOsMVtQ8MjZw+XPAkHm9uldWKmoN+ZRoK9LLzJLZaKiOc0m
         ORKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754178048; x=1754782848;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Kwf5emshHgumx5UQOn1IaM+oO2QbnhutbCNNGQmoso=;
        b=YSuxG10RJFHYOYnKLhDLNFGueG/18wAhfiXzaIWTROojhb09hpOOMUZw0YkUB0AB3F
         NhADHTyeApsCj7AZpPx8y56mGEf6Wf/WnZK//IAqjYwNppKvzfZZ54GF+q7nB9hgcuma
         A4V41OefomQR1pHgHXC8e7YN8hPIuJr4fyVx1thojdbLRTyxQIWzZWcdlFvYJCfBn9/4
         YVV+o2NbVsgmpyu/QpMpuLCqhnPRA72pQdQAmj4IkqY/Tx5cgsBk0Bl9tE1a5gmQ9icH
         IXrTg9P90aRA9LIZ+pwCmgv5kaQ2V4GEVvFQw8oHYgJjWTmUgYnkXh2mmrOLaVuJ0bUK
         xJbA==
X-Forwarded-Encrypted: i=1; AJvYcCUUIU29nqhIfKkzrwTbsfCDJD5FM03/O6YrVcOfgHxvayqgvk8/vj/G89uSQeOiQNffI0e1a1d0P+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoQD7TWGZkal8mHgkfYoiGkLeRPegSr/u7S6v8sNSgOZZC7A81
	uxwyTvpPqj5Np+GHi0bDZ1eNATEwU1X4jEPD2ysiQK1WbGFCkssy+1M7faW8GeHE1hXTK/YIpEm
	7uTZsZL5mvxBNE6Hz4optLEiB4hXBXtiIF/925Sve1Q==
X-Gm-Gg: ASbGnctfHjE2aAhZ1SntGzlBXeeoAlHUMFVQt0CNIXAelmt6EJVHKO/CYQQ6pK4CAYD
	EsCxGyD4XKshdKQl8ilWaQQ/xMis8ebhE8zoZ/++31C1ny+46LGvHY/eZQbyzy5a/u6VWAsymNW
	gXkviyt9fZXxubEAf0nbk5Du5kpRiO8+DLZ7ou7hXSWfHPPzN3fNYneis/uNTJjSfRzLeaNdK3w
	RNp
X-Google-Smtp-Source: AGHT+IFpEg+BtKr96Wd9jX6hc7J1lAyOtlKRV5n6zcMT8sF5wnH7KyD9LNxhPu7rDIt4u7A627QHbMmxIWZ6L1slTdA=
X-Received: by 2002:a05:622a:5591:b0:4ae:6a54:b989 with SMTP id
 d75a77b69052e-4af109e000cmr81212541cf.15.1754178048447; Sat, 02 Aug 2025
 16:40:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250723144649.1696299-1-pasha.tatashin@soleen.com>
 <20250723144649.1696299-5-pasha.tatashin@soleen.com> <aIdOcmTl-zrxXKAB@kernel.org>
In-Reply-To: <aIdOcmTl-zrxXKAB@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 2 Aug 2025 19:40:11 -0400
X-Gm-Features: Ac12FXz8HYSIPcbtEM3vy-98nOIq6tA9NVRJ7b2LiTxllNWUeuS6IULQVPJlPpg
Message-ID: <CA+CK2bBiEUqMotOZJa-DuAfZVXYn97F1byvjg-ezXYexHrgLOA@mail.gmail.com>
Subject: Re: [PATCH v2 04/32] kho: allow to drive kho from within kernel
To: Mike Rapoport <rppt@kernel.org>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, dmatlack@google.com, rientjes@google.com, 
	corbet@lwn.net, rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, 
	kanie@linux.alibaba.com, ojeda@kernel.org, aliceryhl@google.com, 
	masahiroy@kernel.org, akpm@linux-foundation.org, tj@kernel.org, 
	yoann.congal@smile.fr, mmaurer@google.com, roman.gushchin@linux.dev, 
	chenridong@huawei.com, axboe@kernel.dk, mark.rutland@arm.com, 
	jannh@google.com, vincent.guittot@linaro.org, hannes@cmpxchg.org, 
	dan.j.williams@intel.com, david@redhat.com, joel.granados@kernel.org, 
	rostedt@goodmis.org, anna.schumaker@oracle.com, song@kernel.org, 
	zhangguopeng@kylinos.cn, linux@weissschuh.net, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, gregkh@linuxfoundation.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, rafael@kernel.org, 
	dakr@kernel.org, bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	saeedm@nvidia.com, ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com
Content-Type: text/plain; charset="UTF-8"

Hi Mike,

Thank you for your review comments.

> > +     mutex_unlock(&kho_out.lock);
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(kho_abort);
>
> I don't think a module should be able to drive KHO. Please drop
> EXPORT_SYMBOL_GPL here and for kho_finalize().

Agreed, removed these exports.

Pasha
