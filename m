Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4E830F543
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 22:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782339948; cv=pass; b=EtgW9vE5w3MtpCT1AgXkfjbTalZOsnzNpqv3xzLUwKgdTQbkQ68129ndVaKZPriAJqz8qPQwCkL39K8oYeUNXS1qyen/zvxd32xh1gENJ2hfrS2KsnkV1mID2i/dkmX0zL5LwMBI18yfmk6rNzQfhPkDvw7xRHOunYuCBWr3ouM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782339948; c=relaxed/simple;
	bh=RU91htVYuTl4zBdXuu6mQj5pUyKWdyfCeWXJbQ/VXGM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DXBSyY1ozbi3+7XxNvHXnFVV7I7IgYwFfPLQhRw1cmvkTMSaWoVG49GBRiK+vw4QYrZRzWgh+hE6QkFc9XiqAFvgvyITj/INGqk/Te3h8ncH2YVy35h63uATth1eeH/ZEmOB5G1ozFJR2NBZqHJCAweYfZlDPxJtiqYdIDJvmqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BtjRnL4N; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BtjRnL4N"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1363fe80fe8so3137613c88.0
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 15:25:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782339947; cv=none;
        d=google.com; s=arc-20240605;
        b=czvUZ9rdadBPsoptEL84MRye7D180+yLJqpR8N6xUtxGsWVsC9oSN6AJKPiUYJ3qbT
         Rl+fIWeIh+JHYXrLoKofceeLGTB4jbAzKyD/mQESQ6OBuaOZy2WQB/oryc22zSkiYVxN
         inKdsanPILsq24lkA+TeY6GyjNeSm5rEl7/D6vt7m8xIBS6diqikWUOZ+syaMe4ejvTu
         FXPzQy9VtawzjP3y7vS7DtGayBzMjlHfovUeSnKw+Ru8ySilgsHdrYhRabGfaLAKr52w
         pZZTpSIFjnzxVUMvEqxUq3ELNuHphaJuSNbtt8YoeTKUOm8pNr/JftBtQtilz8RQn/0v
         7HDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=RU91htVYuTl4zBdXuu6mQj5pUyKWdyfCeWXJbQ/VXGM=;
        fh=0owjWGMzFaAtctP/PwaKdtNNNKaDIzvbMbrLyr/7zc0=;
        b=E3uG3tekgn7zKTKamg00VsCJHZzI1ztUtLvwIan/H6rQYsfdBj4MBDkHXSaPG7Pl6B
         RIt5Tf0nGiKX9zIuvtFYy+77BtAyIiS5Wam1CZUO6syqhkxJfeUVH5MMcwDP0pyLXk4F
         uFzkFOsZ3wwXAZ0XyRuBpT0OqIlWcqSlPgNQ2W0rAoQNlMeZCaepQVNEWB1eTNDhSVh2
         np58vyroz8OxZp/EUmLSoizxRpHcOb3wJJqOy0/EDmpBOSJuJvTBOemdLPnkU19+p7kb
         /emqWIXMwoIXRe6ubuBZn/8TiUnoOAVUSeXB78H/q54aTjpzmgOeCy3qvsj7u8CotsVx
         LCGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782339947; x=1782944747; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RU91htVYuTl4zBdXuu6mQj5pUyKWdyfCeWXJbQ/VXGM=;
        b=BtjRnL4NLOQHm6ekPigJHihQMZyqkfwE187HWVqOiBGwwKIE1Qk3sMCQzy4rb1uZkZ
         5ZxOJRHjm7M0X/oqUhavAKyEXAjDRI0mptK4KtMIm7/ba55Q0NvWHEc+D1sEMIFaY4Ww
         gzStZLmHYB5rM2R6H07IYNdIqdirzZd0BXAZ5HjHmPdHKRZLSwz324z3ZKutOs9iOUx+
         TF15jvN2D5BytHT36+GapYNvTc/7+8N1f/dBzXSEKcDHMsLe7KLsksLCZ9I7cGIuDf5A
         bFB48Qpig/RVX5NAYFClMMPfjISEPC6Ek9oTsnV/zRWWNWchO145heeetXQaOppkHAxq
         f/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782339947; x=1782944747;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RU91htVYuTl4zBdXuu6mQj5pUyKWdyfCeWXJbQ/VXGM=;
        b=P1prg7cZ3voc+h7kVQFNEyXWEFPFdGp7KKG+1p2U/WtMQQ3dk+RPWBgo+96BQtyI0U
         gyK1Jathaav2qN69Logg4qhzY9AdI+zMgIawE2AQMLsfaOZINQQRBftWTWAcLRldcfOn
         fDgyCtv1qgdLKQ4a4IIPBnAa/BM4cE5JMmu5O0Q93uDcXtR1PUFLelSgS6IV7dvPJFK3
         8hG0YvoKfcVWwW6GgichpLHWkWWHbXa6tvaQQVsxkq3yfMfA0nYNOKLEf62GXLtOIVuf
         27de/NO74wByTYQme+y9jsCHa+FTe76xA2qWChDU9OdIDa8LAXpKzZ+ri0ddhOz527TA
         viuQ==
