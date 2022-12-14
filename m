Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA99C4332F
	for <linux-doc@archiver.kernel.org>; Wed, 14 Dec 2022 09:24:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237871AbiLNJYD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Dec 2022 04:24:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237347AbiLNJYC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Dec 2022 04:24:02 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BE0F617C
        for <linux-doc@vger.kernel.org>; Wed, 14 Dec 2022 01:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671009794;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7575zCJt/W+bOCfmNqE0fJaW9dUNr74ly+FhAEM/HvY=;
        b=jKdH75PBV6Y0RGJXsuf3lw87WhziL/G9ZDowNQL+qLycPiqtkRs1lEFgJjKAh/S7N5kIWU
        LAps7GjW7FVuJb8thUBL2VG/Vxdk5oLTotW3EJsutUcHx6rQAeD7kkF/97726YwN7m0tna
        wrb+HPdXeLMQoMK7iJR3jrQeWgWMEX8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-625-q8pvW50OOyi4yFxvkUrFJw-1; Wed, 14 Dec 2022 04:23:12 -0500
X-MC-Unique: q8pvW50OOyi4yFxvkUrFJw-1
Received: by mail-wm1-f69.google.com with SMTP id q21-20020a7bce95000000b003d236c91639so1304294wmj.8
        for <linux-doc@vger.kernel.org>; Wed, 14 Dec 2022 01:23:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7575zCJt/W+bOCfmNqE0fJaW9dUNr74ly+FhAEM/HvY=;
        b=JIMaojmTm/JQ1X+/2hN1JjpfLUdywwrMqtNIhbhGOBMH53YKl7q1NLmTtjg3lelZFQ
         cmm2LXP5rGF+ssZR8a790Lql0T3g3MlJ8hVdWIljuYlhB+stnu/6ByIN99nRmPNWz7t6
         bM8mKhKzLbLd9StnICP/o0UWGR3PciH+WEzShj4NCCEl9NyZBSDiXNtBfrwjvnUxodiZ
         3K/IxWcpcokBtjTVLQMp6mU0smFUU4wyUnsJl/X+zkmz8FlNm4oTXbDWCCbY+LWKMY3u
         wpbqtUccv9HhNTnn+DzDbFWl3M4xz9MPPsznUxJ/s9sVS6nPgJVV42B9VjoAfsasn/qi
         FXoA==
X-Gm-Message-State: ANoB5pl0v5iqqFKDNPICYkUIKHXtLZ3gBKfs6nhzhv0LZliWVYLldd/2
        Ay3vH8YYPEA/OuasrWBxvF3YDVDMAyyNvzbNhxCSTDUUwjST6SXEg6CDMkfaMZsVaL964h9fO1I
        GysSLh2IP8Sc62XnM07q3
X-Received: by 2002:a05:6000:1f81:b0:250:22e4:b8a6 with SMTP id bw1-20020a0560001f8100b0025022e4b8a6mr5865931wrb.39.1671009791772;
        Wed, 14 Dec 2022 01:23:11 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5BsrFQrZiqcKQNGodRXeWHRfYLzojFhTjRKPMU8We633YCGl8jewbotKhhnFGoVJScipq0ng==
X-Received: by 2002:a05:6000:1f81:b0:250:22e4:b8a6 with SMTP id bw1-20020a0560001f8100b0025022e4b8a6mr5865908wrb.39.1671009791515;
        Wed, 14 Dec 2022 01:23:11 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-56.web.vodafone.de. [109.43.178.56])
        by smtp.gmail.com with ESMTPSA id s18-20020a5d4ed2000000b00242271fd2besm2257482wrv.89.2022.12.14.01.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 01:23:10 -0800 (PST)
Message-ID: <4e8cc757-13e2-3be4-fea2-3ef3dcd0688d@redhat.com>
Date:   Wed, 14 Dec 2022 10:23:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 4/9] KVM: s390: selftest: memop: Replace macros by
 functions
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
References: <20221213165405.2953539-1-scgl@linux.ibm.com>
 <20221213165405.2953539-5-scgl@linux.ibm.com>
From:   Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221213165405.2953539-5-scgl@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 13/12/2022 17.54, Janis Schoetterl-Glausch wrote:
> Replace the DEFAULT_* test helpers by functions, as they don't
> need the exta flexibility.
> 
> Signed-off-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
> ---
>   tools/testing/selftests/kvm/s390x/memop.c | 82 +++++++++++------------
>   1 file changed, 39 insertions(+), 43 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

