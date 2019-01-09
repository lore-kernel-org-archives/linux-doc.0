Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0BB9B7D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 Jan 2019 15:17:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730746AbfAIPRJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 Jan 2019 10:17:09 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:39716 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732190AbfAIPRJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Jan 2019 10:17:09 -0500
Received: by mail-ot1-f68.google.com with SMTP id n8so6966971otl.6
        for <linux-doc@vger.kernel.org>; Wed, 09 Jan 2019 07:17:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xwSV1PGyH8nJvFuGKp+271hYial/3Zh8eRYcPz53b1Q=;
        b=mt6hDrQMv13Ug2cAsRRMHUuS44bBLWMpug2gvzrpiC5g7OjfXsQ/V/yGA2p5AZldGx
         gbS4sNyhhjM+3SO4Qdrx9ZOzoN+oeq9EbR/ZK++dwIp0N2wJrCdw0N118VT8VzqVTJuI
         qmuKAbM/GRTuHnC92CD9G7lPcFHWnPu/Kz9G/rdEWRqAkv59Pu32gm7VdUnFkOjShd2v
         dsNTJ5he7EH4DvEszNoUWjp4kPyoMgXFVNBctldna4lJuWDvYsNVJxMQh+EiAuvptbzA
         JgDUl2MGgqquyPjY8AV0IzaFZAaxeLiRtre0oJeAotIs6ldjOnj7LxNvBUczkghofDE4
         amDQ==
X-Gm-Message-State: AJcUukcsoUNyngy7y86GdULTXK6bG251168rzJgsEzErPQZPbX2lYhJr
        T2iGkHYeBo4t6LkCPtk8eRs2wh2EEaBRTeSZh0tMLg==
X-Google-Smtp-Source: ALg8bN4TzDbQsVYl2wfHPQrbEuDYLcv6eQzwDOqKLBQwUNyMrz3j29wehI5ikno+twZTNbtNomkUIfSSA0SmdEy7TUg=
X-Received: by 2002:a05:6830:1414:: with SMTP id v20mr4419693otp.125.1547047028980;
 Wed, 09 Jan 2019 07:17:08 -0800 (PST)
MIME-Version: 1.0
References: <20190108215613.15277-1-jpittman@redhat.com> <64f1bba8-1a6e-5aa0-3357-edfdcd7de574@kernel.dk>
In-Reply-To: <64f1bba8-1a6e-5aa0-3357-edfdcd7de574@kernel.dk>
From:   John Pittman <jpittman@redhat.com>
Date:   Wed, 9 Jan 2019 10:16:58 -0500
Message-ID: <CA+RJvhyTDEhpBnVa+POLxtH5g+tW0tTsPEbSbYPc9BN8rUAw0w@mail.gmail.com>
Subject: Re: [PATCH] block: doc: add slice_idle_us to bfq documentation
To:     Jens Axboe <axboe@kernel.dk>
Cc:     paolo.valente@linaro.org, Jonathan Corbet <corbet@lwn.net>,
        linux-block@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thanks; noted.


On Wed, Jan 9, 2019 at 9:39 AM Jens Axboe <axboe@kernel.dk> wrote:
>
> On 1/8/19 2:56 PM, John Pittman wrote:
> > Of the tunables available for the bfq I/O scheduler,
> > the only one missing from the documentation in
> > 'Documentation/block/bfq-iosched.txt' is slice_idle_us.
> > Add this tunable to the documentation and a short
> > explanation of its purpose.
>
> Applied, but I fixed up your commit message. You should use 72
> chars lengths.
>
> --
> Jens Axboe
>
