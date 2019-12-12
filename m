Return-Path: <SRS0=cTBG=2C=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD11C43603
	for <linux-doc@archiver.kernel.org>; Thu, 12 Dec 2019 01:24:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 62204208C3
	for <linux-doc@archiver.kernel.org>; Thu, 12 Dec 2019 01:24:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bRXwJmZH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727469AbfLLBY0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Dec 2019 20:24:26 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35358 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727224AbfLLBYZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Dec 2019 20:24:25 -0500
Received: by mail-pl1-f194.google.com with SMTP id s10so315663plp.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Dec 2019 17:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yxfmdDL7T65vpl8mxodCbmEtdWkrwaTZC5+tzyhVGaA=;
        b=bRXwJmZHFv0/DvcR8LfYtM1OzaacaOYEZFWDRRvs+auLJumkDckP/tK4HXzXX0EDsA
         5a+xu78dCM+F+leSzcpQcllZzKsh/bltxO7tR0PDqSlBEzwhxPMDZOCjfPxKOdqjMzH4
         hjZKFpu0D9hv3HL6Y6H33Q949WW4CYgG0kQz0l5EwDy9d5WW9JCw0XngN9mLAZAYW/bh
         mD9VlPuPCpzqEdwPBII9BTNK2VTOEj+y0ixQXJX3Xj+qc6MaZ6txvGH5zovaunDkhpeo
         0gZzNR5sxFf+mbnAwvYvp/ZabyNwah5oDZ1c5ZUfoo+Co9G+yemh/eV7s0OFZL8Ix+5V
         j/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yxfmdDL7T65vpl8mxodCbmEtdWkrwaTZC5+tzyhVGaA=;
        b=I9ZGqfVMZK6XFVWCo/e2Bkzlel2g9tZY4SsJWJmOKE1zLnRZxC5UY9JZIIx5eBrQwE
         WaX4oPwvV+dYf/sDunXYhSzhWlrU1aVyMYDB/SNcRqQOQBCwsZI9JpkImb2fWoHZjDWz
         zTzQzW8Y0poL+tvC/qJkc1kvI9epjlJTVSRKHLx1U/Ww6IL/GOl9B7TYaFO1mG3uRVfi
         0xmXjg3ETms1yaFXZxwxuqfkKBexoG2dvhaPu6P48+GVSg5k9dEP/eEP+lOkCGsePnrq
         JQ/DKjrNHP0W5x2XCQZENUESJZxKSPd1VFejgJ06VeAVcjWjOqt9JOIg2CNeRW4cqHTL
         OTGA==
X-Gm-Message-State: APjAAAWEbrj0IDbcXZjGWK0HBchnC63le4eZLF/3boyywQ69r3H4fQ3Q
        I1ktVtN6RQn9Ce+APFlRUFKM7MCJyiKfa+4w2WcYnw==
X-Google-Smtp-Source: APXvYqwh1XJUkOPCF0dyTQQeW2Obj5SdR1i9KBjXveDUQi9/tEWPhx3U7JPzGxqbNmrqdb2cgomvPt7qSdwYBUlbqFc=
X-Received: by 2002:a17:902:9f98:: with SMTP id g24mr6788276plq.325.1576113864508;
 Wed, 11 Dec 2019 17:24:24 -0800 (PST)
MIME-Version: 1.0
References: <20191205093440.21824-1-sjpark@amazon.com> <20191205093440.21824-5-sjpark@amazon.com>
In-Reply-To: <20191205093440.21824-5-sjpark@amazon.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Wed, 11 Dec 2019 17:24:13 -0800
Message-ID: <CAFd5g46j137egWyACg-op7q1gQVMhYzbUdG9_a0hO8Zc9By0sw@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] kunit: Place 'test.log' under the 'build_dir'
To:     SeongJae Park <sjpark@amazon.com>
Cc:     SeongJae Park <sj38.park@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        KUnit Development <kunit-dev@googlegroups.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>, shuah <shuah@kernel.org>,
        SeongJae Park <sjpark@amazon.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 5, 2019 at 1:35 AM SeongJae Park <sjpark@amazon.com> wrote:
>
> From: SeongJae Park <sjpark@amazon.de>
>
> 'kunit' writes the 'test.log' under the kernel source directory even
> though a 'build_dir' option is given.  As users who use the option might
> expect the outputs to be placed under the specified directory, this
> commit modifies the logic to write the log file under the 'build_dir'.
>
> Signed-off-by: SeongJae Park <sjpark@amazon.de>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
Tested-by: Brendan Higgins <brendanhiggins@google.com>
