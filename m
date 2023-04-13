Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F67C77B6E
	for <linux-doc@archiver.kernel.org>; Thu, 13 Apr 2023 13:09:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbjDMNJJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Apr 2023 09:09:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbjDMNJI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Apr 2023 09:09:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F58049D1
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 06:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681391303;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nLxMOFwtCTuKusCwzTh/CCer82vVpWIO4TFSOoP+UhY=;
        b=LCuwI5Elr6lGFE2gLd0e9ueWLz84t8c7HMC5/3KEsSZGusfiIW0S3dNu9vuubqc2sgcIb1
        wpfA+bz0U9j4eJtG8RLN5Ioz8mgS60ro8CNHSBmrGBhvKlYjGK8Cv4lvsXhk/qw/uKqNEh
        OsDNeLO/KjB1ei+49EmwcioJFfR+now=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-NcFmTVcNMrmbFUBw88ngig-1; Thu, 13 Apr 2023 09:08:22 -0400
X-MC-Unique: NcFmTVcNMrmbFUBw88ngig-1
Received: by mail-wm1-f70.google.com with SMTP id d8-20020a05600c3ac800b003edf7d484d4so4804328wms.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 06:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681391301; x=1683983301;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLxMOFwtCTuKusCwzTh/CCer82vVpWIO4TFSOoP+UhY=;
        b=ADwHJ2bgk3rpCt7t1PFQj4YJgNZr4HW0EF/dsb1l2Hi+aS57CWSIquQPGTBdUU9los
         Xo9Z/QBTnUhEgynXF/uy1yAzIx8A4U7kel2qdF70pm2ZIjumMztHoowVEG/PkcONYm8j
         0KYEF0m7M/J8OjxTbeIBSNA6BvoTDtgZuQQaqUeQjQCWoCOPcmChTmZBUdCNeEsSbdyN
         1ZCIAAWZGamHYJccYw6fZMtT5TXCK5DPP0gLp4Llxp2ilhTzIjZJNHxBnITm1jTM56t7
         qSxEqVHZ9kCJZEdiOVSV5tCo3XT6QBonQjmX8K4Pcr8CBXt4ZtzcDX6snNjcH9NtTVn/
         UA5Q==
X-Gm-Message-State: AAQBX9cnk29Sdh9H2g5oKYL3COY/UzaFzYN2enr86QYQRhDYhQjrgtrX
        x6j61V8EEDBeXAyXrxhmxg2Bp4LGdD2nr4WtbxdrylFmpxswMfsMeEWUiXzKROBQmyCeoNw71P1
        UZ/yOouP7/C0IJXyAmFKE
X-Received: by 2002:a05:600c:2051:b0:3ed:8780:f27b with SMTP id p17-20020a05600c205100b003ed8780f27bmr1888729wmg.16.1681391301107;
        Thu, 13 Apr 2023 06:08:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y55JsVfSG6cqI5hM+rvCoSFl0/EwbLG1ziWZ2V3jk+27V2WCnOKEnjqr3iEAcf0fE0IxV6mQ==
X-Received: by 2002:a05:600c:2051:b0:3ed:8780:f27b with SMTP id p17-20020a05600c205100b003ed8780f27bmr1888702wmg.16.1681391300734;
        Thu, 13 Apr 2023 06:08:20 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id hn25-20020a05600ca39900b003f0a9e986ddsm1282283wmb.24.2023.04.13.06.08.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 06:08:20 -0700 (PDT)
Message-ID: <190bed16-7b7b-a880-9793-cdeb1baef29d@redhat.com>
Date:   Thu, 13 Apr 2023 15:08:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v6 3/3] selftests/mm: add new selftests for KSM
Content-Language: en-US
From:   David Hildenbrand <david@redhat.com>
To:     Stefan Roesch <shr@devkernel.io>, kernel-team@fb.com
Cc:     linux-mm@kvack.org, riel@surriel.com, mhocko@suse.com,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        akpm@linux-foundation.org, hannes@cmpxchg.org, willy@infradead.org,
        Bagas Sanjaya <bagasdotme@gmail.com>
References: <20230412031648.2206875-1-shr@devkernel.io>
 <20230412031648.2206875-4-shr@devkernel.io>
 <7c5606cc-ca58-c505-b0d3-2eec29fe606a@redhat.com>
Organization: Red Hat
In-Reply-To: <7c5606cc-ca58-c505-b0d3-2eec29fe606a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 13.04.23 15:07, David Hildenbrand wrote:
> On 12.04.23 05:16, Stefan Roesch wrote:
>> This adds three new tests to the selftests for KSM.  These tests use the
>> new prctl API's to enable and disable KSM.
>>
>> 1) add new prctl flags to prctl header file in tools dir
>>
>>      This adds the new prctl flags to the include file prct.h in the
>>      tools directory.  This makes sure they are available for testing.
>>
>> 2) add KSM prctl merge test
>>
>>      This adds the -t option to the ksm_tests program.  The -t flag
>>      allows to specify if it should use madvise or prctl ksm merging.
>>
>> 3) add KSM get merge type test
>>
>>      This adds the -G flag to the ksm_tests program to query the KSM
>>      status with prctl after KSM has been enabled with prctl.
>>
>> 4) add KSM fork test
>>
>>      Add fork test to verify that the MMF_VM_MERGE_ANY flag is inherited
>>      by the child process.
>>
>> 5) add two functions for debugging merge outcome
>>
>>      This adds two functions to report the metrics in /proc/self/ksm_stat
>>      and /sys/kernel/debug/mm/ksm.
>>
>> The debugging can be enabled with the following command line:
>> make -C tools/testing/selftests TARGETS="mm" --keep-going \
>>           EXTRA_CFLAGS=-DDEBUG=1
> 
> Would it make sense to instead have a "-D" (if still unused) runtime
> options to print this data? Dead code that's not compiled is a bit
> unfortunate as it can easily bit-rot.
> 
> 
> 
> This patch essentially does two things
> 
> 1) Add the option to run all tests/benchmarks with the PRCTL instead of
> MADVISE
> 
> 2) Add some functional KSM tests for the new PRCTL (fork, enabling
> works, disabling works).
> 
> The latter should rather go into ksm_functional_tests().


"tools/testing/selftests/mm/ksm_functional_tests.c" is what I wanted to say.

-- 
Thanks,

David / dhildenb

