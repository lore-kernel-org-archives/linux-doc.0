Return-Path: <SRS0=vG9z=DM=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B09C4363D
	for <linux-doc@archiver.kernel.org>; Mon,  5 Oct 2020 13:02:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0738D20848
	for <linux-doc@archiver.kernel.org>; Mon,  5 Oct 2020 13:02:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jc95MkjA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgJENC6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Oct 2020 09:02:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbgJENCt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Oct 2020 09:02:49 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DA41C0613B9
        for <linux-doc@vger.kernel.org>; Mon,  5 Oct 2020 06:02:48 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id l17so9193345edq.12
        for <linux-doc@vger.kernel.org>; Mon, 05 Oct 2020 06:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ufk8Pbp+j3zURPBdVWH2l/CCq1R36iVRdU45mNegaRY=;
        b=jc95MkjAZ30kHhClE+TJJIMhUz0IlKGpovAWPs3bO3tN7bO8YB+OKUK+B2umH8ygDC
         WARHozjr8NJyjdcx/gknoliHFrq2QzjcmxUOB+a7hqE7SGVxI53L0e/i5KVt03XDNHUn
         KTSo+QCkqKulcr7KUJ9GngsGEYxjiZW5X+YKOedmB+Ie4cnE83M3JMhYy+4++s4XzTWS
         ItoeZkc/DgR82KFKRg/2jGgiKyJcHRb2ZTn6BHHOfvyppBDUz5WZmgXz7NV24UtSPhxi
         S2CXKzPIlZ1d1GIq/JBP+HPfovfXyB6lBdFPUOVK+P8tTjjb8dfGmWiYUSoMTqLp4GUD
         pIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ufk8Pbp+j3zURPBdVWH2l/CCq1R36iVRdU45mNegaRY=;
        b=skrfdPV1FFxwlVh6AOkDjttnxFIf3a9IivB2lJbWxPWqkjBXdupfGWfuiId7mZDdGh
         nVcWScD2EP65LwLg6LmvEFefhw+KDABETq9xo+L0nd5ipqsGG44YYw3vRWuDqWz2PIGP
         sR9FYzj7sja4padEGmVPesTnrZnPMkNH8maqIwwIi6GsySGrsYdpNPLScmQ2MIHBmzDR
         RgDSx+XaLBY8cPCPZWoJEZi2hAu27xRUo5b88AbfagruGejVxRsLMfFHuTffIlYMJiDV
         6L1TCh/4ug0M/833b5BHjKx8Z2ox+r/FMa6WEAXc7DjvyICbo+NhPun3S8DbIeM9O5ke
         pPdA==
X-Gm-Message-State: AOAM533V8gsL5sqafvfDXJsYemja3TRexns/y8T4akXwWmeRUMnlYjij
        pyfjDqVsXeDOP6KDT/Na6ZSZvGjcZC0=
X-Google-Smtp-Source: ABdhPJyY7lXGvuNf4h9sbs+tqjGweAYckgaklLn3t+FtuQBFOFAFYF+q0gGAdwAXCsxr7xbwQmRF/g==
X-Received: by 2002:aa7:d4d4:: with SMTP id t20mr17178971edr.229.1601902966970;
        Mon, 05 Oct 2020 06:02:46 -0700 (PDT)
Received: from hal.fritz.box (200116b846cf6a005ec5d4fffe9b0465.dip.versatel-1u1.de. [2001:16b8:46cf:6a00:5ec5:d4ff:fe9b:465])
        by smtp.googlemail.com with ESMTPSA id k23sm8131276ejk.0.2020.10.05.06.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 06:02:46 -0700 (PDT)
From:   =?UTF-8?q?Ga=C3=ABtan=20Harter?= <hartergaetan@gmail.com>
To:     linux-doc@vger.kernel.org, corbet@lwn.net,
        federico.vaga@vaga.pv.it, harryxiyou@gmail.com
Cc:     =?UTF-8?q?Ga=C3=ABtan=20Harter?= <hartergaetan@gmail.com>
Subject: [PATCH 0/1] docs: fix kernel-driver-statement rendering
Date:   Mon,  5 Oct 2020 15:02:12 +0200
Message-Id: <20201005130213.74624-1-hartergaetan@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Dear Documentation maintainers,

while browsing the "Kernel driver statement" page on kernel.org [1],
I noticed the name list was split after "J. Bruce Fields" with some extra line
spacing.

The rendered html source shows that the `J.` is interpreted as list item in
`ReST` syntax.

I propose a patch to remove this rendering issue with an escape string
before to still allow doing `git grep` for the name.
I still adds rst only clutters the text though.

I checked the rendered HTML and PDF for both the English and translated
versions to verify it was fixed.
On my local runs the HTML had extra `<p>` tags compared to the webpage so
not sure what was different in the environment.


I found other pages having the same type of issues by grepping the output
for "upperalpha" and checking the inappropriate occurrences.
If it is a class of fixes that is wanted, I could propose other patchsets with
a batch of them.
It may be a good thing to then add the information to a general how to write
documentation document to try preventing it from reappearing.
I would wait for feedback before doing these.


Please keep me in CC as I am not registered on the list.


1: https://www.kernel.org/doc/html/v5.8/process/kernel-driver-statement.html

Best Regards,
Gaëtan Harter


Gaëtan Harter (1):
  docs: fix kernel-driver-statement rendering

 Documentation/process/kernel-driver-statement.rst               | 2 +-
 .../translations/it_IT/process/kernel-driver-statement.rst      | 2 +-
 .../translations/zh_CN/process/kernel-driver-statement.rst      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)


base-commit: 9f35cf8bd7e3347b0679c3f9b5e0bc5493925a1f
-- 
2.28.0

