Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDFAC433F5
	for <linux-doc@archiver.kernel.org>; Thu, 17 Mar 2022 14:07:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231243AbiCQOIg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Mar 2022 10:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234964AbiCQOIf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Mar 2022 10:08:35 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 007A71F125F
        for <linux-doc@vger.kernel.org>; Thu, 17 Mar 2022 07:07:17 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id q19so2735953pgm.6
        for <linux-doc@vger.kernel.org>; Thu, 17 Mar 2022 07:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=jpN6sndRyZlEv53LFyqe5KvG8ZAwQfod17wfSskRF38=;
        b=mri1OSqUEXkG4Uau+/z5VLS06zSTezjERiJ0+elUiCn34e15dTlDdGmJdhl7qazIM2
         Rs4pEA7KqbIAVrhCEl1pMX6A/fqljXAP5B3ti5fp6bxNKop8atcvOrC87gfzjECP6c+q
         V22a0BLz7VA5BkMcsqISns9OweF3Sy838o3kRFbBuhyoaI92ilcnyaheTLNUTXRHUETK
         zwVZjpYtG5KQJ7G/9UyDQ1MPo9qJqGdUo1WOUJbln8+jAZjOnZXOruSoF0cuXs4PGcgz
         qRj52EUgI7C4LYFUP+9bLHZhcgyvMtUTYy93IAGqdzvtuQ0k/35ZFGFqmLnSCLnQAx4L
         n0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jpN6sndRyZlEv53LFyqe5KvG8ZAwQfod17wfSskRF38=;
        b=EjGd5noS2cxmOz6TQ3YjEuDatTM0vn61u0r45M7CmnwaRjs+1zuGSJ/+Qs6Y9EyyC9
         i94DiaCriqDlhoplZgvJn0qtNzOUqQMvqQiVX/vCwOwPqtyDJMxdCrxqXIvkWUWu6CYb
         gfAnQgGzSYB2KMEMYg/lQLz5OZx6w5bpEkd7fBc/VAuJs3uVtUB2PQivXbf5w+uivnZi
         8W6/Bx2NMFTRhi44G/Ln9fdhTUrbp8/BxLsbb8QN7PV+rcWJqZxyL07c5X1NeIws54gn
         /0P656oX//O4DHds7WmBsNW0FBTPt3+gmrK/5FE+l0GUVZ2jVPdfPV55TRjBuQRg7p4x
         ilqA==
X-Gm-Message-State: AOAM530t2IIbrXf0oDgCnTRMhxqYtlSSD9oA3xZKZISIgxTEXc/ur/NC
        rp4gVWlBVMi+MiVY/X5Qdxs=
X-Google-Smtp-Source: ABdhPJyi3oEgCZomW6oayp9QenDPyIPclyRL6LQhd+q5m7j4Kd7fJukphHEhRETXGIZ2MtcDI9DDmg==
X-Received: by 2002:a63:ad45:0:b0:382:2459:5bc6 with SMTP id y5-20020a63ad45000000b0038224595bc6mr375290pgo.474.1647526037430;
        Thu, 17 Mar 2022 07:07:17 -0700 (PDT)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id nv4-20020a17090b1b4400b001bf64a39579sm10432134pjb.4.2022.03.17.07.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 07:07:17 -0700 (PDT)
Message-ID: <84c90422-0f67-ce7d-d28f-e1767004e189@gmail.com>
Date:   Thu, 17 Mar 2022 23:07:12 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] docs: scheduler: Convert schedutil.txt to ReST
Content-Language: en-US
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, mingo@redhat.com, peterz@infradead.org,
        siyanteng01@gmail.com, siyanteng@loongson.cn,
        tangyeechou@gmail.com, tangyizhou@huawei.com, zhengbin13@huawei.com
References: <871qz1txmp.fsf@meer.lwn.net>
 <8c36fd06-b378-409b-6772-972b76cf630c@gmail.com>
 <87y218r9dn.fsf@meer.lwn.net>
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <87y218r9dn.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 17 Mar 2022 07:33:56 -0600,
Jonathan Corbet wrote:
> Akira Yokosawa <akiyks@gmail.com> writes:
> 
>> Hi Jon,
>>
>> On Wed, 16 Mar 2022 15:07:10 -0600
>> Jonathan Corbet <corbet@lwn.net> wrote:
>>
>>> I have applied this version.
>>
>> Jon, I think you missed Peter'z (implied) Nak on this conversion.
>>
>> Quote from Peter's message [1]:
>>
>>> As I'm sure you're aware, I'd *love* to convert the whole lot to plain
>>> text again :-)
>>>
>>> People, throughout the ages, have been able to read plain text, I don't
>>> see why it should be made more difficult than that.
>>
>> I'd recommend you to drop this from docs-next for now.
>> I think this should go through -tip.
> 
> I interpreted Peter's response differently.  I invited him to express
> his opposition to *this patch* and he didn't do that.  As we know, Peter
> does not suffer from an inability to express his thoughts explicitly and
> succinctly; "implied NAK" is not normally his way.

I see.  You know Peter much better than I.
Probably my interpretation was too pessimistic. ;-)

> 
> Or are you saying that I should follow his message to the letter and
> back out the entire RST conversion? :)

I know it is _not_ one of the options we can pursue at this stage of
kernel-doc.  It's too late.  Furthermore, If it stayed plaintext,
I could not have any chance of improving PDF docs.  There remains
plenty of rooms!

        Thanks, Akira

> 
> jon
