Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5942B7E286
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Aug 2019 23:21:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbfHTXVr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Aug 2019 19:21:47 -0400
Received: from mail-pf1-f202.google.com ([209.85.210.202]:46779 "EHLO
        mail-pf1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727009AbfHTXVq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Aug 2019 19:21:46 -0400
Received: by mail-pf1-f202.google.com with SMTP id g185so241796pfb.13
        for <linux-doc@vger.kernel.org>; Tue, 20 Aug 2019 16:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=wKRiEgRg+/DU2DEnW3JXAo2ALm03Zt5EFSXAgxYeqSQ=;
        b=BFgC57EX5wNdOQeCPRvrkh94WwexKb08vmyjsrJYYbSvIPMVtFNt0v7lMY+yRZgSz5
         oipoLw5Xfl6v4PwsrckLZfwZgE+j41FjO9gfguvyeEoWUjr80Lp1xi4tWE7l3R9tPISY
         eDySOP8l0zqaHCiVre3eM0d83K8JTZAmnC7SAVBFQ1zcNvupC/ftjS4ePbli9gfQHh+S
         onygslKzC00E5mdUOcPr6G94dCN68feD11yxMzgKCuJmp4lHBeeZynaVoyNM8JGrzQ6m
         Jll+36t+qhbi/zn7MTmSl2mo18NrRtJTZxG0GKBzOcDk/wstf4agP9aE9EebO0R21bYD
         RepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=wKRiEgRg+/DU2DEnW3JXAo2ALm03Zt5EFSXAgxYeqSQ=;
        b=Vl3JA8/VVaDKJII5asvalTLux3WFb5x0r0ph34nqjBSeH85zevchGjKSP3WyvsK9+l
         mMH7vY38iSf9Grz3NfivfeMvnGtt175XntKnJRZZeEa+b2UIAxxkr+W6jshCd+rdPIYh
         9QAsVp6xufjnO61OddMYDHMFf0/Yilrm7aDnMLrwwCTQOTj9B2N3GaHb/t3pgFLvFbL9
         yveGaGdCiondBPd2GFt0JOWwG1XVHWrSqXaf80IIg3sArkj2JifMu72t/+o+kwmAhsmW
         XDlG72sdOJAjOW/YLnY7Wwm5uLxm+fCRAjLUkyejcfsYMwnycCb19q5y92NA3gk4dEec
         giCQ==
X-Gm-Message-State: APjAAAVoSDjIYYbqObqDm+kFa4OalX2gE/X8MZJNuLfpd7lVYCPtGbc9
        HPBca40lg3Lui83Oc4HG7hVdCZWxogrg1iUCOyKqpw==
X-Google-Smtp-Source: APXvYqxEgOhZD3PGSn1+kT2I99YeG1HucF3rfBzgNXbSwxMoFoKzl7eYRx6lZPZGhCgAiM9akAkguErs7fj6mhP+rzIR0Q==
X-Received: by 2002:a63:4042:: with SMTP id n63mr16008379pga.75.1566343304518;
 Tue, 20 Aug 2019 16:21:44 -0700 (PDT)
Date:   Tue, 20 Aug 2019 16:20:46 -0700
In-Reply-To: <20190820232046.50175-1-brendanhiggins@google.com>
Message-Id: <20190820232046.50175-19-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190820232046.50175-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v14 18/18] MAINTAINERS: add proc sysctl KUnit test to PROC
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
        wfg@linux.intel.com, Brendan Higgins <brendanhiggins@google.com>,
        Iurii Zaikin <yzaikin@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add entry for the new proc sysctl KUnit test to the PROC SYSCTL section,
and add Iurii as a maintainer.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Cc: Iurii Zaikin <yzaikin@google.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
Acked-by: Luis Chamberlain <mcgrof@kernel.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f0bd77e8a8a2f..0cac78807137b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12965,12 +12965,14 @@ F:	Documentation/filesystems/proc.txt
 PROC SYSCTL
 M:	Luis Chamberlain <mcgrof@kernel.org>
 M:	Kees Cook <keescook@chromium.org>
+M:	Iurii Zaikin <yzaikin@google.com>
 L:	linux-kernel@vger.kernel.org
 L:	linux-fsdevel@vger.kernel.org
 S:	Maintained
 F:	fs/proc/proc_sysctl.c
 F:	include/linux/sysctl.h
 F:	kernel/sysctl.c
+F:	kernel/sysctl-test.c
 F:	tools/testing/selftests/sysctl/
 
 PS3 NETWORK SUPPORT
-- 
2.23.0.rc1.153.gdeed80330f-goog

