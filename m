Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A09127D085
	for <lwn-linux-doc@archive.lwn.net>; Fri, 25 May 2018 17:24:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S967335AbeEYRVW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 25 May 2018 13:21:22 -0400
Received: from mail-wr0-f194.google.com ([209.85.128.194]:33835 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754701AbeEYRVV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 May 2018 13:21:21 -0400
Received: by mail-wr0-f194.google.com with SMTP id j1-v6so10454297wrm.1
        for <linux-doc@vger.kernel.org>; Fri, 25 May 2018 10:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nRENlgdd35aR24/TqobF9omMTjQ0xg2cNh/mf9EGTR8=;
        b=T/dxjLfg131V3ylJEiffEAa8BGBxkxQXI3gC1po7iNgSVx2VOytpHHYEHhJhf6niWz
         gXkuKwMauzOEVaXHjcBdHGYgWM2gK+xD0YT7Cs2lJNtC4T74gKOVYfcVA60Gr6TXH+d0
         8u72LUBAX3iTvvS4u3wNbVRcP6w/vHFwrbIpN9sZZApiD8YU8daj+Lapfo6B4TYv8nub
         C5ADBqZvn/eCBLmeFbkqJwJdWeGq1p2O2q/50X9Y22fUNDye23tVPEaSd7IUE8F5K0+2
         l/oW8QBLlfI6M72QcvI+a4TWZ3Oa7RQnPLrKJOMfQbBPf/BZnLRPNbgkdlkVAjGNJxZV
         +qTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nRENlgdd35aR24/TqobF9omMTjQ0xg2cNh/mf9EGTR8=;
        b=tKfiAfbkrjVaMHPmbRDt4+Fi9f704PPWOXr3wppZXdE/S7TBs2+US9b1e0XYoz6AVh
         dQdq9PZtOcTsK3EzXRLo84kNTQ1+2s1eNg9fw1gOJoFNbVBytJjgfo+PNxRkAlsVW4hq
         TmaQgE3x4Nxzta0HkOqGQn5VwZQic9waT7VJh4HhALxnOzxyPltIpcrRejwMpjFg/ORN
         rhUzMMnfuocrTdFg/n6r21ghz6G9JZNMxe1sshulCeFipqEH5LXOqT+nl1kTGwmtUN0v
         VIrpPNwnX7iOz9oZKSaLQYVNmPEJU22G0AFsmT1oW+azFj7suLlFL3Z+ajcWmP+n+aQC
         Ecaw==
X-Gm-Message-State: ALKqPweUZbh867xC7tA6ZfUc6VxuJ8isB5YHjH4d0m4fwgT0QzUs8VMN
        eW/Y7SxLTVRCkZwWGl7bZcK+ug==
X-Google-Smtp-Source: AB8JxZpwN+s2Oiiqi3MSIdcLuHpgsx4Cah9rxAJqCwPnXXzaTvYyCcGwaOc2T3iikQslFbBPEWfs3Q==
X-Received: by 2002:adf:f688:: with SMTP id v8-v6mr2727100wrp.74.1527268879534;
        Fri, 25 May 2018 10:21:19 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id s5-v6sm26579964wra.48.2018.05.25.10.21.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 May 2018 10:21:18 -0700 (PDT)
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andrey Konovalov <andreyknvl@google.com>,
        Kees Cook <keescook@chromium.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Chintan Pandya <cpandya@codeaurora.org>
Subject: [PATCH v3 0/6] arm64: untag user pointers passed to the kernel
Date:   Fri, 25 May 2018 19:21:10 +0200
Message-Id: <cover.1527268727.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.17.0.921.gf22659ad46-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

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

Changes in v3:
- Rebased onto e5c51f30 (4.17-rc6+).
- Added linux-arch@ to the list of recipients.

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
2.17.0.921.gf22659ad46-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
