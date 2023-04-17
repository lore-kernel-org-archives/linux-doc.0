Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ECD7C77B7D
	for <linux-doc@archiver.kernel.org>; Mon, 17 Apr 2023 08:05:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230305AbjDQIFK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Apr 2023 04:05:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231228AbjDQIE6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Apr 2023 04:04:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEBF93AA8
        for <linux-doc@vger.kernel.org>; Mon, 17 Apr 2023 01:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681718654;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HQ9zPP2ip4epjGkJ+lxtvvPvIDCjUTCQlgGLaDEyfd4=;
        b=B1Lxt7X6s+2qRHS3BRWY36cQ+iGRVtV4FQJ+C3y8dtvEMH2jlyzMwQ6EKRbldg/hTbIAAx
        i718t7hBBNshawaHogImXF5rjaE9K6PO9cmQk60uPe7LnhmhBCaBNJYuJbD7yVEf1qLGu+
        93C8NY+xRpnsX9HySUNxOKW6zqDEUd0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-Aojeq6uyPmGE_kb2kGi0WQ-1; Mon, 17 Apr 2023 04:04:12 -0400
X-MC-Unique: Aojeq6uyPmGE_kb2kGi0WQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3f08ed462c0so19835225e9.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Apr 2023 01:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681718651; x=1684310651;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQ9zPP2ip4epjGkJ+lxtvvPvIDCjUTCQlgGLaDEyfd4=;
        b=iwyvYq+sFClOdNx9U6vzDIW3d7SFMBMYp3tfc+QZn0Dh4/wMrwl1kh2jmvUtRHuVPX
         nNIQDXXoR5CZ4t7Z0AyzfhX3qD2eEdkT3WIhit93a+InE+ls6kFT22rEInanuXKPf76T
         etfcBEpW3Dc5cx+8+JFSvY9EMN3o3ILOJIf0pRKpSPzaCYClM3sPnc29143zgcrDrITv
         exnBVkb/DhZnQA81Zl9Y3usXJeEEt4XyCGxyi21/NO75brBXA9ICh7CgHXRCV8z+v0Mm
         x5WJY14lGI3+yW5zQZr9WsdZeCFVEwg3UlyZ29sk2qtFgdxhaS+p/EDXLO79S05d+ejB
         lPDg==
X-Gm-Message-State: AAQBX9cMKvqHYuFwxkIX/ti5Hy3pdEACvOszK4qM1cwt+zL3VLsem/sd
        Xh8N/j2BrPniQe+ySOSmHyyZtgZ/pSCWeTo8OrweEJ1mOiZq1960vAMal6EeJWgEdpOaFauJ7i5
        WpvbsyszUVYN7u/Dle7bd
X-Received: by 2002:adf:dd82:0:b0:2ee:687c:5252 with SMTP id x2-20020adfdd82000000b002ee687c5252mr4647523wrl.24.1681718651718;
        Mon, 17 Apr 2023 01:04:11 -0700 (PDT)
X-Google-Smtp-Source: AKy350a+sWHNJ0uAEkLYFXyFh5ON7iFfCf3hO4QWXYa+ZjNC0dSeFzjTN8FLYHLiEz20+iPZSmUKLw==
X-Received: by 2002:adf:dd82:0:b0:2ee:687c:5252 with SMTP id x2-20020adfdd82000000b002ee687c5252mr4647501wrl.24.1681718651381;
        Mon, 17 Apr 2023 01:04:11 -0700 (PDT)
Received: from ?IPV6:2003:cb:c700:fc00:db07:68a9:6af5:ecdf? (p200300cbc700fc00db0768a96af5ecdf.dip0.t-ipconnect.de. [2003:cb:c700:fc00:db07:68a9:6af5:ecdf])
        by smtp.gmail.com with ESMTPSA id d14-20020a5d538e000000b002f81b4227cesm5953920wrv.19.2023.04.17.01.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 01:04:11 -0700 (PDT)
Message-ID: <12011875-f4f4-2aad-4720-326d872bd3e8@redhat.com>
Date:   Mon, 17 Apr 2023 10:04:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v7 3/3] selftests/mm: add new selftests for KSM
Content-Language: en-US
To:     Stefan Roesch <shr@devkernel.io>
Cc:     kernel-team@fb.com, linux-mm@kvack.org, riel@surriel.com,
        mhocko@suse.com, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org, akpm@linux-foundation.org,
        hannes@cmpxchg.org, willy@infradead.org,
        Bagas Sanjaya <bagasdotme@gmail.com>
References: <20230413233115.1878303-1-shr@devkernel.io>
 <20230413233115.1878303-4-shr@devkernel.io>
 <da0ded70-bb4d-2dab-233f-326ae7bfa626@redhat.com>
 <qvqw8reugp1s.fsf@devbig1114.prn1.facebook.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <qvqw8reugp1s.fsf@devbig1114.prn1.facebook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 14.04.23 22:54, Stefan Roesch wrote:
> 
> David Hildenbrand <david@redhat.com> writes:
> 
>> Thanks for moving the functional tests. Some more feedback forksm_functional_tests change. Writing tests in the
>> ksft testing framework can be a bit "special".
>>
>>
>> I'm seeing some weird test failures due to
>>
>> prctl(PR_GET_MEMORY_MERGE, 0)
>>
>> Apparently, these go away when using
>>
>> prctl(PR_GET_MEMORY_MERGE, 0, 0, 0, 0)
>>
> 
> I changed the test programs to always specify all the 5 parameters.
> 

Thanks!

-- 
Thanks,

David / dhildenb

