Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 662D6C4338F
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 09:45:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F2C660EC0
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 09:45:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231365AbhGWJEw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Jul 2021 05:04:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbhGWJEB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Jul 2021 05:04:01 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1AA5C0613CF
        for <linux-doc@vger.kernel.org>; Fri, 23 Jul 2021 02:44:32 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id h9so964514ljq.8
        for <linux-doc@vger.kernel.org>; Fri, 23 Jul 2021 02:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bPEFf1WmEOew3wXqjPL0D4ZH5STaPbCOCI4W4KStU94=;
        b=a1fNzzb05/JkuSVhINb3YkWj8d51JCyyRxYXYiYj6ThohOUOIgdXhsta9RGshy6sRO
         xGlH3w6PjD2kM6rgZ6xDjYJak4yoqpeogR3WPs2QpRsvLqBzVNel7IRXN0mFXfCTnX7S
         9IWMtJCO3+23ZWBKcQ3Hi3z/6mF5vmmuUBGL+TK0LGY6aU1lR3qKU8kvC89mEs8slS8J
         ypst2K75DdwycYWpHinbHEBc4GxCrlBNvFBEEAaF7246BMUGJ5Bcg5OeHWYvkgVAP62r
         9Qo/fmzeZyJ5j0AIfui9ZSA7N/VcVEQZjWzi/xrPfQs43+96jbu4dpbJ7RVjsp2uMjSj
         EYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bPEFf1WmEOew3wXqjPL0D4ZH5STaPbCOCI4W4KStU94=;
        b=BsuQ7YdwM0Z5UhEwauDyjDhlefbU0hv5jbR96qiYFmsW70ug8u3/vuYYxjnsESZqoe
         7GVxIdim4MJDjfvL+XRvmAHY8PsCSR1Iy1FKyQJdL/GDz/Mtn/5FXsLHbXc2Ru5ChDL2
         47bqFO2YoteOyTVd6dXDcz966XMTt+TDolQA24FfPs9DRubG0LfhEMdRCzxDBt1ye5/p
         nwUNl+5gE1vpmFhjTBfj7ree6gApiP3GdhaahtLsmnu4+YGQw1GDcrnPkGlhwr2r7MxD
         E0EAEe5fILwEBNs/FWdDigRpXBL8QKw0pViC9N85gu90tX3wx4tAiG1Il7W7QZxjVJL5
         uLhw==
X-Gm-Message-State: AOAM533/QC1oFi9iyYJCLWCXNqsvjbfL+U7Vd4ilONfE+lJzWVaZS4cN
        SaRN9uI+z0deA5l4FUnLK1HLjg==
X-Google-Smtp-Source: ABdhPJyrtqd7az4W16h9/E8eGPNfaNqKDq1w3C76bT8yiFDLgB8Q722esL9ZhZ/kU/AVPUI6p9JWeQ==
X-Received: by 2002:a2e:a54d:: with SMTP id e13mr2804045ljn.1.1627033471323;
        Fri, 23 Jul 2021 02:44:31 -0700 (PDT)
Received: from jade.urgonet (h-94-254-48-165.A175.priv.bahnhof.se. [94.254.48.165])
        by smtp.gmail.com with ESMTPSA id f2sm403808ljq.131.2021.07.23.02.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 02:44:31 -0700 (PDT)
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
        Marc Zyngier <maz@kernel.org>,
        Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v3 1/6] docs: staging/tee.rst: add a section on OP-TEE notifications
Date:   Fri, 23 Jul 2021 11:44:17 +0200
Message-Id: <20210723094422.2150313-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210723094422.2150313-1-jens.wiklander@linaro.org>
References: <20210723094422.2150313-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Adds a section on notifications used by OP-TEE, synchronous and
asynchronous.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 Documentation/staging/tee.rst | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/staging/tee.rst b/Documentation/staging/tee.rst
index 4d4b5f889603..37bdd097336f 100644
--- a/Documentation/staging/tee.rst
+++ b/Documentation/staging/tee.rst
@@ -184,6 +184,33 @@ order to support device enumeration. In other words, OP-TEE driver invokes this
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
+   interrupt and a fast call from the non-secure interrupt handler.
+
+Synchronous notifications are limited by depending on RPC for delivery,
+this is only usable when secure world is entered with a yielding call via
+``OPTEE_SMC_CALL_WITH_ARG``. This excludes such notifications from secure
+world interrupt handlers.
+
+An asynchronous notification is delivered via a non-secure interrupt to an
+interrupt handler registered in the OP-TEE driver. The actual notification
+value are retrieved with the fast call ``OPTEE_SMC_GET_ASYNC_NOTIF_VALUE``.
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

