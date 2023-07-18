Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 731EBEB64DD
	for <linux-doc@archiver.kernel.org>; Tue, 18 Jul 2023 06:37:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbjGRGhf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 Jul 2023 02:37:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjGRGhe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Jul 2023 02:37:34 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 213C3136
        for <linux-doc@vger.kernel.org>; Mon, 17 Jul 2023 23:37:32 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fbc6ab5ff5so48981115e9.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Jul 2023 23:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689662250; x=1692254250;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hIEy3rLqSCnnyzfWlfxqBHFoBDkclU5Mx6T9CUvcNwc=;
        b=s/o60ezihcuQS79qv7ICzuxOeNZHsBk1ocPusTvEmQhDfwlQYAlH6lPh29nT35oMc9
         kWXWdWzdLiBagWVLDkOEOAr70zBEOAjUXv21u0EyGSESqdi3AiRh++3nIfineVQLCNEY
         E/bkEgGZGvOk46nVkgRmbSaX0PyFWlG/CZ9VGRY5mwiuEauNXaWTEi06Lc78qV9zvDzZ
         BYl53vXNPjD8kI92rfQ3lPkVPqDZgRor8F4AQ4uCwNIQW0JaNk54qdUzR5tLtpChFZ+P
         HfkkOePjfuCFcKMACymgW2LAHCj8BLDOOXNNsV6CJQEaye0So+InIFaZMqABzrsjM3Kw
         /jUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689662250; x=1692254250;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hIEy3rLqSCnnyzfWlfxqBHFoBDkclU5Mx6T9CUvcNwc=;
        b=MixZTfVNAl63zw9QfmZeS+38gaho3GQNEnkd2UqsIprEpRdV8Km/+mEV0+kEWy2PSC
         pezugW+c6XZrusRYlPaCdoqVv7swdOQBivxFmWWKk397PBcQNxAEsneEXvG2vX5t7KNl
         WaasVMtV1BSncBfmyRWr8E+aqfS95D4CBJNarcTFEXum7uX5KqVZCfdLuKotrhHpB2+Q
         oSwNZ0l96tHKLDL7x40UcyX9Nrd1qUSXNw8H0XXO8tloPzdzDTwldV/StP9Cxwh4k2an
         gvYY1QpfBHGAxRZpPiddeoy0w3cT8YAyUWFCS9BHTnd8SeachEiLNabXBil0y6zgPEe+
         K4JA==
X-Gm-Message-State: ABy/qLbk3dpBT4gBHIF/3ezsXpLy3wDLoazBuVLBKsxb4Ya5+Z3/JjTb
        wVv9wnLeQ/nSoqQpvrxKdYF/AQ==
X-Google-Smtp-Source: APBJJlGdBiXVAKrEH3ChYvLgoNBQHQNzqNno1TY0mbR3+XKzm7LHTa/6LiEmaWdNIuj/vHzsGZ6jSQ==
X-Received: by 2002:adf:cd11:0:b0:316:e422:38e8 with SMTP id w17-20020adfcd11000000b00316e42238e8mr967530wrm.66.1689662250546;
        Mon, 17 Jul 2023 23:37:30 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.222.251])
        by smtp.gmail.com with ESMTPSA id q7-20020adfea07000000b003140fff4f75sm1408059wrm.17.2023.07.17.23.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 23:37:30 -0700 (PDT)
Message-ID: <ed53e088-f538-3c5e-e870-e07998a09bb0@linaro.org>
Date:   Tue, 18 Jul 2023 08:37:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH] docs: move s390 under arch
Content-Language: en-US
To:     Costa Shulyupin <costa.shul@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Tony Krowiak <akrowiak@linux.ibm.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Jason Herne <jjherne@linux.ibm.com>,
        Eric Farman <farman@linux.ibm.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "Steven Rostedt (Google)" <rostedt@goodmis.org>,
        Kim Phillips <kim.phillips@amd.com>,
        Yantengsi <siyanteng@loongson.cn>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Vineet Gupta <vgupta@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Alex Williamson <alex.williamson@redhat.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Kirti Wankhede <kwankhede@nvidia.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Mikhail Zaslonko <zaslonko@linux.ibm.com>,
        Eric DeVolder <eric.devolder@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:S390 ARCHITECTURE" <linux-s390@vger.kernel.org>,
        "open list:S390 VFIO-CCW DRIVER" <kvm@vger.kernel.org>
