Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6F4317D9ED
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 Oct 2019 19:55:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731805AbfJITxy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 Oct 2019 15:53:54 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:39319 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730708AbfJITxx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Oct 2019 15:53:53 -0400
Received: by mail-io1-f68.google.com with SMTP id a1so7904967ioc.6
        for <linux-doc@vger.kernel.org>; Wed, 09 Oct 2019 12:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:from:to:cc:subject:message-id:user-agent:mime-version;
        bh=H5oadYdtYiWqz6jIut7b8l+pt98Mf79JimwAWbyu918=;
        b=PX03dNUvlcc82iOKTuYOxdwvY1PLDPZlXvQFmpxrQgKDUU3BGA0Kg5rrOhBTmMngUS
         pFqxRqwL/ilOz9yU7Nzh67SdJN/YilXyBla7VcV8V2yDrCv8ELgB472QZZNYNheRzClr
         xANo+VYD2gt1c4vFA6OW0deW6I19Y58pwtNtaq2ndj1wgKIuVcufGnu4PZmVt0c/9cDW
         04SDCA1BouCoaIhzkRlVydP7BljqEoqbzaSjgMokAiO/1h8bQTK5kPb5xAWIstgDs3am
         zVRa8Yc9S1KrXT0bovrY/vtTz0WS1jFsoOxBPj0u08TzEsUKSgEMrT0HEyW/SPRbsyym
         TBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
         :mime-version;
        bh=H5oadYdtYiWqz6jIut7b8l+pt98Mf79JimwAWbyu918=;
        b=T+f3pMvsJZNaPdrzPzTZ78vBTgBSNSmICOkrMOXd659y6CBW0VfYire6l40ZcbTna3
         gzfxNhLwUB3lIOZgMNXV7LoPLiAgEa0aGxHEUP/Q0x+07CqFUEVnitVtOJ+3hwKX8+bF
         fGRJAHfmYj08cjJXCxeWiB4A4nx/EVvTlRp3sIEWbmiF4B7PY3NZ07f28TWawAizteaq
         8OTXGAu53OoyiLK3tKqB9KRTX3PmPhR4Xc8wh2m9nn3bjjWWj1QipXjNtQqntqTGyL/L
         O8uZjXYbpKHgLUbFcbioACUVG6HUp/qAK+UpqmtKMHUUXl6CRVUX1LHtW1ycgraORLpk
         TDKg==
X-Gm-Message-State: APjAAAXKBfP1DZhhuwKEmLD9Y5c+O9CohEAdv9DXzmV2tkXFWWf19CIA
        XDj4gyZfl+cbx/VStYtfxxtQAQ==
X-Google-Smtp-Source: APXvYqxBWF80a/mKx1FkTcVxpurf65iP5tY1NfcOpVEx9+bKX9bhqeJX8QTsiaRG4IK0jOVBLqiNGg==
X-Received: by 2002:a02:497:: with SMTP id 145mr5332312jab.10.1570650831466;
        Wed, 09 Oct 2019 12:53:51 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
        by smtp.gmail.com with ESMTPSA id u124sm2253532ioe.63.2019.10.09.12.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 12:53:51 -0700 (PDT)
Date:   Wed, 9 Oct 2019 12:53:50 -0700 (PDT)
From:   Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To:     Jonathan Corbet <corbet@lwn.net>
cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@lst.de>, Andreas Schwab <schwab@suse.de>
Subject: [PATCH] Documentation: admin-guide: add earlycon documentation for
 RISC-V
Message-ID: <alpine.DEB.2.21.9999.1910091252160.11044@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Kernels booting on RISC-V can specify "earlycon" with no options on
the Linux command line, and the generic DT earlycon support will query
the "chosen/stdout-path" property (if present) to determine which
early console device to use.  Document this appropriately in the
admin-guide.

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Andreas Schwab <schwab@suse.de>
---
 Documentation/admin-guide/kernel-parameters.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index c7ac2f3ac99f..011fee969ece 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -990,6 +990,10 @@
 			[X86] When used with no options the early console is
 			determined by the ACPI SPCR table.
 
+			[RISCV] When used with no options, the early
+			console is determined by the stdout-path
+			property in the device tree's chosen node.
+
 		cdns,<addr>[,options]
 			Start an early, polled-mode console on a Cadence
 			(xuartps) serial port at the specified address. Only
-- 
2.23.0

