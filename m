Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B387EE4993
	for <linux-doc@archiver.kernel.org>; Wed, 23 Aug 2023 11:13:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234230AbjHWLNH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Aug 2023 07:13:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234215AbjHWLNH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Aug 2023 07:13:07 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD0DC198
        for <linux-doc@vger.kernel.org>; Wed, 23 Aug 2023 04:12:46 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-68a520dba33so2416516b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Aug 2023 04:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1692789166; x=1693393966;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9l/C/Em55hDWEZsHiOtUwvmf9bvizEENoPNvEct/EfI=;
        b=KP1ChHFNfM0e8toOlV+hECyU3u1mwZA4fCDAIuIBoDsCINkYYwUNx/uyNtnzVS1X+W
         tLlWGrw4f31BtIWSLy/MKwD2LysTeZPQjA/pvFNsf4aOGaM2IiJuIx6O8vmDU48DTSeR
         aWmZwfKSZy8U5Nh/LRsbJvk7BdR8IE8HWUiPt3xWoyH9dH0psaU9LfYkVVMyLtqX6lEw
         En7Yz8R7yFeGrv1l0UxpDPS5An2HvGCgplhkvNEZ3w1ILVNL/DQSEMxbtTqLS3F0+gqk
         exBdyVgu/fMj9G7MQym2TQ1KNBlSOsYu30fxLGZC13pgE6zCjt/8oL4uO9nCN7o/tgDq
         hLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692789166; x=1693393966;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9l/C/Em55hDWEZsHiOtUwvmf9bvizEENoPNvEct/EfI=;
        b=jVpoAf5PZw36tk6gstPyfGvP+j8yTFNIWqfYmaTzWKUXZPE1IIeWKe9mGf6Lv256c8
         DCDX7f8JlkVJYOlJNPEvMNRGIYOEiHuVobtUtnMbwHJTa5yG18xpoKeba1bTjhKY4Yls
         SQbrgS+kK1bPBSOgflan8hfZDlZeAUwHapbHHf6KZyZVXYKI4UGiQ8ABesnrMSZH0LqA
         suZL5VV5XR/wjjbeS7+6cAqa6X9hhNniRIevWH4JU94HDEzGW73e/2+TbxcTRXlWDq6U
         D3YAP1o5PcKf74Imy5T5tDvZZNJPrW20KcVyeqXl/8UGPaTHNBmseoXf2I5ddse8jCCc
         jn2w==
X-Gm-Message-State: AOJu0YwdIqMUH8OnmvWZT3l7Dg4B4LGJUCXIqjWuBvEkujSUIzmzv9fA
        V5LbgaCeakb+d7j61/BrN8Cueg==
X-Google-Smtp-Source: AGHT+IH6qjCXnJXfdTQcWKr9U/NGAmqaIa6a51NYKXyh+nsa4CDocmJi35FlCNTOYm6GU3g0v8EN1g==
X-Received: by 2002:a05:6a21:3d8b:b0:132:ef90:1d1d with SMTP id bj11-20020a056a213d8b00b00132ef901d1dmr13871845pzc.0.1692789166350;
        Wed, 23 Aug 2023 04:12:46 -0700 (PDT)
Received: from [10.255.208.99] ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id r21-20020a170902ea5500b001bb99e188fcsm10702619plg.194.2023.08.23.04.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 04:12:45 -0700 (PDT)
Message-ID: <446c65f1-e5e9-4f99-467f-a64654bcf131@bytedance.com>
Date:   Wed, 23 Aug 2023 19:12:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH 3/5] fuse: add FOPEN_INVAL_ATTR
To:     Miklos Szeredi <miklos@szeredi.hu>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        me@jcix.top
References: <20230711043405.66256-1-zhangjiachen.jaycee@bytedance.com>
 <20230711043405.66256-4-zhangjiachen.jaycee@bytedance.com>
 <CAJfpegtocWjfqVUpdnct-1-pq_DYJXUuvkBWey2N5q6+K=pL_w@mail.gmail.com>
From:   Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
In-Reply-To: <CAJfpegtocWjfqVUpdnct-1-pq_DYJXUuvkBWey2N5q6+K=pL_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2023/8/23 17:01, Miklos Szeredi wrote:
> On Tue, 11 Jul 2023 at 06:36, Jiachen Zhang
> <zhangjiachen.jaycee@bytedance.com> wrote:
>>
>> Add FOPEN_INVAL_ATTR so that the fuse daemon can ask kernel to invalidate
>> the attr cache on file open.
>>
>> The fi->attr_version should be increased when handling FOPEN_INVAL_ATTR.
>> Because if a FUSE request returning attributes (getattr, setattr, lookup,
>> and readdirplus) starts before a FUSE_OPEN replying FOPEN_INVAL_ATTR, but
>> finishes after the FUSE_OPEN, staled attributes will be set to the inode
>> and falsely clears the inval_mask.
>>
>> Signed-off-by: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
>> ---
>>   fs/fuse/file.c            | 10 ++++++++++
>>   include/uapi/linux/fuse.h |  2 ++
>>   2 files changed, 12 insertions(+)
>>
>> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
>> index de37a3a06a71..412824a11b7b 100644
>> --- a/fs/fuse/file.c
>> +++ b/fs/fuse/file.c
>> @@ -215,6 +215,16 @@ void fuse_finish_open(struct inode *inode, struct file *file)
>>                  file_update_time(file);
>>                  fuse_invalidate_attr_mask(inode, FUSE_STATX_MODSIZE);
>>          }
>> +
>> +       if (ff->open_flags & FOPEN_INVAL_ATTR) {
>> +               struct fuse_inode *fi = get_fuse_inode(inode);
>> +
>> +               spin_lock(&fi->lock);
>> +               fi->attr_version = atomic64_inc_return(&fc->attr_version);
> 
> No need to add locking or change fi->attr_version.  This will be done
> next time the attributes are updated.
> 
> Thanks,
> Miklos

Hi Miklos,

Thanks for the review! As said in the commit message, increasing the
attr version here is to prevent the attr updated by staled operations. 
If such cases happen, inval_mask will be falsely cleared, and 
FOPEN_INVAL_ATTR takes no effect from the user's point of view.

The increasing of attr_version here can also be explained as the
attr has been updated from the server side.

Thanks,
Jiachen
