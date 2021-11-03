Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C489C433FE
	for <linux-doc@archiver.kernel.org>; Wed,  3 Nov 2021 09:03:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6245361156
	for <linux-doc@archiver.kernel.org>; Wed,  3 Nov 2021 09:03:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231629AbhKCJFk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Nov 2021 05:05:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231240AbhKCJFk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Nov 2021 05:05:40 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8E69C061714
        for <linux-doc@vger.kernel.org>; Wed,  3 Nov 2021 02:03:03 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id t11so2614245ljh.6
        for <linux-doc@vger.kernel.org>; Wed, 03 Nov 2021 02:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nJY8BVmSGkgTm20CsRqOlZqDh54ZnLLnIcGJozAZVtQ=;
        b=pbU1z0Vj5sHJUKmosC+O+X4SNnuCMgsM5oZhO7615jidEjVdb6lSRxFrXXLEdOY46l
         QWln5hwE96k7MpKskbrGrm5mZgqEhABOT9+KVXD8oXhz6z0opaQe58AgUEuIEOaQXF+4
         MYxSC6P99XZf0KAxhklD5JnrHdm63D77PYY6ivSpekrPqZXgTGgNbA0pTLsJNanngOWm
         39u4I3/DFjm6bVvpejl4RnLO+CNG18D2SuTgjp++8lTrO77zuYTaoUYD1oWBi6O/UTHd
         yVFytaN4bR734pwXvzCqbABNxVdvqpEtnSr/HLHnASvhxN/XjCQFvC8P1sL0XnvltfKN
         s9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nJY8BVmSGkgTm20CsRqOlZqDh54ZnLLnIcGJozAZVtQ=;
        b=u/LChZHs9DpCtW/KbDhVcMk9crmDX98Te0ey2E29wqpEbCq6oG9FWK99XeH5ivAiBP
         TALpjB0j11U3R+FWYSGNdbRU305eeHthtqyLIOKjUzJaEowe/zgRV8uyXyg1oVbAdKAN
         nlCUXHlvRaAX0MJKGuPaMxIPN+HbzelCrmv1rN3Qz6f4j+O9ndPhdBjA+ZM7ukG/buT+
         JIDfR/cKahffQ6trdEVZU/oJC46pUJ/6/csVVcTCriecGkaGGrWSSlqjl6WeIInv27yW
         CxnBK9Cv160DL22j1P+HLXTVWQ0eOepzjDePpIniRX7etU/2+sb/GfeMXMOm0JN/0921
         VAfA==
X-Gm-Message-State: AOAM530O2gGpNCazZGdcW2l4GSlCWVXZ6RKhSEjRnt1YcgZEr+c9gppG
        qbT0f6pyQeBTL3s96T3N0qMvSQ==
X-Google-Smtp-Source: ABdhPJwf6qkKTCAxHYBhHAVkgqQC5SAOerKxxzgblePi8wBo76Wk366WL9aI4kfaHjV/5FosvmDJgw==
X-Received: by 2002:a05:651c:b1f:: with SMTP id b31mr19893084ljr.272.1635930182081;
        Wed, 03 Nov 2021 02:03:02 -0700 (PDT)
Received: from jade.urgonet (h-94-254-48-165.A175.priv.bahnhof.se. [94.254.48.165])
        by smtp.gmail.com with ESMTPSA id w16sm124373lfr.233.2021.11.03.02.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 02:03:01 -0700 (PDT)
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
Subject: [PATCH v8 1/6] docs: staging/tee.rst: add a section on OP-TEE notifications
Date:   Wed,  3 Nov 2021 10:02:50 +0100
Message-Id: <20211103090255.998070-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211103090255.998070-1-jens.wiklander@linaro.org>
References: <20211103090255.998070-1-jens.wiklander@linaro.org>
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

