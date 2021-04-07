Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80490C433ED
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 14:44:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D2F261260
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 14:44:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239804AbhDGOoV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 10:44:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348740AbhDGOoR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Apr 2021 10:44:17 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00643C061756
        for <linux-doc@vger.kernel.org>; Wed,  7 Apr 2021 07:44:05 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id b17so9572225pgh.7
        for <linux-doc@vger.kernel.org>; Wed, 07 Apr 2021 07:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KtFdZ5SkDikE7qZeXnBldO6OMbzL9Tw1LY3vol6rKJs=;
        b=KpQ7yIj5V3ALgtgoiaM8FzB8rt6pJ4Xga2Q61gCj9lJK1aRbByx1XbBikPv3/cEQRT
         r4V5r5azx2Wq16WFNIdj2vDqVSTBq8KXUSztW/0KsNmQzmAWRPduLinzwj+YafCF8bP8
         6GehMlxMriOvl0RivVz0TyYVmtlRCquVDr2QBrYnb5ipzcnjs1UPLVMKfg9+8i5wf0oP
         MkSf3lQrYWI0vpSSliV6dpJVVxJyDbitjQIx1f/4UhV+tIleVIaDJUhudMUfEGcjdo2n
         az3aEGlj/zDgYt95lel/U4utvF3N8ebDjlq3TwLO8nE+tqHOJbIPFY7/ykU9U+C7rMVe
         gI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KtFdZ5SkDikE7qZeXnBldO6OMbzL9Tw1LY3vol6rKJs=;
        b=lXqjyIbPuwlZaz1Y3jyG3mxpbIG22x+zMhtL5cbno2HcaWIP63h6cIjFpbWdaG/7p+
         5BfiaWy84JNszkf9ULPGiRPL+f+U7hyWgKF/ojTKV6lERxlP6myUDjOaSFwsHEx9YiCI
         vPRpuDleZj+3rRvG5wSy8SvwrCdB55XDn7ha/92ftZGIyiBc6p1gAuNVE7ADZuROzeza
         DiWsOaOvhIyqO0xNiLtAEmVsOQPiDYXTNri5E9PO7+aa61iTXT+LjPEP9r/h16XKqtq4
         fxwn1IzhMStkgD+mYWWM7jwIjn90WQcsPksKs/Q/QGRCUDUH7qNRWOWvh6b25jWk74Us
         Il+g==
X-Gm-Message-State: AOAM531lfeMIJAO4wCpiWdyPcxAY3lKr6liyZXmZT1Lx4XgWvQS8rKeT
        K+7u5msmTWYnupKjPaS2uXE=
X-Google-Smtp-Source: ABdhPJyVzJtqVTEt88GkXNGCJIcz7lojvkIIayf6Mda6I61trGOByoFWTK0btrYtcV7w0RMhfAOtcg==
X-Received: by 2002:a62:d043:0:b029:241:ee7b:6ee9 with SMTP id p64-20020a62d0430000b0290241ee7b6ee9mr3064011pfg.76.1617806645492;
        Wed, 07 Apr 2021 07:44:05 -0700 (PDT)
Received: from [192.168.11.2] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id a18sm23556844pfa.18.2021.04.07.07.44.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 07:44:04 -0700 (PDT)
Subject: Re: [PATCH v2 15/19] docs: update rcu_dereference.rst reference
To:     paulmck@kernel.org
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
References: <cover.1617783062.git.mchehab+huawei@kernel.org>
 <ea2236875b0f5159ab07853d78f1e3c2f565a5e7.1617783062.git.mchehab+huawei@kernel.org>
 <5e171c69-4d76-9f7f-d0ee-1d4f31ad7e2c@gmail.com>
 <20210407135106.GC4510@paulmck-ThinkPad-P17-Gen-1>
From:   Akira Yokosawa <akiyks@gmail.com>
Message-ID: <058f26dd-cc49-c58e-afde-58a565c3bba1@gmail.com>
Date:   Wed, 7 Apr 2021 23:44:00 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210407135106.GC4510@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 7 Apr 2021 06:51:06 -0700, Paul E. McKenney wrote:
> On Wed, Apr 07, 2021 at 07:10:00PM +0900, Akira Yokosawa wrote:
>> Hello Mauro,
>>
>> (Dropped most CC)
>>
>> On Wed,  7 Apr 2021 10:20:54 +0200, Mauro Carvalho Chehab wrote:
>>> Changeset b00aedf978aa ("doc: Convert to rcu_dereference.txt to rcu_dereference.rst")
>>> renamed: Documentation/RCU/rcu_dereference.txt
>>> to: Documentation/RCU/rcu_dereference.rst.
>>>
>>> Update its cross-reference accordingly.
>>>
>>> Fixes: b00aedf978aa ("doc: Convert to rcu_dereference.txt to rcu_dereference.rst")
>>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>> ---
>>
>> Paul has sent a pull request to mingo for v5.13 including v1 of
>> this patch.
>>
>>> Mauro Carvalho Chehab (2):
>>>       rcu: Fix kfree_rcu() docbook errors
>>>       doc: Update rcu_dereference.rst reference   <---
>>
>> See: https://lore.kernel.org/lkml/20210331192934.GA8127@paulmck-ThinkPad-P72/
>>
>> Hmm, your email address is on the CC list...
> 
> My approach would be simply to take Mauro's patch into the -rcu dev
> branch.  If it affected kernel function in a bad way, I would submit it
> into v5.13, but as it is, I would just run it through my normal process.
> This would likely get it into v5.14.

Paul, v1 and v2 has the identical diff.  Only difference is the added
Fixes: tag.

I don't think you can do anything further with regard to the v2 patch.

        Thanks, Akira

> 
> Seem reasonable?
> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>>
>>>  tools/memory-model/Documentation/glossary.txt | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/tools/memory-model/Documentation/glossary.txt b/tools/memory-model/Documentation/glossary.txt
>>> index b2da6365be63..6f3d16dbf467 100644
>>> --- a/tools/memory-model/Documentation/glossary.txt
>>> +++ b/tools/memory-model/Documentation/glossary.txt
>>> @@ -19,7 +19,7 @@ Address Dependency:  When the address of a later memory access is computed
>>>  	 from the value returned by the rcu_dereference() on line 2, the
>>>  	 address dependency extends from that rcu_dereference() to that
>>>  	 "p->a".  In rare cases, optimizing compilers can destroy address
>>> -	 dependencies.	Please see Documentation/RCU/rcu_dereference.txt
>>> +	 dependencies.	Please see Documentation/RCU/rcu_dereference.rst
>>>  	 for more information.
>>>  
>>>  	 See also "Control Dependency" and "Data Dependency".
>>>
