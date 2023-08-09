Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F6CC0015E
	for <linux-doc@archiver.kernel.org>; Wed,  9 Aug 2023 22:45:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233345AbjHIWph (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Aug 2023 18:45:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231199AbjHIWpg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Aug 2023 18:45:36 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 660FE1AB
        for <linux-doc@vger.kernel.org>; Wed,  9 Aug 2023 15:45:35 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6bc9811558cso290880a34.0
        for <linux-doc@vger.kernel.org>; Wed, 09 Aug 2023 15:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691621134; x=1692225934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IYXl3RrdquB9Ho5EWgj4Trb8iaNi5AAc7V62J8/U+2U=;
        b=g9IRPR3fNObWkuKpLaklAg2KwEj1yjDutI0rhuDEpK8jY96HuF2psgETqe/XrmnPhD
         jva8ORxrZEcvXDzSK6ywrvMf/BOF5kgQJoeYleP5Uh4JpvzThQzWGsA6RUWhsNeJXNhb
         dte2auuNnDHSjHOLS9xgL5q/yWasM5K/0kAfqoTJRPYa0PDluh7q9HLvDdOKTlJJfHto
         5PDPiHv5gn02yEggqEHSGPT4NdPuFZSBwP61bEbRpbLZtthJfw1UYCJiH1bc5vmQi21o
         9S9lL0wqEs5RXiEqUFrEpZt5+wDoWrrGF0fXP006pmFQX7ibAWrur8lTWaj0rGrkUXhM
         Z9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691621134; x=1692225934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYXl3RrdquB9Ho5EWgj4Trb8iaNi5AAc7V62J8/U+2U=;
        b=UQeuigPQrCKI77TNZQpdj8QqVE2IJF0/LKTnsUTZJu4R28267FT1eoehMZaKNvat2n
         2nbmWLm8ZttKu0cuFSD7MhSkylS2nmFUQ+1JJ3+ZRraFv2oRBsqFdOtVr6/rbIlGlLOM
         EPLpO0dSuQNE7VM9lhmwCnPowb1E/A3OLOCyP3gtOyVpA8D3eJT4e2XaqS0fb09G2Yhs
         gZ9DpiyUPpO6jB+8n/okyZUavKmL0Y8VO1MBO7DjNAi8FX2l8LoZ3vNqXvoAW3GbDm8e
         nSDUMqaOrekwghpr5el6Nk9W5eU8jPHqH2rUZ0d/9OPyKRiWYs23s3solcCVPTSMpkKn
         Pa/A==
X-Gm-Message-State: AOJu0YyGX8oFU6XzlAMsl1bxbs/UiELcb8jKYGSOGK/nGJ+PYtzPzYbF
        nTmEBXCx1ItPt+1GlxEaUAOBAiF62smFv0aId+c=
X-Google-Smtp-Source: AGHT+IH+4koeF0K3irmsPyfqmp0CgHhX+m/BeL70iUcm3M72Bf4Rf+ltNoovX0/mGJoR9LCbEeV95Q==
X-Received: by 2002:a9d:7306:0:b0:6bc:8a9a:35a6 with SMTP id e6-20020a9d7306000000b006bc8a9a35a6mr486662otk.9.1691621134736;
        Wed, 09 Aug 2023 15:45:34 -0700 (PDT)
Received: from ghost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id x9-20020a656aa9000000b00563df2ba23bsm108226pgu.50.2023.08.09.15.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 15:45:34 -0700 (PDT)
Date:   Wed, 9 Aug 2023 15:45:31 -0700
From:   Charlie Jenkins <charlie@rivosinc.com>
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        conor@kernel.org, paul.walmsley@sifive.com, palmer@rivosinc.com,
        aou@eecs.berkeley.edu, anup@brainfault.org,
        konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
        mick@ics.forth.gr, jrtc27@jrtc27.com, rdunlap@infradead.org,
        alexghiti@rivosinc.com
Subject: Re: [PATCH v9 0/4] RISC-V: mm: Make SV48 the default address space
Message-ID: <ZNQXC+UQ+a0s69Bs@ghost>
References: <20230809015110.3290774-1-charlie@rivosinc.com>
 <20230809-bobbing-unleaded-c3d5e1c57d96@wendy>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809-bobbing-unleaded-c3d5e1c57d96@wendy>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 09, 2023 at 08:42:58AM +0100, Conor Dooley wrote:
> On Tue, Aug 08, 2023 at 06:51:06PM -0700, Charlie Jenkins wrote:
> > Make sv48 the default address space for mmap as some applications
> > currently depend on this assumption. Users can now select a
> > desired address space using a non-zero hint address to mmap. Previously,
> > requesting the default address space from mmap by passing zero as the hint
> > address would result in using the largest address space possible. Some
> > applications depend on empty bits in the virtual address space, like Go and
> > Java, so this patch provides more flexibility for application developers.
> 
> This still does not build:
> ../fs/binfmt_flat.c:900:30: error: call to undeclared function 'is_compat_task'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> 
> Reproduceable with allmodconfig.
> 
There is some weird interaction with compat.h. Moving the definitions
in pgtable.h into the #ifndef __ASSEMBLY__ guarded section resolves 
the compile error. I will send out another version with this change.

-Charlie
