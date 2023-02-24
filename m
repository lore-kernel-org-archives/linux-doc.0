Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90061C61DA3
	for <linux-doc@archiver.kernel.org>; Fri, 24 Feb 2023 07:05:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbjBXHFS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Feb 2023 02:05:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbjBXHFR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Feb 2023 02:05:17 -0500
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B1DF54552
        for <linux-doc@vger.kernel.org>; Thu, 23 Feb 2023 23:05:10 -0800 (PST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-536c02ed619so170200737b3.8
        for <linux-doc@vger.kernel.org>; Thu, 23 Feb 2023 23:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RtOdossUcDgJLVAP/vxVkTtjnzUIhFTFo3MpYs9j7yI=;
        b=Zq63LwSzDsAxgRDXEC5JTzihjGiElNDE42xZhN8svvBKBKKfr06s8yi0JjQwCoVwfJ
         9gNUERYOeVm0NUCWDpRCgyuCEAJ6RJxxezwmWfMkwTZY8bTmKJfEXayzzZXhebdaWg98
         3TqMJuSfcCoEikUPjDM3n1A0jiBuN8olH6kmXszmUeb8sEYrRkuM0IGEVpm9JCFl9g6X
         oKR4QLDdMcCo4RcuuKtJEDpBwswwRXa0nreV8wp5EYKD9/s/ny4JJhUfHCT36gBLlaDa
         P+lbT2bHd8QOjslS71ZO8YwwKlx+NJh97d+W+Br2GqSBfXrBH8efRpgnbcVv82lQXmqU
         h3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RtOdossUcDgJLVAP/vxVkTtjnzUIhFTFo3MpYs9j7yI=;
        b=wblbp/r35eBuiK6bW5RVOBBKFAreOy867uhqDI4Ke0n22f3CQ+vdb1QPeWgeH+zwYl
         i0Gv4wn+8dz2hvhO4dVf7YXLGJfseI82z+MD3naTKHgpgD/DdAf9Y20r5PTN+N68y0tj
         1JW6ywz89Rkh6FklthoWH5EYZSyyJnl/PHl0fj9D/3Ge0Pc5QNS7/WbGpbETSiqAeXcM
         Fk0OHk91Ok2AfUR16Bb0jFKQ+vMETwJ0JrOkT/2UxH4F3+vc+XjgkQ50ItdXVadPoP2g
         +HMHsPJCkiLucf38faj7WU8FhqAc3nKzrxr3MgHmQxKsd59yVAUxZPc1Rr/lETkRXmgP
         3lOA==
X-Gm-Message-State: AO0yUKUzmblT4lp/JWpOl94r/dAZdpxGx1sezkC5KDIPDykYo6O2VMii
        G1VFeRtsOP4jve/ppnV3+OASGKJPyI428o0=
X-Google-Smtp-Source: AK7set/k0aJ6VgmrHK0J/8ltGNUBE24C+s+KAxpitxkmld16TsKJIWYCv+LjoB18fwaytwzy0VcX5gWLvcrduTY=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:8a2e:9303:e359:c4d6])
 (user=saravanak job=sendgmr) by 2002:a81:b722:0:b0:52e:b635:5496 with SMTP id
 v34-20020a81b722000000b0052eb6355496mr3930821ywh.2.1677222309635; Thu, 23 Feb
 2023 23:05:09 -0800 (PST)
Date:   Thu, 23 Feb 2023 23:05:02 -0800
Message-Id: <20230224070506.4157738-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Subject: [PATCH v1 0/2] Give more control of sync_state()
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

Cc: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Doug Anderson <dianders@chromium.org>
Cc: Matthias Kaehlcke <mka@chromium.org>

Saravana Kannan (2):
  driver core: Add fw_devlink.sync_state command line param
  driver core: Make state_synced device attribute writeable

 .../ABI/testing/sysfs-devices-state_synced    |  5 ++
 .../admin-guide/kernel-parameters.txt         | 12 ++++
 drivers/base/base.h                           |  9 +++
 drivers/base/core.c                           | 63 +++++++++++++++++--
 drivers/base/dd.c                             | 24 ++++++-
 5 files changed, 108 insertions(+), 5 deletions(-)

-- 
2.39.2.637.g21b0678d19-goog

