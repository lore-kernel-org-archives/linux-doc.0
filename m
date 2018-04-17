Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C57BF7E279
	for <lwn-linux-doc@archive.lwn.net>; Tue, 17 Apr 2018 16:31:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755369AbeDQQIP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 17 Apr 2018 12:08:15 -0400
Received: from mail-pg0-f66.google.com ([74.125.83.66]:35909 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755349AbeDQQIL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Apr 2018 12:08:11 -0400
Received: by mail-pg0-f66.google.com with SMTP id z135so3205541pgz.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Apr 2018 09:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=QJQK4m6doh5tMLfO8mYU0PYMqULkQA/xm3DdGrdnMhI=;
        b=g+IPkKv2lvJJhN+YeI7jyEVX9u1EcEHu8qvLG25C+8Sdk6BcZl7/J34QWzctGcyv3N
         eH+wrGoy+oy855M4Ktg/+F5QUE1OWsavZlBkiYqLWW4q+/ijoZXCOpv1zV2XUG8Wd3I8
         AUvpGCRh88o+8c2OfOox2DRPbEKyV+9shOHx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=QJQK4m6doh5tMLfO8mYU0PYMqULkQA/xm3DdGrdnMhI=;
        b=SLZ7HjUPZO/Ga+fA0oev0kpQEBOLHLGqa0lR8MtTYSqA9ukDPx5sfcD3CmJhnk4e5u
         cCQKyfu6ZVu1vfBg7kkwZzBkehl524nQJwE0BDyoXxsIMnwK5kyc4Sj/ffffhganzt+a
         lPWMwCrPOUCFdBV0JK+eE8vQByWYluCYExt3gTtJIuVoZ3Hi6pgkY2wP1I6v3nr/BZeT
         7XjhsB60CsiL08zMhNppGHShOA+XCse9Z322fCTggIDzg68EO5NVFT/E5g+reQTKtclA
         zcgOg+Pxoh5CHOAsoTLfYNvBs08B4z70N5Xa4eZrqhRMMnWN9CYq6gWt3yq3sgjvNWpS
         CspA==
X-Gm-Message-State: ALQs6tAmKBD9Or3JJE8rG6vXh9Fp86l3aBt4KCqAGVFLXpwDYtz4HQyR
        GPUGxnczoqVZPl67/sPLdMsgsQ==
X-Google-Smtp-Source: AIpwx48NYwAcxxdalovq3SA1QcIXpPkCqW+/QVYjWys//UgxBCAso9FLGNwNbA9nuefdpmC814eMlA==
X-Received: by 10.99.103.6 with SMTP id b6mr2288382pgc.214.1523981289850;
        Tue, 17 Apr 2018 09:08:09 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id r81sm34829878pfj.79.2018.04.17.09.08.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 09:08:09 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        rdunlap@infradead.org, Ben.Gainey@arm.com
Subject: [PATCH v2 0/3] coresight: Refresh documenation 
Date:   Tue, 17 Apr 2018 10:08:04 -0600
Message-Id: <1523981287-15370-1-git-send-email-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Now that the perf tools CoreSight support is upstream this set adds
documentation to go with it and move things around so that topics 
are located together.

--------
Changes for V2:
* Addressed grammatical problems highlighted by Randy

Mathieu Poirier (3):
  coresight: Remove obsolete reference to "owner" in CoreSight
    descriptor
  coresight: Add section for integration with the perf tools
  coresight: Grouping all perf tools oriented section together

 Documentation/trace/coresight.txt | 103 +++++++++++++++++++++++++++-----------
 1 file changed, 75 insertions(+), 28 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
