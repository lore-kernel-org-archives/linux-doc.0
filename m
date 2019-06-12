Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F005F7D8AB
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Jun 2019 19:04:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727366AbfFLTEY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 12 Jun 2019 15:04:24 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44770 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726739AbfFLTEY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Jun 2019 15:04:24 -0400
Received: by mail-ot1-f65.google.com with SMTP id b7so16467620otl.11
        for <linux-doc@vger.kernel.org>; Wed, 12 Jun 2019 12:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fm+mSktMwQOzdmDjQttzxop/Se9urlLSubyC93GJpJ4=;
        b=LuS7gSaW0BGRMk1yfudUHtAoBYQKvzFNUXxlwVYlUwgLqve/5odOm96fueOy+dk3wr
         JnCiH0mwRbkEKhYD/7ByaJvEVvjj8dH87169XEup7OtRPolTcWrSxYG6e7VXkVvpJGRv
         i5nX7zOQlFCF5BNAJfa/lM72KUtF+3Uciofl+omm6sZ9CouKcHFPCV5P8xf0VbWwOwFt
         /woNTQkJ63ZEwhtinkhqDXqjZT7SafFqxlRydcZSgojOlxu/sZug3q+uoerJmx3Zg3p2
         +N/1xX+vYJB3A/GuFz8kc7M9zhPlE2hJTAEsNRMWc6lHVEsqlD5vPB6vXjqrwyHo5DUT
         Xpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fm+mSktMwQOzdmDjQttzxop/Se9urlLSubyC93GJpJ4=;
        b=kvnIZAhwsb3ZlmK0FyQZDWBAbOzyvdpTCW4hLAWCpbDtQoaC0h/Mx8eOR2IKHiMqsv
         vbvxcPV1FF5ntAUxWX2DW82uz+exUZ5zOjOhewMkJGvmwrFPAEw8yIeJBFukdXZasgaH
         Y4yZPKWOVeHKKXA2mPWYgjzcUDnsuBFkEYPl9slbe0yEJ0guI/SoSyQEDP2aKt9nmNRU
         lIg2PDuG4dIjIR9Iifu8ncxQPhYqtbL3+BzSUTRdOnFpyF+JhZ6fySrojA2yX5v6Ox33
         aVosPPu7HOOwNErfNZ2Dr7Fed2wWXAOQOLIdDCrO2kA2ikcoXWo1XNNeZur8BkiivOCJ
         2vhw==
X-Gm-Message-State: APjAAAUSz+l9DeYZDc1XOfZt5xCVd0uvZwmhGXvmlxz6i8zBbqQoin1i
        QBYj8s/4TxUhD0SabUm0GAR9Ng6w2j9juUApZm/U0Q==
X-Google-Smtp-Source: APXvYqxvJTu577fQoKcjkYpWtOb5YYd/YL44ZHZzH9wLurkBS4Udi6HfEgZVwQ1tDKxNk2V77DLY+1ueAa7R3cyNUO0=
X-Received: by 2002:a9d:7248:: with SMTP id a8mr9613478otk.363.1560366263877;
 Wed, 12 Jun 2019 12:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1560364493.git.mchehab+samsung@kernel.org> <075d5879142ff1b7ad16f5eccf4759d35ca02fd4.1560364494.git.mchehab+samsung@kernel.org>
In-Reply-To: <075d5879142ff1b7ad16f5eccf4759d35ca02fd4.1560364494.git.mchehab+samsung@kernel.org>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 12 Jun 2019 12:04:12 -0700
Message-ID: <CAPcyv4g08r6bK_SyTjzKFRM7=wpTQLdmHqRSGh7r-e9YD4tq5Q@mail.gmail.com>
Subject: Re: [PATCH v1 29/31] docs: nvdimm: convert to ReST
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Keith Busch <keith.busch@intel.com>,
        Ira Weiny <ira.weiny@intel.com>,
        linux-nvdimm <linux-nvdimm@lists.01.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Mauro,

On Wed, Jun 12, 2019 at 11:38 AM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:
>
> Rename the mtd documentation files to ReST, add an

s/mtd/nvdimm/

> index for them and adjust in order to produce a nice html
> output via the Sphinx build system.
>
> At its new index.rst, let's add a :orphan: while this is not linked to
> the main index.rst file, in order to avoid build warnings.

Looks ok, but I was not able to apply this one in isolation to give it
a try. Am I missing some pre-reqs compared to v5.2-rc4?
