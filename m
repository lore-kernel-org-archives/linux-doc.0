Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2378E7D2EE
	for <lwn-linux-doc@archive.lwn.net>; Thu, 30 Aug 2018 21:56:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727629AbeHaCAn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 30 Aug 2018 22:00:43 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42157 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727539AbeHaCAn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Aug 2018 22:00:43 -0400
Received: by mail-pg1-f195.google.com with SMTP id y4-v6so4481260pgp.9
        for <linux-doc@vger.kernel.org>; Thu, 30 Aug 2018 14:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iWcmBCDwUKd4jj1L7AbvOTMWjbSc8v8zlrIjl+DjrBo=;
        b=m+bVJqytTZZvcesHHVIeSiYlNTdxjaRCL4mNVOiGZHwV3ocDEbpbsRfQF647E8Tldu
         FUgS4chkYthhEGlfnW1x5zlQXyIaExHi7D1vsg52oGSYBuRVLydEU0tu83KDGiuI7RoK
         QG37cb+863gh6rVWwiInJ6GeZVopJCA0n4VNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iWcmBCDwUKd4jj1L7AbvOTMWjbSc8v8zlrIjl+DjrBo=;
        b=Q0xK2ovnbKJ0ipVVg/5+nUylqGRFWszWklb6nTQzh2GysO5frZihQbLuHDLqnvNvQT
         1TpgVaHv3An+VXy2llG3/qfCcKkQqVKD63FwYFAPil2jmxmXesdCFMCQBHrrVH1GE252
         gIAJJcraQODnVs6qKZ3AJH8X7T0CezmNuBHjB1lJk5NM8ePDlnSmzsfh0LV2ofNg0037
         aXvNPTOhQcP+AeD/jhjZQL1H4mnigj5i/g3d2vKbrXvCY64IqNyqI7Atta4Oivy9VB53
         5HXnK0tvhL3NaTSW3VmQ3tVCwopykJapXqpfP9juiPXeZZWnd7faiI+eG8Ngy0dgi7n4
         COyQ==
X-Gm-Message-State: APzg51AQ9jFwpjb5JLqK8zz4A6c6sjIomS7xkiV3SfmlApbmo+KDJ540
        gEc9VsREufm6eTFn2pnrRC3kuA==
X-Google-Smtp-Source: ANB0VdbGmWEE2EmQO6KH/JM1ykYqh4PwKfszwwS9XsJ1tip2BaTTdYVoIp1ABW44wsqK6xMjP9BHOA==
X-Received: by 2002:a63:6fcf:: with SMTP id k198-v6mr8290767pgc.360.1535666187696;
        Thu, 30 Aug 2018 14:56:27 -0700 (PDT)
Received: from kolhar.mtv.corp.google.com ([2620:15c:202:201:356a:9de2:526a:5bc])
        by smtp.gmail.com with ESMTPSA id h132-v6sm13516828pfc.100.2018.08.30.14.56.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Aug 2018 14:56:27 -0700 (PDT)
From:   Harry Cutts <hcutts@chromium.org>
To:     linux-input <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Jiri Kosina <jiri.kosina@suse.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Harry Cutts <hcutts@chromium.org>, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Jiri Kosina <jikos@kernel.org>
Subject: [PATCH v2 0/5] Add support for high-resolution scrolling on Logitech mice
Date:   Thu, 30 Aug 2018 14:56:17 -0700
Message-Id: <20180830215622.47550-1-hcutts@chromium.org>
X-Mailer: git-send-email 2.19.0.rc0.228.g281dcd1b4d0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi everyone,

This is v2 of the patch set adding support for high-resolution scroll
wheels on Logitech mice. See the linux-input "Reporting high-resolution
scroll events" thread [0] for previous discussion of the evdev changes.
I would love to hear your feedback.

Thanks,

Harry Cutts
Chrome OS Touch/Input team

[0]: https://www.spinics.net/lists/linux-input/msg57380.html


Changes in v2:
* Changed the REL_WHEEL_HI_RES code to use micrometres (a.k.a. microns)
  as its units, instead of 256ths of a millimetre.
* Removed support for mice connecting over Bluetooth, due to a bug where
  the mouse's high-res mode and the driver's settings get out of sync
  when the mouse is power cycled.
* Moved the creation of the HID++ 1.0 function and the refactor to use
  the LDJ_DEVICE macro into separate patches.
* Added a couple of explanatory comments to the Logitech driver.

Harry Cutts (5):
  Add the `REL_WHEEL_HI_RES` event code
  Create a utility class for counting scroll events
  Add function to enable HID++ 1.0 "scrolling acceleration"
  Enable high-resolution scrolling on Logitech mice
  Use LDJ_DEVICE macro for existing Logitech mice

 Documentation/input/event-codes.rst    |  11 +-
 drivers/hid/hid-input.c                |  45 ++++
 drivers/hid/hid-logitech-hidpp.c       | 311 ++++++++++++++++++++++---
 include/linux/hid.h                    |  28 +++
 include/uapi/linux/input-event-codes.h |   1 +
 5 files changed, 368 insertions(+), 28 deletions(-)

-- 
2.19.0.rc0.228.g281dcd1b4d0-goog

