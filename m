Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CB2D87D8A8
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 Jan 2019 18:45:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbfACSp2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 Jan 2019 13:45:28 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53374 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbfACSp1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Jan 2019 13:45:27 -0500
Received: by mail-wm1-f65.google.com with SMTP id d15so30081866wmb.3
        for <linux-doc@vger.kernel.org>; Thu, 03 Jan 2019 10:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ITHs4YFYCIBJqlnIEDmL4pdf24tyFGf+yxfC0Fh4pdM=;
        b=h7mND0Ja2CKX3WEOQZZNYqd9Wl32B4mOeHcoyNptcwaUsD1PDVzEu47VrmDVJUf5I/
         WypbBGhjGDrsNseH3LE81ezH6HRM+2k+CLcnghlohirns+/D5S+RzY88W5ncYB/QXGE4
         FbSucETcPMTEFkrY8hH7Ezrp+JFajaHzL+fEpNCZVUcWhEeCvstyL4ZBK2jmpnv3KX//
         zhlc96slJeXGPvl+PDvcNgEKSIZ3PYuexVQtTtCSTtMcJRwOKvVuipGRsELAuHweHeIM
         5kGT8cfnOeSShUJDPY4ZZYwnvDDgcJHkq2gdObP0PmXMvHEIam2ksYVYLTM8kno/zPM2
         fQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ITHs4YFYCIBJqlnIEDmL4pdf24tyFGf+yxfC0Fh4pdM=;
        b=Xm8XesrXt9Ks0xGzBK5i86RPQitdmzapWCGqG+bALOqunHkt9cUM4+ArrT+Ljb1RpX
         s8Dht2RCF9xCUhzNyEwQU62dFqy7YMmPWWiZcZwTSU2xt1VbiWaDFBk9woty0+xnWT+O
         65/wxkZy+SkrR0Ow/ICTE9OeU+TUP9pOtbLYPP4aSUwQvrwOoONyNUD35HpcPMWdop8B
         WMjxWz65+1E2+rri5+tbJz7rXabnnuxExJl8r5Ug01qREA4GZn2BMUzhER3IfrmRATfN
         W2hESihANeStSCRE006roC4p4+YQsqagHAKMDuPuDx5SfEKyu9d21ZbEhL1yBQY8CmK/
         rhVg==
X-Gm-Message-State: AJcUukfreyL/fiWE1ueWnnT5qkiEajOQV+CoIih4FsJUSH9ZTq2sGdKP
        PGVf83ESX+0wo9HtVFrVv618zQ==
X-Google-Smtp-Source: ALg8bN6PfR1Ylu4w+0u4VmomLr/zJW+6Qt2xgzQ9hKBfW94sc2lkLW4VnkWuDt9Lz7DbH3yYH4+Q1w==
X-Received: by 2002:a7b:cb18:: with SMTP id u24mr37572044wmj.138.1546541125030;
        Thu, 03 Jan 2019 10:45:25 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:13:8ce:d7fa:9f4c:492])
        by smtp.gmail.com with ESMTPSA id t12sm52236944wrr.65.2019.01.03.10.45.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Jan 2019 10:45:23 -0800 (PST)
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Dave Martin <dave.martin@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Ingo Molnar <mingo@kernel.org>,
        Paul Lawrence <paullawrence@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        kasan-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sparse@vger.kernel.org, linux-mm@kvack.org,
        linux-kbuild@vger.kernel.org
Cc:     Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Jann Horn <jannh@google.com>,
        Mark Brand <markbrand@google.com>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Vishwath Mohan <vishwath@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Subject: [PATCH v3 0/3] kasan: tag-based mode fixes
Date:   Thu,  3 Jan 2019 19:45:18 +0100
Message-Id: <cover.1546540962.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.20.1.415.g653613c723-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changes in v3:
- Fixed krealloc tag assigning without changing kasan_kmalloc hook and
  added more comments to the assign_tag function while at it.
- Moved ARCH_SLAB_MINALIGN definition to arch/arm64/include/asm/cache.h.

Changes in v2:
- Added "kasan: make tag based mode work with CONFIG_HARDENED_USERCOPY"
  patch.
- Added "kasan: fix krealloc handling for tag-based mode" patch.

Andrey Konovalov (3):
  kasan, arm64: use ARCH_SLAB_MINALIGN instead of manual aligning
  kasan: make tag based mode work with CONFIG_HARDENED_USERCOPY
  kasan: fix krealloc handling for tag-based mode

 arch/arm64/include/asm/cache.h |  6 ++++
 mm/kasan/common.c              | 65 ++++++++++++++++++++++------------
 mm/slub.c                      |  2 ++
 3 files changed, 51 insertions(+), 22 deletions(-)

-- 
2.20.1.415.g653613c723-goog

