Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C6DCCA482
	for <linux-doc@archiver.kernel.org>; Tue, 19 Jul 2022 21:18:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237135AbiGSVSm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Jul 2022 17:18:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234322AbiGSVSl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jul 2022 17:18:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6770B5F991
        for <linux-doc@vger.kernel.org>; Tue, 19 Jul 2022 14:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658265519;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qQ4UdihwA3u3irfHx6eGnZO09RoO1lQsj+Krqj+1YXg=;
        b=B/JdtpHQWtKdfD+LvEB+aT/uqawBNZCOUx0Edeto+TFfdEW2Jr4SoyfjiPvbSpSJBS0CFV
        ydKfnm356G+0QfFDLbQUODC3H7Cbx+ye2qe+RSOyxUaTEGDeTPv7kDXD1CKwASVEfElpU7
        nkOrYqjuBsslp+s5Ga5JZWFPX1MTQDs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-HaVU7ymNO2m5A8QrbZ-zYw-1; Tue, 19 Jul 2022 17:18:38 -0400
X-MC-Unique: HaVU7ymNO2m5A8QrbZ-zYw-1
Received: by mail-qk1-f200.google.com with SMTP id bi37-20020a05620a31a500b006b5ef0afedaso4999433qkb.22
        for <linux-doc@vger.kernel.org>; Tue, 19 Jul 2022 14:18:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qQ4UdihwA3u3irfHx6eGnZO09RoO1lQsj+Krqj+1YXg=;
        b=zflsNfs23U23grgdtvCDtu979c+dMxenJFewc6HKobE9xf1p1L42jTIdj2M9OtQ5r8
         uRbrLdK/9uTZ1IiWNqFXR4Pwsy1lpSZ1gBQykh48i3SJ5aGcWYuxLrzraDtHCjOxPsPR
         mOOw+kBqc+gqw8eL0wJKReK6mS5ZQaMlCrn+v3zMaDBJ4/waT3I3D+VPZKqTWSJl446t
         7uYFG8u7/cJb/9iw733KU/w7/PH/72TFjmkWyejHJNqHifGhD3eSarKhAXDE/mvomvSc
         XGHwlaRP+MxpSMHoEjzXM9OWr05aI1YZI5ULwGbQ9g1vqJ0ylvy4l2a+5ixlr0Erx5W4
         537w==
X-Gm-Message-State: AJIora9+vbWTFodxF6N1/tDPCif5Upqm6C/vX/0r31zmjkREkOmA0jPF
        8FuZGD1OW0IrZbeS72K+X9Yyucq0+z0IscqjxRu/K+6JwCbf0LMlktN122AfUm6vmrG6xPZrkvF
        zP/gugAArl+JQupuReSTj
X-Received: by 2002:a05:620a:469f:b0:6b6:74c:6b10 with SMTP id bq31-20020a05620a469f00b006b6074c6b10mr2002416qkb.80.1658265517812;
        Tue, 19 Jul 2022 14:18:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1solk9LbHq5kw8KaBY3e4msSDmv+aW7vjooY/eq2+EXMQV5yRa7rp8kr6cJ8pNcJb3bUwoNpA==
X-Received: by 2002:a05:620a:469f:b0:6b6:74c:6b10 with SMTP id bq31-20020a05620a469f00b006b6074c6b10mr2002393qkb.80.1658265517591;
        Tue, 19 Jul 2022 14:18:37 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-37-74-12-30-48.dsl.bell.ca. [74.12.30.48])
        by smtp.gmail.com with ESMTPSA id s10-20020ac85eca000000b0031ede43512bsm8530570qtx.44.2022.07.19.14.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 14:18:37 -0700 (PDT)
Date:   Tue, 19 Jul 2022 17:18:34 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Axel Rasmussen <axelrasmussen@google.com>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "Dmitry V . Levin" <ldv@altlinux.org>,
        Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>,
        Hugh Dickins <hughd@google.com>, Jan Kara <jack@suse.cz>,
        Jonathan Corbet <corbet@lwn.net>,
        Mel Gorman <mgorman@techsingularity.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@kernel.org>, Nadav Amit <namit@vmware.com>,
        Shuah Khan <shuah@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        zhangyi <yi.zhang@huawei.com>, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 2/5] userfaultfd: add /dev/userfaultfd for fine
 grained access control
Message-ID: <YtcfqpmpkVXz/Frl@xz-m1.local>
References: <20220719195628.3415852-1-axelrasmussen@google.com>
 <20220719195628.3415852-3-axelrasmussen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220719195628.3415852-3-axelrasmussen@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 19, 2022 at 12:56:25PM -0700, Axel Rasmussen wrote:
> Historically, it has been shown that intercepting kernel faults with
> userfaultfd (thereby forcing the kernel to wait for an arbitrary amount
> of time) can be exploited, or at least can make some kinds of exploits
> easier. So, in 37cd0575b8 "userfaultfd: add UFFD_USER_MODE_ONLY" we
> changed things so, in order for kernel faults to be handled by
> userfaultfd, either the process needs CAP_SYS_PTRACE, or this sysctl
> must be configured so that any unprivileged user can do it.
> 
> In a typical implementation of a hypervisor with live migration (take
> QEMU/KVM as one such example), we do indeed need to be able to handle
> kernel faults. But, both options above are less than ideal:
> 
> - Toggling the sysctl increases attack surface by allowing any
>   unprivileged user to do it.
> 
> - Granting the live migration process CAP_SYS_PTRACE gives it this
>   ability, but *also* the ability to "observe and control the
>   execution of another process [...], and examine and change [its]
>   memory and registers" (from ptrace(2)). This isn't something we need
>   or want to be able to do, so granting this permission violates the
>   "principle of least privilege".
> 
> This is all a long winded way to say: we want a more fine-grained way to
> grant access to userfaultfd, without granting other additional
> permissions at the same time.
> 
> To achieve this, add a /dev/userfaultfd misc device. This device
> provides an alternative to the userfaultfd(2) syscall for the creation
> of new userfaultfds. The idea is, any userfaultfds created this way will
> be able to handle kernel faults, without the caller having any special
> capabilities. Access to this mechanism is instead restricted using e.g.
> standard filesystem permissions.
> 
> Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>

Thanks, this looks much better.

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

