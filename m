Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 727C37DCEA
	for <lwn-linux-doc@archive.lwn.net>; Thu, 13 Jun 2019 15:35:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726779AbfFMPfC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 13 Jun 2019 11:35:02 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34579 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727971AbfFMKbg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Jun 2019 06:31:36 -0400
Received: by mail-pl1-f195.google.com with SMTP id i2so7957572plt.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2019 03:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zNYSDlioe1/7qDzUymWdeZ+QFAflos+mlnY8eEGg+0o=;
        b=yGqrc+PyiSy4n5qr9NdwCtvk10NU0RuIEZpKtR38SSnXyuNE9KtNc4LOsjqZwwRHrh
         PQjFPkSB3hzxovhRjl67Bjzjq+MyaDq8caifL9XcLBUffnDo6fKiNVZJMaRJqYYrTpLD
         236tIR/c1HHyhBzC+DbYQbzknd6nXkp2yR69CfUSomWNfHZq7zDwLo6CtP6Rcz9jQoyU
         t+UUwCGOlMlfHHdRXEbat32VLMC64YiRRvC+ES6Lwz/POGU5yfdzTRVFTEJkScAUUYU3
         CLOA6wc/os0XTJLHRiURlUUYawm0WGmE6fu8bzeXwSSiF2jgcH82LXA8DmqI9CW5kKWM
         JwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zNYSDlioe1/7qDzUymWdeZ+QFAflos+mlnY8eEGg+0o=;
        b=rrmSua2ojlSusc8cxeDAs9SzrXnLKGG3cCsqwvYRkqarvZs6bVuO/7zgth+/Yt0DyU
         1ihGdTGMYj6mKJPzedBH500PVXv1cvnckqTUunxRB0gZn8ZCWZrZ+WHv2JTKfHKE/Fth
         36ZrOsqlWS2R76DWrXLw8QCkMy0GRXGxotqVZo96ih6YMG/1g2Y+D0rWqt9/0oKqckbF
         02QR08gawj6B2Bhj04y35bTASgcUhJK/ul5RIzC8JpvH9tvTam61r1Tduvv9j/RmdpI0
         kQEvysaviSbV0Ab77InXgBlQo0aqkGeA8Gze4dPyLDgBQVL47aDfKOkgQZnXxEKB7lqi
         iwGQ==
X-Gm-Message-State: APjAAAULZVOCWWzvqo9hPWQ5PJl3mQ3moSmXGXBRZO83BiIt2CpRuk6S
        6h3476HfD3O1ekvTBT93I+rlKw==
X-Google-Smtp-Source: APXvYqy4QNXOS9+usIQOYreRnBfssjCFTNyHTKoO86Zu6g/HvXHvK12eofupFfZNMLkwbIdNB6kb7A==
X-Received: by 2002:a17:902:1e6:: with SMTP id b93mr43575179plb.295.1560421895353;
        Thu, 13 Jun 2019 03:31:35 -0700 (PDT)
Received: from localhost.localdomain ([117.196.234.139])
        by smtp.gmail.com with ESMTPSA id a12sm2265078pgq.0.2019.06.13.03.31.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 13 Jun 2019 03:31:34 -0700 (PDT)
From:   Sumit Garg <sumit.garg@linaro.org>
To:     keyrings@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org
Cc:     jens.wiklander@linaro.org, corbet@lwn.net, dhowells@redhat.com,
        jejb@linux.ibm.com, jarkko.sakkinen@linux.intel.com,
        zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com,
        ard.biesheuvel@linaro.org, daniel.thompson@linaro.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        tee-dev@lists.linaro.org, Sumit Garg <sumit.garg@linaro.org>
Subject: [RFC 1/7] tee: optee: allow kernel pages to register as shm
Date:   Thu, 13 Jun 2019 16:00:27 +0530
Message-Id: <1560421833-27414-2-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560421833-27414-1-git-send-email-sumit.garg@linaro.org>
References: <1560421833-27414-1-git-send-email-sumit.garg@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Kernel pages are marked as normal type memory only so allow kernel pages
to be registered as shared memory with OP-TEE.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 drivers/tee/optee/call.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
index aa94270..bce45b1 100644
--- a/drivers/tee/optee/call.c
+++ b/drivers/tee/optee/call.c
@@ -553,6 +553,13 @@ static int check_mem_type(unsigned long start, size_t num_pages)
 	struct mm_struct *mm = current->mm;
 	int rc;
 
+	/*
+	 * Allow kernel address to register with OP-TEE as kernel
+	 * pages are configured as normal memory only.
+	 */
+	if (virt_addr_valid(start))
+		return 0;
+
 	down_read(&mm->mmap_sem);
 	rc = __check_mem_type(find_vma(mm, start),
 			      start + num_pages * PAGE_SIZE);
-- 
2.7.4

