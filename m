Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DBF4418D8
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 17:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768931703; cv=pass; b=JmxQIBooH6C+SjLOcy1SoqtFXIsMGSMjINrgkG0SeZImth3cW+BMMDfZE2hNqoRDJfC9xM0MubNFfuyx/aN6s5vnkNt6MwRYHXpWNmZI4uJYYlbxAQ0I1sVVkYbu6RJM/MRMfaF3nsyITSXnJQ0FaL2mm2c2W5DWp9g+PNbeMYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768931703; c=relaxed/simple;
	bh=oHcdxkzTnAC7Ywax8Vckvgjp4LUCRYz+0yKN85C0sUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f5sPpqA6ixLj5xu7J9PDjm4y4HpnElRZqiyup2zDS8MEct+hCNYhyJeIDXAgwCjXTZ4UOcDalQsawYb7bntduhN5QDZw4EMjPo9EG8vgfDu1f8VUEiLyGfymMNWbGOiowTTYM18bm3GiJFdRDwrnq55N6emR9EuFuEy1BP7VoOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiBz+h/a; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiBz+h/a"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so3252093f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 09:55:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768931699; cv=none;
        d=google.com; s=arc-20240605;
        b=irDQXiM/9CJZhD1hENt3b0wlR5n+AcDIDTxuuI0VrebbAzSU9yq8ullYl2T5IiY4wo
         EXlvH9jO2dNykl3S+VQGsYMrynrG0eAvBB+R/LKKbsYtpjQ+OPojGcPLeFq3ZLJgK9CP
         VX3P39N89HnpXGflCDkujDjts2nRg4xaWvboONZ5kT5K5lw8VV+jJxjEzlslaXwQM023
         6D/rW8XV8shrcHPy5f/ca/enWsqgPVTi9P91/5tW6TRxhKSHqMCKvO9dKYm5aEwsXYsS
         HY5nU83Dna5y3WpXkUHlMGDC3/k1DnVJoZkvn8u8h/MHIFiGPhx6/4AKUhMJ8jDgSEZQ
         7xAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CSI8A4TsHJKLPFzycUoWUfFc682TNPoMjAF0fDDKMCo=;
        fh=inTtaD8V3rYIzVTKCbPn7lRU0qqkyE5HNQp3b7Aoxsk=;
        b=cD7f7a0Vlt/MUHzdNA0oixbPPYn3ALfkBMu2y6tDz2eAex2EPOhxE434jgE2LEIUU1
         u7NkYFzDyCGOCZYHHgZ4pSGKxAU4LDXqcdXjFEfmqdv9dAWvLjpwVzqW386XEWJ8XHOW
         i8PJL6SRECgscK2xmSZ5/uKAIuGs/Qehctn8vO9gVS8vTAXg8WnJDWl8kXUXqJDl8F7b
         mj8co7vcD4j0zYYXRYwml97Ag6F/5oyKqOWkQcYjftK6bt2hJ68rfmeGjA4YMIElTH7N
         dvr19fzhUW8bRLb8cox4t7ySNRcXLnPxMaHFgDqJXbtCOSRsotXNFad0fuLz+rGYcAFu
         ZnhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768931699; x=1769536499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSI8A4TsHJKLPFzycUoWUfFc682TNPoMjAF0fDDKMCo=;
        b=eiBz+h/adRD4Em4CAOvIQdl2nHB4yFq4jv6rWxqr+54/c615zVMIiuTc63wA/yStk8
         Thj1tW2UovqgGXY+4vRzqgt/WlLKkZkWFNyVbyY6mIwSZnJQn775YBVaVB2rEZP8e+Mm
         l5NRmYE0vYnn0IICHD8bF2ZAOuvFEPa77P0VFf/Q+0z0bNnM9I3j8d3ujQoODmrrZbaj
         0NkzBYOFYLaf9LxWVoeCAjRoGkA93ixdK14uJNVnVMirdyEzHQ1PwK+yJRIywjLpqiZY
         bYclbjgffVlQSwXWwCOJvms6AaOegnuH/NMUTWwF0z/8zOqKKQ8w02HKufypU1y/5VPv
         W/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768931699; x=1769536499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CSI8A4TsHJKLPFzycUoWUfFc682TNPoMjAF0fDDKMCo=;
        b=VBpI0a/5CwdagMdTr2lYzzUVfsPzkR/WrAxl6SedeAFY6Q786UleBM1KDchY0ns2a7
         bl40+OhMpH3vMsgPLeM2BziPdTnuBhgexA8wVS+EDqhBTLft5rLYgXUtije02HuVq5lj
         rdmPZMpbz8g93imrcAEOormY8r6Q7RZXPDgL5UkdMgnh+8uYauSX2e/1+t+RB/VrnqHW
         ZMU5uAvWSKxZs3J+rswAuee0MuWs5gvsduzEQTNQxC4Oc90aD6x/pfW+4YFhZBXsb4ew
         nZ6JEu4KC1VZ9P2NMtHkWTMxzfX7vvCXEmmfnUM5FZQTIS9g7SVRq7SVeeyPRgODQR+G
         CkcA==
