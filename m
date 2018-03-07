Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1391D7E688
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Mar 2018 16:53:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934121AbeCGQxD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 7 Mar 2018 11:53:03 -0500
Received: from mail-it0-f68.google.com ([209.85.214.68]:56019 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934120AbeCGQvk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Mar 2018 11:51:40 -0500
Received: by mail-it0-f68.google.com with SMTP id n136so1555102itg.5
        for <linux-doc@vger.kernel.org>; Wed, 07 Mar 2018 08:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xsQ1lFI+l1KEpm1Fl0Qcp8heR18ZU4r7mzeNrvr+hkM=;
        b=F1aKnV4A2n5Hvd7c/k3LweCZGmW8303NKccSLZbnnRo2h/fCeZuvd3GDH7v5YgbY2D
         U8cJVM0PFYbPGBMJixCEruiEzNLCsSBrP0MjlpO7m9DtRG7Dfb55bTgKHbEtCjmAQXMM
         BG5yrTgqSjgc0xo7wZhN5oxt00GrfALU4TfsqxD+TtO0Kt1/QboPr4i30uni5HIrXg/q
         jU/Q/zANWPonpThnvRtAPPfE6YADG8EdsTmFWxCseiGmdx301tXxbFN6rD56F8HaAGw1
         PtvXv/UWvVHF70ekV4nRO7SDdia+XDjTxy8lSo6ranBxwc1Jwraecd6oyiRq+MG0whQq
         0/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xsQ1lFI+l1KEpm1Fl0Qcp8heR18ZU4r7mzeNrvr+hkM=;
        b=EypgLOkah8KDIzbbrlfAC1+4VuV2xDmtaj6EkK+RYCVf5IalRwELLu5BK6V8shNuAC
         pZunqsT+klxIeBO2h1ZIQdNsRWMMfGQcnihbw2s/algs0Yx/Yjx82Rs4PGHQDVB0Kh0X
         bGCllZKkEOspIsEOokiTMf7v1HxwcoEHqEhULIFWhLFafKF+Pin2sBfIE6LZBT/ICpPH
         92/SNf3aRGds5tznxtI7hgoxWyje3zzy+faoM+H414/5NvAxNQ2Z9UkZKsIJv3oITUK/
         9R94cACpf8wF3Dm7bPxjE5vBPAIxb/STomaRhwalXnIg8pZ/mgg+GkbgEjmPUOgtfRoN
         5BVQ==
X-Gm-Message-State: AElRT7Eani+nVV6zk92AhWvPqelgnMyd+X2QNp4W5GeCEYW8ARFtYPW7
        pN9h4aXPbXSLwR6jufGwoBmFog==
X-Google-Smtp-Source: AG47ELs2oid/YXiQJp9xJmoEVl2B1hEe7cdLuOvnCB4WliMVcjBgy/hjJ5JEqiZt1zB9770TqlTfOQ==
X-Received: by 10.36.88.5 with SMTP id f5mr23611272itb.63.1520441499321;
        Wed, 07 Mar 2018 08:51:39 -0800 (PST)
Received: from [192.168.42.60] ([172.58.139.197])
        by smtp.googlemail.com with ESMTPSA id h63sm9127388ith.40.2018.03.07.08.51.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Mar 2018 08:51:38 -0800 (PST)
Subject: Re: [PATCH v3 15/15] selinux: delay sid population for rootfs till
 init is complete
To:     Stephen Smalley <sds@tycho.nsa.gov>,
        Taras Kondratiuk <takondra@cisco.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        James McMechan <james.w.mcmechan@gmail.com>
Cc:     initramfs@vger.kernel.org, Victor Kamensky <kamensky@cisco.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, xe-linux-external@cisco.com,
        Paul Moore <paul@paul-moore.com>,
        Eric Paris <eparis@parisplace.org>
References: <1518813234-5874-1-git-send-email-takondra@cisco.com>
 <1518813234-5874-19-git-send-email-takondra@cisco.com>
 <1519152994.14218.15.camel@tycho.nsa.gov>
From:   Rob Landley <rob@landley.net>
Message-ID: <d23913a5-2a18-4d2a-60ae-bfa1ba8aaa0c@landley.net>
Date:   Wed, 7 Mar 2018 10:51:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1519152994.14218.15.camel@tycho.nsa.gov>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 02/20/2018 12:56 PM, Stephen Smalley wrote:
> On Fri, 2018-02-16 at 20:33 +0000, Taras Kondratiuk wrote:
>> From: Victor Kamensky <kamensky@cisco.com>
>>
>> With initramfs cpio format that supports extended attributes
>> we need to skip sid population on sys_lsetxattr call from
>> initramfs for rootfs if security server is not initialized yet.
>>
>> Otherwise callback in selinux_inode_post_setxattr will try to
>> translate give security.selinux label into sid context and since
>> security server is not available yet inode will receive default
>> sid (typically kernel_t). Note that in the same time proper
>> label will be stored in inode xattrs. Later, since inode sid
>> would be already populated system will never look back at
>> actual xattrs. But if we skip sid population for rootfs and
>> we have policy that direct use of xattrs for rootfs, proper
>> sid will be filled in from extended attributes one node is
>> accessed and server is initialized.
>>
>> Note new DELAYAFTERINIT_MNT super block flag is introduced
>> to only mark rootfs for such behavior. For other types of
>> tmpfs original logic is still used.
> 
> (cc selinux maintainers)
> 
> Wondering if we shouldn't just do this always, for all filesystem
> types.  Also, I think this should likely also be done in
> selinux_inode_setsecurity() for consistency.

I don't understand what selinux thinks it's doing here.

Initramfs is special because it's populated early, ideally early enough drivers
can load their firmware out of it. This is guaranteed to be before any processes
have launched, before any other filesystems have been mounted. I'm surprised
selinux is trying to do anything this early because A) what is there for it to
do, B) where did it get a ruleset?

This isn't really a mount flag, this is a "the selinux subsystem isn't
functionally initialized yet" flag. We haven't launched init. In a modular
system the module probably isn't loaded. There are no processes, and the only
files anywhere are the ones we're in the process of extracting. What's there
fore selinux to do?

When a filesystem is mounted, none of these cached selinux "we already looked at
the xattrs" inode fields are populated yet, correct? It can figure that out when
something accesses the file and do it then, so the point is _not_ doing this now
and thus not cacheing the wrong info. That's what the mount flag is doing,
telling selinux "not yet". So why does selinux not already _know_ "not yet"?

Why doesn't load_policy flush the cache of the old default contexts? What
happens if you mount an ext2 root and then init reads a dozen files before it
gets to the load_policy? Do those doesn't files have bad default contexts
forever now?

Where does the selinux ruleset come from during the cpio extract? Was it
hardwired into the driver? It certainly didn't come out of a file, and it wasn't
a process that loaded it. Why is selinux trying to evaluate and cache the
security context of files before it has any rules? (It has xattr annotations,
but they have no _meaning_ without rules...?

Confused,

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
