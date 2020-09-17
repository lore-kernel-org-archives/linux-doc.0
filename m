Return-Path: <SRS0=2m1s=C2=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 842ECC43461
	for <linux-doc@archiver.kernel.org>; Thu, 17 Sep 2020 09:43:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42C4D2076D
	for <linux-doc@archiver.kernel.org>; Thu, 17 Sep 2020 09:43:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbgIQJnK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Sep 2020 05:43:10 -0400
Received: from gentwo.org ([3.19.106.255]:48236 "EHLO gentwo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726180AbgIQJnJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 17 Sep 2020 05:43:09 -0400
X-Greylist: delayed 356 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 05:43:09 EDT
Received: by gentwo.org (Postfix, from userid 1002)
        id DED1F3F0AC; Thu, 17 Sep 2020 09:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
        by gentwo.org (Postfix) with ESMTP id DBB563F0AB;
        Thu, 17 Sep 2020 09:37:10 +0000 (UTC)
Date:   Thu, 17 Sep 2020 09:37:10 +0000 (UTC)
From:   Christopher Lameter <cl@linux.com>
X-X-Sender: cl@www.lameter.com
To:     Marco Elver <elver@google.com>
cc:     akpm@linux-foundation.org, glider@google.com, hpa@zytor.com,
        paulmck@kernel.org, andreyknvl@google.com, aryabinin@virtuozzo.com,
        luto@kernel.org, bp@alien8.de, catalin.marinas@arm.com,
        dave.hansen@linux.intel.com, rientjes@google.com,
        dvyukov@google.com, edumazet@google.com,
        gregkh@linuxfoundation.org, mingo@redhat.com, jannh@google.com,
        Jonathan.Cameron@huawei.com, corbet@lwn.net,
        iamjoonsoo.kim@lge.com, keescook@chromium.org,
        mark.rutland@arm.com, penberg@kernel.org, peterz@infradead.org,
        cai@lca.pw, tglx@linutronix.de, vbabka@suse.cz, will@kernel.org,
        x86@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 04/10] mm, kfence: insert KFENCE hooks for SLAB
In-Reply-To: <20200915132046.3332537-5-elver@google.com>
Message-ID: <alpine.DEB.2.22.394.2009170935020.1492@www.lameter.com>
References: <20200915132046.3332537-1-elver@google.com> <20200915132046.3332537-5-elver@google.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On Tue, 15 Sep 2020, Marco Elver wrote:

> @@ -3206,7 +3207,7 @@ static void *____cache_alloc_node(struct kmem_cache *cachep, gfp_t flags,
>  }
>
>  static __always_inline void *
> -slab_alloc_node(struct kmem_cache *cachep, gfp_t flags, int nodeid,
> +slab_alloc_node(struct kmem_cache *cachep, gfp_t flags, int nodeid, size_t orig_size,
>  		   unsigned long caller)
>  {

The size of the object is available via a field in kmem_cache. And a
pointer to the current kmem_cache is already passed to the function. Why
is there a need to add an additional parameter?
