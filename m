Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD67C677F1
	for <linux-doc@archiver.kernel.org>; Tue, 17 Jan 2023 14:28:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232579AbjAQO2S (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 Jan 2023 09:28:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231962AbjAQO15 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Jan 2023 09:27:57 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BDE7A5E7
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 06:26:43 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id 123so1032138ybv.6
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 06:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j6SAxozLv1BaiKA41UPeSRieBpaAk5WSqvAlUBxsAgk=;
        b=j+EUd9Ba88tssQnyy1SfACH1y9O7e9AMTIGPLO75lSwgETMpxs0nwwbjQzVYOe4inZ
         X4uqbwBSNkqcD+qBz2YkJlkt0SdwTmcmP3ttM8HLSxbq8uuEcVZxIm270IbRsDbg2C5P
         QSkRYMMDeHx8xe6ynrQXPng76uqPz8afAsIYJXwPlnpITRReI4HJsCI874bu4ptewwbE
         pjQevO6CkNFMo6Miewupuu3ncZ4rzRDYIL+1cweYz/XFn3uFr5G3qldFEfBmbBQOSyu5
         oAU6q2ZSq0etst3DXluFPiDeoCuabeY/66+yeFQO209lz97EkSeTg5sc9PGrr0x2HWVW
         e55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j6SAxozLv1BaiKA41UPeSRieBpaAk5WSqvAlUBxsAgk=;
        b=JxuqJQQF1P3RYv5+RwFYUhGRcV/tRz+oqUhi5KWboZ7kB03uSqjYX/QtKY6xg2+B0n
         Nb6sPyFmelSOI7dOOcvHX+xkIM+bdZs9gs4QAT/5YikxRRscuwtAbuiqpTcWGHxDsOeM
         fzHLyEO9Is9arY91yR3cVx+L/rO2ig7md3Xg/uXcegLTz6xe3Cq9Qvs9DsmXLzzFi4OA
         thdUJRcsbBD2hd3OkKCU+fZ3IC6jBZ9zI7KqYN2ZuhdV6N6fpfI3I2Xf+w2btMMoyziv
         oDd4g9/JokphzcxiR4Giez0qRAwqpiigkdvrNFQrryNmxFKJO2yjiUl0gWGbjUmw0sEJ
         qrSA==
X-Gm-Message-State: AFqh2kqJL/8oBPCjMkbWMdkEe4VX44unMau3BkX5R5WDDufy9KkBId9V
        HyqvkW9l/HDqQBTLm+NIwg+qw4uv1XWetNqBtv268Da4H8nK8w==
X-Google-Smtp-Source: AMrXdXvAhed3tfAIybpkj17yY1n9A8EyPgwlmUDjhWkluk7/N6DS2W31nR70QAL+sLUeM4X/0JoD7gUmvXTfz4mZUN0=
X-Received: by 2002:a25:c092:0:b0:7d2:8687:aea5 with SMTP id
 c140-20020a25c092000000b007d28687aea5mr504980ybf.210.1673965602704; Tue, 17
 Jan 2023 06:26:42 -0800 (PST)
MIME-Version: 1.0
References: <20230116153347.15786-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdbVa3XEDzcuy7iCqx0cvj4trzPe7N0B5PswA1mQ7O+GtA@mail.gmail.com> <Y8avtfifZpy89rS3@smile.fi.intel.com>
In-Reply-To: <Y8avtfifZpy89rS3@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 17 Jan 2023 15:26:31 +0100
Message-ID: <CACRpkdYTFDsU7xhu812Lh1mA1Hs9kGeid+akR84ervAsaxVYkg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: Proofreading and updating the
 documentation accordingly
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 17, 2023 at 3:24 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Actually I have missed the repetition of the comment I put in v1,
> i.e.  that this would be good to be attached to my PR where the
> struct pinfunction et al. have been introduced. Can I have your
> Ack?

Sure go ahead, I can also take out the patches if you rather
include them with a  pull request.

Yours,
Linus Walleij
