Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6F7307D072
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Jul 2018 21:26:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388176AbeGWW3z (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Jul 2018 18:29:55 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38849 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388166AbeGWW3z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Jul 2018 18:29:55 -0400
Received: by mail-lf1-f65.google.com with SMTP id a4-v6so1505119lff.5
        for <linux-doc@vger.kernel.org>; Mon, 23 Jul 2018 14:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l4LZ2U7rCEEjVXipIBEDgn965M2WR4pXhOWhJdcMIeo=;
        b=GBNeYlVENYZiHWnt4aY8IzsOzLR9HSRvoBzEiwGOHgpolGg/NnrzK7A5dI/wtj37ap
         +yjgzdWg6qH56SXMG2ypTRmMf3JPYGdnzQo+akCZ4kmKlmoxnGWhq1yIVrdZ+9AGUQ8G
         R2/Xp4K6X6cOdrfJSLvI847laDmYLVqhyzyHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l4LZ2U7rCEEjVXipIBEDgn965M2WR4pXhOWhJdcMIeo=;
        b=ZZvXhgRgnorCzRWMN0RiJyJMp5aV99VhzeaVvw8X3FVRzZzm9bWDUH+rVY/ABQUEQz
         JIuivJjEGAeJ+TefPoe85WKialzte/Bjuea0NnNg7CYicDc93rs+6IL1lw91IkuNGWtj
         qp6HXKIu3YRqPbokig2KnbivYD4b9+kYu6FqwYrttld1YjJyyQSeUHN5n/vFam20/Es7
         zF5nfIR5HKiqBCewMvUzViwUU2J1Ha8kJXHaVJnWKMFjkvJXZ3GInKYMBgyWfm9i5Vxq
         u6/CjFPxnZNHi4nr8478UtE36N3vd+SRcFjg5s7yjg/VjYKWCCUVjus5tobxe2NDoVyD
         1oEQ==
X-Gm-Message-State: AOUpUlEBkeom8ZxhlKkZcdsDMcBePoCH13E4XdD2EohSw7aY4KmzkmYm
        tCss+U7Z61jvaCpq2Er//qwOGQ==
X-Google-Smtp-Source: AAOMgpcMcr/S2BxJ2v50cqVehWahEK0h2w+dQvZ97A28hF+kEl5wDH+bqPnRwdf0RBRly+pqxpO6+w==
X-Received: by 2002:a19:ebd7:: with SMTP id f84-v6mr8071049lfk.18.1532381207840;
        Mon, 23 Jul 2018 14:26:47 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id q4-v6sm1990435ljh.36.2018.07.23.14.26.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Jul 2018 14:26:46 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     davem@davemloft.net, grygorii.strashko@ti.com
Cc:     corbet@lwn.net, akpm@linux-foundation.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, vinicius.gomes@intel.com,
        henrik@austad.us, jesus.sanchez-palencia@intel.com,
        ilias.apalodimas@linaro.org, p-varis@ti.com, spatton@ti.com,
        francois.ozog@linaro.org, yogeshs@ti.com, nsekhar@ti.com,
        andrew@lunn.ch, Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v5 net-next 0/6] net: ethernet: ti: cpsw: add MQPRIO and CBS Qdisc offload
Date:   Tue, 24 Jul 2018 00:26:28 +0300
Message-Id: <20180723212634.3219-1-ivan.khoronzhuk@linaro.org>
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

v5..v4:
- corrected typo of "am57xx" board name, no functional changes

v4..v3:
 - nothing, just rebase

v3..v2:
 - corrected typo of "shaper" word, no functional changes

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
