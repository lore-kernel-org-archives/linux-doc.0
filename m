Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3EC777D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 31 Jul 2019 16:01:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729464AbfGaQBT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 31 Jul 2019 12:01:19 -0400
Received: from mail-ed1-f47.google.com ([209.85.208.47]:46816 "EHLO
        mail-ed1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728093AbfGaQBT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Jul 2019 12:01:19 -0400
Received: by mail-ed1-f47.google.com with SMTP id d4so66214714edr.13
        for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2019 09:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OOHNaf/9zGja9offVGntbMakWJQ+ZGc77yJFGDwH+JY=;
        b=PNBn1vWg4YbSeIowQjqpM/X23ksXLc6f3T3CgQCwNd4mt2cTyo7ZzHCzFOd5K1E4Iy
         v4pzf31+LzNF9jhZ74VoLjDAEniolM4dYJ+UpfPPdEAH5TbYVVzHXfBlV66rIU0gUfPM
         zXZCAUoX/jNc4sONQMGRGcYLTOFVAvx6f2ztMskDsa9mZz05W288TyU311SRl1/Qk+jN
         o3QsrCKdgzFmQjIBIJerB/AjhVzS9O5yeQK/EnRHuNWXFMBWK65A+iIVESBIMYXjk92a
         E3loxdrE0PaHqIuCD95gAksQsGy7FbeKWPF1CvNgm1zmfkOVtwlh5lRNyxxrsPzpkM4r
         NEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OOHNaf/9zGja9offVGntbMakWJQ+ZGc77yJFGDwH+JY=;
        b=pdLouPytVzLdtFh8U3XEQXS1x6NTahZA7C7s/cJobjO2XQB8knoO4F3gapRCVxVh0h
         W/Eyb61DniYzbN2WfhgmGCmAUR296RGLoBQZ3C7KP/EPaiA/zGTWVjqvh9QizQ7gQznB
         GZZ7Xw9NUtdpnmpGfQPE4slmH+Nh+FPRNJwplBr/1hB2McwTIhEQH+vUL1hyJaqfnGVO
         mSap8Di6E41kg3tcdZr2PDdnoUhdY2S5oXwa1GSbTJyrG65LznEcsgfaop0wjR44HGnY
         Jh5Nr2GdvsQ+iaUwPFPhbVBEBADnGvgYbs1FtKRn8olYood8fYitrMaKwXhBaWVFHAaK
         CeYQ==
X-Gm-Message-State: APjAAAUyc2PlcunOCiP6+pMbOfeAWeZZPjvD7r2aiqG6pbRc1uJStz82
        k47Pntk+yRbop0BPqnXdjHFZVas12sSeLaTRVPM=
X-Google-Smtp-Source: APXvYqwueLVfu4t2A7GiLdjDq8PdZifweEvG9mIYGEKN2rj55OFqd4HfaufMCDSjY0DZ2kfK5Vn500PtEux8jGZKWu8=
X-Received: by 2002:a17:906:9447:: with SMTP id z7mr29744336ejx.165.1564588877876;
 Wed, 31 Jul 2019 09:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190731153857.4045-1-pasha.tatashin@soleen.com>
 <20190731153857.4045-9-pasha.tatashin@soleen.com> <20190731155042.GF39768@lakrids.cambridge.arm.com>
In-Reply-To: <20190731155042.GF39768@lakrids.cambridge.arm.com>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Wed, 31 Jul 2019 12:01:07 -0400
Message-ID: <CA+CK2bCBxff=ZcCMw196idR-1uvryACdzREebqrZeJ2JPwDNFw@mail.gmail.com>
Subject: Re: [RFC v2 8/8] arm64, kexec: enable MMU during kexec relocation
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     James Morris <jmorris@namei.org>, Sasha Levin <sashal@kernel.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        kexec mailing list <kexec@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>, will@kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        James Morse <james.morse@arm.com>,
        Vladimir Murzin <vladimir.murzin@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Bhupesh Sharma <bhsharma@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> For various reasons, one cannot safely use Set/Way operations in
> portable code. They only make sense for low-level platform-specific
> firmware performing power management operations.
>
> If you need to perform D-cache maintenance, you must use the VA
> operations to do so.

Hi Mark,

I see, thank you for letting me know. I will do d-cache flushing by VA
in the next iteration. First I need to root cause/fix the bug
described in the cover letter.

Thank you,
Pasha
