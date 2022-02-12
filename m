Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7576BC433EF
	for <linux-doc@archiver.kernel.org>; Sat, 12 Feb 2022 08:00:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232552AbiBLIAt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 12 Feb 2022 03:00:49 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbiBLIAs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 12 Feb 2022 03:00:48 -0500
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9487526AF7
        for <linux-doc@vger.kernel.org>; Sat, 12 Feb 2022 00:00:45 -0800 (PST)
Received: by mail-qk1-x72c.google.com with SMTP id g145so10189020qke.3
        for <linux-doc@vger.kernel.org>; Sat, 12 Feb 2022 00:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vJ423RC9ThkbJE0QYgqw+TTSVJjpSfYst7MlQQS5na4=;
        b=SVheSod+AOMMEHrIg+TSmJXymI3AjE5gs3DgLQXO9xzyMna4gh/v9Nubkfm1tT+S5I
         Sgk4AOMika80zXxjI3+/HKAoYfyFuzJ6l+JzRmOEIZaVi7PkU1Z0AtfVo9CJ/F+Pu3qR
         tzNZeYdH22SisxPYDz8kVb9qot+fXWmj07WNaDFxEQbuHL3KytraiztZzvMmLM1SHzEB
         Bc9wFwg4Cg2VvgFTkAuoAORuT43+QcP/LMQO3mxHL+CmGYmLdnn8WFbCN2KuFeRDruET
         jyswPZnuCSj1BZv92GOdxdpkDVd5hhrgtu2bWEbf4H9nyy0BUxPMB5iENmrUBdvJHYrc
         57nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vJ423RC9ThkbJE0QYgqw+TTSVJjpSfYst7MlQQS5na4=;
        b=veUDn/lBD+ZWquXh0xlhW2N1hhV0BIPtgarZOtjZ7jhPSoL6R6oTx/Q/ndY7d+kkqk
         fFaqlI5y/DR5zsTHru2IV8naZFAs9MX053YEixWrHpyQUgGogn22cQnbqhs34Hj1g2WA
         ztesNQzaKRv9V/q0qoKhO5SLbGCLYpj3ETVie3PVVIPlO9OVxD7jS9pIiC2bmofvorNP
         PnxeBjoZaTatXb8Bw4YDwlAN8rCtUWVl83WsOZHpM+sr9NNbFNkUz3UZWJdsA5WAt3p2
         Z6Qv+njkVa+SOrcxazXk6jPnTYk22ZvWV6w1xXFu6wKPUydsY7P4FjRg3UnoyA/GXw4Z
         znWw==
X-Gm-Message-State: AOAM531kB8j2G+HFF6ZS4Y24FCBueOPxNbG5lyzNAqYHPBnv5BBpBiff
        BgSw80sj/C62QpEG5rKg9o7oUa2HNNs=
X-Google-Smtp-Source: ABdhPJxF0W4gCEQjoKOVrgdn91Y0Oxv2zxDsLTHGtVm/4Fs3DZ6eRDSdwMpBVud/D303CZ7lnmZREg==
X-Received: by 2002:ae9:e50d:: with SMTP id w13mr2536784qkf.638.1644652844754;
        Sat, 12 Feb 2022 00:00:44 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id h5sm13522818qti.95.2022.02.12.00.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Feb 2022 00:00:43 -0800 (PST)
From:   cgel.zte@gmail.com
X-Google-Original-From: xu.xin16@zte.com.cn
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        seakeel@gmail.com, xu xin <xu.xin16@zte.com.cn>
Subject: [PATCH v3 0/3] Add Chinese translations for KSM documents
Date:   Sat, 12 Feb 2022 08:00:24 +0000
Message-Id: <20220212080024.1684590-1-xu.xin16@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: xu xin <xu.xin16@zte.com.cn>

v3:
	Fix the patch '[1/3] Add Chinese translation for vm/ksm.rst'
	because its old version does not apply for the latest commit.

v2:

	According to the suggestions from Yanteng Si, Alex Shi and
	Jonathan Corbet, I have modified my patches. Here are my specific
	changelog:

	1. Remove Redundant Labels in added Documents like ``.. _ksm_sysfs:``

	   Yanteng Si said: Too many tags will cause a compilation
	   warning, because an identical one already exists for the Origin
	   document. Jonathan Corbet think so.

	2. Align with standard Chinese format on the 'original', 'translator',
	   etc.

	3. fix some translation error like “pages_unshared”, I remove  '独享'.

	   Alex Shi suggest to remove '独享'.

	4. Refactor translations/zh_CN/admin-guide/mm/index.rst.

	   Yanteng Si: Compile pass is only one of the basis for checking
	   through, we also have to check the html for any problems, as
	   far as I know, the above treatment is very ugly.

 .../translations/zh_CN/admin-guide/index.rst       |   2 +-
 .../translations/zh_CN/admin-guide/mm/index.rst    |  49 +++++++
 .../translations/zh_CN/admin-guide/mm/ksm.rst      | 148
+++++++++++++++++++++
 Documentation/translations/zh_CN/vm/index.rst      |   1 +
 Documentation/translations/zh_CN/vm/ksm.rst        |  70 ++++++++++
 5 files changed, 269 insertions(+), 1 deletion(-)
 create mode 100644
Documentation/translations/zh_CN/admin-guide/mm/index.rst
 create mode 100644
Documentation/translations/zh_CN/admin-guide/mm/ksm.rst
 create mode 100644 Documentation/translations/zh_CN/vm/ksm.rst
-- 
2.15.2

