Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBB5C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 26 Oct 2021 08:31:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1123D610D2
	for <linux-doc@archiver.kernel.org>; Tue, 26 Oct 2021 08:31:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234359AbhJZIeL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Oct 2021 04:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234347AbhJZIeK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Oct 2021 04:34:10 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96781C061220
        for <linux-doc@vger.kernel.org>; Tue, 26 Oct 2021 01:31:46 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id o26so18480084ljj.2
        for <linux-doc@vger.kernel.org>; Tue, 26 Oct 2021 01:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nJY8BVmSGkgTm20CsRqOlZqDh54ZnLLnIcGJozAZVtQ=;
        b=x6wpGGZ4t4jpHZXbOtVtiqY9J28NnXCjPP+t+zbf5ZLXQknU6PZKpyIRv59OjvwQ2L
         MRo/9tRg1j8RtVI36taOo+vMSkONJCGbZLhgQR2ky+H3wgoIrtxKgwPRfRDuYH4b0kJd
         6oJ9070IcWTB1lHteM3ZY8CxxFYGSQOdHy9wWT0k9qaZwqNaaaTeyc9wwa7lBVkJUqPw
         h4eHCwnV5+QV0/LOFhVTce8PPxgVFdQppiKF+IZFE5tfR5T8FIPtOHG4dDtvNlBUgDhi
         nCzHiQn1rqkewJ4aojuBVjmIU4nTIWNl9ouEOGngtC7Hh/BKZzMwIjjBWQhqeyHRSK7X
         FXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nJY8BVmSGkgTm20CsRqOlZqDh54ZnLLnIcGJozAZVtQ=;
        b=gq9r4WPqfvzlZ+yczKUNenVz4OKuE59802r5SjGvHSzIP7rvkVh4WEeTzcZAlTeqnc
         5KpiZdIuArXG/3P2N7huE6CPH0MQ5DRUqggvdf+CfCWuudHkikaAIFO6SaqqY0xB3dzy
         E4Mi0sfQv7OW9VqOLggq+LxNwe56pTgckiOOCgLK50H88rhcqy+JQO1wAAVRKG2BYO2o
         f/raIkuu0KJG7dE+yv3turzHIUP7dVfvXWQTzNwJ2XkFo/qjXkhs1QV1o8TeoeB1NGsJ
         NnxLY0+iC831CaiGHxCk5L+TGWW+dpWfLjXYZwkhFPOvlQjmcNXRxsZIwJdIKm5sSOEu
         ieKA==
X-Gm-Message-State: AOAM533rUAeVcYN41/JuzSuI8m/1qLFapezm5bH4CXW5MX48sjYSXu/r
        hlGMkyxAiQk1KqHoFJDJeOY+ww==
X-Google-Smtp-Source: ABdhPJz62lWImbRbMZBUEEDsRT6QZPET/1jm/lqlcEQjVChDZ2sw0LXS3GpvH1ezJVF85rwv+zTBfg==
X-Received: by 2002:a05:651c:1aa:: with SMTP id c10mr24290846ljn.222.1635237104897;
        Tue, 26 Oct 2021 01:31:44 -0700 (PDT)
Received: from jade.urgonet (h-94-254-48-165.A175.priv.bahnhof.se. [94.254.48.165])
        by smtp.gmail.com with ESMTPSA id e4sm1944598ljn.131.2021.10.26.01.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 01:31:44 -0700 (PDT)
From:   Jens Wiklander <jens.wiklander@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     Jerome Forissier <jerome@forissier.org>,
        Etienne Carriere <etienne.carriere@linaro.org>,
        Sumit Garg <sumit.garg@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Marc Zyngier <maz@kernel.org>, jens.vankeirsbilck@kuleuven.be,
        Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v7 1/6] docs: staging/tee.rst: add a section on OP-TEE notifications
Date:   Tue, 26 Oct 2021 10:31:33 +0200
Message-Id: <20211026083138.1818705-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211026083138.1818705-1-jens.wiklander@linaro.org>
References: <20211026083138.1818705-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Adds a section on notifications used by OP-TEE, synchronous and
asynchronous.

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
Acked-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 Documentation/staging/tee.rst | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/staging/tee.rst b/Documentation/staging/tee.rst
index 4d4b5f889603..3c63d8dcd61e 100644
--- a/Documentation/staging/tee.rst
+++ b/Documentation/staging/tee.rst
@@ -184,6 +184,36 @@ order to support device enumeration. In other words, OP-TEE driver invokes this
 application to retrieve a list of Trusted Applications which can be registered
 as devices on the TEE bus.
 
+OP-TEE notifications
+--------------------
+
+There are two kinds of notifications that secure world can use to make
+normal world aware of some event.
+
+1. Synchronous notifications delivered with ``OPTEE_RPC_CMD_NOTIFICATION``
+   using the ``OPTEE_RPC_NOTIFICATION_SEND`` parameter.
+2. Asynchronous notifications delivered with a combination of a non-secure
+   edge-triggered interrupt and a fast call from the non-secure interrupt
+   handler.
+
+Synchronous notifications are limited by depending on RPC for delivery,
+this is only usable when secure world is entered with a yielding call via
+``OPTEE_SMC_CALL_WITH_ARG``. This excludes such notifications from secure
+world interrupt handlers.
+
+An asynchronous notification is delivered via a non-secure edge-triggered
+interrupt to an interrupt handler registered in the OP-TEE driver. The
+actual notification value are retrieved with the fast call
+``OPTEE_SMC_GET_ASYNC_NOTIF_VALUE``. Note that one interrupt can represent
+multiple notifications.
+
+One notification value ``OPTEE_SMC_ASYNC_NOTIF_VALUE_DO_BOTTOM_HALF`` has a
+special meaning. When this value is received it means that normal world is
+supposed to make a yielding call ``OPTEE_MSG_CMD_DO_BOTTOM_HALF``. This
+call is done from the thread assisting the interrupt handler. This is a
+building block for OP-TEE OS in secure world to implement the top half and
+bottom half style of device drivers.
+
 AMD-TEE driver
 ==============
 
-- 
2.31.1