X-Forwarded-Encrypted: i=1; AFNElJ8CsvzJ7/crPD2xANCZPc921a+g8+cnU8mA116rhjMcm3anNkN3f6l/mXYg5S/Gi7vB5tA4lZZV28w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0zNylyPqHnJjFwuQyZnH88KbDPDTD4fYTzzWwl0veb2ypj9gu
	oeOjx8SlcyuTj/IOwiHFd2Y9uPVVI2F8LZyMi5WcoYnupxm1FKog4XZBEhLWuQVAfmulRSrGuZU
	v8yMq+uoV2GMhmgiQ/ZcGCmDQr4XJdPJP6Ggnd3sk
X-Gm-Gg: AfdE7cmOx2iH0IqicZ4oFn/2PkfZGmu1Si/OfrCKZqFi4Qm6MFs2NC13FHLzYLMjA/h
	a8hXXJ0spx/FJGPIcYA2IVUPjtPOrP5Q/WGviJHhch7N6pVGQ00st2g/P6p0DtwplX2ppQ1nJeq
	sZIQclpif8bJny6XuvVwbDZ4g/d8NnR23sLI/RFqJHeGlMkJIJ0Mr6T0owsVqizUsLzkxIkS+og
	qzK0PU9RH0zqBV0tTHIoLrwugasSyeGy8q4yiWc3DJwn1zSGGjQ2ZkFLanhbNcdm1m1JI+bHsUU
	/gkq+Wz7ZGoR/JhRGaekVhGZNP1YITo4q29onF0AAcSsf/oGJ/+LnN3DA8GYfgvL07WtZw==
X-Received: by 2002:a05:7022:906:b0:137:e6a9:b998 with SMTP id
 a92af1059eb24-139d0c99607mr4114854c88.31.1782339945380; Wed, 24 Jun 2026
 15:25:45 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 15:25:44 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 15:25:44 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ajwMYCSrPlxg-Fok@google.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-18-9d2959357853@google.com> <ajwMYCSrPlxg-Fok@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 15:25:44 -0700
X-Gm-Features: AVVi8CexQH0jh1eCpdBx_tPh-SkjHNyZ1QVX7X8uuwzX2_PG5elQvyIsXuHuijg
Message-ID: <CAEvNRgE8HZDOnexMJeim6TjmxGG1AUXFY2+HH1YyKB=aM6D-DQ@mail.gmail.com>
Subject: Re: [PATCH v8 18/46] KVM: guest_memfd: Handle lru_add fbatch
 refcounts during conversion safety check
To: Sean Christopherson <seanjc@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Thu, Jun 18, 2026, Ackerley Tng wrote:
>> When checking if a guest_memfd folio is safe for conversion, its refcount
>> is examined. A folio may be present in a per-CPU lru_add fbatch, which
>> temporarily increases its refcount.
>
> Under what circumstances does this happen,

It happened 100% of the time in selftests. Perhaps it's because in the
selftests the pages are almost always freshly allocated and so the
lru_add fbatch isn't full yet? (and that the host isn't super busy so
lru_add fbatch doesn't get drained yet).

I've not tested without this beyond selftests.

I don't think we can depend on workloads to drain the lru_add fbatch?

> and what alternatives are there for
> userspace to work around the issue?

The thing is, the refcounts don't come with a label of who added the
refcount so we can't really return a different error for lru_add fbatch
presence. All folios get added to the lru_add fbatch even if they're
unevictable and eventually not participate in LRU.

We could make userspace try fadvise(POSIX_FADV_DONTNEED)? I think that
has other problems, and this kind of makes userspace have one more user
to guess. Userspace already needs to check if the page is pinned for
DMA, and if it's not pinned for DMA, userspace already needs to retry
because of other possible kernel users...
