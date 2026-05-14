Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED2230ACE3
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 01:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778721092; cv=none; b=dhjrBdRrN+gcCGub3jzMrYvHXERWXMUW2ObVcrIaY0KGdfWWZvNaa4U+vJQ99hFH7OxQB58hpSBFxfVE3Og5Imv25a6oqqcRg5X4rB44FaWo4p6PNLKAntnUOv1korGco2En27ewyEZdfwbWgFu0W9VLiC1gCCUsjtKdTWyGjNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778721092; c=relaxed/simple;
	bh=ztkBsso23UpsXKr+O3LFaui6uvG8T0h+LZPrqrbSnbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EzGjPWhAdVK5jW+KsWyX5Uaa8+hhH5mq8IBM7SjrSlhNM/AxEA0W7D8LmAXKLfZyngYZqTTFQeTLC/HVBcbpGTzSpLgOFv6lxYntcgPriGH3EHVG9VTTxwpbMdrWnQUJOlvRHWLyxDru5+DfExTOPmjfj7KOVNtbw3pZJw9sy48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gnjmvanl; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gnjmvanl"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-394413a63d3so19131741fa.1
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 18:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778721089; x=1779325889; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gPLC8u0hvKKYM/8QgR5AdV8zrX0b253adiqGeSRKT8I=;
        b=Gnjmvanl+YFBDEZ2g4JNRLlCz3BMG+T8JlQ7GmIJctJCtbuQ45NI0Xfp7m2iOO4Cxv
         6kdJ2/6xFJR6//jlgwnESZyknd1mcU3OTUTh3Lnl9F3ajuHcpI5U7LMgTS9Hh++pQj9Z
         OW5zD1RE+xzKCbtlxAZBowidVmH5RZDJHZZL9SLQGpuhK9lKpHNt3U+n5knUOztlnopY
         FqI1XYqLteGyN1ImwhFe8ddsVfml0TVY9A51UsbjTkdv8bqldYWzLouf/LI840H16hAJ
         aTot2ioSJTXTdZ7xWYHouBVS6EzyUShg5lal2HMxVLP0iT9UGlI6NVFbydB4V9zSbySd
         D3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778721089; x=1779325889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gPLC8u0hvKKYM/8QgR5AdV8zrX0b253adiqGeSRKT8I=;
        b=ZTUTdkkrhsq2ZnnA9grmSsZn1nzdFmksuD4erntHsixGXm/UAk0r4cPWTRPvAROUcZ
         1iFm43JdlvxraaEq8hYH4MGcvRWY/JVwdGaYbx7MdCZP5/cJD9EI4Q8SUaOAJQWHbSKT
         p79QSKMNwM2dWngqGzzaGzLR+kZO3f7l0KTsez2v71FP5IR+4SHjpY26B/baQdm0TsGO
         QKYKpkC0X2XDNBUk7L/qxNPGYRW5NRq8QPKuZmJd9xGomFmK87/mJYUlj4b2o4lTMgqD
         K3NgIIgfLSYuR3VuYXHSF5j5dI6/dhJ8UH2DRvqmTvL65yZyBBVSfXDuuC1KFgF3CzAR
         6VyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9entAh6AgK4mTjpIX9EtZL986G7y552UxJ13Je1SLB8Kp6GxQDe4GvVdHb2k1HcoCRURjoY/bI0Ck=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+zhpyXkFU0RJVHYJbK50XpP2brOEB3MBO3QsScrg1HrNst1xv
	TfQMB44iKL9Xku6q6y7kLpvXG/otWchXTe0CBs5FLKpVVglTErexIWz0
X-Gm-Gg: Acq92OEp0FA32pUDt3to8qqlIRfkClvCRl4gDmUhWANQJXvkjUCa99CRwFYMra8oK5H
	CJ7RCJPYfhE7PXUo9RsDcxpomVN2zIwPYF7n4Xlt1iqTw3iab491eH3ZgSsxjqq3NMfgGoTcAge
	mNzReralEcChJyRAQ+f02B9h/gfzztVFzvkCgZacvG3edxzlbfbBjAdQH0o4MZSFxBs00IA/J09
	UD6KQ1Fiesk828dKC2NbzD5LkSwpy54B2OB0FzXw/1if1qLIpGX+8MofEN0riJxO3o/WCygv6jb
	Z8L0WDCS81TXas9XmEB0CX1D0VVKZZgOlq+kL3SVZz6mET9EP4QLD3LgZ43CBNYdCN6gx6HTB0D
	AEAR/5peIM70ZHZcxk8JKp0TYex+K+PzGaIZJaT6bocGZ+LOYzH0M5OuvcX2O3Fqsbvaxw1Hu80
	Z9XsQvmAB1naXrVQk1twnZUSLPLM++eqMBrGNaCg==
X-Received: by 2002:a05:651c:198e:b0:38d:fca1:4a6c with SMTP id 38308e7fff4ca-3944e9ceea9mr18879511fa.17.1778721088536;
        Wed, 13 May 2026 18:11:28 -0700 (PDT)
Received: from localhost ([2001:863:36e:5104:a331:7451:88e0:34ca])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945cab2976sm2330881fa.20.2026.05.13.18.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 18:11:28 -0700 (PDT)
Message-ID: <4e757864-c062-4467-83b4-1e0d08b68b2d@gmail.com>
Date: Thu, 14 May 2026 03:11:24 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] scsi: mpt3sas: add hwmon support
To: Guenter Roeck <linux@roeck-us.net>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Sathya Prakash <sathya.prakash@broadcom.com>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Ranjan Kumar <ranjan.kumar@broadcom.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260512214703.655633-1-sautier.louis@gmail.com>
 <20260512214703.655633-3-sautier.louis@gmail.com>
 <934b475d-1d77-4670-af10-4f3f2ddad61d@roeck-us.net>
Content-Language: en-US-large
From: Louis Sautier <sautier.louis@gmail.com>
In-Reply-To: <934b475d-1d77-4670-af10-4f3f2ddad61d@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/05/2026 05:57, Guenter Roeck wrote:
>>   Documentation/hwmon/index.rst        |   1 +
>>   Documentation/hwmon/mpt3sas.rst      |  57 ++++++++
> 
> This is not appropriate. The description is wrong and misleading.
> mpt3sas is _not_ a hwmon driver. It is a chip access driver which
> happens to support hardware monitoring.
> 
> If this is part of the mpt3sas code and not a separate driver,
> please keep it there.
> 
> Thanks,
> Guenter

Hi,

Sorry about that, I had assumed this directory was also meant to contain
documentation for chip drivers that support hardware monitoring.

I will remove the documentation from v2 since there is currently no existing
mpt3sas page under Documentation/scsi/.

