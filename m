Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A83A1C32793
	for <linux-doc@archiver.kernel.org>; Wed, 18 Jan 2023 19:02:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbjARTCV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Jan 2023 14:02:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbjARTBV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Jan 2023 14:01:21 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22C7959B78
        for <linux-doc@vger.kernel.org>; Wed, 18 Jan 2023 11:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674068407;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6VHgRLoz21ZdB+avm4AD7iQRbs1S2YR2I/6RIM3KpT8=;
        b=gChD95YacVi06h5XJVt7NIlIdu3Y8I1fbRBtB9okF+aThKY5IdFv0qEHZHSTAvJD6fIt2g
        1WlJfT52SNgpOrQnInZZ5pRwKx1GOKjBhQO3XBhP9m0Sfk68zvRSfUkbiMbZIU83EB+AsX
        CpkvkfgCaj+B9rkgWwrcI/Qd8IyPmIc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-164-KnT496o9MAOoUOKMmRBW-Q-1; Wed, 18 Jan 2023 14:00:04 -0500
X-MC-Unique: KnT496o9MAOoUOKMmRBW-Q-1
Received: by mail-ej1-f72.google.com with SMTP id wz4-20020a170906fe4400b0084c7e7eb6d0so24577434ejb.19
        for <linux-doc@vger.kernel.org>; Wed, 18 Jan 2023 11:00:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6VHgRLoz21ZdB+avm4AD7iQRbs1S2YR2I/6RIM3KpT8=;
        b=e2N9tQycMgDnjcJTbpLQ+m5rFjIb7pNmcMSvfsVs4bEFnOh7nCTKF28CjrJJvCPYFT
         6g5XTmap3sobM49rMmB5TNIJzdIhB1Ex5P7WAFV/x0YrfCMpKdp2ZwSiR6CAX08/RM+8
         fHcvdxYxC0IP8p0R2UxpUqSfaZ0ZhdezQog+omfW6oIZkE9Fwgu8rGPgWsMeEY1yg1aK
         yzyavjLRRSXE60herKqgZkz6IE3jakCgsWLUaF2YKet0C/KayinA110Y3+Z9YmTGxVzp
         A3EPz1XyF5EQuAFaiBZpZ1jFHLw4X0G4U3ua9YFd84wUNIwSIWpaftuMNMkcIra+/EaL
         hofQ==
X-Gm-Message-State: AFqh2kqDQ4kd9dHvOj1kRQY0ChgAxuYTBO6uINPcGrjUtzw1h5bJU2sF
        U+4mi3mjqxFPwXbqDD5cbUWvzP4eujDlEPx2x/RD9LQgSHIuP/qV/xCApJ75zCPRzzWK4j8YJ7u
        cyw4Zm6nke4R3Y+xoQyaD
X-Received: by 2002:a17:907:8dca:b0:85f:5d72:1841 with SMTP id tg10-20020a1709078dca00b0085f5d721841mr8927948ejc.39.1674068402880;
        Wed, 18 Jan 2023 11:00:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtsdunAhuQoXTg/VSvgVA6q/ZXPxkW/qMVvnmose4gPIQY/RC2Jhhnm+VqSnkVslMwPuQBExQ==
X-Received: by 2002:a17:907:8dca:b0:85f:5d72:1841 with SMTP id tg10-20020a1709078dca00b0085f5d721841mr8927939ejc.39.1674068402689;
        Wed, 18 Jan 2023 11:00:02 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c? ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
        by smtp.gmail.com with ESMTPSA id t1-20020a1709061be100b0086f40238403sm5244115ejg.223.2023.01.18.11.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 11:00:02 -0800 (PST)
Message-ID: <9830b666-b78c-9794-0d4a-7de31b9fd9b5@redhat.com>
Date:   Wed, 18 Jan 2023 20:00:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH drm-next 02/14] drm/exec: fix memory leak in
 drm_exec_prepare_obj()
Content-Language: en-US
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        daniel@ffwll.ch, airlied@redhat.com, bskeggs@redhat.com,
        jason@jlekstrand.net, tzimmermann@suse.de, mripard@kernel.org,
        corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-3-dakr@redhat.com>
 <3c3bd64a-164b-7ff2-ebf0-c8f9c2f94b72@amd.com>
From:   Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <3c3bd64a-164b-7ff2-ebf0-c8f9c2f94b72@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 1/18/23 09:51, Christian König wrote:
> That one should probably be squashed into the original patch.

Yes, just wanted to make it obvious for you to pick it up in case you 
did not fix it already yourself.

> 
> Christian.
> 
> Am 18.01.23 um 07:12 schrieb Danilo Krummrich:
>> Don't call drm_gem_object_get() unconditionally.
>>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_exec.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
>> index ed2106c22786..5713a589a6a3 100644
>> --- a/drivers/gpu/drm/drm_exec.c
>> +++ b/drivers/gpu/drm/drm_exec.c
>> @@ -282,7 +282,6 @@ int drm_exec_prepare_obj(struct drm_exec *exec, 
>> struct drm_gem_object *obj,
>>               goto error_unlock;
>>       }
>> -    drm_gem_object_get(obj);
>>       return 0;
>>   error_unlock:
> 

