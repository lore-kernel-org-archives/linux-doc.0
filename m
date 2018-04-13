Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2FEF27E868
	for <lwn-linux-doc@archive.lwn.net>; Fri, 13 Apr 2018 23:33:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751240AbeDMXdK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 13 Apr 2018 19:33:10 -0400
Received: from mail-vk0-f65.google.com ([209.85.213.65]:41793 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751421AbeDMXdJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Apr 2018 19:33:09 -0400
Received: by mail-vk0-f65.google.com with SMTP id i75so1544271vke.8
        for <linux-doc@vger.kernel.org>; Fri, 13 Apr 2018 16:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=BVbPLQ5p2rzczCCvRWlDuysq/aU6DubR9YM+ncCDyL0=;
        b=oalmpDoqYA66D51L7no8/27ckY9OP6JgLzA/32otSpx0F8D6yV5aI1AdKXvdrWcDAm
         f3+0HEgzCUBEVo4efNl902upUyk41GAGuSa/MJdPpdbzezwJc+Z/aTrKDKvFj3fFY2HQ
         1zkMu8jqbRv+2M4lnwgjuohmuRpS81FgrLiQXp0WevTN9JadNzvEadF6XoDSwhKnf+uN
         B32j4l3p1MYjoCcYfELLXIUo2FBvx9WuXq+qFzh1lhcn91W4M0gKdpM/sICSJC/7vwpc
         BU7rqcZZKOFuKauXYnofgPSKMmedlQ25dto2MeDd7qPs1kQB5ZvsrZxWZgQwUGVNBuTc
         Wtxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=BVbPLQ5p2rzczCCvRWlDuysq/aU6DubR9YM+ncCDyL0=;
        b=iwwIr3uqISSPR9BjDKzJ3Mg7YbSwJPVIePBssIrrpu1VRxGKuzwcqiEwccIRtFIzR2
         GQ+jlrksZCRGFC/VTsBioQ/O+aOyH7PzPOXbvB+m5iUaeAwlcdyd+xCX6933ZDvHgyOp
         Bbvf/s7QE3TTEgxH4Vet97uJWkp7o/zBDL6wz/tki6McLLT/YCa3/fls2mQazK38ZXml
         MgYEwJy+s3BwdgTLiFJqtQmggE2lEQBXq4qhWE/ULJlGhzpdWqCSsKw/bCPtRNVFmn0F
         4Gak0a0IzAORaCbdex00oy8zZAH0HAdTVrKX5GHafk5JcqTgPiujIh3l4PcicRec27/I
         hOXQ==
X-Gm-Message-State: ALQs6tBKUTxxwkvmMtBRvPzrRrcZyZRfD1MIcKJxmP3Pn+HyMlIbMMXG
        ldzO5V4tzgZH3fwuOdHSyu/Tfw+8hDKHwsfaWFPHfg==
X-Google-Smtp-Source: AIpwx48NK4Ihi67eZNpRwHSQcLkK+B3aQsfYXQhmAP0YoGBPgsDK38FU+pXID/+Agz7nurhGE/fXpQ+6k9AUWwvwCX4=
X-Received: by 10.31.63.16 with SMTP id m16mr5228287vka.73.1523662388227; Fri,
 13 Apr 2018 16:33:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.58.214 with HTTP; Fri, 13 Apr 2018 16:32:47 -0700 (PDT)
In-Reply-To: <20180413204937.440437e9@endymion>
References: <20180412213342.138010-1-hansens@google.com> <20180412222457.x4jdwt27ylgi74o3@katana>
 <20180413141359.793919fb@endymion> <CAP9bUy7rONNHYeRkYtaWHcfqoZcGKXJz-JocED26zBj9n+-ZbQ@mail.gmail.com>
 <20180413204937.440437e9@endymion>
From:   Sam Hansen <hansens@google.com>
Date:   Fri, 13 Apr 2018 16:32:47 -0700
Message-ID: <CAP9bUy6Hf+cQzAAckou3QPTk0mJM4xJ4xq-hf+RwyVmD3Le+qg@mail.gmail.com>
Subject: Re: [PATCH] Documentation/i2c: sync docs with current state of i2c-tools.
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 13, 2018 at 11:49 AM, Jean Delvare <jdelvare@suse.de> wrote:
> On Fri, 13 Apr 2018 09:02:03 -0700, Sam Hansen wrote:
>> On Fri, Apr 13, 2018 at 5:13 AM, Jean Delvare <jdelvare@suse.de> wrote:
>> > On Fri, 13 Apr 2018 00:24:57 +0200, Wolfram Sang wrote:
>> >> On Thu, Apr 12, 2018 at 02:33:42PM -0700, Sam Hansen wrote:
>> >> > -  Not meant to be called  directly; instead, use the access functions
>> >> > -  below.
>> >> > +  If possible, use the provided i2c_smbus_* methods described below in favor
>> >> > +  of issuing direct ioctls.
>> >>
>> >> Why this change?
>> >
>> > I'm also not sure if "in favor of" is right. "instead of" would sound
>> > better to me, but I'm no native English speaker, I could be wrong.
>>
>> Sounds good, I'll adopt "instead of".  Regarding Wolfram's earlier
>> comment, as an engineer, requiring an out-of-tree library to build
>> drivers felt a little off.  I can revert this section if you want,
>> just let me know.
>
> The i2c dev interface, and the overlaying library, are used by
> user-space applications. This has nothing to do with "building
> drivers", and makes your "out-of-tree" objection irrelevant. I doubt
> libi2c is the only user-space library building on top of a kernel
> interface.

Ok, sounds good.  I'll send a revised patch set reverting this block.

(also, did I send the v3 patch series threaded correctly?)

>
> --
> Jean Delvare
> SUSE L3 Support
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
