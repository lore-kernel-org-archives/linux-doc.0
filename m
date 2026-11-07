Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794030013;
	b=RvYvvLK8TMcNNqqLbUp3DWTtPwFF4uUQ/rFLwBbRxZg/8T3zbCwotrOVbqfTCg0OA9sa
	 0sj1M4BPub5KuYU/PvHAbw7B1f6ZsXqwkZnZRx8VTBw65Ol/2hA6+0tJAJq4Bd5unVlob
	 MI0KIiUFFIT9cJv3o3ZwBLgEEmt4yNVBy9XIFK8SkyujMmMGxuJTNm0qQagPw5t1GoGqE
	 52LUHgKdVjrpgQrMNSN89tY4pOX9NCcOTMMHMAAHKAP1Rc3OeB9nQYv3A5UGC7V9E7v2B
	 fXUeCotFvaU3wbdS69U6m+owDqPBp9f2ut1F2+jqIjVlash195GVXq3xITIix3csbWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794030013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=n07BclH5UCpfeNF6l7UkFRCz0CaPQfb02nzFrlh13A8=;
	b=HWPThV5RBcLGPDTXigR41rH4jU5hApdEUC3ibILzfpf31W7W4a8VX1g13eCXZTo3/W+s
	 AnJlAREYU3G6+b5DWYsrcVMGQryjOcrECqGe0r8zskdlnf0w9W06j0Yei5bCkSMk3aRvz
	 bx30IHRGVsBKbrVoXzIV1cPPZY0YriO4sLPa7lD/ScfwZraBTfWjAr1j01QAOCkXS0pvU
	 jDefOu0dNo8w1ReP4EPbYbXsV4UuWWHeA49lZRYF3MTOYZp93fALeMgETxCA1QMaRHsN4
	 k6EcQ65XxyjKPjn8bFjdhCeUyai9AkV+JgfK5oB1PmAdkVB/zKiUg00Hxb7WJ9Zd3hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sJWcWfEL;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4645606A32F
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 05:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4645606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sJWcWfEL
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e9d7791b00so9768005ad.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 21:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794030012; x=1794634812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n07BclH5UCpfeNF6l7UkFRCz0CaPQfb02nzFrlh13A8=;
        b=sJWcWfELjWnmPKnlNLqGiGA9IT8I/5hSE/TtEHyDveF88BOLxQWRKZTy+XmrZwfOVj
         6SHdPkiKpJxyGVajxyZXDAJNOLm1YneO0Wsmw76rvTlCP6JpJq7kIh7hKUE8w9LH3wcl
         oiErSBdoBO2Z0m57+3+ugZtOv8Eo+fy7TevfteP2bg7wzCKQnsvYP3pvod1iTxvMPx1P
         HxrsvidioOJJzf9bQmkzf42dLqQuhAluXTAhswCBjZtCamyB8Kk0e1sbbH926CpEeIvi
         vwIM8rzJ+O0LXNtL77KfGuuh4KESAx+F6yC9WSpVYk4BA6x5+H5UmkRE3gmN4tTO2vGc
         pYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794030012; x=1794634812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n07BclH5UCpfeNF6l7UkFRCz0CaPQfb02nzFrlh13A8=;
        b=k9WJedLH8r+ouEetPMqStNPgemXBlQ1LToghxEPHyShLXyaRBXhjHcRMmwHsJ0tWy4
         grv7pAoG/x+TCxLtr4hkYRgnBrNCLeI6ex8HwbIJbgrfWJoj+TCJW8dz4smUvyGVoOpJ
         5vkSMIG3n9PlV72Ug79g2rdmWTap7gZ51aezclN05uWwbH1QI8L6DWLeOWG93GpL0hk1
         BjBWy4dvP5rHp/VPLk2081iVH9+YyUmb0Iad6EY1TBB0t6qfvQkM1xZlokC2y12s+13D
         paA2hFJQgUg8VpTzdJtfOB8vUNuhikJCYE16hDuN05EqTopL8bFHiqM9JJssFkUsp8ts
         Y83A==
