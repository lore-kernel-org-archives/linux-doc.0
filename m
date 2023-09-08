Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7886EEE57EB
	for <linux-doc@archiver.kernel.org>; Fri,  8 Sep 2023 09:47:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241948AbjIHJrn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 8 Sep 2023 05:47:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235919AbjIHJrm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Sep 2023 05:47:42 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0D0D1BF1
        for <linux-doc@vger.kernel.org>; Fri,  8 Sep 2023 02:47:15 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-56c2e882416so1448914a12.3
        for <linux-doc@vger.kernel.org>; Fri, 08 Sep 2023 02:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1694166435; x=1694771235; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOFDh/D3nnnbGTYfl9jTSGlOLCGKw3LCJaJiKQKzt8k=;
        b=dPheguVJYjnsPoinyllXvG/HS/mjZ3x3CWYR9tfJAaosai5ovyV0E0Y/xiOhwPofCo
         +DBFhqDlVq8KA62edHd7j6QPRqBO01ZSoWRhQFdrDzLfBmIeX4hj+AZdz4m2xDYcq7aj
         CbLXRCZlSxLgVh6HEEnx7cu8VHuJhOcMlaHCTpoOX6rzu49GaDmGV17lVEgY7veNJ1Tk
         bWDeaZJw6RwEr2LYS1AoYnzifFpnx8zRadnE7pC2+T3Mtgk6yWNUPOIvrjnemCIoV+Qq
         P9y/WQ61dcK2iWhOd5Y6Hs1XLwy0orn35/ZQ12ius1OwEghPQGhdAuF05Xqm+0D3Zz0X
         jqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694166435; x=1694771235;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZOFDh/D3nnnbGTYfl9jTSGlOLCGKw3LCJaJiKQKzt8k=;
        b=Azn8YiOkLHRdHVR6AyO/NR/7llX3ysCaZJ+r9qGVvYCsAdm4psc2kB2DytjaDXHrtb
         AjXDw0Pi+F+sgMuCH9DD8/Ifbw84Bwl3PMM1TV4s67dsrkIgAuqcC+cgT1liVZ3CWHF7
         Z43AZ6NpSGJDBVE6riZvaD93pIqYimTRCbS4cXC51FUl4G81OGKLG8ter2Ho1eazrhe3
         drFzDZiuDT1QWX7if7UfaBRgm49LRoAHKirK7an/bovWo8aki/a+4BoI+YqPjCFkLg9f
         Ztlq43zpsJjDs1aU3r4TvFztSI0weMwlgDShbales25Y31so9uHUIUevRioefSCK0nlP
         bniQ==
X-Gm-Message-State: AOJu0Yy/vq3cduyjUFCubgovsJ8vDwhS6yx51SKX7vdPYGZGQHqkTSQb
        dAfOt9t8T5cQxdkh5A9Vr03Xbw==
X-Google-Smtp-Source: AGHT+IGToacl2IfMv5vF0nuGEuNbbaTH2uXstB2lcyAVK5QoZX/d+uZ0rVygQlbRD+yxYwSf4/OO+w==
X-Received: by 2002:a05:6a20:1441:b0:153:588c:f197 with SMTP id a1-20020a056a20144100b00153588cf197mr2569108pzi.35.1694166435181;
        Fri, 08 Sep 2023 02:47:15 -0700 (PDT)
Received: from [10.254.232.87] ([139.177.225.246])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902bd0500b001bba7aab822sm439696pls.5.2023.09.08.02.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Sep 2023 02:47:14 -0700 (PDT)
Message-ID: <bbb0959d-5ad1-846b-b896-eb4c5dd900bf@bytedance.com>
Date:   Fri, 8 Sep 2023 17:47:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v2 5/6] maple_tree: Update check_forking() and
 bench_forking()
To:     Matthew Wilcox <willy@infradead.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Peng Zhang <zhangpeng.00@bytedance.com>,
        kernel test robot <oliver.sang@intel.com>,
        oe-lkp@lists.linux.dev, lkp@intel.com,
        maple-tree@lists.infradead.org, linux-mm@kvack.org, corbet@lwn.net,
        akpm@linux-foundation.org, brauner@kernel.org, surenb@google.com,
        michael.christie@oracle.com, peterz@infradead.org,
        mathieu.desnoyers@efficios.com, npiggin@gmail.com,
        avagin@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <202308312115.cad34fed-oliver.sang@intel.com>
 <0e9a87d9-410f-a906-e95c-976a141f24f0@bytedance.com>
 <20230907180301.lms4ihtwfuwj7bkb@revolver>
 <ZPoThAU9zoW2q/YR@casper.infradead.org>
From:   Peng Zhang <zhangpeng.00@bytedance.com>
In-Reply-To: <ZPoThAU9zoW2q/YR@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



在 2023/9/8 02:16, Matthew Wilcox 写道:
> On Thu, Sep 07, 2023 at 02:03:01PM -0400, Liam R. Howlett wrote:
>>>>   WARNING: possible recursive locking detected
>>>>   6.5.0-rc4-00632-g2730245bd6b1 #1 Tainted: G                TN
>>>>   --------------------------------------------
>>>>   swapper/1 is trying to acquire lock:
>>>> ffffffff86485058 (&mt->ma_lock){+.+.}-{2:2}, at: check_forking (include/linux/spinlock.h:? lib/test_maple_tree.c:1854)
>>>>
>>>>   but task is already holding lock:
>>>>   ffff888110847a30 (&mt->ma_lock){+.+.}-{2:2}, at: check_forking (include/linux/spinlock.h:351 lib/test_maple_tree.c:1854)
>>> Thanks for the test. I checked that these are two different locks, why
>>> is this warning reported? Did I miss something?
>>
>> I don't think you can nest spinlocks like this.  In my previous test I
>> avoided nesting, but in your case we cannot avoid having both locks at
>> the same time.
>>
>> You can get around this by using an rwsemaphore, set the two trees as
>> external and use down_write_nested(&lock2, SINGLE_DEPTH_NESTING) like
>> the real fork.  Basically, switch the locking to exactly what fork does.
Here I can use rwsemaphore to avoid the warning. But what about in
mtree_dup()? mtree_dup() handles locks internally.

Maybe spin_lock_nested() mentioned by Matthew can be used in
mtree_dup().
> 
> spin_lock_nested() exists.
Thanks for mentioning this, I'll have a look.
> 
> You should probably both read through
> Documentation/locking/lockdep-design.rst It's not the best user
> documentation in the world, but it's what we have.
> 
