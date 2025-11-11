Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E042EC55A
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 09:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762853721; cv=none; b=G0+pKFf4EjarGfzOXV++U3GJhgW1HU1/UwfcgPUI4taaVEMbvNUQyhykUc3HTMb6n51xl4doG2gu+0UJyCP93c0RAwL5Y8KQHyyv9MFwFYgBGjQD5HLptWGOhkw7PzVpkkDhMxqwrHj/vbya9Ki51CLFLPulWkUbwE6P7ZjTAkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762853721; c=relaxed/simple;
	bh=EetqUyAEJqiuKxD3fEI2nbY8lCOitzdVH7lF4O8jjNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DbRAwT3seDBMYM5XO/N5bk40KZwsUgOTriMednuwpsaotvDpT3tW6ymATVWWKAHwGBy1nGwmka9wkXYFNzydM9PSX/CfD4or3zhH1s7AoPLSwM06PPCmdlzV8oLFUNKb+iqrcynA5gocaNrBScUY4OJSrnYOqE9AKvmIQa3YlqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kz7YMOlC; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kz7YMOlC"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-340a5c58bf1so2810403a91.2
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 01:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762853719; x=1763458519; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EetqUyAEJqiuKxD3fEI2nbY8lCOitzdVH7lF4O8jjNY=;
        b=Kz7YMOlCp0w+UrHY5twsYY8JF+Kv6/Dt+AXnLPCZ7Tlf6hTZaP85WkxpKixnmSKJ73
         yat5/nkJcYMecBUvXpPhOR2qauA/5M1fuRClERrZvacDw2anm4tkig3nq07KS3yLBCKO
         FAGgSaBjNDaFloCiyqHxCSSBMAZs9gXY52h0aMk+t0Qs5nudNVBUEu+0Vco4i37jdJuq
         pB4fqOJkVWqp9TsIgyEwyVUJiUk91mcjBkQlXKstFvl4YIGBvUO46Jr5zO+NUuDS5d4P
         fo+IilEs++lxM8dWoUrXcS+dya6iOfmPtlKK9rPF8LlN05X4GCd0jsxpegsA5Vsaxolb
         cBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762853719; x=1763458519;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EetqUyAEJqiuKxD3fEI2nbY8lCOitzdVH7lF4O8jjNY=;
        b=JkFNI2LMzht+HLXB0gXUt6dQHLQ7SbiG+/RiVNwEkcU+eif9L4zOA+YrcwIDhym4n0
         35mb+Wg24c0eevvwm8DMi4vi0pDxQXgmEeQzovvc7ZYONUBbX2ZkEbRaCusqiwrhbGfk
         1yib0nW1OmotmfLZEVS0MNC3F/9gHkBK+l5FFsRUmRFjgWE3Reg/Q2MTZr5WhzDsfKZE
         IOm45UXqakaIlF6NSAnBZiALO+VyHpBDj+uX3ZNnI56LTaGue+dp6sUgRh/bXWRRkk7R
         2Y7N/ASMsmV/lM0Ocl/Cc3nGXGaAOvY4lpvM7mS3ROo3Mdn/lW9gr7wnuSSx20bKRteZ
         CyaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY9VmQCmlGjoZX/mjeVlw8jS4pWwib/naI6Mza64iXQLi2wEakbMKrKNtBhtwxyVmB8eNWd/qG6hI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI1j1NZqZ6d0n7HUdgIpkkHwYRkj7QZJD/33zbu6F8RH6t+cVz
	8Af+dyfImXCaAIOIllLkR1LVL+iEa5scWIvanUyo//qIVhoSbzoaJvMrPfk/vq0zD5rQGxDIH4A
	GLZDfPo1N3PRMUxs+d/PSJjzNSwep8JY1PB/c5dSv
X-Gm-Gg: ASbGncu1eeAHC9KPctnnfRnzIsPOQCKkcVJ4cUxEYmpVzZ5aa9ioHoYFPhnGXhqPgnI
	J9dv2483QPKh3dS9WOWhmh5T2+heeR3vVWr915G9GZTx2CKxVnhsFY6W0UWasMI5UPtLiOqJQM9
	UqAcF+wQVOLJTOVYL8nYJfH/N6sNxRTRNJxiwJuAaSDPCm7GvSkgD/Y5Z/i84MB9qlq7zVc67+D
	A60eSuyzAJ4pp9Hf1mAQd/oyfDpf831SwiOfA/83+566wN+qTnI35cFiWkrD5toVm+yn+QzO85m
	Wfe65foeFsd5djhqBmYGSUQtew==
X-Google-Smtp-Source: AGHT+IE1gIu9BAiXsX0H1O+GFnCkjCXA7LjUzdEGNtie4OCQJL0hEG9RvsKQFDwhfkMp+tiOpjzqm/vRLg5+ZmsNZZg=
X-Received: by 2002:a17:90b:390f:b0:340:c151:2d66 with SMTP id
 98e67ed59e1d1-3436cd0bb4cmr14245240a91.30.1762853718758; Tue, 11 Nov 2025
 01:35:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <fd549c974b53b5410dbf85c0cf6a1f9a74c1f63a.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <fd549c974b53b5410dbf85c0cf6a1f9a74c1f63a.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 11 Nov 2025 10:34:41 +0100
X-Gm-Features: AWmQ_bkZUqiS435kDnMhK6mmvyG8PwqBjo8fr1ltJrKRlyqzMnD3vTHwKYRZs0Y
Message-ID: <CAG_fn=UoQeoHh6Bpy0YOCywpfaimuYZM_d043JfxLVReW8PdJQ@mail.gmail.com>
Subject: Re: [PATCH v6 07/18] kasan: arm64: x86: Make special tags arch specific
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

> -#include <asm/kasan.h>
> +#if defined(CONFIG_KASAN_SW_TAGS) || defined(CONFIG_KASAN_HW_TAGS)
> +#include <asm/kasan-tags.h>

Perhaps moving this part to patch 04, along with the newly added
kasan-tags.h, would be cleaner.
