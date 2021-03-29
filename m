Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC666C433ED
	for <linux-doc@archiver.kernel.org>; Mon, 29 Mar 2021 05:17:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B094761974
	for <linux-doc@archiver.kernel.org>; Mon, 29 Mar 2021 05:17:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbhC2FQL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Mar 2021 01:16:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbhC2FP7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Mar 2021 01:15:59 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D65C061574;
        Sun, 28 Mar 2021 22:15:59 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id o19so5938748qvu.0;
        Sun, 28 Mar 2021 22:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aApRacuTNhES68Gu+jVHlEPEkNYmK8etRd5uQwgAclI=;
        b=a3badIk4SJqtoW2nBNlQccZaxbHSRe2wNYE4xu4TRP4vBdggSbANbx9rKOPZ9cYy0H
         olgyoZ6K6bqyJXzq2udtIi1lgJtD2A48nQip+WsW5sRmV/B6EKipscI0C9E5wEhFIpbL
         HfiNFwb4GgFztfVWOYB+c8EEnnevdQOlAlVDqZyA2NmClCl7mjFvziv5jof36jPa1DfW
         m8eiDM1zZfsSG7nBEUz91hpJmBIYMN1DHQZ1jdHeLl34GGnMgSMUKGyH3Eh+ZbOrEHSH
         bD9V+UpPzDn5zeVKgPJLCPvPTUhw8FfNYZL8L9fdc0Qo8/qKZSROea3O2CDbOc6rrt81
         7qrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aApRacuTNhES68Gu+jVHlEPEkNYmK8etRd5uQwgAclI=;
        b=KU5hMQxuOgLm7KsOLXaZ+YTeMh/n0ojBd9mXaqiZ6fzSiyxEthviBosqfj/DVoVunS
         SZbo89D7WRfUPyjwnRfKYT2gFBRepOvD6JotljARslF2jc8lYVPlyWGb4n3wW+rHrqVu
         qsxeZOJt7lgs2uuUQPHvabJji0iOVaCqFtNJaq5c96hy3cWAya8f2Y0/0XGQ/Y6TDnoc
         qr7Dtpw8TWCPW1+brPhPm+rc8g7eTryWHOUVnL5LyZwutkpSfFDxrjOjsJFamHFS6BQZ
         tBeF8PmLK4lGrZbMJpBTYdc6vnl9UMr1prPIbj8VAZF3S/z59kZ4RDrUJAYM9SeXjMR1
         hENg==
X-Gm-Message-State: AOAM530ONxG/8FSW6YwVxWghGRhjcRPvnwDt173xMWF5B41xcbiKW87L
        ZuyKo1x5XCP6uRaJdZbuy3mJG2k0XCRG1A==
X-Google-Smtp-Source: ABdhPJz3gGBeKRD/jMjHDQiD+HMLid6oAVdAhipToy+LvNl2n6b6NJCAn5c0iMvT6jBjvqqwly6JJw==
X-Received: by 2002:a05:6214:10c7:: with SMTP id r7mr23772633qvs.3.1616994958487;
        Sun, 28 Mar 2021 22:15:58 -0700 (PDT)
Received: from localhost.localdomain ([156.146.37.195])
        by smtp.gmail.com with ESMTPSA id z124sm12993181qke.36.2021.03.28.22.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 22:15:57 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     corbet@lwn.net, linux-doc@vger.kernel.org
Cc:     Bhaskar Chowdhury <unixbhaskar@gmail.com>, rdunlap@infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/23] virt: kvm: halt-polling.rst: Fixed a typo
Date:   Mon, 29 Mar 2021 10:42:46 +0530
Message-Id: <198ca51061b07425ed8c85620587fdede55b77f7.1616992679.git.unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <cover.1616992679.git.unixbhaskar@gmail.com>
References: <cover.1616992679.git.unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

s/dependant/dependent/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Documentation/virt/kvm/halt-polling.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/halt-polling.rst b/Documentation/virt/kvm/halt-polling.rst
index 4922e4a15f18..c428d319de45 100644
--- a/Documentation/virt/kvm/halt-polling.rst
+++ b/Documentation/virt/kvm/halt-polling.rst
@@ -14,7 +14,7 @@ before giving up the cpu to the scheduler in order to let something else run.
 Polling provides a latency advantage in cases where the guest can be run again
 very quickly by at least saving us a trip through the scheduler, normally on
 the order of a few micro-seconds, although performance benefits are workload
-dependant. In the event that no wakeup source arrives during the polling
+dependent. In the event that no wakeup source arrives during the polling
 interval or some other task on the runqueue is runnable the scheduler is
 invoked. Thus halt polling is especially useful on workloads with very short
 wakeup periods where the time spent halt polling is minimised and the time
--
2.26.3

