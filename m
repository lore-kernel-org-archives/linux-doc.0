Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9680C433F5
	for <linux-doc@archiver.kernel.org>; Fri,  6 May 2022 14:20:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442017AbiEFOXr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 6 May 2022 10:23:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442013AbiEFOXq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 May 2022 10:23:46 -0400
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.133.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6205468FB3
        for <linux-doc@vger.kernel.org>; Fri,  6 May 2022 07:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651846800;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Doqk7KhGyk0EBDANXsBv2tmfDD+hT1qhKftthfkS7cs=;
        b=dVyvu8tf/ND4M/FbzZX4900Wei1CVqLT33jOFyc08Qw1jpdYDxyWVIr07m6iE7+vuYPJDw
        iE/hnzdH6woeBOMPbY0uDb7XDH5m0ELdG/P8PSVcbeS8ycdPJR5bykbk9le+4XZdrnEsgZ
        tM+jIvPkvfc/6nJUsh+/850f0LdrApc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-a5Yfj_0WM7mrxa7mvXF-hw-1; Fri, 06 May 2022 10:19:59 -0400
X-MC-Unique: a5Yfj_0WM7mrxa7mvXF-hw-1
Received: by mail-ej1-f71.google.com with SMTP id qa15-20020a170907868f00b006f4c89bf2e3so4304979ejc.9
        for <linux-doc@vger.kernel.org>; Fri, 06 May 2022 07:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Doqk7KhGyk0EBDANXsBv2tmfDD+hT1qhKftthfkS7cs=;
        b=ajgDCyyrlDnWJpGBkgo5RqPH7YQlvaL9xfPSDqyEOUX9w3I0g5tBnsW0hhliB91tmu
         0KmvFUn8cesAFazfUpya3OKVizC0KibnO80WyPVSU0D1UGwj45Cf/Clv0bUC27q1iIMY
         ukciHyc9/Sfuw5sng4lAsBbkjOPBEHAbfMwTRWx8Ahh7GG1Bcgb9A9Zwr5B8apw9GXtr
         YSnovI66JpfAkTbrwqtLD6CmVMbUlO7SmPAF5Cf3fbFWhmxRlBOWhYNgBlQ65NYmr2w8
         aJ9ZgLR3HwvIKesViPSZtEkrJllhMWBziV3b9mCZkPe604AtbDrKsnJ3ghnHzFnrs0xL
         LAtQ==
X-Gm-Message-State: AOAM5315BcYFO/ZTvGOHpbIH5ZNPJgwrsMmFUGQATlRygzcCcd0EJ3XJ
        k00c9nMwwKjrAh68NcowuRoA2kc5b4wtYvrg2yZemGCSrd78ifufW0e4a+m/ZTxgsQhWzaJgJcE
        EIBviVkU0tufx/MXimuIJ
X-Received: by 2002:a17:906:4fc4:b0:6da:b4c6:fadb with SMTP id i4-20020a1709064fc400b006dab4c6fadbmr3276502ejw.282.1651846797995;
        Fri, 06 May 2022 07:19:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6Rvy2dRSgaYN9vdv1LxcPQ7MR9GWZ/uPHsWuJrOXf9xFz9COe4Lt6mC4M6ylDEUxRJ5N9zA==
X-Received: by 2002:a17:906:4fc4:b0:6da:b4c6:fadb with SMTP id i4-20020a1709064fc400b006dab4c6fadbmr3276491ejw.282.1651846797855;
        Fri, 06 May 2022 07:19:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id r4-20020aa7d144000000b0042617ba63a4sm2300790edo.46.2022.05.06.07.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 07:19:57 -0700 (PDT)
Message-ID: <b18234d7-a1f4-d5a4-e59b-f5439c38c2d0@redhat.com>
Date:   Fri, 6 May 2022 16:19:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 00/10] Introduce In Field Scan driver
Content-Language: en-US
To:     Borislav Petkov <bp@alien8.de>
Cc:     Tony Luck <tony.luck@intel.com>, markgross@kernel.org,
        tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
        x86@kernel.org, hpa@zytor.com, corbet@lwn.net,
        gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com,
        jithu.joseph@intel.com, ashok.raj@intel.com, rostedt@goodmis.org,
        dan.j.williams@intel.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        patches@lists.linux.dev, ravi.v.shankar@intel.com
References: <20220422200219.2843823-1-tony.luck@intel.com>
 <20220428153849.295779-1-tony.luck@intel.com>
 <13054c5c-ed48-b7a2-a800-25b9b1b1ab0d@redhat.com> <YnFK+gXFx0jQB1dz@zn.tnic>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YnFK+gXFx0jQB1dz@zn.tnic>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 5/3/22 17:32, Borislav Petkov wrote:
> On Mon, May 02, 2022 at 05:15:39PM +0200, Hans de Goede wrote:
>> I'm fine with this entire series getting merged through the TIP
>> tree,
> 
> Hmm, so looking at the diffstat - the majority of that is
> drivers/platform/x86/ so I guess your tree would be better suited for
> it...

Ok, that also works for me and I see that the few arch/x86 already have
Ack-s / Reviewed-by-s from you / tglx .

I'll give it some more time for review for v6 and then pick up v6
(or v7 if review leads to more changes).

Regards,

Hans

