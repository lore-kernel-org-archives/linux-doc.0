Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 767657D87C
	for <lwn-linux-doc@archive.lwn.net>; Thu, 23 Aug 2018 18:31:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbeHWWCI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 23 Aug 2018 18:02:08 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37359 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726780AbeHWWCH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Aug 2018 18:02:07 -0400
Received: by mail-pg1-f196.google.com with SMTP id h8-v6so3054518pgs.4
        for <linux-doc@vger.kernel.org>; Thu, 23 Aug 2018 11:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3369VEYSstVH4+PoGpIQpAG6rFkOt9VHBqkwbcndrHw=;
        b=IySI7V8LRhdZPqzlPAlFvIRQkfWeBSt8LB6cjNZxpZKg/aK93x5STVjxml2Is5yurt
         nPQMmaN1p4OXLZZHVoozeBTl4ynnAc+LnRwxVOxUaopqwJEbhh9jOoxq78EU+TXf28KT
         HIgHdoGXqkv4QeymrEICa7mDp2BH19x/wXu60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3369VEYSstVH4+PoGpIQpAG6rFkOt9VHBqkwbcndrHw=;
        b=MY/665zbFSSN8OmOtGSkXmXtbcaajfcc8geKBxcHCqsnlIRkvfjqKrNR6dX28MYyCP
         N78fbbH6PqzxYb77Alu9rivMmP/TKCWRre/ymksFLkX9xccFRfB6HGOx9/ur0+5Y9lDn
         NOVvTw2Gy1WHpgaTBUtfnec5LTUBD++0r40GH0Wk/jgVF+EWqtk5Wpza+zxO2PRLywBV
         kf6TxoXsYAVO6h43HVF7J9l/HQqrPzxEMVqK64GDKFeHP7nnIShcw/EGoCuNu8/t+3s+
         hKSZ9YYRafmTnJ4qCim3iQpHPmDb3KdqziLqt+DYrHZB6F1KioiqALmp0S80Crn97J96
         oOdQ==
X-Gm-Message-State: AOUpUlGiiIYbbtIe5C/dKY0p3gcCVo/2V3M1BNK0IeA/oLAnz5hCH9og
        1S/cI42OFUOBoiOair/pYrVXxg==
X-Google-Smtp-Source: AA+uWPxcS8aoUKhgD53T/OtT+P1qhXjoieaxxr9uW7gRy4av6jgCjubMwnPup30W7iYmwbRSePEt8A==
X-Received: by 2002:a63:7d7:: with SMTP id 206-v6mr25951038pgh.17.1535049070673;
        Thu, 23 Aug 2018 11:31:10 -0700 (PDT)
Received: from kolhar.mtv.corp.google.com ([2620:15c:202:201:356a:9de2:526a:5bc])
        by smtp.gmail.com with ESMTPSA id p11-v6sm9054225pfj.72.2018.08.23.11.31.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Aug 2018 11:31:10 -0700 (PDT)
From:   Harry Cutts <hcutts@chromium.org>
To:     linux-input <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Jiri Kosina <jiri.kosina@suse.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Harry Cutts <hcutts@chromium.org>, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Jiri Kosina <jikos@kernel.org>
Subject: [PATCH 0/3] Add support for high-resolution scrolling on Logitech mice
Date:   Thu, 23 Aug 2018 11:30:54 -0700
Message-Id: <20180823183057.247630-1-hcutts@chromium.org>
X-Mailer: git-send-email 2.18.0.1017.ga543ac7ca45-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi everyone,

This set of patches adds support for high-resolution scroll wheels on
Logitech mice. See the linux-input "Reporting high-resolution scroll
events" thread [0] for previous discussion of the evdev changes. I would
love to hear your feedback.

Thanks,

Harry Cutts
Chrome OS Touch/Input team

[0]: https://www.spinics.net/lists/linux-input/msg57380.html



Harry Cutts (3):
  Add the `REL_WHEEL_HI_RES` event code
  Create a utility class for counting scroll events
  Enable high-resolution scrolling on Logitech mice

 Documentation/input/event-codes.rst    |  11 +-
 drivers/hid/hid-ids.h                  |  15 ++
 drivers/hid/hid-input.c                |  44 ++++
 drivers/hid/hid-logitech-hidpp.c       | 341 +++++++++++++++++++++++--
 drivers/hid/hid-quirks.c               |  11 +
 include/linux/hid.h                    |  28 ++
 include/uapi/linux/input-event-codes.h |   1 +
 7 files changed, 423 insertions(+), 28 deletions(-)

-- 
2.18.0.1017.ga543ac7ca45-goog

