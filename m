Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 562A2C433FE
	for <linux-doc@archiver.kernel.org>; Mon, 14 Feb 2022 21:56:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231678AbiBNV4s (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Feb 2022 16:56:48 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231676AbiBNV4r (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Feb 2022 16:56:47 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E4AA2E0BC
        for <linux-doc@vger.kernel.org>; Mon, 14 Feb 2022 13:56:38 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id l19so25739738pfu.2
        for <linux-doc@vger.kernel.org>; Mon, 14 Feb 2022 13:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OiSsgbTNNS1PN2vIPffxFK30orCDWpVATmUi7r4Spwg=;
        b=s2HLQSrEt1NVq3FaO+ItzWZFW9EJKI1oCIoU5Jy54OTgfCqR5PwyTzERIxURcgsAZd
         qNUSe36yPkPVXgbpjzQm+FOJExSbbdqleCWn9WzVHNUQI74JuKmsH6WYtdUr+60csGrL
         joRG5DeBZTuH4FJSEDJLdKCPoh8/Fxu1OgBsPlpNJ/QBQIH9warKHhaprmtNcEcmQVEV
         Y5W9UIJDKomuxLj2e3bK1l+yXhvCZX1Yc7TSCy8ZK+TRAya0gWX451cja6JpPA5X8EC/
         SVvCKI+/uomzhGTcd6zMcRwokZzCufOWj/joH1SvK5KptpNnHFx+HGGI3apdLw6jYryx
         BjwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OiSsgbTNNS1PN2vIPffxFK30orCDWpVATmUi7r4Spwg=;
        b=tKjGr+HE6gohUitqGrbhz4Mwi39sGTA/Qm6fPLBviuuRq1r8mU6dE6GWA6fbyw/5vv
         QbH+F+TkO2JdKwXQa9DzFRATlLbTo5IquXcbwcWOemzd25DOHMAlxe3VGdQxY6j+Y3EG
         0FYKng8qj615WR7uhUdyztS5IVzZxEKYQHockS0032cs6ChA1jyOtrohUMnHvOCVn9D4
         17Tki13SmsgXAgZV9VJO6GtXY0SLT0jsmQtQ4EuOo+nu6m1/eQ/0QchELMvXTKvJxn89
         vlvFxkvuLUoWXS+sXFyTlx/WBlHr2VDttT8y5Kgsyhm8CU2H1TocCZT3BVY6Vz0CMjjs
         aRgw==
X-Gm-Message-State: AOAM532lAqwPCkI/xOBv8hbkWnYpSbJp/Pc0fXsj9OVbGINq7z4n1Fg9
        tQaevN0/NR01/hoMK4PzST1uTDIhUkHPJr5t6i2egA==
X-Google-Smtp-Source: ABdhPJyRoHiuH80bBOXiC5qPysRfk9zG+7MBAT8XtZyduYTj7PVhc/t5GG7c/JUqSnNMFiZOG85ck4R12JWh6AlDJvs=
X-Received: by 2002:a63:ea4b:: with SMTP id l11mr934534pgk.12.1644875797678;
 Mon, 14 Feb 2022 13:56:37 -0800 (PST)
MIME-Version: 1.0
References: <20220210233630.3304495-1-frowand.list@gmail.com>
In-Reply-To: <20220210233630.3304495-1-frowand.list@gmail.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Mon, 14 Feb 2022 16:56:26 -0500
Message-ID: <CAFd5g46HuUcPggLrUjuXO7XJGSxQK590oK7OCOB9ma+TFCiTdg@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] Documentation: dev-tools: clarify KTAP
 specification wording
To:     frowand.list@gmail.com
Cc:     Jonathan Corbet <corbet@lwn.net>, David Gow <davidgow@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>, Rae Moar <rmoar@google.com>,
        Tim.Bird@sony.com, rmr167@gmail.com,
        guillaume.tucker@collabora.com, dlatypov@google.com,
        kernelci@groups.io, kunit-dev@googlegroups.com,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 10, 2022 at 6:36 PM <frowand.list@gmail.com> wrote:
>
> From: Frank Rowand <frank.rowand@sony.com>
>
> Add the spec version to the title line.
>
> Explain likely source of "Unknown lines".
>
> "Unknown lines" in nested tests are optionally indented.
>
> Add "Unknown lines" items to differences between TAP & KTAP list
>
> Convert "Major differences between TAP and KTAP" from a bullet list
> to a table.  The bullet list was being formatted as a single
> paragraph.
>
> Reviewed-by: Tim Bird <Tim.Bird@sony.com>
> Reviewed-by: David Gow <davidgow@google.com>
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Frank Rowand <frank.rowand@sony.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
