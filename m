Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440D51C6F5B
	for <linux-doc@vger.kernel.org>; Tue, 27 Aug 2024 16:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724776395; cv=none; b=CXMRF1xjX15+OFbIMdBtv57PorZt1KfQiIzPjJblt6RN+c+b3goHD9iC5HhtL4i8JZ3a1Hp4u3XB8n1EQdcVk9l6PS2co12I/AppUnzXmdT/6i8N7aXxI93xaJAm4YvTjbb53aYhP5dR5YVeDuEX7LaFHKck56UJgsVtdSa82p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724776395; c=relaxed/simple;
	bh=dxnWQ7ZNrsRdOJF4d0SAvz9enA1tkCrs/JgoYmZdKco=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=LO8yWVk/o/x3IHvLBieWtdyC6QUkC5XWiSnIjaRax4IlwJAAM2s+uF1wPXkEbfYDh1vKnn9E4kz3Bm0fDFlBY+2xI6aYH0UlgqcFAva18Xl5rJ09XSNDF75c2L8LvV4VY5VH+hfxnYB9IhFLebfTpoTV4dWnB/8Yu7DPVkKXCA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=tVBSX4vS; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="tVBSX4vS"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20219a0fe4dso56689525ad.2
        for <linux-doc@vger.kernel.org>; Tue, 27 Aug 2024 09:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724776392; x=1725381192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mTh6pZVnPp/E/rLsIiYuU1aCXy8ZKRX9zys3FSKVx/s=;
        b=tVBSX4vSJomFIsLQjfg1DqAacFDouqVWw93iakzCL8l6FnCsap5K2O2CV7Aq1e14PG
         Hel7mi55coEMf9e4B70lHbtsT5viBlQfIYwqvgNKbCCIhujKeZeHJ+JgJUvMTS3yhbHJ
         YOM5yjyuXBWww4y7k7ikHEQKRzKREmvk6IHBajLaAsZOdGa4gRvayudkd2pH1Ez5Zc4V
         P0wnNK+NviN8TztcuCQR639aoGDzH3mcverLtCMhqOahIaCbFF4PE9bR14SRTHV6qNll
         T7wV0MC1JOY3gBF/D1G+nmhRWaR5heSz0iZvMNUBpRDLufYbd7crHHm3uO+kPolFzPD5
         7neA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724776392; x=1725381192;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mTh6pZVnPp/E/rLsIiYuU1aCXy8ZKRX9zys3FSKVx/s=;
        b=JKcR+0+8gjtSv1J0q3H3KFmVPbeBYEln1CYHuddzeo48rCop/Ze5SAwtbDqniqY2Va
         MrRvlVGDxFDC/oO7Ag7ICjmgGBTboi6/o5OAIw9pa+wth6bDBZrGeEgBYl5/4KPYIBni
         Zju1/iwoI3FHhUdpy717fwpNkvq0HTO+2kfFuIXbTIkpvzfJl3V9jTlEUiffkPsC4t9k
         52NOdpwax5GUn8Uxx9G6/n9wkZrmZPLLuot+Zee9v1G7FK2+3bKX2qtmGkQz3en5AgpC
         IM+92kQVLE1is170qxUFrJ3ABJ+bMhbSTQiYvUHfsa33qNZYzR5hBkoGHqvXcLSsGvDk
         rq0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWjj+i4Rn4dAs5OgZ4+k8lpUnVGb/SUxyGhLYyHBe+gZ5nw48VY1CC/PsLKxULPJF+2urzx+F/tUcA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEI+RYXsuBZZ+jdbmX+X/LgJCaORY5U4Ji4mcbeyhA7esUWe5f
	m7z6ul4wSKlpWg2eL/boGlqghlundcMTCFElEB8WRQZ73a/bo9o/fbPVPGj5tZM=
X-Google-Smtp-Source: AGHT+IEpf/1pYre4a7ge3QV2L0hds9WEI/cc1mBo3BKNODVL6iLIXzxoJBBR6QiWHKbruKqDfXDojA==
X-Received: by 2002:a17:902:f650:b0:1fb:8e25:e631 with SMTP id d9443c01a7336-2039e44af1amr187151895ad.8.1724776392039;
        Tue, 27 Aug 2024 09:33:12 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855ddb7esm85758475ad.153.2024.08.27.09.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 09:33:11 -0700 (PDT)
Date: Tue, 27 Aug 2024 09:33:11 -0700 (PDT)
X-Google-Original-Date: Tue, 27 Aug 2024 09:33:10 PDT (-0700)
Subject:     Re: [PATCH v3 0/3] RISC-V: mm: do not treat hint addr on mmap as the upper bound to search
In-Reply-To: <tencent_108260B43689E30AAE5D0C7C085AA31ADF06@qq.com>
CC: linux-riscv@lists.infradead.org, Charlie Jenkins <charlie@rivosinc.com>,
  corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  shuah@kernel.org, rsworktech@outlook.com, alexghiti@rivosinc.com, linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, cyy@cyyself.name
