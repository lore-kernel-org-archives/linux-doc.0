Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD34C433F5
	for <linux-doc@archiver.kernel.org>; Wed,  9 Feb 2022 13:17:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233065AbiBINQ4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Feb 2022 08:16:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbiBINQz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Feb 2022 08:16:55 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4004C05CBB0
        for <linux-doc@vger.kernel.org>; Wed,  9 Feb 2022 05:16:57 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id k25so1710680qtp.4
        for <linux-doc@vger.kernel.org>; Wed, 09 Feb 2022 05:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=00zXVWqiIIWmqW86EePr+9PjPrQ814Ku4hB+RmWAzVE=;
        b=O6jcEE5sfFGLsdLvyVYmVvv0eI3/ZISLBScADt5gl3GCiZr4XJsUbvKdbByPitU8aX
         Xz10avwmXHoXXdNfaBWfCGb2KW90KGZtbURff0EfNlIPOvnTkFp+kknDz8eQrNJg2mIh
         sK9bINFCmj0UfTLPFKbxdYFDeZIygmZ9Hh+3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=00zXVWqiIIWmqW86EePr+9PjPrQ814Ku4hB+RmWAzVE=;
        b=Rk9MGQC3YYsHEKICxNhfbWXQhmmuOTBI2ldvL37jCEyaw6s2CdJYiE81ZstNwZ7Eg0
         1JjIf3oTlnWtGGlRRyPr/VDSe5nmdcEUbCxbyH4Rwg+UufkmOZpkz0zJ9R+A3rmPAZaV
         oxd/3FhY6KaX7pm0go2GzdRWEV/3xKEn5sRDlmODTeM8YDjWcyM8WkbFwC2OyTklznOQ
         NZiskNjZxJLzg/6xUwm/1Cmb9vFtn0qE21QiImc3QexCINEUllb11TV4kq2J7zy95zZ9
         zTY9H1HcyMfKHCkvE9UwaOho5QoQENNPwNwachdfX708cMvZ5FvniNHB4y0QOviIMPLv
         4gWA==
X-Gm-Message-State: AOAM531sqNTVOkT66HoYV9kTArGdU1Tk/m6ApU4wqtKrpm7GRE6tZGyx
        UiYa4bGdBNIXR4ysv2r4R3QBCw==
X-Google-Smtp-Source: ABdhPJyGbmCVNJq7whVXntybKDMHFLHfJgy5dnYQpVdbz5i7W2IQdFcQ6DMilTc6vOjw3UAE86GmZQ==
X-Received: by 2002:ac8:7f0a:: with SMTP id f10mr1244788qtk.619.1644412616806;
        Wed, 09 Feb 2022 05:16:56 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-127.dsl.bell.ca. [216.209.220.127])
        by smtp.gmail.com with ESMTPSA id k20sm9071209qtx.64.2022.02.09.05.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 05:16:56 -0800 (PST)
Date:   Wed, 9 Feb 2022 08:16:54 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Christian Borntraeger <borntraeger@linux.ibm.com>
Cc:     Janis Schoetterl-Glausch <scgl@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>
Subject: Re: [PATCH v2 05/11] KVM: s390: Add optional storage key checking to
 MEMOP IOCTL
Message-ID: <20220209131654.7txhwrax322rjje2@meerkat.local>
References: <20220207165930.1608621-1-scgl@linux.ibm.com>
 <20220207165930.1608621-6-scgl@linux.ibm.com>
 <48d1678f-746c-dab6-5ec3-56397277f752@linux.ibm.com>
 <71f07914-d0b2-e98b-22b2-bc05f04df2da@linux.ibm.com>
 <6ea27647-fbbe-3962-03a0-8ca5340fc7fd@linux.ibm.com>
 <29ac0e5c-f77b-04b2-bbf5-cf5a5ca78921@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <29ac0e5c-f77b-04b2-bbf5-cf5a5ca78921@linux.ibm.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 09, 2022 at 10:34:19AM +0100, Christian Borntraeger wrote:
> CC Konstantin,
> 
> I hope you can find the right people. Looks that my (and Janis) emaildid not make it to linux-s390 and kvm at vger lists.
> Message-ID: <6ea27647-fbbe-3962-03a0-8ca5340fc7fd@linux.ibm.com>

I see it in the archives, though:
https://lore.kernel.org/linux-s390/6ea27647-fbbe-3962-03a0-8ca5340fc7fd@linux.ibm.com
https://lore.kernel.org/kvm/6ea27647-fbbe-3962-03a0-8ca5340fc7fd@linux.ibm.com

Perhaps it was just delayed?

-K
