Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9DA487DE74
	for <lwn-linux-doc@archive.lwn.net>; Mon, 16 Apr 2018 19:36:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753425AbeDPTfe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 16 Apr 2018 15:35:34 -0400
Received: from mail-pf0-f195.google.com ([209.85.192.195]:42457 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753206AbeDPTfa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Apr 2018 15:35:30 -0400
Received: by mail-pf0-f195.google.com with SMTP id o16so10999942pfk.9
        for <linux-doc@vger.kernel.org>; Mon, 16 Apr 2018 12:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=y855mi4e0a7SYpAOZLbNUsx0jEwNqRd/AqlHeLyhUtU=;
        b=OYYwyWJO0m98sJqnlKTaLYfV1FqDVy7AXuj2/yvFJWyh/DO3kLdiSy/h8Fmi4Jx5MX
         BmjRKoCROP/WpcFjZUkcPw5ONhY3cPVpGB8kkh9Plo8NTuUzoevlnrQyQSKn1KD4lz/h
         K6OPBtCKTQSrrBXwaNNuwND34hxabeo2j2N2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=y855mi4e0a7SYpAOZLbNUsx0jEwNqRd/AqlHeLyhUtU=;
        b=dt7LMJV9VTNx+Eiqy980Wr5R/oaxPn/r+rZhgJwKhFDOQDQsL2B3XvvTF6m2elkVpK
         qBHRg20eOa82BzcLWnlWRX/WeuU3ZASlhzGHB7PEWbvZbsgd+mc6TjK9uBlQm1JM0Xt9
         lRHeftO2iYN0pGqOYKcYtRwgkUZL5z47gPtbmIR9ogb9xvswte/wsPr+RQQrcgMfwOaG
         mWpDZbJg2fM86RKv0J6su9PeSWSMmTRcEp0SHkznz7F4CkozzlR/sCJXF17Ur5Gr4QD6
         3If8W/v6aUzGHj+AKQ5gyX3dvTLsijOfiCCRI4iNTxgk2U4S5UC1zD9RCdBaEXeVXQVD
         SD3g==
X-Gm-Message-State: ALQs6tBc5EmhVfvuaYVI+Jsg7vjmlVpd9YuGT2EFPk6oS1OE9rlvCxPq
        ZtK0S4Ohc1uYC/auQ7T+0gxwIw==
X-Google-Smtp-Source: AIpwx4//dGO/53xthjL8fYkrMmTY/Q3ukbKgkVVGkNGAAg5FtALaxHil1BPUs7sweYemTlV/hAyyYA==
X-Received: by 10.98.5.196 with SMTP id 187mr6545605pff.151.1523907329494;
        Mon, 16 Apr 2018 12:35:29 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id b78sm7038785pfj.6.2018.04.16.12.35.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 16 Apr 2018 12:35:28 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ben.Gainey@arm.com
Subject: [PATCH 0/3] coresight: Refresh documenation 
Date:   Mon, 16 Apr 2018 13:35:24 -0600
Message-Id: <1523907327-20979-1-git-send-email-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Now that the perf tools CoreSight support is upstream this set adds
documentation to go with it and move things around so that topics 
are located together. 

Mathieu Poirier (3):
  coresight: Remove obsolete reference to "owner" in CoreSight
    descriptor
  coresight: Add section for integration with the perf tools
  coresight: Grouping all perf tools oriented section together

 Documentation/trace/coresight.txt | 101 ++++++++++++++++++++++++++++----------
 1 file changed, 74 insertions(+), 27 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
