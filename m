Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D29C7C04A95
	for <linux-doc@archiver.kernel.org>; Thu, 29 Sep 2022 00:25:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233375AbiI2AZK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Sep 2022 20:25:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232959AbiI2AZF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Sep 2022 20:25:05 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6192E25C5D
        for <linux-doc@vger.kernel.org>; Wed, 28 Sep 2022 17:25:04 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id cc5so22146459wrb.6
        for <linux-doc@vger.kernel.org>; Wed, 28 Sep 2022 17:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=m7MHYqMuAHBhH/T9CZiqeaADGWABE7uRJNp3MEzCJqk=;
        b=DZF/PJL37oCnZ3CZ4vXb9CP9jlG9rdA4aNcY22kcEnRm061ChtrCNXZ3zEUv9IEStJ
         A2j7bgQQqzsbskD80Gt2Oplqak+5MiwFbuBTvHpt/F0zVh+cVSi+IbX4Z7C+6z0KC0Z3
         UL6qv/huuKViuSL25AgApOgGKcAVGCcQh3T7NKU0br3mcGEIo9W8rBVxh1d16m7Pqq6Q
         tcHYLhwisXsVN2tK+UVz+FpAWelIRAGZlpok1H8jk256ezO19bObF2Ro319DviKXI/nD
         ffRzSjuFeCGcjCwKX35sIofPtjfzlyAzBkf8qJS1VcrcmjDIsF4UUFh2FlA7XWYNvrb9
         GFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=m7MHYqMuAHBhH/T9CZiqeaADGWABE7uRJNp3MEzCJqk=;
        b=TylCcfhtQn21eVW0xfpsuyVqoN17w+aBXp3PivRVukGcsrHh2OMywTyb5/hqRxWhTa
         NolahLdaEuF7dWdPCmstiuDQK65BVkenFUwVpyx6+TQgYhVgx9D/+/IvS61Yr42LVWZ3
         36iawGyM+VN5OuVphTlhiud467HROLr1vCHAMJcZS3C4B00sHRJPvxdXPqEnHfJh772t
         Cq09us4fXS6WCiD42w4djd6ehCTrJgviWmdB6ne0+zWxObhvVvehqdWPXUCP+grgEaNC
         yq3ZmU1qyPrluaK0EiVpep7l3lx5wHcbDggZrKO6oov4gItmeKnSGCHClm9w0YOyW9Jt
         7sOQ==
X-Gm-Message-State: ACrzQf1GwpgeLd/8ksxai3JLuvxTA+/meY4QEdRD0dVXTGNJBiOT5T8d
        ShyM3Kf3yFvDJ4zpwGR15tknrw==
X-Google-Smtp-Source: AMsMyM7RPlfL86DVl/IYW2OfoOiTVx08staNLB+32gv6hXBOwAphl4NYHVe4Kto1lniUqS5GljmfvA==
X-Received: by 2002:a05:6000:815:b0:22a:418e:f354 with SMTP id bt21-20020a056000081500b0022a418ef354mr261744wrb.97.1664411103002;
        Wed, 28 Sep 2022 17:25:03 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t187-20020a1c46c4000000b003b4a699ce8esm3033841wma.6.2022.09.28.17.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 17:25:02 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     corbet@lwn.net, linux@leemhuis.info,
        konstantin@linuxfoundation.org, krzysztof.kozlowski@linaro.org,
        linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 0/2] Expand get_maintainer to be explicit about supporters
Date:   Thu, 29 Sep 2022 01:24:58 +0100
Message-Id: <20220929002500.283481-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

V2:

https://lore.kernel.org/lkml/20220928003006.230103-1-bryan.odonoghue@linaro.org/T/#u

- Documentation/process
  Added in text to also make clear subsystem mailing list should be
  included - Krzysztof

- Changed get_maintainer.pl to print maintainer[supporter] or
  maintainer[volunteer] depending on MAINTAINERS file. - Thorsten/Bryan

- Choose supporter and volunteer instead of supported and volunteer
  Supporter and volunteer describe the role of the person whereas supported
  and volunteer would describe an activity and a role which isn't
  consistent. - Thorsten/Bryan

- I didn't change Documentation/process/5.Posting.rst
  This file doesn't mention get_maintainer.pl and I was mostly aiming to
  fixup the process around get_maintainer.pl. - Thorsten

- Myself and Thorsten discussed changing get_maintainer.pl, how it seems
  like a desirable thing to do but also that "it might break scripts for
  people" and it might.

  I don't know if get_maintainer.pl is or should be considered to be a
  stable interface and an explicit software contract but, making it clear a
  supporter is also a maintainer seems like the right thing to do from a
  transmission of information perspective.

  There is still the option of just updating Documentation/process in
  isolation.

V1:
- Sent a standalone change to Documentation/process stating
  get_maintainer.pl email addresses marked "supporter" should be included
  in a patch run.

Bryan O'Donoghue (2):
  get_maintainer: Describe supporters and maintainers as required email
    recipients
  Documentation/process: Add text to indicate supporters should be
    mailed

 Documentation/process/submitting-patches.rst | 8 +++++---
 scripts/get_maintainer.pl                    | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

-- 
2.37.3

