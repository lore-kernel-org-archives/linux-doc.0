Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53C133A030
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 10:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762856092; cv=none; b=tlKBwTQC5bn140dVsKeiZiRQY7L72wZFvbnJgUDp0SQzWon4qUs8lrBe8wHGOZpxoDtwh0VwOo8flYFtK6kmtZq6csRTFw1XPiaxBs22xfklScEFB8rBk5QEOuw+TS+fFtSqTNc3rYi0yv6YhK1uauS3MRRvhNtiktuBbR3HyGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762856092; c=relaxed/simple;
	bh=QCoNa0bAFU4qkhO5GhIkfapiatY4Py/cCoDedmB34wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BAX/b/a+DPucawNLEc48n6VmiU8MgRfnQrn62ojzCICNdzLeWFTRnkA9uU6tySBLDZ7p/E+ngn6MICQq6nktXbw1pnhFN/sfPQYOU9nFiADJUb3gX+c7EvD8brkgdZe2WVHNaqwKVoeZCNyd7WTZRX0whj4apMXQVfDmftpTrJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AiNMTADZ; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AiNMTADZ"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-340a5c58bf1so2832850a91.2
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 02:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762856090; x=1763460890; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QCoNa0bAFU4qkhO5GhIkfapiatY4Py/cCoDedmB34wk=;
        b=AiNMTADZUz0sVD+AWDCRC6XeC4li3NJTME4vB5hxqUPQE4kVBV7gC4Nr7Oms/vLoTr
         5LHEm5EQn+iV0YSy3I4UCODdhKEFSYazK4TgHC3QURhtIZodF1lD3Y/Ohbf4bcaNw9dJ
         JmNxcBUWBz+xy38inIAEOxN9REmNnRKNVzexvmuCkqFLrgSMGpchD8PAgC+D/pUhW30+
         9J4OU7/uR9uRNdOyUm92HpMaERRwhgBDXn6ZE0Z0vhVnYimQ+M+0JBlTpVO1jtXo91qS
         7p+tf72kM4ouhnmSbTJOBVuo5zHn/yKhI5KwzEQW3rFG2wbl+Spy+dp/Jq7c77psFLgE
         ntPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762856090; x=1763460890;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QCoNa0bAFU4qkhO5GhIkfapiatY4Py/cCoDedmB34wk=;
        b=C/QDF690ROj7AhXdZBxL0f8wDf1CuoHGG2cQgeWOg6MLOw5vSFEyqMxyhNbkEBtUeZ
         +kzLiJ1hYDglJaY+LacNGcLZ+pGpTb8P/xlxxnroo6wn3mqUCjGSRY7lkIDAsnxctS2L
         jqjAUii+axIJq8KkhY6AcdS1/b0taJx5ZAEIcJczk/lJDxaWL6ORnjqwwDvdFRpz1bZL
         bS5KC8UXi0/SvAZWcuNAy4ii4jGVXleejksMas75QhkJaxcUO0pfmdlTYb+SnAlKReEa
         /HjIbyY17FTlARXUeDq3ZxfWSuJPnG14MzhjfmcFUsqJXeFaWpk5uLNsAgCkUVkniSuS
         oRUA==
X-Forwarded-Encrypted: i=1; AJvYcCWw4oZz/9rsYQzUf9k/m5uCEYAkFcI4UPg02xcd3WGTPl58tqK0Ii5Gwuc1jQE3zhPwxKh6ZW9XR70=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAoyB+S2xD2xdy9P9cLR/IRCOvEDevu3pQDKFZU7Dj8w2HAZ9a
	cyz32nYO8/O0xYdxEPLfcxjpBXS1mPx28RRc1GSVl8vebWPDa6r3ifOW9g6taspiYClJybWvqPc
	yJ4TRwxjsTpteA9+1m9WmDDZO9FYWjuapurUnyhOn
X-Gm-Gg: ASbGnctDNhXBmxUlxN8/WzyATkYoOfk0IO0qM7lstaPxUYXOXgRq16fnZ8sKty7FKOW
	xk1dVMaMfn+W3sfApTph4V94RTYUExTnm913oADp14TexJL4iMSV0uw6Sgo37zSsAsxM1X9I6z6
	sXDJgR9xLzNUmxrW2/MQlgHwRVYxfwV0lOSdZeUFMPh3top9Zw0X/kLW4yevnqaxFs+iDmoCDZV
	AwRabtm/cikHqLI5zkbg/qdr2kKUOEvXN/FHTyXmKb3X58YB5NPwx1hTL3eDEguA71gQthZ6qwz
	TO3l3gMl/R3Tv4HQk01Kquxz7dwJVhbP0yhW
X-Google-Smtp-Source: AGHT+IFQSxMJjSbUGKNKNlHPOvAOCrOFIwylDJVM9WLCE9houa0HQsWEPCsgreAvWbtMbfV9H0B8kgzaUxxNh9fow8M=
X-Received: by 2002:a17:90b:1f87:b0:340:bb64:c5e with SMTP id
 98e67ed59e1d1-3436cb89ac3mr14436274a91.14.1762856089911; Tue, 11 Nov 2025
 02:14:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <8b0daaf83752528418bf2dd8d08906c37fa31f69.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <8b0daaf83752528418bf2dd8d08906c37fa31f69.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 11 Nov 2025 11:14:12 +0100
X-Gm-Features: AWmQ_bk1ReQnmXZU019ENpKczYWPK1RduG0S2XHhWai-9JyZu-To_X33SgyNVa8
Message-ID: <CAG_fn=UzrdF4v_0iK5b+DHDhFG5pD-W4cac62YYK5x2hgPx9yA@mail.gmail.com>
Subject: Re: [PATCH v6 15/18] x86/kasan: Handle UD1 for inline KASAN reports
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

> +++ b/arch/x86/mm/kasan_inline.c

The name kasan_inline.c is confusing: a reader may imply that this
file is used for CONFIG_KASAN_INLINE, or that it contains inline
functions, while neither is true.
I suggest renaming it into something like kasan_sw_tags.c
