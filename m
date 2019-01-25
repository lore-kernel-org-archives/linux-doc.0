Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EE7FF7D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 25 Jan 2019 16:18:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726361AbfAYQSN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 25 Jan 2019 11:18:13 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38921 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726825AbfAYQSN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Jan 2019 11:18:13 -0500
Received: by mail-wm1-f68.google.com with SMTP id y8so7137190wmi.4
        for <linux-doc@vger.kernel.org>; Fri, 25 Jan 2019 08:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mlEUGJtL070jDMPMo2Bu+c8cyAqdFMB5zT4MczlHHlA=;
        b=Pr9MrsL60uOEouUSPJiGmukZZsq3LSecwCVeErVKaqNsSL5TiLar8NM7n1ehnqCzHI
         +XBMIdD5TMZyPjKgpkwJEx0n7xs3F4rdYPWwbarJQ0CA0BAYPEI55wepzs4CcdebYUk9
         39Fst+tUTouR6OUC1OB/Z8m05L99xj+fxuzeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mlEUGJtL070jDMPMo2Bu+c8cyAqdFMB5zT4MczlHHlA=;
        b=JB+gZLPmZMQhmxKig0E19Q41We1IERpGNeHtW6Ec7cMu0RlgZytZ+LgO3w6PiDeleu
         967WtJ6dFDrTfrQpnwv1xDKZdkSvPVChYxGzF7E1XgDYttoQAYqT/6jc+TK13WdEbEj+
         jTnvD8MCzz/mTVSZMR3qX+J4Vh6FWkAUVbeEUfKODl4LtYaYK9WD3ivGlvjYKL7LPev6
         DI0LQOa4cXEkOaXfpqm5/l4d55660WLoegIzbvjzEe0PhmK3YE+Hj8EWd/omK08zDSDu
         KnM4ANxNf/zd9WBWLHptKqGmVobr1x5n1/PLvPFG+FwM6Xb9dw/cIM6FiOCZXDi5c9lO
         2Fxw==
X-Gm-Message-State: AJcUukdEvE3cvuwjg980Z0ePp0oVC4TptT+xRwN3A+bqSYaF0yHik6RQ
        NkTW6kZNgW69xntAbz7JXk1gSQ==
X-Google-Smtp-Source: ALg8bN4vwTdYTRraS6pv0wiEcr/Ca8ALUmpPLIYmbpxKAhSv7JEpy0MICJz0TctWoxWtFOblfevfCw==
X-Received: by 2002:a7b:c397:: with SMTP id s23mr7222032wmj.127.1548433090899;
        Fri, 25 Jan 2019 08:18:10 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-657-1-83-120.w92-154.abo.wanadoo.fr. [92.154.90.120])
        by smtp.gmail.com with ESMTPSA id t76sm68987212wme.33.2019.01.25.08.18.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Jan 2019 08:18:09 -0800 (PST)
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
To:     linux-efi@vger.kernel.org
Cc:     corbet@lwn.net, leif.lindholm@linaro.org,
        graeme.gregory@linaro.org, mingo@redhat.com, tglx@linutronix.de,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        agraf@suse.de, pjones@redhat.com,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: [PATCH 0/2] efi: arm: add support for earlycon on EFI framebuffer
Date:   Fri, 25 Jan 2019 17:18:04 +0100
Message-Id: <20190125161806.13472-1-ard.biesheuvel@linaro.org>
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

Ard Biesheuvel (2):
  efi: x86: move EFI earlyprintk code to shared location
  efi: arm64: Enable earlycon for the GOP framebuffer

 Documentation/admin-guide/kernel-parameters.txt                         |  9 ++-
 arch/arm64/include/asm/efi.h                                            |  6 ++
 arch/x86/Kconfig.debug                                                  |  2 +-
 arch/x86/include/asm/efi.h                                              |  6 ++
 arch/x86/platform/efi/Makefile                                          |  1 -
 drivers/firmware/efi/Kconfig                                            |  5 ++
 drivers/firmware/efi/Makefile                                           |  1 +
 arch/x86/platform/efi/early_printk.c => drivers/firmware/efi/earlycon.c | 62 ++++++++++++++------
 8 files changed, 70 insertions(+), 22 deletions(-)
 rename arch/x86/platform/efi/early_printk.c => drivers/firmware/efi/earlycon.c (76%)

-- 
2.20.1