X-Forwarded-Encrypted: i=1; AL+hErF7k6Kk0G1lsc4GtPfTnM8jIs4+Kj5pIyDTdxxyPwDhxm0ojIoUAulQeID9BjMfRl71olZHjIDYm7s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LHGOD8LlruGDqzpfMkuuBFsA+iAxT83l5tys30J4J8pgesXY5
	XNADbz4zUXHEoDTknPdd9h0ec1f2M/8TCcZaR8PRuCm13v0gmQYWyNjC
X-Gm-Gg: AYBFou0ECdmJntV8jn7hGiBQ62pKSFr4O8CNQcIQb3p32M8mSHvB3likXoJ5Tydc4nJ
	jD8hd8AGhWDbWZGxpbSFRnZpLIg0HSnhk2FV1hqerrEjV29CIoNUI1a6Ft9jYREmiNFbdOpWOeb
	kMkgEKKdoa7xsE/bPOYVIhbHD3rRDw/9Exe350JUjYoIOnCvtdNSYjuNeWqln0lc7QPoh7s0L1k
	UcG/0dalTBtVsM1k5E7hgQMDGzuLdUXaDNdklpQ5RJiGhqltr60aqU8tMOxZKjtAN4NLclo+pF+
	j494uxqopWSEzfjNLPqCgEtAXqtEbyANWtDO/KmFXsAmX9XKVUDKefdrpUFzbRlqYmHkf2fOYxL
	99BZULYFM9LTe0PW1gWNbZlx97ixzb1FoOOdZ20EXIe0EQBQv6mbQGBfkQry3K06uaNZ4JSeBy4
	+pBV7dE1+qv6KNEz0ij3O4eFeGI66cqaj/6Y1KLoLpTQW5wqQlA6QbrQ2dWtUxrdUvl9wd97Y6T
	HNwIEo+bZyhtH5AjQTTRsbquF37gV1lf3BrYAFutQowm5IQzUAZv5DhtwdO7xZPuHj+Z/MSytEP
	0v8EY73NTeoZSfRs2/fBO3YGUtZkr66eV04Se+VIrVmoG/pKoV8e9mAhRxsuwV8nv9ogag==
X-Received: by 2002:a17:903:13cf:b0:2ea:19bc:2fe2 with SMTP id d9443c01a7336-2ed404dd277mr59480405ad.10.1794030012078;
        Fri, 06 Nov 2026 21:40:12 -0800 (PST)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:a1a:7bc2:20ba:a479])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47da11afsm10992515ad.72.2026.11.06.21.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:40:11 -0800 (PST)
From: Li Pengfei <ljdlns1987@gmail.com>
X-Google-Original-From: Li Pengfei <lipengfei28@xiaomi.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	mark.rutland@arm.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangbo56@xiaomi.com,
	lipengfei28@xiaomi.com
Subject: Re: [RFC PATCH v7 01/10] trace: add lock-free stackmap for stack trace deduplication
Date: Sat,  7 Nov 2026 13:39:54 +0800
Message-Id: <20261107053954.3075147-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103174905.701e078a@gandalf.local.home>
References: <20260912083753.3426176-1-lipengfei28@xiaomi.com> <20260912083753.3426176-2-lipengfei28@xiaomi.com> <20261103174905.701e078a@gandalf.local.home>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pengfei Li <lipengfei28@xiaomi.com>

On Tue, 3 Nov 2026 17:49:05 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> Let's get rid of using rcu_tasks_rude. If RCU isn't watching, then we
> simply discard the stack trace. We do not want to add any more code that
> relies on it. If an architecture wants this feature, then it needs to
> update to not allow tracing without RCU watching.

OK. v8 checks rcu_is_watching() before it loads the map and only uses
synchronize_rcu() for reset and free. When RCU is not watching, the
stack is discarded.

> There's no reason to use a rw semaphore here. Just use a mutex. It's
> serializing the reads of the stackmaps from user space right? There's no
> reason to have more than one reader at a time.

Yes. v8 uses a mutex.

> Instead of duplicating the open coded free in ftrace_stackmap_create(),
> move this ftrace_stackmap_destroy() above that function and call it on fail.

Done in v8.

> The above paragraph is unnecessary here. If you want to add it to kernel
> docs where it is user visible, then fine. (I haven't looked yet if you
> already did).

The docs cover it, so the paragraph goes.

Thanks,
Pengfei Li
