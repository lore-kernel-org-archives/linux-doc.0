Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 63A747D089
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Dec 2018 11:11:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbeLGLLC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Dec 2018 06:11:02 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35614 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbeLGLLB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Dec 2018 06:11:01 -0500
Received: by mail-lj1-f193.google.com with SMTP id x85-v6so3222915ljb.2;
        Fri, 07 Dec 2018 03:11:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IPaANYg+BKvew3Ns6tmkF9qat1yGp0JhQQkX999AOmA=;
        b=Cemqz9Yv00lY99V8NnAPDcwfS/meoGP21xJiqIFI3VIaQ25u6eZmslJvURKXCz6zJi
         0QbeyEfrRMm/18OGZwFO+yUTLxCpplQEZd+RRA0lPWTP4hDXPp+OIE+KJB2u+mCLxvfD
         WjCVMwezji3jN2xlAuB5tLuSPyuk4sGwnBy+EEV7Mn2LC8IZr23Q6xr0LOL62Ow72njD
         mnfXHJXbBHdnfHgAepXCnlfKMylYAcAImdIEMKOfymcUHrwTjmAtwlOwd60ODQuNa+Iw
         bHa/Erp/sVfaadygiaDo1qWG/wnXY04o0s8cGSv+uNRvEyFX2QbKad96MQGOdfMQI+QY
         YC+w==
X-Gm-Message-State: AA+aEWYWuH3vW+Dz1w2qwv0SjX6mOMBY/LLWvOjvarY2W+zXmr0Bk1Kw
        HUEweDRP6Wx9kHIYsJ1lH+E=
X-Google-Smtp-Source: AFSGD/XfomwTlfwAe22p+SJG0lO7BIYoQtcGAA7ynED9gQVIJ8DPFu04mYExY5/4RW93QAjgp7daSg==
X-Received: by 2002:a2e:197:: with SMTP id f23-v6mr1095815lji.144.1544181059423;
        Fri, 07 Dec 2018 03:10:59 -0800 (PST)
Received: from localhost.localdomain (84-253-205-125.bb.dnainternet.fi. [84.253.205.125])
        by smtp.gmail.com with ESMTPSA id q127-v6sm571001ljq.45.2018.12.07.03.10.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Dec 2018 03:10:58 -0800 (PST)
Date:   Fri, 7 Dec 2018 13:10:51 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com,
        corbet@lwn.net, cw00.choi@samsung.com, krzk@kernel.org,
        b.zolnierkie@samsung.com, mturquette@baylibre.com,
        sboyd@kernel.org, linux@armlinux.org.uk, pombredanne@nexb.com,
        sre@kernel.org, vkoul@kernel.org, linux@roeck-us.net, pavel@ucw.cz,
        sjhuang@iluvatar.ai, andrew.smirnov@gmail.com,
        djkurtz@chromium.org, akshu.agrawal@amd.com,
        rafael.j.wysocki@intel.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 3/3] clk: clk-st: avoid clkdev lookup leak at remove
Message-ID: <f40c69fc858cc7ec3cc722c6664d933ea6558fb9.1544177090.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1544177090.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1544177090.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Use devm based clkdev lookup registration to avoid leaking lookup
structures.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/clk/x86/clk-st.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/x86/clk-st.c b/drivers/clk/x86/clk-st.c
index 3a0996f2d556..25d4b97aff9b 100644
--- a/drivers/clk/x86/clk-st.c
+++ b/drivers/clk/x86/clk-st.c
@@ -52,7 +52,8 @@ static int st_clk_probe(struct platform_device *pdev)
 		0, st_data->base + MISCCLKCNTL1, OSCCLKENB,
 		CLK_GATE_SET_TO_DISABLE, NULL);
 
-	clk_hw_register_clkdev(hws[ST_CLK_GATE], "oscout1", NULL);
+	devm_clk_hw_register_clkdev(&pdev->dev, hws[ST_CLK_GATE], "oscout1",
+				    NULL);
 
 	return 0;
 }
-- 
2.14.3
