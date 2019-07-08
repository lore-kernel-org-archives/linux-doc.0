Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9A3787D910
	for <lwn-linux-doc@archive.lwn.net>; Mon,  8 Jul 2019 21:15:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405266AbfGHVPc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 8 Jul 2019 17:15:32 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:43083 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405265AbfGHVPc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Jul 2019 17:15:32 -0400
Received: by mail-qk1-f194.google.com with SMTP id m14so14422552qka.10
        for <linux-doc@vger.kernel.org>; Mon, 08 Jul 2019 14:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9LBn+IrpD1vlilot1sDuhm5JaXmsdy7FeGQpNbYaEeU=;
        b=FJLVGEkBkaIWGq+BYeDm49b/d/5s8UkKFjcHQ3Pj9CIeR9WqFVBFK83oylM3vbGySY
         a/yz6JrxbrlxhkRBTTrMs0C2J/W6nlJ1vQjELf2Bdegk1pBajKXLyTOo73BGyhhwmgCp
         hpSOTkjSZ/m5LO73UP1Taf9WGt0Yjjcdf1SdEKLTO8Y9GwUwaOY9BZsOvoYDKw0JDWcj
         fPVVkLf6OQU8ckKMzR+Is03XGjLfH5O8FgfInnivtbaF6/BRHFciiuGjsy5dJM/sQZBZ
         zekQZpRlJY9hAgDxbXYaBw7Kc+lfhEPpvhBlKGrW2AWK3kgug85CfDgVzblJ1cXVS5Ot
         BVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9LBn+IrpD1vlilot1sDuhm5JaXmsdy7FeGQpNbYaEeU=;
        b=PAGOBqm4ffaRteWtqaW/TpV+1qsI5IWJFqFbav+HxPzeQ6uol+YPY9kmEU8bvPoki2
         d+hRSuD+b3cpHybtUJbXByTOPewMHChbyIVkqk79cUSKPjzt9B+oeytbmfV/irO9KB9z
         EoAons9SSAQXMLuCoMHkf2Azmi5jlcOYR1Z0dwxojLyUSLvO5EZMm1ZV9DJVJwotBpO5
         3roldG1jYif3U4ZWnzHIeSzKLjMgsewExezvmFpyHukbsB5L1SyYsmk9IEQr0vkmufLa
         YWPUpPp+Dxv0PItk7dxORFT4UN+8rBqpP2I9bQBttMFoWyAajUaaYDNZny75kckl7gn3
         lNSw==
X-Gm-Message-State: APjAAAX9rC0I42f/q0Eu+bCGK1TZorPNDzHZsl3mH1KrMvkHrLcPUVCi
        VAVNC8Rtw01EbMkEnZBwUGPoeg==
X-Google-Smtp-Source: APXvYqyjmTZLx8/N9MAAgH+1T1Fmph8LQJ2u9QiscaRxh3JxBlx4HZGFN/j+WzZn5c0D7KSK12erkQ==
X-Received: by 2002:a37:bac2:: with SMTP id k185mr15419295qkf.211.1562620531230;
        Mon, 08 Jul 2019 14:15:31 -0700 (PDT)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id b67sm8335620qkd.82.2019.07.08.14.15.29
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 08 Jul 2019 14:15:30 -0700 (PDT)
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, jmorris@namei.org, sashal@kernel.org,
        ebiederm@xmission.com, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        catalin.marinas@arm.com, will@kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [v1 0/5] allow to reserve memory for normal kexec kernel
Date:   Mon,  8 Jul 2019 17:15:23 -0400
Message-Id: <20190708211528.12392-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently, it is only allowed to reserve memory for crash kernel, because
it is a requirement in order to be able to boot into crash kernel without
touching memory of crashed kernel is to have memory reserved.

The second benefit for having memory reserved for kexec kernel is
that it does not require a relocation after segments are loaded into
memory.

If kexec functionality is used for a fast system update, with a minimal
downtime, the relocation of kernel + initramfs might take a significant
portion of reboot.

In fact, on the machine that we are using, that has ARM64 processor
it takes 0.35s to relocate during kexec, thus taking 52% of kernel reboot
time:

kernel shutdown	0.03s
relocation	0.35s
kernel startup	0.29s

Image: 13M and initramfs is 24M. If initramfs increases, the relocation
time increases proportionally.

While, it is possible to add 'kexeckernel=' parameters support to other
architectures by modifying reserve_crashkernel(), in this series this is
done for arm64 only.

Pavel Tatashin (5):
  kexec: quiet down kexec reboot
  kexec: add resource for normal kexec region
  kexec: export common crashkernel/kexeckernel parser
  kexec: use reserved memory for normal kexec reboot
  arm64, kexec: reserve kexeckernel region

 .../admin-guide/kernel-parameters.txt         |  7 ++
 arch/arm64/kernel/setup.c                     |  5 ++
 arch/arm64/mm/init.c                          | 83 ++++++++++++-------
 include/linux/crash_core.h                    |  6 ++
 include/linux/ioport.h                        |  1 +
 include/linux/kexec.h                         |  6 +-
 kernel/crash_core.c                           | 27 +++---
 kernel/kexec_core.c                           | 50 +++++++----
 8 files changed, 127 insertions(+), 58 deletions(-)

-- 
2.22.0

