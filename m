Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5C63D9045
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770299839; cv=none; b=RY/Hj6VZcK/Jh1Y7FkFsRJfzkKmfpRs4xg0m9bD+tJuFyu/urtvMOT6YEw2jE7BegbIAKWk23FQjNMJMRskBP6UfnMjBGemGJhQbSCtkyce83MOlD7qe19SC6b/Y40NSg/1tCU5CeKikh3dZ5Zm3gXjE+bcyPmbbsO5jdYGRcHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770299839; c=relaxed/simple;
	bh=sA65m/2Norbr3khvYg0TSkGKqOx9LYKyKckw9eDimRA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pWUHXMWbzGWP7a2fe2rMnkNzfboDA4ytzxUNtbWeylCSxfsG3dyFZAOWdhN0FHeX7MkEZKpmEa8vkF2jglhDyPhz/MYzprqkZYRv+X2GkRxn2jUTIIPBxxNGLkA7a34vU6BnqQjEL/IdA9JhQFia1NknSqkD+Jj4KxJRBjZ3Dj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=aOq/Eoxo; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="aOq/Eoxo"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-3f9ebb269c3so442203fac.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 05:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1770299838; x=1770904638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXoB2GPhRd9TFjGbvOT/wxlyWyVuq0bmZG6DywNpn8s=;
        b=aOq/EoxoSPBQzCZxGv+Q/JAbmJJki8mtzeKw8JPq2jPwJ3eTqgniTlRB+5vSpy6CEd
         tJlvXwqjOgromfL1Hw8VPdNJMWwH09P588fScSefkgA3UtH/s6y4URfEjBMGjnUj7msD
         6zVDy53ulQL7W/VEhEO2yFfER2Mu9KpatBHY4IPU89u2IxhRd9znDOyW7/VTzoxs0PZ9
         z0dJLavvVfeh5+uX78eUSfU2mNmlgkP3H5+L59vzZRAwi9muDaj82IkOK8yul7P0wZeA
         LQVuHjXzTL6BHwfnXWv7znMrYQdmkiGraS5Dd+h1jtQArg5UtflRnyzB9bK/xj65JNRq
         5kLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770299838; x=1770904638;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HXoB2GPhRd9TFjGbvOT/wxlyWyVuq0bmZG6DywNpn8s=;
        b=nJ5FB+MGDuRCaDPVFxPxQamRTXvdvkZMBgS6Y0hpNTnYG1yJdXiNEcoQxhJf9Jvp11
         f8pOEeeQBmyPuMYOX4h6xDjVTxTkA28H9GjWx7JikcvlO/gTplLCLgR0E0XhTTAEZCex
         WR95pYb+UoPxw/ccJZxCdq5mzEEdhCxjcIAksR/8yUXx+l6VYS5c4AHk6UcCmhoo8pjC
         DO2Lygbg0i6QOI7zd5XS+wlJB2A/aoej393Klm1DZqIyM7NG2luIx7eNLKZTeptoeqn/
         p2bQCtEtbVDTi36TsJ0yPNhWItXGpHzPfqmvvP4KRw56/bou2XFKIhsV2wt3D4ksamNP
         dMew==
X-Forwarded-Encrypted: i=1; AJvYcCUBacR1bk2yJ557zoVWWmgPvgWMjCJ994iPbrs5GQl3mxkujmpIKLRbhA+r9c5HKpjhobIS48D/lHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHqY8NKw1d0hpqBFRx5zfxFnM6jUk4hyv26QTZp15i2tWMDd3L
	UA9KDfypKUbQ2FvTgq+rnCq8t2FVaZsaH+9M4kCpTU17u7iave1+rNOGQ6YNDnzrHfU=
X-Gm-Gg: AZuq6aKW9VsJObp/VNOg9wIWExavsXG/GwMfK8nLmnXuFuTrQTctJhyJI0iz+s3OfOL
	dXiQdNlqiNQfceuQkn+MUCOaBAjqHIBEZjM0/bw65Gj8kby928P9g2RdqgYZQKbhC9lOI1HNTN9
	D4qAA6JCPdtTTWUarfse36/uv6a6/71h3Ek+cWva4QEdiyzMqGegOSQesymCFuR3xUuncKI0xlq
	Hc+Vo0jqJp2VGxRYD2hVeYtPRau9sB3hFmEJfHe9tdpNt90SA2OcHRLcEk7wIRbhyBpbmrI6Qqm
	wP+TRUUxBHgRe75tjUETogtrOns/hlOrf0ayXh7LYYdxA1gfXHCkkbg8b3iBgsEdykoDxz48S1A
	mS54fZcZM+yiScyckjxM7ui6ksitZtEMZBixSJIzn8fiyPIm7ip8J82agQVC02hGw+8hrVe0fAn
	CbMsMsfM6UTf6F3yUvXsuNCAvssPvERj7FlkfOtfae6PetclZkf9HmKxaahIY6dE/p
X-Received: by 2002:a05:6871:4727:b0:409:5952:432 with SMTP id 586e51a60fabf-40a5411d09amr3862257fac.54.1770299837957;
        Thu, 05 Feb 2026 05:57:17 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40a54489544sm3854758fac.16.2026.02.05.05.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 05:57:17 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Yu Kuai <yukuai@fnnas.com>, linux-block@vger.kernel.org, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 linux-doc@vger.kernel.org
In-Reply-To: <20260205072906.1881343-1-rdunlap@infradead.org>
References: <20260205072906.1881343-1-rdunlap@infradead.org>
Subject: Re: [PATCH -next] blk-mq: ABI/sysfs-block: fix docs build warnings
Message-Id: <177029983670.45614.4649364514096201990.b4-ty@kernel.dk>
Date: Thu, 05 Feb 2026 06:57:16 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 04 Feb 2026 23:29:03 -0800, Randy Dunlap wrote:
> Clean up the async_depth documentation:
> - insert blank lines before and after lists where needed
> - convert verb tense in a few places
> - make lines fit within 80 characters
> 
> Documentation/ABI/stable/sysfs-block:612: ERROR: Unexpected indentation. [docutils]
> Documentation/ABI/stable/sysfs-block:612: ERROR: Unexpected indentation. [docutils]
> Documentation/ABI/stable/sysfs-block:612: ERROR: Unexpected indentation. [docutils]
> 
> [...]

Applied, thanks!

[1/1] blk-mq: ABI/sysfs-block: fix docs build warnings
      commit: 72f4d6fca699a1e35b39c5e5dacac2926d254135

Best regards,
-- 
Jens Axboe



