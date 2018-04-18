Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 53ED67DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Apr 2018 18:55:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752956AbeDRSxW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Apr 2018 14:53:22 -0400
Received: from mail-wr0-f196.google.com ([209.85.128.196]:35777 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752738AbeDRSxU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Apr 2018 14:53:20 -0400
Received: by mail-wr0-f196.google.com with SMTP id w3-v6so7540197wrg.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Apr 2018 11:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7RbYRjt69tDEpy+vWZXzyqltjJ/uyZiyhZDraggalvg=;
        b=gBtFM6M2cps13OhYVNN7c0dg5pWxviBLk0udIN4E8SBjypIm6HCIcS3tHqSbi0Wbbe
         YlaHRCZfcYGybawBKarhrEI7cEavXpq7kS7xLzqY18PQsFjTDe8rDNMn7TdNFS8BO15O
         lDaJRFOU1QHPLndw4xlNJ/KNOOhbJm35kiYCllFe2YndhY2WU4PmH4s0GcMFkzmy2Efm
         KyPALaa+VkYdTo8PaiEeUqIgI7OfRSRfU4An3Z/na2QAna1pS0Lz6EqsAU5HrSfaIqIy
         RkQYMhaO48DQDCdYTMKQncpQSiapohBmQ3ALLcxTz6RaTeGVZPm7HGxTO2ZVfFz5gJvy
         StzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7RbYRjt69tDEpy+vWZXzyqltjJ/uyZiyhZDraggalvg=;
        b=XB3ea2MWXNCw9fd2FZEfyxrutZwaCenJWd3OwQWg690GAUcXkNZl3YDY+4655QnYMI
         XAGGpP4nGU2AnM9u3uYo/7hm1IQVbuc7zbOL09NXAxN9A+BpV0dUEgV5hAGBTjLjI6GW
         8QsA+40ht3uqJsdU34HxvJwzGZVC6YiIZQYnphDmdsOJJOqBYKb0KJFyYmn6hxV4OyR6
         wFswQM/wenAW+hd2JxW0jQYPVBImLtG7mVF2Lm9JZD9Y7xMQ3I+bxUI92Nm4rTm8BcQi
         c+cB+rn7VPkBu4PoRF8ziXgdzVtag0DEwBltrWP/BLWdfwFxj/LLC3avShnJEYzKKmLw
         cT8A==
X-Gm-Message-State: ALQs6tBY3sQ2DNPS2MM9Pl+nAmiIh14IGFcuVIvb0mpS7EaWxX8nMba6
        qPlhWLxsr3BSs5QXT1zSxA8EZA==
X-Google-Smtp-Source: AIpwx48v1t8uDLx8x9iExEZdSV70Stoxh6OPe3BFcQ9AMr7QyfHDmI7KMTL8VLbGhoPCN0PtEixPMQ==
X-Received: by 10.28.44.86 with SMTP id s83mr273045wms.30.1524077598347;
        Wed, 18 Apr 2018 11:53:18 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id k79sm2616735wmg.39.2018.04.18.11.53.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Apr 2018 11:53:17 -0700 (PDT)
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
Subject: [PATCH 0/6] arm64: untag user pointers passed to the kernel
Date:   Wed, 18 Apr 2018 20:53:09 +0200
Message-Id: <cover.1524077494.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.17.0.484.g0c8726318c-goog
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
2.17.0.484.g0c8726318c-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
