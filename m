Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5747CC004D4
	for <linux-doc@archiver.kernel.org>; Wed, 18 Jan 2023 04:25:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbjAREZb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 Jan 2023 23:25:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbjAREZU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Jan 2023 23:25:20 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4093F54B18
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 20:25:16 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id s67so23620083pgs.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 20:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Mg95XxoTjG6rJge922bVDC3FpQYAhptYrJkHQYMY5ug=;
        b=CuMzxVTW96S8qaSeFFVbve3AnRLcT7YmpmrYKdG9rk/98vMam1VDa9L1V2gWAI2d/x
         FbWtk4ouabeOZ2Un+SjvlhNaNrPaYUVhwVn7yYYbcWn+/tyx8LnoozO5uEazyHesskJs
         y9G90riwLn6FsAxbH1i29no40whU3E2Ken3WYZDlBU4yLJrs62W2bCd9bSzxjdoqIzIR
         DdWTqrVY/eJ8MIICsTXZYbVIQhVipmOejpZGVrPkvf0NHAoYOqAGImKOKu7u/bJnqLFQ
         L5lzrdm8/SM66bwyVWbdLr1z9L1FXbuhhM6d1g41PlRx8j/XxfPCT/kLGp9BPPY8Xtv5
         Y9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mg95XxoTjG6rJge922bVDC3FpQYAhptYrJkHQYMY5ug=;
        b=RRWnCfBb3Gm9OtP1zGZrJcFfQGC3IENGj9WrXfynX0xp7b1WCX7FFSswOoec3O5AeC
         VaMubU8dCEE382GgyIq4w89LgKTMfg6mMbuid5lACsCMScl6x86zSPVjeHva7sEJA7xM
         yx70CZxWTk9/9ooDngSIpQP5qIP2Q/HSrlZS0SSbQW5uyXFurYHjzCD6xYNxq9PjGY6p
         heEAzRmjBSEjH4DkCx6uqOqg18Q/qgR9rrVFfFUh8zkUPYoeQGhDAQPEAeZYUoQb3tSZ
         4WIPMzAvQpZQCGQ3DABlWYqa3lAwSjKpvRAzcvjBPaFWFGpSS3irjEysoBcsBEA8v34S
         PLkw==
X-Gm-Message-State: AFqh2kpMNI50h5zXPXU9vLjebFBhXFmru05kEKjd91BgseOw56RddT8X
        NN7Yza0ccjZMYC7mA65SfoBsUonx0GTX1G3v4u0Wkw==
X-Google-Smtp-Source: AMrXdXtj2/bvs1sMXbrCQTqnIWnahy9z20x6519NP1n8Ff0H/d5cMF6UCziJXKl/vHlE1MhZuX8jlVuXXPSMDG3rfYo=
X-Received: by 2002:a62:1a14:0:b0:58b:a8aa:9c8e with SMTP id
 a20-20020a621a14000000b0058ba8aa9c8emr514206pfa.62.1674015915369; Tue, 17 Jan
 2023 20:25:15 -0800 (PST)
MIME-Version: 1.0
From:   Sadiya Kazi <sadiyakazi@google.com>
Date:   Wed, 18 Jan 2023 09:55:04 +0530
Message-ID: <CAO2JNKUA5DWxNk2cCZwj8DEFF-acf6ZpxwBqn2qTwn4fTW1+BQ@mail.gmail.com>
Subject: New theme - Alabaster for Kernel Documentation
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     David Gow <davidgow@google.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi all,
The design of the new "alabaster" theme used for Kernel documentation
is nice and minimalistic, but I notice one issue with its navigational
feature: In the "Alabaster" theme, the TOC appears at the top of the
page. For documents with multiple headings, this design creates a
usability issue by forcing the reader to scroll past a long TOC to get
to the actual content. The previous "RTD" theme used a left navigation
bar that allowed users to quickly navigate to the desired content.

To try and compare both, please open the index page of the "alabaster"
theme given below:
https://www.kernel.org/doc/html/latest/dev-tools/index.html
and the "RTD" theme given below:
https://www.kernel.org/doc/html/v6.0-rc7/dev-tools/index.html
and navigate to the KUnit page. You'll notice it takes more time to
land on the KUnit page when using the alabaster theme.

With the "RTD" theme, the navigation sidebar links to other pages
(parents, siblings, children, and all top-level pages) as shown below:
https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html#
Alabaster only shows headings as shown below:
https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html#
making it effectively useless for navigation. This is particularly a
problem for the KUnit documentation, which relies heavily on being
able to find related pages. Currently to navigate to the related
pages, the reader has to return to the Home page, use the search bar,
or manually edit the URL (i.e, only if you know the chapter or section
name).

So, after comparing both the themes, could we modify the sidebar to
match the "rtd" behaviour if there is a way to do so? If not, would it
be sensible to either include this support in the "alabaster" theme or
even temporarily roll back the change until we find a solution?

It'd be great to hear your thoughts on this.

Thanks,
Sadiya
