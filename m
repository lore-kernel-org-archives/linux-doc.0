Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 572A07EA7D
	for <lwn-linux-doc@archive.lwn.net>; Sat, 14 Apr 2018 17:51:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751188AbeDNRv0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 14 Apr 2018 13:51:26 -0400
Received: from mail-pf0-f194.google.com ([209.85.192.194]:46196 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751173AbeDNRvZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 14 Apr 2018 13:51:25 -0400
Received: by mail-pf0-f194.google.com with SMTP id h69so8514024pfe.13;
        Sat, 14 Apr 2018 10:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BLRNtU0kqu4KoBP2ZVkSNQVBUWCvM2fxG0tePARtTxI=;
        b=dWNzGNDPz2620cAC9rdKuZliQxvK84B5l6w/Y9QY9pZ1+qUQnzP6JUPZcAI9zG6F90
         cpDO3V1QBoZcDnkKJyqpKnz4etxU001xOwM2QwrXPti0zyNKqMFKbzhYbzKxl2m3lKY8
         abkTuypOwjE6mNb2MqXBGS4LzfKv+d/Vaed5MRA5ACx84/rHLTEz73Z7Egj5XSluahV+
         vAAx5nfXq+6dAOmIlA/NLdRlsWz0VpugNWtGORj4kS1BWQD9Xw55/lh6E8/TqCVJ7Qak
         cHYUJi+ZJnUW+hehXtRcqHzEineoDKjQXPr8wagGyY9ebUBjih0T6u2QzLaXo8KcFGAD
         YWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BLRNtU0kqu4KoBP2ZVkSNQVBUWCvM2fxG0tePARtTxI=;
        b=afG5FKI1mKEGe+0lzEAt85jMaK3gnCO1LIOx0TBjbXJU7I8lzYDTxqQWUAhq24fFsf
         Z+9aZRca6DhsFAIPWztkm2cWnFJJ84MJJaU4IJFLFujAYWc5rDQ6ggN1FRvGoyDsLLdM
         v1vYxPuO03e5J+7+3ZPD+tgrfBrxW4VkINZc3vT2ek9XNsqCKpS1difoAASHhDX9jOpV
         KFgdbr0VUOp49SNF+BJ9hsQ+HOYT0Scjrk5Y+VP911EQik4uX5i2HEs+Aj4QFLx9pRmM
         OoFmXa4vP2+AmdacvK79Dj4qw37lm0Q+VIwl7aRH762JpnwT7FMUmZZYQdKajKynKQMi
         3wHA==
X-Gm-Message-State: ALQs6tATN/GLIhkGcbUgzRdNjKA6v46GuzbT//gOsn2Q2Tn6sx94dTGx
        cShVW600FaV0Vom7UAhmPRc=
X-Google-Smtp-Source: AIpwx4/8mT4PvFRFRWYV59u/x0YNBzpV2nTRSfsPtt2YRV0Udi537ABXme6avimk/tfnhA2m8F/ciw==
X-Received: by 10.101.74.6 with SMTP id s6mr7782356pgq.79.1523728284589;
        Sat, 14 Apr 2018 10:51:24 -0700 (PDT)
Received: from midway.home (static-50-53-52-16.bvtn.or.frontiernet.net. [50.53.52.16])
        by smtp.gmail.com with ESMTPSA id j3sm17232638pfj.60.2018.04.14.10.51.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 14 Apr 2018 10:51:23 -0700 (PDT)
From:   Randy Dunlap <rd.dunlab@gmail.com>
To:     "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-scsi@vger.kernel.org,
        target-devel@vger.kernel.org, linux-doc@vger.kernel.org,
        "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v3 1/4] target: target_core_transport.c: fix kernel-doc warnings
Date:   Sat, 14 Apr 2018 10:51:03 -0700
Message-Id: <20180414175106.13760-2-rd.dunlab@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180414175106.13760-1-rd.dunlab@gmail.com>
References: <20180414175106.13760-1-rd.dunlab@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Correct a function parameter's name to eliminate kernel-doc warnings
in drivers/target/target_core_transport.c.

Fixes these kernel-doc warnings: (tested by adding these files to a new
target.rst documentation file)

../drivers/target/target_core_transport.c:1671: warning: No description found for parameter 'fabric_tmr_ptr'
../drivers/target/target_core_transport.c:1671: warning: Excess function parameter 'fabric_context' description in 'target_submit_tmr'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: linux-scsi@vger.kernel.org
Cc: target-devel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Jonathan Corbet <corbet@lwn.net>
---
 drivers/target/target_core_transport.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20180413.orig/drivers/target/target_core_transport.c
+++ linux-next-20180413/drivers/target/target_core_transport.c
@@ -1654,7 +1654,7 @@ static bool target_lookup_lun_from_tag(s
  * @se_sess: associated se_sess for endpoint
  * @sense: pointer to SCSI sense buffer
  * @unpacked_lun: unpacked LUN to reference for struct se_lun
- * @fabric_context: fabric context for TMR req
+ * @fabric_tmr_ptr: fabric context for TMR req
  * @tm_type: Type of TM request
  * @gfp: gfp type for caller
  * @tag: referenced task tag for TMR_ABORT_TASK
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
