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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB45C433B4
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 10:10:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A826C61382
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 10:10:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234217AbhDGKKO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 06:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233394AbhDGKKO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Apr 2021 06:10:14 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C726C061756
        for <linux-doc@vger.kernel.org>; Wed,  7 Apr 2021 03:10:04 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id w10so7180377pgh.5
        for <linux-doc@vger.kernel.org>; Wed, 07 Apr 2021 03:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jhAmNpG6st01IIqlkM0iXgCJpeEg4gccz3WhjJt+s6k=;
        b=icprrkgB2wd84gMdtcGt/LXr2ZM9zgAuaxBmHPVN7cRk7G4g1LB4H+y7iUqkblh9Si
         oIPUqErkSxJU5vXDn8kMByrKvW8Y4HLDcOm/5LUmjjAOJBB5ZK3ZmjwI4PJxKgqwEPZq
         M2ZPTJ4HIEU+DyNrOHYPYZfIZQDUukhXSyquW0kfbN+GGJY98hkFlLamHhfa2cyIzze8
         +BhNX6lsmohkIyzAC5Vibf24gGv3i1TUqDzILFGY5KSqDehWwrfTWPogoZERPKJonc6k
         h+Yu2/YQu9lpa5zE8e4P6ZBnzrbGPcaasP7G4H+pXPPy0i6vp1TX7bpT9wRT7WxT7A4a
         4ECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jhAmNpG6st01IIqlkM0iXgCJpeEg4gccz3WhjJt+s6k=;
        b=k3wSIUZpur7JE0/vdPwAnA7x+pgSpzyevE/C7a89G3nviLPUSkR8emkftzyJuwcfZP
         dJqmEvrXRllS8UycT3BoRgdBT08xzOr5tCqIgD65mj+tXBzVFI4crsQxG+tThSc4Kw6u
         2Rtpwo9LLTvJPObWM4YAvbt1zyl0h/CAckfxKXfLW5FLgVhYKqhuLHf9BljU/OM7CR9i
         xZYE3c4pNeuO/nR7/xunAZJUEZn2zYgS6dGHGQIe1IGDdkyixuLfvdrg6wyvQM+E54mf
         Rb1ZTqhFWnnHKv05KM1E+1z7fHrG2ceLWSom8MOOJT2hcEVfnHJuElrRq3E89XHrdu0P
         yloQ==
X-Gm-Message-State: AOAM530636qGcCcH5qJ9t8OWqf9AdBtUhDL6cQlDfzhkVuGMYFVpx3Ab
        wHnEzH6bej0aWIyda6gSqeCtivPSKPQ=
X-Google-Smtp-Source: ABdhPJxRlS/Y49hsL2OvlJFdr59iM0ROTYmVsBJ2ZsJXxMnIGyqda+smocVAGORezRBedVPYcNmEHw==
X-Received: by 2002:a62:7594:0:b029:203:2d6c:cea1 with SMTP id q142-20020a6275940000b02902032d6ccea1mr2244789pfc.33.1617790203760;
        Wed, 07 Apr 2021 03:10:03 -0700 (PDT)
Received: from [192.168.11.2] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id y5sm20778976pfl.191.2021.04.07.03.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 03:10:03 -0700 (PDT)
Subject: Re: [PATCH v2 15/19] docs: update rcu_dereference.rst reference
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "Paul E. McKenney" <paulmck@kernel.org>
References: <cover.1617783062.git.mchehab+huawei@kernel.org>
 <ea2236875b0f5159ab07853d78f1e3c2f565a5e7.1617783062.git.mchehab+huawei@kernel.org>
From:   Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5e171c69-4d76-9f7f-d0ee-1d4f31ad7e2c@gmail.com>
Date:   Wed, 7 Apr 2021 19:10:00 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ea2236875b0f5159ab07853d78f1e3c2f565a5e7.1617783062.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello Mauro,

(Dropped most CC)

On Wed,  7 Apr 2021 10:20:54 +0200, Mauro Carvalho Chehab wrote:
> Changeset b00aedf978aa ("doc: Convert to rcu_dereference.txt to rcu_dereference.rst")
> renamed: Documentation/RCU/rcu_dereference.txt
> to: Documentation/RCU/rcu_dereference.rst.
> 
> Update its cross-reference accordingly.
> 
> Fixes: b00aedf978aa ("doc: Convert to rcu_dereference.txt to rcu_dereference.rst")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---

Paul has sent a pull request to mingo for v5.13 including v1 of
this patch.

> Mauro Carvalho Chehab (2):
>       rcu: Fix kfree_rcu() docbook errors
>       doc: Update rcu_dereference.rst reference   <---

See: https://lore.kernel.org/lkml/20210331192934.GA8127@paulmck-ThinkPad-P72/

Hmm, your email address is on the CC list...

        Thanks, Akira

>  tools/memory-model/Documentation/glossary.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/memory-model/Documentation/glossary.txt b/tools/memory-model/Documentation/glossary.txt
> index b2da6365be63..6f3d16dbf467 100644
> --- a/tools/memory-model/Documentation/glossary.txt
> +++ b/tools/memory-model/Documentation/glossary.txt
> @@ -19,7 +19,7 @@ Address Dependency:  When the address of a later memory access is computed
>  	 from the value returned by the rcu_dereference() on line 2, the
>  	 address dependency extends from that rcu_dereference() to that
>  	 "p->a".  In rare cases, optimizing compilers can destroy address
> -	 dependencies.	Please see Documentation/RCU/rcu_dereference.txt
> +	 dependencies.	Please see Documentation/RCU/rcu_dereference.rst
>  	 for more information.
>  
>  	 See also "Control Dependency" and "Data Dependency".
> 
