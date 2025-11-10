Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4272C21C4
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 17:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762796956; cv=none; b=uLh+/fPH1U0A0YhBZL0vGbAJrb3p0wuRnqeBZwDLtbFtyBm7/qKFcwKrlHH9lBm40UTFe6ku3yhkdp3QwuHE5Eb6aMgjz43v0ev5S/4FCCz2bJ/8pMJHvEMwkM1T8y+OD3jYlkwb5VxupPjZqFZWGAwn/d8PoodsX9L23p2fj4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762796956; c=relaxed/simple;
	bh=O98arH5WjcI5ZayKxsmOANfoxY47t5wDmB6i5QtbFzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dB1Pi3aKcoH+oS3COPSjlr4e6DjxCgPHaPS0Gsd21A00fHDK5igbheFmNPZ/rZdsfhTpUrYA1fglhiObOWMfNzGgzdzNXI1NhnRgEWfTCAkE8kvuDEe1mLWDPqJEKeWUhqWhoQs4nRqgm8BgbTiyi6BMuP2PglTxt0v3e8SxhNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nRaz1H4j; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nRaz1H4j"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-882451b353fso11739766d6.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 09:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762796954; x=1763401754; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BPbi2NPPrBKl69IkN7kcBKOxfNw5kLfKkjmbVe2fGbs=;
        b=nRaz1H4jWcNq5aIIMP1HzMyzpXUE547dlrLoh9EEQXJSuCzeEmLTrNGOqgOIyzgxxi
         +4IxsSc9/xH0X92oJKKEHX5/Eva4+4NjRJcuZLk/Ah1PozRGH/9qgW1d58nsKqXSiEUZ
         R94HC13GQTfmF+o3k64nrAJFhgB7tRETmKjcJaeIgJwdwLCdOwiuGl9fXTGmiDOlm8xq
         W7zInIYwwqKhB2X/8sdIHYY4y4yVdtATJe3k3vIoBMisK84GJP9ei+GoZ/LqOWlyahr5
         O/RHBC0rxI/wRA/C+Dzi/MLypGcHkUzdhmyHtv3V74PEYHPmHuQDIbmIjtwftXvbdENa
         648Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762796954; x=1763401754;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPbi2NPPrBKl69IkN7kcBKOxfNw5kLfKkjmbVe2fGbs=;
        b=Zg2Qy293XnJcvmdTMHZEKCkqga2FnFNKKeN3WMF3sTJ7UIr/cC2y76t9Obp6VVZrPK
         zI+hlBKAWNpledbX9gEXUqkvUHD6A4MWnPfWpJHEULBihG+Yr8W5SBNlHS+nR2wnNASr
         N8RfOIYmDfV0/mgIubLjsv3TgjKkrP2EaxLOfKEio3Zd5UOIk+p7/eoCebxcWDmrS83W
         T/3zqzOFir5FJrVXdM/cK4Ls5aWXJ5E2pX0lAZt09uouIfGgOvXkEotPocDrX/7V3A8H
         kunGw1vlEBODId0O7Vh4PMGD6YtJzqZls8YnROA7UcZ5HTzcsPmUp08S8tz4eeSoBLid
         OdPA==
X-Forwarded-Encrypted: i=1; AJvYcCXY3FZzjlWMs+ieRaBBJ67RWCVselB+uqbNVJignsqSgtPFS3J3DN3D0Q9SAVeZnRz2tFLH9I1IkFo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRDLl5d2dZ6SneGqATLx2/Slfw2jX/bWA4RuZqJilKHQMjpNZk
	L3BN6saHjl9j0FeFWH6lqGvE6+ySMM2FVAlDzmMMccYG4IB7vHgBNwxZU5Z32tGOBLJQiN06yTf
	ZrCD6MW6LGYMDQlQehmuL58C5ZBHhWkxfTuw5zLRM
X-Gm-Gg: ASbGnctN4DjhISvxg6a+4SpkHQbdhEj0BuBUPIbEBitvICdN7WUeYr7rcivnjLP/Y6t
	Rz1PFDvc+YFzGyxqDkCQ5FzDTJtKXt1iC2lq/zeFPPyUEkgBjckG0L7pS1GL8GE6NAJt7NLgvG5
	8WfTTCR2Y+EttewWD7t/QpD8xGBDb7fqSmid53Uaq84jIpqFlTH5G2VrJn/yAibCiPJDdEK67Cf
	RS0oqYuePgu+k7W4DJxIMSNmdxYfCEGONBfqv8P99i2E22HK3FMthUdz/T7R09HyQLbcP0q+fHI
	Hb9HjeMgbfzm/ZXiW5xWoNzDqQ==
X-Google-Smtp-Source: AGHT+IHaNRtCNWgUYc5RPhLYoD+nULNJ4nH9LNtSZkCbb+Nk0d7DtvBVzdaKV0/uL+kFEgmffI/ryLd+1MDzyV+BJT4=
X-Received: by 2002:a05:6214:1cc2:b0:880:4bde:e0cb with SMTP id
 6a1803df08f44-882385de9demr131074376d6.29.1762796952867; Mon, 10 Nov 2025
 09:49:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <0ca5d46e292e5074c119c7c58e6ec9901fb0ed73.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <0ca5d46e292e5074c119c7c58e6ec9901fb0ed73.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Mon, 10 Nov 2025 18:48:35 +0100
X-Gm-Features: AWmQ_bkJUSMUoO8onDW_Kv00mrjnva_voIrMRMQdowErjlplIdY_Q4t-6BqV8ig
Message-ID: <CAG_fn=W033hGM7_jnj0irwW0gc6McLw2nbhfZROWfieqKTxVdQ@mail.gmail.com>
Subject: Re: [PATCH v6 14/18] x86: Minimal SLAB alignment
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, 
	kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, 
	ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, 
	morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, 
	baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, 
	wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, 
	fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, 
	ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, 
	brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, 
	mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, 
	thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, 
	jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, 
	mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, 
	vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com, 
	ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev, 
	ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, 
	maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, 
	rppt@kernel.org, will@kernel.org, luto@kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> diff --git a/arch/x86/include/asm/cache.h b/arch/x86/include/asm/cache.h
> index 69404eae9983..3232583b5487 100644
> --- a/arch/x86/include/asm/cache.h
> +++ b/arch/x86/include/asm/cache.h
> @@ -21,4 +21,8 @@
>  #endif
>  #endif
>
> +#ifdef CONFIG_KASAN_SW_TAGS
> +#define ARCH_SLAB_MINALIGN (1ULL << KASAN_SHADOW_SCALE_SHIFT)

I don't think linux/linkage.h (the only header included here) defines
KASAN_SHADOW_SCALE_SHIFT, does it?
