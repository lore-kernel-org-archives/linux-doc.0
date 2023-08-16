Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 036A8C001B0
	for <linux-doc@archiver.kernel.org>; Wed, 16 Aug 2023 17:48:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243435AbjHPRsD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Aug 2023 13:48:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345011AbjHPRr5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Aug 2023 13:47:57 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5EA7F7
        for <linux-doc@vger.kernel.org>; Wed, 16 Aug 2023 10:47:55 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-991c786369cso921568566b.1
        for <linux-doc@vger.kernel.org>; Wed, 16 Aug 2023 10:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692208074; x=1692812874;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zvb4EMhuQrNM/UaQO5x+8B7j7oOOcRVDoATvzK0v9HU=;
        b=bWsrTfJ/YHSE5d3CIRjN7R53c+xt7CgwdGzuPszxDCRa4M6CV89Rj3w7sH0lR8leI+
         eSekQlVaZT+GetBYV/zhCJb8pRIoxk+qpxy9Nb4vGs3T/4iVHSXTtg0oHN8flURyITn1
         OkHH8EbQI3Ef6mSIEEUvUuPPOxqNCqM5UxzKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692208074; x=1692812874;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zvb4EMhuQrNM/UaQO5x+8B7j7oOOcRVDoATvzK0v9HU=;
        b=bWGwf83/NkFfDKRlG9iNPaBTRH1HYqG6woFfkcV9a4Qbrkr/+wLlzhjrfh9YvlzBtX
         Q7kB6Ix5QBrlXGmzZzbBJbhttoHD3n38F3VCqrn97n39IQYjNPGoQzN4DHgYuzyhUpba
         5uG1kRyQOjeXmQAYjQ91kRb8TaGd6faRRbioGH2Dy537btVobI/0GGqs2XHrzRIDoHc2
         5XW6xNEwhYVmU2HSOtG967pZTS8ZpAMm1O01nEJ0FaNfNenmg6FMzdjf4PU/jK7IkWhS
         8zEklWdiQmDKgrBWLcq8lHTqUqxZcOUfW7/Eg5RPgURwhrXAaLVFoRtK0cMeCpS1KvPY
         PaNQ==
X-Gm-Message-State: AOJu0YwoPmYU3LiPTYbpnGHc6ThrQV6fOHlC2PdCgx3HbXolO8LgpGrn
        KcXJEvO4Smg2A3gnhmbrUbonO6/dJW3MIv9mQ2R7PA==
X-Google-Smtp-Source: AGHT+IGn1OFTu9kNngAij5DxCSjUSZjzX8qHAZHisGsqEvd0IreL1w7+N4WKYoNojowmuplHF4f4NjdIdHeEODsWroA=
X-Received: by 2002:a17:906:fd84:b0:99b:d178:f059 with SMTP id
 xa4-20020a170906fd8400b0099bd178f059mr2223557ejb.35.1692208073931; Wed, 16
 Aug 2023 10:47:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAPnjgZ0vPwd9v+V8Pg5Bo87OELD-vokB7ZrvU3Bv5dQ_O9z6Sg@mail.gmail.com>
 <877cpusybz.fsf@meer.lwn.net>
In-Reply-To: <877cpusybz.fsf@meer.lwn.net>
From:   Simon Glass <sjg@chromium.org>
Date:   Wed, 16 Aug 2023 11:47:42 -0600
Message-ID: <CAPnjgZ3Lo4Na7YeKPFaY30bwsv_gBGapN_DXeab+k7yhCF3uww@mail.gmail.com>
Subject: Re: Doc style for method functions
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Heinrich Schuchardt <xypron.glpk@gmx.de>,
        U-Boot Mailing List <u-boot@lists.denx.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jonathan,

On Wed, 16 Aug 2023 at 11:15, Jonathan Corbet <corbet@lwn.net> wrote:
>
> Simon Glass <sjg@chromium.org> writes:
>
> > Hi Jonathan,
> >
> > I would like to do something like this:
> >
> > struct part_driver {
> >    /**
> >     * get_info() - Get information about a partition
> >
> >               ^ causes error
> >
> >     *
> >     * @desc: Block device descriptor
> >     * @part: Partition number (1 = first)
> >     * @info: Returns partition information
> >     */
> >    int (*get_info)(struct blk_desc *desc, int part, struct
> > disk_partition *info);
> > ...
> > };
> >
> > But this gives:
> >
> > scripts/kernel-doc:292:
> >    print STDERR "Incorrect use of kernel-doc format: $_";
> >
> > Without the brackets on get_info() it works OK. What is the purpose of
> > that check, please?
>
> That's how the kerneldoc syntax was defined, well before my time as the
> maintainer.  This could be relaxed, I guess, but one would have to look
> at the parsing code to be sure that the right thing happens all the way
> through the process.  I'm not entirely sure it's worth it...

I see. It is inconsistent, since we use () after normal functions.

I think I can fix it just by removing that check.

Regards,
Simon
