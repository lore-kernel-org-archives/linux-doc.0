Return-Path: <SRS0=24Yb=2X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81679C3276C
	for <linux-doc@archiver.kernel.org>; Thu,  2 Jan 2020 04:15:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 582FE208C3
	for <linux-doc@archiver.kernel.org>; Thu,  2 Jan 2020 04:15:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="fVOVyHxQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727632AbgABEOx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Jan 2020 23:14:53 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33780 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727630AbgABEOw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Jan 2020 23:14:52 -0500
Received: by mail-pf1-f195.google.com with SMTP id z16so21486728pfk.0
        for <linux-doc@vger.kernel.org>; Wed, 01 Jan 2020 20:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xRIqkpS+vEH2fQVaBgXNRzy8KphxwIGgy8VZczGGCGo=;
        b=fVOVyHxQMzlnCKA8erP9Wti/Xdnqmv/ZFemKS26QB2b396Y/Wl46alb67+5C0oZcbU
         OGGeQjcE9ZvjP5+IR84Bsd4fWMIyISM5Ij3i3eQeqJIEfjX1105zjM9L9JNVE897RJno
         sQ2XD7mOcAlAeAyY8YhGHy59azp7lcACBaFFMjO1/LDKt4vEnArO/jQCoBjvOfPHer0Q
         ALhoS6ZBbiaBgvZYYMH8IIzR0fheV6BhSi076775U9MUl8vUU3VeprHBl743LZrMDSGE
         lu8iSzinBDhhCwAsw3SKFyHK4+pcYmRkczv1rmwGKEA4o+GR6QzHh526+mYXOQDH3MKg
         fG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xRIqkpS+vEH2fQVaBgXNRzy8KphxwIGgy8VZczGGCGo=;
        b=uVl8o2r08DWMvjQ662oCmFVph7qxPyEHOv6I+FpHkN/fubBbaqfB343gPObczPeN4+
         SzOtHUssLYD7Xm006cONgRQyz/HM0dknJqDQHBRlwaJISUkJtx0CLQqVfVcPQ+kTpgfB
         +wzy9q5Uckz05+hcJjDYKpKAFf8wHhKNhLTYep0I/31d79BVzR3rC2Zi68fVZ/YWdksr
         bTm7sOObvBnI/c68esOUabI/b8yoTuE58V2LOq8F/Eba8cdtacRYwcryPcBs/7yv1avf
         xD+oqwoVIU1bp8oa4Un7+dIwlDKHoaeRx+TJjHA+yTUWz1medMPsfX3Vf7sl7+F8TrDp
         JMHw==
X-Gm-Message-State: APjAAAWWXn2Msj4gBDmwUWXAYJAZqyLr7p094jc7NePFjxxu4vcqX9fR
        dKKgjZaLLZiRLN/VT9QFZQ2Oyg==
X-Google-Smtp-Source: APXvYqwxtTtibqCTDpLG7RCZcBpPTOxuSd5xxO3oouomRB1PopxQCMZWVfAlnq62DEPvPNHLMIpWBA==
X-Received: by 2002:aa7:82d5:: with SMTP id f21mr88277819pfn.245.1577938491457;
        Wed, 01 Jan 2020 20:14:51 -0800 (PST)
Received: from hsinchu02.internal.sifive.com (220-132-236-182.HINET-IP.hinet.net. [220.132.236.182])
        by smtp.gmail.com with ESMTPSA id i127sm63870336pfc.55.2020.01.01.20.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2020 20:14:51 -0800 (PST)
From:   Zong Li <zong.li@sifive.com>
To:     corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, anup@brainfault.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Cc:     Zong Li <zong.li@sifive.com>
Subject: [PATCH 1/2] riscv: gcov: enable gcov for RISC-V
Date:   Thu,  2 Jan 2020 12:14:44 +0800
Message-Id: <20200102041445.98195-2-zong.li@sifive.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200102041445.98195-1-zong.li@sifive.com>
References: <20200102041445.98195-1-zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch enables GCOV code coverage measurement on RISC-V.
Lightly tested on QEMU and Hifive Unleashed board, seems to work as
expected.

Signed-off-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d8efbaa78d67..a31169b02ec0 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -64,6 +64,7 @@ config RISCV
 	select SPARSEMEM_STATIC if 32BIT
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select HAVE_ARCH_MMAP_RND_BITS if MMU
+	select ARCH_HAS_GCOV_PROFILE_ALL
 
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
-- 
2.24.1

