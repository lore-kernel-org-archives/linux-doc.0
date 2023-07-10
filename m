Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E73EB64DC
	for <linux-doc@archiver.kernel.org>; Mon, 10 Jul 2023 02:40:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbjGJCkn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 9 Jul 2023 22:40:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjGJCkm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 9 Jul 2023 22:40:42 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90CFCE0
        for <linux-doc@vger.kernel.org>; Sun,  9 Jul 2023 19:40:41 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1b52875b8d9so257785ad.0
        for <linux-doc@vger.kernel.org>; Sun, 09 Jul 2023 19:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688956841; x=1691548841;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z/IXbjfKuqXK0LkUSvyJlpVWtt+IDL+3mxWlVV+iCWs=;
        b=mRUT8n0EQoIJLjoyT3M/QgbW+yUQhTKEBK2l3R9zCHyVAVWDwrnKGjyZotnTUmr+H/
         6tZ7qCfuSVE/1lIOXyuAM8Ijwppj7m8QLe/Haxi4ypBo908hsu8zbIQ2D5TJGnnv7bPQ
         y/BBKVOMw3ETioMfZRgTB7WJ6c7QQiPNvGCrPNiq8fYz6UQucv1DnIHJSWGouajGWlUO
         7ypAmKo2lGP/nplXlby+JRLJ6/AcXYVfy496QQJg52d3eemfbau3NxmPfs7iVffxGuT3
         eGDGkCzTQkonpDA06mGAMVaMahduB/gIY0W8y7dR/hRvoZrldpSgOMOqIqST+RM09rPZ
         wwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688956841; x=1691548841;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z/IXbjfKuqXK0LkUSvyJlpVWtt+IDL+3mxWlVV+iCWs=;
        b=SUAiFVH+KfoB1HnaTs40295JRUa9U7htwc9B1CZbbBtQE/kqkWTxvdXDRqIipnk0DV
         LHUxaoX3eXT2huReS3WWbug7ADqFvLn1AV01Z1fFwXOzCkq9rmKD3GOZgD3nNjX0bPhG
         NFvxHKF5gRSTBYTTWJxVmu3GNUGXneSd9MqiALwmTDFmnrpUasHKZEPMkLWdvuGFBzOP
         atYmMOmjMvd03zqbOEiimXIwf/3g5vmJgK5lmW8EQR+6JPaLyOdcQUWC23Wd2qe6YvTc
         i68gfsMUwQD/pF09ZmzfwhfV1BzFO2YBJw9zBC7rjIGQV54eQ82Rxf/XRVwmcpP77HN6
         GqXw==
X-Gm-Message-State: ABy/qLZGkxib3CdHGWM2p34LkZD34D0jLdJStOKz0/tXkRnQk5MOKw8Y
        5PFcP04t+YaPI17LsbIKM0+yEg==
X-Google-Smtp-Source: APBJJlHDprkhz5rwjoerAkPliIA9FF7/3p0AE4aab+XMzzj1RCCOp2CmuhVVTocTiN9jtJS9nt8aoA==
X-Received: by 2002:a17:902:d482:b0:1b0:26c0:757d with SMTP id c2-20020a170902d48200b001b026c0757dmr364822plg.22.1688956840900;
        Sun, 09 Jul 2023 19:40:40 -0700 (PDT)
Received: from [2620:0:1008:15:1612:3901:b423:457c] ([2620:0:1008:15:1612:3901:b423:457c])
        by smtp.gmail.com with ESMTPSA id s18-20020a170902a51200b001b8a85489a3sm6912523plq.262.2023.07.09.19.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 19:40:40 -0700 (PDT)
Date:   Sun, 9 Jul 2023 19:40:39 -0700 (PDT)
From:   David Rientjes <rientjes@google.com>
To:     Julian Pidancet <julian.pidancet@oracle.com>
cc:     Christoph Lameter <cl@linux.com>,
        "Lameter, Christopher" <cl@os.amperecomputing.com>,
        Pekka Enberg <penberg@kernel.org>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
        Kees Cook <keescook@chromium.org>,
        Rafael Aquini <aquini@redhat.com>
Subject: Re: [PATCH v2] mm/slub: disable slab merging in the default
 configuration
In-Reply-To: <3bcfa538-4474-09b7-1812-b4260b09256a@google.com>
Message-ID: <7b6b07b3-d8a1-b24f-1df2-bf6080bc5516@google.com>
References: <20230629221910.359711-1-julian.pidancet@oracle.com> <38083ed2-333b-e245-44e4-2f355e4f9249@google.com> <CTSGWINSM18Q.3HQ1DN27GNA1R@imme> <8813897d-4a52-37a0-fe44-a9157716be9b@google.com> <17349901-df3a-494e-fa71-2584d92526b5@google.com>
 <3bcfa538-4474-09b7-1812-b4260b09256a@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 9 Jul 2023, David Rientjes wrote:

> There are some substantial performance degradations, most notably 
> context_switch1_per_thread_ops which regressed ~21%.  I'll need to repeat
> that test to confirm it and can also try on cascadelake if it reproduces.
> 

So the regression on skylake for will-it-scale appears to be real:

               LABEL              | COUNT |    MIN     |    MAX     |    MEAN    |   MEDIAN   | STDDEV | DIRECTION  
----------------------------------+-------+------------+------------+------------+------------+--------+------------
  context_switch1_per_thread_ops  |       |            |            |            |            |        |            
  (A) v6.1.30                     | 1     | 314507.000 | 314507.000 | 314507.000 | 314507.000 | 0      |            
  (B) v6.1.30 slab_nomerge        | 1     | 257403.000 | 257403.000 | 257403.000 | 257403.000 | 0      |            
    !! REGRESSED !!               |       | -18.16%    | -18.16%    | -18.16%    | -18.16%    | ---    | + is good  

but I can't reproduce this on cascadelake:

               LABEL              | COUNT |    MIN     |    MAX     |    MEAN    |   MEDIAN   | STDDEV | DIRECTION  
----------------------------------+-------+------------+------------+------------+------------+--------+------------
  context_switch1_per_thread_ops  |       |            |            |            |            |        |            
  (A) v6.1.30                     | 1     | 301128.000 | 301128.000 | 301128.000 | 301128.000 | 0      |            
  (B) v6.1.30 slab_nomerge        | 1     | 301282.000 | 301282.000 | 301282.000 | 301282.000 | 0      |            
                                  |       | +0.05%     | +0.05%     | +0.05%     | +0.05%     | ---    | + is good  

So I'm a bit baffled at the moment.

I'll try to dig deeper and see what slab caches this benchmark exercises
that apparently no other benchmarks do.  (I'm really hoping that the only
way to recover this performance is by something like
kmem_cache_create(SLAB_MERGE).)
