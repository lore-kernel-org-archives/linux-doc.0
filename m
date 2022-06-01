Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BFDDC433EF
	for <linux-doc@archiver.kernel.org>; Wed,  1 Jun 2022 14:34:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350692AbiFAOeL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Jun 2022 10:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242256AbiFAOeL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Jun 2022 10:34:11 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 417F7222BA
        for <linux-doc@vger.kernel.org>; Wed,  1 Jun 2022 07:34:10 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id b135so2137835pfb.12
        for <linux-doc@vger.kernel.org>; Wed, 01 Jun 2022 07:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=SAXgCg0st95zS3LWjriYbqgNd9aWBfHtI9hRnLmW6kI=;
        b=ioMldlGQBPK0jr4pBdrFkyNC89s+B0FLrDcYZi/etFa4xHmHMPqWi4zej8rdvWP4rT
         CIU8E7b0ebg+bWawo10HP01ZWKzjdiSZ/BeTYA3g7beZ3HXpqWV+DV4WMV0w3TgWhN6r
         Go3dJvDnSmMOym3jbAARse8pPLeaLmg163egpjbbL2B2WXswyDc6M8XLKgkpmUJlIrNB
         9XQ9mQVX286GNLdXSaQZRoyTujmv9dIUTpmhwIszVlm8sJKG/qrKt6Rz1RawrMEmkVCO
         5G9My2PrWOblCfy3Soqt/r7C23yFw6MxDLUBnV4A2FcQW+X6b6VugUAK6b6hpe5la5n/
         0FNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=SAXgCg0st95zS3LWjriYbqgNd9aWBfHtI9hRnLmW6kI=;
        b=dJxDTJPGGTHk1rvKC0wy9ZezBuUqoovH8oqHddrEJCbvhvlzklTd3nAMIBtBQpkWEk
         2EeTHiRxplJIhQXJzXSYpdxmD5kzzMZqutN4AFggRRyy3sxMARXS7ii5WUW20RNg0WOl
         GQ+IP3tLZWhfvzawMWKhkx5hlVydswzzcsXf9R9HO0FPe/sK2ObAVFge7QCDQjQtbFdb
         asfUPG1EZu5MesMtX9Gwb6foBx8ennbegv+w4oUDS6iR21IbsN1qJuTOpWgoCWczAWRs
         bGAh8evVGoU14ObgF3XSWohHDwlaFeud/P4REC3K+wrwh+Bqwhyw4lZQ5bd/WsvDkUdc
         dzYQ==
X-Gm-Message-State: AOAM531UoDOuiESQwAK/TflMGZ810nTqxz2xfiQ5YpriRd3ygbggKA45
        htR8PoPy8r5xMZLfbgH0kJ4vRolJ9G8=
X-Google-Smtp-Source: ABdhPJxk8OsGBz/GteOZn2ROZgIo782UjFkhG76JWqm/h91cS6JANKpN4xJCdn+q4qaMa+dH9yeTGg==
X-Received: by 2002:a63:5760:0:b0:3fc:4001:a2f2 with SMTP id h32-20020a635760000000b003fc4001a2f2mr248444pgm.34.1654094049621;
        Wed, 01 Jun 2022 07:34:09 -0700 (PDT)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id u14-20020a170902714e00b0015e8d4eb1f9sm1666016plm.67.2022.06.01.07.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 07:34:09 -0700 (PDT)
Message-ID: <bd0c2ddc-2401-03cb-4526-79ca664e1cbe@gmail.com>
Date:   Wed, 1 Jun 2022 23:34:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
From:   Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] docs/conf.py: Cope with removal of language=None in Sphinx
 5.0.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

One of the changes in Sphinx 5.0.0 [1] says [sic]:

    5.0.0 final

     - #10474: language does not accept None as it value.
       The default value of language becomes to 'en' now.

[1]: https://www.sphinx-doc.org/en/master/changes.html#release-5-0-0-released-may-30-2022

It results in a new warning from Sphinx 5.0.0 [sic]:

    WARNING: Invalid configuration value found: 'language = None'.
    Update your configuration to a valid langauge code. Falling
    back to 'en' (English).

Silence the warning by using 'en'.
It works with all the Sphinx versions required for building
kernel documentation (1.7.9 or later).

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Documentation/conf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 072ee31a301d..934727e23e0e 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -161,7 +161,7 @@ finally:
 #
 # This is also used if you do content translation via gettext catalogs.
 # Usually you set "language" from the command line for these cases.
-language = None
+language = 'en'
 
 # There are two options for replacing |today|: either, you set today to some
 # non-false value, then it is used:

base-commit: b86f46d5ce3e7497930be931a9a9e57480f0baff
-- 
2.25.1

