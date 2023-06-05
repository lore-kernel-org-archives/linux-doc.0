Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D850C77B73
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jun 2023 05:09:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232081AbjFEFJR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Jun 2023 01:09:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbjFEFJQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Jun 2023 01:09:16 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70A71B1
        for <linux-doc@vger.kernel.org>; Sun,  4 Jun 2023 22:09:15 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-652d76be8c2so3479312b3a.3
        for <linux-doc@vger.kernel.org>; Sun, 04 Jun 2023 22:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685941755; x=1688533755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CE05+ZYwK+jxvTU8Tsht4WD3cttPshg/rzrFK6OOD1c=;
        b=RObVvDTId7IjcggKd1VzHIFVEDK7BTG4jz6n+IxUjKgedoAAedwmtwF1balUA2Pszr
         A0TQw5TjojC0dMWog1P8RBhYVAo9vEgLdy6VqKuiw4r5Z/90HR30WSxhrBhL960NEjhd
         60HbffWw2IX1/J+I/M+TZ16yYaTbkizWSORJqviQDoNlx369wsQ1MIYp/P2mFdaNvGcb
         UGosC7/dwpf92FwuyBak1ofCMdTBs0DcP+9jmqwktWGdTVmcB/8qHw6Qo4C2Jpux8O/O
         puLx8TCv5ZmVZi6p0Xlt8sf5YFGixmuG3uw3xJQnVo5YdxEJ+LLILYegewZVFDDFnEog
         ZP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685941755; x=1688533755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CE05+ZYwK+jxvTU8Tsht4WD3cttPshg/rzrFK6OOD1c=;
        b=ilkcI9knr6BTrZkSMC9chomSWtmMEF8jka79alHn8y3smEQpn+MY9sK7lICdaecJ2h
         EvHzxCjE3mWOXfgGJkenvbIqU3wyEswCnSNqJnpCA6e5bzKSy5c8l6htgWBOhkfKmgfj
         e+6tgh3tja6WaYW/C+uXHAWyR4n9UMsRTmMDhg3OBuwoXaT6SM/Ju9jQohGhUGrf+2iS
         hOUHB/PEEvnFKEJ9zF4/n5q++p3gBt+cERUOlS/P6olmJluYojj8YlvJ1nHGKmKlXd1/
         xqU4FcTAeBa433u9klrc9+kPHFb2ClpPuri68kmqnMCTFca1zSTFJWC6FXB7Uhc4mvKr
         2baQ==
X-Gm-Message-State: AC+VfDzmnYujcNjT154Hb1OkgJIyvI0GGF1vdw1W38KRBszO49W2KtdM
        V8uQNsDqUh41YujLhv4Ia2s=
X-Google-Smtp-Source: ACHHUZ5+SMTfjAGKE+4mbXrA8IbU4nehsPlQWkIoyZb5r9krNScNgKNpIle4Wdp9T9DZ17VzeAmHHw==
X-Received: by 2002:a05:6a00:2e11:b0:64b:256:204c with SMTP id fc17-20020a056a002e1100b0064b0256204cmr23937293pfb.20.1685941754571;
        Sun, 04 Jun 2023 22:09:14 -0700 (PDT)
Received: from localhost.localdomain ([76.132.108.20])
        by smtp.gmail.com with ESMTPSA id fe16-20020a056a002f1000b0064d48d98260sm4329175pfb.156.2023.06.04.22.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 22:09:14 -0700 (PDT)
From:   Russell Harmon <eatnumber1@gmail.com>
To:     bagasdotme@gmail.com
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org, Russell Harmon <eatnumber1@gmail.com>
Subject: [PATCH v4 0/4] Improve the dm-integrity documentation.
Date:   Sun,  4 Jun 2023 22:08:49 -0700
Message-Id: <20230605050853.6240-1-eatnumber1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230604190604.4800-1-eatnumber1@gmail.com>
References: <20230604190604.4800-1-eatnumber1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Russell Harmon (4):
  Documentation: dm-integrity: Fix minor grammatical error.
  Documentation: dm-integrity: Document the meaning of "buffer".
  Documentation: dm-integrity: Document default values.
  Documentation: dm-integrity: Document an example of how the tunables
    relate.

 .../device-mapper/dm-integrity.rst            | 43 ++++++++++++-------
 1 file changed, 27 insertions(+), 16 deletions(-)

-- 
2.34.1

