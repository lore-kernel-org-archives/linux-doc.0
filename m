Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785DC4C9F
	for <linux-doc@vger.kernel.org>; Mon, 12 May 2025 13:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747056476; cv=none; b=ZnSaU1MMc8tjwRmItPOeMmvjGfwlw9FbgoTRSBdqH02rwXHr2vf29aGiSntxIKoOz72/SkMNkGxLtMgSvxlUR1UWylaNsm5zuXTE44zlhUaxTN5wg8fB4GEAR2M/+/qCa6yy1kC7tCz/twm23ELfen4a7W0yXVSdxtIEXGAUXtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747056476; c=relaxed/simple;
	bh=DVdODhlsrP1j5tCIx/PMlgifWBofH/BtMfVaxUqYkxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S02uUZRK7pdOCb+KvLPtZBqfexhLWyTTwrfssix1yvGFTCnyiUVjwJO/gEzIpzRHH3gdp+6iPD4Eowx5/6epHVXjgrZFkhy6bMJEVhyhSBLj0bJBWzF+o8LqgFxXIP770GHxgFWGdZ72CJXfa4TfmBCGk9hPExP9xbta2c8yyOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=hpaqU1fe; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="hpaqU1fe"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-861525e9b0aso444489039f.3
        for <linux-doc@vger.kernel.org>; Mon, 12 May 2025 06:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1747056472; x=1747661272; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L9IoB62TXP9uOxncdM6rXekXVF+y8UVR94EHCzJIMOw=;
        b=hpaqU1fesSUfIOuetYfKZXAyAJzXsfgpMwOiO4XNXyL7wpTSD9nW7U3SgeIV90ut6c
         ydU2WiQGwljSfQXlL0uM1zUIaGg2l68kdu4U8mLYhmGZ46VRSBw1Knu/nRPEx85+flzq
         RriMyuuBu5ih68IMovaLimNeKVkJQsdGCzxJiCVptFU23yVM+mt2rEmxggKgE1VVF+ww
         Vq5/OIGEHfuGU7RzMJE7vo8CWWMKFBIfbmTg5h4VjVUxNWnZAaaZU+4kHXdkuh4JpSye
         IA7XakvAh40ZbQ+82teo/RzpEGalMhY8vsfVFtKCLE7QWRY8OIUbt2GJ7JgK6Xhmv/5q
         2btQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747056472; x=1747661272;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L9IoB62TXP9uOxncdM6rXekXVF+y8UVR94EHCzJIMOw=;
        b=TouU5gANBY34/WDRNovBVbRtoZFxN/M+aZ+BwbKLSSCC2PsZbBd7Pe+rSD0XGFqzcg
         /4A2TmmeWmKetjvi0MFj7OZL4OZOhglrUsCIb8KtNKXyXCMSWC2+vQA1cuJpfYt5fiOJ
         iFW8qaciq7YfzhN/OlKmDovkKjBkyxcLyyBV0k2LBsFF+AoqD8WV/8RnyHCuDaFYuEqF
         DS9YQ3PDfs7L6TF2rxrVyyhqqD7kYt1cJoB0nbzXYTF/uwxbpXDF6Vyl90Mzm5SH0CkA
         z2sMRf2gztGKq0N19qgsJclicyxdAfnR6qPGUVoLVstUZjgMFErUCSzQx/unjzvwX652
         z/5w==
X-Forwarded-Encrypted: i=1; AJvYcCWXuIPRqJ0GJdeyFLmuu2YMqffU32ZVQcbxu2az2IIpGnwFcaHYqW0J+sgPLfTMVksSjpQaoilhhrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQBLD0NLcvOJhi6pCsPZITjj14Io6DyWMKFffop2VOKfhBz+Ib
	weUCmFFGwTNtXTUsEEZCx2gpDtULSwiZ0W0tQ7aVnNVUyQnSST33Ez5VYb81+vQ=
X-Gm-Gg: ASbGncssNrOAL/4TPi7Ia3nNrhyWiuYdKlwUNS55+9na7hwxt+WS5AXgDBGuTRDh/j2
	Q0m84n9igRQB5fvG6A4hfVjgklhFr+IRHs/RblBEFqivs9xBbluaZcNOGvp0WlmhijVAscT9PmC
	4YyNZYpsOm9foQgmuKibqws4Y3zMGO++YLa1NaEpfAddmA1nUHfMn9DH0w7rBPe1CgOu5hSOkpF
	6xDy0fuEqsUD1JdMwB2RCo3uVzeaHVhG/dnfpYOBrL7rZBYoTD4i0DucLA7mzzXGP5kJ6d89Lqz
	+kTlZQNU2BySYZgfnobobPxxDFfL3eJvBIRmquPH1XIBe2xoRPItnCHqkw==
X-Google-Smtp-Source: AGHT+IHdEysy2QMA5bYJRCGHWcU+SDeS600uChzxsGK4c07DtztUFdTHFIRsMuLF3zs5A/3H+h+iEw==
X-Received: by 2002:a05:6e02:3185:b0:3d9:3a09:415e with SMTP id e9e14a558f8ab-3da7e211974mr161985485ab.19.1747056472429;
        Mon, 12 May 2025 06:27:52 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa2ec25bccsm1330788173.90.2025.05.12.06.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 06:27:51 -0700 (PDT)
Message-ID: <4a0548f8-02aa-4aab-a81b-2399c5393776@kernel.dk>
Date: Mon, 12 May 2025 07:27:51 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] relay: Remove unused relay_late_setup_files
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jason Xing <kerneljasonxing@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net,
 linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux@treblig.org, viro@zeniv.linux.org.uk
References: <CAL+tcoCVjihJc=exL4hJDaLFr=CrMx=2JgYO_F_m12-LP9Lc-A@mail.gmail.com>
 <aCGR4EOcWRK6Rgfv@smile.fi.intel.com>
 <CAL+tcoDYOwmt+MqUouc=7DCpMyR3HfOhycgruX_n3+eKJxqv9Q@mail.gmail.com>
 <aCGhXcuqBDuceCqk@smile.fi.intel.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <aCGhXcuqBDuceCqk@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/12/25 1:21 AM, Andy Shevchenko wrote:
> Then provide a roadmap on the upstreaming the necessary parts. Otherwise
> there is no room for a dead code in the Linux kernel. This is the rule:
> we do not add one, and we do not leave it dangling after removing the last
> user.

I don't pay a lot of attention to "roadmaps" - if the code is unused in
the kernel, it should go. Once other codes goes upstream that needs it,
it can get added back as a prep patch. Way too many times I've seen
promises and roadmaps for things that never materialize, and then the
code lingers for years before it's finally deleted.

So I'd say kill it with fire, bring it back if/when needed.

-- 
Jens Axboe
