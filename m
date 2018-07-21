Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 55BB27D072
	for <lwn-linux-doc@archive.lwn.net>; Sat, 21 Jul 2018 11:59:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727518AbeGUMwD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 21 Jul 2018 08:52:03 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40150 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727755AbeGUMwD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 21 Jul 2018 08:52:03 -0400
Received: by mail-lf1-f65.google.com with SMTP id y200-v6so3474327lfd.7
        for <linux-doc@vger.kernel.org>; Sat, 21 Jul 2018 04:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7xFHfTlcMNT5Yw+vTSDeNN9RPAjbKc7TWlhRbw8hE4s=;
        b=hHi6CIIYgNQamZJchmy56Nh4dkiEk9kxkzCSquwpGi4TIBtzUYfTISLdmGDCzlVoQn
         ZmhNu+tQnJWrSTa6qgUwGmtP/oB7jsqWtelusJCQQ9soJr+nFY5fOuB8kscIK9szCOHp
         d5ezRAfeRKSMq8wEXLO3crpSZ1I4m3R9XEkNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7xFHfTlcMNT5Yw+vTSDeNN9RPAjbKc7TWlhRbw8hE4s=;
        b=k0EuIfenwOJktclIGi+J3dpxOU0uTu7Bo3IytGkIN/l5fTTCAmA4oEzbDDGSZg5qup
         wHBN4F8biGS0IfAX641Fe2LqjNDOqr14/zjbIbJprXs7+0dji1/5Ut4QyS9kIdnj5W9c
         CRW5C6cwompU6iQ01vtRAYbIX8JF3chcu22ZIEEOkdtk+rEHRFU+FNfqAnp7uY9bIrEp
         TWILqLVQDrR8jg2oYWyGxG13kfvqNMBw1fatwZoVNE+eEBrGurwx9xzxexh40ydQXmmV
         jtFnR4ltTlkT59Lzff8F3J2rVX/leP+ZIs2jnMd80yemFebyNsKtiPBGO0FnsRMghsfR
         XG+w==
X-Gm-Message-State: AOUpUlGZryoN5HsPxixaucxjfET0IYiq9maMCLe6Ku8ABI1xPGqfyRJo
        ClZWW1P93DO+WhemVxUhI7cupA==
X-Google-Smtp-Source: AAOMgpdoswSoGhqVpoxEkC4z7MJS8tyfT7OjiySXiif99rY6SH3r5/mVKpur/5dwPvAzgyySRmTZ5A==
X-Received: by 2002:a19:1863:: with SMTP id o96-v6mr3582504lfi.134.1532174372682;
        Sat, 21 Jul 2018 04:59:32 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id 73-v6sm664260lfs.44.2018.07.21.04.59.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Jul 2018 04:59:31 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     davem@davemloft.net, grygorii.strashko@ti.com
Cc:     corbet@lwn.net, akpm@linux-foundation.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, vinicius.gomes@intel.com,
        henrik@austad.us, jesus.sanchez-palencia@intel.com,
        ilias.apalodimas@linaro.org, p-varis@ti.com, spatton@ti.com,
        francois.ozog@linaro.org, yogeshs@ti.com, nsekhar@ti.com,
        andrew@lunn.ch, Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v4 net-next 0/6] net: ethernet: ti: cpsw: add MQPRIO and CBS Qdisc offload
Date:   Sat, 21 Jul 2018 14:59:17 +0300
Message-Id: <20180721115923.1389-1-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
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

v4..v3:
 - nothing, just rebase

v3..v2:
 - corrected typo of "shaper" word, any functional changes

v2..v1:
 - changed name cpsw.txt on ti-cpsw.txt
 - changed name cpsw_set_tc() on cpsw_set_mqprio()

Ivan Khoronzhuk (6):
  net: ethernet: ti: cpsw: use cpdma channels in backward order for txq
  net: ethernet: ti: cpdma: fit rated channels in backward order
  net: ethernet: ti: cpsw: add MQPRIO Qdisc offload
  net: ethernet: ti: cpsw: add CBS Qdisc offload
  net: ethernet: ti: cpsw: restore shaper configuration while down/up
  Documentation: networking: cpsw: add MQPRIO & CBS offload examples

 Documentation/networking/ti-cpsw.txt    | 540 ++++++++++++++++++++++++
 drivers/net/ethernet/ti/cpsw.c          | 364 +++++++++++++++-
 drivers/net/ethernet/ti/davinci_cpdma.c |  31 +-
 3 files changed, 913 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/networking/ti-cpsw.txt

-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
