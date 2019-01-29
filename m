Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6D7E37D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 Jan 2019 09:22:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbfA2JWA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 Jan 2019 04:22:00 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36441 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbfA2JWA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Jan 2019 04:22:00 -0500
Received: by mail-wr1-f65.google.com with SMTP id u4so21166237wrp.3
        for <linux-doc@vger.kernel.org>; Tue, 29 Jan 2019 01:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gn1pq3MddwvZOGlLmqAWA3iRRxW5w+1ECcW/4OIbJJ0=;
        b=TALLQTS0dcy3jFNV2ZCt7j8qMMbBNnVdUqdBFwNeL/GaNVzhdT/YlTGtTB9Xx5E1yH
         fZzZh8oYJBIvgkRqnjmaBFIX655AeqWohRevFTyRIGX1hAsmekf8kiDyizrZEz4mltYY
         THBNLOrHfPMF/nY0GT3BXMslUzQrSvZke7JEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gn1pq3MddwvZOGlLmqAWA3iRRxW5w+1ECcW/4OIbJJ0=;
        b=Uvn3TCXUyw9FI+ZqCkkU2RxG5cWTWjtFhdlQE7clRj4bchUEd4E1zk58SCB9/qqGtW
         s4yfPbhxYqBu54WqxO2kgi//zGabm81UpWJCZ1wgIBvQj9slBKAcSb/Vdn1tYJri48SX
         o3cjyUgbsghO5m5Qw535z68QOzgjQe0oOIv0FsVhu0DqUBotpZs66HpkxWkker43ik2O
         hevDv+d9Mtj7nJXh01EaQQpj/dnWnH4TbCHaufsQWHrkh4duQKKLGsOuXD5c2pmjfY+F
         lb8kiDVkKMGcppApT5+Cnr2Cr5AhtQY5+TA4C2n4R5zr70VOB7LY/H9JY/oGOHifc94z
         jNGw==
X-Gm-Message-State: AHQUAuZ+xO4NV3uN/dkx6bbJmW2x4WZWjID2fVw0IvUcI9F3/HgHjyXt
        ZNDmsBgOeSAggsc1H4JTn8OmBA==
X-Google-Smtp-Source: AHgI3IauClUJ0df71CQ8m03ONMoz9ZAWsPu6Km44jGpN0TjXehn3tKOyj/atoUigr9Z6lbJtcIxy5g==
X-Received: by 2002:adf:a58a:: with SMTP id g10mr3720338wrc.3.1548753718601;
        Tue, 29 Jan 2019 01:21:58 -0800 (PST)
Received: from sudo.home ([2a01:cb1d:112:6f00:61d3:a2fc:db63:aa38])
        by smtp.gmail.com with ESMTPSA id x1sm28751755wru.34.2019.01.29.01.21.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Jan 2019 01:21:57 -0800 (PST)
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
To:     linux-efi@vger.kernel.org
Cc:     Ard Biesheuvel <ard.biesheuvel@linaro.org>, corbet@lwn.net,
        leif.lindholm@linaro.org, graeme.gregory@linaro.org,
        mingo@redhat.com, tglx@linutronix.de, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, agraf@suse.de,
        pjones@redhat.com
Subject: [PATCH v2 0/2] efi: arm: add support for earlycon on EFI framebuffer
Date:   Tue, 29 Jan 2019 10:21:48 +0100
Message-Id: <20190129092150.15184-1-ard.biesheuvel@linaro.org>
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

 Documentation/admin-guide/kernel-parameters.txt |   8 +-
 arch/Kconfig                                    |   3 +
 arch/x86/Kconfig                                |   5 +-
 arch/x86/Kconfig.debug                          |  10 -
 arch/x86/include/asm/efi.h                      |   1 -
 arch/x86/kernel/early_printk.c                  |   4 -
 arch/x86/platform/efi/Makefile                  |   1 -
 arch/x86/platform/efi/early_printk.c            | 240 --------------------
 drivers/firmware/efi/Kconfig                    |   6 +
 drivers/firmware/efi/Makefile                   |   1 +
 drivers/firmware/efi/earlycon.c                 | 208 +++++++++++++++++
 11 files changed, 226 insertions(+), 261 deletions(-)
 delete mode 100644 arch/x86/platform/efi/early_printk.c
 create mode 100644 drivers/firmware/efi/earlycon.c

-- 
2.20.1

