Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5462CC433F5
	for <linux-doc@archiver.kernel.org>; Wed, 11 May 2022 12:29:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233444AbiEKM3t (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 May 2022 08:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242382AbiEKM3s (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 May 2022 08:29:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 54ADF1FD857
        for <linux-doc@vger.kernel.org>; Wed, 11 May 2022 05:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652272186;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FcY+Zd5XlbADrOvbXaU3QNiZrTO7S7HXtWKbPkPLOyo=;
        b=eL0ZA7ppauucDhal33SvDyapExjHpP+HavL5S5FKdiaH8B0Q7cqRI3TCb0suhJ1DgItGhq
        kuD10qSpZcbwQQj2c5HVF1sN0xHzKNrkPyeC3WehkxQWdzTMPETHiMOxT6Dgg00QLVZ8dt
        nbie/W2cvX0xvZb0bJJBgyzVJF+oSzY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-_7MYl1rtN4aubkhjnvUVjQ-1; Wed, 11 May 2022 08:29:45 -0400
X-MC-Unique: _7MYl1rtN4aubkhjnvUVjQ-1
Received: by mail-wr1-f72.google.com with SMTP id w4-20020adfbac4000000b0020acba4b779so778907wrg.22
        for <linux-doc@vger.kernel.org>; Wed, 11 May 2022 05:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FcY+Zd5XlbADrOvbXaU3QNiZrTO7S7HXtWKbPkPLOyo=;
        b=i0KQJ5aW+aAZfkYCDYmg5ll9hqQxN97uNQZamqyeIzuM4pnPxMvvRs+b6olpez9nPI
         npb9yVZODFhphmqtXn9EAyGYQXU3uiYeCcGLvTxpkXzbAuWwUmigOkHBuzC9R4sj/ly1
         xXmKhAWE1H7sdndnCZY7DWbmYu/708UaPht9DlZRK3fdcudWS602ahGA86fDlCjglxe3
         Pxa49FmyuuQbGuumsczRKR9V81GyRsIGxGv8LEeVlFEdJAKaMlep4PkW4JY6FpCX3cE0
         myN0J3nZCLf8oAUuYVUC0w2mwYkv7vcbapD8rLbTmNchdQeVH7+SORiPjW+DAYjsySuR
         04jQ==
X-Gm-Message-State: AOAM533I/K1wu7/D4FrnZK/0W8lzpwrlUzOAnmLugrpsNPxC8ju8UGYO
        neCATr4R4f1Bi5K6G0Qm7yu7h8kuAqLGQqMgJZWere793MLNdEiuYMaBulQWW21nut8rpSjQ1eA
        7fcdEq++AMMPaHvDMp9vh
X-Received: by 2002:a05:600c:1e23:b0:394:6133:a746 with SMTP id ay35-20020a05600c1e2300b003946133a746mr4578087wmb.17.1652272183900;
        Wed, 11 May 2022 05:29:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwy2ou+Mk/PkR/G/eo5g55eQmz0xGQXbimhYd6JFu/Xn+JJE2bLkuI6rzG6fUa4G4ybIfW0sg==
X-Received: by 2002:a05:600c:1e23:b0:394:6133:a746 with SMTP id ay35-20020a05600c1e2300b003946133a746mr4578064wmb.17.1652272183647;
        Wed, 11 May 2022 05:29:43 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id n5-20020a05600c464500b0039482d95ab7sm1880616wmo.24.2022.05.11.05.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 05:29:43 -0700 (PDT)
Message-ID: <fa10ffa4-d43f-1270-acab-3d3d228e0b88@redhat.com>
Date:   Wed, 11 May 2022 14:29:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 2/7] firmware: sysfb: Add helpers to unregister a pdev
 and disable registration
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220511112438.1251024-1-javierm@redhat.com>
 <20220511112438.1251024-3-javierm@redhat.com>
 <09cc267d-ead4-dd63-07dd-dfa347cbcee1@suse.de>
 <7d9f44e6-ae45-1747-366a-15cf2941dc2f@redhat.com>
 <8ec8d896-599e-b1ff-2b4f-077d73944705@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <8ec8d896-599e-b1ff-2b4f-077d73944705@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello Thomas,

On 5/11/22 14:05, Thomas Zimmermann wrote:

[snip]

>>
>> Other subsystems ask you to do the opposite, to split the definition and
>> usage in separate patches. But I'm fine with merging those if you prefer.
> 
> Usually, I have no strong opinion on this. But in the case of this 
> specific patchset, I have the feeling that I'm missing some important 
> point because call and implementation are separate.  See my other 
> replies for that.  Putting them next to each other will hopefully help. 
> Sorry for the inconvenience.
>

No worries at all. Happy to do that change if the patches are easy to
understand. It took me some time as well to wrap my head around all
the race conditions and needed locking.

Same for patch 3/7, but I'm convinced that dropping the lock is the
correct thing to do than calling to drivers' .remove callbacks with
a lock held.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

