Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D7B567D918
	for <lwn-linux-doc@archive.lwn.net>; Mon,  4 Nov 2019 22:26:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730281AbfKDW0S (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 4 Nov 2019 17:26:18 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42372 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730483AbfKDVvX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Nov 2019 16:51:23 -0500
Received: by mail-pg1-f195.google.com with SMTP id s23so9012750pgo.9
        for <linux-doc@vger.kernel.org>; Mon, 04 Nov 2019 13:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=android.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=bHzFpby5nBvLQoa1A3N45Iv5pE3sE4p/UO4W7iuituU=;
        b=Pp8aTcTc4J8HQHJfK7XYOvTKX+0OBvRsnX5l3y4u4g4MM3j86RHYT5E3CyfwGjTx4M
         OY4am3V6P04tfgMJdWaiBA4U4MVXNNXBLNBBKKsjLvm6Py+danTKFeA58zni2EwrZJ4a
         LNM/Y81H3MGNqRtK9pfeV0H03aM+7nND2Zei+zqEbD1s4PqBPprHUisrBeteBubsbwSy
         TVQ544cT0wpbyLgolGEW1xWW2VpX+SzNMXEAx14Fcr5iUkFTIem+fgkabRMzppRp0uwa
         f1TaCzq6xMl1AGXBK5nQcB2Aq9iUTjOhumPtO956o84HKT+keZUKHTeZ+X7Z6JqxV9xJ
         DqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=bHzFpby5nBvLQoa1A3N45Iv5pE3sE4p/UO4W7iuituU=;
        b=VobT4QnYSTJzxP8YhmEIEoVyfiHx98hAUvzxayjR95MWotA3Mya6mES12YLxfw83OI
         XfXcaCo/AL4ze8EHZhHZ/PN8F2X9f/ngwArX3H4+HOZZLpcp4wzFFMHztmb4tDTo4/jj
         U9yvdMfrdHrHmihib16pMsXQCwvztpaVdMomPdldyAeAhGaUVvkHRmr+yyOWFFmfL6EO
         sa+uroiAutrxM1ikK7Nuy3Sz4B7e6I0x/4ZHWG7OzagXzwdvlKHHBBKxCtlmCZQ5Kau6
         W0SZHUReRTUJ3qwkO1FqZjukNnA2kuQlMtGPv1ChzhHhlhwYFaKOdtwWE+eGB6dQQvcf
         3WEw==
X-Gm-Message-State: APjAAAUflDjJbo8+afz45SEA6Atm0WyPnl0ECPg1EKcm/ae1Qs0GiB3t
        IKql5ZtPYRIBxtQe++Sj2F5zhA==
X-Google-Smtp-Source: APXvYqy8cbQrcNS2YZCm15LNXj84RCWobmcY3Yi0AKiVBFlHOjV+tLdHj1XjjIBLQcnlWN3fV+awgw==
X-Received: by 2002:a63:dc45:: with SMTP id f5mr32464004pgj.250.1572904282035;
        Mon, 04 Nov 2019 13:51:22 -0800 (PST)
Received: from nebulus.mtv.corp.google.com ([2620:15c:211:200:5404:91ba:59dc:9400])
        by smtp.googlemail.com with ESMTPSA id z7sm10567610pgk.10.2019.11.04.13.51.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2019 13:51:21 -0800 (PST)
Subject: Re: [PATCH v14 1/5] Add flags option to get xattr method paired to
 __vfs_getxattr
To:     Amir Goldstein <amir73il@gmail.com>,
        Andreas Dilger <adilger@dilger.ca>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, CIFS <linux-cifs@vger.kernel.org>,
        kernel-team@android.com, selinux@vger.kernel.org,
        Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Ext4 Developers List <linux-ext4@vger.kernel.org>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        overlayfs <linux-unionfs@vger.kernel.org>,
        Andreas Gruenbacher <agruenba@redhat.com>,
        ecryptfs@vger.kernel.org,
        LSM List <linux-security-module@vger.kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christoph Hellwig <hch@infradead.org>
References: <20191022204453.97058-1-salyzyn@android.com>
 <20191022204453.97058-2-salyzyn@android.com>
 <8CE5B6E8-DCB7-4F0B-91C1-48030947F585@dilger.ca>
 <CAOQ4uxis-oQSjKrtBDi-8BQ2M3ve3w8o-YVGRwWLnq+5JLUttA@mail.gmail.com>
From:   Mark Salyzyn <salyzyn@android.com>
Message-ID: <7b5f2964-10ce-021b-01f7-6b662bf0c09a@android.com>
Date:   Mon, 4 Nov 2019 13:51:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAOQ4uxis-oQSjKrtBDi-8BQ2M3ve3w8o-YVGRwWLnq+5JLUttA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/23/19 9:57 PM, Amir Goldstein wrote:
> [excessive CC list reduced]
>
> On Wed, Oct 23, 2019 at 11:07 AM Andreas Dilger via samba-technical
> <samba-technical@lists.samba.org> wrote:
>>
>> On Oct 22, 2019, at 2:44 PM, Mark Salyzyn <salyzyn@android.com> wrote:
>>> Replace arguments for get and set xattr methods, and __vfs_getxattr
>>> and __vfs_setaxtr functions with a reference to the following now
>>> common argument structure:
>>>
>>> struct xattr_gs_args {
>>>        struct dentry *dentry;
>>>        struct inode *inode;
>>>        const char *name;
>>>        union {
>>>                void *buffer;
>>>                const void *value;
>>>        };
>>>        size_t size;
>>>        int flags;
>>> };
>>> Mark,
>>>
>>> I do not see the first patch on fsdevel
>>> and I am confused from all the suggested APIs
>>> I recall Christoph's comment on v8 for not using xattr_gs_args
>>> and just adding flags to existing get() method.
>>> I agree to that comment.
>> As already responded, third (?) patch version was like that,
> The problem is that because of the waaay too long CC list, most revisions
> of the patch and discussion were bounced from fsdevel, most emails
> I did not get and cannot find in archives, so the discussion around
> them is not productive.
>
> Please resend patch to fsdevel discarding the auto added CC list
> of all fs maintainers.

git send-email is not my friend :-(

>> gregkh@
>> said it passed the limit for number of arguments, is looking a bit silly
> Well, you just matched get() to set() args list, so this is not a strong
> argument IMO.
>
>> (my paraphrase), and that it should be passed as a structure. Two others
>> agreed. We gained because both set and get use the same structure after
>> this change (this allows a simplified read-modify-write cycle).
> That sounds like a nice benefit if this was user API, but are there any
> kernel users that intend to make use of that read-modify-write cycle?
> I don't think so.
(one user)
>
>> We will need a quorum on this, 3 (structure) to 2 (flag) now (but really
>> basically between Greg and Christoph?). Coding style issue: Add a flag,
>> or switch to a common xattr argument  structure?
>>
> IIRC, Christoph was asking why the silly struct and not simply add flags
> (as did I). He probably did not see Greg's comments due to the list bounce
> issue. If I read your second hand description of Greg's reaction correctly,
> it doesn't sound so strong opinionated as well.
> Me, I can live with flags or struct - I don't care, but...
>
> Be prepared that if you are going ahead with struct you are going to
> suffer from bike shedding, which has already started and you will be
> instructed (just now) to also fix all the relevant and missing Documentation.
> If, on the other hand, you can get Greg and the rest to concede to adding
> flags arg and match get() arg list to set() arg list, you will have a much
> easier job and the patch line count, especially in fs code will be *much*
> smaller - just saying.

Respining back to the v4 version of the series incorporating some of the 
fixes on the way.

Automated testing in kernel not yet handled and will be noted in the 
respin.

> Thanks,
> Amir.

Mark

