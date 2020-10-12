Return-Path: <SRS0=n+aG=DT=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 366F0C433DF
	for <linux-doc@archiver.kernel.org>; Mon, 12 Oct 2020 08:01:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DABCE208B6
	for <linux-doc@archiver.kernel.org>; Mon, 12 Oct 2020 08:01:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728291AbgJLIBF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 12 Oct 2020 04:01:05 -0400
Received: from gentwo.org ([3.19.106.255]:51220 "EHLO gentwo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726334AbgJLIBF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 12 Oct 2020 04:01:05 -0400
Received: by gentwo.org (Postfix, from userid 1002)
        id 249E63F19D; Mon, 12 Oct 2020 08:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
        by gentwo.org (Postfix) with ESMTP id 226783EC24;
        Mon, 12 Oct 2020 08:01:04 +0000 (UTC)
Date:   Mon, 12 Oct 2020 08:01:04 +0000 (UTC)
From:   Christopher Lameter <cl@linux.com>
X-X-Sender: cl@www.lameter.com
To:     Kees Cook <keescook@chromium.org>
cc:     Andrew Morton <akpm@linux-foundation.org>, stable@vger.kernel.org,
        Marco Elver <elver@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Vlastimil Babka <vbabka@suse.cz>, Roman Gushchin <guro@fb.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH v2 2/3] mm/slub: Fix redzoning for small allocations
In-Reply-To: <20201009195411.4018141-3-keescook@chromium.org>
Message-ID: <alpine.DEB.2.22.394.2010120754010.150059@www.lameter.com>
References: <20201009195411.4018141-1-keescook@chromium.org> <20201009195411.4018141-3-keescook@chromium.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 9 Oct 2020, Kees Cook wrote:

> Store the freelist pointer out of line when object_size is smaller than
> sizeof(void *) and redzoning is enabled.
>
> (Note that no caches with such a size are known to exist in the kernel
> currently.)

Ummm... The smallest allowable cache size is sizeof(void *) as I recall.


mm/slab_common.c::kmem_sanity_check() checks the sizes when caches are
created.

NAK.

