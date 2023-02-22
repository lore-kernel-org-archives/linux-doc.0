Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25891C6379F
	for <linux-doc@archiver.kernel.org>; Wed, 22 Feb 2023 10:43:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231545AbjBVKna (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Feb 2023 05:43:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231214AbjBVKn3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Feb 2023 05:43:29 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91CE13756E
        for <linux-doc@vger.kernel.org>; Wed, 22 Feb 2023 02:43:27 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id p8so7379550wrt.12
        for <linux-doc@vger.kernel.org>; Wed, 22 Feb 2023 02:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UhT58sinHFct4qgunNLg5u/XIFyEJ64KsH0nJ4Jq3VI=;
        b=E3mhp2S/pYriP6lLsQo4TfjWLohTGpgIU2xyChC0o8I7Tvs9Rzs1Z2ECShnsif5isZ
         p8yChvV92xDtZrlY6vOpN1bUKw2fg4krL8iebjbD5mSa97vZcPEDq/Gy+M1o9i+88SEl
         qAvCVJb9D0ey+keKZvwPX3JohXCzLuP34j9S1EyaVYHw8BlfgaA9yIyBF0V/HtrkVxvV
         VDqzl34G0c5PRTA9qkXd4fhFKeyM7i+ApRiewpCnFSQsabhnbuw9N8O+u6+VxYZowzM3
         J+t+KVVw1GQKpgWT0E/fmfCu3dxn0qqjjYTHIO3WE5+b3P+Z9xxkKJjOJhMHEj71F8WW
         QOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhT58sinHFct4qgunNLg5u/XIFyEJ64KsH0nJ4Jq3VI=;
        b=272mHOkOGfG6zqY7Gqbc1BF2ZIRc5alMLTHap5Nkchwinx9zw2EyqjIZVTeBeQQCv+
         9E8fuM9yygmgS9TXm1GGXlCN4d49ROJwLEBWlj1a0W4vOrBGeJhHWF9J0QQVrxteKwxa
         TjFgQznA9TeWd1cPi5EfZSIBBwJanPalsXzuaMDcr/4LZqtPorSfzdd/mQgVilUklTSz
         BQ/VLoLCW5aWMTCv7pmHrFlwoTTN6jfveewEs9lwx1EIUyPwr3C9BGGv3oA4OZugpnEt
         uWjS3bSi0OyeUSAwtDdNFZ+aRuEnCCVYica3/F4JdixyFv/E1t6bpwE41Yp77MAu8S2p
         SmIw==
X-Gm-Message-State: AO0yUKXZ7C8zZF+CzY7Kil3xg6ibDszCor0aXBUkoP9jvCnX7rxgRAMp
        fdQRw7fQUASM09fk9NH0vE2YoXaLHlvsjawD
X-Google-Smtp-Source: AK7set97crFvqEY9KymyVgzh9ZbKxig7GJ92PiQcr3HEodbwNfUwX5oCC7Jv573SDTcXPhgm66t+IQ==
X-Received: by 2002:adf:ea88:0:b0:2c5:5a65:79a0 with SMTP id s8-20020adfea88000000b002c55a6579a0mr4953341wrm.53.1677062606035;
        Wed, 22 Feb 2023 02:43:26 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-gre-1-235-32.w90-112.abo.wanadoo.fr. [90.112.194.32])
        by smtp.gmail.com with ESMTPSA id u9-20020a5d5149000000b002c550eb062fsm5798294wrt.14.2023.02.22.02.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 02:43:25 -0800 (PST)
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Conor Dooley <conor@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 0/1] riscv: Allow to downgrade paging mode from the command line
Date:   Wed, 22 Feb 2023 11:43:21 +0100
Message-Id: <20230222104322.1197763-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This new version gets rid of the limitation that prevented KASAN kernels         
to use the newly introduced parameters.                                          
                                                                                 
While looking into KASLR, I fell onto commit aacd149b6238 ("arm64: head:         
avoid relocating the kernel twice for KASLR"): it allows to use the fdt          
functions very early in the boot process with KASAN enabled by simply            
compiling a new version of those functions without instrumentation.              
                                                                                 
I had to change the handling of the command line parsing to make the             
code self-contained in kernel/pi/cmd_early.c to avoid calling too many           
__pi prefixed functions from outside this file.                                  
                                                                                 
I'll use this approach like arm64 to handle the extraction of the random         
seedi from the device tree for KASLR.                                            
                                                                                 
base-commit-tag: v6.2-rc7

v5:                                                                              
- Handle null command line, Thanks Björn!                                        
- Add RB/TB from Björn                                                           
                                                                                 
v4:                                                                              
- Introduce pi/ for KASAN to work                                                
                                                                                 
v3:                                                                              
- Massage commit log to make no4lvl clearer, as asked by Conor                   
- Add a note to kernel-parameters.txt regarding the impossibility to use         
  those parameters when KASAN is enabled, as suggested by Conor                  
- Add RB from Björn                                                              
                                                                                 
v2:                                                                              
- Honor CMDLINE_EXTEND and CMDLINE_FORCE as noticed by Björn

Alexandre Ghiti (1):
  riscv: Allow to downgrade paging mode from the command line

 .../admin-guide/kernel-parameters.txt         |  5 +-
 arch/riscv/kernel/Makefile                    |  2 +
 arch/riscv/kernel/pi/Makefile                 | 34 ++++++++++++
 arch/riscv/kernel/pi/cmdline_early.c          | 55 +++++++++++++++++++
 arch/riscv/lib/memcpy.S                       |  2 +
 arch/riscv/lib/memmove.S                      |  2 +
 arch/riscv/mm/init.c                          | 36 ++++++++++--
 7 files changed, 129 insertions(+), 7 deletions(-)
 create mode 100644 arch/riscv/kernel/pi/Makefile
 create mode 100644 arch/riscv/kernel/pi/cmdline_early.c

-- 
2.37.2

