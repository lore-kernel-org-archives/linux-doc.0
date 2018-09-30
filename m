Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 499EC7D081
	for <lwn-linux-doc@archive.lwn.net>; Sun, 30 Sep 2018 16:57:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728435AbeI3Xa5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 30 Sep 2018 19:30:57 -0400
Received: from mail-yb1-f196.google.com ([209.85.219.196]:35484 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727470AbeI3Xa5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 30 Sep 2018 19:30:57 -0400
Received: by mail-yb1-f196.google.com with SMTP id o63-v6so4675949yba.2
        for <linux-doc@vger.kernel.org>; Sun, 30 Sep 2018 09:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=jt+YDrRX2EglLGgJgZ/5VjbfR6ozVNQfeBU8ewRjsMI=;
        b=l1auv6I/viu1eURjkIoidQvCha3tZW0l7e210B/rPP2fiEeoRt1l9iVVQ0JIf3w1gK
         YJgK3k/w/7f3Ah7ZEZN4gh/cOh24+SkV4lsIfBJg2++UlsDtF1gAIDve0FqehK4PLJj+
         pzDgDE4UvrWHIv2r9sS3lNqBN4xjptmsX6I3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=jt+YDrRX2EglLGgJgZ/5VjbfR6ozVNQfeBU8ewRjsMI=;
        b=ArwDdAYtD6CaFXtAfh0Co3w9HWbNfroIeCPz28PCpopVRS38Ow2ywpaS88+8mioBBk
         cuvUs1AJ9gUFtbyqvHhsTlGiADwaNtADvhSq3uN1kH8V2MwgXjYK8vxP4FBR2tjqrIwr
         wrntaWUbQG6AqGvugX3CqeF9hsF8Y8RRmsWSs//5Guz2HIwaPFNTig5n5ISU9s0oeqh+
         PAcVLxQ9rDu/xS8r43948JR0cEofahvRN52O2d7y1g9MFb2/SfdE3R3faWGVdyIrZveg
         Islw64BtAZzYtp3rf0yLrQBNRwuRYBm1fGh9arDkzfwtCSw2GmiRk+UwdzN2zbQ3VhaL
         j/Yg==
X-Gm-Message-State: ABuFfojLFzVBt5hYQzJKLRVR1gbSrkgFDpxAMtVaIguuY7dyRhOM7oDO
        puxVSaCIEnH/vhSbKJ9cWozHK8xN4g8=
X-Google-Smtp-Source: ACcGV61cdvzkgFE6mKRMiqSRX7ZEpB9kTGCI2/gSwajgrDiGHGbs+u/LS6ZGRQ/nivTGjBgSSdXXgw==
X-Received: by 2002:a25:e710:: with SMTP id e16-v6mr4126259ybh.358.1538326628935;
        Sun, 30 Sep 2018 09:57:08 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id y126-v6sm202535ywe.26.2018.09.30.09.57.07
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 30 Sep 2018 09:57:07 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id w7-v6so4659737ybm.7
        for <linux-doc@vger.kernel.org>; Sun, 30 Sep 2018 09:57:07 -0700 (PDT)
X-Received: by 2002:a25:dd82:: with SMTP id u124-v6mr3911015ybg.171.1538326626727;
 Sun, 30 Sep 2018 09:57:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d116:0:0:0:0:0 with HTTP; Sun, 30 Sep 2018 09:57:05
 -0700 (PDT)
In-Reply-To: <67c14d95-10f6-37d5-ee8a-c1fb6a6d460a@i-love.sakura.ne.jp>
References: <20180925001832.18322-1-keescook@chromium.org> <e6122c7d-bd29-d081-3c1e-96b7c369d4fe@schaufler-ca.com>
 <CAGXu5jKQVDW8Wp0ESv2raa0xJnHCCMNqFCzZ5jSVXQ=Dp7FF8A@mail.gmail.com>
 <eda428eb-f6e1-f048-a394-251953c388b6@i-love.sakura.ne.jp>
 <CAGXu5jLUaFX_jPHoOq1abEAjJdLo29Hr2q=sk07yj4KytW6psQ@mail.gmail.com> <67c14d95-10f6-37d5-ee8a-c1fb6a6d460a@i-love.sakura.ne.jp>
From:   Kees Cook <keescook@chromium.org>
Date:   Sun, 30 Sep 2018 09:57:05 -0700
X-Gmail-Original-Message-ID: <CAGXu5jLRPMjWDnvh+wKfqQHZ+nrSH5rHz1Hat2owEu2mTXnjRw@mail.gmail.com>
Message-ID: <CAGXu5jLRPMjWDnvh+wKfqQHZ+nrSH5rHz1Hat2owEu2mTXnjRw@mail.gmail.com>
Subject: Re: [PATCH security-next v3 00/29] LSM: Explict LSM ordering
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Casey Schaufler <casey@schaufler-ca.com>,
        James Morris <jmorris@namei.org>,
        John Johansen <john.johansen@canonical.com>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        "Schaufler, Casey" <casey.schaufler@intel.com>,
        LSM <linux-security-module@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Sep 29, 2018 at 7:36 PM, Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
> On 2018/09/30 3:18, Kees Cook wrote:
>>> Just wondering what is "__lsm_name_##lsm" for...
>>>
>>> +#define DEFINE_LSM(lsm)                                                        \
>>> +       static const char __lsm_name_##lsm[] __initconst                \
>>> +               __aligned(1) = #lsm;                                    \
>>> +       static struct lsm_info __lsm_##lsm                              \
>>> +               __used __section(.lsm_info.init)                        \
>>> +               __aligned(sizeof(unsigned long))                        \
>>> +               = {                                                     \
>>> +                       .name = __lsm_name_##lsm,                       \
>>> +
>>> +#define END_LSM          }
>>
>> I wasn't super happy with the END_LSM thing, but I wanted to be able
>> to declare the name as __initconst, otherwise it needlessly stays in
>> memory after init. That said, it's not a huge deal, and maybe
>> readability trumps a tiny meory savings?
>
> The value of .name field is a few bytes string, and is not sensitive
> information. Keeping such string in non-__initdata section unlikely
> increases total memory pages required for that module.
>
> Unless we need to generate unique address of such string for some reason,
> I think that this saving is pointless.

Okay, sounds good. I will adjust the macro and respin with a v4.

Thanks!

-Kees

-- 
Kees Cook
Pixel Security
