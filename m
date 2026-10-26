Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792976100;
	b=QNXYh7pnycKhpN3g9CLFtqYyP0W85yllT1/y7yTwGY9ZLTTwiPU5TF91IgP1YujCsbR9
	 4rDvZddubyTKamn9j/vyUprke/5b6dhXoZnL+wCLhYu1QLXR071Wdp7/Onx5ucgbTqozZ
	 Pvc9SDmpsIsq0fPxBn3d24+pMCSvdb5Yzs7X8ya4DA4s/EQvvJWLZXggj+PU4I/SWAA0c
	 ftp29KFFwqwOMMFRnlPTjio3III39x2GlOSVxp5hSYjDfzK1aX7nOl6cU5F3EX9vyw12l
	 kUjLGGTqOdm8ZXEmb/swbf1kqsqZnLYPQ0mmUfwvztUfGP4o+BO8j+kg1wc4YxqMRVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792976100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xtkJhtt7gdLqfyFrDYEU8VNnmv2Kks3hOhntWWSBmiU=;
	b=YAuebt7QYlE2W4JA2UAw0LP0hAj4LJTznZE+mPwrIPVxyf3tY4JSsMYgIJa2RIlNDRvk
	 EQUQFPBPD8NEPUqj1hHHYXLnwxbfSIbl4b1FZJGKEb19xFpiNKdiUpxR5n6cN/Me2ADsE
	 7BhXVpaSn7s3F+fhWWvn0yEp6V4aCzTp6D2qkN+q816T94eEAQM6JOVq+tHVWk8lGKLA4
	 ldJYYFBwAewGqwPaJV8lHNXm4QLumyAMO+59m6zwus+C00y0hOqa+6MuaytKxcN/f3tfY
	 Qd1tMLs9Kt9vNFdk3M4706fT+a325n4dc8SF9y9Th4m208DadX3weMcNV0n7nO8oUsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EFGdjEVR;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F34606A31A
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 00:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01F34606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EFGdjEVR
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3acc96a256dso1319944a91.3
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 17:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792976099; x=1793580899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xtkJhtt7gdLqfyFrDYEU8VNnmv2Kks3hOhntWWSBmiU=;
        b=EFGdjEVRT2z/k67XUVC38GP6b/AGdWOpLn7fRa6nt/iR7JGqEkm3PEToqMj0f2/Y6G
         EUkccUd52ztIX9awbfA1n7L4ZxPOvHPmHVwTZVWGhjQ97aydmZTDk8njTgRBC3YWanx3
         oaEube4nR7uIhFYE5mXCd4S0nzkFI5JIf7ZbsMqkSSHwfnPZcbRyQaKuyHRGAIyu/EBV
         xN58/WvdgygP7w9pjO+1mb654v+cy2CPWn+byXVoSQEj2hPL17HDipXyCIXLUXhinwRv
         m82OrIqRC/z/f9f5Lkoy4Gz5b/rlxwhUXKkiW+ecay/CVlmY5IHBbFEWvbDsSxCM2HWf
         UW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792976099; x=1793580899;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xtkJhtt7gdLqfyFrDYEU8VNnmv2Kks3hOhntWWSBmiU=;
        b=CMFbFHiAzJqMG7+klLWpqTLKrlS1o3hvT/90bc5EAoCaLgo12k9h/74CWi9XYJQ/AL
         Ys71OBAhf7+wgzINH+8L75MiKx4Hm6szF92sdm4RaTyHyH8lCgv0BI+4Qe/wUXVxnQQa
         Val9xPNRO4iCS4uHfCUiaZnJnkxeMu7cicIKsbHlzy0oG0r0M06sfFv6toD1rdAltOOH
         QvzNghDlxrr6Pbn0d30s3mC8efWVuMh+8Y7U7dYtXgE3F0cPg24M+rC1s6+Z5Bsa1op/
         5ZQO51s3zqIc590o2iiS00ziC6GRRR4r2661svL8ZNvF4SiL+/5dt24zIuHqdWjUVJKb
         matA==
X-Forwarded-Encrypted: i=1; AKwUvBwTeC0OovNNMtFgIRZolaqxSdPIyLgEz8gNIqaX4HykYWhYkbQ+lqYUC2Jy80CELCcuK6pMxPvOYJY=@vger.kernel.org
X-Gm-Message-State: AFq9FYInGLVdXkIs9DQA9K+hV3eNU6vWpMEsjDkwy0owdI1nXj+qzfrA
	7EN47/8NV3aO9vFi2oOYTD1Z1OzkcMATcKU7nWulq3sae04sAJR9q/P3
X-Gm-Gg: AYBFou1w/6zrLVjoz0EQsxpzuQNxg6jB6R4pFbBMLVpDLiQSWn/jiGKS6drUU7IXusf
	6QIUL83Wt3K7RMGxe4LMmfOambj7uXaSdnMFmXpX/MdDfJOmb/mbVnSa3pdv/IXxklKHj9El9Si
	k3JHk5pzgAo0A9tNy2ivtn4PLzF93b6YbZXhO7MOH8b9Gg+/rcU3hfjn8tvx3EGwlWUuYPicxZH
	gYqq1+EuK4EXlwegcKuohLiTTaln7iKSxlQVhx/n58H3B2rcejJuoZmwpdNF9BwenhniK/BmYpW
	KZdk2MeFQO7FFLgWKE8iOPAXP6EFosLsXADjj8de168vf23nSB8WEpo1QYnL7c3N8i6pnoHCba/
	yw1IcKfxgg2NXRyH5jf0dxdFz5gU1ph3hOCwQUGU9RJ/syxbuijp5Qjpf3r6eNMrCp8r/ZG0QCC
	PI9vIOJ6XwDTUCSc7Y5QAAdQogIecZ715Z4BDyTwJyLHtBztBT8Zxo+qt9YsZEh+kiLRd4aB6w5
	G4bZJcQLxU2rxV7aHvByhobCRfeLcQdDvB/36XTvQvgdks+Y9nlQxoV9caIPiiQU3YNyA==
X-Received: by 2002:a17:90b:53cf:b0:3ac:9772:8da3 with SMTP id 98e67ed59e1d1-3adeabde79cmr4337887a91.31.1792976099324;
        Sun, 25 Oct 2026 17:54:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebaddd45sm4643910a91.2.2026.10.25.17.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:54:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:54:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/max34440): add support for adpm12886
Message-ID: <004b7fb6-e704-484c-8748-c31a9194da9a@roeck-us.net>
References: <20260928-hwmon-next-v1-1-55b6c5cd8e2e@analog.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928-hwmon-next-v1-1-55b6c5cd8e2e@analog.com>

On Mon, Sep 28, 2026 at 12:27:55PM +0800, Alexis Czezar Torreno wrote:
> ADPM12886 is a 1/8 brick DC/DC converter that provides up to 98%
> efficiency at half load. Can sustain output power of 1200W. Uses PMBUS.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Applied.

Thanks,
Guenter
