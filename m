Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0568F7D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 Jan 2019 21:11:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbfADVLj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 4 Jan 2019 16:11:39 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36345 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbfADVLi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Jan 2019 16:11:38 -0500
Received: by mail-pl1-f195.google.com with SMTP id g9so17936184plo.3
        for <linux-doc@vger.kernel.org>; Fri, 04 Jan 2019 13:11:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jA8NTGG6MCgL2o4Z4FNSYNdHDw+Yqthl9rbkJ7aN3mk=;
        b=jZCyRX5ss7W5clxQ87zLheLFiK+3JkikkkHDaVo8CLEDGOnf1ouYZ2aRyQ2xmUFVpO
         to7tAXZF7pgkQTNwg+8mV9GzDbqMt53QF6x2rZqptzvzuklxob8STQbHNRosZONixxnc
         LfaoW3v11hPjSaOpxDfDEHB4Q0fheE/STJKo5gnzR/6uz8TafoVhomre7XTkCeRg3UBA
         hXderMVMh+TIB28S6sDGdob5M6O6MY+LlKYDbAPCVzFjNiFcnfEmvQmayi8Krf8jBt2T
         3H4i4T+wsIaIXf2W53jzdsjqC7vLwR9oYUfCYYi0TdPgSXQDf/rl/6z3gvLWKAmWFtQC
         bTiA==
X-Gm-Message-State: AJcUukfBBq88i/EI0SYbXT2iq2YKM4B4zRBcrvEyASPR/qHT+hSsv7X3
        BYca/kH6BIbEjivXqLRE7L2zwQlg2wWrAA==
X-Google-Smtp-Source: ALg8bN7b/JCtvXwj1MyX/zSq9hDTxUQHFDe4kt1RNb9qGNhHZ/8YpYnatM8RVEdspgXXvLQvzdnUHg==
X-Received: by 2002:a17:902:6f09:: with SMTP id w9mr53605156plk.309.1546636298241;
        Fri, 04 Jan 2019 13:11:38 -0800 (PST)
Received: from ?IPv6:2620:15c:2cd:203:5cdc:422c:7b28:ebb5? ([2620:15c:2cd:203:5cdc:422c:7b28:ebb5])
        by smtp.gmail.com with ESMTPSA id 19sm114673569pfs.108.2019.01.04.13.11.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jan 2019 13:11:37 -0800 (PST)
Message-ID: <1546636296.83374.5.camel@acm.org>
Subject: Re: [PATCH] Documentation/CodingStyle: Move emacs settings into
 .dir-locals.el
From:   Bart Van Assche <bvanassche@acm.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
        "Geyslan G . Bem" <geyslan@gmail.com>,
        Tiago Natel de Moura <tiago4orion@gmail.com>,
        Alison Chaiken <alison@she-devel.com>,
        Joe Perches <joe@perches.com>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Li Yang <leo@zh-kernel.org>,
        Alison Chaiken <alison_chaiken@mentor.com>,
        Zhang Le <r0bertz@gentoo.org>
Date:   Fri, 04 Jan 2019 13:11:36 -0800
In-Reply-To: <20190104210834.89231-2-bvanassche@acm.org>
References: <20190104210834.89231-1-bvanassche@acm.org>
         <20190104210834.89231-2-bvanassche@acm.org>
Content-Type: text/plain; charset="UTF-7"
X-Mailer: Evolution 3.26.2-1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 2019-01-04 at 13:08 -0800, Bart Van Assche wrote:
+AD4 For new kernel developers who use emacs it is tedious to follow the
+AD4 instructions in Documentation/process/coding-style.rst for configuring
+AD4 +AFs ... +AF0

Please ignore this patch - this is the old version (v1). The other patch,
the one this is a reply to, is version 2.

Bart.
