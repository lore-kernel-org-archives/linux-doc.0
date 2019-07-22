Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 753A47D90F
	for <lwn-linux-doc@archive.lwn.net>; Mon, 22 Jul 2019 15:12:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727251AbfGVPMA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 22 Jul 2019 11:12:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:44114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726571AbfGVPL6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 22 Jul 2019 11:11:58 -0400
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 39D3D21911;
        Mon, 22 Jul 2019 15:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563808317;
        bh=AsB3zI1/NGDyZMxT58jD8QlMzyTa4nRlRGFHlVX0dRQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=G/bGujWAaxwyjh/ZoDREmRWnWdjmkmMEzXbgh3dMGYDEuzY9SLEJftT8Jo1kRfXX8
         2BMT0znomn4zwNKXF0h1kFDFcYSvlo0QWT1nZlIXyh5HtQJnBdjbKD7nrlqVCjvJep
         yihmuGDINF55vtIuRhMl7+3R2xskSrwDBSmJyuTg=
Received: by mail-qk1-f173.google.com with SMTP id s145so28858180qke.7;
        Mon, 22 Jul 2019 08:11:57 -0700 (PDT)
X-Gm-Message-State: APjAAAWhePPJI5Vowx92P5G95ccKyiIDw6zPx1u11Cl23lvNNV3aics/
        cS5HArZLZGaTZqIZC9vlQM2f6i1wLZL1cKK08A==
X-Google-Smtp-Source: APXvYqzlkeQGYN/h3FgK13LLtmJiDds4Ql6WIrIGjE9bOBxYWxSrxffd8YBqD08GQ3B1uVaq7Dl6FQ8Qdj9mcU9lXng=
X-Received: by 2002:a37:a010:: with SMTP id j16mr48177105qke.152.1563808316481;
 Mon, 22 Jul 2019 08:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1563792333.git.mchehab+samsung@kernel.org> <40b78fbbe64108601c274d28b7c515b3cd29d206.1563792334.git.mchehab+samsung@kernel.org>
In-Reply-To: <40b78fbbe64108601c274d28b7c515b3cd29d206.1563792334.git.mchehab+samsung@kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 22 Jul 2019 09:11:44 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJT-moVXuwEndGfJZknHk8p+Vdv+k5hObhT1+x5TZKAPg@mail.gmail.com>
Message-ID: <CAL_JsqJT-moVXuwEndGfJZknHk8p+Vdv+k5hObhT1+x5TZKAPg@mail.gmail.com>
Subject: Re: [PATCH 01/22] docs: convert markdown documents to ReST
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, devicetree@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 22, 2019 at 5:08 AM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:
>
> The documentation standard is ReST and not markdown.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/writing-schema.md    | 130 ---------------
>  Documentation/devicetree/writing-schema.rst   | 153 ++++++++++++++++++

Thinking about this some more, can you split this to a separate patch
for me to apply. I may have some changes to this file this cycle.

>  ...entication.md => ubifs-authentication.rst} |  70 +++++---
>  3 files changed, 197 insertions(+), 156 deletions(-)
>  delete mode 100644 Documentation/devicetree/writing-schema.md
>  create mode 100644 Documentation/devicetree/writing-schema.rst
>  rename Documentation/filesystems/{ubifs-authentication.md => ubifs-authentication.rst} (95%)
