Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 33F387D917
	for <lwn-linux-doc@archive.lwn.net>; Tue,  5 Nov 2019 15:21:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389783AbfKEPUN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 5 Nov 2019 10:20:13 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36900 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389386AbfKEPUN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Nov 2019 10:20:13 -0500
Received: by mail-pg1-f194.google.com with SMTP id z24so9886599pgu.4
        for <linux-doc@vger.kernel.org>; Tue, 05 Nov 2019 07:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=android.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=4knTl1jsJDuMainkSHY+5ZG6p+2SnQH1xWJ5/mQLZcc=;
        b=DjIPeMXW32l5fRqhcF/hEw9KGRzv0na04clJGjRNUHPMDnhcD3TsmsKSwyjh+w/6sQ
         PTAqM9sTWDUSi6tZrUkRd13QgbMTNVRPQlqdW+1hhLVpk9FmJHl8J6cSMn/Mway2kCWz
         MJm6ZtryFrevQ+LCFRayk+JyZnFlnyxIgQZD2+1CxTk2zLzkpHX0WenqGSA5OAR0vNLJ
         vGJ8Nob1RDlf/duriZT/QO02e/vLPDCDiLWW63O8ik1SD8GufmRrU1jjAolUO1dJiToY
         jI2ZBWJGQxv6FDn+WE71NE1f+THhy/OGWe2P+plmcPg7d6M/DmrAToeVoM6Dzo/qyyJR
         LmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=4knTl1jsJDuMainkSHY+5ZG6p+2SnQH1xWJ5/mQLZcc=;
        b=Cr+Px6GyRQZc+AkNxSc8RHdpvfsPPMrqfOIm7UilAb1xJ6CFmMMZrxDHwbhwgcAHfL
         Rbw0ynXsTKalXxzd8WgCQaeKWooFtFiZ4Z5KY9DVpSlIPMU0tr0dxd+/s9ul2LBq3pdE
         lU9+e/Lk3bIjFSA4RYcJ8Iplsed/przfTtlXjEQIKhxNfvf1KqdYxwnMx5iQNEVU7oZd
         m2uFnQ6Y+T3X8v3t1XHUT9PODPwU0qbPPJuyJd5+A7hgk8SDzsJidthgs89eU0pZDjvP
         i1LG7FskG7kv7RFKtxhNNrJwWdPsT29Gv5DO6Ln5uuy2rP4UpWBk0tAZPsPrm9nN7nrN
         6bpA==
X-Gm-Message-State: APjAAAWJguVv2iPiLf9okAiNTF7noibcYwtHKdBgtBXrR/38m8v9VsBk
        nax7RTiijz3BS4LApu521eZxxgmZamCKjg==
X-Google-Smtp-Source: APXvYqwngaEbIGV2C3ll19WybcLW+UHBVqY0ruQKQmcGOlj8LAdvhzyLZLrbbYkv25c+m4rL0C7yWw==
X-Received: by 2002:a62:1dc6:: with SMTP id d189mr20322264pfd.100.1572967212046;
        Tue, 05 Nov 2019 07:20:12 -0800 (PST)
Received: from nebulus.mtv.corp.google.com ([2620:15c:211:200:5404:91ba:59dc:9400])
        by smtp.googlemail.com with ESMTPSA id h8sm149633pjp.1.2019.11.05.07.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2019 07:20:11 -0800 (PST)
Subject: Re: [PATCH v15 0/4] overlayfs override_creds=off & nested get xattr
 fix
To:     Amir Goldstein <amir73il@gmail.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        kernel-team@android.com, Miklos Szeredi <miklos@szeredi.hu>,
        Jonathan Corbet <corbet@lwn.net>,
        Vivek Goyal <vgoyal@redhat.com>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        overlayfs <linux-unionfs@vger.kernel.org>,
        linux-doc@vger.kernel.org
References: <20191104215253.141818-1-salyzyn@android.com>
 <CAOQ4uxhoozGgxYmucFpFx8N=b4x9H3sfp60TNzf0dmU9eQi2UQ@mail.gmail.com>
From:   Mark Salyzyn <salyzyn@android.com>
Message-ID: <97c4108f-3a9b-e58b-56e0-dfe2642cc1f5@android.com>
Date:   Tue, 5 Nov 2019 07:20:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAOQ4uxhoozGgxYmucFpFx8N=b4x9H3sfp60TNzf0dmU9eQi2UQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/4/19 11:56 PM, Amir Goldstein wrote:
> On Mon, Nov 4, 2019 at 11:53 PM Mark Salyzyn <salyzyn@android.com> wrote:
>> Patch series:
>>
>> Mark Salyzyn (4):
>>    Add flags option to get xattr method paired to __vfs_getxattr
> Sigh.. did not get to fsdevel (again...) I already told you several times
> that you need to use a shorter CC list.

This is a direct result of the _required_ scripts/get_maintainer.pl 
logic, I am not going to override it for first send. I was going to 
forward to fsdevel after the messages settled, I am still waiting for 
1/4 to land on lore before continuing.

The first patch in the series needs to get in before the others. I was 
told to send the first one individually because the series has so many 
recipients and stakeholders, and <crickets> because no on could see the 
reason for the patch once it was all by itself. So I rejoined the set so 
they could see the reason for the first patch.

If only the first patch in the series that added the flag argument got 
in (somewhere), then the overlayfs portion would be much easier to handle.

>>    overlayfs: handle XATTR_NOSECURITY flag for get xattr method
>>    overlayfs: internal getxattr operations without sepolicy checking
>>    overlayfs: override_creds=off option bypass creator_cred
> It would be better for review IMO if you rebase your series on top of
> git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/vfs.git ovl-unpriv
Will do, send it only to fsdevel, other recipients? What do I do with 
get_maintainer.pl? The first patch in the series is noisy, I am getting 
more and more uncomfortable sending it to the list as it looks more and 
more like spam.
> 1. internal getxattr patch would be a one liner change to ovl_own_getxattr()
> 2. The documentation of override_creds would be much more
> meaningful if it used the overlay permission model terminology
> that Miklos added in his patch set and extend it
>
> Thanks,
> Amir.

-- Mark

