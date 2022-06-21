Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55006C43334
	for <linux-doc@archiver.kernel.org>; Tue, 21 Jun 2022 07:40:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345845AbiFUHjs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Jun 2022 03:39:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347692AbiFUHjj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Jun 2022 03:39:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CC7E111440
        for <linux-doc@vger.kernel.org>; Tue, 21 Jun 2022 00:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655797177;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=N9tiKnq6phB8o+3F1BeH/xJoEGEmyesclfjwFxkzgCE=;
        b=JVyQemiRW1Znf96EWsJ/UAn3lvPM+TU+f1rog4pNvpZvgALi85R6U10DRBjbwOeDOcDGLl
        jLNyTqNxAK+D41bbvZl7+a5xSqZ+9p71BnuYbnNawXzE2+YIqxMYLMolVL+YEruabwC7Kx
        7Hhe8rTDuk+50cL7kiP56u0GwJhVFkA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-QgIlBktTOpCU_jFNUAJxyw-1; Tue, 21 Jun 2022 03:39:35 -0400
X-MC-Unique: QgIlBktTOpCU_jFNUAJxyw-1
Received: by mail-wr1-f70.google.com with SMTP id ck13-20020a5d5e8d000000b0021b984d1565so193661wrb.10
        for <linux-doc@vger.kernel.org>; Tue, 21 Jun 2022 00:39:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=N9tiKnq6phB8o+3F1BeH/xJoEGEmyesclfjwFxkzgCE=;
        b=KfcPWxuX2lIyxQ4+ICQCowneB6JQ4DLT6UvY0KT4d5KI2iCCvTUmbkDjXge7DepHRg
         6SSKogcnW73bLlX9j7WuJ1MCPwIcVooOzjtUdkjNlkdoMIXCT1MasCgBHjQyYe3gbcG5
         Xld6boB4ltzPG4+ln7Gc9bzipabT1mA5dRFIINXJsNsCLyk3ISJsHDGDT+BFk91APms9
         XK/Z5WY40JFe4aUfkVJOuwS2on1uVCKV0dP7RrvwHwOw4XPY3N+KM0Wofp8IMTaMhalT
         uHCfu15Pve2E49Kvuun0rmQPCZ4EfXGOeJJ/2lsF+nfl/3hCfAR2nP5FZ5Qu3tU6DUV5
         uH9w==
X-Gm-Message-State: AJIora9Ic0R6rlKSoM21AOCBt03558Hz/eRqrIKLBnZ8vPab7BkX9FKX
        gnAJDs/VXptorQiZQZ5Z3Ox0Ny28TyRsl8CwAhP1vw76OSdQxyUbqhTJYaWct4Ywpemuj333sR3
        oCm8A0opwWGqxRK32ZEIu
X-Received: by 2002:adf:e491:0:b0:213:ba6b:b017 with SMTP id i17-20020adfe491000000b00213ba6bb017mr2244114wrm.652.1655797174145;
        Tue, 21 Jun 2022 00:39:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vOMmayQmvf7SIYR8lv3P/I4QUP1e869MPBj5r5k76l2FUw/Qwk9oItuc7MizEnliZ9dC4/YQ==
X-Received: by 2002:adf:e491:0:b0:213:ba6b:b017 with SMTP id i17-20020adfe491000000b00213ba6bb017mr2244092wrm.652.1655797173867;
        Tue, 21 Jun 2022 00:39:33 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f04:2500:cdb0:9b78:d423:43f? (p200300d82f042500cdb09b78d423043f.dip0.t-ipconnect.de. [2003:d8:2f04:2500:cdb0:9b78:d423:43f])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d4c4f000000b0021b966abc19sm1468962wrt.19.2022.06.21.00.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jun 2022 00:39:33 -0700 (PDT)
Message-ID: <b01d66f5-67c9-95a4-7dc7-ec7645560214@redhat.com>
Date:   Tue, 21 Jun 2022 09:39:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 1/2] mm: memory_hotplug: enumerate all supported
 section flags
Content-Language: en-US
To:     Muchun Song <songmuchun@bytedance.com>, akpm@linux-foundation.org,
        corbet@lwn.net, mike.kravetz@oracle.com, osalvador@suse.de,
        paulmck@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com
References: <20220620110616.12056-1-songmuchun@bytedance.com>
 <20220620110616.12056-2-songmuchun@bytedance.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220620110616.12056-2-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 20.06.22 13:06, Muchun Song wrote:
> We are almost running out of section flags, only one bit is available in
> the worst case (powerpc with 256k pages).  However, there are still some
> free bits (in ->section_mem_map) on other architectures (e.g. x86_64 has
> 10 bits available, arm64 has 8 bits available with worst case of 64K
> pages).  We have hard coded those numbers in code, it is inconvenient to
> use those bits on other architectures except powerpc.  So transfer those
> section flags to enumeration to make it easy to add new section flags in
> the future. Also, move SECTION_TAINT_ZONE_DEVICE into the scope of
> CONFIG_ZONE_DEVICE to save a bit on non-zone-device case.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

