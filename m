Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15132EDD69
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 09:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852997; cv=none; b=iGycpslT1L77P/9Y473VkfcMltf9UbOAomDojpS63z/OS1uQoaVfPJ8pk5lhvL/FqFGgy6BBVytWCxaWPxPhCqIsA7+ZW0BPsZXuJkD+YoJxf3BoTBERfPKXq1iu/m/vEOtjf8aFnIhTmsl5t8XWPUYTVfj8eNN9lOPFruk0iQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852997; c=relaxed/simple;
	bh=HW+BHIjHuyTX7OAC9AGqEECbSB0U1bNiaGYXhX8ud1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ED+lKgcBY6HJlfEw7TipKGSgPnMpt9AHQ04boYMDPbcUgz9RqLnDzs9S5DGekWNh1iodOuC1DnmDgsuj5aIqcYmVdYcegmI1XTdqptCtzeIVIwy5n/tV+awfWmSAzSLvVOLdB6685k2yADu2YffV17DgoCAryvlr8xfzfG+MLjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G6McQrtI; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G6McQrtI"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8823e39c581so33186776d6.3
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 01:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762852995; x=1763457795; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HW+BHIjHuyTX7OAC9AGqEECbSB0U1bNiaGYXhX8ud1c=;
        b=G6McQrtIGCYwTv+qtUcpdpxsjOBOcbABhj3mgP1FPSF14qzrygXKRbZTfaBEW1QzXQ
         ptH3Eoj5bvdZcC09088K3MdhmAm625hZkmlu2ZALnmSVy4Nj5f7ioO62gatl2JkW9p+W
         1jXtM3MUjuew7NAMzeHrmR5t6sLAZhIM74qWg8gr8IbF7E187Ihj3yweySyWKcSoozT2
         Qnr99/VkuaRdBbh87x0j6Wx9VgMiDxfw9FmZloB2G/hux46/1UwpN2sZ07OD2gd5aO24
         uCD6TXHOo5Abh9hjV0RZtuvY9Juht4VuhNxS/8hC0bNGMpOc949ynwkIGYpllJ/GiXi7
         +Ddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762852995; x=1763457795;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HW+BHIjHuyTX7OAC9AGqEECbSB0U1bNiaGYXhX8ud1c=;
        b=L1LSlWdABwYPIDPjROfGpx6ei3uAwA0iQmTKmFqC2cvOoHcQtd/cgu+6rDB13SXDYA
         eSwOoxOLVJiJsuMm7MdfAHzeAFFc7WekPVUFDyWQmoyE8W52ys0Hky8n2B6c53C7QqdS
         h8S2SwBl6yBwtQ+yrM5Cn/dUDyBGYLe/lXOBo6KsL9tYXfaQ63NkYzWNgCa2MWs49euf
         lhILJMP3OtEc/I/e8H0vLH4GrgNsmKKgQ+uejbIZq1sE0uBn5WQGhM9E/z3euX1ouinx
         SwQWwcUDl++I9XUzBJ7YVNggeICvXfmKDe4ql2Mz/k2W5CmS8RYF5vzQ+CpXJZ9DO4p3
         LPIg==
X-Forwarded-Encrypted: i=1; AJvYcCV515QCSDnokDh2dE0aNgn6AT9Zi1em75ih9OFhF562vC0jS6x7yvnL1Dnb8aWbIH6pLMEJibm8IeA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRnJzqrcHhb2AvVRZjiUUVjmsp6WxVda3JMD6kOMF314QoH5tU
	RSgLW9L5IqyOrSvT2GQHJvfClSb5jnbVUxsPz4eIw21Ls/dvdatOeHImoRnee0xzEqqMHfl0/04
	Du2OXLHl7RQnWjXHyrtq3OpmjulqB6edkwDj1aUXu
X-Gm-Gg: ASbGncuYGPmPeQwnu7prjrO9Bm6Sm6BIbf6rKPXi69EfQsGeJqPZ24OBtOG1McF0RbC
	D8rz0ECCbookCPBzM8DcPwWs0KoXf/Zb7sa29mr5x0xUG6yqBpfcMwwia6JEGDtPpEOi8Lag1xE
	SlkouAZm7JmQ6ZrVWsDFGQ1dYf/tvCYBy1gbE0YWyiuG8i5oDrVO+1F6kOseMlaLtmNK+fM5ZrJ
	Q+wgH+SDKg++g7TkZlDRYb6tT6wcLR4NQ/jU+t9f+uh5yJSzUJsvnmoyCvmwOB4dDg11583McC5
	ezNxhAkl29rlrqo9/veGW8yZqA==
X-Google-Smtp-Source: AGHT+IE0yzs57LETS85djEZyTYXW5DmddvlcMHLtxP59+D7EFGLVQ5m9xCUc4smiAAZV+t8Cn2za8HGBMs1SjTj1Y9o=
X-Received: by 2002:a05:6214:1310:b0:880:3e92:3d33 with SMTP id
 6a1803df08f44-8823873d584mr174202246d6.34.1762852994390; Tue, 11 Nov 2025
 01:23:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <8681ee6683b1c65a1d5d65f21c66e63378806ba0.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <8681ee6683b1c65a1d5d65f21c66e63378806ba0.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 11 Nov 2025 10:22:37 +0100
X-Gm-Features: AWmQ_bn-gtNt_PIr26xFMqgMDiPlRCOzgcJVubPfw4RNrG4hXg8UIUOVQ0zkb_Q
Message-ID: <CAG_fn=V46UeEvrPb01VRk+60-wL0DA6Y6ZD5HAfVLzHcgRh+VQ@mail.gmail.com>
Subject: Re: [PATCH v6 05/18] kasan: Fix inline mode for x86 tag-based mode
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

>
> Explicitly zero out hwasan-instrument-with-calls when enabling inline
> mode in tag-based KASAN.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
Reviewed-by: Alexander Potapenko <glider@google.com>
