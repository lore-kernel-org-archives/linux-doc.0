Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B55C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 30 Sep 2022 06:47:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbiI3GrG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Sep 2022 02:47:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbiI3Gqr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Sep 2022 02:46:47 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA67C12B482
        for <linux-doc@vger.kernel.org>; Thu, 29 Sep 2022 23:46:34 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id v28so5338600wrd.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Sep 2022 23:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=BVxxhd0P3RO16wUEKaZ1OfbdLJOAUfOB+25uPzyjrzI=;
        b=KPtRqPdU5T/1c0HU/e1m2zYtZ8Qzh3hTb1QitBm1jjoEGxOYxqsM1NymoNb3toxMeT
         kA3ybjD0mFabuvqXYsSpmpkTfeStWmfZGLZAy4H2gsHYOO09/IrYwB5K2i9LyiMc0UJB
         twP+SsyVD/nVmgP/UCq8aUXttSvmFkMEW9SaZVb3Zg14GRad6C2NfNSg3ZxHuH85egM4
         NLS++jXWIO5OCiX811AcQwsx13TEbrUejxPrtyRbrr5V+r/Nr3qzd4cKX3HWGoRf8lM0
         8bRSnIH7W1tsaYxrWfvim5zvOpLUHMVu1/KknpI2r1Bvu+iM47hvPSv3wH3pHbAtW/Q6
         ysuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=BVxxhd0P3RO16wUEKaZ1OfbdLJOAUfOB+25uPzyjrzI=;
        b=JIWyed7PgJibXAL+Zp1okNv9WbWHkzcrXJr/rj7xMYUx//HE/O4V26rZRlsdoMnxj5
         xdZFV8MBnOKqkN3a2YYL9/2g6qy6y+IGusOz3UCM5vdVw/TbXxPeyERFcraQTu+n+jvX
         W/oGIwSDMw9VakoSpeo9uo/eTrNAkADWkoadzcdTvI3FfwFWV0XGoCaOKIrMrOeOl8LT
         RqEmcDpMggxihTle1SSWlvctZj1OAPDNoUAVgDbk49myiPdbAKal6VZCU7t0Id4a1akH
         0L4Md0D6+Gheu7n0GvBod7W8Qy3/y3crubwLBaHVX5yVGQ9HQM8UGUJtr24d1RyJclZU
         bn5w==
X-Gm-Message-State: ACrzQf1GIx0JA8K3ho6bTaAwCQdgUbsT6MFlIESrTeqOdHB7QMqEBEaC
        804KFBhyGkUWlaqMpV6UQ/Ldyg==
X-Google-Smtp-Source: AMsMyM4poS47diqYbEC2wc5A5DvZ59N2ns1+skYy5zmARGz6rFqKcQHJE6j4dnnhnDFMB6Jw2WuvOQ==
X-Received: by 2002:a05:6000:1acf:b0:22b:ed0:71b1 with SMTP id i15-20020a0560001acf00b0022b0ed071b1mr4956672wry.51.1664520393119;
        Thu, 29 Sep 2022 23:46:33 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p8-20020a05600c05c800b003b332a7b898sm1154818wmd.45.2022.09.29.23.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 23:46:32 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     corbet@lwn.net, linux@leemhuis.info,
        konstantin@linuxfoundation.org, krzysztof.kozlowski@linaro.org,
        tytso@mit.edu, linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v3 0/1] Expand get_maintainer to be explicit about supporters
Date:   Fri, 30 Sep 2022 07:46:28 +0100
Message-Id: <20220930064629.329514-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

V3:

- Drops change to get_maintainer.pl - Theodore
- Rewords around `get_maintainer --nogit-fallback` and gives an example

I think the document text now is clearer and should be more helpful to
others in getting their minimum submission list right every time.

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

Bryan O'Donoghue (1):
  Documentation/process: Add text to indicate supporters should be
    mailed

 Documentation/process/submitting-patches.rst | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

-- 
2.37.3

