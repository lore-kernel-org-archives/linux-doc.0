Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 195CCC433E0
	for <linux-doc@archiver.kernel.org>; Tue, 26 Jan 2021 18:52:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E11C822B37
	for <linux-doc@archiver.kernel.org>; Tue, 26 Jan 2021 18:52:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389438AbhAZROt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Jan 2021 12:14:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389582AbhAZHlf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jan 2021 02:41:35 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15330C0617A7;
        Mon, 25 Jan 2021 23:31:04 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id q12so21432869lfo.12;
        Mon, 25 Jan 2021 23:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X+btyhdpzhml5CUOh/lebyOZ8pAmUTvpNwRnX6Tn5P8=;
        b=PUEO9V3HWsSw67v/KkB+03UgqcgkxOc5c+bE+cLoQXxV4aHCMwTd4qdx8X6rL2L7pD
         Z8iKljr1r8J+3tAFWG/2B/axH5KhHAy6ZrH/LbzBVttDpxd8vT4XckDIz18eeYi36aKg
         uUKyE40LxM+63AP7oZ2Kcia3M5k9+3P2Kpj0GgD1zqlThk0RwCSj/rTnUFcdSglvMqzV
         l1d4AuZL3lcR+NgozXLGL4sLD6V2mMcgbqYqRx6DVJmRXqpKiSrClNjcuj099ayAfKcy
         u8Pk3mecPU/ZEI2Akn4fWBHb8ymibsD4TsKLPJ1XdycQTCz8iMOdCfml16Fh8r01Bkbt
         DgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X+btyhdpzhml5CUOh/lebyOZ8pAmUTvpNwRnX6Tn5P8=;
        b=ENP/N/xPO7aqtjvWwdpgOPWhyCtlo1z2JAKvA5E7vu4YWo0oPsYqS3Kl80g5d29Cwf
         t345pakSXAZ73De6oPcGFV46eL5L9SJOv62EC6O/PkG12aLwX+pDxi2O1UqfO5JkNlZc
         3e3qCFhNLXxbOnG7KjQF0TQsb2jdpXFT/mh9BfYJq+Pdl0EaUnW/bXP9hY01ulQk50JK
         OU0qXqdAg6U1z2IgLm+C6k6NZXSEjegHqkGoeHJHccypBdt8sjJ8JRwb6t1wdAhwLP47
         aCHtdRdZKNAexjVJomUu+dAM1+fwI9AysXe8DvwbnxaPCDTbH+b6I/IwJmVeraNlMeUo
         aFPw==
X-Gm-Message-State: AOAM5305w2vaDk9/8SihC/1CZcSn5YKYYgW+6gZB4IZQzxX+ESRmeCRg
        Ynw0ia5azhdPJodm8d+rFBZ00V6vDsj8cWC8N20=
X-Google-Smtp-Source: ABdhPJzkhAOgX4GiBbn8bo4t9x/nhGhhC1OhrmM44AZ1GLTnIMev0SLZl+dVisgWw2jh5hXffL9EptNS/74Ql8Azrf8=
X-Received: by 2002:ac2:44b1:: with SMTP id c17mr1776277lfm.556.1611646262495;
 Mon, 25 Jan 2021 23:31:02 -0800 (PST)
MIME-Version: 1.0
References: <20210126072443.33066-1-foxhlchen@gmail.com>
In-Reply-To: <20210126072443.33066-1-foxhlchen@gmail.com>
From:   Fox Chen <foxhlchen@gmail.com>
Date:   Tue, 26 Jan 2021 15:30:51 +0800
Message-ID: <CAC2o3D+7edK-5dx_pEbq40r3WtLFMB_=HTXnJcjpus3GGbJ+WA@mail.gmail.com>
Subject: Re: [PATCH 00/12] docs: path-lookup: Update pathlookup docs
To:     corbet@lwn.net, vegard.nossum@oracle.com,
        Al Viro <viro@zeniv.linux.org.uk>, rdunlap@infradead.org,
        grandmaster@al2klimov.de
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 26, 2021 at 3:25 PM Fox Chen <foxhlchen@gmail.com> wrote:
>
> The Path lookup is a very complex subject in VFS. The path-lookup
> document provides a very detailed guidance to help people understand
> how path lookup works in the kernel.This document was originally
> written based on three lwn articles five years ago. As times goes by,
> some of the content was outdated. This patchset is intended to update
> the document to make it more relevant to current codebase.
>
>
> Fox Chen (12):
>   docs: path-lookup: update follow_managed() part
>   docs: path-lookup: update path_to_nameidata() parth
>   docs: path-lookup: update path_mountpoint() part
>   docs: path-lookup: update do_last() part
>   docs: path-lookup: remove filename_mountpoint
>   docs: path-lookup: Add macro name to symlink limit description
>   docs: path-lookup: i_op->follow_link replaced with i_op->get_link
>   docs: path-lookup: update i_op->put_link and cookie description
>   docs: path-lookup: no get_link()
>   docs: path-lookup: update WALK_GET, WALK_PUT desc
>   docs: path-lookup: update get_link() ->follow_link description
>   docs: path-lookup: update symlink description
>
>  Documentation/filesystems/path-lookup.rst | 146 ++++++++++------------
>  1 file changed, 63 insertions(+), 83 deletions(-)
>
> --
> 2.30.0
>


To help review the patches, I annotated and highlighted changes using hypothesis

you can check the current docs:
https://hyp.is/go?url=https%3A%2F%2Fwww.kernel.org%2Fdoc%2Fhtml%2Flatest%2Ffilesystems%2Fpath-lookup.html&group=__world__

the docs after patches applied:
https://hyp.is/go?url=http%3A%2F%2Flinux-docs.54fox.com%2Flinux_docs%2Ffilesystems%2Fpath-lookup.html&group=__world__
