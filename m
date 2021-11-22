Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6872EC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 22 Nov 2021 07:41:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232708AbhKVHom (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Nov 2021 02:44:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238785AbhKVHok (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Nov 2021 02:44:40 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACED1C061574
        for <linux-doc@vger.kernel.org>; Sun, 21 Nov 2021 23:41:34 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id b68so15289326pfg.11
        for <linux-doc@vger.kernel.org>; Sun, 21 Nov 2021 23:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gdz9IAYcUbjKmWB0NmB1ksnQD1BNO57tZb77u9s7nmY=;
        b=cd1g0U7bXXdvA31V8tE5ju3t+Qk7y9jT+dnYNWR4EGyUwoYM/LSSbzfcUmrFkxCbMQ
         5bKnY/l0y7pr6olG3rmwrGvg2M7pSaMnEW9FLHTn0W/p/cb/GuvxeZZRfrruLH/P/zhH
         eIZdzaTfwsc1DK0oxihF3ywDmiUPENMWRD6f6xr0M75nsYY9UK/b8XUZdpzyv5gwb894
         RuRkJM4jarTPp6jNycHrgC0SSBZrrbZyFMpQ2XE76RTUiyr2tAXzjw+pzU3LosSRsvLm
         av9EY86v5V3Twd5KhCZUz7Y7Hf9YeDaK+sjymIKCrEnrcu0nd8MlhwRyGcGHH866eruC
         Jkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gdz9IAYcUbjKmWB0NmB1ksnQD1BNO57tZb77u9s7nmY=;
        b=YF51Hu350rkUHB2saG0A67fXsnQULcaPgFpZj2EZM48kVYqOQOGiLhDgPPZTGWMUcI
         rLZbANQFbD77sneTibonUnOLnVmpaOZh2WpDckRYFSjREjsQxWaJF3pKpZBkBRUPYG/A
         r43gAg6cLWxu9onXaoYYmkfN8p8isoRg4jzJQzlnB6bpthJJZO9rKroMETvxsFB4vO2s
         NSIMAES/aq3m/PMCTSRyu/+nxWPgdGzDj/bOv7b5ZDbFpm7UAdsFW13UZRlCitW+EkCz
         MfiOCzfdDYWfjwSb8kXWHIAtwCsSa59vTIeB7bBNPXwqc6WpsbspzzleI78r3iBcqm4Q
         c7MA==
X-Gm-Message-State: AOAM531IgsYYlrQBC4UbHOB1POOwMZdIYnQumIGixPjloMkosOj/QDWg
        32z38BgNvF9YyuAyvlmXzxI=
X-Google-Smtp-Source: ABdhPJyQugH2TGn3C+6TQLsadR5m+3RRWiZkGFD98Z25FzrJh1T7Pfuc9HGQVhbIPp2gmHfwwgzPIQ==
X-Received: by 2002:a63:ba44:: with SMTP id l4mr32514230pgu.266.1637566894265;
        Sun, 21 Nov 2021 23:41:34 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id x17sm7447712pfa.209.2021.11.21.23.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 23:41:33 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v4 0/2] docs/zh_CN: move and update sparse
Date:   Mon, 22 Nov 2021 15:40:27 +0800
Message-Id: <cover.1637565886.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v4:

* Testing on the next-20211118.

v3:

* Pick Alex's Reviewed-by tag.
* Replace *是* with **是** at the suggestion of Leo Li.
* Fix a build warning.

v2:

At the suggestion of Leo Li:

* typo fix.
* recovert `` `` to “ ”.

v1:

The Chinese sparse documentation is too old, so let's update it to
the latest version and move it to ../zh_CN/dev-tools/.

Yanteng Si (2):
  docs/zh_CN: move sparse into dev-tools
  docs/zh_CN: update sparse translation

 .../translations/zh_CN/dev-tools/index.rst    |  2 +-
 .../{sparse.txt => dev-tools/sparse.rst}      | 67 ++++++++++++-------
 2 files changed, 43 insertions(+), 26 deletions(-)
 rename Documentation/translations/zh_CN/{sparse.txt => dev-tools/sparse.rst} (58%)

-- 
2.27.0

