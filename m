Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF17C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 29 Mar 2022 06:07:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231860AbiC2GIw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Mar 2022 02:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231264AbiC2GIw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Mar 2022 02:08:52 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0AF669705
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 23:07:08 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id j13so16701116plj.8
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 23:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=/Ta5Hogp0DW6Kafa+7yEKG6vc4ZfkDx5g8NHzg/E3ak=;
        b=bsUIp8lfnCx/ywg2TvmHU0xzMj/37LxNxga06uOW6FTtPq9QN3GagbeTmYFYo5BYDz
         Wsuz0xv/MeBljhPfT7Qa9kxD5DuVPxhM9X8al7Rvyt7c0tctCQhRAT9G/5abNoIZxrqR
         6qmqs4z5nQbTbCOuRxubhAPykkPWQATaaS6TBnBTM3tnLDRQe0p0ySs4KJ25MGzNBUcH
         +Bc2lbbSFHq44cFJ/DewVCr1sIkkI9DM52sJkOZWWhf9nJ+RODyJrePBH0FRwi9RukUS
         d2O1FyIiti5iFZ5vO0gIztDkRQUuI8Cqg59pRBr5JOC2WqUNsmhpzHCI/rFtsBf9MW/R
         go2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=/Ta5Hogp0DW6Kafa+7yEKG6vc4ZfkDx5g8NHzg/E3ak=;
        b=bDFd2pya5c22uGW2/Y5gfQbgIIz+60KLt0glGEkWNTpMhp6dZHjzVbmTxqs/jSDU60
         dkv/nRKqzrERB3ZwSxg+EabTyQVZtO1/281GaY9rSCLjyxVFDu6+DfcabykK1RjYmPVS
         LzOHWXdiEnF3t2EgUaQcn228gaidwwPAxEBFawoFnFWh8vn8O+2ao1CkB7URODyKZv4q
         CaPecdlILjHDZa2OheinRvIq0epx4SEeG8TMZ3pvy3corCni/v+B0JrYOduYnf3tpBx4
         4QXb4+IunCMkQhFUXPODXFeLgNvV8Yu+F7fch9H70Absrak6fdqZFVVXEvbzwRrfeBpW
         xgcQ==
X-Gm-Message-State: AOAM531hArYsQsPRxYysf8yXK6UdjpJVPF16Sw+djUEhYf6aomDOTIa1
        xBW/XFrrWbCN8RFLn2WSsubLFjSZoso=
X-Google-Smtp-Source: ABdhPJx9qkyW1JI8LwvE1Q6KNXYkMIJqvIlfD51D0ysZZUSYKbkM9dUGy3N7Uxj8PGFaNuU6rCU28g==
X-Received: by 2002:a17:902:b183:b0:153:59db:f860 with SMTP id s3-20020a170902b18300b0015359dbf860mr28866743plr.19.1648534028508;
        Mon, 28 Mar 2022 23:07:08 -0700 (PDT)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id b17-20020a056a000a9100b004e1b7cdb8fdsm19516001pfl.70.2022.03.28.23.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Mar 2022 23:07:08 -0700 (PDT)
Message-ID: <7dbff8a0-f4ff-34a0-71c7-1987baf471f9@gmail.com>
Date:   Tue, 29 Mar 2022 15:07:02 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
From:   Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] docs: sphinx/requirements: Limit jinja2<3.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

jinja2 release 3.1.0 (March 24, 2022) broke Sphinx<4.0.
This looks like the result of deprecating Python 3.6.
It has been tested against Sphinx 4.3.0 and later later.

Setting an upper limit of <3.1 to junja2 can unbreak Sphinx<4.0
including Sphinx 2.4.4.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org
---
Or we can bump the requirement to Sphinx>=4.0.
Thoughts?

        Thanks Akira
--
 Documentation/sphinx/requirements.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/sphinx/requirements.txt b/Documentation/sphinx/requirements.txt
index 9a35f50798a6..2c573541ab71 100644
--- a/Documentation/sphinx/requirements.txt
+++ b/Documentation/sphinx/requirements.txt
@@ -1,2 +1,4 @@
+# jinja2>=3.1 is not compatible with Sphinx<4.0
+jinja2<3.1
 sphinx_rtd_theme
 Sphinx==2.4.4

base-commit: 9df072c73b9891e44f7f59f3b7c8f852b4485e80
-- 
2.25.1

