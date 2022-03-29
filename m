Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD3AFC433EF
	for <linux-doc@archiver.kernel.org>; Tue, 29 Mar 2022 16:46:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237993AbiC2Qsk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Mar 2022 12:48:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239836AbiC2Qsj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Mar 2022 12:48:39 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7053DA6E3E
        for <linux-doc@vger.kernel.org>; Tue, 29 Mar 2022 09:46:56 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id s8so16357067pfk.12
        for <linux-doc@vger.kernel.org>; Tue, 29 Mar 2022 09:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=subject:date:message-id:mime-version:content-transfer-encoding:cc
         :from:to;
        bh=mjUJmj4POHLc72j+uESMrPipTUvziFqTLssOqNZTKng=;
        b=16bvm3mK5BVPEq0QsKQh8+GZ+eE3roFJbDhcdsWwz8Ho+JKpMBeJgHQBc5vEXGZTl5
         MyoYHuyex5gP78CXssjDemtj7S6fPfK7X8eP3FYhNjPAf3AI5lE0tnJANGvwoZzqP/Pw
         WxmltKzSxZV1WZB8zTh3uOTnae0eIbiGn+1aSmAZsDV/311oVeTG/Bgc1ltg8bJ+0fAN
         vp4pJaVXVGunFXuZZzGlPrAs7OxLKBy17is1ZCMJTGsvR8LfDSyu54kgns9+5vH0Z8eQ
         luAFgyJnoyCxTYL+/zKEBfV/IF3hV/kSxOHalp6TjtfIIehSJ5o099fb+cko7bEnMX7+
         9LEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:date:message-id:mime-version
         :content-transfer-encoding:cc:from:to;
        bh=mjUJmj4POHLc72j+uESMrPipTUvziFqTLssOqNZTKng=;
        b=cM8aTzHa7FhfshSBCiq/PrCvIwjLtF9Xu6zAfyQIBBJ04ulsj6q4C0wQpF/6eA2JVT
         3qYLPpbmluHznJw2pA1WyS7FhbsoxCYn8CR1JBzdARQgQ6KoE8jZROZKo1pas1U11TDo
         w9/v9oltS7PLF+bCS9M4YAZXNnHX6nMZTVMUzZRtMcrmib3HprIlXeslWAq0ctSvzl7M
         p+qhGUYy9GM5uAlTRAbVPlEXKCwpFCv8Z/IjFfTn0+XTCwOFBn0diYIxndcY+9XPIhga
         vkqA6xf2dmqtsKGNhuuCmgYnLEjgDZf+cVqrWj1qeoggW13dsgqtFsAWNIARiPLMKg5s
         1u/g==
X-Gm-Message-State: AOAM533Gpy53n1HTxApNCY1JKpcg9W3x81G5qMv7MyrXj8RAcxM+TJuS
        /IpZHuP8HEYQg9nGUM5Bw7GviQ==
X-Google-Smtp-Source: ABdhPJxTUNdlC9idt9aofzdeF/SqBgQafoUThLB6TuhkEmYTEqzNhlqRyTH3BuFi+mQCqEe8rTs57Q==
X-Received: by 2002:a62:4e4e:0:b0:4fa:b1d4:3405 with SMTP id c75-20020a624e4e000000b004fab1d43405mr28627061pfb.71.1648572415934;
        Tue, 29 Mar 2022 09:46:55 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id e12-20020a056a001a8c00b004fab88d7de8sm20243658pfv.132.2022.03.29.09.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 09:46:52 -0700 (PDT)
Subject: [PATCH] doc: RISC-V: Remove pmu/ from the toctree
Date:   Tue, 29 Mar 2022 09:45:44 -0700
Message-Id: <20220329164544.29367-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc:     corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
        alex@ghiti.fr, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Palmer Dabbelt <palmer@rivosinc.com>
From:   Palmer Dabbelt <palmer@rivosinc.com>
To:         linux-riscv@lists.infradead.org,
            Stephen Rothwell <sfr@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Palmer Dabbelt <palmer@rivosinc.com>

This subdir no longer exists: it was there to document some of the
quirks and paths forward for handling them, but those have been dealt
with as of Atish's recent patch set.

Fixes: 23b1f18326ec ("Documentation: riscv: Remove the old documentation")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 Documentation/riscv/index.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/riscv/index.rst b/Documentation/riscv/index.rst
index ea915c196048..e23b876ad6eb 100644
--- a/Documentation/riscv/index.rst
+++ b/Documentation/riscv/index.rst
@@ -7,7 +7,6 @@ RISC-V architecture
 
     boot-image-header
     vm-layout
-    pmu
     patch-acceptance
 
     features
-- 
2.34.1

