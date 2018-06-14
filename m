Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2750E7DF86
	for <lwn-linux-doc@archive.lwn.net>; Thu, 14 Jun 2018 07:40:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754674AbeFNHhN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 14 Jun 2018 03:37:13 -0400
Received: from mail-lf0-f67.google.com ([209.85.215.67]:45772 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754607AbeFNHhJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Jun 2018 03:37:09 -0400
Received: by mail-lf0-f67.google.com with SMTP id n3-v6so7812694lfe.12
        for <linux-doc@vger.kernel.org>; Thu, 14 Jun 2018 00:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7kehnpMGy3E3ogmw+u7+0RyfzSfKms7KfjmEy0y3zZU=;
        b=V0utCaxZ+9A5m/beAwl8mN4CZEBGLhjsqKzVdZbBtwJipWRLtnlEzEmQSsm9g/VijI
         cwceVUlOnnB1FTyG0c+EgnrJTwHU0zlsH+GCSiGA6NAJU8AeQQ9h8m/hyaXf32DHPlDj
         TVoSp87f/hmLnv3Ot8tevo9vGNHe8/hgwpzy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7kehnpMGy3E3ogmw+u7+0RyfzSfKms7KfjmEy0y3zZU=;
        b=aPV3bnB5Q/DHLG1r/SBQkbp0AHHWXaKS84MnHRURpXNhUDkrhJe67XP7sfpU2ZAugt
         qSVs6wNRMD/db/bEFm1VZ/R80mZR3dIJ1dhA1ZRaR+3Zz40RvlGHfubt7ckoBwNaECmn
         J76ocr9VRTToyGIGaYpBIy5un7EgdXrx3XUdsu+zWYv5rnI5FudPRD3+FTswGpvvvLmp
         2Z97Sv5siZxPN/dpmtETG22gjLsZYkyUgTDDnD3gU14QeGatGZ2HMQki9PubCeqBANID
         HttFdYS39xmLzkwySyoFl6HWjDCJnOdDfiH4kq7ikLJkBZHBhX4hCKDVfn3zUQ+bFKAa
         rF3Q==
X-Gm-Message-State: APt69E1sRdzqyu5KL8Tn3QB0ZdNI2mnDodiMwncuU4L+SrhebcDGqNI/
        gAXf4kgEXJz3PexHBPi03NTVLQ==
X-Google-Smtp-Source: ADUXVKLNBUUGjRH7gDb1xCTNGqxI3ecLU39X1CkXMSI9VTITFHpQ3Ke4IkqsEJRDO/OiqdS0su2MfA==
X-Received: by 2002:a2e:980f:: with SMTP id a15-v6mr886661ljj.143.1528961828407;
        Thu, 14 Jun 2018 00:37:08 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id a195-v6sm957597lfe.44.2018.06.14.00.37.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jun 2018 00:37:07 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, davem@davemloft.net
Cc:     corbet@lwn.net, akpm@linux-foundation.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, vinicius.gomes@intel.com,
        henrik@austad.us, jesus.sanchez-palencia@intel.com,
        ilias.apalodimas@linaro.org, p-varis@ti.com, spatton@ti.com,
        francois.ozog@linaro.org, yogeshs@ti.com, nsekhar@ti.com,
        andrew@lunn.ch, Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v2 net-next 0/6] net: ethernet: ti: cpsw: add MQPRIO and CBS Qdisc offload
Date:   Thu, 14 Jun 2018 10:36:44 +0300
Message-Id: <20180614073650.29659-1-ivan.khoronzhuk@linaro.org>
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
