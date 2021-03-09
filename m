Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFE1C433E0
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 15:21:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7897961581
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 15:21:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231548AbhCIPVC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 9 Mar 2021 10:21:02 -0500
Received: from vmi485042.contaboserver.net ([161.97.139.209]:54788 "EHLO
        gentwo.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231905AbhCIPUr (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 9 Mar 2021 10:20:47 -0500
X-Greylist: delayed 898 seconds by postgrey-1.27 at vger.kernel.org; Tue, 09 Mar 2021 10:20:47 EST
Received: by gentwo.de (Postfix, from userid 1001)
        id C06D0B00BAC; Tue,  9 Mar 2021 15:56:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by gentwo.de (Postfix) with ESMTP id BF87DB0096F;
        Tue,  9 Mar 2021 15:56:04 +0100 (CET)
Date:   Tue, 9 Mar 2021 15:56:04 +0100 (CET)
From:   Christoph Lameter <cl@gentwo.de>
To:     Georgi Djakov <georgi.djakov@linaro.org>
cc:     linux-mm@kvack.org, akpm@linux-foundation.org, vbabka@suse.cz,
        penberg@kernel.org, rientjes@google.com, iamjoonsoo.kim@lge.com,
        corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/slub: Add slub_debug option to panic on memory
 corruption
In-Reply-To: <20210309134720.29052-1-georgi.djakov@linaro.org>
Message-ID: <alpine.DEB.2.22.394.2103091554430.109061@gentwo.de>
References: <20210309134720.29052-1-georgi.djakov@linaro.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 9 Mar 2021, Georgi Djakov wrote:

> Being able to stop the system immediately when a memory corruption
> is detected is crucial to finding the source of it. This is very
> useful when the memory can be inspected with kdump or other tools.

Hmmm.... ok.

>  static void restore_bytes(struct kmem_cache *s, char *message, u8 data,
>  						void *from, void *to)
>  {
> +	if (slub_debug & SLAB_CORRUPTION_PANIC)
> +		panic("slab: object overwritten\n");
>  	slab_fix(s, "Restoring 0x%p-0x%p=0x%x\n", from, to - 1, data);
>  	memset(from, data, to - from);
>  }

Why panic here? This should only be called late in the bug reporting when
an error has already been printed.

