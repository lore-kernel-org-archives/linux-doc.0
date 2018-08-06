Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 78A517E3E5
	for <lwn-linux-doc@archive.lwn.net>; Mon,  6 Aug 2018 16:41:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387544AbeHFSut (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 6 Aug 2018 14:50:49 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46295 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387520AbeHFSus (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Aug 2018 14:50:48 -0400
Received: by mail-wr1-f66.google.com with SMTP id h14-v6so12954380wrw.13
        for <linux-doc@vger.kernel.org>; Mon, 06 Aug 2018 09:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4JRXIJLBl4B77V9Zp1bHxiibsTuS9qYiG3W/7d2vbs4=;
        b=R/QQR8lwOQTXtE/oXjwJAsQ6MM1WVm3FlazsgX/aoQPMCA3dcLUASxhKx4Pplf+yQ0
         4V6ug1JKt6ziqBRwZwS6iAO/g/BNVmuE7M2z4Nff3l5qA5wV1pMDNQLQ1p0gtpBorb9e
         NoeOSZTbjM0O1xmOde+LtERaVHKcYoHkCDQbmqESNjs2LQt8eekMRKU1W7qZSAW6qLVm
         +Fx6xH5Mcstxa2SY1Bw3MH4BsO/uZ4RxFoG8EwEACbqq2dLYGgzO73m28tBdYs5VGwY6
         F9xMgGSLTnvUPRGcD/MP48ffV2V5nBKIZ6NP4Oah6+pSKfI1QsVECqebnw0Pac8qDleP
         BHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4JRXIJLBl4B77V9Zp1bHxiibsTuS9qYiG3W/7d2vbs4=;
        b=t7dewoUlZv5x0UtWLkJ27BwoEazGJUQHTe6OLy6jQv51N12y9Mgda2HdtfF2AoeDGD
         TdEuWMJ7Kxb+QP3riZ1lgFpWvE+rUl61AytWfUFVxLbRqg8a6t3MeMbNASPD6WPpUdpi
         Sq8YWxbkU5+ycd/bOwslrGisRYNRcITPO5091pqfZn2qIetmP7PWtsPZmrP/VrXOr/U+
         kv5g1641lu8fRuIDHk4SBXFki19hTO+gq2v3HAbEuq0Wr5Lzt2s4CeUeCAxA1oL9WwN1
         6uSrOf2say+T+xCOqKt6Mx0Kjz1cX0+rJpWgPqUuTp1Q/P7TUc2J8uRjEuNNLkggHRWN
         a7UQ==
X-Gm-Message-State: AOUpUlGnANCgilJAkkgZoM+ItBWPRzvbZfx/Nv9KSot4F7TSdkthJioV
        l16wC7bvXJKaEtrYxkQjzViHzw==
X-Google-Smtp-Source: AAOMgpevV7lqMLifigVw6GPYsm4a3KGutEKLiEuzKRNJ7bqKjYjYA3wEC5YWatl/Eu1t3nonlXKnTg==
X-Received: by 2002:a5d:504d:: with SMTP id h13-v6mr9764161wrt.18.1533573652777;
        Mon, 06 Aug 2018 09:40:52 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id 66-v6sm16385790wmw.34.2018.08.06.09.40.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Aug 2018 09:40:52 -0700 (PDT)
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
        Shuah Khan <shuah@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-arch@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Chintan Pandya <cpandya@codeaurora.org>
Subject: [PATCH v5 00/10] arm64: untag user pointers passed to the kernel
Date:   Mon,  6 Aug 2018 18:40:35 +0200
Message-Id: <cover.1533573460.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.18.0.597.ga71716f1ad-goog
MIME-Version: 1.0
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

Thanks!

[1] http://clang.llvm.org/docs/HardwareAssistedAddressSanitizerDesign.html

Changes in v5:
- Added 3 new patches that add untagging to places found with static
  analysis.
- Rebased onto 44c929e1 (4.18-rc8).

Changes in v4:
- Added a selftest for checking that passing tagged pointers to the
  kernel succeeds.
- Rebased onto 81e97f013 (4.18-rc1+).

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
- Dropped "mm, arm64: untag user addresses in memory syscalls".
- Rebased onto 3eb2ce82 (4.16-rc7).

Andrey Konovalov (10):
  arm64: add type casts to untagged_addr macro
  uaccess: add untagged_addr definition for other arches
  arm64: untag user addresses in access_ok and __uaccess_mask_ptr
  mm, arm64: untag user addresses in mm/gup.c
  lib, arm64: untag addrs passed to strncpy_from_user and strnlen_user
  arm64: untag user address in __do_user_fault
  fs, arm64: untag user address in copy_mount_options
  usb, arm64: untag user addresses in devio
  arm64: update Documentation/arm64/tagged-pointers.txt
  selftests, arm64: add a selftest for passing tagged pointers to kernel

 Documentation/arm64/tagged-pointers.txt       |  5 +++--
 arch/arm64/include/asm/uaccess.h              | 14 +++++++++-----
 arch/arm64/mm/fault.c                         |  2 +-
 drivers/usb/core/devio.c                      |  8 +++++---
 fs/namespace.c                                |  2 +-
 include/linux/uaccess.h                       |  4 ++++
 lib/strncpy_from_user.c                       |  2 ++
 lib/strnlen_user.c                            |  2 ++
 mm/gup.c                                      |  4 ++++
 tools/testing/selftests/arm64/.gitignore      |  1 +
 tools/testing/selftests/arm64/Makefile        | 11 +++++++++++
 .../testing/selftests/arm64/run_tags_test.sh  | 12 ++++++++++++
 tools/testing/selftests/arm64/tags_test.c     | 19 +++++++++++++++++++
 13 files changed, 74 insertions(+), 12 deletions(-)
 create mode 100644 tools/testing/selftests/arm64/.gitignore
 create mode 100644 tools/testing/selftests/arm64/Makefile
 create mode 100755 tools/testing/selftests/arm64/run_tags_test.sh
 create mode 100644 tools/testing/selftests/arm64/tags_test.c

-- 
2.18.0.597.ga71716f1ad-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
