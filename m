Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 406EBCCA47F
	for <linux-doc@archiver.kernel.org>; Tue, 19 Jul 2022 21:23:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238436AbiGSVXu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Jul 2022 17:23:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238526AbiGSVXt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jul 2022 17:23:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E39FA61B31
        for <linux-doc@vger.kernel.org>; Tue, 19 Jul 2022 14:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658265825;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=V5XmcYFINzq7Zfp1ZH6JYE8dP3xg797dDa/g7sWMt+4=;
        b=curO7x0TQaPJsTinsezrxVzv8ZBPcAGzAGvXa4mxPkHQsJufkQ6vy9GLrKXk9S3THFwMzL
        oqrD0iI5Pr0LuFjmBQVq/Ashuol58w2lSr2SNNRdrJJ6IAFFeuRBKYDScKfadm7+R0Gxwb
        q9QvZ7ApRfPm6munrrB845UWnd4cVMY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-0oTS9S5NOHCag8Gz8AOd5w-1; Tue, 19 Jul 2022 17:23:44 -0400
X-MC-Unique: 0oTS9S5NOHCag8Gz8AOd5w-1
Received: by mail-qv1-f70.google.com with SMTP id od5-20020a0562142f0500b00473838e0feeso8082390qvb.9
        for <linux-doc@vger.kernel.org>; Tue, 19 Jul 2022 14:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V5XmcYFINzq7Zfp1ZH6JYE8dP3xg797dDa/g7sWMt+4=;
        b=yNCMA+/xNnN0KeL8HLuuBXsr+FeNU6YmBZuCX3P6Vm0AIlGCNzNhd5KOWqXvV+ec+h
         3dp6RjvdFNMUIpL8GHeA3aiof27awehJF9A6mGKTe6ZjM2EsbHGdJHknMKfimswL3okV
         llbI4xwS5KiVLUNquuI6jRDHRpL4RCBanTSkLUzkmC8ZIVavJFjnIed5Okiu+n7iS9t9
         HfVRVX7pujOrWREWjLUDaZcQlUHxLRyzxbjbJkISexofu6aayP2fis8dLrLZ3j4y7Cjl
         Z3DPL0XvS+pdnrffeAb4/9363WMfboaJC+8DrExlASzMQjrMqt8ekfF91IDmyHsgPjrh
         PQ7w==
X-Gm-Message-State: AJIora+BXnV0xu2+x1SHTvHzgfk6zm0w6iC2mCuXUro9Gyml4KqgCO1F
        3dB/GWHMpyQGZSCEt7DjUaf5+61abP1l65qtceNUAJWs2WAKbLtUks+Qjwkp6g8n15HAT+lkU6M
        9Dfr5sr9+lJB+Y6y9Y4L0
X-Received: by 2002:a05:6214:761:b0:472:f5f3:5139 with SMTP id f1-20020a056214076100b00472f5f35139mr26406578qvz.48.1658265824300;
        Tue, 19 Jul 2022 14:23:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uD5oB/LS6Ijqi8ckx7ZKbBD1V1rO23/Qvo6+97DahMzdhsOQVRGFH0eTyNrHtcanbtwn2H7A==
X-Received: by 2002:a05:6214:761:b0:472:f5f3:5139 with SMTP id f1-20020a056214076100b00472f5f35139mr26406569qvz.48.1658265824116;
        Tue, 19 Jul 2022 14:23:44 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-37-74-12-30-48.dsl.bell.ca. [74.12.30.48])
        by smtp.gmail.com with ESMTPSA id s5-20020a05620a0bc500b006b555509398sm15545231qki.136.2022.07.19.14.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 14:23:43 -0700 (PDT)
Date:   Tue, 19 Jul 2022 17:23:41 -0400
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
Subject: Re: [PATCH v4 4/5] userfaultfd: update documentation to describe
 /dev/userfaultfd
Message-ID: <Ytcg3Q5lcJcajpPI@xz-m1.local>
References: <20220719195628.3415852-1-axelrasmussen@google.com>
 <20220719195628.3415852-5-axelrasmussen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220719195628.3415852-5-axelrasmussen@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 19, 2022 at 12:56:27PM -0700, Axel Rasmussen wrote:
> Explain the different ways to create a new userfaultfd, and how access
> control works for each way.
> 
> Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