X-Forwarded-Encrypted: i=1; AJvYcCXrCUfYm8hUyCiYccahw3X8IGECVYFj8MCXbrfFOioYugxNvDBVyWLcVUkwt47ZZ8gCeMFEe6ICamY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4QathelBhN0xIjfZhF+6rLQCzDHmsGQ0UTsdzWR/uLJrZwbux
	12kKzQDd1+J3G94ArNlOjHVRh1yqCAgrxt2/E4fKBP2V/BIatwjCDZSq1FLae6rz+j4HG50EdQo
	7DqpnD0VcOHm3A5m9D2BUJmnKHPC/Tog=
X-Gm-Gg: AZuq6aJhaZk/742qZwKgZnLGIQ+OBht3VXFPIJ1qD/09juvr6DRvi5asXVK0g02CJOI
	NQOHgKD99LuGvgPOO5q4IDWSiaaR2dhktHzIc8hdMpHGjzee0ZtUF4tQrjQNKirdTS2c1HqfA8s
	HonbVCMZnoEgBFyNkbRBa5sgky3U/lIQ46lDiSDyOtZLg56G36+Ine0DQL1dwNYCVeBI18k88hY
	1oDZ/8OJDC+ZzMW8qwMgzhWYq2mpinXmuPPHotaFSfg2dyyW/TKhn3/UDkryXhUA97RJ8DSBfsB
	m/6nfFs+awAU4r5hzl4G9FgJJ89BzQ==
X-Received: by 2002:a05:6000:310d:b0:430:f58d:40e5 with SMTP id
 ffacd0b85a97d-4356a051bbamr17722513f8f.30.1768931698830; Tue, 20 Jan 2026
 09:54:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1768845098.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1768845098.git.m.wieczorretman@pm.me>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 20 Jan 2026 18:54:48 +0100
X-Gm-Features: AZwV_QjKpw6bSXc49tC7Ft6D0ET5YLTkUvlrSRTXNNU3JrK5sgQbId38njXfil8
Message-ID: <CA+fCnZf+U3RhmMeGxQ-UypJw2yGd8RJ0gFKrCXsC1eQ5YO-eXw@mail.gmail.com>
Subject: Re: [PATCH v9 00/13] kasan: x86: arm64: KASAN tag-based mode for x86
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: chleroy@kernel.org, surenb@google.com, justinstitt@google.com, 
	nsc@kernel.org, jan.kiszka@siemens.com, trintaeoitogc@gmail.com, 
	dave.hansen@linux.intel.com, ryabinin.a.a@gmail.com, kees@kernel.org, 
	maciej.wieczor-retman@intel.com, urezki@gmail.com, will@kernel.org, 
	nick.desaulniers+lkml@gmail.com, brgerst@gmail.com, ubizjak@gmail.com, 
	rppt@kernel.org, samitolvanen@google.com, thuth@redhat.com, mhocko@suse.com, 
	nathan@kernel.org, osandov@fb.com, thomas.lendacky@amd.com, 
	yeoreum.yun@arm.com, akpm@linux-foundation.org, catalin.marinas@arm.com, 
	morbo@google.com, jackmanb@google.com, mingo@redhat.com, jpoimboe@kernel.org, 
	vbabka@suse.cz, corbet@lwn.net, lorenzo.stoakes@oracle.com, 
	vincenzo.frascino@arm.com, luto@kernel.org, glider@google.com, 
	weixugc@google.com, axelrasmussen@google.com, samuel.holland@sifive.com, 
	kbingham@kernel.org, jeremy.linton@arm.com, kas@kernel.org, tglx@kernel.org, 
	ardb@kernel.org, peterz@infradead.org, hpa@zytor.com, dvyukov@google.com, 
	yuanchu@google.com, leitao@debian.org, david@kernel.org, 
	anshuman.khandual@arm.com, bp@alien8.de, Liam.Howlett@oracle.com, 
	kasan-dev@googlegroups.com, linux-kbuild@vger.kernel.org, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 3:40=E2=80=AFPM Maciej Wieczor-Retman
