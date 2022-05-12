Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC18AC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 12 May 2022 12:51:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238514AbiELMvL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 May 2022 08:51:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354127AbiELMu4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 May 2022 08:50:56 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F310DCFC
        for <linux-doc@vger.kernel.org>; Thu, 12 May 2022 05:50:40 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id x8so1081295pgr.4
        for <linux-doc@vger.kernel.org>; Thu, 12 May 2022 05:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=A0xOx0HJGPqe65kUT8EYAv7c6q9fmHkJFCQDDmRbELQ=;
        b=lwxhL4wAs6Qvzati4H2W524EGSAsQhuS3/nB5BZWZ4DEpD5RDkZvry5sMHYjaX/WEw
         y3U0PGPPxvMt6oD+WQwL4AHVAjGflqpa/Bt0K+pciJmSLHe+5NVj/LUGh9Dp1uTu01RQ
         znnBn8BAy0KGV9DBsyKUfoiT1Sy8QscSdPlY7DZUd03IdYvEkO6Y47GwahGKpBKZ4YS2
         oTFA9xVdwzp02a3nxDkp37gCPunfyYdIN3xquEjhbu1X9zZ+YpuOgWoeAIdpYVQZgq6F
         SqGFY/KIvGfMxFo6rKdQROw+56A0Hn0UjJNrM2h71EC59qap64VmDCAdMBoYbnUGbGLY
         +75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=A0xOx0HJGPqe65kUT8EYAv7c6q9fmHkJFCQDDmRbELQ=;
        b=lcO9zIqlxLBINJ9/MzG9ZK0JwXBYyEH/m+W7ch9Vgu+bJYfdxmsW3twdvcg88kFnoe
         muYVSpxhwR5MTqD2DdsO73AAAomlVbUnkw10bfsTyfOVPs75xqdzmxVSfkX5KqnJtILD
         JeMS3TO70+Nbl7KgQIZgTxNe4uFeuLUzmbZnIgUuLHSGLTU0V5RHxsXSPmaNrW/OswkW
         QOAF1g/bluOMeNcBGXEMq3cHrbVrlUvardCB85+hsbPqJN681EF/E1MFtAb6LT6hIxPd
         hqj+wRv6p77480Lmz7wMvwojTttHEu8pUE3Ftqt8RJLVPaUELCJNnccPRMEmeAuxw2r8
         CzIg==
X-Gm-Message-State: AOAM5325ZJK61Wc6FZfLGLr+v+IRP/Ak2CtWdlo4Lt7CfKGIt1+rwKdV
        18YtbMd62bgWg+VTX/yr4V648A==
X-Google-Smtp-Source: ABdhPJzD/auBmfoLWNxs2s5aGR2dmgOFqGv/Z5slJeRepfjx/hj1IpceD0OaHmBJGL5a2oxFasebMg==
X-Received: by 2002:a63:4549:0:b0:3db:5130:d269 with SMTP id u9-20020a634549000000b003db5130d269mr4372076pgk.101.1652359840481;
        Thu, 12 May 2022 05:50:40 -0700 (PDT)
Received: from localhost ([139.177.225.250])
        by smtp.gmail.com with ESMTPSA id i21-20020a170902e49500b0015e8d4eb20dsm3758677ple.87.2022.05.12.05.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 05:50:40 -0700 (PDT)
Date:   Thu, 12 May 2022 20:50:27 +0800
From:   Muchun Song <songmuchun@bytedance.com>
To:     David Hildenbrand <david@redhat.com>
Cc:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, masahiroy@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        duanxiongchun@bytedance.com, smuchun@gmail.com
Subject: Re: [PATCH v10 2/4] mm: memory_hotplug: override memmap_on_memory
 when hugetlb_free_vmemmap=on
Message-ID: <Yn0Ck5isxx4ghQi6@FVFYT0MHHV2J.usts.net>
References: <20220509062703.64249-1-songmuchun@bytedance.com>
 <20220509062703.64249-3-songmuchun@bytedance.com>
 <ebffd794-697b-9bf1-f41b-4b2d52c100fc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebffd794-697b-9bf1-f41b-4b2d52c100fc@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 12, 2022 at 09:36:15AM +0200, David Hildenbrand wrote:
> On 09.05.22 08:27, Muchun Song wrote:
> > Optimizing HugeTLB vmemmap pages is not compatible with allocating memmap on
> > hot added memory. If "hugetlb_free_vmemmap=on" and
> > memory_hotplug.memmap_on_memory" are both passed on the kernel command line,
> > optimizing hugetlb pages takes precedence. 
> 
> Why?
>

Because both two features are not compatible since hugetlb_free_vmemmap cannot
optimize the vmemmap pages allocated from alternative allocator (when
memory_hotplug.memmap_on_memory=1). So when the feature of hugetlb_free_vmemmap
is introduced, I made hugetlb_free_vmemmap take precedence.  BTW, I have a plan
to remove this restriction, I'll post it out ASAP.

Thanks.