From: Palmer Dabbelt <palmer@rivosinc.com>
To: cyy@cyyself.name
Message-ID: <mhng-a7dcdfb5-0232-4ffb-8a20-13e564904da1@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Tue, 27 Aug 2024 01:05:15 PDT (-0700), cyy@cyyself.name wrote:
> Previous patch series[1][2] changes a mmap behavior that treats the hint
> address as the upper bound of the mmap address range. The motivation of the
> previous patch series is that some user space software may assume 48-bit
> address space and use higher bits to encode some information, which may
> collide with large virtual address space mmap may return. However, to make
> sv48 by default, we don't need to change the meaning of the hint address on
> mmap as the upper bound of the mmap address range. This behavior breaks
> some user space software like Chromium that gets ENOMEM error when the hint
> address + size is not big enough, as specified in [3].
>
> Other ISAs with larger than 48-bit virtual address space like x86, arm64,
> and powerpc do not have this special mmap behavior on hint address. They
> all just make 48-bit / 47-bit virtual address space by default, and if a
> user space software wants to large virtual address space, it only need to
> specify a hint address larger than 48-bit / 47-bit.
>
> Thus, this patch series change mmap to use sv48 by default but does not
> treat the hint address as the upper bound of the mmap address range. After
> this patch, the behavior of mmap will align with existing behavior on other
> ISAs with larger than 48-bit virtual address space like x86, arm64, and
> powerpc. The user space software will no longer need to rewrite their code
> to fit with this special mmap behavior only on RISC-V.

So it actually looks like we just screwed up the original version of 
this: the reason we went with the more complicated address splits were 
than we actually started with a defacto 39-bit page table uABI (ie 
38-bit user VAs), and moving to even 48-bit page tables (ie, 47-bit user 
VAs) broke users (here's an ASAN bug, for example: 
https://github.com/google/android-riscv64/issues/64).  

Unless I'm missing something, though, the code doesn't actually do that.  
I remember having that discussion at some point, but I must have 
forgotten to make sure it worked.  As far as I can tell we've just moved 
to the 48-bit VAs by default, which breaks the whole point of doing the 
compatibilty stuff.  Probably a good sign I need to pay more attention 
to this stuff.

So I'm not really sure what to do here: we can just copy the arm64 
behavior at tell the other users that's just how things work, but then 
we're just pushing around breakages.  At a certain point all we can 
really do with this hint stuff is push around problems, though, and at 
least if we copy arm64 then most of those problems get reported as bugs 
for us.

> Note: Charlie also created another series [4] to completely remove the
> arch_get_mmap_end and arch_get_mmap_base behavior based on the hint address
> and size. However, this will cause programs like Go and Java, which need to
> store information in the higher bits of the pointer, to fail on Sv57
> machines.
>
> Changes in v3:
> - Rebase to newest master
> - Changes some information in cover letter after patchset [2]
> - Use patch [5] to patch selftests
> - Link to v2: https://lore.kernel.org/linux-riscv/tencent_B2D0435BC011135736262764B511994F4805@qq.com/
>
> Changes in v2:
> - correct arch_get_mmap_end and arch_get_mmap_base
> - Add description in documentation about mmap behavior on kernel v6.6-6.7.
> - Improve commit message and cover letter
> - Rebase to newest riscv/for-next branch
> - Link to v1: https://lore.kernel.org/linux-riscv/tencent_F3B3B5AB1C9D704763CA423E1A41F8BE0509@qq.com/
>
> [1] https://lore.kernel.org/linux-riscv/20230809232218.849726-1-charlie@rivosinc.com/
> [2] https://lore.kernel.org/linux-riscv/20240130-use_mmap_hint_address-v3-0-8a655cfa8bcb@rivosinc.com/
> [3] https://lore.kernel.org/linux-riscv/MEYP282MB2312A08FF95D44014AB78411C68D2@MEYP282MB2312.AUSP282.PROD.OUTLOOK.COM/
> [4] https://lore.kernel.org/linux-riscv/20240826-riscv_mmap-v1-0-cd8962afe47f@rivosinc.com/
> [5] https://lore.kernel.org/linux-riscv/20240826-riscv_mmap-v1-2-cd8962afe47f@rivosinc.com/
>
> Charlie Jenkins (1):
>   riscv: selftests: Remove mmap hint address checks
>
> Yangyu Chen (2):
>   RISC-V: mm: not use hint addr as upper bound
>   Documentation: riscv: correct sv57 kernel behavior
>
>  Documentation/arch/riscv/vm-layout.rst        | 43 ++++++++----
>  arch/riscv/include/asm/processor.h            | 20 ++----
>  .../selftests/riscv/mm/mmap_bottomup.c        |  2 -
>  .../testing/selftests/riscv/mm/mmap_default.c |  2 -
>  tools/testing/selftests/riscv/mm/mmap_test.h  | 67 -------------------
>  5 files changed, 36 insertions(+), 98 deletions(-)
