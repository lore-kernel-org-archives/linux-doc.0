Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558663;
	b=oykUESXxiEMxhnd2KrO4n6kQRoBi5Qv72NxB+eh/ujFrx4+3F4CmSYMGGM7FYIUrgzdC
	 ubPlzoaidbhE4vZgdYZ1xT0fDSo3Sudx+EEMzbX/QW3hRzuU44gSmIGTFbcT+Ut0GaXHL
	 JBiP5T8cGX8sHdWBU+73fwNnGLw3LilSSThojMVYz54061t4CNTd+Jrh3xasbetv64/l6
	 YGsLn9v0cSYisE8Ci4D7G6u18FtYdtGYjVGuPZzVsysPnAezPaU+gawMZ1Jdq76bFVnaW
	 OCWU30zpIdYWQryJ1clZFD44ASgl5CLSU1TQLlKo1aWunZ67ykOJUIaXrkYAfqQkqRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=AE6LmlUfD0UD/MlCg2IXWoqx7xIo+3XrxhesZ8DM7Lo=;
	b=05qyQh7ZHj0hdCXB722Tm9ZGxik3JvhZskxI1bBKZnly5rh0L9wherrHfqCzvsBMw9Mb
	 irsr6grSHg1jN7SXweDUGwaa0GLuYiumsqx2CxlWtVJvzBwSRl5MtWbM8kC6ou+wyB0DY
	 GrW/z+0czjNpaz259AfzgvSgbfS1P3rl9QwvrwM88mz0k3U/ukf5VkHoIeoBFwYiWRNLa
	 vXpiJD2k8TDeOVUqQOhVu9bP6oCXcqgLawBr4Nwmgse+d8RztPjJV9gQLUwpFz9W5oOr1
	 9AcMbUlT359BjQrPNZ6n0PGqdJML3fHG9fg8Get7MAKM5RvC8UAVOb6lr08iFk9ro0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=MgGXhDWw;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AEE606B1E1
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3AEE606B1E1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=MgGXhDWw
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b6b22be970so210528b3a.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794558662; x=1795163462; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AE6LmlUfD0UD/MlCg2IXWoqx7xIo+3XrxhesZ8DM7Lo=;
        b=MgGXhDWwYqVoGzJV7PFTcjwzcTdpBKMUvHY8QEaDnV7SRHamPhA1DJy6yUwDGoWa45
         LpTPTHlrE4OBDNbMZwPNXtMa/IjnTaGl3MVDBT2zN2/pYU/JzboTINCcQoG5UMULzy9K
         3luLrf2LbhZuVkGhsQ3PYQ1I16vTGZllMcdco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558662; x=1795163462;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AE6LmlUfD0UD/MlCg2IXWoqx7xIo+3XrxhesZ8DM7Lo=;
        b=oDY0imgGxFvaH/keHdEV1XaDt95v/WLTxX7gHf12/Q1pRBRscLcwzG+NXPk9qj5aH8
         1eJDAqt7sCUM8uPwRgxTTv+T3rQfL6/jncZ1uC8Nznymb8TLbB9P6bhceETeoQcLUeHw
         9mRpTrMbFfXxoJ7BBnLvhrwQXSGEl+QOGdmsxfoPvYGlblr60piHmTLNu3sNH4Z5Bu7G
         RKHhGk9scy871ry6u9HvXd8xHm4a33h2vePj9PApM0RCnQDlKX8jmcYAgd0tP9EozRte
         GXYPtkSQGTv9Igl+TZSGPEBtwamC25A5fcHiAnCPzS0RAlxXdLWcJp9kpU7hc3T8iMPh
         rg4w==
X-Forwarded-Encrypted: i=1; AL+hErFikWelazREudmDNrRIq5CQL5nPNMA1+hIyteiCQsTeI+xnc+X7c6PiXJEwCwVb691NehMnOSFv4HQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rONQAqZQCNTtQVwyPVxe5T170VFIdK463Dnq6O+G59K+mnlt1
	fHDadPp+7EWV13fGng9K08ndq8cFtvmgWLt3Dt8PF7NYXFIo8cde7UVZX3Th9kAft5U=
