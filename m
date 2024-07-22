Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE45208CA
	for <linux-doc@vger.kernel.org>; Mon, 22 Jul 2024 21:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721682311; cv=none; b=ly1pElsvEjKgzac6gzBK01E2leJab6RJO6e0gfIHmtSsBo5KOg9VcosyjlRUmCScNmzetT/L9Ts4trWyKYu5jRlso9FVM5gqN3VAQE3wSmaqW7u8K+uTDi1MBg69QasZ4Uf0MMGyrEEgjuayTGzzlysYIL0tWzc15OGQB3wTGN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721682311; c=relaxed/simple;
	bh=pKDNl9/ehHUpSmuKgCdC/RyOZx807qf27mBVei8eZ+Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eW9RGsuxMjdeQBLYbI2mlEDCoE/59CeGIZV1fq+zD6QmsstxtISsB+JAKvxkEdR/TFuINBLYr2WIJZvjkyrnvtevFbr/IR9DdSg47C3mF7R5eXR3sgFM9KtRm5O+R65cU89yOsvlcCMBYBsyNFAT+12YLlzQY7lat1cLvWJCv9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Fz/XlNq8; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Fz/XlNq8"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3686b285969so2098977f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 22 Jul 2024 14:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1721682307; x=1722287107; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wJl+KODOtbQbJVQoLcgZraNukUc1AfpSiHvhjNN/EGA=;
        b=Fz/XlNq8scis6Et7kQv1Ns0YAB0TuSWzOUFAn3gZJXVW5zYBctuOPE9lacsaneYr+m
         d6Xe6at3KU+yqr8pDuyVcTvvcALVNkE2A5vqNlyueq9f8/ZD7qzMEW3PNCQymadouo5I
         VrVwM/l8q6oDNx7F3HgIzwbSX9hSBQb6Wnjk33Zj9mdZFZlWFJliJza1rhZXXb7T/Mln
         kb35wOO3vP/RkyUvfc+/9dJ4BI7owz3aoV0qXf5c6k2yJUWJy+pYN5fm4Z1dWUvQ07+A
         2Ou/njQ8AbkBc0fJLdESavbA2/BAwuqoBnvyzYdJ7qgbcXxcK5G7Ke4HxUMsJwARdapQ
         wJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721682307; x=1722287107;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJl+KODOtbQbJVQoLcgZraNukUc1AfpSiHvhjNN/EGA=;
        b=b9+SBiIg9IFHiq4ebdV+6CirgoP9ydypxp7ZhuwtuTNpys9AfX0IQEv5LbScJg7y9Q
         EZYPpfjwN3p9UkG+LjfNBpssWdUNCtNlUrmQdlmyVSOKOEjnWkAX/rf3+7cPQjyBWBZr
         6gPJ7x8PdmVSZOuJDV6oAwf2AxqZSvX+u+Zsinbv1aU76SVGA9H1MvWqIftntXaDy5RW
         mqaY/JYGWy2JyjEdy5SIUusg5ZhwKUD6rfOkbjOSzRZ0hRAbU18AXFeslqeD3BGaOJM6
         xCW+g9KCVy+1LRu71R5LvwcbQqUcNpn0CrWgV8MHEiOMHAcuH4BLr10dIPSD6JlkuSgO
         jALQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSllfHQKKnk1l0ggTYnNW9xJMNNurD8wifO1iwUXz/LfZtHd4eSuqX8LTLfWqraGQapdUyjopDQ1W5cV4L2OSQVonXNaqm33E2
X-Gm-Message-State: AOJu0YzDm7LekFdSBDFD9FZST7SdxziW8g9aupbv7N6QJu5BgHPC+2ue
	a7AAbTCsJ+2L6K7IcPvkPLua13Z1AkjuXFnmVEI23I+BeaRinhezqKDVWwhQddc=
X-Google-Smtp-Source: AGHT+IGmKiPLP6iZJ8231zq2ISbOWAeyGZtgOmCIid0gBb3g2mEMGCtiGof9hqlaCaNgxv7yS+/6Pw==
X-Received: by 2002:a5d:6192:0:b0:368:3717:10b3 with SMTP id ffacd0b85a97d-369bae23a3bmr5618969f8f.8.1721682306665;
        Mon, 22 Jul 2024 14:05:06 -0700 (PDT)
Received: from localhost ([149.71.24.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-368787cedabsm9521320f8f.84.2024.07.22.14.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 14:05:06 -0700 (PDT)
From: Punit Agrawal <punit.agrawal@bytedance.com>
To: palmer@dabbelt.com, Palmer Dabbelt <palmer@rivosinc.com>
Cc: paul.walmsley@sifive.com, costa.shul@redhat.com, aou@eecs.berkeley.edu,
	samitolvanen@google.com,  corbet@lwn.net,
	Anup Patel <anup@brainfault.org>,  linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,  jesse@rivosinc.com,
	conor.dooley@microchip.com,  Yunhui Cui <cuiyunhui@bytedance.com>,
	andy.chiu@sifive.com,  cleger@rivosinc.com,
	linux-riscv@lists.infradead.org,  jrtc27@jrtc27.com,
	evan@rivosinc.com, Punit Agrawal <punit.agrawal@bytedance.com>
Subject: Re: [PATCH v4] RISC-V: Provide the frequency of time CSR via hwprobe
In-Reply-To: <87jzhtmvqg.fsf@bytedance.com> (Punit Agrawal's message of "Wed,
	10 Jul 2024 10:39:35 +0100")
References: <20240702033731.71955-1-cuiyunhui@bytedance.com>
	<20240702033731.71955-2-cuiyunhui@bytedance.com>
	<87jzhtmvqg.fsf@bytedance.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Date: Mon, 22 Jul 2024 22:05:05 +0100
Message-ID: <87bk2pkuim.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Punit Agrawal <punit.agrawal@bytedance.com> writes:

> Hi,
>
> Yunhui Cui <cuiyunhui@bytedance.com> writes:
>
>> From: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> The RISC-V architecture makes a real time counter CSR (via RDTIME
>> instruction) available for applications in U-mode but there is no
>> architected mechanism for an application to discover the frequency
>> the counter is running at. Some applications (e.g., DPDK) use the
>> time counter for basic performance analysis as well as fine grained
>> time-keeping.
>>
>> Add support to the hwprobe system call to export the time CSR
>> frequency to code running in U-mode.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
>> Reviewed-by: Evan Green <evan@rivosinc.com>
>> Reviewed-by: Anup Patel <anup@brainfault.org>
>> Acked-by: Punit Agrawal <punit.agrawal@bytedance.com>
>> ---
>>  Documentation/arch/riscv/hwprobe.rst  | 2 ++
>>  arch/riscv/include/asm/hwprobe.h      | 2 +-
>>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>>  arch/riscv/kernel/sys_hwprobe.c       | 5 +++++
>>  4 files changed, 9 insertions(+), 1 deletion(-)
>
> The commit looks ready to be merged. Will this picked up for the 6.11
> release?
>
> Once this is merged, we can send out the DPDK change relying on the
> newly added key.

I see the first part of RISC-V patches got merged for 6.11. Any chance
for this patch to still make it for this cycle?
