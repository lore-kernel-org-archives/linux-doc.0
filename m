Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5062DC35C
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 17:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762796321; cv=none; b=Id514wejclcHc7Yw5WKuWlpAXJfIlTX0tAdjJzWRqGc9XaSFINN98BofI1SRAOCvsKmULpQvdY/73C0RXahw6vSL01fGtD2xQNEUU0oJpRDYxC4ZbfddiSknOFVLXQmPzVB3/1Ku0iKVeBk6S4EgPPQzp5RU2KE0VgmZEfQvTB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762796321; c=relaxed/simple;
	bh=M1o1kOh6VqP4CN6/zqp8bynioGZKC94OCphZddFeq6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tF02GHVpx0zHqV0kN2k2imCRWkGJ15Dh2i1GQaJUDue23Xu/ASsrY4w2evXPRvZQ22OD4/QeQBpKqXIEJXs5Eb7Z4Q1fy8/PNmrZvax3vCGyhrk1W1Ea0TQD03XWqFrYGYDUXA/RJFI60mDQhj/UB3/XAEzPdJNX5tgwwrn1Evg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QKQrz37d; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QKQrz37d"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4ed7a7ddc27so32250251cf.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 09:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762796317; x=1763401117; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YSOpGWJwXMs0s/g4qCwlIsfD5sl3RCmHWkcwp+GKrsA=;
        b=QKQrz37djniZBKn9uHMmxnFLXbTU+N404fTvpLi2IVx4Fp5KARKFMni4pECj0Y7Oqy
         TJTFGqPshOG30+TByOWsumL4SG/47k51TSX4bSXChr4DNUjwSqLZRBCLGecp4+DOElfE
         4kkIl82doNAwf1TSq0w4+9Kr9i0yXHIYPX62O9at/fp+qUA5cT8OlLyQJrzWuVU3g+M1
         1YPbBVYy3+kxCB/SijXCX7Os0jrxm5u4I4CSNakSuTBGSjjHbLrCRiMpoOiw4IZgHDrE
         lPWPu3jEj5Gd1GfXaGkNWzPhS6nk49Zz7Yup1MSumjddXPOWMIeWKndH50GGN8Y+kl1w
         9vLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762796317; x=1763401117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSOpGWJwXMs0s/g4qCwlIsfD5sl3RCmHWkcwp+GKrsA=;
        b=bjj8iqVBWc/LhSUWTHD82rOJG3x4BzVRLPKSXB1MidAzRrf2HvM+3dDk1oMLnEVn9a
         uPa7Bm8w4qUaLQqCLPR8CTQIvIOLMjmnoS6u94TEZ98y8C653zXsjQrU469o2FeqFto/
         HL8heTDNZDiwd4sdnWj+EJReO6FTTR1rIYJzb8gZJjGSoyfm/dixFxZfu5/4z2h0qS60
         XomF82xz641+0BfXvnur3OhPL/RAVXZqX/CMrtDLURvbGzF8vHQ9PvO6Ass2jiRXz7S7
         WV26Mjme5UdfgmeMJet507aOqskXxRX0zi2N1ZfXpjnz098Mo796JYEkQo+7QThujdOw
         u8Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXnh260OvWGcBvOBhstvOiNZa3jM9EIRhPA4vJiv2wKnZPwBAUjcJz8/OOxhLmTevinS5+wbswTzak=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4XUoOCmAuMKbMNmFmT3omKqWaPs8g/4mQqDAK+BZC04bR8ZE2
	Xq3NwsodSlf1tgiaHU+UZox0I+ybeM90/3rbulCnXlWTY3dQg2PoxvNlUI8Yyc9L4L+W/LG3QPL
	GVHuIQesAtjwZiyzM/9XwOEi5PuvEl15Hq8AAFNCn
X-Gm-Gg: ASbGncvodu/lQNbOx0kF4OSgTTNyuUr5yWFAm/4J8aTDoElFL7Bnv80/tOJcsim/OJR
	Az+jGXNIoUd4qQyUhT3TWx3FaZX1KKITBM3u8iAscSSjICzK0/ElmBIs+iLITCCs7pPMSkLBa4x
	jNGrd5RgPa2YD5N/rn4qYa2cffmOXp1L5GXTtc2GwucdVP6YCUSETeA4IFq+d645rX7P3h516J/
	au88rQj8U5MON9HEH7/rT0xLuTVQBpCv/TXFZAhjW7XNeAKGJWj0IVRLA3jrZ6cErMxqkvhctX2
	43nw2Q9GFm614xvZlRfYxkmEQA==
X-Google-Smtp-Source: AGHT+IFr1gTkxV/2KbejHCAfn9cmRrtPm5R67TTLAIre2TRAH5dAXb9YnE16dsLdFYHK6GdY4jiLnljrS99RBkOdtpA=
X-Received: by 2002:ac8:5856:0:b0:4e8:baad:9875 with SMTP id
 d75a77b69052e-4eda4e70d87mr109099991cf.4.1762796316364; Mon, 10 Nov 2025
 09:38:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <8319582016f3e433bf7cd1c88ce7858c4a3c60fa.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <8319582016f3e433bf7cd1c88ce7858c4a3c60fa.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Mon, 10 Nov 2025 18:37:59 +0100
X-Gm-Features: AWmQ_bnlgBiH0JekOxzwX-3tPMF5D_wHyW4PzCjMfs9TphH4P9izG_-i06SXddA
Message-ID: <CAG_fn=VUx7GkcjuYO3oRH7ptgKVtzQNChW1xKL+1SPfJ=XvWwQ@mail.gmail.com>
Subject: Re: [PATCH v6 04/18] kasan: sw_tags: Support tag widths less than 8 bits
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

> +++ b/include/linux/kasan-tags.h
> @@ -2,13 +2,16 @@
>  #ifndef _LINUX_KASAN_TAGS_H
>  #define _LINUX_KASAN_TAGS_H
>
> +#include <asm/kasan.h>

In Patch 07, this is changed to `#include <asm/kasan-tags.h>` what is
the point of doing that?
Wouldn't it be better to move the addition of kasan-tags.h for
different arches to this patch from Patch 07?
