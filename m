Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 79FED7D043
	for <lwn-linux-doc@archive.lwn.net>; Fri, 18 May 2018 21:15:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751942AbeERVPS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 18 May 2018 17:15:18 -0400
Received: from mail-lf0-f68.google.com ([209.85.215.68]:34605 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750763AbeERVPR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 May 2018 17:15:17 -0400
Received: by mail-lf0-f68.google.com with SMTP id x145-v6so3878926lff.1
        for <linux-doc@vger.kernel.org>; Fri, 18 May 2018 14:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tq/VxJ2MvJvVh8LbIbBH5ypHQ0wgjClNVzat8HYRxJA=;
        b=ZVjyHRpL7pkEcVh9XlSNr9edVArU5jZZ9p6RbuA0FbunCODcXiXqYB+pxtF2dw05yV
         pok+bB8/q5t17eYAudZSkF/IVcYfZqOPn5Qsu0K1dEiEEP7BAO4NpwkEoob91/x6mDOV
         QhmwW4vT1UTgIzKDk0iEC5Cu7A92coj1Ztmtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tq/VxJ2MvJvVh8LbIbBH5ypHQ0wgjClNVzat8HYRxJA=;
        b=qULXu2wj1vGWDAYtWV9u8rGfUyckquq6ykCUA1JIkHsBXfFxKFj8e0cMhJHCp6gOM6
         m9+OUy+A9fsRPxLYyqUTtAcre4U4KDZg2oOHyWmr/A0qyA1Jq49k5ypswRojBTu3vWQo
         UbGW8zz9ZRCBNmLIM3v2v6Ut0ZgAY4PYIi26Vo/rRJ7T1fSdrGBjnk30MBe2asLNdcw8
         BJWgwTYzF9q+SyrTx6YqA013dHCJSDohXc7H4epAX+t6Fhh4vHr3Y7yIf3NBSu6wK5jy
         6AgaQXsYJqNmlILk1RRG/jJu5RaXfzHOtHc2ajwzZ5UMDtbt50jNIbsj57VB82tIYMEp
         duMQ==
X-Gm-Message-State: ALKqPwcGFY6oGIwXmClajeNCQe2mMLuTbkUCBjINIPFAMppklLVzwNE7
        Xc25DliHKLRrVLsGfl0i3TgbPA==
X-Google-Smtp-Source: AB8JxZoB1P2+cQH4rtxe4NF5wcpMcdR4yDUPV3u80Pha/ejf8MZEFLi8t3CzCIL4kzCjJMfJnzC6Mg==
X-Received: by 2002:a2e:8518:: with SMTP id j24-v6mr7069707lji.12.1526678116163;
        Fri, 18 May 2018 14:15:16 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id g20-v6sm2045991lfk.39.2018.05.18.14.15.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 May 2018 14:15:15 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, davem@davemloft.net
Cc:     corbet@lwn.net, akpm@linux-foundation.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, vinicius.gomes@intel.com,
        henrik@austad.us, jesus.sanchez-palencia@intel.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [RFC PATCH 0/6] net: ethernet: ti: cpsw: add MQPRIO and CBS Qdisc offload
Date:   Sat, 19 May 2018 00:15:04 +0300
Message-Id: <20180518211510.13341-1-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series adds MQPRIO and CBS Qdisc offload for TI cpsw driver.
It potentially can be used in audio video bridging (AVB) and time
sensitive networking (TSN).

Patchset was tested on AM572x EVM and BBB boards. Last patch from this
series adds detailed description of configuration with examples. For
consistency reasons, in role of talker and listener, tools from
patchset "TSN: Add qdisc based config interface for CBS" were used and
can be seen here: https://www.spinics.net/lists/netdev/msg460869.html

Based on net-next/master

Ivan Khoronzhuk (6):
  net: ethernet: ti: cpsw: use cpdma channels in backward order for txq
  net: ethernet: ti: cpdma: fit rated channels in backward order
  net: ethernet: ti: cpsw: add MQPRIO Qdisc offload
  net: ethernet: ti: cpsw: add CBS Qdisc offload
  net: ethernet: ti: cpsw: restore shaper configuration while down/up
  Documentation: networking: cpsw: add MQPRIO & CBS offload examples

 Documentation/networking/cpsw.txt       | 540 ++++++++++++++++++++++++
 drivers/net/ethernet/ti/cpsw.c          | 364 +++++++++++++++-
 drivers/net/ethernet/ti/davinci_cpdma.c |  31 +-
 3 files changed, 913 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/networking/cpsw.txt

-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
