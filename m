Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793166945;
	b=KJ0W8A9U3mIsvYyGHDTtgaWcG44tx6SoOEJqDqyG0tDGcWaExZN7DO/HuZx/VQPbfbfZ
	 yMJSsWdoFUGsJfu2zS6j5xtt3jnH17RRJh/aRTTZxT6OuTa+ygLbBL/Z7bND7t5ouo576
	 DoS9ygHb3h0pvpwSeALxPEb3s/vj/Yr+ZtGYnjW3cnvqWmVrV+EpXsmIn4cR8U0JgiK/D
	 wtk/hlkijWwDuMC7XfSNn4dKGLYQYA79ggfMXeuJh4LZlLk8NjydnUxzuQIcftWsCGjk4
	 UO3vek8K1FEqu2aVO3XeWUVKL7QPihCl9o5Sac9soKas9KlJf74EQak0Hbsr4GtJUXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793166945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=hLkqAi8ctPqSRIwXUevfGPv3vaKrwbjwbnl9pr4s97k=;
	b=g48Orq6vLdjxXIc+dm/lEFxx8KgNWDiAIYTKNg3nXJOJgh2Q3ekQgZFoRRvdNIkRkV/r
	 jK/Ba7Fycjgtg946i8qYb/69rGqyMEgkoiFOwXGKACEE2yOMej5Hnm/ZE+UyqXFaA1pxC
	 l5D+PRf2b8Ch1vd0u5OAfrZ+ENYh9CceLeXZCgBd8MK4cwHfEbTeqLLjJtT2810fuFzdP
	 56l7uzT/TY65b+1u256GQj29BQJiDiWBs7KvLprr2RrE31+hKid8SdK5hgvOuNr7zv8lX
	 vloDt9KLk8qMwGFBTH6mVErrGm6L2VFq7ffqEQ4wm9XOg0nQd2GDIsXHCcQl4k2AavA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=S1bmZhe5;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FF3606A31A
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 05:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6FF3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=S1bmZhe5
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ea1e7fad99so3297575ad.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 22:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793166944; x=1793771744; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hLkqAi8ctPqSRIwXUevfGPv3vaKrwbjwbnl9pr4s97k=;
        b=S1bmZhe5omygstKNn+fR4XNnXR8jlOAug6FHViW62htHZqlaaV3C+husILnE2vlUDF
         qUlYJF3FxNHUTl83dYgzukZI/bHzvwRlNtWH7gR8fWpMpq/83wx9L/j3lJilHpU9YOHo
         cfLpDdCxwOCvGatK4hqkL/OtX/o2+WygsNxRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793166944; x=1793771744;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLkqAi8ctPqSRIwXUevfGPv3vaKrwbjwbnl9pr4s97k=;
        b=YqlxBq6fby0qo4D+kR49PLpjDpMU1nm/3uiHbxIKG7N263sGmjupKK7jl16BkBdhI/
         2f4NPeVeFuxxGQ/55vEmFbYGoo/DcyIMT/Jd7QBPv/RgPh8TcXGYQbaNQltlYyN/0f1P
         m+kzsA4dQydFoStZ97GKO6VtEDxd0Sl4FbS6ZugrIWMefnnUAsFvmm/YdZnHZs+0ss5y
         yBja6h5pBWo0yORPLtfTJSEcdNG38qU80knZq5P3WyI2lrkF0NZLTA5RkJgK2xiBYzx0
         Y8xrDVzCx4vy5Ue9SaLAztPYl9hk10iyIoFwR4TKOauI03l3GgT1hv0o6c8EC2UITHjQ
         0T0w==
X-Forwarded-Encrypted: i=1; AKwUvBywVwAhV3RCSYNC7SnUmeafJcn++/8XHNETFjJ7UZewi0c0dluifypvk9ve45OoCxPLkxoHn+i3cOI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYWTv3pahX/bqJGvpuvIxb7wzgh63SXuV+7SeGnVib2zZ/s8DT
	6h1ICSze9GJJCKRU3RdgSrkOi4hTAtuGfZRcUBHKhgTb3cCu8lwy1Zc5ZbGux4RDfmI=
X-Gm-Gg: AYBFou0uU6NKy0K5UV4MzchpIxtYu/JFH/O7x/j+quPc1X33RvPWueW9tuttiJx14bV
	2vl0/U/ZbTJE/yqilEiO7IdiQbbHEmCa0GM4xjaEf/orCOvY+wJHOris42vC+U8CjOtJ0DXMR1P
	TFqd+0EOFiEUfBAUNpAMNe+V5wjtT/D52CD7fvjwul/Cc/05IQO8oqbdxMz6aPqsHILnAlaUVUN
	q1n3izW3oe3odC+fEDDVfb7fQc3Obm0pUAsTYtvmvN82s9PQfZhVUF4TZ9Jm6/1p6xPRLTqtLZX
	13KJGEXWHbDknYteq80rhLxq2mKmJdvx8p54vH5jT2Q02BU0QJhTME8BXhWlSbo8oDIfy5NBzYe
	KYaPSq+iEsOuaazFwUfOnngTRxfHdj4kbFzwv4hGLjo8c6xDEXWQCJBgLOt6uujibOsXhX2woFO
	mondUSIfBVfEzgtQRcRQUxhbso5SknDIHvZHZMwUQGVh5T2BcWcTtYdVux+Au/CUMAKkn4T7HoR
	Vfe3sPLyIx2DxQvqy8YyqHRxblTv++D1rZOSbQVrLbGeAeHMix+E2JryGl6XxlvsL0g00K2hQ4m
	a2ygj8LjPGgwAuWtxV3kpphnfRWiaHKCOAWjriOqh/f2wKou4+JZOznXSNUcKUo4XyGWX0eCA4U
	hlWDsVLmNUijPigcU0RVQjL9DxRiU5+DcnIwVpD+U8KAMVFXYvYNhHxd3oF4SF9NuEUtAjWD0
X-Received: by 2002:a17:90b:4c47:b0:3ab:1af3:a0d with SMTP id 98e67ed59e1d1-3ae5811b551mr920591a91.33.1793166944108;
        Tue, 27 Oct 2026 22:55:44 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9019a4sm1368356a91.1.2026.10.27.22.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 22:55:43 -0700 (PDT)
Date: Wed, 28 Oct 2026 13:55:40 +0800
From: Chris Down <chris@chrisdown.name>
To: Jeff Xu <jeffxu@google.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	David Hildenbrand <david@kernel.org>, Kees Cook <kees@kernel.org>,
	Jeff Xu <jeffxu@chromium.org>, Andrey Vagin <avagin@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/3] mseal sysmap: Add mseal_system_mappings= boot
 parameter
Message-ID: <auGOXLB1XZFWcTfX@chrisdown.name>
References: <cover.1793094611.git.chris@chrisdown.name>
 <5bd3c89d733ad22224f296dfa8900769de937de0.1793094611.git.chris@chrisdown.name>
 <auCxjbvY3qPv1sV6@gremlin>
 <auDTMb6WMFUpxeZy@chrisdown.name>
 <auDTptDQsB4xBcz7@gremlin>
 <18e2972cb8520c2e.3137322e32382e342e3434.279dd1.0000sendgmr@google.com>
 <auGNkhSHpBRd2U_5@chrisdown.name>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <auGNkhSHpBRd2U_5@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Chris Down writes:
>- run_vmtests runs with -T expect_sealed when CONFIG_MSEAL_SYSTEM_MAPPINGS=y

Er, the other way around. I meant vm_runtests passes -T expect_sealed _unless_ 
CONFIG_MSEAL_SYSTEM_MAPPINGS=y.
