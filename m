Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E2FEB64DA
	for <linux-doc@archiver.kernel.org>; Wed, 12 Jul 2023 19:10:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231774AbjGLTKS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 Jul 2023 15:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbjGLTKR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Jul 2023 15:10:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 126C4198A
        for <linux-doc@vger.kernel.org>; Wed, 12 Jul 2023 12:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689188969;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iVqzN+gEicp3rJj4Bqvo5xYs3/pSCObCBEs+9bPEbpA=;
        b=PEQ/pCYPQUZ1Wzt8eLRl1f2DjsneFPWUoS00X5lvwCZLo6aDnPyTtJ2W3/K+G7GgquV/Pa
        /dUYT3ExTwE36D06a3BSw1g8kuTTUFPr1+hAB2KkUvT3Upap5PY/NtR2aI0XGbXLsJR9WR
        mLofv13gSv2gHvxcvTsYlKqrToSXxOE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-7UvtcraQPXCVLf9eC5hIeA-1; Wed, 12 Jul 2023 15:09:27 -0400
X-MC-Unique: 7UvtcraQPXCVLf9eC5hIeA-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-31273e0507dso4675751f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 12 Jul 2023 12:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689188966; x=1691780966;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iVqzN+gEicp3rJj4Bqvo5xYs3/pSCObCBEs+9bPEbpA=;
        b=KXKFYovVJlp2cWK0DiJwkTk5IOFIr87M+1EVEmql0FO82Il9C5i4pWk+tUoLwlFPvp
         w+0VdUnbqoenWawP+IDVw/J/sFLTb5V8kOyKohceEO32f75XJr7PUV9bpqzbo6cVZGnE
         ExFDA/+sgqKKXsF/Nx2r9ic0/FstwtTHJwNNJtNqKeEBrne8KghtqqQodpa8Pm8jBwWW
         qhyd+w9taMHkEnyvfe6kNKy7kJPm240/3mzX/+cS68fb0UjrjJlbiFeNPhQ3IAgCcQZG
         3s3HuEq9Z97G/6ZVT8FnS8Yf4pdkrtPtaKP0vArvZrFW4qGKRAXWF7J49SNy9SRDd+bh
         +JxQ==
X-Gm-Message-State: ABy/qLa+rcFvUH5CSgwA1wKmBZz2isBzmfFDjrl+LncV5ZiLznoekTie
        W+yzE+AKBexyghjcRhMd9UAek/a6c7HwSik2/ktDN9qo81F5C/PFXaG1RZ3ogoDxWtrEQ67p53h
        ChrLCbq63olvsieM9LnjVgS62BnPF
X-Received: by 2002:adf:ffca:0:b0:313:f704:5450 with SMTP id x10-20020adfffca000000b00313f7045450mr17948893wrs.38.1689188966791;
        Wed, 12 Jul 2023 12:09:26 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGMK+WYDzTjQtshzShQXsCucWYnUSAX3VLVEDUYHUPnftGCYTbdQEGcxTHN4+POng/GRwpVKA==
X-Received: by 2002:adf:ffca:0:b0:313:f704:5450 with SMTP id x10-20020adfffca000000b00313f7045450mr17948880wrs.38.1689188966442;
        Wed, 12 Jul 2023 12:09:26 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:3700:3eea:ace6:5bde:4478? (p200300cbc70737003eeaace65bde4478.dip0.t-ipconnect.de. [2003:cb:c707:3700:3eea:ace6:5bde:4478])
        by smtp.gmail.com with ESMTPSA id f6-20020adff586000000b003142eb75724sm5825120wro.24.2023.07.12.12.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 12:09:25 -0700 (PDT)
Message-ID: <7449914a-1ae3-9ea8-b60b-f0314999b790@redhat.com>
Date:   Wed, 12 Jul 2023 21:09:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1] mm/memory_hotplug: document the signal_pending() check
 in offline_pages()
Content-Language: en-US
To:     Michal Hocko <mhocko@suse.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>
References: <20230711174050.603820-1-david@redhat.com>
 <ZK2/3Kq8VlDwcCpc@dhcp22.suse.cz>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <ZK2/3Kq8VlDwcCpc@dhcp22.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11.07.23 22:47, Michal Hocko wrote:
> On Tue 11-07-23 19:40:50, David Hildenbrand wrote:
>> Let's update the documentation that any signal is sufficient, and
>> add a comment that not only checking for fatal signals is historical
>> baggage: changing it now could break existing user space. although
>> unlikely.
>>
>> For example, when an app provides a custom SIGALRM handler and triggers
>> memory offlining, the timeout cmd would no longer stop memory offlining,
>> because SIGALRM would no longer be considered a fatal signal.
> 
> Yes, and it is likely goot to mention here that this is an antipattern
> for many other kernel operations like IO (e.g. write) but it is a long
> term behavior that somebody might depend on and it is safer to reflect
> the documentation to the realitity rather than other way around (which
> would be imho better).
> 

You mean adding something like

"Note that using signal_pending() instead of fatal_signal_pending() is 
an anti-pattern, but slowly deprecating that behavior to eventually 
change it in the far future is probably not worth the effort. If this 
ever becomes relevant for user-space, we might want to rethink."


Thanks!

-- 
Cheers,

David / dhildenb

