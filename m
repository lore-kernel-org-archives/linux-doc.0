Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF741C001B0
	for <linux-doc@archiver.kernel.org>; Sat,  8 Jul 2023 01:12:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232729AbjGHBM3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 Jul 2023 21:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232672AbjGHBMY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Jul 2023 21:12:24 -0400
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E1CF2123
        for <linux-doc@vger.kernel.org>; Fri,  7 Jul 2023 18:12:23 -0700 (PDT)
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-565f8e359b8so1822359eaf.2
        for <linux-doc@vger.kernel.org>; Fri, 07 Jul 2023 18:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688778742; x=1691370742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbN8vPNRnpC2rsql2yMQGj4/q3r+GbD6Fgm8kHqgv+g=;
        b=YFsN5teo2Xz7zOmpo4/u8q+vpC9gfozaUxki8nVKZv9U3t07rRrfE2F4D/Mpc5IR6Y
         g2mhkupBGRVRoam4tBIlKDHh9QI3CglQEfd+e5rWKmh2SSW1KWTgyeQZWx33sFhEiL/R
         zgEzQmy2w6g0b6bkpsyL0pXxNONEUqIbqM5EyF7yTZ4nd+QmM5x5KgzeZtipCgrkcwup
         nNVAWTBHg56PkxtsUwaVwvwNubSbZIkurOLzlb3ihhEr/nv+HyjB0A54Sr6SdIfOKJ3r
         u1doM0X8jjfji3no8jcXuswWv7vTaFA/xQIWTftyN61BawJxTM4bORzaV5IG40o6TLK3
         Hpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688778742; x=1691370742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HbN8vPNRnpC2rsql2yMQGj4/q3r+GbD6Fgm8kHqgv+g=;
        b=Po0MuQ+3VUjMXfEPa479+V9pyW11YdvwoMZt6f07KKXovZ/Vcx30P6Ic2If3tDhs8y
         31qpzjDqQDj+8aNsc0khnzWuQqqpYL8mr0kwA29RnyweOe6LEoSRTVezx36S20Dhw7Om
         5GF7lTVUrA80ivQzV+IyyzAkI1utfKk/YWa6XoyRzV0cH2FTwGfzIJg0CR7RqAy8wL5s
         N4vOR42D9ShILhQqoZFdltwzLM0uNDzEZV7N17ERJsWol9Lzs9+DYD8KVZGhLKQmC+oA
         j0dQDxmtEjC29ILHF0Hn4dg+t3o7LRLqO3fA6s8ck2hMRGDlWBot3Yh7iMclYG3+YdGd
         vX7A==
X-Gm-Message-State: ABy/qLb/xG9MCRCrHx5IrZbz/IDxaIOZqyThehKpf9uEmBuIES/eYAlX
        Gs77CZiVPs01FHlk/SapJlkgiw==
X-Google-Smtp-Source: APBJJlGdindojK5i23bHPXGUqY/0vPqfcqx7SQxTQvxyGmC/pEljPyl1GkowwHsZX51mLjvN1LEySQ==
X-Received: by 2002:a05:6358:2925:b0:125:a552:4389 with SMTP id y37-20020a056358292500b00125a5524389mr7496248rwb.22.1688778742292;
        Fri, 07 Jul 2023 18:12:22 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id x24-20020a170902b41800b001b87d3e845bsm3830654plr.149.2023.07.07.18.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 18:12:21 -0700 (PDT)
From:   Charlie Jenkins <charlie@rivosinc.com>
To:     linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     charlie@rivosinc.com, conor@kernel.org, paul.walmsley@sifive.com,
        palmer@rivosinc.com, aou@eecs.berkeley.edu, anup@brainfault.org,
        konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
        mick@ics.forth.gr, jrtc27@jrtc27.com, rdunlap@infradead.org
Subject: [PATCH v4 4/4] RISC-V: mm: Document mmap changes
Date:   Fri,  7 Jul 2023 18:11:35 -0700
Message-ID: <20230708011156.2697409-5-charlie@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230708011156.2697409-1-charlie@rivosinc.com>
References: <20230708011156.2697409-1-charlie@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The behavior of mmap is modified with this patch series, so explain the
changes to the mmap hint address behavior.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/riscv/vm-layout.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/riscv/vm-layout.rst b/Documentation/riscv/vm-layout.rst
index 5462c84f4723..8141addbf888 100644
--- a/Documentation/riscv/vm-layout.rst
+++ b/Documentation/riscv/vm-layout.rst
@@ -133,3 +133,25 @@ RISC-V Linux Kernel SV57
    ffffffff00000000 |  -4     GB | ffffffff7fffffff |    2 GB | modules, BPF
    ffffffff80000000 |  -2     GB | ffffffffffffffff |    2 GB | kernel
   __________________|____________|__________________|_________|____________________________________________________________
+
+
+Userspace VAs
+--------------------
+To maintain compatibility with software that relies on the VA space with a
+maximum of 48 bits the kernel will, by default, return virtual addresses to
+userspace from a 48-bit range (sv48). This default behavior is achieved by
+passing 0 into the hint address parameter of mmap. On CPUs with an address space
+smaller than sv48, the CPU maximum supported address space will be the default.
+
+Software can "opt-in" to receiving VAs from other VA space by providing
+a hint address to mmap. A call to mmap is guaranteed to return an address
+that will not override the unset left-aligned bits in the hint address,
+unless there is no space left in the address space. If there is no space
+available in the requested address space, an address in the next smallest
+available address space will be returned.
+
+For example, in order to obtain 48-bit VA space, a hint address greater than
+:code:`1 << 38` must be provided. Note that this is 38 due to sv39 userspace
+ending at :code:`1 << 38` and the addresses beyond this are reserved for the
+kernel. Similarly, to obtain 57-bit VA space addresses, a hint address greater
+than or equal to :code:`1 << 47` must be provided.
-- 
2.41.0

