Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BB1C433FE
	for <linux-doc@archiver.kernel.org>; Tue, 11 Oct 2022 17:14:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbiJKROY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Oct 2022 13:14:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbiJKROW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Oct 2022 13:14:22 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D898AA368
        for <linux-doc@vger.kernel.org>; Tue, 11 Oct 2022 10:14:20 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id l127so11372471iof.12
        for <linux-doc@vger.kernel.org>; Tue, 11 Oct 2022 10:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pDLbMMyVql0t8YQHrpoFb/mrSX/wy9E8ZPnLS8f6/sg=;
        b=QXHxzennHT0jWhFoHwN6F4UG3DVi7ZCQCmnNa4hVa1YpzqTEJ2H2thcKZZtDII+5Ri
         Ln3OIwIuzi7P85Z7IaTZwJXP6TiBkUHXzZ+er3QEjKMDrkQdf9n/lAbe7xuOVqvm4bZL
         IxZZXf4C3hBQzqz76jjrQR75Ds7/2VEhAhUVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pDLbMMyVql0t8YQHrpoFb/mrSX/wy9E8ZPnLS8f6/sg=;
        b=AvPVosRSDYZC0MC4Mc77Lhj64/I++DyFgBj8NuWh8yvUxqEPe1vMb5GkeBcEU1BGHI
         6Nqyg3iGfPqTyRoYMpBYSzjOP+xp/1QxwdpDuEc0ALg0dDQg6EGOG2+ROpiGKAjXxdc5
         E1KFL4scGm/vJg0w9mOXletB5u8uMCecT0DjMyRW6N//lomlb5Ps576mMbVIBgwCz6ao
         wXPei/ua44J5E9C4yj54uU3DHSYrfp2IGCfjEawiWJUKliHb90VYuK8lc/cp/aYsgLyu
         peT91jYFq6qZaDCXCItyXvo/ZlWbge8bFjqsBsuN7f1ob7Uhp+OLlA/sgEwPQs4ge7IZ
         V89w==
X-Gm-Message-State: ACrzQf0aj+Ad4ib0zqzAI+YhP6QgtH9q4CH8Z65KKGwjW5j7NkQ07J/R
        DA417elTDQS1Iqzt+hYmoIqZHQ==
X-Google-Smtp-Source: AMsMyM4/OpJoLj6r1F+/wC8QgtHX8DjKlVz9AT1JvWxmVE0aHwN3eNgc+aaDUSRj2vDk34JD7p5pdQ==
X-Received: by 2002:a05:6638:4782:b0:363:c5a0:2aec with SMTP id cq2-20020a056638478200b00363c5a02aecmr4483441jab.242.1665508459629;
        Tue, 11 Oct 2022 10:14:19 -0700 (PDT)
Received: from shuah-tx13.internal ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id g18-20020a056e02131200b002eb3b43cd63sm5088215ilr.18.2022.10.11.10.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 10:14:19 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     gregkh@linuxfoundation.org, corbet@lwn.net
Cc:     Shuah Khan <skhan@linuxfoundation.org>, conduct@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        jlee@linuxfoundation.org, stable@vger.kernel.org
Subject: [PATCH] docs: update mediator contact information in CoC doc
Date:   Tue, 11 Oct 2022 11:14:17 -0600
Message-Id: <20221011171417.34286-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update mediator contact information in CoC interpretation document.

Cc: <stable@vger.kernel.org>
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 Documentation/process/code-of-conduct-interpretation.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/code-of-conduct-interpretation.rst b/Documentation/process/code-of-conduct-interpretation.rst
index 4f8a06b00f60..43da2cc2e3b9 100644
--- a/Documentation/process/code-of-conduct-interpretation.rst
+++ b/Documentation/process/code-of-conduct-interpretation.rst
@@ -51,7 +51,7 @@ the Technical Advisory Board (TAB) or other maintainers if you're
 uncertain how to handle situations that come up.  It will not be
 considered a violation report unless you want it to be.  If you are
 uncertain about approaching the TAB or any other maintainers, please
-reach out to our conflict mediator, Joanna Lee <joanna.lee@gesmer.com>.
+reach out to our conflict mediator, Joanna Lee <jlee@linuxfoundation.org>.
 
 In the end, "be kind to each other" is really what the end goal is for
 everybody.  We know everyone is human and we all fail at times, but the
-- 
2.34.1

