Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3700D7DE78
	for <lwn-linux-doc@archive.lwn.net>; Sat, 14 Apr 2018 01:27:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751050AbeDNB1n (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 13 Apr 2018 21:27:43 -0400
Received: from mail-it0-f66.google.com ([209.85.214.66]:55054 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750867AbeDNB1n (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Apr 2018 21:27:43 -0400
Received: by mail-it0-f66.google.com with SMTP id h143-v6so5331589ita.4
        for <linux-doc@vger.kernel.org>; Fri, 13 Apr 2018 18:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=SQixpETXaa1/vdoPOtAArMnGj81kyWNLshy75SPRbTs=;
        b=fkATYUqiBs4ByYqyD+GYxwLPdhdCGOv4Zh7A7XatL8t29udxZ/8SbuU5r9cMgjnZE6
         YJ/11k1yig9tjKzNBHtm2TPxusiDy2xlc9c9PsfjZTUuceKO3jGtBPxy6OgoNuyMpjUy
         3NkNAVPHOFypEQ9Aeb1PAZ3nTfIUx5/4mAHo6K5rTpL02GQ1D7hQ1kbO7JVaQ2qfpkH4
         QCTGcltukau1ufOMV0lJ+FGTGDhj0n1jOTlSfYN4yF3drT2re6gyQaLCcLHMgKyNncGT
         SNQ5GkWB4SycrsOI13JaxpHJDmk0zOaJzxSV0VgQ6V8xygYhqAyOn3twAOvxDlgFy9qi
         LwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=SQixpETXaa1/vdoPOtAArMnGj81kyWNLshy75SPRbTs=;
        b=foA/oViskEXIc2YCV/kYK82bDPq37JWzdJAyWT8t0BFqz1ixQb1DWqLYFC69WVURcc
         VowuXtB7ALzkVVLVUP2JcEzjS5OpXWKzA4E434SXHnz9Yflg+/wHeX8DSR9YViYQHpfN
         KJAc8Ht0kM8ALtgoCnhLPqlKxUcl9MSwBOBviRJ6N8Ycl3exrrfXhoZQx58ECkiLsJdc
         KJIPn/sATURFmYRKaZlEwitkof8WA1rG3MKUr0KBCC2RwcNk6z2pdmRw+pLPG+zGtiPo
         G0dgCZOWsGrjaEm/p8p9GEpDmpDdySrp40NQrrVPvzKXeKZFNvWUy1vkq6psI2S+fO2L
         j4og==
X-Gm-Message-State: ALQs6tBZVnQL2GqCpZo4lOyaHMhbVnCaDtKy5xIzA4SJ76E8Z7sBjL5I
        u6u8UJigBpYXMbzf5pGQxJM=
X-Google-Smtp-Source: AIpwx4+L70tAMl5wcthAOF4GEm0XYNP1Jy+EB6wfdWEXKMW7nkYgEfFTCiK+0HMOnsNJQzNyLm1Irg==
X-Received: by 2002:a24:bd0c:: with SMTP id x12-v6mr7871714ite.97.1523669262609;
        Fri, 13 Apr 2018 18:27:42 -0700 (PDT)
Received: from midway.home (static-50-53-52-16.bvtn.or.frontiernet.net. [50.53.52.16])
        by smtp.gmail.com with ESMTPSA id g16-v6sm271257ita.0.2018.04.13.18.27.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 13 Apr 2018 18:27:41 -0700 (PDT)
From:   Randy Dunlap <rd.dunlab@gmail.com>
To:     linux1394-devel@lists.sourceforge.net
Cc:     Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 0/5] FireWire: clean up kernel-doc, add Documentation chapter
Date:   Fri, 13 Apr 2018 18:27:17 -0700
Message-Id: <20180414012722.17420-1-rd.dunlab@gmail.com>
X-Mailer: git-send-email 2.13.6
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch series cleans up kernel-doc warnings in several
FireWire source files and then adds a Documentation driver-api
chapter for FireWire.

[PATCH v3 1/5] FireWire: clean up firewire-cdev.h kernel-doc
[PATCH v3 2/5] FireWire: clean up core-iso.c kernel-doc
[PATCH v3 3/5] FireWire: clean up core-transaction.c kernel-doc
[PATCH v3 4/5] FireWire: add a Documentation driver-api chapter
[PATCH v3 5/5] FireWire: add driver-api Introduction section

 Documentation/driver-api/firewire.rst |   50 +++++++++++++++++++++++-
 Documentation/driver-api/index.rst    |    1 
 drivers/firewire/core-iso.c           |    7 +++
 drivers/firewire/core-transaction.c   |   10 ++++
 include/uapi/linux/firewire-cdev.h    |   22 ++++++----
 5 files changed, 81 insertions(+), 9 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
