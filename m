Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C6A5C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 13 Apr 2022 11:06:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbiDMLIp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Apr 2022 07:08:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235101AbiDMLIk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Apr 2022 07:08:40 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 775695B3CB
        for <linux-doc@vger.kernel.org>; Wed, 13 Apr 2022 04:06:13 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id bx5so1629734pjb.3
        for <linux-doc@vger.kernel.org>; Wed, 13 Apr 2022 04:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:to:cc:references:subject
         :content-language:from:in-reply-to:content-transfer-encoding;
        bh=Ogrkmeu2BJ/O1MhpRIVYCkxwjtDXcP6KA+B+vJcnV1o=;
        b=gwU2lVFWRPRc0VMB7SqBj4rMzSzGco92LiPN11XGKKakCltyU9LtcM+Aqx/wph/i8o
         w/jj9+9U/w/xXl0AVsu2ZmOxIJzGovQmy8eouznMAcyKEv8J2smJPOFith5Puwh3QEuC
         KN8cAlStyvwKPFbe/fj+OfkNJfeZ5H+4AF196X39zL6w5VPKRk3itII9vHseEWcWqEo4
         /thdYt/inlXB2+FjLQeChyaXK/XP2GykNlCBqdyluDRFPnZ41GZGRiP5QJSPSMOedAuz
         5ud7Lad1thB50nGk/iINqN3yLryRcMCHPdX6IMKgIFVhcI92FUM08O+7xiY88grSxtkd
         Sr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:to:cc
         :references:subject:content-language:from:in-reply-to
         :content-transfer-encoding;
        bh=Ogrkmeu2BJ/O1MhpRIVYCkxwjtDXcP6KA+B+vJcnV1o=;
        b=yTUXZtkhWYNgFqBCkBlJua3MFX+Eh/Uoa7HaOxr8OhVHQihMqRYPhbJusoCQz+58Wo
         d5DMpjGprY3OZpEyjWPIZwYndZWH5083e3XEiP/rZc2UZ95nxatwdOM/O4TVMmyu/g/3
         ABn3zsdU0zuzH94UsosEGIeZNvNZfb1WvyOVZZ4yX5mC23Gqo4SECHSh5jMARaio+ynP
         CiKsnfCj1JRprsnYyQqi39ePeQMkdzE2NMJe+DJki4NSUo9Ze2Bg6Qge8rJ9dq4ETW6b
         q62FInDZ81206K7u6itO5DSlWvA/D8OJXVZzCLiOvpdVobshVOU3keov+u2UiyD9tzoz
         DTlw==
X-Gm-Message-State: AOAM532rBeC0zR0wrB3GpQG4L1J3lOKe62PuN/EeihP2rFPOQRIE+UCF
        6MG+BKR2HBQVCdHJH2S9Odc=
X-Google-Smtp-Source: ABdhPJwQdImDj/HE7FOLV1mXtsXJLMahXb2vdHWflFcTW32aXm/IR6ve5LME9Us4sqq5N9JUsGMsvQ==
X-Received: by 2002:a17:90a:a78d:b0:1bc:d11c:ad40 with SMTP id f13-20020a17090aa78d00b001bcd11cad40mr10107961pjq.246.1649847972951;
        Wed, 13 Apr 2022 04:06:12 -0700 (PDT)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id l5-20020a63f305000000b0039daaa10a1fsm2902857pgh.65.2022.04.13.04.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 04:06:12 -0700 (PDT)
Message-ID: <15b941a4-c41d-3fc1-c4f8-9a6736f6b874@gmail.com>
Date:   Wed, 13 Apr 2022 20:06:08 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
To:     Kosuke Fujimoto <fujimotokosuke0@gmail.com>
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <172fa015-26df-c978-853d-3aba67c581cc@gmail.com>
Subject: Re: Is there any Japanese translation maintainer?
Content-Language: en-US
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <172fa015-26df-c978-853d-3aba67c581cc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

[+Cc: Jon, Greg]

Hello Fujimoto-san,

On Wed, 13 Apr 2022 18:09:59 +0900,
Kosuke Fujimoto wrote:
> Hello,
> 
> I would like to contact with Japanese documentation maintainer for some 
> changes. However, it looks like there is no one listed in MAINTAINERS file.
> Is there anyone who is maintaining Japanese documentation?

Existing Japanese translation has a note on its first page saying:

> This document is maintained by Tsugikazu Shibata <tshibata@ab.jp.nec.com>

However, this email address is not reachable any more.

I also have a few things I'd like to fix/update in it.
I'm glad to know there exists someone else who has similar
thoughts.

I think I can play a role as a tentative maintainer who can
review your changes.

Jon, Greg, do you have any idea of Shibata-san's whereabouts?
If I understand the circumstances, it was Greg who suggested to
Shibata-san the addition of Japanese translations back in
2007 or so.

        Thanks, Akira

> 
> Best regards,
> Kosuke

