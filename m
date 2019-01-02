Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 76A927D089
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 Jan 2019 17:36:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726052AbfABRgT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 Jan 2019 12:36:19 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40456 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbfABRgP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Jan 2019 12:36:15 -0500
Received: by mail-wr1-f65.google.com with SMTP id p4so31236309wrt.7
        for <linux-doc@vger.kernel.org>; Wed, 02 Jan 2019 09:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WqvxLRjs/8snQEsiyX94OkFXxMlQW9YzCnB6B4t2n8E=;
        b=eInQQm6sEDrSW8Ri+2HTk9tz3KWL9anV9aQzBFXwpIjQ4AslOvmf6JrAnCjVPVskuq
         ggP7jCm5cJAgtjJ/fZmLjKcm/Xveqors2DstMRikDY34EH2+KXOkbSK4m0kIaz6QLcbI
         otUByN5572pZdK9BeiJ9bovq8A4K9xoY6l8mD3nYm3QjXsnb16R2Wg/qaxZGqvXtEoc6
         UNb5Ta0RlReeCtasTgUG2dYzC6YmZAs1X6pvyDHur7RbcME8G/AXmy+Yrdw9M7dJ+YMs
         kqL+2tdPZkveGaEuzfj676vUysAAq7naoRF0853qdrcjSVmYRPA26o6RQaPkZzaIT0/V
         dC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WqvxLRjs/8snQEsiyX94OkFXxMlQW9YzCnB6B4t2n8E=;
        b=j/XZnpLQH3jVXtMNbA+R5Z2u9l+/ygGc/UtFR6PxVfV2MPRtyi1RTZ329vFt5+xWWf
         16pYaw6HCNUeTBY8prqmIYLSZaoXwuD5UFM9OfGyN6BAMwwaLEdGOI+aaE/+aEGghDaW
         jxgR3hCoVhwe2XkJ4+nmhoa0wsDb2FtC7eH1+l7UyOnMo2LA61dM3kNxTUsQW/bqaWh9
         y7ocQZYkNI22qFuuGGhar9146VpTxm1JoqLDTU4qycILzAxjTMjHbIqPzi1yA3/qZKEl
         hUS+B5aOwyvrQ3eBm+zia6kpnMvpIOsULedFGumwVRY0q7dJsKMxJMFE1A0ZOcT0vCne
         UYbA==
X-Gm-Message-State: AJcUukcgf3vi+zdX+jGlUb/zcj3FrZMdMOlc8a11jI6RFW7F0vWjUZmi
        6QX2iwWfZvICKPUkZmMM0417HA==
X-Google-Smtp-Source: ALg8bN66RPF5pJV4sTABV8H6vo3c/v+grDb2wiefBxmR4QoVbGBAeb/TQmsmt/DjfRVG2/5x2PUzCA==
X-Received: by 2002:a5d:5182:: with SMTP id k2mr38617647wrv.121.1546450573026;
        Wed, 02 Jan 2019 09:36:13 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:13:8ce:d7fa:9f4c:492])
        by smtp.gmail.com with ESMTPSA id t4sm45987076wrm.6.2019.01.02.09.36.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Jan 2019 09:36:11 -0800 (PST)
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
Subject: [PATCH v2 0/3] kasan: tag-based mode fixes
Date:   Wed,  2 Jan 2019 18:36:05 +0100
Message-Id: <cover.1546450432.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.20.1.415.g653613c723-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Andrew,

This patchset includes an updated "kasan, arm64: use ARCH_SLAB_MINALIGN
instead of manual aligning" patch and fixes for two more issues that
were uncovered while testing with a variety of different config options
enabled.

Thanks!

Andrey Konovalov (3):
  kasan, arm64: use ARCH_SLAB_MINALIGN instead of manual aligning
  kasan: make tag based mode work with CONFIG_HARDENED_USERCOPY
  kasan: fix krealloc handling for tag-based mode

 arch/arm64/include/asm/kasan.h |  4 ++++
 include/linux/kasan.h          | 14 +++++---------
 include/linux/slab.h           |  5 +++--
 mm/kasan/common.c              | 22 ++++++++++++----------
 mm/slab.c                      |  8 ++++----
 mm/slab_common.c               |  2 +-
 mm/slub.c                      | 12 +++++++-----
 7 files changed, 36 insertions(+), 31 deletions(-)

-- 
2.20.1.415.g653613c723-goog

