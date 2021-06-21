Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48418C4743C
	for <linux-doc@archiver.kernel.org>; Mon, 21 Jun 2021 11:50:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31BFC6112D
	for <linux-doc@archiver.kernel.org>; Mon, 21 Jun 2021 11:50:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbhFULxG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Jun 2021 07:53:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59817 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229640AbhFULxF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Jun 2021 07:53:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624276251;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9KrUT04ET7j9PxJUik4TN78ZN7Dz6iXoztaQ6uI00AE=;
        b=WZ14MuBfGzxosqcVhgTXAvvP3XWrSKX8Gz47B485soWYLXla2MY1zNAb2oryD1XlDq1KJ6
        1XPmkGPQukVTP4d6QwGG4mSQUus9+7Bvr0HWAp2aaeX79xSABV1b/W9xJmfxlKMAfdHlGo
        YLzVmlkpHE3yPW0UHWNkDY9yJad0yTk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-PQJ0pC7jOYyRK1FneiJGvQ-1; Mon, 21 Jun 2021 07:50:49 -0400
X-MC-Unique: PQJ0pC7jOYyRK1FneiJGvQ-1
Received: by mail-ed1-f70.google.com with SMTP id x10-20020aa7cd8a0000b0290394bdda92a8so695336edv.8
        for <linux-doc@vger.kernel.org>; Mon, 21 Jun 2021 04:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9KrUT04ET7j9PxJUik4TN78ZN7Dz6iXoztaQ6uI00AE=;
        b=oMoHDNa3olB6bdN+6sSQvvDdAclNTtKTIJJRhPtCskWCl0V0FCeh2wIxqzlhUHQGrJ
         9WeE/jYUL/bs5K7dphw9dJjvvxcXOWxhbGBpGiBJ9Zadf04Y5LZHakgB7YJp/ozFadrU
         z1PQr7xIGMMRAJv58Y4R+jIsycS0kFNpY4oSy6ySGSN9VsZLG4UuJo0bUZAbpTxPZAZ3
         FcTIRks3h+iZ3Ae7/mp+wyrE8Y5o6oebYUQC5ATw2zD/ODQFalrfRpgoE5K87AwG5eOs
         GWerfqgTNNXOpOXfC79LTsFpKa3d+5RZRiQmpSbzhVjihwmElpmtX08SAK+MJVp6Es5N
         WxeA==
X-Gm-Message-State: AOAM530nhotX1r8kD7ffjBsJK1f7qrvwkn72V070I1VTAd81Mt5UMsZs
        RU8DqmJvd6nZjcLdLEpbLF24gT1xqc/XAx3BLwY0CIXW9qyRwKg1e1OUIF9YyIgVhWzu0QfUD6I
        OFZ6KH7FwAela+xy74NG5
X-Received: by 2002:aa7:dccb:: with SMTP id w11mr20386543edu.96.1624276248849;
        Mon, 21 Jun 2021 04:50:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSjuxC/PSf0i5LWbsHxybj9qFxn7JBf807PcTs7lndnICmXQsULopHSpuAfZ1OwRldiHnC6A==
X-Received: by 2002:aa7:dccb:: with SMTP id w11mr20386518edu.96.1624276248722;
        Mon, 21 Jun 2021 04:50:48 -0700 (PDT)
Received: from x1.bristot.me (host-79-23-205-114.retail.telecomitalia.it. [79.23.205.114])
        by smtp.gmail.com with ESMTPSA id r17sm10360218edt.33.2021.06.21.04.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 04:50:48 -0700 (PDT)
Subject: Re: [PATCH V4 06/12] trace: Add a generic function to read/write u64
 values from tracefs
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Phil Auld <pauld@redhat.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Kate Carcia <kcarcia@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Clark Willaims <williams@redhat.com>,
        John Kacur <jkacur@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1623746916.git.bristot@redhat.com>
 <681a2fb508b3dad2979ac705c3df633f14abb9b2.1623746916.git.bristot@redhat.com>
 <20210618125651.7de04840@oasis.local.home>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <1a8ccc87-6f04-7918-65ad-76c0cf13af07@redhat.com>
Date:   Mon, 21 Jun 2021 13:50:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210618125651.7de04840@oasis.local.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/18/21 6:56 PM, Steven Rostedt wrote:
>> +        return simple_read_from_buffer(ubuf, cnt, ppos, buf, len);
> Egad, this entire patch is filled with whitespace issues!
> 
> Please check your other patches too.

<talking to myself>
daniel daniel daniel.... after all these years...
</talking to myself>

Sorry... it was only in this patch.

>> +}
>> +
> 
>> +
>> +#define ULL_STR_SIZE		22	/* 20 digits max */
> Nit. I'd make this 24, just to be integer aligned. I mean, it's used as:
> 
> 
> trace_min_max_read(struct file *filp, char __user *ubuf, size_t cnt,
> 		      loff_t *ppos)
> {
> 	struct trace_min_max_param *param = filp->private_data;
> 	char buf[ULL_STR_SIZE];
> 	u64 val;
> 	int len;
> 
> Probably should reverse the above as well, that way if you do have
> ULL_STR_SIZE as 24, then the int len, will fit right in before the u64
> val. Although, I think compilers are free to optimize that too :-/

I will do that!

-- Daniel

> -- Steve
> 

