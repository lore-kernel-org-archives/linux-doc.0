Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D4CC433F5
	for <linux-doc@archiver.kernel.org>; Fri,  1 Apr 2022 21:51:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351640AbiDAVxf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 1 Apr 2022 17:53:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345926AbiDAVxe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Apr 2022 17:53:34 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEAB821FC5D
        for <linux-doc@vger.kernel.org>; Fri,  1 Apr 2022 14:51:43 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id d65so3207976qke.5
        for <linux-doc@vger.kernel.org>; Fri, 01 Apr 2022 14:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=M11X+y56T/1F4fHNq5auQu00TlcNFHXDYbY/RsKteOE=;
        b=c99U3qkEZHhIEc7ajhsZpxJqU4l3cAi/NL5cixEEbUy7C6XoKYSnxPRQBhDUZTmgW3
         CdaWd0g1Bby07fp/jIyG1J3+95Fzgp/LQjARdfXbFBUkPZqyz7od9HefPpO8KeihaS2q
         AlvwqXjClIn82Ow/qtMIqMEuy5CmEAoKGT4g+DwYdedW4fXEssdeJNdj65X6UuIG3Gye
         uo1vCgIZbKpkm4ga/owAOGsj/OUuejccn7DdhxMou/c44twsSE4v7r5tzRnQ3jKJpheT
         vGlmiuBEeWfJ6E0nzDdCP0Neo+0FVxArhDDUs374m/wmtChQS97scg1pGgtlfoHSbhwi
         XX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=M11X+y56T/1F4fHNq5auQu00TlcNFHXDYbY/RsKteOE=;
        b=uGXQcJuka0Gg0zV2wLD4Hc9DOwZwsOt/eyuwH3EbiFDXvV+lRv3zt9efXYZRZgdtQV
         frbNiq7934zebT82HyU8dsOkflAXeUGTIrU3n2d5LjFVN+YpcLcouUo0JgBJR0TLO+zu
         MKU7lIdNkmBrrnNjwvIR2cSWZsthatzW99ozWo0CYOTwnNVrCktDuRNKkQe7CaP1xZou
         23/oTa70gjJxzvEyB5/o4rdg9PIyxznTobsQDjSNyMQO7VplWRnwPCZ67nVwpJqEqxzY
         wJmlvoenY7TcdELVBQeJjSHBqiJSstTVzPySrKT3U7DSVssUMqzxMhq1PP+wzx2O5nN6
         iVTA==
X-Gm-Message-State: AOAM531ijBZxOMNvhZ9nli+iLVJKQwLMEv61hDsqG7muSbhJWPKVaNqJ
        d9uC+Q5OYrjBtYgu5p6qim9dhA==
X-Google-Smtp-Source: ABdhPJz5e+/qhWGXkOB2Pdg+sYmL/Wm7bmIqKPSDgyhO5CcEvxS029Di2b+ofW5VEbb4r0PJYsKguA==
X-Received: by 2002:a05:620a:25a:b0:67d:43a6:8892 with SMTP id q26-20020a05620a025a00b0067d43a68892mr7881250qkn.659.1648849902837;
        Fri, 01 Apr 2022 14:51:42 -0700 (PDT)
Received: from localhost (cpe-98-15-154-102.hvc.res.rr.com. [98.15.154.102])
        by smtp.gmail.com with ESMTPSA id 188-20020a3709c5000000b0067b147584c2sm1897184qkj.102.2022.04.01.14.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 14:51:42 -0700 (PDT)
Date:   Fri, 1 Apr 2022 17:51:41 -0400
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Roman Gushchin <roman.gushchin@linux.dev>
Cc:     Yosry Ahmed <yosryahmed@google.com>,
        Michal Hocko <mhocko@kernel.org>,
        Shakeel Butt <shakeelb@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Rientjes <rientjes@google.com>,
        Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        Jonathan Corbet <corbet@lwn.net>, Yu Zhao <yuzhao@google.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Wei Xu <weixugc@google.com>, Greg Thelen <gthelen@google.com>
Subject: Re: [PATCH resend] memcg: introduce per-memcg reclaim interface
Message-ID: <Ykdz7fiMFZeFltYy@cmpxchg.org>
References: <YkdrEG5FlL7Gq2Vi@cmpxchg.org>
 <243A0156-D26A-47C9-982A-C8B0CDD69DA2@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <243A0156-D26A-47C9-982A-C8B0CDD69DA2@linux.dev>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 01, 2022 at 02:21:52PM -0700, Roman Gushchin wrote:
> > On Apr 1, 2022, at 2:13 PM, Johannes Weiner <hannes@cmpxchg.org> wrote:
> > 
> > ﻿On Fri, Apr 01, 2022 at 11:39:30AM -0700, Roman Gushchin wrote:
> >> The interface you're proposing is not really extensible, so we'll likely need to
> >> introduce a new interface like memory.reclaim_ext very soon. Why not create
> >> an extensible API from scratch?
> >> 
> >> I'm looking at cgroup v2 documentation which describes various interface files
> >> formats and it seems like given the number of potential optional arguments
> >> the best option is nested keyed (please, refer to the Interface Files section).
> >> 
> >> E.g. the format can be:
> >> echo "1G type=file nodemask=1-2 timeout=30s" > memory.reclaim
> > 
> > Yeah, that syntax looks perfect.
> > 
> > But why do you think it's not extensible from the current patch? We
> > can add those arguments one by one as we agree on them, and return
> > -EINVAL if somebody passes an unknown parameter.
> > 
> > It seems to me the current proposal is forward-compatible that way
> > (with the current set of keyword pararms being the empty set :-))
> 
> It wasn’t obvious to me. We spoke about positional arguments and then it wasn’t clear how to add them in a backward-compatible way. The last thing we want is a bunch of memory.reclaim* interfaces :)
> 
> So yeah, let’s just describe it properly in the documentation, no code changes are needed.

Sounds good to me!
