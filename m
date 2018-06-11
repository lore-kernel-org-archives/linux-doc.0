Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 797027D048
	for <lwn-linux-doc@archive.lwn.net>; Mon, 11 Jun 2018 13:31:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754113AbeFKNa7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 11 Jun 2018 09:30:59 -0400
Received: from mail-lf0-f65.google.com ([209.85.215.65]:35867 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754035AbeFKNa5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Jun 2018 09:30:57 -0400
Received: by mail-lf0-f65.google.com with SMTP id u4-v6so30586241lff.3
        for <linux-doc@vger.kernel.org>; Mon, 11 Jun 2018 06:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QEII/3fKlM7VRZMuVo9waV9UCHHYm7cpFanxZdTzUfI=;
        b=biqU4aXunnW+Ivubo6AAStih02saSFcm/A0BAVAf0fP66QsB9ZTJqMVG0NLi+ZIQVe
         dv86FxQ+x6T9o2MyTSXZxglWMHKfoXQBSugY5v5baYKJLRhIt67PHWiNluhy9tYwPE7B
         yUppEjuoho4rn5HFtaBC7eMUSjwYyuHWykTYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QEII/3fKlM7VRZMuVo9waV9UCHHYm7cpFanxZdTzUfI=;
        b=baTDMnugpuwA6Cdcsb7ht40ywkA17UYKQF4/aIoJ68OCZj1PNKu1HbCPEBsdaxzyT0
         HTGo/lhgojDG2nHqDeBaRNzSO8rk1kYqjr6tMkMhb28OVkX1LhbjqIKS/W805YzSpNxE
         3QyuHZhjibEJvU4Spk0pUsNa2iLD9b3e1sZPrpaXRzWIfNLmtQG6nmQH5MvxpamEm1Ub
         fHAEemqfyfFBLmnIGQ9rCMeE0Z66I/+Ppm/NMWovaWqMp7RVDUmxTeKrQcBK0tsnRr7z
         RxgZF1sMcuGj2ZhBhRYauupDfaTCoTvS1welN3Su75Bk3m2JgEIVjlhbeFpxu8LHY8kG
         7QdQ==
X-Gm-Message-State: APt69E2u4Htqx3gbLx4OrCFcJM+PAjFMKlqGHRWtA5pUMUiIcow8a0pi
        tZrnnV/mXQ3GSJdf91nWJIV8GQ==
X-Google-Smtp-Source: ADUXVKK7H1EI56c31XznnWBdzNJcFlb8kJAdzXLyBQbTdxAY3CgeYcV8/pduVfJZLrDYNS/pN2Z1nQ==
X-Received: by 2002:a2e:6f02:: with SMTP id k2-v6mr11739267ljc.72.1528723856439;
        Mon, 11 Jun 2018 06:30:56 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id u24-v6sm2617712ljj.96.2018.06.11.06.30.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jun 2018 06:30:55 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, davem@davemloft.net
Cc:     corbet@lwn.net, akpm@linux-foundation.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, vinicius.gomes@intel.com,
        henrik@austad.us, jesus.sanchez-palencia@intel.com,
        ilias.apalodimas@linaro.org, p-varis@ti.com, spatton@ti.com,
        francois.ozog@linaro.org, yogeshs@ti.com, nsekhar@ti.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH net-next 0/6] net: ethernet: ti: cpsw: add MQPRIO and CBS Qdisc offload
Date:   Mon, 11 Jun 2018 16:30:41 +0300
Message-Id: <20180611133047.4818-1-ivan.khoronzhuk@linaro.org>
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
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
