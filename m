Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6496C433EF
	for <linux-doc@archiver.kernel.org>; Mon,  9 May 2022 13:09:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235210AbiEINNB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 9 May 2022 09:13:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235245AbiEINNA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 May 2022 09:13:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 90C772A768B
        for <linux-doc@vger.kernel.org>; Mon,  9 May 2022 06:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652101742;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=9C8drEYqngKOm3nncV9RRJ4ZJYInBOQKfqINsG0BQFA=;
        b=WTWlWkUqRPMyTrEfzmeQjHaZBU3j8KbueY6mLhWF8iNg8r787smSwLsTQnuRBH+0Rxef7k
        s9d8BEd8lPoKeiLE7lsBSizdEL3W9o5FfDMxjf45oIlc9AjTbGpNHe4JpjvkU0W7jJjqoZ
        5heN4khFypWH8x7QU77gK7JWIszfUEo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-Qk5pzgt8NYGByeZ22Hei6A-1; Mon, 09 May 2022 09:09:01 -0400
X-MC-Unique: Qk5pzgt8NYGByeZ22Hei6A-1
Received: by mail-wm1-f71.google.com with SMTP id u3-20020a05600c210300b0039430c7665eso3860954wml.2
        for <linux-doc@vger.kernel.org>; Mon, 09 May 2022 06:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9C8drEYqngKOm3nncV9RRJ4ZJYInBOQKfqINsG0BQFA=;
        b=AohDYOzz2JnT32ya3hou8FrHVo4MEEG60MOtDIPCTPgx6ipQMq0OLLKDYR8YHgj7DZ
         J95zDa2hq/R0NU6TK8Md04Dl37Ae+YpcUe6moW3b38P8zZcA4t6pZTIfS+8cSmj1XwyB
         6wF7LxACRtlU+tz75X2KKDxQdBosNgx1+qx8fZGU90Hkr7tA9nsgnQSWzoO8I9OXmCCm
         NbNCGAVZegGKzejBBKjSFnFwKOg6MP9MLB2iFUt6WvjFr46R2e3QJRf3lpY5yHJ91SvV
         DWy33X8y/cKaa5PDYFCvQIrlQmuLYJy8C4AagjQovCUD0+2qv60XRXYkRXhNtoJnTZXw
         +tyQ==
X-Gm-Message-State: AOAM531EuE4yZC3Zokv9jgZc23nP12yt4J76BYQIuPc1m9Us3Ja2xp9B
        g9YrQcvabJDXoUUdzBQgmGY+/KMRW8wO5ekKyQquMTBSTAAI80NdFoFFbE3lcZHYSfW2Z1sdkIU
        FS1gdVoPMYFMaZYnUf6x5
X-Received: by 2002:a05:6000:1869:b0:20c:5362:1295 with SMTP id d9-20020a056000186900b0020c53621295mr14079746wri.700.1652101740370;
        Mon, 09 May 2022 06:09:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDG6lbGPaq84WzEwCdXcOkQUQu+pRyyBz43QQu3IUWtgwSbAp0rMkkKwCQUS43pMkFMDHl0A==
X-Received: by 2002:a05:6000:1869:b0:20c:5362:1295 with SMTP id d9-20020a056000186900b0020c53621295mr14079728wri.700.1652101740162;
        Mon, 09 May 2022 06:09:00 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id z22-20020a05600c0a1600b003942a244eddsm13120297wmp.34.2022.05.09.06.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 06:08:59 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Javier Martinez Canillas <javierm@redhat.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: [PATCH] drm/todo: Add entry for converting kselftests to kunit
Date:   Mon,  9 May 2022 15:08:46 +0200
Message-Id: <20220509130846.694397-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Many of the kselftests in DRM can be converted to kunit tests instead,
since that framework is more suitable for unit testing.

Suggested-by: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 Documentation/gpu/todo.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 10bfb50908d1..513b20ccef1e 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -617,6 +617,17 @@ Contact: Javier Martinez Canillas <javierm@redhat.com>
 
 Level: Intermediate
 
+Convert Kernel Selftests (kselftest) to KUnit tests when appropriate
+--------------------------------------------------------------------
+
+Many of the `Kselftest <https://www.kernel.org/doc/html/latest/dev-tools/kselftest.html>`_
+tests in DRM could be converted to Kunit tests instead, since that framework
+is more suitable for unit testing.
+
+Contact: Javier Martinez Canillas <javierm@redhat.com>
+
+Level: Starter
+
 Enable trinity for DRM
 ----------------------
 
-- 
2.35.1

