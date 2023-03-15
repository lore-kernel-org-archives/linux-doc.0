Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAEFBC7618A
	for <linux-doc@archiver.kernel.org>; Wed, 15 Mar 2023 20:04:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232424AbjCOUEz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Mar 2023 16:04:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232313AbjCOUEy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Mar 2023 16:04:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F063669A
        for <linux-doc@vger.kernel.org>; Wed, 15 Mar 2023 13:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678910642;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NSv6En10ufoKiHLROyorHfxCgUmhUTCq5rCSmqtwV+g=;
        b=VVYBuAQlNeYDZ3JPoaYcZu/dADY8xHL58pL+dWnJVpEWpQ48TDBlg47tIDZ1WKY9LMvpfJ
        FbrWMGZQ8vsQ6cudxwrqeqJiLBkr6b+yCRMWToYs6EFFksHr/tRm6u89AOf7NJ/tBnKhQ/
        x+sn444a1mKJnA2Ff/aQtanSY8pm6vs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-Br6l5QByMfiBqzEY-yKqbA-1; Wed, 15 Mar 2023 16:04:00 -0400
X-MC-Unique: Br6l5QByMfiBqzEY-yKqbA-1
Received: by mail-wr1-f70.google.com with SMTP id u5-20020a5d6da5000000b002cd82373455so3458161wrs.9
        for <linux-doc@vger.kernel.org>; Wed, 15 Mar 2023 13:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678910639;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NSv6En10ufoKiHLROyorHfxCgUmhUTCq5rCSmqtwV+g=;
        b=uTR1KzX8pFptrfCqBwbsrN1vQMMKhnLQ9iCTwhR5AuceIsXhN2mEaKaiL5p8lZiPkR
         ZO6+bVdzT1jAxrObBAKUJzPX/9Q4JrV8qpqWNgNtzr6chfHzYj8JTXCRfQgtV2srn1FV
         rpZKYZVkUOSASZ+S8PQvgbVYhocm62uCvI/dAJoIjPMsdLzBHp9atoRemcbIkCydaA9e
         Atw6Swf8H9WUnAuYI31MvYPHzrhHuvByaOG/4jWxAGcIGayeFafl3apBPGWswXkViUQb
         1SGTD5L05Vz3Bc1jM/A1w2bkCG3RH8EX3yXOWvc+qPYNQKIgULDYGtZ6oyw9YKNuA8J2
         bXUg==
X-Gm-Message-State: AO0yUKXnfUROLgrASHJ06mVB9KnosOmAyQLrGPFLnJ7KJH52QwiICfY1
        4E4fQdrbVgvShOEj6DYIHvNCCEUxD1j3ijIT8FcSS3ZjdH/Tpr/9hPYl4HqpPH2IVdWjmX+xvTL
        mzzFDDwyLdpvWP4VvMPtR
X-Received: by 2002:a5d:5913:0:b0:2cf:e449:1a9e with SMTP id v19-20020a5d5913000000b002cfe4491a9emr3337066wrd.30.1678910639403;
        Wed, 15 Mar 2023 13:03:59 -0700 (PDT)
X-Google-Smtp-Source: AK7set8jbsZ/lktzSE96GY2vi72nsu08J4PQCvtujDalLrYzPL/tXRo3i0vfV9CbR6FW+MilGp1Xyg==
X-Received: by 2002:a5d:5913:0:b0:2cf:e449:1a9e with SMTP id v19-20020a5d5913000000b002cfe4491a9emr3337032wrd.30.1678910639032;
        Wed, 15 Mar 2023 13:03:59 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:2f00:2038:213d:e59f:7d44? (p200300cbc7022f002038213de59f7d44.dip0.t-ipconnect.de. [2003:cb:c702:2f00:2038:213d:e59f:7d44])
        by smtp.gmail.com with ESMTPSA id c18-20020a5d4cd2000000b002ce9f0e4a8fsm5479753wrt.84.2023.03.15.13.03.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 13:03:58 -0700 (PDT)
Message-ID: <273a2f82-928f-5ad1-0988-1a886d169e83@redhat.com>
Date:   Wed, 15 Mar 2023 21:03:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Stefan Roesch <shr@devkernel.io>, kernel-team@fb.com
Cc:     linux-mm@kvack.org, riel@surriel.com, mhocko@suse.com,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        akpm@linux-foundation.org, hannes@cmpxchg.org,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Rik van Riel <riel@surriel.com>
References: <20230310182851.2579138-1-shr@devkernel.io>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v4 0/3] mm: process/cgroup ksm support
In-Reply-To: <20230310182851.2579138-1-shr@devkernel.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10.03.23 19:28, Stefan Roesch wrote:
> So far KSM can only be enabled by calling madvise for memory regions. To
> be able to use KSM for more workloads, KSM needs to have the ability to be
> enabled / disabled at the process / cgroup level.
> 
> Use case 1:
> The madvise call is not available in the programming language. An example for
> this are programs with forked workloads using a garbage collected language without
> pointers. In such a language madvise cannot be made available.
> 
> In addition the addresses of objects get moved around as they are garbage
> collected. KSM sharing needs to be enabled "from the outside" for these type of
> workloads.
> 
> Use case 2:
> The same interpreter can also be used for workloads where KSM brings no
> benefit or even has overhead. We'd like to be able to enable KSM on a workload
> by workload basis.
> 
> Use case 3:
> With the madvise call sharing opportunities are only enabled for the current
> process: it is a workload-local decision. A considerable number of sharing
> opportuniites may exist across multiple workloads or jobs. Only a higler level
> entity like a job scheduler or container can know for certain if its running
> one or more instances of a job. That job scheduler however doesn't have
> the necessary internal worklaod knowledge to make targeted madvise calls.
> 
> Security concerns:
> In previous discussions security concerns have been brought up. The problem is
> that an individual workload does not have the knowledge about what else is
> running on a machine. Therefore it has to be very conservative in what memory
> areas can be shared or not. However, if the system is dedicated to running
> multiple jobs within the same security domain, its the job scheduler that has
> the knowledge that sharing can be safely enabled and is even desirable.
> 
> Performance:
> Experiments with using UKSM have shown a capacity increase of around 20%.

Stefan, can you do me a favor and investigate which pages we end up 
deduplicating -- especially if it's mostly only the zeropage and if it's 
still that significant when disabling THP?


I'm currently investigating with some engineers on playing with enabling 
KSM on some selected processes (enabling it blindly on all VMAs of that 
process via madvise() ).

One thing we noticed is that such (~50 times) 20MiB processes end up 
saving ~2MiB of memory per process. That made me suspicious, because 
it's the THP size.

What I think happens is that we have a 2 MiB area (stack?) and only 
touch a single page. We get a whole 2 MiB THP populated. Most of that 
THP is zeroes.

KSM somehow ends up splitting that THP and deduplicates all resulting 
zeropages. Thus, we "save" 2 MiB. Actually, it's more like we no longer 
"waste" 2 MiB. I think the processes with KSM have less (none) THP than 
the processes with THP enabled, but I only took a look at a sample of 
the process' smaps so far.

I recall that there was a proposal to split underutilized THP and free 
up the zeropages (IIRC Rik was involved).

I also recall that Mike reported memory waste due to THP.

-- 
Thanks,

David / dhildenb

