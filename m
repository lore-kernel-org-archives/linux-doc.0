Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 07BF87D90D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 14 Oct 2019 20:21:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732616AbfJNUVi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 14 Oct 2019 16:21:38 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:45931 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732599AbfJNUVi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Oct 2019 16:21:38 -0400
Received: by mail-qt1-f196.google.com with SMTP id c21so27174730qtj.12
        for <linux-doc@vger.kernel.org>; Mon, 14 Oct 2019 13:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=adO3s5rQ80FSe9QoQi3APfXKvpPGONNAIqngjG3oV3o=;
        b=OM2ocL11y852dXCVsBTTpuenXy1lATvJseKhiuvI5VqKrW3eLE0ylQgP0sVpJYLMqj
         V+5p0nSCH5rtm5LMxJzk63qUpR9mCtXx/XbgvaoScxUOnwO1xOeUhezLjlq9KtPDfKhp
         vZt862J+CI1qdnKRiqLlUUFrbhGYwtFxs9oqYKQNKoI2lXWl7HSZKymNsU/OF/Bfc7+x
         BsWoW55x/FwsLR7uau3VLSwUPAbwkHiJS4+jHjDuNNCHRSOwePUqK9KYfadOZ6LEp7xE
         tuL3rbh5/VA/0sWCOxYlL7n3oaUiY26/ltdD2omqJQqg0Y3NHy1m5E1Fnd29cPO8IvcU
         tuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=adO3s5rQ80FSe9QoQi3APfXKvpPGONNAIqngjG3oV3o=;
        b=NZGuHCeDWJtH81RGqITLCQLnEjzQbGJ34nLopIfMsKLScqkacG5xCzO+agEujWCyEW
         XXLJoWAvPVq5uA1cgL3uyIBNbGG50bUyV4udKWj2ofamNvSvJYhWc4rChemROyj36mmK
         Mo46LRBIOEJ9ll0DLcvkPWlTP+m7Dl0fsnit7vtJ0KabR16OtdY+tXxO/AWEAYqnBhIK
         KcPjYEBbNTR4dIBFelfGeDVQj+YISTIKi4R0v0tmIOg1f01S5QC7GH/+CoipSTYytyFZ
         fvy7ZkTUIEHGdqoYjLr9v/DZoNiDolsQalTs0cn2aUzBvjth8vwmNMzMP7PQgkYsIY1y
         aawg==
X-Gm-Message-State: APjAAAVopByMGbLNht0ASHFkxrs6ZKLyMzFcblNAhHTSwdhO0zIyW7Gw
        ObyTdQREVeY2BFT4fupuKELfNw==
X-Google-Smtp-Source: APXvYqyIGxVirj24b/z7N8sIuYFghEnsbiFVPx5jPEWYM5oEfLgLlBoX9K22BMNQM88asTUBLjrE6A==
X-Received: by 2002:aed:3e45:: with SMTP id m5mr3983673qtf.268.1571084497370;
        Mon, 14 Oct 2019 13:21:37 -0700 (PDT)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id y58sm11111472qta.1.2019.10.14.13.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 13:21:36 -0700 (PDT)
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, jmorris@namei.org, sashal@kernel.org,
        peterhuewe@gmx.de, jarkko.sakkinen@linux.intel.com, jgg@ziepe.ca,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-integrity@vger.kernel.org, linux-kernel@microsoft.com,
        thiruan@microsoft.com, bryankel@microsoft.com,
        tee-dev@lists.linaro.org, ilias.apalodimas@linaro.org,
        sumit.garg@linaro.org, rdunlap@infradead.org
Subject: [PATCH v2] tpm/tpm_ftpm_tee: add shutdown call back
Date:   Mon, 14 Oct 2019 16:21:35 -0400
Message-Id: <20191014202135.429009-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

add shutdown call back to close existing session with fTPM TA
to support kexec scenario.

Signed-off-by: Thirupathaiah Annapureddy <thiruan@microsoft.com>
Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
---
 drivers/char/tpm/tpm_ftpm_tee.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/char/tpm/tpm_ftpm_tee.c b/drivers/char/tpm/tpm_ftpm_tee.c
index 6640a14dbe48..ad16ea555e97 100644
--- a/drivers/char/tpm/tpm_ftpm_tee.c
+++ b/drivers/char/tpm/tpm_ftpm_tee.c
@@ -328,6 +328,19 @@ static int ftpm_tee_remove(struct platform_device *pdev)
 	return 0;
 }
 
+/**
+ * ftpm_tee_shutdown - shutdown the TPM device
+ * @pdev: the platform_device description.
+ */
+static void ftpm_tee_shutdown(struct platform_device *pdev)
+{
+	struct ftpm_tee_private *pvt_data = dev_get_drvdata(&pdev->dev);
+
+	tee_shm_free(pvt_data->shm);
+	tee_client_close_session(pvt_data->ctx, pvt_data->session);
+	tee_client_close_context(pvt_data->ctx);
+}
+
 static const struct of_device_id of_ftpm_tee_ids[] = {
 	{ .compatible = "microsoft,ftpm" },
 	{ }
@@ -341,6 +354,7 @@ static struct platform_driver ftpm_tee_driver = {
 	},
 	.probe = ftpm_tee_probe,
 	.remove = ftpm_tee_remove,
+	.shutdown = ftpm_tee_shutdown,
 };
 
 module_platform_driver(ftpm_tee_driver);
-- 
2.23.0

