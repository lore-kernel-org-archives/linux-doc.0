Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E175C77B76
	for <linux-doc@archiver.kernel.org>; Mon, 17 Apr 2023 14:58:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230432AbjDQO6y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Apr 2023 10:58:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbjDQO6p (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Apr 2023 10:58:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 521F1AD0B
        for <linux-doc@vger.kernel.org>; Mon, 17 Apr 2023 07:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681743398;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9AEy9mK6O3Mbv/ulbvFXi8BBb8TRpaehy7L8tKOiCn8=;
        b=ZI5NwFhtmpYm+zuQt7ISV5mJV9sXS9QcTgG35HafGPXzuJ5ytGZ5mOJWuTb742mCUR9Z5r
        0qSQi53pMGuKXfuefEq4bPnvMBxep1yrjEMfv3+eQIbHwZd8WP6s2E0POgfZkcSPtaTbNu
        JOXoPWHS72721gG1+smjHU86MO4EFnU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-sJWipWhvNa2gIz3adKD9Lg-1; Mon, 17 Apr 2023 10:56:36 -0400
X-MC-Unique: sJWipWhvNa2gIz3adKD9Lg-1
Received: by mail-wm1-f71.google.com with SMTP id n9-20020a05600c4f8900b003ee21220fccso10811787wmq.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Apr 2023 07:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681743395; x=1684335395;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9AEy9mK6O3Mbv/ulbvFXi8BBb8TRpaehy7L8tKOiCn8=;
        b=U6C/78RvJ0zNbasM5dn3TanV9HaF3m2TgEDMCYVvkOYHOravY7tEcxvtk/zYHQT257
         NewtMdvOBdHZZL+ioAqKkZ967NbcqdNFgVciav1mf3QJAZnoL3JK7VdBxxqveJdXxEra
         DnOolSFbTdAhZEOYgNnxyuFkXa9D8TZWqyJn4tpA92oP2MhibXL7pSN0YzC+CPTY24Q7
         DMrV1AVh5BrjSClmaohPdfuaO26bsjAqkWfnE2HeYaO0SdLZhbSDXmJxL+h6lX3eL9yc
         2OK9Rlea4Di2WnXOhobSRo4ehcuRtfZR5XV7ZWH6FuOYrBdLWHsE8S77CKVY3+YKUmSx
         31tw==
X-Gm-Message-State: AAQBX9eiSFPJExQc/Zn2y3oVwRQXJeWMI9EPwS91vc+Tt9YmLCwm60rQ
        U+KEVNQldDj/DrrjOgZYSzn1zQugenkG6o1hbfYZUzj1r1B57u8JTVq17lQEXmY5up2y3kTI1Rf
        6gXu46wli/SRjcNsiWTYF
X-Received: by 2002:a1c:6a10:0:b0:3f1:7324:c81d with SMTP id f16-20020a1c6a10000000b003f17324c81dmr2928933wmc.14.1681743395474;
        Mon, 17 Apr 2023 07:56:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350a6ddKymR8nlcmLUE/5sBw6TnJoW0qmSC81AMGo1SYFyxMxj5tFc0W5AcAdnFpqPUjwD1aYVg==
X-Received: by 2002:a1c:6a10:0:b0:3f1:7324:c81d with SMTP id f16-20020a1c6a10000000b003f17324c81dmr2928915wmc.14.1681743395171;
        Mon, 17 Apr 2023 07:56:35 -0700 (PDT)
Received: from ?IPV6:2003:cb:c700:fc00:db07:68a9:6af5:ecdf? (p200300cbc700fc00db0768a96af5ecdf.dip0.t-ipconnect.de. [2003:cb:c700:fc00:db07:68a9:6af5:ecdf])
        by smtp.gmail.com with ESMTPSA id v22-20020a7bcb56000000b003f049a42689sm12161191wmj.25.2023.04.17.07.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 07:56:34 -0700 (PDT)
Message-ID: <954d6b1f-5b4d-48e5-02fe-646b3e79f6e5@redhat.com>
Date:   Mon, 17 Apr 2023 16:56:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v8 3/3] selftests/mm: add new selftests for KSM
Content-Language: en-US
From:   David Hildenbrand <david@redhat.com>
To:     Stefan Roesch <shr@devkernel.io>, kernel-team@fb.com
Cc:     linux-mm@kvack.org, riel@surriel.com, mhocko@suse.com,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        akpm@linux-foundation.org, hannes@cmpxchg.org, willy@infradead.org,
        Bagas Sanjaya <bagasdotme@gmail.com>
References: <20230415225913.3206647-1-shr@devkernel.io>
 <20230415225913.3206647-4-shr@devkernel.io>
 <355f42d1-4354-376d-ab27-7e55d06e64a6@redhat.com>
Organization: Red Hat
In-Reply-To: <355f42d1-4354-376d-ab27-7e55d06e64a6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 17.04.23 16:35, David Hildenbrand wrote:
>> +/* Verify that KSM can be enabled / queried with prctl. */
>> +static void test_prctl(void)
>> +{
>> +	int ret;
>> +
>> +	ksft_print_msg("[RUN] %s\n", __func__);
>> +
>> +	ret = prctl(PR_SET_MEMORY_MERGE, 1, 0, 0, 0);
>> +	if (ret < 0 && errno == EINVAL) {
>> +		ksft_test_result_skip("PR_SET_MEMORY_MERGE not supported\n");
>> +		return;
>> +	} else if (ret) {
>> +		ksft_test_result_fail("PR_SET_MEMORY_MERGE=1 failed\n");
>> +	}
> 
> Just realized we're missing a "return;" in case of the failure here.
> 


And we should probably fix that as well:

ERROR: do not initialise globals to 0
#235: FILE: tools/testing/selftests/mm/ksm_tests.c:57:
+int debug = 0;

total: 1 errors, 0 warnings, 512 lines checked


-- 
Thanks,

David / dhildenb

