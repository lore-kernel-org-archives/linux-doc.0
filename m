Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A29C433F5
	for <linux-doc@archiver.kernel.org>; Wed,  4 May 2022 08:02:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345970AbiEDIFy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 4 May 2022 04:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346009AbiEDIFy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 May 2022 04:05:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 60C061FCC5
        for <linux-doc@vger.kernel.org>; Wed,  4 May 2022 01:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651651338;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=7zXu34IG6COwbjtsWuh3VVUA+veouEEkv29/Xam+Los=;
        b=C9jGrW4lA1SV6NO/jBdBOk6TgC2WxH5H45PFESxaHLOoWXNzSBorXcd0QqzQuhs4csfb/n
        hGj/fhvdGb4nF4DKgGqFyhw6I2ivx8OymeNOQAHIfFb3y3+U64INgh0oRRI+oEiap6q8ss
        ouUgTTexFMPKyQHfxckdei9NgFIE+20=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-3f-m4UyZPfONBvtr0u2KuQ-1; Wed, 04 May 2022 04:02:17 -0400
X-MC-Unique: 3f-m4UyZPfONBvtr0u2KuQ-1
Received: by mail-wr1-f69.google.com with SMTP id w11-20020adf8bcb000000b0020c550ba8d7so114021wra.1
        for <linux-doc@vger.kernel.org>; Wed, 04 May 2022 01:02:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7zXu34IG6COwbjtsWuh3VVUA+veouEEkv29/Xam+Los=;
        b=wiCZ7G8rNlcaOxAlP0p9TIvSRGumW8JilrkSz0nndPkdabhbcMh6KujHOu2AQXFeMG
         WIXjFRdsrvsFK7jjJv2LI9h+eyXpuzRTANT1vl/QMlqS1N2924jH64QyC2bUzhkTHBZ0
         w/aQ0DWaMO27+q77PfgVXpUT7636OexbTk20ASnF+pmjEkrsuCkhvjb8cVvEgJsXK16j
         QhvfCHHPNXlNN5PLrkEZOT/5B76b5yQsS8sS+haMMLU20UdNEREVyL6LMPgwQSEIjVzp
         w3ko2itRYENyHKcfpYWqtIpJJLlhSgUJAn0Qi9sD/yk5L5YpBnBWOawtCBwFm8sASdpw
         i8oQ==
X-Gm-Message-State: AOAM530vjckOTzqOHrzTnGwfvDFV+SH//GH0/zEy2/UoIm0LpJxmbDp6
        tirVhVUnHaAxaAinuazqKIo70rFetq+ykB1UAfkQDOpuxexePI3kGbtWsVjc8Fe2Y0poLXT4xTf
        tPI0VxIWkrVNmRnYOM5cI
X-Received: by 2002:a05:600c:281:b0:394:1075:fe3e with SMTP id 1-20020a05600c028100b003941075fe3emr6526497wmk.155.1651651336079;
        Wed, 04 May 2022 01:02:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzN1muJJMfdooSCi4Oc6vFk6sijHuLsxaZY4H7nGBDH4+1JhjDY7R1Xp0Vb46jIg79cFINiwA==
X-Received: by 2002:a05:600c:281:b0:394:1075:fe3e with SMTP id 1-20020a05600c028100b003941075fe3emr6526478wmk.155.1651651335844;
        Wed, 04 May 2022 01:02:15 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id c10-20020adfa30a000000b0020c5253d8f4sm10872601wrb.64.2022.05.04.01.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 01:02:15 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: [PATCH] drm/todo: Add entry for using kunit in the subsystem
Date:   Wed,  4 May 2022 10:02:12 +0200
Message-Id: <20220504080212.713275-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The Kernel Unit Testing (KUnit) framework provides a common framework for
unit tests within the Linux kernel. Having a test suite would allow to
identify regressions earlier.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 Documentation/gpu/todo.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 127e76ee0b2d..10bfb50908d1 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -603,6 +603,20 @@ Level: Advanced
 Better Testing
 ==============
 
+Add unit tests using the Kernel Unit Testing (KUnit) framework
+--------------------------------------------------------------
+
+The `KUnit <https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html>`_
+provides a common framework for unit tests within the Linux kernel. Having a
+test suite would allow to identify regressions earlier.
+
+A good candidate for the first unit tests are the format-conversion helpers in
+``drm_format_helper.c``.
+
+Contact: Javier Martinez Canillas <javierm@redhat.com>
+
+Level: Intermediate
+
 Enable trinity for DRM
 ----------------------
 
-- 
2.35.1