<m.wieczorretman@pm.me> wrote:
>
> Maciej Wieczor-Retman (11):
>   kasan: Fix inline mode for x86 tag-based mode
>   x86/kasan: Add arch specific kasan functions
>   x86/mm: Reset tag for virtual to physical address conversions
>   mm/execmem: Untag addresses in EXECMEM_ROX related pointer arithmetic
>   x86/mm: Use physical address comparisons in fill_p*d/pte
>   x86/kasan: Initialize KASAN raw shadow memory
>   x86/mm: Reset tags in a canonical address helper call
>   x86/mm: Initialize LAM_SUP
>   x86: Increase minimal SLAB alignment for KASAN
>   x86/kasan: Use a logical bit shift for kasan_mem_to_shadow
>   x86/kasan: Make software tag-based kasan available
>
> Samuel Holland (2):
>   kasan: sw_tags: Use arithmetic shift for shadow computation
>   kasan: arm64: x86: Make special tags arch specific
>
>  Documentation/arch/arm64/kasan-offsets.sh |  8 ++-
>  Documentation/arch/x86/x86_64/mm.rst      | 10 ++-

Still missing Documentation/dev-tools/kasan.rst updates. Feel free to
send as a separate patch to avoid resending the whole series.



>  MAINTAINERS                               |  4 +-
>  arch/arm64/Kconfig                        | 10 +--
>  arch/arm64/include/asm/kasan-tags.h       | 14 ++++
>  arch/arm64/include/asm/kasan.h            |  7 +-
>  arch/arm64/include/asm/memory.h           | 14 +++-
>  arch/arm64/include/asm/uaccess.h          |  1 +
>  arch/arm64/mm/Makefile                    |  2 +
>  arch/arm64/mm/kasan_init.c                |  7 +-
>  arch/arm64/mm/kasan_sw_tags.c             | 35 ++++++++++
>  arch/x86/Kconfig                          |  4 ++
>  arch/x86/boot/compressed/misc.h           |  1 +
>  arch/x86/include/asm/cache.h              |  4 ++
>  arch/x86/include/asm/kasan-tags.h         |  9 +++
>  arch/x86/include/asm/kasan.h              | 79 ++++++++++++++++++++++-
>  arch/x86/include/asm/page.h               |  8 +++
>  arch/x86/include/asm/page_64.h            |  1 +
>  arch/x86/kernel/head_64.S                 |  3 +
>  arch/x86/mm/init.c                        |  3 +
>  arch/x86/mm/init_64.c                     | 11 ++--
>  arch/x86/mm/kasan_init_64.c               | 24 ++++++-
>  arch/x86/mm/maccess.c                     |  2 +-
>  arch/x86/mm/physaddr.c                    |  2 +
>  include/linux/kasan-tags.h                | 21 ++++--
>  include/linux/kasan.h                     | 13 ++--
>  include/linux/mm.h                        |  6 +-
>  include/linux/mmzone.h                    |  2 +-
>  include/linux/page-flags-layout.h         |  9 +--
>  lib/Kconfig.kasan                         |  3 +-
>  mm/execmem.c                              |  9 ++-
>  mm/kasan/kasan.h                          |  7 ++
>  mm/kasan/report.c                         | 15 ++++-
>  mm/vmalloc.c                              |  7 +-
>  scripts/Makefile.kasan                    |  3 +
>  scripts/gdb/linux/kasan.py                |  5 +-
>  scripts/gdb/linux/mm.py                   |  5 +-
>  37 files changed, 312 insertions(+), 56 deletions(-)
>  create mode 100644 arch/arm64/include/asm/kasan-tags.h
>  create mode 100644 arch/arm64/mm/kasan_sw_tags.c
>  create mode 100644 arch/x86/include/asm/kasan-tags.h
