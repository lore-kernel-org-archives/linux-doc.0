Return-Path: <SRS0=MgSu=DW=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ABA3C433DF
	for <linux-doc@archiver.kernel.org>; Thu, 15 Oct 2020 09:44:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 188942224A
	for <linux-doc@archiver.kernel.org>; Thu, 15 Oct 2020 09:44:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388885AbgJOJoV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Oct 2020 05:44:21 -0400
Received: from mx2.suse.de ([195.135.220.15]:34558 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388793AbgJOJoV (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 15 Oct 2020 05:44:21 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 74692ACF6;
        Thu, 15 Oct 2020 09:44:19 +0000 (UTC)
Subject: Re: [PATCH v3 0/3] Actually fix freelist pointer vs redzoning
To:     Christopher Lameter <cl@linux.com>,
        Kees Cook <keescook@chromium.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Waiman Long <longman@redhat.com>,
        Marco Elver <elver@google.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Roman Gushchin <guro@fb.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org
References: <20201015033712.1491731-1-keescook@chromium.org>
 <alpine.DEB.2.22.394.2010150822260.184556@www.lameter.com>
From:   Vlastimil Babka <vbabka@suse.cz>
Message-ID: <1e43fd23-e9f1-9c5d-3ee2-17171642877f@suse.cz>
Date:   Thu, 15 Oct 2020 11:44:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2010150822260.184556@www.lameter.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/15/20 10:23 AM, Christopher Lameter wrote:
> On Wed, 14 Oct 2020, Kees Cook wrote:
> 
>> Note on patch 2: Christopher NAKed it, but I actually think this is a
>> reasonable thing to add -- the "too small" check is only made when built
>> with CONFIG_DEBUG_VM, so it *is* actually possible for someone to trip
>> over this directly, even if it would never make it into a released
>> kernel. I see no reason to just leave this foot-gun in place, though, so
>> we might as well just fix it too. (Which seems to be what Longman was
>> similarly supporting, IIUC.)
> 
> Well then remove the duplication of checks. The NAK was there because it
> seems that you were not aware of the existing checks.
> 
>> Anyway, if patch 2 stays NAKed, that's fine. It's entirely separable,
>> and the other 2 can land. :)
> 
> Just deal with the old checks too and it will be fine.

Yeah, the existing check is under CONFIG_DEBUG_VM, which means it's not active 
on some configurations. Creating a cache is not exactly fast path operation, so 
I would remove this guard.
As for the minimum size check, I would probably remove it (but watch out if 
SLAB/SLOB can handle it). It's not effective to use slab cache for 4-byte 
objects, but why make it an error.


