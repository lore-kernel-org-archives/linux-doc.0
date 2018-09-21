Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C94067D57F
	for <lwn-linux-doc@archive.lwn.net>; Fri, 21 Sep 2018 02:05:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388906AbeIUHwJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 21 Sep 2018 03:52:09 -0400
Received: from mail-yb1-f194.google.com ([209.85.219.194]:39983 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388721AbeIUHwJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Sep 2018 03:52:09 -0400
Received: by mail-yb1-f194.google.com with SMTP id w7-v6so4807097ybm.7
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 19:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=HcH1Bb79dsNdr9yP8w5B9x9WxS2B6HZCUiq14C1WX0w=;
        b=XGEUaa0GwktvgX4lu1yNo6BumNOPR91+Ym9t8DmjkYyGSvR6sBIjHcWMfKmfwSFnCG
         Y8Kxzpg4ufSlyuIEv0e+ykw+uO8KAT+N0Vts259g5DsXyJpZ/iSOs0CY8+uEntp2T91P
         i034xwUa/m+o55knbHbxo1lEe8WXP1H+4P6fA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=HcH1Bb79dsNdr9yP8w5B9x9WxS2B6HZCUiq14C1WX0w=;
        b=EhegP88m5vBnF9HDagTep25ijvAQycgSWBfzYeC6k1S9hoOd4NBOLOSra/hrMWJuUI
         xbfbHRj6wX3bvzEsL0bPgdPsAkOngmEEaSa0aBixTuQV7G5BDvEWkQIQqd1ZIuq8sMDj
         OWZy5mBHHOadMe/epDUQJlHddlT4p/YBFM05OkyqE6m7pL47808jyP68cP/WMnqYytvl
         1xIPcuElfR2Brg1xQ6uxKoM4At9mDTJATWGuzsHUwhbI+YgPi5ojW2rOq50uZBMkiPqF
         72LoHyO3V+1y8NTRq2pCLlqBpr3oh0z0nK8lhSzMzipnCpeFKQaid+1iZTIUL2pAPxVH
         oMYg==
X-Gm-Message-State: APzg51BuqCCUhOdWlCyULYPbmJ3QxDg76SsCIpEKlKQAlGSVHFTr917V
        s1HXHeJIi9udTr1uuyP11a5F3aMCpf8=
X-Google-Smtp-Source: ANB0Vda9wnwWch0HaVsfBoMexPeZgXUORWBFHI2stOzIa50in5IeBrKuoqzUmn1+r45u/JJbqlSI+g==
X-Received: by 2002:a25:7714:: with SMTP id s20-v6mr5941137ybc.321.1537495538680;
        Thu, 20 Sep 2018 19:05:38 -0700 (PDT)
Received: from mail-yw1-f47.google.com (mail-yw1-f47.google.com. [209.85.161.47])
        by smtp.gmail.com with ESMTPSA id c126-v6sm8760439ywa.104.2018.09.20.19.05.36
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Sep 2018 19:05:37 -0700 (PDT)
Received: by mail-yw1-f47.google.com with SMTP id h134-v6so1442361ywc.9
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 19:05:36 -0700 (PDT)
X-Received: by 2002:a81:98d7:: with SMTP id p206-v6mr18722455ywg.353.1537495536374;
 Thu, 20 Sep 2018 19:05:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:5f04:0:0:0:0:0 with HTTP; Thu, 20 Sep 2018 19:05:35
 -0700 (PDT)
In-Reply-To: <6c899d9e-45aa-8159-c402-b3c4d1936112@canonical.com>
References: <20180920162338.21060-1-keescook@chromium.org> <20180920162338.21060-27-keescook@chromium.org>
 <a0165ce9-d15b-eaef-a5e8-2aeb6bdc69f6@schaufler-ca.com> <CAGXu5j++wXMUXuqT7m5MZdeXqO=i7RgyKZoLwELfSTx6UPOVSA@mail.gmail.com>
 <7d2cc28b-aee5-ee91-9362-f92f8ca30adc@schaufler-ca.com> <6c899d9e-45aa-8159-c402-b3c4d1936112@canonical.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Thu, 20 Sep 2018 19:05:35 -0700
X-Gmail-Original-Message-ID: <CAGXu5jKzqij5dY2FYm5rafPNPpF1Tx9BPmK+=FvG+=tpFxpscw@mail.gmail.com>
Message-ID: <CAGXu5jKzqij5dY2FYm5rafPNPpF1Tx9BPmK+=FvG+=tpFxpscw@mail.gmail.com>
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

On Thu, Sep 20, 2018 at 6:39 PM, John Johansen
<john.johansen@canonical.com> wrote:
> On 09/20/2018 06:10 PM, Casey Schaufler wrote:
>> On 9/20/2018 5:45 PM, Kees Cook wrote:
>>> On Thu, Sep 20, 2018 at 5:25 PM, Casey Schaufler <casey@schaufler-ca.com> wrote:
>>>> On 9/20/2018 9:23 AM, Kees Cook wrote:
>>>>>  config LSM_ORDER
>>>>>       string "Default initialization order of builtin LSMs"
>>>>> -     default "yama,loadpin,integrity"
>>>>> +     default "yama,loadpin,integrity,selinux,smack,tomoyo,apparmor"
>>>> If I want to compile all the major modules into my kernel and use
>>>> AppArmor by default would I use
>>>>
>>>>         default "yama,loadpin,integrity,apparmor,selinux,smack,tomoyo"
>>>>
>>>> or
>>>>
>>>>         default "yama,loadpin,integrity,apparmor"
>>> I was expecting the former, but the latter will have the same result.
>
> t find having the two be equivalent violates expectations. At least
> when considering the end goal of full/extreme stacking, its trivially
> the same with current major lsms being exclusive

This mixes "enablement" with "ordering", though, and I think the past
threads have shown this to be largely problematic.

However, with CONFIG_LSM_ENABLED, we get the effect you're looking for, IIUC.

>>>> When we have "blob-sharing" how could I compile in tomoyo,
>>>> but exclude it without a boot line option?
>>> Ooh, yes, this series has no way to do that. Perhaps
>>> CONFIG_LSM_DISABLE in the same form as CONFIG_LSM_ORDER? I would
>>> totally remove LoadPin's CONFIG for this in favor it.
>>
>> I would generally prefer an optional CONFIG_LSM_ENABLE to
>> CONFIG_LSM_DISABLE, but I understand the logic behind your
>> approach. I would be looking for something like
>>
> +1 on the CONFIG_LSM_ENABLE ove DISABLE
>
>> CONFIG LSM_ENABLE
>>       string "Default set of enabled LSMs"
>>       default ""
>>
>> as opposed to
>>
>> CONFIG LSM_DISABLE
>>       string "Default set of disabled LSMs"
>>       default ""
>>
>> where an empty string is interpreted as "use 'em all"
>> in either case.

Yes, I like CONFIG_LSM_ENABLE if "empty" means "enable all". Should
CONFIG_LSM_ENABLE replace all the other CONFIG-based LSM
enabling/disabling?

>>>> When we have full stacking, how could I compile in selinux
>>>> but exclude it?
>>> Yup, same problem. Same suggested solution?
>>>
>>> Should lsm.enable/disable= also become a comma-separated list, or
>>> should I leave it as a multi-instance thing like I have it?
>>
>> I prefer the multi-instance
>>       lsm.disable=selinux lsm.disable=yama
>> to the list
>>       lsm.disable=selinux,yama
>>
>> but at this point I don't really care all that much.
>
> the comma separated list however is consistent with what is being
> done for default order

Yeah, and it would match the new CONFIG_LSM_ENABLE.

FWIW, it was tedious to type "lsm.enable" and "lsm.disable" over and
over when doing testing, so I almost prefer the comma separated list
at the end of the day. I'll ponder this a bit.

-Kees

-- 
Kees Cook
Pixel Security
