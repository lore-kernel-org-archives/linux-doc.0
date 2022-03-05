Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1BCEC433EF
	for <linux-doc@archiver.kernel.org>; Sat,  5 Mar 2022 19:45:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232260AbiCETqE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 5 Mar 2022 14:46:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232259AbiCETqD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 5 Mar 2022 14:46:03 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCF0065C9
        for <linux-doc@vger.kernel.org>; Sat,  5 Mar 2022 11:45:12 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id j15so19722843lfe.11
        for <linux-doc@vger.kernel.org>; Sat, 05 Mar 2022 11:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LPoOJ4AaVNL3oCNAAPlELZgxMH2Mdvtu3dbXK4LFzGs=;
        b=VP5ml3rhFccJpQT10F3e7U/zoXUd4YieWbaCb33Zddq/fZ5PPyqKrvHehNKXJqspFK
         t0tbIAsfMCXqBZGAxQ7y5zWU067Uum1XlNQ1M5GMkpzR6hRmOjp5TBpqLxpXZ+9kLLXT
         asBh+rJ5Sj8uEdX26hAQGU9heQsqmTwvFUnvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LPoOJ4AaVNL3oCNAAPlELZgxMH2Mdvtu3dbXK4LFzGs=;
        b=yynnMWC+CPzExCspBGJ9j7rwVJjI+LtAwdHBzpixiDllalY8tVzL4ILL308bWhKqlx
         dDuVnyMBmGGLf984wMmv3DzwABN8FTMdccN6K10bSsp8eisAJbGBVa91BFmG7HOK5CjC
         KIZH55DnNWTv+Oxt97V2AGSeWETyXGLFBzqKQYO73wRqRpInVfJ5x1DJRVVBUnY4fjxc
         azuwGBYPiwWJ98v2w2W0AnnW74e3mvY47Zgsbje1jvMO6DFiKEKIQh5loM0pOEKpH1+K
         oHy45rujx5yFYgU1iwcxvgi5aoAqvP2EDP3dqGCjU4ozVjwjODIojwu+32wzEYjEzetm
         aSSA==
X-Gm-Message-State: AOAM533KBMeZDPLTBsX2RDkXyarWuqRFw45wxRfbUzDfYdRYj5LUkB6F
        WAL2vzTMeJ+ReHb6/NRZ8MbkFJEqnKrhFjuOLzY=
X-Google-Smtp-Source: ABdhPJzuHj0B90xXjoWw7NMpCTwchO73eEBZ/ut6uzsrOnqr/l2GHLaJmkwOwfE4UkYz+3Z+qjeTRw==
X-Received: by 2002:a05:6512:1285:b0:448:204d:3b96 with SMTP id u5-20020a056512128500b00448204d3b96mr3097826lfs.16.1646509508982;
        Sat, 05 Mar 2022 11:45:08 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id k24-20020ac24578000000b004481e8059b7sm852958lfm.217.2022.03.05.11.45.08
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Mar 2022 11:45:08 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id 3so1127966lfr.7
        for <linux-doc@vger.kernel.org>; Sat, 05 Mar 2022 11:45:08 -0800 (PST)
X-Received: by 2002:ac2:41cf:0:b0:448:1eaa:296c with SMTP id
 d15-20020ac241cf000000b004481eaa296cmr3118225lfi.52.1646509508091; Sat, 05
 Mar 2022 11:45:08 -0800 (PST)
MIME-Version: 1.0
References: <20220305170714.2043896-1-pasic@linux.ibm.com>
In-Reply-To: <20220305170714.2043896-1-pasic@linux.ibm.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 5 Mar 2022 11:44:51 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgZ6fNG03pd2pAVw9RtymwPDyHNvTLHr2Q3LX3S0Y1k5Q@mail.gmail.com>
Message-ID: <CAHk-=wgZ6fNG03pd2pAVw9RtymwPDyHNvTLHr2Q3LX3S0Y1k5Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] swiotlb: rework "fix info leak with DMA_FROM_DEVICE"
To:     Halil Pasic <pasic@linux.ibm.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        stable <stable@vger.kernel.org>,
        Doug Gilbert <dgilbert@interlog.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Anshuman Khandual <khandual@linux.vnet.ibm.com>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        iommu <iommu@lists.linux-foundation.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Mar 5, 2022 at 9:07 AM Halil Pasic <pasic@linux.ibm.com> wrote:
>
> Unfortunately, we ended up merging an old version of the patch "fix info
> leak with DMA_FROM_DEVICE" instead of merging the latest one. Christoph
> (the swiotlb maintainer), he asked me to create an incremental fix
> (after I have pointed this out the mix up, and asked him for guidance).
> So here we go.
 [...]

Christoph, I am assuming I'll get this from you, but if you have
nothing else pending, just holler and I can take it directly.

That said, it seems sad to bounce the buffer just in case the device
doesn't do what we expect it to do. Wouldn't it be better to just
clear the buffer instead of copying the old data into it?

Also, possibly stupid question - when is swiotlb used in practice
these days? What are the performance implications of this? Will this
mean completely unnecessary copies for all normal IO that will be
overwritten by the DMA? Can't we limit it to just SG_IO (or is it
already for some reason)?

                  Linus
