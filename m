Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3680D7D082
	for <lwn-linux-doc@archive.lwn.net>; Wed, 24 Oct 2018 03:07:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbeJXLdm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 24 Oct 2018 07:33:42 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41887 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbeJXLdm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Oct 2018 07:33:42 -0400
Received: by mail-pf1-f195.google.com with SMTP id a19-v6so1678854pfo.8
        for <linux-doc@vger.kernel.org>; Tue, 23 Oct 2018 20:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HoUgDeYGHgBozPF8BvR8CllNS3AMMSk3lQsJUo6v4lQ=;
        b=GWXU0gFJkxJKX37VY0PH8faOcJgPAk2h2QOJhmZvHjkvV33ad3FvB/6nc45ofMG8Mp
         SE49qCNaKFsYCM/r7GbTA5qB6CfBoDup0AImuNY2v1E82Xpq7N4+6p/ofA4vDlfdn/Vs
         aMySpjcm9euNg5ToOvba7Td9QO9M2lb+v+wXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HoUgDeYGHgBozPF8BvR8CllNS3AMMSk3lQsJUo6v4lQ=;
        b=DnMN6We7cXeGIEVyXrXB445ZANzPc57W/Re93AreFQDYsXGqLXumFt3W4N9wSYcgcu
         6JviFJJjnyEApkUAUERhTjFGQapGa/N/3vmlIO70S2fOE8dxy88KHw9VDKeKVaBfnjXK
         Nayndmqpbv5nzaWtyTHEbhN85612RJ1wDv5Is3nOcmSYBs7aFeHZJmyD44nPV/KhSHVK
         qQzwgV/kMrAaY6+ZPcU7x6oPPoEkK/RQffFE33x54/2vkkwCi9E+C0vdZLWx3HdHFcti
         pnKKtDsbiyN/HXG3xXzazjQ33sT1juviiHdDin/hPULSbzsYCKYidlulkjer1FuNJjBb
         dH2Q==
X-Gm-Message-State: AGRZ1gKiAju5oxYdtOyTHG0WfzJWLdH9xfCVZdq4B3g9CJpnqiJ1a/hv
        Y9QcLWWXGhjIdVnx0kDqV2WE8qWexAA=
X-Google-Smtp-Source: AJdET5ezXFxvRDBDYDo41GXToJDTkUsqNwxqKxsspVnyYcmp5mbR44Btd+lDInTNkrKhw21HO5BGpg==
X-Received: by 2002:a63:64c:: with SMTP id 73mr596598pgg.373.1540344700541;
        Tue, 23 Oct 2018 18:31:40 -0700 (PDT)
Received: from exogeni.mtv.corp.google.com ([2620:15c:202:1:5e2b:39df:72ed:4968])
        by smtp.gmail.com with ESMTPSA id p4-v6sm3882341pfg.188.2018.10.23.18.31.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Oct 2018 18:31:39 -0700 (PDT)
From:   Derek Basehore <dbasehore@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-doc@vger.kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com, heiko@sntech.de,
        aisheng.dong@nxp.com, mchehab+samsung@kernel.org, corbet@lwn.net,
        Derek Basehore <dbasehore@chromium.org>
Subject: [PATCH 0/6] Coordinated Clks
Date:   Tue, 23 Oct 2018 18:31:26 -0700
Message-Id: <20181024013132.115907-1-dbasehore@chromium.org>
X-Mailer: git-send-email 2.19.1.568.g152ad8e336-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Here's the first set of patches that I'm working on for the Common
Clk Framework. Part of this patch series adds a new clk op,
pre_rate_req. This is designed to replace the clk notifier approach
that many clk drivers use right now to setup alt parents or temporary
dividers. This should allow for the removal of the
CLK_RECALC_NEW_RATES flag and the implementation of a better locking
scheme for the prepare lock.

Derek Basehore (5):
  clk: fix clk_calc_subtree compute duplications
  clk: change rates via list iteration
  clk: add pre clk changes support
  docs: driver-api: add pre_rate_req to clk documentation
  clk: rockchip: use pre_rate_req for cpuclk

Stephen Boyd (1):
  clk: Remove recursion in clk_core_{prepare,enable}()

 Documentation/driver-api/clk.rst |   7 +-
 drivers/clk/clk.c                | 484 +++++++++++++++++++++++--------
 drivers/clk/rockchip/clk-cpu.c   | 256 ++++++++--------
 include/linux/clk-provider.h     |  10 +
 4 files changed, 509 insertions(+), 248 deletions(-)

-- 
2.19.1.568.g152ad8e336-goog

