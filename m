Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9844ECAAD3
	for <linux-doc@archiver.kernel.org>; Mon, 19 Sep 2022 09:20:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbiISJU0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Sep 2022 05:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbiISJUX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Sep 2022 05:20:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC56BE23
        for <linux-doc@vger.kernel.org>; Mon, 19 Sep 2022 02:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663579220;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VrBD4wlaONcMGYg1HxtJ7UDDQW/eU0hoafM/vqbQdC8=;
        b=MsPTc7cZNpLxg4NQTBrErK69hbRhBOrlgykOSYecdt41FwCggtquPDMV8ajwKgvpVc2yYb
        /8aTNXwLEPGWg9BxDlVSmHdo1OHSEzQcJQfW0nCn1rxYfJR+5CPg25XAYL2skqPtXpEHZn
        N9LKmAczIkXdTxWIt7oxrGIv/gzLUDA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-339-TLeJ25-5PDKzwOasz1HIew-1; Mon, 19 Sep 2022 05:20:16 -0400
X-MC-Unique: TLeJ25-5PDKzwOasz1HIew-1
Received: by mail-wm1-f69.google.com with SMTP id 5-20020a05600c028500b003b4d2247d3eso1064462wmk.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Sep 2022 02:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=VrBD4wlaONcMGYg1HxtJ7UDDQW/eU0hoafM/vqbQdC8=;
        b=zVMYRhLC4McM1lwc2K+UOBykh2RrlzysnBh4HgiD/D2TmbvW8Y4OmOPybwCAJyBqbl
         cN1MakYL+eUNzHK82HhbDxuOVdfy+Su9M1JVFgWqpq5n1g/Mj9sjcFaKUqnwChSuGawI
         gmXxdHDad0xAjONHsSOQTqZdVYW4fuRMesj7SSCcjZD7G9YUyEP83cq5KAGJmbEMs4PQ
         aKVXXDKycbB/qX5Fm+RJ337Pl20QqVnm7mUahMa9/gYzmBihTNregdrJh420UJCXYqD2
         IBpngT/A/F4lASQyAMe063hQ1Th3XHCjqAXXp8Me/eaTOdg8LEOwqZU/+2R7R2bagquf
         8Jzg==
X-Gm-Message-State: ACrzQf1fDAJGOXQGH2sWnnCLtskC9j8x5E16y2aqXtOKu63FgB50IORp
        wwiJqv5Hthmx30Qo3E8027On/l0eWO6WZ0BMij3bXzQfuiu5u69O3LWi3J9jXViLEzwSjvtX4IB
        kZeE9TfSYL2vxD5ZgtOwm
X-Received: by 2002:adf:e781:0:b0:228:b44c:d0f7 with SMTP id n1-20020adfe781000000b00228b44cd0f7mr9394662wrm.243.1663579215126;
        Mon, 19 Sep 2022 02:20:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM40gi8fb1JNpCfan1XUhRZ465bQABplaEbcoKHL65i6udarmw0EbHumnsl5dbBGjFrfeA7ndA==
X-Received: by 2002:adf:e781:0:b0:228:b44c:d0f7 with SMTP id n1-20020adfe781000000b00228b44cd0f7mr9394649wrm.243.1663579214829;
        Mon, 19 Sep 2022 02:20:14 -0700 (PDT)
Received: from ?IPV6:2003:cb:c703:c100:c136:f914:345f:f5f3? (p200300cbc703c100c136f914345ff5f3.dip0.t-ipconnect.de. [2003:cb:c703:c100:c136:f914:345f:f5f3])
        by smtp.gmail.com with ESMTPSA id e4-20020adfdbc4000000b00228c792aaaasm13288512wrj.100.2022.09.19.02.20.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 02:20:14 -0700 (PDT)
Message-ID: <93c044ca-7d2f-e23f-8eb4-72c133737a15@redhat.com>
Date:   Mon, 19 Sep 2022 11:20:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH -v2] lib/notifier-error-inject: fix error when writing
 errno to debugfs file
Content-Language: en-US
To:     Akinobu Mita <akinobu.mita@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org, corbet@lwn.net, osalvador@suse.de,
        shuah@kernel.org, Zhao Gongyi <zhaogongyi@huawei.com>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Yicong Yang <yangyicong@hisilicon.com>
References: <20220917071427.28499-1-akinobu.mita@gmail.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220917071427.28499-1-akinobu.mita@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 17.09.22 09:14, Akinobu Mita wrote:
> The simple attribute files do not accept a negative value since the
> commit 488dac0c9237 ("libfs: fix error cast of negative value in
> simple_attr_write()"), so we can no longer use DEFINE_SIMPLE_ATTRIBUTE() to
> define a file operations for errno value.
> 
> Fixes: 488dac0c9237 ("libfs: fix error cast of negative value in simple_attr_write()")
> Reported-by: Zhao Gongyi <zhaogongyi@huawei.com>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>

But shouldn't we fix simple_attr_write() instead?

I mean, simple_attr_read() might use attr->fmt to print a signed value, 
but simple_attr_write() fails on signed values now?

I might be wrong, but there is a disconnect. I feel like 
simple_attr_write() should similarly make decisions based on attr->fmt.

> ---
> v2: Fix Reported-by line
> 
>   lib/notifier-error-inject.c | 38 ++++++++++++++++++++++++++++++-------
>   1 file changed, 31 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/notifier-error-inject.c b/lib/notifier-error-inject.c
> index 21016b32d313..30ec41f58d53 100644
> --- a/lib/notifier-error-inject.c
> +++ b/lib/notifier-error-inject.c
> @@ -3,20 +3,44 @@
>   
>   #include "notifier-error-inject.h"
>   
> -static int debugfs_errno_set(void *data, u64 val)
> +static int notifier_err_errno_show(struct seq_file *m, void *data)
>   {
> -	*(int *)data = clamp_t(int, val, -MAX_ERRNO, 0);
> +	int *value = m->private;
> +
> +	seq_printf(m, "%d\n", *value);
> +
>   	return 0;
>   }
>   
> -static int debugfs_errno_get(void *data, u64 *val)
> +static int notifier_err_errno_open(struct inode *inode, struct file *file)
>   {
> -	*val = *(int *)data;
> -	return 0;
> +	return single_open(file, notifier_err_errno_show, inode->i_private);
> +}
> +
> +static ssize_t notifier_err_errno_write(struct file *file, const char __user *ubuf, size_t len,
> +					loff_t *offp)
> +{
> +	struct seq_file *m = file->private_data;
> +	int *value = m->private;
> +	int ret;
> +
> +	ret = kstrtoint_from_user(ubuf, len, 0, value);
> +	if (ret)
> +		return ret;
> +
> +	*value = clamp(*value, -MAX_ERRNO, 0);
> +
> +	return len;
>   }
>   
> -DEFINE_SIMPLE_ATTRIBUTE(fops_errno, debugfs_errno_get, debugfs_errno_set,
> -			"%lld\n");
> +static const struct file_operations fops_errno = {
> +	.owner = THIS_MODULE,
> +	.open = notifier_err_errno_open,
> +	.read = seq_read,
> +	.write = notifier_err_errno_write,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +};
>   
>   static struct dentry *debugfs_create_errno(const char *name, umode_t mode,
>   				struct dentry *parent, int *value)

-- 
Thanks,

David / dhildenb

