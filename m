Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F043C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 13 Sep 2021 22:26:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12645610A6
	for <linux-doc@archiver.kernel.org>; Mon, 13 Sep 2021 22:26:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239286AbhIMW17 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Sep 2021 18:27:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32168 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239165AbhIMW16 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Sep 2021 18:27:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631572002;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=X0eYnWNF2y6YPPW1SDm2g1rHLnrujH5b2Tuwd/lt0S4=;
        b=K4G9a28KFDKZ4a74hnuXKavpRvfd1a9qyswDQviuNY67LDyYk8X0T/yZzl7+ugQILqmkOK
        H87SYaGkT0Cit9Yq+LGeI4sJ108vqO9YNRfKs9yupB3Q6qulKicd++YoNnLNwrh+0Ik/1u
        +ZVTXhbKPXKiKJaAw3ZLD5u7Nak3zpQ=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-n46JnhW7NQWMFbBpJzvlgw-1; Mon, 13 Sep 2021 18:26:40 -0400
X-MC-Unique: n46JnhW7NQWMFbBpJzvlgw-1
Received: by mail-io1-f72.google.com with SMTP id y1-20020a6bc801000000b005d0abb2b449so1500585iof.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Sep 2021 15:26:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X0eYnWNF2y6YPPW1SDm2g1rHLnrujH5b2Tuwd/lt0S4=;
        b=1OpL+BIa6XWqyLa1fQuYvTMGaY4z/mEUp61yJLA3S9Oi7b/WamdiHui+CZ7ObZLXaI
         sonJnfrxhCMCJtGOgvF1G8c9vY9+/thJ42wL/irvd8ThXd6bEVYvOA+QtNVn85jdCrnt
         Qh8F2ZfEGkKVx8JihHFnF5lll+XqYVoojf5X7pHkOKKn6Fmk2ytB/DPIm5j1v4S0v2os
         7Qwq5GoSmHi2oYLtwZkYLfoamLt7t+gpYb5tZ6qj4mIcpg4Z4nIhAILN5z83aY2h/+o+
         2rX4dvQ+kg0ZiUKQw0T0eD1D5+1agZwXZtJooKuRjpp2G6Ci8apQG+DFyp2oLUW/081N
         cbvg==
X-Gm-Message-State: AOAM531om/tE69T9zcRfL+IjgA4oi52443VCGsvHFnh4V9/kshPg4WUM
        WoK2UJ8S2IwOJbon07m7+rZHU2XtaW32Z/lkc2dt+x/E8+rV33zqvidJsuNQgbCok96oOlenjLf
        ZoRU0Avd1jxlD29VzSIX7
X-Received: by 2002:a5e:9901:: with SMTP id t1mr11170109ioj.92.1631572000272;
        Mon, 13 Sep 2021 15:26:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaY42b8/TD2CED+srsnZ5bcWSRI5yQ7JH4AJuJXMpvPucAzb14dlnxvRENYqAr72vuPA0Xmg==
X-Received: by 2002:a5e:9901:: with SMTP id t1mr11170096ioj.92.1631572000076;
        Mon, 13 Sep 2021 15:26:40 -0700 (PDT)
Received: from halaneylaptop.redhat.com (068-184-200-203.res.spectrum.com. [68.184.200.203])
        by smtp.gmail.com with ESMTPSA id d10sm5809457ilu.54.2021.09.13.15.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 15:26:39 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Jason Baron <jbaron@akamai.com>, Jonathan Corbet <corbet@lwn.net>,
        Jim Cromie <jim.cromie@gmail.com>
Cc:     Andrew Halaney <ahalaney@redhat.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Trivial dynamic debug fixups
Date:   Mon, 13 Sep 2021 17:24:37 -0500
Message-Id: <20210913222440.731329-1-ahalaney@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Here is round 2 of some trivial dynamic debug fixups. Hopefully I'm
sending the series correctly, first time trying that out.

v1 -> v2:
 * Use different example when showing misleading error message
 * Justify dynamic debug scanning the whole command line
 * Add patch removing ddebug_query
 * Add patch improving cli param examples for dyndbg/$module.dyndbg

v1: https://lore.kernel.org/all/20210909161755.61743-1-ahalaney@redhat.com/

Thanks!

Andrew Halaney (3):
  dyndbg: make dyndbg a known cli param
  dyndbg: Remove support for ddebug_query param
  Documentation: dyndbg: Improve cli param examples

 .../admin-guide/dynamic-debug-howto.rst       | 13 ++++-----
 .../admin-guide/kernel-parameters.txt         |  5 ----
 lib/dynamic_debug.c                           | 27 +++++--------------
 3 files changed, 14 insertions(+), 31 deletions(-)

-- 
2.31.1

