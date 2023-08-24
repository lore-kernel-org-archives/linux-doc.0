Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98DFAC3DA6F
	for <linux-doc@archiver.kernel.org>; Thu, 24 Aug 2023 11:03:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236341AbjHXLDE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Aug 2023 07:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240994AbjHXLCx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Aug 2023 07:02:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 812411BF8
        for <linux-doc@vger.kernel.org>; Thu, 24 Aug 2023 04:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692874877;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=NmUHBo5LrPwdmQecLAx8MfYidtED1jQWxrZgmH5OLzg=;
        b=VWExLDLazuWQhOyY6TqmqPNQNQwS1RfN/I0l4Uh6vGUlexgaWg6uNaet8j7ZrlTka4mSCW
        exLVGFOaiB1eSaRelyrCW40jfH1dR13IYOVe/bsSXJO3pBTivboITMi1V3YKWll09db84m
        fu7Y7ls9KSrNxKitdcltSw3xUW1UvVM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-ln5LElDrNMKaevBhDzzxTA-1; Thu, 24 Aug 2023 07:01:15 -0400
X-MC-Unique: ln5LElDrNMKaevBhDzzxTA-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-64726969c8bso19679846d6.0
        for <linux-doc@vger.kernel.org>; Thu, 24 Aug 2023 04:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692874875; x=1693479675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NmUHBo5LrPwdmQecLAx8MfYidtED1jQWxrZgmH5OLzg=;
        b=EPKDmUVpuFUx8Lr/cF2u43bruLOA4TL9uRWcnUJ0XWXVFbtGu7aRyYFaJE2iqqXvfh
         guR4pav1ACxZ5yLcgVHdXExWHXFtnUTfctr1wVhMibnI/3qUqFkWFC6pEvWATBAzeA80
         SbOcK1S3Rjt0f3HF3l8Bcl3xMuzwxr5Vm4RDvbbGaxxXJAB7fJAPSp40sNvDYS/dIkn9
         lcujjB4lUiCqvDlRNxIk6mtvCJS/HOETudDOmpSpohzJnDePsw4MRnBwMdL0XdDMtISk
         IaYD/g/yyBGk0orUp6wgMWhFKUy9G75RxzufRYxRbSintUgSLfytw+53cb5TAGU0uZ2l
         msHw==
X-Gm-Message-State: AOJu0YzqTGwHhXKLeJEABpvLomNM9G82GcfU5v1tKLM7US6YtBmk0rAo
        Q1XmhnJmfq6zkLkkbCiYYNRlMU2g3DmsuIs67J2+HGRMdb3imvtNqwQjF9s6TI5DSP96qPhDGer
        lL5T5tyu07qT3gnMxBF+i
X-Received: by 2002:a05:622a:294:b0:411:f6a8:a0da with SMTP id z20-20020a05622a029400b00411f6a8a0damr4149094qtw.2.1692874875470;
        Thu, 24 Aug 2023 04:01:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERKsP7cGywJYsINrzua4Lmp4hKkGpExNSVHLq+6bmfDgtvoEcp1qnbje49JxvRC7MFmDtEZA==
X-Received: by 2002:a05:622a:294:b0:411:f6a8:a0da with SMTP id z20-20020a05622a029400b00411f6a8a0damr4149079qtw.2.1692874875242;
        Thu, 24 Aug 2023 04:01:15 -0700 (PDT)
Received: from fedorinator.redhat.com ([2001:9e8:32d4:a00:c8cc:8ab8:2b77:5655])
        by smtp.gmail.com with ESMTPSA id j16-20020ac806d0000000b00405502aaf76sm3501549qth.57.2023.08.24.04.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 04:01:14 -0700 (PDT)
From:   Philipp Stanner <pstanner@redhat.com>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH] Docu: genericirq.rst: fix irq-example
Date:   Thu, 24 Aug 2023 13:01:09 +0200
Message-ID: <20230824110109.18844-1-pstanner@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A code example was missing the pointer to dereference a variable.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 Documentation/core-api/genericirq.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/genericirq.rst b/Documentation/core-api/genericirq.rst
index f959c9b53f61..4a460639ab1c 100644
--- a/Documentation/core-api/genericirq.rst
+++ b/Documentation/core-api/genericirq.rst
@@ -264,7 +264,7 @@ The following control flow is implemented (simplified excerpt)::
             desc->irq_data.chip->irq_unmask();
         desc->status &= ~pending;
         handle_irq_event(desc->action);
-    } while (status & pending);
+    } while (desc->status & pending);
     desc->status &= ~running;
 
 
-- 
2.40.0

