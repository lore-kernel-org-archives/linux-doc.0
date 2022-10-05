Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A573C433FE
	for <linux-doc@archiver.kernel.org>; Wed,  5 Oct 2022 06:27:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbiJEG1h (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 5 Oct 2022 02:27:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbiJEG1f (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Oct 2022 02:27:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAB2E74BAD
        for <linux-doc@vger.kernel.org>; Tue,  4 Oct 2022 23:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664951253;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Hzgr+GJhjprVie4kFrMDBNKKq7b6UhoiqIdbK544F4E=;
        b=V2pcW8pfnK2k0nFcECm0LecMnB3vZkMTRUXdSdYRuetceQK/ToYQUWbSUi/qr0Aiqokysm
        4bg0TZmEtmnJ7uVAwpaifjqX95qQj9ZSBoQdW1Uwp/gGFkNdZbNZSHt9V5kK/K5xcgN60R
        qWjjvI+oSWSYja8l3tnVtOxzJeLnVZc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-312-egykInguO5aD2N4bH5GEZg-1; Wed, 05 Oct 2022 02:27:32 -0400
X-MC-Unique: egykInguO5aD2N4bH5GEZg-1
Received: by mail-wm1-f72.google.com with SMTP id c2-20020a1c3502000000b003b535aacc0bso536374wma.2
        for <linux-doc@vger.kernel.org>; Tue, 04 Oct 2022 23:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Hzgr+GJhjprVie4kFrMDBNKKq7b6UhoiqIdbK544F4E=;
        b=bejPKyn90BwZloAlAD3DuQJLAzesLShv7qbSuDZkT8GhGAPFKWj+QBTgYJuwsF0b/z
         RiS5+cVRjKaCQX7b9fU77gsU+MgEbimYJy4HmP3moMMa7D7n5nWk5+A9gdPmuHR/9ngd
         8GiE7mNFN6gEWdGBK7SRdyjrefSjI8RIdaDI1YDGdBpYFS1CGViP3tXni2wD4Npac5Lb
         Bm/7j85nH6WPbS+4PBdbPf/75vOl/Xff/EL92pKAxjY2iF2tInljNOI7LXJYLyLvpX/u
         9GL8yr2wEQYS6dgewCOI1hKX4wu68uf/CI4HZcmodrq8Z/aYDP4N49OspjS4FmpAqbE0
         YGRA==
X-Gm-Message-State: ACrzQf3QGRJN0yzSIyT5FIlYxlbnNm6QMvk1Sxa8G7+KWdFVgHNZ16Pm
        +7DYzfcMRNwOIEoiW/mfqF1iei0QTQxX/0maaAvF1864U2toEzXQ33+Ng2hui18k3UXLjKcMnsr
        qfzKBi0W/xPhlJeH/1FrU
X-Received: by 2002:a5d:6dac:0:b0:22a:fbff:b2d3 with SMTP id u12-20020a5d6dac000000b0022afbffb2d3mr17477372wrs.543.1664951250884;
        Tue, 04 Oct 2022 23:27:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM51k5PL/MMj9nNisaw28ILfu80lWeQorWwHNn3p0/GD+K8Uowfp7d1JM62SxQHy7Gip404Y4Q==
X-Received: by 2002:a5d:6dac:0:b0:22a:fbff:b2d3 with SMTP id u12-20020a5d6dac000000b0022afbffb2d3mr17477361wrs.543.1664951250690;
        Tue, 04 Oct 2022 23:27:30 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-249.web.vodafone.de. [109.43.177.249])
        by smtp.gmail.com with ESMTPSA id r6-20020a5d4986000000b0022ccae2fa62sm2068711wrq.22.2022.10.04.23.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 23:27:29 -0700 (PDT)
Message-ID: <69854d56-510c-dab0-7cd6-f593ae2bef14@redhat.com>
Date:   Wed, 5 Oct 2022 08:27:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To:     Janis Schoetterl-Glausch <scgl@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>
Cc:     David Hildenbrand <david@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-s390@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Shuah Khan <shuah@kernel.org>,
        Sven Schnelle <svens@linux.ibm.com>
References: <20220930210751.225873-1-scgl@linux.ibm.com>
 <20220930210751.225873-4-scgl@linux.ibm.com>
 <85399389-9b5a-d72a-5db1-b8418008ad58@redhat.com>
 <dca9e17ffbe71c76665ba25a6d9cd91d4aa0c329.camel@linux.ibm.com>
From:   Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v1 3/9] Documentation: KVM: s390: Describe
 KVM_S390_MEMOP_F_CMPXCHG
In-Reply-To: <dca9e17ffbe71c76665ba25a6d9cd91d4aa0c329.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/10/2022 20.51, Janis Schoetterl-Glausch wrote:
> On Tue, 2022-10-04 at 10:16 +0200, Thomas Huth wrote:
>> On 30/09/2022 23.07, Janis Schoetterl-Glausch wrote:
>>> Describe the semantics of the new KVM_S390_MEMOP_F_CMPXCHG flag for
>>> absolute vm write memops which allows user space to perform (storage key
>>> checked) cmpxchg operations on guest memory.
>>>
>>> Signed-off-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
>>> ---
>>>    Documentation/virt/kvm/api.rst | 18 +++++++++++++++++-
>>>    1 file changed, 17 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
>>> index abd7c32126ce..0e02d66e38ae 100644
>>> --- a/Documentation/virt/kvm/api.rst
>>> +++ b/Documentation/virt/kvm/api.rst
>>> @@ -3771,6 +3771,7 @@ Parameters are specified via the following structure::
>>>    		struct {
> 
> What is the reason you initially didn't copy the /* in */ comment here?

You mean in commit 41408c28f283b ? Uh, don't ask me, that's more than 7 
years ago...

Anyway, please be aware that the MEMOP ioctl is defined as IOW only:

#define KVM_S390_MEM_OP _IOW(KVMIO, 0xb1, struct kvm_s390_mem_op)

... so if you now introduce an "out" field in that struct, this might have 
some impact, e.g. on Valgrind etc.

  Thomas

