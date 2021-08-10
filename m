Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A4F6C4338F
	for <linux-doc@archiver.kernel.org>; Tue, 10 Aug 2021 09:16:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF71260EC0
	for <linux-doc@archiver.kernel.org>; Tue, 10 Aug 2021 09:16:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238749AbhHJJRF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Aug 2021 05:17:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238745AbhHJJRE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Aug 2021 05:17:04 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A15D3C06179C;
        Tue, 10 Aug 2021 02:16:36 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id pj14-20020a17090b4f4eb029017786cf98f9so4358759pjb.2;
        Tue, 10 Aug 2021 02:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1eMLWbyBU/sRONtQIPvGPa9Xul5GM1ibC93IbV30gmk=;
        b=uRHNZ/XSXpSd2EekLcyPlKNakWbcXrgdNHhu4LPh24wCi09/V4P/V4//poEFhQT9Kl
         pJnwCjtsahSbrHXcUEEZSDvW4mau1uhNU0laOY0m+keJqPyLiHiAWpUbjM6x+rvEvP8E
         9G+rYO9vvvb9qaf/oUS18om/kibXtTWxdFOqUpwP2Jpn4OtbY/ZUcrlf1j4WzCKfaVJI
         6KIbbnv59I9a1r1X/AUarC2XIyyh+2wQZ78CwrpkYP26shn5C6oMV5AMd+qGL5SHMeZ3
         XzMC+4/vaQTdQpqk6BdJIRE7Zx0VWFqxlyCFDECrChxBr5ra+M3u8qhCKGjD8Fn1F8v+
         23MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1eMLWbyBU/sRONtQIPvGPa9Xul5GM1ibC93IbV30gmk=;
        b=AY8sXAqpvkW0Zh9jVvSSN5gok1b5sCQWwpJWxXWVQnt5hrkrubbj+6ILjDQzpPzto7
         W8s5xmnnHifd1J1q4zW9vquxY9ZixylTzhEH0J/fk0ia+2HuFdlqv1UvvCwDR1xumbqD
         rxxYngxPdWVGmde+LtBNz20xq0X9NEtPboaly8p31dI4OAZLsK+wu7GQg2Vbb1kKyhLi
         I1Qb96RIjXNoTWeQCmJswyqnh9Sko7Ynb7Kn4riOeFjy/SeMspdVtiJXrEsUhGbu1jka
         9lsAVLoEjyqcwUhgvYW1fvw5Qe1kmHXzVv95am1ET/1zoVsBn8HXJeYXouzed3CcRraZ
         R6rA==
X-Gm-Message-State: AOAM530xgmas4CzQejhtMoxZ7/vvUKOha+ejLwaoy2JlFuTn10a9AAqZ
        RpykGqqEJXhV2IyouyowkNo=
X-Google-Smtp-Source: ABdhPJwo3IHlpSusugq84VzN8wuuLt/+jy01P9rYCZOEZCnx35yOgUFBFnfRqrRDwfFvwfVKiRGV9Q==
X-Received: by 2002:a63:5fd4:: with SMTP id t203mr46726pgb.141.1628586996243;
        Tue, 10 Aug 2021 02:16:36 -0700 (PDT)
Received: from [192.168.11.2] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id x2sm2281054pjq.35.2021.08.10.02.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 02:16:35 -0700 (PDT)
Subject: [PATCH v2] docs: sphinx-requirements: Move sphinx_rtd_theme to top
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akira Yokosawa <akiyks@gmail.com>
References: <974babfe-540f-40e4-38b3-ab294ba70ccc@gmail.com>
From:   Akira Yokosawa <akiyks@gmail.com>
Message-ID: <75f14c88-6091-1072-41cb-16b886aee5a0@gmail.com>
Date:   Tue, 10 Aug 2021 18:16:32 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <974babfe-540f-40e4-38b3-ab294ba70ccc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

sphinx_rtd_theme 0.5.2 has "docutils<0.17" in its requirements.
docutils 0.17 released this April caused regression in
sphinx_rtd_theme 0.5.1 [1].

By removing docutils and moving sphinx_rtd_theme before Sphinx in
requirements.txt, the requirement of "docutils<0.17" can be met
naturally.

[1]: https://github.com/readthedocs/sphinx_rtd_theme/issues/1112

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
---
Hi,

It is better to keep requirements as minimal as possible.
Let's leave the dependency to the sphinx_rtd_theme package.

Changes in v1 [2] -> v2:

    o Remove docutils entry.
    o Move sphinx_rtd_theme to top.
    o Adjust patch title.

[2]: https://lore.kernel.org/linux-doc/974babfe-540f-40e4-38b3-ab294ba70ccc@gmail.com/

        Thanks, Akira
--
 Documentation/sphinx/requirements.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/sphinx/requirements.txt b/Documentation/sphinx/requirements.txt
index 489f6626de67..9a35f50798a6 100644
--- a/Documentation/sphinx/requirements.txt
+++ b/Documentation/sphinx/requirements.txt
@@ -1,3 +1,2 @@
-docutils
-Sphinx==2.4.4
 sphinx_rtd_theme
+Sphinx==2.4.4
-- 
2.17.1


