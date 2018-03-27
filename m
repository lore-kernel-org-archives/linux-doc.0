Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 825A77DE76
	for <lwn-linux-doc@archive.lwn.net>; Tue, 27 Mar 2018 17:01:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752446AbeC0RBP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 27 Mar 2018 13:01:15 -0400
Received: from mail-wr0-f194.google.com ([209.85.128.194]:44308 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751890AbeC0Q5s (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Mar 2018 12:57:48 -0400
Received: by mail-wr0-f194.google.com with SMTP id u46so23109396wrc.11
        for <linux-doc@vger.kernel.org>; Tue, 27 Mar 2018 09:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2unNROHG+8feIGotHXszhTuGPmpRY6bXBkim4UFPTaQ=;
        b=SXjhznolWo1hvxBRtHpKTOT8IY9XixA/kKc+IfwHbe8/lVgq1y2AV4kboGXl4kHBxk
         nyoqKsfwJUXwGk7PAMzPpGAO6gXLGQaIui2hzXXzgRXwJ/2ve6BuovPgdsTP76XDK+B6
         ROO512Wu1uPsfVIS5QzZzMKq+ZFMbEhFW2S4MkFpLDoPvWcsNnBau5SPXgRjV3RRLQc7
         Z7zMEp0ijm3LVZcWKI3kn9YqJbPNmQaKv390RnL7+NgPIDNwvdDA7HVAXVV0l21PLoNP
         05xXhc/k3Wu4XrlSPtaZ4mlXnQwjalDCe/8Y/drJ2a1rwdPdu5+SOCo27z9I4Tub3/5v
         /feg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2unNROHG+8feIGotHXszhTuGPmpRY6bXBkim4UFPTaQ=;
        b=T9/4f1xtcpJyYKHhoIEuMQ75+TSomwAdZiIcB19y9gTqnglJLUGzd/dhYqJlcxKD4j
         cy9fDrxC+fMDiiYbyCJmhN7hrf9s1R0NG64mcRhU3DnsSg/kOEr704V02rP+Ifti0xhk
         oRQO+iQfrnrsi8VNo47C93uvOFkIWDPlp5ZUeo5ZA3k53DbcCoKIlVuY7LlphRm0GIUd
         BB6YrfgZZNY3OoYqPfkEMeVqoA/ipA4E42MU4/qsd8VdXY7MvNqg7WsZ7VWbbG13KXwx
         Yse54Z5wSFyTzVPJi2mGA6JGm2Lt92RHbUQumJPLOQC4Mit1s7uAO5xQ0UbWI/0ezTyo
         UXNg==
X-Gm-Message-State: AElRT7FqhBntzwWxni9YvMH/HFeKd1qaf60tJaIo3QDl2sTx81hzxfl1
        qv0VbgXg2cmGOnckRxw1HkrFsQ==
X-Google-Smtp-Source: AIpwx4+SqilrH2teukLBq3OM04gQK/o6scnPl5VTqxM3lBxwZh4twkUP46cBr9jr5WdaxdB1/7zZTw==
X-Received: by 10.223.183.75 with SMTP id n11mr135507wre.22.1522169866448;
        Tue, 27 Mar 2018 09:57:46 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id 93sm1622992wrh.46.2018.03.27.09.57.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Mar 2018 09:57:45 -0700 (PDT)
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
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>
Subject: [RFC PATCH v2 0/6] arm64: untag user pointers passed to the kernel
Date:   Tue, 27 Mar 2018 18:57:36 +0200
Message-Id: <cover.1522169685.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.17.0.rc0.231.g781580f067-goog
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

Changes in RFC v2:
- Added "#ifndef untagged_addr..." fallback in linux/uaccess.h instead of
  defining it for each arch individually.
- Updated Documentation/arm64/tagged-pointers.txt.
- Dropped “mm, arm64: untag user addresses in memory syscalls”.
- Rebased onto 3eb2ce82 (4.16-rc7).

Andrey Konovalov (6):
  arm64: add type casts to untagged_addr macro
  uaccess: add untagged_addr definition for other arches
  arm64: untag user addresses in copy_from_user and others
  mm, arm64: untag user addresses in mm/gup.c
  lib, arm64: untag addrs passed to strncpy_from_user and strnlen_user
  arm64: update Documentation/arm64/tagged-pointers.txt

 Documentation/arm64/tagged-pointers.txt |  5 +++--
 arch/arm64/include/asm/uaccess.h        |  9 +++++++--
 include/linux/uaccess.h                 |  4 ++++
 lib/strncpy_from_user.c                 |  2 ++
 lib/strnlen_user.c                      |  2 ++
 mm/gup.c                                | 12 ++++++++++++
 6 files changed, 30 insertions(+), 4 deletions(-)

-- 
2.17.0.rc0.231.g781580f067-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
