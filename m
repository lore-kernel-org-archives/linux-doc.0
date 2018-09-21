Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7C7507D923
	for <lwn-linux-doc@archive.lwn.net>; Fri, 21 Sep 2018 03:02:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389045AbeIUIst (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 21 Sep 2018 04:48:49 -0400
Received: from mail-yb1-f196.google.com ([209.85.219.196]:37598 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727659AbeIUIss (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Sep 2018 04:48:48 -0400
Received: by mail-yb1-f196.google.com with SMTP id b3-v6so3801920yba.4
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 20:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=pyD3m6E5xpzzgx6cR5aSzJI3I2qIkiqcmrw12FtYyUA=;
        b=TYuXHdbJe0RBgK90gj1Yb0ScC3ZbfBO/AJ1UCb8S0xGExW4mvDkveDyN50fIA/JagA
         PtitRVPTGnlvjOkDGIvzbqtx/hfrqQqTKofjA3bopDKHRcTS55ibEuwJQGTkI7Jf4KkG
         16jjGvhYs0qQAMRtvM8rspSVZzeuwlqPqUXYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=pyD3m6E5xpzzgx6cR5aSzJI3I2qIkiqcmrw12FtYyUA=;
        b=kYrbvM6SQ3EnFiMWZVjFErLy1/n9rAxcNDWnfYR5GAKC1RZt/fBKEclDy+FgXXy1EU
         a4Tv3Yo/b/DoT6CO2mKlkNI1uHxpHCxDrb5yzsOjeK/wkn4v7kTiCuWxvBDchJT1kzYc
         Z3s5RY7v4xS3tQr6IZdCIuxI8SkG/LPGJL6GepGT2hKcNCjt/zs5W5JkOmO7JKR56oA5
         GhXP9iSMsBJaFsd6fZJ8foxQYOasGlqHEcBa9KpxSdhIY90Atzv/nn+8OiphgHFf4DMa
         dWyL99Pn5k7vP2Wjk5z14giUhfmuT5UsxiHaxVpdGYrJ09NORzuEwAZu/YycaOdmqWGk
         T4UQ==
X-Gm-Message-State: APzg51B9uG0FDxOGF2ILVKbqEbIyGsgcyP9oqKJaQw6hOR8vUw1trRlx
        h0QO2dFRiU2jZfeIKhrhZqlT9W4ATO8=
X-Google-Smtp-Source: ANB0VdaVpUzFt1V94DS7yG9mzh50Ox2dCyqN7NxEQSXeCZJeqWQ/fzjIG9Y5L45YQrZhHxQR6JRUkw==
X-Received: by 2002:a25:1443:: with SMTP id 64-v6mr19032323ybu.109.1537498924171;
        Thu, 20 Sep 2018 20:02:04 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id w80-v6sm4390311ywd.55.2018.09.20.20.02.02
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Sep 2018 20:02:02 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 184-v6so4868863ybg.1
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 20:02:02 -0700 (PDT)
X-Received: by 2002:a25:238d:: with SMTP id j135-v6mr2067179ybj.137.1537498921935;
 Thu, 20 Sep 2018 20:02:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:5f04:0:0:0:0:0 with HTTP; Thu, 20 Sep 2018 20:02:01
 -0700 (PDT)
In-Reply-To: <74ecd4ec-491b-93d7-4e3f-46f92121130b@canonical.com>
References: <20180920162338.21060-1-keescook@chromium.org> <20180920162338.21060-27-keescook@chromium.org>
 <a0165ce9-d15b-eaef-a5e8-2aeb6bdc69f6@schaufler-ca.com> <CAGXu5j++wXMUXuqT7m5MZdeXqO=i7RgyKZoLwELfSTx6UPOVSA@mail.gmail.com>
 <7d2cc28b-aee5-ee91-9362-f92f8ca30adc@schaufler-ca.com> <6c899d9e-45aa-8159-c402-b3c4d1936112@canonical.com>
 <CAGXu5jKzqij5dY2FYm5rafPNPpF1Tx9BPmK+=FvG+=tpFxpscw@mail.gmail.com> <74ecd4ec-491b-93d7-4e3f-46f92121130b@canonical.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Thu, 20 Sep 2018 20:02:01 -0700
X-Gmail-Original-Message-ID: <CAGXu5j+QhU2HOicYKqfNo17n9k6DKgt1upa3O2p1b5Gvn6icbQ@mail.gmail.com>
Message-ID: <CAGXu5j+QhU2HOicYKqfNo17n9k6DKgt1upa3O2p1b5Gvn6icbQ@mail.gmail.com>
Subject: Re: [PATCH security-next v2 26/26] LSM: Add all exclusive LSMs to
 ordered initialization
To:     John Johansen <john.johansen@canonical.com>
Cc:     Casey Schaufler <casey@schaufler-ca.com>,
        James Morris <jmorris@namei.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
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

On Thu, Sep 20, 2018 at 7:14 PM, John Johansen
<john.johansen@canonical.com> wrote:
> On 09/20/2018 07:05 PM, Kees Cook wrote:
>> On Thu, Sep 20, 2018 at 6:39 PM, John Johansen
>> <john.johansen@canonical.com> wrote:
>>> On 09/20/2018 06:10 PM, Casey Schaufler wrote:
>>>> On 9/20/2018 5:45 PM, Kees Cook wrote:
>>>>> On Thu, Sep 20, 2018 at 5:25 PM, Casey Schaufler <casey@schaufler-ca.com> wrote:
>>>>>> On 9/20/2018 9:23 AM, Kees Cook wrote:
>>>>>>>  config LSM_ORDER
>>>>>>>       string "Default initialization order of builtin LSMs"
>>>>>>> -     default "yama,loadpin,integrity"
>>>>>>> +     default "yama,loadpin,integrity,selinux,smack,tomoyo,apparmor"
>>>>>> If I want to compile all the major modules into my kernel and use
>>>>>> AppArmor by default would I use
>>>>>>
>>>>>>         default "yama,loadpin,integrity,apparmor,selinux,smack,tomoyo"
>>>>>>
>>>>>> or
>>>>>>
>>>>>>         default "yama,loadpin,integrity,apparmor"
>>>>> I was expecting the former, but the latter will have the same result.
>>>
>>> t find having the two be equivalent violates expectations. At least
>>> when considering the end goal of full/extreme stacking, its trivially
>>> the same with current major lsms being exclusive
>>
>> This mixes "enablement" with "ordering", though, and I think the past
>> threads have shown this to be largely problematic.
>>
>> However, with CONFIG_LSM_ENABLED, we get the effect you're looking for, IIUC.
>
> no, I was just stating in a world where we have full stacking those two
> are not equivalent, as I would assume the order of any lsm not listed
> may end up being different.

Right, the ordering would be defined first by runtime (lsm.order=)
followed any missing LSMs then ordered by their order in
CONFIG_LSM_ORDER=, followed by any still missing LSMs then ordered by
their order at link-time (which *may* be Makefile order, but could
change with LTO, etc).

>>>>>> When we have "blob-sharing" how could I compile in tomoyo,
>>>>>> but exclude it without a boot line option?
>>>>> Ooh, yes, this series has no way to do that. Perhaps
>>>>> CONFIG_LSM_DISABLE in the same form as CONFIG_LSM_ORDER? I would
>>>>> totally remove LoadPin's CONFIG for this in favor it.
>>>>
>>>> I would generally prefer an optional CONFIG_LSM_ENABLE to
>>>> CONFIG_LSM_DISABLE, but I understand the logic behind your
>>>> approach. I would be looking for something like
>>>>
>>> +1 on the CONFIG_LSM_ENABLE ove DISABLE
>>>
>>>> CONFIG LSM_ENABLE
>>>>       string "Default set of enabled LSMs"
>>>>       default ""
>>>>
>>>> as opposed to
>>>>
>>>> CONFIG LSM_DISABLE
>>>>       string "Default set of disabled LSMs"
>>>>       default ""
>>>>
>>>> where an empty string is interpreted as "use 'em all"
>>>> in either case.
>>
>> Yes, I like CONFIG_LSM_ENABLE if "empty" means "enable all". Should
>> CONFIG_LSM_ENABLE replace all the other CONFIG-based LSM
>> enabling/disabling?
>
> I don't particularly like "empty" being "enable all". With that
> how would I disable all builtin lsms so that I just boot with
> capability.
>
> An option of all or even * is more explicit and leaves the empty
> set to mean disable everything

Okay, that works. I prefer "all" FWIW.

-Kees

-- 
Kees Cook
Pixel Security
