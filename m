Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 40D287D08E
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Dec 2018 09:20:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727209AbeLEJUk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Dec 2018 04:20:40 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:46331 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726861AbeLEJUk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Dec 2018 04:20:40 -0500
Received: by mail-ed1-f68.google.com with SMTP id o10so16347787edt.13
        for <linux-doc@vger.kernel.org>; Wed, 05 Dec 2018 01:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QPY1Dt3TFv6ZmwskTptwDN+DtHfkTKqWA3Kzr72JYZw=;
        b=s7n5x2SrfTggrcr0DCFpeO+zgbTF+H9XyMpdqQOk97GShaqO0e9sAMayMWS1w8BzyQ
         hSOr94uJlqRWDc0VpdG0Ar8HTTpmRw2oPxE8q/RhWEOErP36IbltD6kabsqao0eLxsLX
         jCln5KxPNuMbyDdwBMJdrPlRpYsm1pgEDADq/8Kj2zK91UiDPl90qr1vXrNFDi41s+tn
         OdwQrchsB2JkD8VvzLY+AwDpi89jwTWAfWgU3YfWVIeuCvtPpxftlNYrk63gMM0OsUhG
         JUf6K4z2KTKcvt254Z3WyTm6vRkZdtXNMWInUVuT84rZt42MoMdz11XFLOa5S0BrD/2i
         UvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=QPY1Dt3TFv6ZmwskTptwDN+DtHfkTKqWA3Kzr72JYZw=;
        b=CaKQxCN6RYVm+PJ8VVi1k5qTYMfAa1fCO2Nf7Imv9RMxlmuY48tFBJIyhC20qMZO3i
         W2MGpSsXDFpvB4mE7AR8jBU2p6ec7kDLt0iAk89JAg+IqW89YZgFNlJ5az239JjBbC24
         FYjn3M+FcfGBhvtz86cQDU1NsuLlHL0CYrxJeOBaqSyiM9UrxbLqVrLBLgmr3EP+tvbg
         cY0ocQAn8TZG+8UYkSFYZ2L4DBeVFibuHRVZe+j9ul64LeB8aAWH/E0051EB4aZBcV72
         ty2Jt9QMXg5ed2QOGeNyMp/4eCTjg40xEfzy85h8SlgVr7mH0RImE/w+UMz6LRPHE32N
         SlJg==
X-Gm-Message-State: AA+aEWYgcsNjTYoAnelFkmmQOzfYFH4LKqhIOocGxwqyfgc3lGkP09TK
        WOVgkDuv+Mwgij95QWAzhe4=
X-Google-Smtp-Source: AFSGD/VlXdXWUfxPtz+XGno+uR9KeDHUBTdM/JIpoP/xAeuoJA5sutHqdiUOSYTmH1zf+NrwYCr40A==
X-Received: by 2002:a17:906:619a:: with SMTP id q26-v6mr18456111ejk.230.1544001638648;
        Wed, 05 Dec 2018 01:20:38 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id q50sm5594052edd.66.2018.12.05.01.20.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Dec 2018 01:20:37 -0800 (PST)
Date:   Wed, 5 Dec 2018 09:20:37 +0000
From:   Wei Yang <richard.weiyang@gmail.com>
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     David Hildenbrand <david@redhat.com>,
        Wei Yang <richard.weiyang@gmail.com>, mhocko@suse.com,
        osalvador@suse.de, akpm@linux-foundation.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] admin-guide/memory-hotplug.rst: remove locking
 internal part from admin-guide
Message-ID: <20181205092037.ks2uxvfasgqbd2oz@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20181205023426.24029-1-richard.weiyang@gmail.com>
 <c4f2a712-391b-60b9-64fa-bc8b6bde9994@redhat.com>
 <20181205083012.GA19181@rapoport-lnx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181205083012.GA19181@rapoport-lnx>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 05, 2018 at 10:30:13AM +0200, Mike Rapoport wrote:
>On Wed, Dec 05, 2018 at 09:03:24AM +0100, David Hildenbrand wrote:
>> On 05.12.18 03:34, Wei Yang wrote:
>> > Locking Internal section exists in core-api documentation, which is more
>> > suitable for this.
>> > 
>> > This patch removes the duplication part here.
>> > 
>> > Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
>> > ---
>> >  Documentation/admin-guide/mm/memory-hotplug.rst | 40 -------------------------
>> >  1 file changed, 40 deletions(-)
>> > 
>> > diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
>> > index 5c4432c96c4b..241f4ce1e387 100644
>> > --- a/Documentation/admin-guide/mm/memory-hotplug.rst
>> > +++ b/Documentation/admin-guide/mm/memory-hotplug.rst
>> > @@ -392,46 +392,6 @@ Need more implementation yet....
>> >   - Notification completion of remove works by OS to firmware.
>> >   - Guard from remove if not yet.
>
>[ ... ]
>
>> >  Future Work
>> >  ===========
>> >  
>> > 
>> 
>> I reported this yesterday to Jonathan and Mike
>> 
>> https://lkml.org/lkml/2018/12/3/340
>
>Somehow I've missed it...
> 
>> Anyhow
>> 
>> Reviewed-by: David Hildenbrand <david@redhat.com>
>
>Acked-by: Mike Rapoport <rppt@linux.ibm.com>
>

Thanks :-)

>> 
>> -- 
>> 
>> Thanks,
>> 
>> David / dhildenb
>> 
>
>-- 
>Sincerely yours,
>Mike.

-- 
Wei Yang
Help you, Help me
