Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 949937DE76
	for <lwn-linux-doc@archive.lwn.net>; Tue, 27 Mar 2018 09:09:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751805AbeC0JJp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 27 Mar 2018 05:09:45 -0400
Received: from mail-qt0-f196.google.com ([209.85.216.196]:44433 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752218AbeC0JJm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Mar 2018 05:09:42 -0400
Received: by mail-qt0-f196.google.com with SMTP id j26so22934661qtl.11;
        Tue, 27 Mar 2018 02:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=9eebFHDvj3n7gcI9dXUj55vxOg2U3Fg0UeTKuPd8NG0=;
        b=b/z0B05OY/ZQlT2MkiWJRugPInq6V1tg8TVOGfrG/lh3aoXzMxaJBRyrSPa5ypioeK
         9jWaKqpMbt4qngafF1JFklGfqI6IH4KcXRZR/MCcfwMmQoVyNPxhrxSXIYJrbAgcQWc6
         QLDkV+r3PWx/FXbkLzTsLT5hI6mZvy1zmlmdvyWkqa/bpMqXPO41Y2x5JojtKf29+GCa
         st+9DalLTBOvhSE8dym0v9Ym04sZMZJI3Qf1wZS9ylvJr3Si3zIoC8MDDvA0k7aHQSe/
         mMpPw9wuWGfKXtpztntpdgEX5R0YwTCIk3sUSeyeQ448Ow0viWFvLiesFxZJBHrv800e
         UEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=9eebFHDvj3n7gcI9dXUj55vxOg2U3Fg0UeTKuPd8NG0=;
        b=gGvXAUbhgj8rQNDEN/7oZXXXRlJN7/sRzjSAw6iQnyK7bp0jIsagyECv026ArhiSrG
         2G1ZRYBrmBRdSo8i+cXusmL8A9Y9SzRy4j0JZxB8pRdZ5pJJJA7NQRGJKP1+T/sMKY3C
         PkDmzGpWW7jGz2q+wbWPRl9wXfzWdwKzxXEJJ9sP0rrkvb4e9i9te/ZCcQLfjOHUMdCj
         CNojVjm/tzPYvNzbk7w+kDSxztU1DKr2QomQlABDhcdkPWZ8vn9aeGetEbhoDBFDXLKt
         mH88G8tF+hWJV4Kn6I03qKezF5PeV9ZYjZdEHYTwFAUDZFShOrrhyylw3woBBhKzk3LO
         pYbg==
X-Gm-Message-State: AElRT7Ey3rL/2j2AC9FrPJWv4gOFvyplKiNECxnrf7B2Vg1B4Qm5C8GC
        YAwqe2KHyn4O+ojX9cxmVUs=
X-Google-Smtp-Source: AG47ELuw22rOzhXffLuJ800cj+MwcK7Zy5CLYO0L5ndQHKANyIG2KR7ACtiFq9HinV0W8oEfUkP/lw==
X-Received: by 10.237.36.33 with SMTP id r30mr63253887qtc.273.1522141781198;
        Tue, 27 Mar 2018 02:09:41 -0700 (PDT)
Received: from localhost.localdomain (50-39-100-161.bvtn.or.frontiernet.net. [50.39.100.161])
        by smtp.gmail.com with ESMTPSA id r51sm557475qtr.23.2018.03.27.02.09.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Mar 2018 02:09:40 -0700 (PDT)
From:   Ram Pai <linuxram@us.ibm.com>
To:     mpe@ellerman.id.au, mingo@redhat.com, akpm@linux-foundation.org
Cc:     linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, x86@kernel.org,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        dave.hansen@intel.com, benh@kernel.crashing.org, paulus@samba.org,
        khandual@linux.vnet.ibm.com, aneesh.kumar@linux.vnet.ibm.com,
        bsingharora@gmail.com, hbabu@us.ibm.com, mhocko@kernel.org,
        bauerman@linux.vnet.ibm.com, ebiederm@xmission.com,
        linuxram@us.ibm.com, corbet@lwn.net, arnd@arndb.de
Subject: [PATCH v13 0/3] mm, x86, powerpc: Enhancements to Memory Protection Keys.
Date:   Tue, 27 Mar 2018 02:09:25 -0700
Message-Id: <1522141768-25485-1-git-send-email-linuxram@us.ibm.com>
X-Mailer: git-send-email 1.7.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch series provides arch-neutral enhancements to
enable memory-keys on new architecutes, and the corresponding
changes in x86 and powerpc specific code to support that.

a) Provides ability to support upto 32 keys.  PowerPC
	can handle 32 keys and hence needs this.

b) Arch-neutral code; and not the arch-specific code,
   determines the format of the string, that displays the key
   for each vma in smaps.

History:
-------
version v13:
	(1) fixed a git bisect error. :(

version v12:
	(1) fixed compilation errors seen with various x86
		configs.
version v11:
	(1) code that displays key in smaps is not any more
		defined under CONFIG_ARCH_HAS_PKEYS.
       	    - Comment by Eric W. Biederman and Michal Hocko
	(2) merged two patches that implemented (1).
		- comment by Michal Hocko

version prior to v11:
	(1) used one additional bit from VM_HIGH_ARCH_*
       		to support 32 keys.
	    - Suggestion by Dave Hansen.
	(2) powerpc specific changes to support memory keys.


Ram Pai (3):
  mm, powerpc, x86: define VM_PKEY_BITx bits if CONFIG_ARCH_HAS_PKEYS
    is enabled
  mm, powerpc, x86: introduce an additional vma bit for powerpc pkey
  mm, x86, powerpc: display pkey in smaps only if arch supports pkeys

 arch/powerpc/include/asm/mmu_context.h |    5 -----
 arch/powerpc/include/asm/pkeys.h       |    2 ++
 arch/x86/include/asm/mmu_context.h     |    5 -----
 arch/x86/include/asm/pkeys.h           |    1 +
 arch/x86/kernel/fpu/xstate.c           |    5 +++++
 arch/x86/kernel/setup.c                |    8 --------
 fs/proc/task_mmu.c                     |   15 ++++++++-------
 include/linux/mm.h                     |   12 +++++++-----
 include/linux/pkeys.h                  |    7 ++++++-
 9 files changed, 29 insertions(+), 31 deletions(-)

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
