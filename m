Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFDDEC433F5
	for <linux-doc@archiver.kernel.org>; Wed, 16 Feb 2022 12:32:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233280AbiBPMcY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Feb 2022 07:32:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232850AbiBPMcY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Feb 2022 07:32:24 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 996CA96834
        for <linux-doc@vger.kernel.org>; Wed, 16 Feb 2022 04:32:11 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id l8so1890254pls.7
        for <linux-doc@vger.kernel.org>; Wed, 16 Feb 2022 04:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:subject:to:cc
         :references:content-language:in-reply-to:content-transfer-encoding;
        bh=JPLU4h3ThrUhynM4gUWO8JmiYbpIAwb7KuEargsrpE8=;
        b=H8CM2JojCUGW4BrWWirSf+4yld146IgftALLkLxhvqv81TYpEpUNcuTJGM172SYJFf
         s0m75bkQdAEMdl0RT9NsW1Xoev+b8jN+KD+aRwRGFcYyv4RhFrsidHACzpgKN0ihaywU
         lyGHGP7qAXsnJdXluQdtaceJCPpOSFSMK+P55fj+8iX1ICf1AGt3GWeGYIqwgEMrvea8
         /Hth54zmYccYwkyoPGaHkxEQeCXWVW70ccQCRL1uQlkaRYxqkp2DbnIlCRNVQ0OWNrW+
         b1DirrB55/mVQfaKHL5F5vIeiINgSAan2TenaSG+Hp6MjK6STlSHCCEVBVNAeU2AiXqQ
         ew6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:references:content-language:in-reply-to
         :content-transfer-encoding;
        bh=JPLU4h3ThrUhynM4gUWO8JmiYbpIAwb7KuEargsrpE8=;
        b=KgRs2RaiOPsFa2SoTAn3BCPrC8R+xNR+Cv+icUn3NPJOolkcMHBmVFqlw5AJslQ9Lj
         DJyTYj++ahpd8ak4ZDi9K9CnY+g2FLGgBZS+7L245J3f4kGGNXqbF4qcHfS3mLTnmrKA
         10e+uD9D8ghPYAMKbxjnfPZZPT29e5seTavohPWzCfQHk+weDf3n5eto1FcxnB8O7/y9
         GQKXCwfouWwe6+jYgNGFVmqovslCcEUUYdICFJ6eQKhOHWTmJrgboY1LtFkWAFjkXQCj
         ZNrvLNIohRskfUyeFNGP1jf8clgKI+swosthTDFYw6qoM1XaUBsQmiVQ7En9El0xu2od
         U1hw==
X-Gm-Message-State: AOAM530txt8uHwA0WPsIYHvI0lKki7Bo32I2ulMq63P/hyZZT3E67zTd
        77n/Qgy/uScJUEk1dpzTbFI=
X-Google-Smtp-Source: ABdhPJzM0VWTv4SvWPz99pWwQuuo7SnQWV5OPuTFzQqOyaNoUUqjS2RW4LcDAafH141cW2GA/iPcog==
X-Received: by 2002:a17:903:2451:b0:14d:a225:74e0 with SMTP id l17-20020a170903245100b0014da22574e0mr2416830pls.84.1645014731112;
        Wed, 16 Feb 2022 04:32:11 -0800 (PST)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id u16sm5408463pgh.54.2022.02.16.04.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Feb 2022 04:32:10 -0800 (PST)
Message-ID: <5493874a-9aaf-3611-237c-6ceae15b7035@gmail.com>
Date:   Wed, 16 Feb 2022 21:32:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From:   Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH v3 2/3] zh_CN: Add translations for admin-guide/mm/ksm.rst
To:     yanteng si <siyanteng01@gmail.com>, cgel.zte@gmail.com,
        xu xin <xu.xin16@zte.com.cn>
Cc:     alexs@kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org,
        seakeel@gmail.com, siyanteng@loongson.cn, yang.yang29@zte.com.cn,
        Akira Yokosawa <akiyks@gmail.com>
References: <CAEensMzqFCa12jmqEo+78cu7hFdkYjp0XQOnMgj+07zPnYa9Rg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAEensMzqFCa12jmqEo+78cu7hFdkYjp0XQOnMgj+07zPnYa9Rg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Wed, 16 Feb 2022 16:48:27 +0800,
yanteng si <siyanteng01@gmail.com> wrote:
> <cgel.zte@gmail.com> =E4=BA=8E2022=E5=B9=B42=E6=9C=8812=E6=97=A5=E5=91=A8=
=E5=85=AD 16:03=E5=86=99=E9=81=93=EF=BC=9A
>>
>> From: xu xin <xu.xin16@zte.com.cn>
>>
>> Translate Documentation/admin-guide/mm/ksm.rst into Chinese.
>>
>> Reviewed-by: Yang Yang <yang.yang29@zte.com.cn>
>> Reviewed-by: Alex Shi <alexs@kernel.org>
>> Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
>> Signed-off-by: xu xin <xu.xin16@zte.com.cn>
>> ---
>>  .../translations/zh_CN/admin-guide/mm/ksm.rst      | 148 ++++++++++++=
+++++++++
>>  1 file changed, 148 insertions(+)
>>  create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/ks=
m.rst
>>
>> diff --git a/Documentation/translations/zh_CN/admin-guide/mm/ksm.rst b=
/Documentation/translations/zh_CN/admin-guide/mm/ksm.rst
>> new file mode 100644
>> index 0000000..bbf654c
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/admin-guide/mm/ksm.rst
>> @@ -0,0 +1,148 @@
>> +.. include:: ../disclaimer-zh_CN.rst
> disclaimer-zh_CN.rst in the
> Documentation/translations/zh_CN/disclaimer-zh_CN.rst

Please note that the "include" directive accepts a _relative_ path [1].
In this case, ../../disclaimer-zh_CN.rst is the right choice.

[1]: https://docutils.sourceforge.io/docs/ref/rst/directives.html#include=


        Thanks, Akira

>=20
> Thanks,
> Yanteng

[...]
