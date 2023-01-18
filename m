Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EDDCC32793
	for <linux-doc@archiver.kernel.org>; Wed, 18 Jan 2023 18:22:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbjARSWs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Jan 2023 13:22:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbjARSWp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Jan 2023 13:22:45 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B45A55287
        for <linux-doc@vger.kernel.org>; Wed, 18 Jan 2023 10:22:44 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id s66so28694706oib.7
        for <linux-doc@vger.kernel.org>; Wed, 18 Jan 2023 10:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=59HNFzIDSBb35leXub+SzrL269SK5+8B75jUp0cDEoo=;
        b=O+cICE+qLRo9GTuTN9tfppFH6f05hEXNvgAKwh6cCKET3cSGi7OFsZilRz3fERsiIY
         ViBoeC/9d9iad0xj69QFe1ayD+3fM6SyQ1lflk1XEsOasYmDlJFPWQxUgHLYjv4E8Szy
         GBSNVgFyDTEd7tz4M5gOCebw1cWshUxQU3z8s5uh6l/KagD/jonycKN2k+r7pQyCbCTB
         SSsXRK+oHRZ95RNtzDwP8Jmq0MMsms957ppXPlrzHtLaGtwYPEsAPb116Ff5MZQoJqYW
         SL0FqEk0XTMceD1dYSn9iUPeHAMN2PvGVJBLfsEBqR6LO1T1C/i9ukYk8vOcinCvman+
         FmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=59HNFzIDSBb35leXub+SzrL269SK5+8B75jUp0cDEoo=;
        b=pP7i+Fa/ppKn1Ku0mzzx+2raHAcsz9ZOuVvq+1KJWMMnDvdifZPQEtf/1lCEed01gn
         Xi4cwm6NjsYCaW9ROkrOfDrQ3wISm/69boXwySh8X70wwrnxZ7gU7KBmXwSytZ+9XMDY
         SLGbO8n1jYjXewI0m2BOxEcnZVM4LnBNB4nuFVDpGpSNOhqN78Lgg+MB8Pvr6kfWqOtH
         oQ0jWXWSRMHHbMfs41BnAG0aPy01X9UY/UUPQV5h3eqXR/DgjnK39TZthGEoYuGcaTs+
         XFvvmHALbkTw/oDSbSQVK3lQxnXYBewQwTW3RR+pHXrS6pMSZzGo5gZLpTq8+53yK0hV
         D+lQ==
X-Gm-Message-State: AFqh2kpzdSVFuwcD7AUrfI8OtJSuSV4lwGPE/NQZGAVKBUUz8OmJ9IVv
        Ot0xle25HUxBwxdLLVp9IB33yi6o1XYJZUSGvPVsQA==
X-Google-Smtp-Source: AMrXdXvO1z54tKlvmAxrvMYmhfiKDst+2bjCBUoZVOrIRjGM42UDXNQZUoCV4olfW6Vv73mojTimvknkz+0Jsrc6j/s=
X-Received: by 2002:a54:450c:0:b0:35b:d002:675a with SMTP id
 l12-20020a54450c000000b0035bd002675amr514259oil.44.1674066163692; Wed, 18 Jan
 2023 10:22:43 -0800 (PST)
MIME-Version: 1.0
References: <20230113210703.62107-1-nhuck@google.com> <Y8HI+42TxxlJxT6D@slm.duckdns.org>
 <CAJkfWY7vmvrU8sW3OWpSa9zygY=6e8BTTkktPe-VScdOcLL-sw@mail.gmail.com> <Y8gxu7l8BUWewuMg@slm.duckdns.org>
In-Reply-To: <Y8gxu7l8BUWewuMg@slm.duckdns.org>
From:   Sandeep Dhavale <dhavale@google.com>
Date:   Wed, 18 Jan 2023 10:22:32 -0800
Message-ID: <CAB=BE-Q9jtJnqPwGzSTQ6-soZ9STvqAebeONy=Eyo08H+eg-rQ@mail.gmail.com>
Subject: Re: [PATCH] workqueue: Add WQ_SCHED_FIFO
To:     Tejun Heo <tj@kernel.org>
Cc:     Nathan Huckleberry <nhuck@google.com>,
        Daeho Jeong <daehojeong@google.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 18, 2023 at 9:52 AM Tejun Heo <tj@kernel.org> wrote:
>
> On Sat, Jan 14, 2023 at 01:00:00PM -0800, Nathan Huckleberry wrote:
> > This sounds fine to me. How do you feel about a config flag to change
> > the default WQ_HIGHPRI scheduler policy and a sysfs node to update the
> > policy per workqueue?
>
> Yeah, sounds fine to me.
>
> Thanks.
>
Hi Tejun,
If with the kernel config option, every WQ_HIGHPRI is elevated to
sched_fifo_low, wouldn't that be kind of defeating the purpose? Having
another class for even more urgent work is better in my opinion.

Thanks,
Sandeep.
> --
> tejun
