Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48311C761AF
	for <linux-doc@archiver.kernel.org>; Thu, 23 Mar 2023 16:35:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232314AbjCWQft (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Mar 2023 12:35:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbjCWQfc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Mar 2023 12:35:32 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB3572A6F3
        for <linux-doc@vger.kernel.org>; Thu, 23 Mar 2023 09:34:02 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso1659998wmb.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Mar 2023 09:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1679589238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T02CoPQSjHJPYyXwCzD6p0CGnIKFhz0kSb8bJB6ht4Y=;
        b=EUVRSjxbLKVq8hDCxjrO+6jyd+BmL2kHZodwrBzrSopYstJqfGNjdbsvfTB3pLT1mh
         0s/EBYsmGU7UR8u/QAmRPbRZ/TyjvS1nigC+yHT23S1G4PW83MoLc3GPDkiiozO4jAqD
         xQHlG/ubsdOA92CkNvn8QVIpVgwWZJuLsif2ynfXI8532m2W7/tuMJaf/kEm+uysZTcL
         5BMB36hsZQ+Eoiy08zwZgkKsoPwVqUdWs2mNmdVesyjBqx9xdUThaS87VTdwdtkZtXF9
         z2GVeNjd8QlQufpj7rP0/zEqZ1v01nCy0GxdRayI5Gr8Txk8tMrh41ci/YHrrW0XNB5/
         ccOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679589238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T02CoPQSjHJPYyXwCzD6p0CGnIKFhz0kSb8bJB6ht4Y=;
        b=OpbMHtZwgwd92rcxYx2uyLnGw/M4EDBREORS22Q/KjiPXZmwt3v8DNY7X0U69UQdwZ
         psPt/YTaRuKe8+5aw5M32q8FTYvXlE0E0m+BSg0C3lBQbsc7UMH/pntpThqTTu583ypD
         lXutq4tZoSrz4GSsFDb2w65CoJfRZonejazm0LhNWwYR1/Uyp9RiBRwta99Qkw/oSOvF
         IkD20I2TwJsLWZojDRWfooiDPI0DTgTdKTtDM4m7L/FMERZHAd6tHvYyl6xwkhHrgO5N
         wGJ+H1xS8v+y08BqsejmDgZ6uaYVpecJpRas81D80uTUQyeK80r5lT/Zj2cs6zF+IhKi
         M+9g==
X-Gm-Message-State: AO0yUKXQFNGUb0BTxcVh9rgw1JJnb8Gv/TAtGdU3pkacHfRa5bJTzVvX
        5tCL24GZZfCDczurVh3uJdLe7Q==
X-Google-Smtp-Source: AK7set8Aj3DqH142gpbpe2Stg7uZNFfdNostTY7WbhAwUM7bAKFCiIArytMk9L+BB1rZ2e67txdRnQ==
X-Received: by 2002:a7b:cd0d:0:b0:3ed:df74:bac7 with SMTP id f13-20020a7bcd0d000000b003eddf74bac7mr171034wmj.21.1679589237974;
        Thu, 23 Mar 2023 09:33:57 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id j9-20020a05600c1c0900b003ee6aa4e6a9sm2550735wms.5.2023.03.23.09.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 09:33:57 -0700 (PDT)
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Conor Dooley <conor.dooley@microchip.com>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH -fixes 0/2] Fixes for dtb mapping
Date:   Thu, 23 Mar 2023 17:33:45 +0100
Message-Id: <20230323163347.182895-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We used to map the dtb differently between early_pg_dir and
swapper_pg_dir which caused issues when we referenced addresses from
the early mapping with swapper_pg_dir (reserved_mem): move the dtb mapping
to the fixmap region in patch 1, which allows to simplify dtb handling in
patch 2.

base-commit-tag: v6.3-rc3

Alexandre Ghiti (2):
  riscv: Move early dtb mapping into the fixmap region
  riscv: Do not set initial_boot_params to the linear address of the dtb

 Documentation/riscv/vm-layout.rst |  6 +--
 arch/riscv/include/asm/fixmap.h   |  8 +++
 arch/riscv/include/asm/pgtable.h  |  8 ++-
 arch/riscv/kernel/setup.c         |  6 +--
 arch/riscv/mm/init.c              | 82 ++++++++++++++-----------------
 5 files changed, 54 insertions(+), 56 deletions(-)

-- 
2.37.2

