Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC73C433E7
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 16:13:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7C8525247
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 16:13:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731507AbgJMQNj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 12:13:39 -0400
Received: from mx2.suse.de ([195.135.220.15]:42294 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726482AbgJMQNj (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Oct 2020 12:13:39 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id D2F42AC6D;
        Tue, 13 Oct 2020 16:13:37 +0000 (UTC)
Subject: Re: [PATCH v2 1/3] mm/slub: Clarify verification reporting
To:     Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Marco Elver <elver@google.com>, Jonathan Corbet <corbet@lwn.net>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Roman Gushchin <guro@fb.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org
References: <20201009195411.4018141-1-keescook@chromium.org>
 <20201009195411.4018141-2-keescook@chromium.org>
From:   Vlastimil Babka <vbabka@suse.cz>
Message-ID: <cfdb11d7-fb8e-e578-c939-f7f5fb69a6bd@suse.cz>
Date:   Tue, 13 Oct 2020 18:13:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201009195411.4018141-2-keescook@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/9/20 9:54 PM, Kees Cook wrote:
> Instead of repeating "Redzone" and "Poison", clarify which sides of
> those zones got tripped. Additionally fix column alignment in the
> trailer.
> 
> Before:
> 
> BUG test (Tainted: G    B            ): Redzone overwritten
> ...
> Redzone (____ptrval____): bb bb bb bb bb bb bb bb      ........
> Object (____ptrval____): f6 f4 a5 40 1d e8            ...@..
> Redzone (____ptrval____): 1a aa                        ..
> Padding (____ptrval____): 00 00 00 00 00 00 00 00      ........
> 
> After:
> 
> BUG test (Tainted: G    B            ): Right Redzone overwritten
> ...
> Redzone  (____ptrval____): bb bb bb bb bb bb bb bb      ........
> Object   (____ptrval____): f6 f4 a5 40 1d e8            ...@..
> Redzone  (____ptrval____): 1a aa                        ..
> Padding  (____ptrval____): 00 00 00 00 00 00 00 00      ........
> 
> Fixes: d86bd1bece6f ("mm/slub: support left redzone")
> Fixes: ffc79d288000 ("slub: use print_hex_dump")
> Fixes: 2492268472e7 ("SLUB: change error reporting format to follow lockdep loosely")

Not sure about those Fixes: tag as this is mainly an enhancement. I'd only use 
those for real bug fixes.

> Signed-off-by: Kees Cook <keescook@chromium.org>

Acked-by: Vlastimil Babka <vbabka@suse.cz>
