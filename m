Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6E1197D57F
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Sep 2018 00:02:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbeIEEaC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Sep 2018 00:30:02 -0400
Received: from mail-io0-f194.google.com ([209.85.223.194]:38276 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725853AbeIEEaB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Sep 2018 00:30:01 -0400
Received: by mail-io0-f194.google.com with SMTP id y3-v6so4536640ioc.5;
        Tue, 04 Sep 2018 17:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=zyefvwdEbMIQUnhQcxtgbF1sOgZhHAUsGOrIqQcuDR4=;
        b=l7DVlNK0FTIqcIkq3CaZMES9AB9nsay0CjMsaVi09RPOTj47Dw4R8ih1mhvtGdHA2V
         KvhCLlhenIlT55JPVoHtPCPJSSc7eQEOA9zJcXxrGjLnROR/s+QRbOwDVKCxv46/04zb
         n5x2WRqkECxTyw5qL9aGBizxZrR/17OFrS6OlPVxjilch2qmddg4ezGa0hZXrjDTp9Gi
         x767DULL6qzX73gkOHO94WNehCAjeLZnQ3kBRhmpykikqnhjzoSzwnNTYbZGViWfverI
         0/Rek54OdSDWnNv+DWS7pdt2KpTFmAXnLWsrK8VW/tWfNXyk5H6feQxbDLa2TjM5yPe0
         amWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=zyefvwdEbMIQUnhQcxtgbF1sOgZhHAUsGOrIqQcuDR4=;
        b=nnNvq+tt+F9EnOklCDoQzdvmBTuPHiKUpSonhlhOTnYK7A0iOoWxD3tC2lp6MhAMaL
         Y7k/N/47NVPh7M89G3TvBarTOiMrcMg4x8R6LE5eXpEnGISWyBQ5rsd1ZVgDQWB80lxk
         MPIUEIjPZlSe63rAxZ5TQpkjUNgsuquVufJXh+bM4J5hhGag4KPyl9f38dgLYA+9DD4B
         OMTBQFSypABRDpuIalVsKfYvIbhfdO2HiHaguPUke7/GdYZ1yBVkzUtY/bqEA0fNWd7j
         HSp7ze2VnK3Fsvt7+NmeRY1BsEctC10ECyxNh9gELU01s5zliGdMwJDpFUWY0zq2KhPL
         sYvw==
X-Gm-Message-State: APzg51Dbn4uEHLg+9KaEAWNXVqCvVsVAPQI3sf9BNam1fEKSadeiupTR
        NVsbKN6tqenYxp1lULuP8MU=
X-Google-Smtp-Source: ANB0VdaGEW51HN5NAlr3jfph0JpdkiQxX8VwqDRPqbMjF/ZM0DQC4FkbbFqTFQFIvhPKEsgQddGoAQ==
X-Received: by 2002:a6b:d307:: with SMTP id s7-v6mr22331656iob.190.1536105753995;
        Tue, 04 Sep 2018 17:02:33 -0700 (PDT)
Received: from midway.home (static-50-53-52-16.bvtn.or.frontiernet.net. [50.53.52.16])
        by smtp.gmail.com with ESMTPSA id m13-v6sm285687itm.40.2018.09.04.17.02.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 04 Sep 2018 17:02:32 -0700 (PDT)
From:   Randy Dunlap <rd.dunlab@gmail.com>
To:     linux1394-devel@lists.sourceforge.net
Cc:     Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        linux-doc@vger.kernel.org, linux-scsi@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v3 0/5] FireWire: clean up kernel-doc, add Documentation chapter
Date:   Tue,  4 Sep 2018 17:02:20 -0700
Message-Id: <20180905000225.10733-1-rd.dunlab@gmail.com>
X-Mailer: git-send-email 2.13.7
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch series cleans up kernel-doc warnings in several
FireWire source files and then adds a Documentation driver-api
chapter for FireWire.

[PATCH v4 1/5] FireWire: clean up firewire-cdev.h kernel-doc
[PATCH v4 2/5] FireWire: clean up core-iso.c kernel-doc
[PATCH v4 3/5] FireWire: clean up core-transaction.c kernel-doc
[PATCH v4 4/5] FireWire: add a Documentation driver-api chapter
[PATCH v4 5/5] FireWire: add driver-api Introduction section

The only changes in v4 are (a) respin against current -next and
(b) add more Cc:s so that someone will please merge the series.(*)

I think that Jon is the best choice to merge this series, but
someone please do so.  It has already missed 2 merge windows.

(*): Stefan hasn't replied to patches in the linux1394-devel
mailing list recently.  E.g., see:
https://sourceforge.net/p/linux1394/mailman/message/36406886/

 Documentation/driver-api/firewire.rst |   50 +++++++++++++++++++++++-
 Documentation/driver-api/index.rst    |    1 
 drivers/firewire/core-iso.c           |    7 +++
 drivers/firewire/core-transaction.c   |   10 ++++
 include/uapi/linux/firewire-cdev.h    |   22 ++++++----
 5 files changed, 81 insertions(+), 9 deletions(-)
