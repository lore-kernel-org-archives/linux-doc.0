Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF54C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 30 Sep 2022 08:33:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbiI3IdJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Sep 2022 04:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbiI3IdH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Sep 2022 04:33:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49795105D62
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 01:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664526783;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BQ5gZ6bT2BXV787qrrKGQYFWxueLE8QhlhnLUB2rrGg=;
        b=VziK5ZQdsfIwRGws6uU2Rl+FMO1T+qjJXhbjbxUcAQ+SCnUWp4MsqtC8XIIffpLWx1RKgi
        dGSgxpKm8XWNmRd/8v1viSNqL/c28UQ8fKvVTg5uzmLbpZTNNh9segikjg+OvWjRZ85vmZ
        ITfQULum+SJXTXfex0Io8ynEU0W7bd8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-263-eolDrZ8aOzOIQRhwDeNOIQ-1; Fri, 30 Sep 2022 04:33:01 -0400
X-MC-Unique: eolDrZ8aOzOIQRhwDeNOIQ-1
Received: by mail-wr1-f70.google.com with SMTP id r22-20020adfa156000000b0022cc3018fbaso1299569wrr.2
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 01:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=BQ5gZ6bT2BXV787qrrKGQYFWxueLE8QhlhnLUB2rrGg=;
        b=ZoEH0Zvx6SbXYh1BYtfImx6dE/x9AG5BvZgYOlgPIIKel83FQECpZ1iwlAejkvYCjt
         ouyxT62M5JW6XQE1ICjPWIWIM2KtVx0cJghmEZupu1s5wCXQNWEVNBrflwwiNo9uZh/Y
         Nh/J19hpoTDLTzi56xZcooZgWot41wphrTeYIxvEbKHNT8Xs+yYOlyE5jLLJtwE6pG73
         MvG1/jjN0K5bE2AErF0/VmJHpPlaBn1YKmadCQXnzqL7LyLWKYNJ0Kw1c6A+r546uUku
         9bTo8P+q1Rcf3B4zKrFeNaI0BTcE9JMv/5c3W36/iHUtB/eMTjvg/tLMcfqJ1K0zhXXj
         n+tA==
X-Gm-Message-State: ACrzQf2yYkpscQJP9KBECv4iitqWi+Nrj9hR47T8jwPkwYvJRKSkMUVw
        hZQ9b3uJG/WXGDTVil03H7BeHFbRYf9ZlEL7bE0cS8aEOS6E/SvGLFFKpG4/JZOzRjyTYVbkpW2
        AxToracq7NTRMORditas+
X-Received: by 2002:a05:6000:2ad:b0:22a:399b:5611 with SMTP id l13-20020a05600002ad00b0022a399b5611mr5097675wry.434.1664526780594;
        Fri, 30 Sep 2022 01:33:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6BggB4PAQL9WnQm9Jcg4NtjrhEsaMOQneWlKdBdhs/6z+OcuyCuOZtBBg4ExM/WvGTFSIg9g==
X-Received: by 2002:a05:6000:2ad:b0:22a:399b:5611 with SMTP id l13-20020a05600002ad00b0022a399b5611mr5097665wry.434.1664526780357;
        Fri, 30 Sep 2022 01:33:00 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70c:c00:48b:b68a:f9e0:ebce? (p200300cbc70c0c00048bb68af9e0ebce.dip0.t-ipconnect.de. [2003:cb:c70c:c00:48b:b68a:f9e0:ebce])
        by smtp.gmail.com with ESMTPSA id u15-20020a05600c19cf00b003a2f2bb72d5sm8554440wmq.45.2022.09.30.01.32.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 01:32:59 -0700 (PDT)
Message-ID: <ed43e84a-60af-1e04-b635-9f03a720f258@redhat.com>
Date:   Fri, 30 Sep 2022 10:32:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH -next v5 1/4] selftests/memory-hotplug: Add checking after
 online or offline
Content-Language: en-US
To:     Zhao Gongyi <zhaogongyi@huawei.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org
Cc:     akinobu.mita@gmail.com, corbet@lwn.net, osalvador@suse.de,
        shuah@kernel.org
References: <20220930063527.108389-1-zhaogongyi@huawei.com>
 <20220930063527.108389-2-zhaogongyi@huawei.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220930063527.108389-2-zhaogongyi@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 30.09.22 08:35, Zhao Gongyi wrote:
> Add checking for online_memory_expect_success()/
> offline_memory_expect_success()/offline_memory_expect_fail(), or
> the test would exit 0 although the functions return 1.
> 
> Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

