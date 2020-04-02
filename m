Return-Path: <SRS0=YY78=5S=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05130C43331
	for <linux-doc@archiver.kernel.org>; Thu,  2 Apr 2020 18:33:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CDD082078B
	for <linux-doc@archiver.kernel.org>; Thu,  2 Apr 2020 18:33:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lxr43cwU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732331AbgDBSda (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 2 Apr 2020 14:33:30 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45367 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729033AbgDBSda (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Apr 2020 14:33:30 -0400
Received: by mail-lj1-f194.google.com with SMTP id t17so4289481ljc.12
        for <linux-doc@vger.kernel.org>; Thu, 02 Apr 2020 11:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mQfE83Ef4+Fu/WgG4T+rIERisJha2G3eNUu7SuLONxo=;
        b=Lxr43cwUV5qGZ3n2pSbARlupVEpiiDenDbHgo8cU270uUxmtaozmv6dy2RH0KTziFN
         F+A5+SvZH0M706jtF3WHTJEeYjykZDcwHF5llEsE3xJ7QxShyPWt9+zQJGCFVd3wfKGy
         RuCxkuYxot1lW2YU/wWIxdEunRyqIsLkP2UOw4yKCTxO5xI4CxoPc9Ti+LvqdM96uBe+
         G2Cw4NhLR4kWAlnOYTEtNdEDpJyAjNcy0leMhflA7c2OepgviJfNJYkjwubEWFXnJYwr
         Xp2YogOZ8Bpxsyy8rBrQup6OFnScfvS5sVf/g8zEd/U5j/CWmP/ZoisDLsfifoQTGOpz
         y4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mQfE83Ef4+Fu/WgG4T+rIERisJha2G3eNUu7SuLONxo=;
        b=U47VFIKvGaVFahifAia8AMmk3WY/ca8KDH3jatCm73kVW1jrnvb8Z2uCoDroMGBh7M
         a/yWrUYcMzzo+NG6OQ0tiGrnVwaNXt0npFJUQ0aFBNc3LLneduSWWWJP0NPNp+9BrZo1
         utAonaPo6cu02+Fe0ybsr/leuYpx6h41QjsaqHKfGQ7ziHxhJbitt6P70AOFrBE6eAiq
         NTbTwdn+pAxrlkG54jbInUs+5PC4FqhyPlJN/DT1g5uA81Lj06dVk6M0G5Hm4VtbQtPY
         0xM9JFEO+z7b10owrHO6MfnHh7HSJOnV25U+gqS2HGwU4sOAjvyT7vfqdc0Dcuu4U3zD
         4osQ==
X-Gm-Message-State: AGi0PubEqu/lIAr1FowbwZbq4P9BWXmtRo04FhjnDj5SyKgp5MeCoJuz
        A9zUPX8lpfnGII7ePKvjQVo=
X-Google-Smtp-Source: APiQypIFSEXOvYONhRkuC4BItmBRst5CiInBHjw7Ej7A488pSAbVB4nEl1EEhuN7Vf7xw3+zBGNdkA==
X-Received: by 2002:a2e:8958:: with SMTP id b24mr2874144ljk.211.1585852407049;
        Thu, 02 Apr 2020 11:33:27 -0700 (PDT)
Received: from [192.168.16.194] (h-4-68-234.A785.priv.bahnhof.se. [155.4.68.234])
        by smtp.googlemail.com with ESMTPSA id 195sm4452041lfi.75.2020.04.02.11.33.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 11:33:26 -0700 (PDT)
Subject: Re: [PATCH 1/2] docs: kernel-parameters.txt: Remove nompx
To:     Dave Hansen <dave.hansen@intel.com>, linux-doc@vger.kernel.org
Cc:     Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Jonathan Corbet <corbet@lwn.net>
References: <20200402172614.3020-1-jimmyassarsson@gmail.com>
 <259d81d2-ff98-bfe7-2dcb-68d9362e26c9@intel.com>
From:   Jimmy Assarsson <jimmyassarsson@gmail.com>
Message-ID: <4e70838d-bc0a-a25b-268d-e61850593f3b@gmail.com>
Date:   Thu, 2 Apr 2020 20:33:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <259d81d2-ff98-bfe7-2dcb-68d9362e26c9@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2020-04-02 19:51, Dave Hansen wrote:
> Dang, I thought I grepped for CONFIG_X86_INTEL_MPX at some point.  Oh
> well.  Thanks for these.  For both:
> 
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>

Thanks! I sent this patch to linux-doc list, and the other to linux-kernel list.
Please also respond to [PATCH] x86/mpx: remove MPX leftovers
Sorry for the confusion.

Regards,
jimmy
