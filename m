Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29506C77B61
	for <linux-doc@archiver.kernel.org>; Wed, 26 Apr 2023 02:16:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238472AbjDZCQF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 Apr 2023 22:16:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238460AbjDZCQE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Apr 2023 22:16:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6D405265
        for <linux-doc@vger.kernel.org>; Tue, 25 Apr 2023 19:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682475319;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=Ru4Fi6lXtJSomc5yGnliYFfsBReQZOeqKk/Wi8U9wyg=;
        b=gPmv1xfBUO1vt0SVt0+s6Fb1gEW5rSnJhvIoRHhscKmARLCmM0sryO03D4+/HwtVoYZzBh
        9u4AiVrX/w5E6tsixXHoy23shIzVUude1+HzlwIYZ9so7oCxGu9YRJwCq8YbkB8aIWAXWF
        7LdjBk3DT0jUhnQ6S3gnt3oopqyaxL4=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-dPtEBDgCPlWDh6a1Fc4euA-1; Tue, 25 Apr 2023 22:15:18 -0400
X-MC-Unique: dPtEBDgCPlWDh6a1Fc4euA-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-24781ab929bso3636997a91.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Apr 2023 19:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682475317; x=1685067317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ru4Fi6lXtJSomc5yGnliYFfsBReQZOeqKk/Wi8U9wyg=;
        b=dm33PIBURiY8LYwIEq0v2NH07pFTSe4OEpwsQHKdzsPK4WMaN9dTK9LEUc7BpfDrWC
         Cot8KqaJV8HSMbp46Zj5k8RppEkbz8MKI5dNs9Tl2g6NbE0xbVmC/AsCKoKofJMrzVGo
         QoWBRwT/R3kufrSDiZ0n9FY0H3xsSeTOEtwfZRNFszvuzqN2fhg0N3nv+rxfV3t7f6qZ
         YJVx+t8ah7fBwbeYKr85EdMXa3OlKD5Z5yAhPsCgE6DAgQZ7Jtss7YsgFIMSDOB8TRFO
         N/ydRrGEmWu1Qzs51Up8h1m2YH2kANNEr+vVifIYeYEgxwtLXpRVC3FK2l9qj8+vvKbm
         3hyw==
X-Gm-Message-State: AAQBX9d6jMPj9U64ZMsF3L8+kE1o49mszi2tjaP7tnNZzouHdnf6QciT
        iJsiiPZNB7Kof8RF32yn6EMa3A+zFC75vG9c6ZwQS5A807Dtdz5T4v8IBYKsm8MVXDCUXpEHlXZ
        UJIceZ346yA6HrQ5guIDq
X-Received: by 2002:a17:90b:350a:b0:24b:8480:39d6 with SMTP id ls10-20020a17090b350a00b0024b848039d6mr13730504pjb.0.1682475317492;
        Tue, 25 Apr 2023 19:15:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350aNzw25n2T4Kg6l2sulIWfKq7mZH5YYPtYzlWnAaxRdkWp7vw0jmEXwvdkYbvVMATVQOvnhOg==
X-Received: by 2002:a17:90b:350a:b0:24b:8480:39d6 with SMTP id ls10-20020a17090b350a00b0024b848039d6mr13730491pjb.0.1682475317165;
        Tue, 25 Apr 2023 19:15:17 -0700 (PDT)
Received: from localhost.localdomain.com ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id pw12-20020a17090b278c00b00246ba2b48f3sm12308903pjb.3.2023.04.25.19.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 19:15:16 -0700 (PDT)
From:   Tao Liu <ltao@redhat.com>
To:     alexs@kernel.org, siyanteng@loongson.cn, corbet@lwn.net,
        src.res@email.cn
Cc:     linux-doc@vger.kernel.org,
        linux-doc-tw-discuss@lists.sourceforge.net,
        Tao Liu <ltao@redhat.com>
Subject: [PATCH] Remove the unnecessary unicode character
Date:   Wed, 26 Apr 2023 10:14:52 +0800
Message-Id: <20230426021452.9745-1-ltao@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There is a non-printable unicode char '\u202a' or "0xe2 0x80 0xaa" in hex
in the translation doc. It is unnecessary and should be removed for better
text formatting when using editors like vi.

Signed-off-by: Tao Liu <ltao@redhat.com>
---
 Documentation/translations/zh_CN/process/magic-number.rst | 2 +-
 Documentation/translations/zh_TW/process/magic-number.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/magic-number.rst b/Documentation/translations/zh_CN/process/magic-number.rst
index 0617ce125e12..6f22b728d4e7 100644
--- a/Documentation/translations/zh_CN/process/magic-number.rst
+++ b/Documentation/translations/zh_CN/process/magic-number.rst
@@ -25,7 +25,7 @@ Linux 魔术数
         	...
         };
 
-当你以后给内核添加增强功能的时候，请遵守这条规则！这样就会节省数不清的调试时间，特别是一些古怪的情况，例如，数组超出范围并且重新写了超出部分。遵守这个规则，‪这些情况可以被快速地，安全地避免。
+当你以后给内核添加增强功能的时候，请遵守这条规则！这样就会节省数不清的调试时间，特别是一些古怪的情况，例如，数组超出范围并且重新写了超出部分。遵守这个规则，这些情况可以被快速地，安全地避免。
 
 		Theodore Ts'o
 		  31 Mar 94
diff --git a/Documentation/translations/zh_TW/process/magic-number.rst b/Documentation/translations/zh_TW/process/magic-number.rst
index f3f7082e17c6..a3dd87cadc26 100644
--- a/Documentation/translations/zh_TW/process/magic-number.rst
+++ b/Documentation/translations/zh_TW/process/magic-number.rst
@@ -28,7 +28,7 @@ Linux 魔術數
         	...
         };
 
-當你以後給內核添加增強功能的時候，請遵守這條規則！這樣就會節省數不清的調試時間，特別是一些古怪的情況，例如，數組超出範圍並且重新寫了超出部分。遵守這個規則，‪這些情況可以被快速地，安全地避免。
+當你以後給內核添加增強功能的時候，請遵守這條規則！這樣就會節省數不清的調試時間，特別是一些古怪的情況，例如，數組超出範圍並且重新寫了超出部分。遵守這個規則，這些情況可以被快速地，安全地避免。
 
 		Theodore Ts'o
 		  31 Mar 94
-- 
2.33.1

