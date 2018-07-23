Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 40EAC7D072
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Jul 2018 16:44:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388669AbeGWRqt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Jul 2018 13:46:49 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37872 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388561AbeGWRqt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Jul 2018 13:46:49 -0400
Received: by mail-lf1-f65.google.com with SMTP id j8-v6so951271lfb.4
        for <linux-doc@vger.kernel.org>; Mon, 23 Jul 2018 09:44:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=geLEKATQKwPDoEH4wArb60fD152g1b62tODtYSwLx90=;
        b=fUYS5UVareqpEvsvI7FlzH0bq8iJ3OsRRKkheWK7sOgzB258uopotnwv2fTXA1cYex
         W9d53o8fAzocfikthrN9kmA+0bL8Dwe2L7W195GJOsGohGD3XoMFPckL0v/LEgUqgXvr
         6nIQfh7HIqMB4oSTnMnQfPpKE26XKI5uGw3zVajqfrnbU5cqiVxNr3Cxc0vHVR/ef/VX
         oj3iYO030zWPKZ6/0wQBNQsCyDluBhME0d6KvY6PL/Y33id0hZ76/bcGU0dH7Oq3axeh
         iS2BL9FBW4KHa2sh5HfOa9nKoZZ7vTwqhba8CchdKrwAyQALAYLag6ArlpnqtzsVk1DU
         61hQ==
X-Gm-Message-State: AOUpUlF7D/ZkIItwN85LMqaZUR5o48aks/5xA0c0krzfsPkNwL5OWBZA
        6B6+JaxSg4yDVCoCLeuJhrlALMtSXuiQSsR4qqzcKQ==
X-Google-Smtp-Source: AAOMgpd6f4NLXP4A0t9J6LD4U1/8wy4v7adZA6b/qDLN/RZCg6v82ewUqgUrUusjD8SKw/1PA09/d7miqqEFOa1kqQQ=
X-Received: by 2002:a19:f22:: with SMTP id e34-v6mr7600615lfi.1.1532364284505;
 Mon, 23 Jul 2018 09:44:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:4e8a:0:0:0:0:0 with HTTP; Mon, 23 Jul 2018 09:44:03
 -0700 (PDT)
In-Reply-To: <20180723092539.177749b8@lwn.net>
References: <20180713172806.17387-1-pdhamdhe@redhat.com> <20180723092539.177749b8@lwn.net>
From:   Prashant Dhamdhere <pdhamdhe@redhat.com>
Date:   Mon, 23 Jul 2018 22:14:03 +0530
Message-ID: <CAF1GLk==0cuBE_CGk_o_--2srJWA4k7BZ+yX7UCSdp3HYmmokA@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: proc.txt: Adding 'HardwareCorrupted'
 field and description.
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 23, 2018 at 8:55 PM, Jonathan Corbet <corbet@lwn.net> wrote:
> On Fri, 13 Jul 2018 22:58:06 +0530
> Prashant Dhamdhere <pdhamdhe@redhat.com> wrote:
>
>> This patch talks about the 'HardwareCorrupted' field currently missing from
>> the 'meminfo' section of 'proc.txt' file. It also includes short description
>> of 'HardwareCorrupted' field.
>
> I've gone ahead and applied this.  Please note, though, that the "this
> patch..." style of changelogging strongly irritates some developers;
> please use an imperative style in the future.  I rewrote the changelog to:
>
>         Documentation: proc.txt: Adding 'HardwareCorrupted' field and
>         description.
>
>         Fill in missing documentation for the HardwareCorrupted field in
>         proc.txt.
>
> Thanks,
>
> jon


Sure. Thank you for correcting it.

--
Prashant
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