X-Gm-Gg: AYBFou0AySBTO5jH2Xf1LG1DtaiGlk2nPgjrsfg/t0e4kV+T73L4AXnX4NI75oi4UTM
	X1KyTLaO/dBoKIDoFypHhxYlqet8JH6uYvyPDJjWbVTGX3C8RdG2qS8a+S16mDCUQ1EVd+7w66Y
	JZ9xJ5Kdt+5dW9f33Ey7mk+xnKZece3IFQP/HRcNpZlZAwwTtG1J37a4Zkn7p/kUAPAWcPyHKfu
	rzB0pk0lCDhf/cJgC35c3c+KFfO+Gi2qLaM7T2bn+LPChFEh3LUKT0vR7zLP5V9s1tQ9zV7jUD4
	dvIe+Pb058aqLvQChi0sQqR8y28mWLy6Ejfr9Jia34nZQim6uTeSypP/6QiBH6k7F5PytU/LYk9
	UedtKeec8FF2PyjRgIIKeW7jSFQyymatNkku6aPAEqne8ajG9g0xaPa8GWRBus7l6yPu4s0OAD9
	A4vpxTO3Z847yQFVriA5VbA109QzsSZtUzSnBz9TOfoJmOR3LfdkkPwQjl1jloLx1BoZTMx0dNm
	oAk5hr/+MFx3zNjjy1nuItixJRdsNsngDy1mUCo38+vQb4AMedRBLcQ0+gk2cAC4a/fPO199/JK
	CfMjWXR7wKRgF9MYp+hcJqaTgD8kAgkeDtExzWrMDbhMBZ9ZVmmOY4bTpC30vK6Fe7rrnqd9n1y
	cWj4UMzeG9aT64UDTA75pRgoDFZGXkn5k10eQtv9nvIzoZesf5BukR36xX7AFMjpyYLYgq6eI2r
	htVlFTPJPUfQNrwUpKoY1pYFHdtN1nnGmzGxDXPK+VvZ8RNHC4oIpq9nW8pNw=
X-Received: by 2002:a05:6a00:1a8d:b0:89e:a2cc:8263 with SMTP id d2e1a72fcca58-8beb21ce39emr2120292b3a.5.1794558662388;
        Fri, 13 Nov 2026 00:31:02 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bececcc9basm738703b3a.3.2026.11.13.00.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:31:01 -0800 (PST)
Date: Fri, 13 Nov 2026 00:30:59 -0800
From: Chris Down <chris@chrisdown.name>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>, Baoquan He <baoquan.he@linux.dev>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 2/9] kho: Make bootmem reservations visible to fleet monitoring
In-Reply-To: <179443886218.2329176.10742245280418377061.b4-review@b4>
References: <cover.1794383544.git.chris@chrisdown.name> <c41c639fc5f453d60a265ba42a233f2ea5b48319.1794383544.git.chris@chrisdown.name> <179443886218.2329176.10742245280418377061.b4-review@b4>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261113003059.056dd036a6546756@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Pasha,

Pasha Tatashin writes:
>> The reservation varies with the kernel, memory size, NUMA layout and
>> command line. Our fleet collector needs the actual size from each host
>> so we can decide where to enable KHO and catch a kernel release that
>> takes those hosts over their bootmem budget.
>
>HM, that works for cold boot not for live update :-)

Yeah, that's true :-) A kernel we live update into just inherits the areas, so
we'd only see a release change the size once hosts cold boot into it. I'll say
that in the changelog in v2.

>> Today the collector would have to sum kho/out/bootmem_len in debugfs,
>> which isn't a userspace ABI. In /proc/meminfo, free bootmem contributes
>> to CmaFree, but the reservation doesn't contribute to CmaTotal. The cma
>
>Is this a different bug?

I think so, yes. Bootmem pageblocks are MIGRATE_CMA, so their free pages are
counted in NR_FREE_CMA_PAGES, but totalcma_pages only counts the areas that
mm/cma.c knows about.

zone->cma_pages is a separate problem. It only gets bootmem added by
init_cma_reserved_pageblock() in kho_init(), and on a KHO boot we return before
we get there.

I can send patches for those separately if you agree that bootmem should be
counted in both. It wouldn't give us the bootmem size though, because CmaTotal
would still include any other CMA areas.

>I have some concerns about exposing this as a stable API. What if we get
>rid of bootmem or make it resizable? We only recently renamed it from
>scratch to bootmem, and we have been exploring for way to optimize it.
>
>I would keep this exposed under /sys/kernel/debug/kho/bootmem_size for
>now, and not worry about it being stable.

That's fair. I'll move it to /sys/kernel/debug/kho/bootmem_size in v2, and we
can look at sysfs again once bootmem has settled down.

>Keeping it together with the rest of KHO code would be better.

Will do, it'll go in kexec_handover_debugfs.c next to the other bootmem files.

The kho_incoming files in 6/9 are already in kexec_handover.c, but kexec_core.c
still adds the group to /sys/kernel/kexec. Is that ok, or would you rather KHO
set that up itself as well?

Thanks!

Chris
