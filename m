Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 414C9C48BE5
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 21:24:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B6FE60FD8
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 21:24:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234254AbhFHV0I (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Jun 2021 17:26:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25438 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234262AbhFHV0E (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jun 2021 17:26:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623187451;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=V9tvOeij7irPdqtg/4eaarQWu4Ala2EOw38yDUGQMKE=;
        b=RLc+JhQaq9yO+Ymi8CEoEJGmtNgyCaJS1uQg3PAhQRXyF47JF/YT3VUFvMq0oGpvnjJuRe
        7R/Ti2pZ7BcGWKc+se/bzpDk21RUk3IVxU/dBPF/Tt656kHzPh5cpd9yImz+vV5lqMtWtD
        TBk6w3hYMNokMoUjcuY44ZxW12a1FF8=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-LUgWivUoMf2dlAmWDSNVag-1; Tue, 08 Jun 2021 17:24:09 -0400
X-MC-Unique: LUgWivUoMf2dlAmWDSNVag-1
Received: by mail-ot1-f69.google.com with SMTP id c10-20020a9d75ca0000b02903f63362f6f3so1804551otl.1
        for <linux-doc@vger.kernel.org>; Tue, 08 Jun 2021 14:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V9tvOeij7irPdqtg/4eaarQWu4Ala2EOw38yDUGQMKE=;
        b=iKSGJy4iyexngydYeSJ2hZiLNcU2y/sYsT6SysGrFgBPPXeSvnbUqoYZZzlNRv5TZ9
         MerWXnc75GyGs+HpdEqVg+wh+CLCY3DRgU3GpVttRc0vWgZbX3smuNoetwKxfiGrcwUf
         8MtwaH9NK9mpmMWFM7aWqDk6P7SvV7MK+CbsxfUH0/jZwxwVVi8j74JX1RI8zHcIUIhc
         9NwNNtKnY5Vwjwn/yCGIci7R6L34cOUM8CtSl/BKwDUyNANTfrdA4DJb9UYHeXVBR4VZ
         yR4E3kFZ86nQ4/SzAGw9nolefT9E+WagRQxMMdqTpTMWO2Iw9jfr0uF5PmK+fay2jyJw
         N+iw==
X-Gm-Message-State: AOAM530dfOEbht5hsEhm9Swy9zEdqxGsLFxXckbm8OIlSVQeY61UbilQ
        Sp2PLJl5hKQOBeUcWObqOoOkYJ/st8jX/UX/+Y4y73rwpyXgM7Ngt3YI2uYTAHLEzqJOBUsv/T9
        ILruziXaZXNQTYuWaDjPe
X-Received: by 2002:a4a:ded3:: with SMTP id w19mr5293606oou.46.1623187449153;
        Tue, 08 Jun 2021 14:24:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUcRpoqPmXEA6scCuFTxzSHKgG4PG3qjyFY5xu7aC63DD0rnFJZyVbbKXaRqPE6V2Ub7Lciw==
X-Received: by 2002:a4a:ded3:: with SMTP id w19mr5293585oou.46.1623187448949;
        Tue, 08 Jun 2021 14:24:08 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id x199sm1954310oif.5.2021.06.08.14.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 14:24:08 -0700 (PDT)
From:   trix@redhat.com
To:     mdf@kernel.org, robh+dt@kernel.org, hao.wu@intel.com,
        corbet@lwn.net, fbarrat@linux.ibm.com, ajd@linux.ibm.com,
        bbrezillon@kernel.org, arno@natisbad.org, schalla@marvell.com,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        gregkh@linuxfoundation.org, Sven.Auhagen@voleatech.de,
        grandmaster@al2klimov.de
Cc:     linux-fpga@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
        linux-staging@lists.linux.dev, Tom Rix <trix@redhat.com>
Subject: [PATCH 03/11] Documentation: ocxl.rst: change FPGA indirect article to an
Date:   Tue,  8 Jun 2021 14:23:42 -0700
Message-Id: <20210608212350.3029742-5-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210608212350.3029742-1-trix@redhat.com>
References: <20210608212350.3029742-1-trix@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Change use of 'a fpga' to 'an fpga'

Signed-off-by: Tom Rix <trix@redhat.com>
---
 Documentation/userspace-api/accelerators/ocxl.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/accelerators/ocxl.rst b/Documentation/userspace-api/accelerators/ocxl.rst
index 14cefc020e2d5..db7570d5e50d1 100644
--- a/Documentation/userspace-api/accelerators/ocxl.rst
+++ b/Documentation/userspace-api/accelerators/ocxl.rst
@@ -6,7 +6,7 @@ OpenCAPI is an interface between processors and accelerators. It aims
 at being low-latency and high-bandwidth. The specification is
 developed by the `OpenCAPI Consortium <http://opencapi.org/>`_.
 
-It allows an accelerator (which could be a FPGA, ASICs, ...) to access
+It allows an accelerator (which could be an FPGA, ASICs, ...) to access
 the host memory coherently, using virtual addresses. An OpenCAPI
 device can also host its own memory, that can be accessed from the
 host.
-- 
2.26.3

