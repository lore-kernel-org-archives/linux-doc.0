Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F47D20F075
	for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 05:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736832769; cv=none; b=rZCOEh6zxQ8FNE1IKZ/ynwD67YZnCOiraSSGDye1e9z/SJjecD/+X4HG4b7rjoQ7QEPShiNlP9JkNk2Rrv2bbQ9QRS39JoqqUm69pvDRp0vwdkDc/gjRk9Ov+ve4HkBWf7oglLbmSi5sk61dwkeIvGbH7YrOSEP1kRZUbMbS1jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736832769; c=relaxed/simple;
	bh=QQTufbY/evwUHAS6v3e7UmNDN5npP/AEnyl1/ajoYEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=n6GKN9IM6qt/SQNvVjOzS2Nt6noF3VR2upYkzpjAq+TG5I2cBmptnWr/9ve/IAjcsq+19XjItQiDMyNN4SjAovfAmvgpsLf+FLc+o9R6AMAkQaHfv6v9LS5akVt4lDd9J7mebJsxgrCKpEuWSrj6LF12GBJ8ufX6Hx66Oqga4MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=QeA5Mckb; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="QeA5Mckb"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-844dfe4b136so135174039f.3
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 21:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1736832767; x=1737437567; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f1Bp10ZGkW5gD2RlZUXeDywURBlq4mu2M9HqJf63BKM=;
        b=QeA5MckbDTFsXW1gi9zHLfesHwbG6O5OXuYQkgE0X69pnxF7QTUdTvwcpcT1VP07FC
         Xkp0b/xzEFJukr30kc/wqtVee6Jxfr1uHmVqAnsbTIags3kCfarTn85Y4VndxyKULmde
         bzkmbTbC2vqkKnC/hDrCxVh5ptDsAN5kVGbjJD+LL4SoetV73ni0PcBmV8G/0wc8SMnp
         O9tVRbpat3gLhOTD9wjqMoBZBHTqNsGnFOAmfNcWgDOCN54oM1bNc8i0emVlNEumtaY2
         skHZ5x0MI4vWk61RszaXDklUMVgM50CEeDE1DYG3mU6wF+eWfbKD6nBfTZuqsDJw29e5
         ADuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736832767; x=1737437567;
        h=content-transfer-encoding:in-reply-to:cc:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f1Bp10ZGkW5gD2RlZUXeDywURBlq4mu2M9HqJf63BKM=;
        b=KQR3QJGTHnBD5zj08LkiUU7gAlm+2ydRa+UXqNZzA1Fm4xoWmuYVHiHNIGua+SecAT
         tz18DhFiOXsxummOGUNSMiTTh/HRGXDHeWjksxF3SU9BhmpBt43dZZhTgimGLmZfWS8T
         8MlF67Ht7FlfRv5QjvfiXNsJornZqgMVUp/qUjNhhqEP5u1bk3ySlJikPLGe2ROkQ7CL
         2vhnerUOlS+iKj7RlkvTv6SpXN+2dtiTbXIrVvVmhLk8s0/lemPArdFEeFvFWSOKofzw
         6YXSRbA9lYnASUymqpbypnWu3EftF/YhkaesNrPRRz24Uqx23qsGKzR+/7Ymnw9gYtkW
         Sa5g==
X-Forwarded-Encrypted: i=1; AJvYcCVDs1bzNhxjba2jBmphnc9Sa7pjqnBcQVDHax8WMdlpi2T843hXW/d6x5B0va/3xXNA9TdHII6Gy9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIvyPE4WFFriB/6C/qv3ZQjtn+aOv2GTrzxMJV04/nl9LhXeLR
	URQ3i821MRJTiCg2s6GPpMgmM8zS3Ddsh/r8gzy5D9XxyozWY1GTMp6+nh7iGyI=
X-Gm-Gg: ASbGncsZjXl5IVEi/RNTXhFEDt4CvCvGp5S7gRbduQ3Ea+gnc88M/aBZ4lM1tLHHhyO
	ePfBG1J5/ioecXmqex3IHKBAk0zfbTMCKaPCuGOfSrkCk9xup3RDC/fPt92eMI2f2sQ82SGyKi3
	riQVLBwsYpS1ElWSOv4QVovXpn/dLjOL0XOh6/u7WhKmAK0xYSllJkP655hYNC0VKnGhnyLtb3c
	g1PgKQ2LscL6Z4xZavIOjYEsXwP1slDFNF+Cc653yms/Kdqhxsfyoyy6OP+qegu8y+pYyhBLdDE
	16vx
X-Google-Smtp-Source: AGHT+IH4xYP4M6DhMu3ld/by2JdHK1yfyfQFeSU+FypC6PibjVehEMl4FyLmPwAvmuuWc6iZj61OWA==
X-Received: by 2002:a05:6e02:138d:b0:3a7:e103:3c43 with SMTP id e9e14a558f8ab-3ce3aa5af3bmr25675045ab.19.1736832767477;
        Mon, 13 Jan 2025 21:32:47 -0800 (PST)
Received: from [100.64.0.1] ([165.188.116.9])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ce4adee7bfsm31862735ab.44.2025.01.13.21.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 21:32:46 -0800 (PST)
Message-ID: <fa984379-29b6-4093-9213-6a291ccc7e23@sifive.com>
Date: Mon, 13 Jan 2025 23:32:45 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] RISC-V: selftests: Add TEST_ZICBOM into CBO tests
To: Yunhui Cui <cuiyunhui@bytedance.com>
References: <20250114021936.17234-1-cuiyunhui@bytedance.com>
 <20250114021936.17234-4-cuiyunhui@bytedance.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
Cc: ajones@ventanamicro.com, alexghiti@rivosinc.com, andybnac@gmail.com,
 aou@eecs.berkeley.edu, charlie@rivosinc.com, cleger@rivosinc.com,
 conor.dooley@microchip.com, conor@kernel.org, corbet@lwn.net,
 evan@rivosinc.com, jesse@rivosinc.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, shuah@kernel.org
In-Reply-To: <20250114021936.17234-4-cuiyunhui@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-01-13 8:19 PM, Yunhui Cui wrote:
> Add test for Zicbom and its block size into CBO tests, when
> Zicbom is present, test that cbo.clean/flush may be issued and works.
> As the software can't verify the clean/flush functions, we just judged
> that cbo.clean/flush isn't executed illegally.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  tools/testing/selftests/riscv/hwprobe/cbo.c | 66 +++++++++++++++++----
>  1 file changed, 55 insertions(+), 11 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

