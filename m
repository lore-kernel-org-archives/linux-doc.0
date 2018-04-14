Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0EABA7E22E
	for <lwn-linux-doc@archive.lwn.net>; Sat, 14 Apr 2018 17:51:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751152AbeDNRvY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 14 Apr 2018 13:51:24 -0400
Received: from mail-pf0-f196.google.com ([209.85.192.196]:40237 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751138AbeDNRvX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 14 Apr 2018 13:51:23 -0400
Received: by mail-pf0-f196.google.com with SMTP id y66so8519169pfi.7;
        Sat, 14 Apr 2018 10:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=4qvx2fWydNwul5wWG+2qLaxXCiNfOnfwIK0xnxv/oy8=;
        b=BY/2vtxRX2wxhxgoy7HoiPGgUExUWE4dhVBweAPK+MG9sDXTfmmTBYgFmcpeaX21b4
         xKP4uXIbmPl5vDV0SG8zkBb6FsGfXP3ddHW4eHeHSKkpIVHqBrobKRR7KsfercLPpFMc
         Kqyg/2eMLvug/g0pI/XAN9i/120BNnKuJfPU+kNy/O/pzcCcPh85s15ore4bXd412rZN
         9ief4FyLHAWNFoec/vIYaSCGRaFl35/lx/GUS69Z8cD7rUuORyVR3rjUH0iHamJJx4LM
         v/3SgDvUYKOO62HI3Kv2uDLzYu0ffvw/4CCE6TDy7T39Odoepssc5Bt3boOq1QXT58Eo
         dvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4qvx2fWydNwul5wWG+2qLaxXCiNfOnfwIK0xnxv/oy8=;
        b=CkahMzt5sEFMebfybhg5gTYmyyipvR57yfwRWbBYKX1QtdWMJIhkYFEi9nB8OaJejO
         pOZp8kYKzJQcM/7/5awWI/B3UfZLyk2b2qe/SBHc664ctrKSIeEKs3KYkCWDYkAxCbvB
         TQk/DJg7aBAQONAfU21oZvFKxK7nu7srFeqXe1Jy5IcMZ7+EQ9XjQlpIUcI+6vmCudFl
         rfORN4s1UjTdurvjvHUYS+0PAA8qSqBm6tQWB/7SDkKKJxaCV+maW9mZvxNcs36C9XUA
         BMDA1NxCEfDVZ9/jD04OfZ3b+HpGCCCQiALNSWTtd5ReikQyd9uUyZqTA+hXqeYSnf7Z
         kArg==
X-Gm-Message-State: ALQs6tCM13Aq1cKVN5iP6PmaPZmTgEPgxz/KzoKONioVOF8Y6WRTC59Y
        qtg2jYnLeZhkqb59Bwsh60M=
X-Google-Smtp-Source: AIpwx4+zWU6xApR0DGlwInxhVpFuqGHGf5UyhMNDYJXHJgAz3LR0DG5W0Ay3XYVIbFL1TbJUahowZw==
X-Received: by 10.101.96.13 with SMTP id m13mr7789325pgu.452.1523728283020;
        Sat, 14 Apr 2018 10:51:23 -0700 (PDT)
Received: from midway.home (static-50-53-52-16.bvtn.or.frontiernet.net. [50.53.52.16])
        by smtp.gmail.com with ESMTPSA id j3sm17232638pfj.60.2018.04.14.10.51.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 14 Apr 2018 10:51:21 -0700 (PDT)
From:   Randy Dunlap <rd.dunlab@gmail.com>
To:     "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-scsi@vger.kernel.org,
        target-devel@vger.kernel.org, linux-doc@vger.kernel.org,
        "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: target: clean up kernel-doc and add driver-api document
Date:   Sat, 14 Apr 2018 10:51:02 -0700
Message-Id: <20180414175106.13760-1-rd.dunlab@gmail.com>
X-Mailer: git-send-email 2.13.6
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

This patch series fixes kernel-doc warnings in drivers/target/ and
its header files, then adds a Documentation driver-api chapter for
target driver interfaces.


[PATCH v3 1/4] target: target_core_transport.c: fix kernel-doc warnings
[PATCH v3 2/4] target: target_core_transport.c: enable+fix kernel-doc
[PATCH v3 3/4] target: target_core_user.[ch]: convert comments into DOC:
[PATCH v3 4/4] target: add driver-api document


 Documentation/driver-api/index.rst     |    1 
 Documentation/driver-api/scsi.rst      |    2 
 Documentation/driver-api/target.rst    |   64 +++++++++++++++++++++++
 drivers/target/target_core_transport.c |   19 +++---
 drivers/target/target_core_user.c      |    8 ++
 include/uapi/linux/target_core_user.h  |   11 ++-
 6 files changed, 89 insertions(+), 16 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
