Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE502C61DA3
	for <linux-doc@archiver.kernel.org>; Sat,  4 Mar 2023 00:54:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjCDAyV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Mar 2023 19:54:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjCDAyU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Mar 2023 19:54:20 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C221366D08
        for <linux-doc@vger.kernel.org>; Fri,  3 Mar 2023 16:53:58 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id a137-20020a25ca8f000000b0091b90b20cd9so4180955ybg.6
        for <linux-doc@vger.kernel.org>; Fri, 03 Mar 2023 16:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1677891238;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KMOqXh7hVSFhgcl31RbknZfV4w7k6tUCijEEKHPjbLg=;
        b=Mj5pbKfgEFR8HCEqE8P7tGDaE8G5NvqI5ZXhTw+87HZ4mo7NjPk7M5F9gADFKc8oN+
         PvYZlXxKaQGCPsnPkB8jkypjZjdyUzuvhct+dSvvGU8Ybs6hWLz/jX/1guwSP3Fpk4tC
         1fAjWqelMByC2oQ9vLB1jk72Y012anfzn0Ie04CkFnGIyQ7Uy2vFbOPa1RnkQqhXbYj5
         H0S2UKecv58EHgKu6YuyNvUYlpWAEM0TY66iotkUDP3upuzY3XrIl/l6WgGCLgWqXp9V
         G38/kcl9hMlpVmMZLYoiin+L62W0ZB4YGapPqWLPc90TEk7C2WvqQkYDH57LAKDEJE0R
         Fakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677891238;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KMOqXh7hVSFhgcl31RbknZfV4w7k6tUCijEEKHPjbLg=;
        b=yA9r1AsshsNBmhY6qJ33JtMOoL2UqLQuV4lR6JO1KICiyOVr1VDDK9J+6qrPSW4Ufi
         uFy2WJG8jsPxdQkqV59P+p9UCQbtkIfxe3gIgr+c28NbLo9EncSkn5D3bTVb0NIgC6L9
         wIlWV3BIhZmE6rNQVn+frPpilp2+AtTrwZpx5lx6co9jCtXNNv/oKYKLHfUTh2pYId5i
         geJMqWgyIajR7kO0P4AKrU4p9a+QVk2uZw5gUn2QkR+cglH1FW51tInEaWmsmdMKtOwO
         1FFm14GUOMlisfbOh+d62xRbuB+K8JnFASf1awGj5F0NfzUTNcT7d02oV1cORE7qzFu1
         Z9yA==
X-Gm-Message-State: AO0yUKVypaMVMTON5iBIwxY6DA5qvI1BJMUhf0bw9OnWrOKglng/xOxv
        mArDw1kD6yEyfXz0Zmz5yf8wZJ6ZK3eQYjA=
X-Google-Smtp-Source: AK7set+l86zHNxMDRbOJ7XGRMnZDbC3A6l1xQWIVEbI3uGdI2Vwlr1phzi7JaDR3MSHOvvzj0TyWUwmtGTvKAZU=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:ef0c:d8be:ebb3:b639])
 (user=saravanak job=sendgmr) by 2002:a81:ae47:0:b0:533:9ffb:cb13 with SMTP id
 g7-20020a81ae47000000b005339ffbcb13mr2046588ywk.3.1677891238011; Fri, 03 Mar
 2023 16:53:58 -0800 (PST)
Date:   Fri,  3 Mar 2023 16:53:52 -0800
Message-Id: <20230304005355.746421-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
Subject: [PATCH v2 0/2] Give more control of sync_state()
From:   Saravana Kannan <saravanak@google.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Saravana Kannan <saravanak@google.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>, kernel-team@android.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In systems where some devices don't have drivers, sync_state() will
never get called for suppliers of those devices. This is working as
intended since those consumer devices might be powered on, and cutting
resources to those consumer devices might make the system unstable.

However, not all systems will the same concern. For example, the
consumer device might have been left powered off and unused. In such
cases, sync_state() never getting called might cause an unnecessary
power regression if the bootloader had left the supplier in a powered on
state.

So give more control of sync_state() in the form of a kernel commandline
for a global timeout or a per device sysfs control to trigger
sync_state().

These patches have been tested on my end and seem to work well.

Thanks,
Saravana

v1->v2:
Patch 1: Updated commit text, documentation and log message.
Patch 2: Check for "1" in the write, updated doc, fix error handling.

Cc: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Doug Anderson <dianders@chromium.org>
Cc: Matthias Kaehlcke <mka@chromium.org>

Saravana Kannan (2):
  driver core: Add fw_devlink.sync_state command line param
  driver core: Make state_synced device attribute writeable

 .../ABI/testing/sysfs-devices-state_synced    |  5 ++
 .../admin-guide/kernel-parameters.txt         | 14 +++++
 drivers/base/base.h                           |  9 +++
 drivers/base/core.c                           | 63 +++++++++++++++++--
 drivers/base/dd.c                             | 29 ++++++++-
 5 files changed, 115 insertions(+), 5 deletions(-)

-- 
2.40.0.rc0.216.gc4246ad0f0-goog

