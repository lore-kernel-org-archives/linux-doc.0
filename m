Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 531CA7DCEA
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 Oct 2019 14:00:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727878AbfJaOAB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 Oct 2019 10:00:01 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38849 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727857AbfJaN75 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 Oct 2019 09:59:57 -0400
Received: by mail-pg1-f194.google.com with SMTP id j30so632696pgn.5
        for <linux-doc@vger.kernel.org>; Thu, 31 Oct 2019 06:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=E3OJFxf+mUWoz3h8BXrLdL53qyDG3CcJuYs/0iyxKF4=;
        b=tf+KATEyMKScBhe2rDxFmvhHdhpJvsG8Ppi+Ok6s+1JY+Ck0LsQI6EgbXGwk6Gxns2
         PBhFeVi79K6keCg6KQopPP+74YLxVly8VZb6Lkf1BGv+ATKanKjaohe+f55adgBuMttF
         ghSDNFsV11Nb21uJw86b7GMyPRXXuWo3nSS9se6Vt7rIUg3OvajwiDKd2Byp1nMqXkx6
         RLI18VC7Bc7ONNECHSTu/fq24VhTJJYi4wjTUIJfJ7zE+NM+fU/oyzFLdPiRdKQgL9qR
         NVu9qVxDVu59qNFL7TyaD+bkES5v9TlqyZ9mHlOmkX4lzMqpiLj8bfpJmBr8MVXkfcQW
         HHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=E3OJFxf+mUWoz3h8BXrLdL53qyDG3CcJuYs/0iyxKF4=;
        b=P2JnV1V7r4Oy5FwJHKuGy/dPAGcA+nwgwqa6s72vluY7lsPJ0lE1+wQsbWC1HZyqkp
         yTFEuaQDsCZszRN6Te7QHr4k+7WO658d75SF2Tx2Gq5zC0CY6cF6fbI6Ra52uakMH/7b
         hIOzLvlf0V0CMFz70Ob/M2aSVDHKqkfvD8w1XMnOTKv7stQdaWejFa+Yd20zH0wtk+z8
         L7gNVjHa0jE7D1QWCLvdgl7o9/HYufZbfW0/73V6i5vFYQubDaFeqN5KvWZ2AQghPmHO
         LPzcmrEewEgvfoY/LPtv6P7QpreLbsKiRbZqRAAEQtBflKVqrRYoMM1xRTZj+9w8wU2T
         Q5lA==
X-Gm-Message-State: APjAAAVZNQ9un5FUql4ekARI59EUg8+yO9STBtuNpbVUNmvchX6eNK7B
        tz40F9O6kTZowjCDtyIncqyLzw==
X-Google-Smtp-Source: APXvYqx6w3fK7udP850k+SVSjxTClJG1BWGTayyOqKUy8HcRBFjYN6ROvTumbYp2kjoyQbEiFFSOdg==
X-Received: by 2002:a63:fe0c:: with SMTP id p12mr6825858pgh.121.1572530396394;
        Thu, 31 Oct 2019 06:59:56 -0700 (PDT)
Received: from localhost.localdomain ([117.252.69.143])
        by smtp.gmail.com with ESMTPSA id i16sm3522441pfa.184.2019.10.31.06.59.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 31 Oct 2019 06:59:55 -0700 (PDT)
From:   Sumit Garg <sumit.garg@linaro.org>
To:     jens.wiklander@linaro.org, jarkko.sakkinen@linux.intel.com,
        dhowells@redhat.com
Cc:     corbet@lwn.net, jejb@linux.ibm.com, zohar@linux.ibm.com,
        jmorris@namei.org, serge@hallyn.com, casey@schaufler-ca.com,
        ard.biesheuvel@linaro.org, daniel.thompson@linaro.org,
        stuart.yoder@arm.com, janne.karhunen@gmail.com,
        keyrings@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        tee-dev@lists.linaro.org, Sumit Garg <sumit.garg@linaro.org>
Subject: [Patch v3 3/7] tee: add private login method for kernel clients
Date:   Thu, 31 Oct 2019 19:28:39 +0530
Message-Id: <1572530323-14802-4-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572530323-14802-1-git-send-email-sumit.garg@linaro.org>
References: <1572530323-14802-1-git-send-email-sumit.garg@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are use-cases where user-space shouldn't be allowed to communicate
directly with a TEE device which is dedicated to provide a specific
service for a kernel client. So add a private login method for kernel
clients and disallow user-space to open-session using GP implementation
defined login method range: (0x80000000 - 0xFFFFFFFF).

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 drivers/tee/tee_core.c   | 6 ++++++
 include/uapi/linux/tee.h | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 0f16d9f..2c2f646 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -334,6 +334,12 @@ static int tee_ioctl_open_session(struct tee_context *ctx,
 			goto out;
 	}
 
+	if (arg.clnt_login & TEE_IOCTL_LOGIN_MASK) {
+		pr_debug("login method not allowed for user-space client\n");
+		rc = -EPERM;
+		goto out;
+	}
+
 	rc = ctx->teedev->desc->ops->open_session(ctx, &arg, params);
 	if (rc)
 		goto out;
diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
index 4b9eb06..a0a3d52 100644
--- a/include/uapi/linux/tee.h
+++ b/include/uapi/linux/tee.h
@@ -172,6 +172,14 @@ struct tee_ioctl_buf_data {
 #define TEE_IOCTL_LOGIN_APPLICATION		4
 #define TEE_IOCTL_LOGIN_USER_APPLICATION	5
 #define TEE_IOCTL_LOGIN_GROUP_APPLICATION	6
+/*
+ * Disallow user-space to use GP implementation specific login
+ * method range (0x80000000 - 0xFFFFFFFF). This range is rather
+ * being reserved for REE kernel clients or TEE implementation.
+ */
+#define TEE_IOCTL_LOGIN_MASK			0x80000000
+/* Private login method for REE kernel clients */
+#define TEE_IOCTL_LOGIN_REE_KERNEL		0x80000000
 
 /**
  * struct tee_ioctl_param - parameter
-- 
2.7.4

