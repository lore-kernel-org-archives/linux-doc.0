Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 096607DD29
	for <lwn-linux-doc@archive.lwn.net>; Tue, 14 May 2019 22:19:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbfENWTt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 14 May 2019 18:19:49 -0400
Received: from mail-pg1-f202.google.com ([209.85.215.202]:34559 "EHLO
        mail-pg1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726660AbfENWTs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 May 2019 18:19:48 -0400
Received: by mail-pg1-f202.google.com with SMTP id z7so445098pgc.1
        for <linux-doc@vger.kernel.org>; Tue, 14 May 2019 15:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=NNCnVCTAATMxlDMarLLJ67yqDDVFt+vwrBh9wh5mNVQ=;
        b=quTKkalkkcdvAmo8Q5W/BySUzf8yCwwTH5YR563mPWxNUSE5MultuJds8qTnGLUd9G
         GJOMcET4Wz5Z093noXRAIdno9qE82hEKyL9OWEEEeZgvMsgKsoo6ySFkGuc/6WqHcU0M
         Hpl+SDxyqgLaiTUqKbcRAQtyOX/1f7cvhIRr9mCHA88MjEoBBMBrKFxLj+V+PJU2icQz
         YZVy0jog5dz9kph3TsyRuJuDu4mNIMZwKmuJy8P56loFGJEgPnUHKRTVucDlKHqh0GsE
         xE/dwKEOx3hf4rdD0KCrCmTo1nwHhw2rMCTcX3tA2M9n443niRuAWkZ8t1kGad/emCxN
         xZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=NNCnVCTAATMxlDMarLLJ67yqDDVFt+vwrBh9wh5mNVQ=;
        b=jxsuP0NaWMo3nM9KAdAxMYMOampnnBKOXoX88LGfz16uTC+n2vfT6YfudWxuExWVP0
         prL2RT/ipUsAt0jYaoSVDgqysLkW8z4VE39ymhbBgqx2rAYzbSRHMwptnIiIAxCG+CuG
         tJnRsXV7Y67EqMj06HbHiVYQZ7FEAanmpSKTN2eGmohMX0KwcnN7nwa50HMxU2gp9/N/
         kdPrJCDRNDXN9IA0t6yorc+poABVig0Xe9Obkxu04aR5OW3TvkQnBTeLlxlIVy/AT127
         95D15sKtv8rPSl9rxAHYzM+K5JmlFgLn0kskzvRLqAuexmHLvI7/dIwJE5B0gJlp2tzp
         K4Og==
X-Gm-Message-State: APjAAAVn6py/6rvauZ3bs1E1pWFwNtETNqh0TUCp4L5iCEK57gUwNWaz
        BCuQMmbBgOXcDmfJy0NIsn1xzhuWZGkwN1Cbp3oG3A==
X-Google-Smtp-Source: APXvYqxo6OjC5cnI7G46g6hiP/P8iTXGx7hD0/zp0LMpsykXkRPUvVhudAT1yu9PqFgJEj2J/jGAQAQ3/X7UkXFAG8BMDA==
X-Received: by 2002:a63:6988:: with SMTP id e130mr40887298pgc.150.1557872385659;
 Tue, 14 May 2019 15:19:45 -0700 (PDT)
Date:   Tue, 14 May 2019 15:17:11 -0700
In-Reply-To: <20190514221711.248228-1-brendanhiggins@google.com>
Message-Id: <20190514221711.248228-19-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190514221711.248228-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v4 18/18] MAINTAINERS: add proc sysctl KUnit test to PROC
 SYSCTL section
From:   Brendan Higgins <brendanhiggins@google.com>
To:     frowand.list@gmail.com, gregkh@linuxfoundation.org,
        jpoimboe@redhat.com, keescook@google.com,
        kieran.bingham@ideasonboard.com, mcgrof@kernel.org,
        peterz@infradead.org, robh@kernel.org, sboyd@kernel.org,
        shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
        Alexander.Levin@microsoft.com, Tim.Bird@sony.com,
        amir73il@gmail.com, dan.carpenter@oracle.com, daniel@ffwll.ch,
        jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr,
        khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com,
        mpe@ellerman.id.au, pmladek@suse.com, rdunlap@infradead.org,
        richard@nod.at, rientjes@google.com, rostedt@goodmis.org,
        wfg@linux.intel.com, Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add entry for the new proc sysctl KUnit test to the PROC SYSCTL section.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8a91887c8d541..2e539647589fd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12526,6 +12526,7 @@ S:	Maintained
 F:	fs/proc/proc_sysctl.c
 F:	include/linux/sysctl.h
 F:	kernel/sysctl.c
+F:	kernel/sysctl-test.c
 F:	tools/testing/selftests/sysctl/
 
 PS3 NETWORK SUPPORT
-- 
2.21.0.1020.gf2820cf01a-goog

