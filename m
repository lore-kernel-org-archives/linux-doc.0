Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0F6FD7DE78
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 May 2018 14:15:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751196AbeECOPv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 May 2018 10:15:51 -0400
Received: from mail-wr0-f196.google.com ([209.85.128.196]:45242 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751137AbeECOPu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 May 2018 10:15:50 -0400
Received: by mail-wr0-f196.google.com with SMTP id p5-v6so17772325wre.12
        for <linux-doc@vger.kernel.org>; Thu, 03 May 2018 07:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3iyOCvdTtKCcNI/lruG5bBsgXD2YXzDb9B51QoQdONA=;
        b=HNL7tfGRGXmk/8IUUS7iD7KZRmkBEclymMuKsNqnEhgNaHjTqNhG6Vnkq/queEKCGO
         Ir4YWDgA0dutQDBA4tuucqXGX2ex+4nnRbejVuOzoBkI8O9TGMtfRbam8BippTVyQGU/
         fes3sxN2yl0CFbQdBYzyWt2elyoeGUGR1nA/sm6Y4GKouPSUeKmHhQ6rSjp3OZjz9bDV
         /0MtIqte05kVI75FgDlYQH1LdR64LV7P1KrqV1Z+29Vbtoh/2w2s2vCK5043Mcns+46/
         bCaolKbli5ZwbuCQ8+cVEHN5tnY7hVGfzBH6yyn0YdwI0d3iCeJDc22crkn6w0YAz+Fv
         4wIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3iyOCvdTtKCcNI/lruG5bBsgXD2YXzDb9B51QoQdONA=;
        b=Z48jueZTlF/tqsfEUMqUzAGBjJsLP+++2DDtiEQRP+THPAeg0HhhSwTP/Feo+4h6ET
         qK+DlkgdlBujO9h0dofeJTxQZpRsp/QToODSP921kDu5nbBbSidEoOmzV8r9dg2MBQT9
         cVo0aZNOFcNSz+Ae+LCret4DObibtDqBPKplwPRVQxY3gvYezSkJrxrkRrheT5f5SHgV
         +b0tTX76THoGWGgR7BWlLJdcK7PttkBqMULtKn43SiPJhss3MIOPxyHlGiQwLuOSSF1a
         AxH9/2Vp55m6ShQ3YiyWmbLeQ/7DihhgLzGlLWZ2q9BtrSICoXyYV8qO8nKP3/tJwKQz
         4tDQ==
X-Gm-Message-State: ALQs6tCWeH0wx4lDY9nll+cKl9kqvarQrVcSt55UYQfvsG3+PvQ2UqFe
        ZTzwJtON3yArYFhHh6QubsgmJw==
X-Google-Smtp-Source: AB8JxZpUMKviSo9q3U7HtXcB5vYNzMNA6xKRTvKqUylty4bgDSbMUK5dKwetBGk4P8N6EkBT4qoYFw==
X-Received: by 2002:adf:8d90:: with SMTP id o16-v6mr17910172wrb.81.1525356948334;
        Thu, 03 May 2018 07:15:48 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id u20-v6sm22090298wru.33.2018.05.03.07.15.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 May 2018 07:15:47 -0700 (PDT)
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andrey Konovalov <andreyknvl@google.com>,
        James Morse <james.morse@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Bart Van Assche <bart.vanassche@wdc.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
        Zi Yan <zi.yan@cs.rutgers.edu>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Chintan Pandya <cpandya@codeaurora.org>
Subject: [PATCH v2 0/6] arm64: untag user pointers passed to the kernel
Date:   Thu,  3 May 2018 16:15:38 +0200
Message-Id: <cover.1525356769.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.17.0.441.gb46fe60e1d-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi!

arm64 has a feature called Top Byte Ignore, which allows to embed pointer
tags into the top byte of each pointer. Userspace programs (such as
HWASan, a memory debugging tool [1]) might use this feature and pass
tagged user pointers to the kernel through syscalls or other interfaces.

This patch makes a few of the kernel interfaces accept tagged user
pointers. The kernel is already able to handle user faults with tagged
pointers and has the untagged_addr macro, which this patchset reuses.

We're not trying to cover all possible ways the kernel accepts user
pointers in one patchset, so this one should be considered as a start.

Thanks!

[1] http://clang.llvm.org/docs/HardwareAssistedAddressSanitizerDesign.html

Changes in v2:
- Rebased onto 2d618bdf (4.17-rc3+).
- Removed excessive untagging in gup.c.
- Removed untagging pointers returned from __uaccess_mask_ptr.

Changes in v1:
- Rebased onto 4.17-rc1.

Changes in RFC v2:
- Added "#ifndef untagged_addr..." fallback in linux/uaccess.h instead of
  defining it for each arch individually.
- Updated Documentation/arm64/tagged-pointers.txt.
- Dropped “mm, arm64: untag user addresses in memory syscalls”.
- Rebased onto 3eb2ce82 (4.16-rc7).

Andrey Konovalov (6):
  arm64: add type casts to untagged_addr macro
  uaccess: add untagged_addr definition for other arches
  arm64: untag user addresses in access_ok and __uaccess_mask_ptr
  mm, arm64: untag user addresses in mm/gup.c
  lib, arm64: untag addrs passed to strncpy_from_user and strnlen_user
  arm64: update Documentation/arm64/tagged-pointers.txt

 Documentation/arm64/tagged-pointers.txt |  5 +++--
 arch/arm64/include/asm/uaccess.h        | 14 +++++++++-----
 include/linux/uaccess.h                 |  4 ++++
 lib/strncpy_from_user.c                 |  2 ++
 lib/strnlen_user.c                      |  2 ++
 mm/gup.c                                |  4 ++++
 6 files changed, 24 insertions(+), 7 deletions(-)

-- 
2.17.0.441.gb46fe60e1d-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