References: <20230718045550.495428-1-costa.shul@redhat.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230718045550.495428-1-costa.shul@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 18/7/23 06:55, Costa Shulyupin wrote:
> and fix all in-tree references.
> 
> Architecture-specific documentation is being moved into Documentation/arch/
> as a way of cleaning up the top-level documentation directory and making
> the docs hierarchy more closely match the source hierarchy.
> 
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> ---
>   Documentation/admin-guide/kernel-parameters.txt   | 4 ++--
>   Documentation/arch/index.rst                      | 2 +-
>   Documentation/{ => arch}/s390/3270.ChangeLog      | 0
>   Documentation/{ => arch}/s390/3270.rst            | 4 ++--
>   Documentation/{ => arch}/s390/cds.rst             | 2 +-
>   Documentation/{ => arch}/s390/common_io.rst       | 2 +-
>   Documentation/{ => arch}/s390/config3270.sh       | 0
>   Documentation/{ => arch}/s390/driver-model.rst    | 0
>   Documentation/{ => arch}/s390/features.rst        | 0
>   Documentation/{ => arch}/s390/index.rst           | 0
>   Documentation/{ => arch}/s390/monreader.rst       | 0
>   Documentation/{ => arch}/s390/pci.rst             | 2 +-
>   Documentation/{ => arch}/s390/qeth.rst            | 0
>   Documentation/{ => arch}/s390/s390dbf.rst         | 0
>   Documentation/{ => arch}/s390/text_files.rst      | 0
>   Documentation/{ => arch}/s390/vfio-ap-locking.rst | 0
>   Documentation/{ => arch}/s390/vfio-ap.rst         | 0
>   Documentation/{ => arch}/s390/vfio-ccw.rst        | 2 +-
>   Documentation/{ => arch}/s390/zfcpdump.rst        | 0
>   Documentation/driver-api/s390-drivers.rst         | 4 ++--
>   MAINTAINERS                                       | 8 ++++----
>   arch/s390/Kconfig                                 | 4 ++--
>   arch/s390/include/asm/debug.h                     | 4 ++--
>   drivers/s390/char/zcore.c                         | 2 +-
>   kernel/Kconfig.kexec                              | 2 +-
>   25 files changed, 21 insertions(+), 21 deletions(-)
>   rename Documentation/{ => arch}/s390/3270.ChangeLog (100%)
>   rename Documentation/{ => arch}/s390/3270.rst (99%)
>   rename Documentation/{ => arch}/s390/cds.rst (99%)
>   rename Documentation/{ => arch}/s390/common_io.rst (98%)
>   rename Documentation/{ => arch}/s390/config3270.sh (100%)
>   rename Documentation/{ => arch}/s390/driver-model.rst (100%)
>   rename Documentation/{ => arch}/s390/features.rst (100%)
>   rename Documentation/{ => arch}/s390/index.rst (100%)
>   rename Documentation/{ => arch}/s390/monreader.rst (100%)
>   rename Documentation/{ => arch}/s390/pci.rst (99%)
>   rename Documentation/{ => arch}/s390/qeth.rst (100%)
>   rename Documentation/{ => arch}/s390/s390dbf.rst (100%)
>   rename Documentation/{ => arch}/s390/text_files.rst (100%)
>   rename Documentation/{ => arch}/s390/vfio-ap-locking.rst (100%)
>   rename Documentation/{ => arch}/s390/vfio-ap.rst (100%)
>   rename Documentation/{ => arch}/s390/vfio-ccw.rst (99%)
>   rename Documentation/{ => arch}/s390/zfcpdump.rst (100%)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

