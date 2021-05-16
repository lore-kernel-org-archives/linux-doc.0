Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 825DAC433B4
	for <linux-doc@archiver.kernel.org>; Sun, 16 May 2021 03:30:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5187261059
	for <linux-doc@archiver.kernel.org>; Sun, 16 May 2021 03:30:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231776AbhEPDbf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 15 May 2021 23:31:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbhEPDbf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 15 May 2021 23:31:35 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 674E5C061573
        for <linux-doc@vger.kernel.org>; Sat, 15 May 2021 20:30:21 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id m124so2319538pgm.13
        for <linux-doc@vger.kernel.org>; Sat, 15 May 2021 20:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Xnje/7RVbMX8u5ELk5cZEjX3/e8yyIcVpKhjDnccS6c=;
        b=qRBwEqXgxa9EmBXWP6AR8vdSRSR2taiU++DXCTRt2NYnLIHMsxnWnHE61X3cr2zOfC
         70IYNjz8cSx+x4qUMjht1whZQui+Y+fhA2Tl6nVAzTsDoJ3j+XIYJmcJQz2zQE+PTc6J
         mxRxR+I7/XZMzPdwvlHCo4COHEkqv5sqP862GvZSN7sy5haGbmOWQ0TE8/hYTWEnDX2E
         eY2RCEEObjDqwiHhikFQ6RHcmimZSilsVixC5VyCA4Jkgn12MCeLci9iqQ0QHJ4pLV5i
         3KhCiwQTQA20Xx8UeRgi8SbrSeVddKNZNDq/AciN1fIO3DzbE43z0UOBw0/rAXAcdLtQ
         DNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Xnje/7RVbMX8u5ELk5cZEjX3/e8yyIcVpKhjDnccS6c=;
        b=ObD28tJPomHdY2e9eYxG10+P4QxIfsDNK4FWQH2llpZFtG4tdNs5z+ExXprDSerNVK
         +Za3iHArIn2IlU1JnDuToFCwId+riVMtUfe1oi1+BLoeeYtrtx86sc0xv1jwEl9sc+ZM
         aZDKqcKifW0APK78y7GR1zMBCM0NvUlUP9oxqcdj+mGBtg5cBezzgze+n9ckwmI7Yk/h
         fNY9mzSXkn/W4H7vn1ko0gDLFfVNaakid4F+13BdItlgKDITBr0yNNBLBYfAYDyOmwX8
         hvPtzCG80645q4DChvGZW/LXuTWxS1GXRey1/CDWT7s5qQh0mXY0BiwoLUI0em4WIWft
         DEzw==
X-Gm-Message-State: AOAM5324xnqMqrQiGRkD5VVksjF+lr9DSSyohjT9mtfjteVPgqSKO6W/
        h2XSfbHbvDKhV4RW2JTGotM=
X-Google-Smtp-Source: ABdhPJx+eiqcy6x+2IvnX8RQqhe8VepE5StAUYhPhshvcc+x3pLqPBUHC743Sm5rRirAdBtNimiKsg==
X-Received: by 2002:a63:b206:: with SMTP id x6mr41661948pge.341.1621135820754;
        Sat, 15 May 2021 20:30:20 -0700 (PDT)
Received: from [172.28.99.179] ([119.28.155.243])
        by smtp.gmail.com with ESMTPSA id s16sm7334887pga.5.2021.05.15.20.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 May 2021 20:30:20 -0700 (PDT)
Subject: Re: [PATCH v6 1/3] docs/zh_CN: add core-api kernel-api.rst
 translation
To:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        alexs@kernel.org
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com, huangjianghui@uniontech.com
References: <cover.1621062577.git.siyanteng@loongson.cn>
 <e8a6975086ad54b5abdde2b816f6fa06dc98fcf7.1621062577.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <87f7bb59-cb85-de95-4e8d-72784686b9b9@gmail.com>
Date:   Sun, 16 May 2021 11:30:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e8a6975086ad54b5abdde2b816f6fa06dc98fcf7.1621062577.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2021/5/15 下午4:10, Yanteng Si wrote:

> +安全框架
> +========
> +
> +check the functions in security/security.c in kernel source code.
> +   :internal:
> +
> +check the functions in security/inode.c in kernel source code.
> +   :export:
> +
> +审计接口
> +========
> +
> +check the functions in kernel/audit.c in kernel source code.
> +   :export:
> +
> +check the functions in kernel/auditsc.c in kernel source code.
> +   :internal:
> +
> +check the functions in kernel/auditfilter.c in kernel source code.
> +   :internal:
> +

Too verbose w/o much useful info, Is the following better?

  APIs in kernel code: kernel/audit.c, kernel/auitsc.c and kernel/auditfilter.c

  该 APIs 在以下内核代码中 kernel/audit.c, kernel/auitsc.c and kernel/auditfilter.c


Thanks
Alex
