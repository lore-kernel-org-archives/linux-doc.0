Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2F7D57D2F0
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 Oct 2019 03:03:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbfJGDD0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 6 Oct 2019 23:03:26 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36183 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbfJGDD0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 6 Oct 2019 23:03:26 -0400
Received: by mail-pf1-f196.google.com with SMTP id y22so7718027pfr.3
        for <linux-doc@vger.kernel.org>; Sun, 06 Oct 2019 20:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=C/m5ic6fj8GocnCXiQzsizgvdiQVfClBBIdKp9YLVR0=;
        b=ueZKnU4aZlthKS/FZO2N54QHH730lMPBK/1LSmiRMb0sA7OlSRYA8xN2ltdbxqn2z2
         3597DKOhB9krXF0esdF3TRpAzbNcQhi0Imq4YEiT8we7+PoAes+rsi0lL0JdlPkvGWBt
         jpEXFjXmFZgsCxjytQlMpOSvdPO8T9tq7J6SzUR0s4QUXFefVb76+MQJa3//Z0EtkPK8
         I6oQscVSL/rIZFTLsLOlFJqh0JhDQuAm7IwKEj/IEVnSv2kJUqLBsAdMdIzdysJK82na
         5IduwyVUpPEbFUfL173zHkBumDV1GOK7vzouO3NOm3E1d8i2IhJDE/zwPRquxRfpoYk4
         h6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=C/m5ic6fj8GocnCXiQzsizgvdiQVfClBBIdKp9YLVR0=;
        b=ZtUVXslNQ4EMify5ny0WRBXgsRc3Lqony/zZTdBEuJR4GxiCGq9URkQAnsSfQ3lwcB
         p+rBpfoGMJuLtWJOlFejCjbx6A64xu6RTE80KjB68nfuQZSb2m62Z403VyFX9lCpBfEX
         nVWVBbVsPuX6AhZGmQtS5fX19/quzbWuBFuSIK9IaOG9RKV/H00e8++EzBJEgV2z0Zdp
         eUybGkGxRCtfL445S1yAIkRayJqr+kFOg+6w7lS87hF8KLC+j7/jDTuQohbcYt9sdS+l
         yv2KtK04nEFY5ZuXa4sTXdfdM+IOM9LCekOBx4JVezKd5bcDQN/N9ZACA76Q7yU+XJQT
         7UbQ==
X-Gm-Message-State: APjAAAXSnpjmtZSlK0bh3SD2tZdK5/bP1T7ybGDsUzXWmWv7DEcpp7sk
        4w7Dvqq67JBaYQMCwJ5yDog=
X-Google-Smtp-Source: APXvYqwixrEoshtnR+24cfbv314+eD6iS9D11wjLCa17vrYhbmVg3l0p2tvq7TOn8s5RLkV8IWeo/A==
X-Received: by 2002:a62:cd4c:: with SMTP id o73mr30257397pfg.65.1570417405767;
        Sun, 06 Oct 2019 20:03:25 -0700 (PDT)
Received: from gmail.com (ip-103-85-37-165.syd.xi.com.au. [103.85.37.165])
        by smtp.gmail.com with ESMTPSA id 18sm12583695pfp.100.2019.10.06.20.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2019 20:03:24 -0700 (PDT)
Date:   Mon, 7 Oct 2019 14:03:19 +1100
From:   Adam Zerella <adam.zerella@gmail.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Adam Zerella <adam.zerella@gmail.com>
Subject: [PATCH] Documentation: kbuild: Add document about namespaces
Message-ID: <20191007030319.GA32575@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sphinx outputs the following build warning:

Documentation/kbuild/namespaces.rst:
WARNING: document isn't included in any toctree

Assuming this document is intended to be referenced within the
documentation it should be inside the toctree.

Signed-off-by: Adam Zerella <adam.zerella@gmail.com>
---
 Documentation/kbuild/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/kbuild/index.rst b/Documentation/kbuild/index.rst
index 0f144fad99a6..5dd01997c8ed 100644
--- a/Documentation/kbuild/index.rst
+++ b/Documentation/kbuild/index.rst
@@ -14,6 +14,7 @@ Kernel Build System
     kconfig
     makefiles
     modules
+    namespaces
 
     headers_install
 
-- 
2.21.0

