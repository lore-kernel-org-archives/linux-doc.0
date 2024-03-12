Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3EE47F60
	for <linux-doc@vger.kernel.org>; Tue, 12 Mar 2024 23:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710287812; cv=none; b=tR/SVWROGTT+49NszFklKORFqYAaMMtHsEsaI+0Gme9n0QwILgjVjeQlKwN6StX0MR74ruj314ePBtJt92xRWA1Cs23D8YuDxV3AchpCg+QSlPqQDcYG1Tqxx8w96c258ZbKvjRdo6cs65jKn1HCkFZiW62MbHlFkaR1aMafrV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710287812; c=relaxed/simple;
	bh=093KVda26WqmqdJht4WhK6nR+8yU7yPh9WYzE3fzY7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=unklYNXMy0WXltwlZnkANCtPpNrCMgcec4spgefR46UQFFJeqFPOcbBD9W68fhVu6EsTJxxQ0tqZBlFsQcgr9vIdv7YCMJbSiVRHwz/hGIySJsdadiGYS6C6Laz/mnbd0PIGtBp5E1S/czGp2NtuKML79r6QM6PD5uhaHFYDsXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=Usr2HyC0; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Usr2HyC0"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-690cf6ecd3cso21900066d6.2
        for <linux-doc@vger.kernel.org>; Tue, 12 Mar 2024 16:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710287810; x=1710892610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zl9PC7FMZlnjsGfkV0mu1AuaGsWjNCYzUqWD8hwrZds=;
        b=Usr2HyC0zap0I51WQ4AOjvcHDJ52/pGaqx0+9TN/K0M0JKXWbe2QJVqw3wpuySQljX
         HVk0CmWQBiTIYk+pjxvzsVSHvGke+VAbNcpelvvYKSj5suP/E9ZlJvDtwbbL6sMLQ1RB
         5vdpT83NM7GeJB+I30Cio/M8vUl66kqGz1356YAS2RR62LBmFSGTNeJnd6KhZmgJCypv
         6cb3wf1t4o5H80D5X7si/VliOnbldr/oZl9o+6EOQxF7j7f5QcVYYE9jsP6F3GNWDmu1
         z4fwzlWuyszg68TmY0ObHfl6jfy1r1niEhXoJU1SHhrAgdeIzzfMO2rSj6Zjzdx0HGrU
         aFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710287810; x=1710892610;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zl9PC7FMZlnjsGfkV0mu1AuaGsWjNCYzUqWD8hwrZds=;
        b=uGCO+//XxHtOY9laZ/NtQqpG0R5KRVHzAkll5SDcSOU3YVQDV8S8xxFSNrsbJ4KkO0
         2EKUGqOKO1+Uz/4tbcg2Qg2lLm7IiShfG42/2zz+0z1sFARfCR/TXxYiskA5PnhNQJy+
         VpnInocCBYQ7dWyvam+nGzSsd0glwRSim9Qi0e/8XWXQqeI+NHIngtkld5hOnAzYoFTv
         uKwk1Y92aOcBsaOHyXLOOhLBxVR5Zzk9frcc66YvsWaQewp/HgGbUY/trPFb1yN9PzMU
         Mf+QIltUFDWkrnrCumWofkcfDOFRzN5YRFubUwjhiOrXeGz21hu+QuIoILSL6S/TB7a0
         Yc/g==
X-Forwarded-Encrypted: i=1; AJvYcCXPVp7u+m8u8/MYrwD1+bQlVI3mSDlGrf1oaAUPQnz5waVAmmmUKE3yTxVcs/deDSl2E5g+43qL8JdsNo6VrTF5a+3tFm/AcveB
X-Gm-Message-State: AOJu0Yxmlqo6Yy/Z2fnCogtCpq9owq8x3Yvkq5LJ0/HRYMtW8y7o2eKx
	soopGb8LLUZVg9TAFi/0uRIULv3eEEPFrpsCFIS3NKjCDDUytXK8KJowgg6YuTc=
X-Google-Smtp-Source: AGHT+IE8Dmw1Z80zDDEuGQisqIkLb3ATdKh/kIXXdSWtfBQ7CA9QAFZ+Fy8t43y0MFgM+taz+MT7xQ==
X-Received: by 2002:a0c:fc41:0:b0:690:7a4f:d670 with SMTP id w1-20020a0cfc41000000b006907a4fd670mr13082479qvp.8.1710287809872;
        Tue, 12 Mar 2024 16:56:49 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.8.176])
        by smtp.gmail.com with ESMTPSA id r6-20020a0cf606000000b0069046d929a3sm4080243qvm.145.2024.03.12.16.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 16:56:48 -0700 (PDT)
Message-ID: <1c24d9d8-36dd-4bf1-a1b0-afd371fbb809@sifive.com>
Date: Tue, 12 Mar 2024 18:56:47 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 2/4] riscv: Include riscv_set_icache_flush_ctx prctl
Content-Language: en-US
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>,
 Alexandre Ghiti <alex@ghiti.fr>
References: <20240312-fencei-v13-0-4b6bdc2bbf32@rivosinc.com>
 <20240312-fencei-v13-2-4b6bdc2bbf32@rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240312-fencei-v13-2-4b6bdc2bbf32@rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-03-12 6:53 PM, Charlie Jenkins wrote:
> Support new prctl with key PR_RISCV_SET_ICACHE_FLUSH_CTX to enable
> optimization of cross modifying code. This prctl enables userspace code
> to use icache flushing instructions such as fence.i with the guarantee
> that the icache will continue to be clean after thread migration.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/mmu.h       |   2 +
>  arch/riscv/include/asm/processor.h |  10 ++++
>  arch/riscv/include/asm/switch_to.h |  23 ++++++++
>  arch/riscv/mm/cacheflush.c         | 111 +++++++++++++++++++++++++++++++++++++
>  arch/riscv/mm/context.c            |  19 ++++---
>  include/uapi/linux/prctl.h         |   6 ++
>  kernel/sys.c                       |   6 ++
>  7 files changed, 169 insertions(+), 8 deletions(-)

Thanks for the updates!

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

