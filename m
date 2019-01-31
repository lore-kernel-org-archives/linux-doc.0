Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 43CAC7D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 Jan 2019 11:51:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbfAaLvw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 Jan 2019 06:51:52 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43318 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbfAaLvw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 Jan 2019 06:51:52 -0500
Received: by mail-wr1-f68.google.com with SMTP id r10so2912758wrs.10
        for <linux-doc@vger.kernel.org>; Thu, 31 Jan 2019 03:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0enek0A8jDFsVAl11N/G0bNAcwpoDOHHfp9X7OErNIc=;
        b=UiAKLLJpMbaRW1WPDY7uU1MbIdFjJD642saDeJRF3+5ZBZjcCnMPkTh4kO9bpa7aFA
         ldUR4G771E1tbyWClkLhgjx50tZ7uBnLhe5ivTL6ZRyFBR/RTaPfL3Hg71ihd2x/hyIP
         M4oqCcbKyyuSET0lPnb21lxSkHf8GVoQqIlx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0enek0A8jDFsVAl11N/G0bNAcwpoDOHHfp9X7OErNIc=;
        b=bYlwt1/mkANdDtfW8FHb8FJFI8sDQL9C/wlngJbz+2P7TcD011Q88GT9fCu7xN2ygt
         B2V7/Q8OXOhyQjVaNhFnLLftbNgS2z6EBOpvCKmfbAaxnAWLLsRkl3MrCmiAhx5jLb0p
         /51qGFLCY+Z4oAu79YTKHp/hwKQvUbRr9cu+VgK/7WXpmeaKMCXhPiLGe5v4vJgtdNfs
         k/J3qmjAHkmJkS63MwwFX5B3QwlFNu/akQsoFDpaVmdasK1P72gguFcyQIuA8Siwr17A
         Tj3J5yOrf+MbuLVwcLn+lWEtbSCHwb0KU3ZhMnW9Dr7Jty0VSIWOtt4csvjJU50o1UVA
         UqAg==
X-Gm-Message-State: AJcUukfphJ2uRicGQdAI6uzzHUsf/GA9Yay/gZ9B7SH28aXv5vCq2vzV
        2Y6AGwARgvQM+ilPXkVpmLp4Wg==
X-Google-Smtp-Source: ALg8bN5CLUqtybYo/fEiBU45Kdz6zyOA6SI+vGezuHH3V8Xm4b1wCOOSOHm8/pLtK02jlYPI372BJA==
X-Received: by 2002:adf:fd50:: with SMTP id h16mr36589622wrs.231.1548935510469;
        Thu, 31 Jan 2019 03:51:50 -0800 (PST)
Received: from localhost.localdomain (aputeaux-684-1-39-7.w90-86.abo.wanadoo.fr. [90.86.94.7])
        by smtp.gmail.com with ESMTPSA id w10sm5807714wmb.1.2019.01.31.03.51.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Jan 2019 03:51:49 -0800 (PST)
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
To:     linux-efi@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, x86@kernel.org,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>, corbet@lwn.net,
        leif.lindholm@linaro.org, graeme.gregory@linaro.org,
        mingo@redhat.com, tglx@linutronix.de, linux-doc@vger.kernel.org,
        agraf@suse.de, pjones@redhat.com
Subject: [PATCH v3 0/2] efi: arm: add support for earlycon on EFI framebuffer
Date:   Thu, 31 Jan 2019 12:51:43 +0100
Message-Id: <20190131115145.4634-1-ard.biesheuvel@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Repurpose the existing EFI earlyprintk code to implement support for
'earlycon=efi' for arm64 systems, allowing the graphical console
to be used instead of the serial port for early debug output.

Changes since v2:
- update patch #1 so that no attempts are made to build the memencrypt related
  early memremap routines for 32-bit x86
- update patch #2 so earlycon=efifb is not enabled on Itanium

Changes since v1:
- Rename earlycon= argument to 'efifb' to emphasize that this is specific
  to the EFI framebuffer.
- Replace earlyprintk=efi entirely, rather than keep it alongside earlycon.
  Since earlycon is typically enabled (along with the infrastructure), and
  earlyprintk isn't, this does not result in a lot more code to be included,
  but does make it more likely that a given [distro] kernel has support for
  this enabled out of the box.
- Switch to write-combine mappings by default. This is the default for efifb,
  and is actually required on arm64, since device attributes do not tolerate
  unaligned accesses or other operations (such as DC ZVA) that rely on memory
  semantics. This requires ARCH_USE_MEMREMAP_PROT to be wired up, which is
  why a new patch #1 has been added.
- Since adding the 'ram' parameter for framebuffers in shared memory on cache
  coherent devices is trivial after the switch to WC mappings, fold the change
  into the main patch.

If there are no objections, I will proceed to queue these in efi/next for v5.1

Cc: corbet@lwn.net
Cc: leif.lindholm@linaro.org
Cc: graeme.gregory@linaro.org
Cc: mingo@redhat.com
Cc: tglx@linutronix.de
Cc: linux-doc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: agraf@suse.de
Cc: pjones@redhat.com

Ard Biesheuvel (2):
  x86: make ARCH_USE_MEMREMAP_PROT a generic Kconfig symbol
  efi: x86: convert x86 EFI earlyprintk into generic earlycon
    implementation

 Documentation/admin-guide/kernel-parameters.txt                         |   8 +-
 arch/Kconfig                                                            |   3 +
 arch/x86/Kconfig                                                        |   5 +-
 arch/x86/Kconfig.debug                                                  |  10 --
 arch/x86/include/asm/efi.h                                              |   1 -
 arch/x86/kernel/early_printk.c                                          |   4 -
 arch/x86/mm/ioremap.c                                                   |   4 +-
 arch/x86/platform/efi/Makefile                                          |   1 -
 drivers/firmware/efi/Kconfig                                            |   6 +
 drivers/firmware/efi/Makefile                                           |   1 +
 arch/x86/platform/efi/early_printk.c => drivers/firmware/efi/earlycon.c | 130 ++++++++------------
 11 files changed, 69 insertions(+), 104 deletions(-)
 rename arch/x86/platform/efi/early_printk.c => drivers/firmware/efi/earlycon.c (45%)

-- 
2.20.1

