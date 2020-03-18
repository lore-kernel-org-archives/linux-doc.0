Return-Path: <SRS0=afVm=5D=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5295DC5ACD6
	for <linux-doc@archiver.kernel.org>; Wed, 18 Mar 2020 13:56:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1E3C420767
	for <linux-doc@archiver.kernel.org>; Wed, 18 Mar 2020 13:56:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZaKOiB5P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbgCRN4k (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Mar 2020 09:56:40 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:49307 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727000AbgCRN4g (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Mar 2020 09:56:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584539795;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UXRpaQxYrO/gvKAeP6md3e48aYoFmEEQesPUZqe43ME=;
        b=ZaKOiB5P+N12ZoHn3ci35b7mg9iAv/fiYGILl9VnA6SShououLoROCorCbpVCWrkjVf1VJ
        9NQwA4jUdKtJwQJAKyMOWL092oXhb+TciB8mGvRyvDbj6N6+RP6IyK/os4Qaa5llIpJyRT
        9K8OMrcBhvhIKIpS/u4VvEPQltGuN28=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-gdtd2346PjS99rc8AhmM3Q-1; Wed, 18 Mar 2020 09:56:26 -0400
X-MC-Unique: gdtd2346PjS99rc8AhmM3Q-1
Received: by mail-wm1-f72.google.com with SMTP id n25so1077861wmi.5
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2020 06:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UXRpaQxYrO/gvKAeP6md3e48aYoFmEEQesPUZqe43ME=;
        b=KXQ9eNzOiuyHGEo8JXPlJYZhzrg6GhTBe6v/lxCX18507rwZOeL3lLCGLAtd2c9LMX
         bHTxtrBx8BCByafvHepT/w/rueEHsjyppgGP924lLktPa5cztN59WMElx8+t7vQKAvft
         W8wxBSMkmjUuZmuph0fjhx/8uUTL6Em/Y0OA1b7gIbUlPUrSLA9nsIy4fBpjPU6ymFT2
         DsS1kPFhtxoBuYDX3cFdFSQLbAUoq2ZisQtvxj/SxOJ5wbuTsurUByUKqmJBHz2iLZYu
         T0UYhltLUjjOOGzZl3qGT53YhN7jvJkk5IQGxphfuknZaUQ4qh2ZllgWUg2L+cTqjGTW
         IfZA==
X-Gm-Message-State: ANhLgQ0WZjOyBuCmKR6rEoajmbItQNr3PG3iJSuHuVvKVvGUuAMyL9D5
        Orb55a7oTt6dDvg+PFeeKshD4vHWmOiIjQoIVRWTIbP6GrC+Q/wt2VBQH2+nZB/WdrMmbMxVqUZ
        eSWP9jvISG3h2iHfn3AMg
X-Received: by 2002:a7b:c1da:: with SMTP id a26mr5439585wmj.45.1584539785327;
        Wed, 18 Mar 2020 06:56:25 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtb1764SLhxHnGxs/fPAE7qJ0588Bl0/gSd2uZQ4GBTE49dIlkXOgxGNoiqRP7YGeBsiqCsow==
X-Received: by 2002:a7b:c1da:: with SMTP id a26mr5439564wmj.45.1584539785096;
        Wed, 18 Mar 2020 06:56:25 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id w67sm3982303wmb.41.2020.03.18.06.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2020 06:56:24 -0700 (PDT)
Subject: Re: [PATCH v12 03/10] firmware: Rename FW_OPT_NOFALLBACK to
 FW_OPT_NOFALLBACK_SYSFS
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Lutomirski <luto@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Peter Jones <pjones@redhat.com>,
        Dave Olsthoorn <dave@bewaar.me>, x86@kernel.org,
        platform-driver-x86@vger.kernel.org, linux-efi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20200115163554.101315-1-hdegoede@redhat.com>
 <20200115163554.101315-4-hdegoede@redhat.com>
 <20200124085751.GA2957916@kroah.com>
 <d25d5d6e-0348-b19f-539e-048cfa70d6a6@redhat.com>
 <20200318132741.GA2794545@kroah.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8fa336bd-339f-40e0-08fe-e6b968736679@redhat.com>
Date:   Wed, 18 Mar 2020 14:56:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200318132741.GA2794545@kroah.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Greg,

On 3/18/20 2:27 PM, Greg Kroah-Hartman wrote:
> On Fri, Jan 24, 2020 at 10:16:48AM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 1/24/20 9:57 AM, Greg Kroah-Hartman wrote:
>>> On Wed, Jan 15, 2020 at 05:35:47PM +0100, Hans de Goede wrote:
>>>> This is a preparation patch for adding a new platform fallback mechanism,
>>>> which will have its own enable/disable FW_OPT_xxx option.
>>>>
>>>> Note this also fixes a typo in one of the re-wordwrapped comments:
>>>> enfoce -> enforce.
>>>>
>>>> Acked-by: Luis Chamberlain <mcgrof@kernel.org>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>
>>> I've taken this in my tree for now in a quest to try to get others to
>>> pay attention to this series...
>>
>> Thank you.
>>
>> As mentioned before I believe that this series is ready for merging now.
>>
>> Andy Lutomirski had one last change request for v12 of the second
>> patch in the series, specifically to replace the loop searching for
>> the prefix with a memem, but the kernel does not have memmem.
>>
>> Andy, are you ok with v12 as is, given that we don't have memmem ?
>>
>> Assuming Andy is ok with v12 as is, then to merge this we need
>> to probably wait for 5.6-rc1 and then have the x86/efi folks do
>> an immutable branch with the first 2 patches of the series.
> 
> Did this every happen?  Or do I need to dump this all into my tree?

Ard has done a immutable branch with just the 2 patches:

https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git/tag/?h=stable-shared-branch-for-driver-tree

I did not see any mails about this being pulled / merged, but I just
checked and this has landed in the tip tree 10 days ago:

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/log/include/linux/efi.h?h=efi/core

So if you merge the stable-shared-branch-for-driver-tree tag and then
merge patches 3-8 of this series (or rather 4-8 since you already
merged 3 IIRC) that would be great.

Regards,

Hans

