Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF08C24E4C4
	for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 15:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755530221; cv=none; b=VL+nJQnKdJ50Qh58XQc79bFTAKAuabhdzom22EZ9d5Rk99L5XAhLbiN5ZxTSAjT+Tud9Wy6SRSZ4vWVLXaiJl49uqIY2ofj/Yjna6YKwzwAQp8yNZKFwu4HCmx0u0gXbngNmRUsvUO2kN8/uV5wwZMiZIPPgQ5xPS5Ckn+RtUAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755530221; c=relaxed/simple;
	bh=ZQ5q5cwLBvzEWKcFeidAaKR4mpwl8Ihe+MXj7VrWfMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HoQXDeF0rsIeZd50qPZt/C5Ql1mNGQlbPtg/YAMbYTknBlJiJj7KbRO2tsG8IJdq6/pp8m3QG8lmgmF0PtmAfZ7UbfWtB2CrOqsxRKeYluremiwlfEvN42FFqFVjkXeCbpxC+/N8pQgPkewjS1uImifGhmdahm3aflDxv753dpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=t8dIHHYV; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="t8dIHHYV"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-30cceb83f85so2316192fac.2
        for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 08:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755530219; x=1756135019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l3c3Gvew1aX6fRPuhI9Jg/FD49YDakQTVCTXjiPRQnM=;
        b=t8dIHHYVFwQr+rcY69trDG2w2EVOJ5jP9uBnl3tvtiVlgQKDq40uRUyzCVQTGzRgby
         e2smdDMUZsbt9Jaa47BMq7zarVoLTmsqfAdVrQmCOsJwMznEwxbMP3/72Hjz0QoGoCD9
         AOc6mjmeXl2svHZnrwx5QltaulCDP1uZzDlYoqicb4shEjmQh5wNknbYtlm0WjRzqSgv
         wfdwXYE8l08PH/JV7WpbJ6BILVfsUCtZBX0cuGe5OXKbZYoph2HZj95c3WeLrlED1Xst
         9r4fe9ld+5R+87Ib7/CsLQcXGg0HdhBWs2+85NTGFZ2qnyswiL2EVC1VF7MZSqThWBlC
         6Qjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755530219; x=1756135019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l3c3Gvew1aX6fRPuhI9Jg/FD49YDakQTVCTXjiPRQnM=;
        b=vT8R+OXY3yfZzGQhsLC02MByrtIjukedKWq67quPDsfedhhAAkf+rgNJGnhXs6uaYw
         lY5AdlDOfvqzCP0MC98Vq4UGILxNkpcfK05kgDIpFSy0wRAONxu6Hx3I6lUSWSX7LgNg
         jRxqBUTS83vICqxWKCeaQ5MHBh4DeLtwKirh3HKY3r9dcmyK5vv3WesAzfkAdbV9FZgr
         BLiH6yCviaENJJeMqeX4z3HcLLDjNynh2YJ2L3kf2wjMNgKXboGsxpe2bAH7dhTKeOTx
         tyEVkgNyWOXZLiHCy6jr84w216YACZ4u3AgDihcRzKTKLrC+ORWEG/j76KxU+H9zq0yT
         vv5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhfB8G4NBoU96E4gTZejeu5gB+k5xV5fmzgKsulyKVSY41NhNsxxsN73y/gxBF2F13Q2+BPgWtnd0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFwsqfEjBpgrPYhxGQzoxUrWyvekWyR6hP3DFQEJ3tGmDsVbtW
	+GqYcu81Ewhm7RdW5QA8fNu6wIiKGTEyMYT5p3jSIgGLInNiSt1CvshXUpZcjw3JiAc=
X-Gm-Gg: ASbGncsr1IrrvhtqThnHyRyhMUyGoWzF3h74dK9lzwIZfsFsbyg8Mg6v6wb6TnGB6Wk
	q0hv9ecGrfVU0NiKT4hP8cmHSMvFDSaWoaYUzpg94Lm5oNlORFZljqz5FNsWOCKCMKsn07pZqAM
	I4kXqp+eRKA5BX6OAti0KeZhv70dK4b4bTUwkDPX7aZRNiaQqXAgY+xyxSnWjrbgSwm9nk/xKxh
	lLi9Xzu7FXHMnc7qK4SARy66U5V2nwfZ+jNqrl0SOmslM5We4gRi8Yhe/fqEIL69nMVQQsCgLB5
	C38pmfnGKg91vlPU/Z4ShpBQRV3+6cqLt57pEkyXHRQR8wMwLJwgJO3XeRfzTmUMLQHEbHVgCmK
	GKHiL8v8JY7rZgOKUmcQEenL052cziO+8SCR2bN5gMEUgjrAcwIVZlBuYrWFWwwyFZlQpGu3wfZ
	vjql2adr2Iyw==
X-Google-Smtp-Source: AGHT+IHZyxk+kZ7n3rFj6tDtFYVDJ76v+ifqvF7+ofV/wgR1Z5viCvG2a2JUh6/y2oi4HtsHAUqRNA==
X-Received: by 2002:a05:6871:7283:b0:30b:c9ed:7f91 with SMTP id 586e51a60fabf-310aaf7bd7bmr7700347fac.31.1755530218704;
        Mon, 18 Aug 2025 08:16:58 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:ee1a:f057:94fa:9a73? ([2600:8803:e7e4:1d00:ee1a:f057:94fa:9a73])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-310abbf853bsm2713127fac.32.2025.08.18.08.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 08:16:58 -0700 (PDT)
Message-ID: <a7ce7e35-b761-49c6-9e8c-e3f849fae846@baylibre.com>
Date: Mon, 18 Aug 2025 10:16:56 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: iio: ad3552r: Fix malformed code-block directive
To: Jorge Marques <jorge.marques@analog.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Jonathan Cameron <jic23@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250818-docs-ad3552r-code-block-fix-v1-1-4430cbc26676@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250818-docs-ad3552r-code-block-fix-v1-1-4430cbc26676@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/18/25 9:44 AM, Jorge Marques wrote:
> Missing required double dot and line break.
> 
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> ---

Reviewed-by: David Lechner <dlechner@baylibre.com>

