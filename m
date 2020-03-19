Return-Path: <SRS0=tpYU=5E=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67660C4332D
	for <linux-doc@archiver.kernel.org>; Thu, 19 Mar 2020 19:34:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 49BDF2070A
	for <linux-doc@archiver.kernel.org>; Thu, 19 Mar 2020 19:34:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727426AbgCSTeJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Mar 2020 15:34:09 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:48697 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727178AbgCSTeJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Mar 2020 15:34:09 -0400
Received: from mail-lj1-f198.google.com ([209.85.208.198])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <guilherme.piccoli@canonical.com>)
        id 1jF0vg-0006yC-1j
        for linux-doc@vger.kernel.org; Thu, 19 Mar 2020 19:34:08 +0000
Received: by mail-lj1-f198.google.com with SMTP id f24so724560ljm.9
        for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2020 12:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8PARSOIOUIl7HEjmOfNmM9qE7MvdCt1w1qAJWcg9LIE=;
        b=QUaat0j/ZYyHGCwGMy+5KkKkmWLnLWu2FzX/D5WwzTooC6NP5BzHLLzZBnKZSFoQWL
         5iiHPFHj8be0PUC+trrtVmh/v9giKBL39yLjFZlGH7egLTuPB8tGzwRNQgU4OOcgNUsI
         Fl9G20T7M8A7rQjh1vXFkUXK0OpKHrjJWq7oz19KVNyYoVwYoViRrFYiuxOXlVlV6UqB
         zlAHojyVBcZnwGY1rtPqx7BVj5HSBFr5T7aa6n0wY5XhrQFTn4ovZ5b1B+RmjOxfQ55t
         4X8X0dkbPD79QOlvChJN6eA2r8tEVhOTih4XyvroD79LexMHONZ7OzGxPMZ59ROsumGA
         7SDw==
X-Gm-Message-State: ANhLgQ35kufAnSgVfMmjjFB9Fwxaw/miRlEBs+yhkwuzHGFPzdvkM1Th
        IuYZhJZ+4LTdSqnStVQLGpxqp/ZLDIlGGcrKEH/+/2DpQY1Kf73n+2UmxNUr5HBnjzlXxz6/kyK
        eBWCa8V7cKMe5xpZ3w8iEf8QR45mky6f99wqLwoiwJfrSSzwMyIL4Zw==
X-Received: by 2002:a2e:b554:: with SMTP id a20mr3167554ljn.34.1584646446941;
        Thu, 19 Mar 2020 12:34:06 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtr0rgWYtmrsAVjHp2wMAPFGOg/3YVyK7C6KvTAKV9PEkHsojLpBsi7zau+NmzoaMU0ew+eRpuxvN9fwVZ01lA=
X-Received: by 2002:a2e:b554:: with SMTP id a20mr3167544ljn.34.1584646446768;
 Thu, 19 Mar 2020 12:34:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200319191806.11453-1-gpiccoli@canonical.com>
In-Reply-To: <20200319191806.11453-1-gpiccoli@canonical.com>
From:   Guilherme Piccoli <gpiccoli@canonical.com>
Date:   Thu, 19 Mar 2020 16:33:30 -0300
Message-ID: <CAHD1Q_zycuasUWz2TmrKLS47qQZaw2Gp1gcuW7vhdyYpkKkvyg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: Better document the softlockup_panic sysctl
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        swood@redhat.com, mcgrof@kernel.org,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        "Guilherme G. Piccoli" <kernel@gpiccoli.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This shows as it was sent by me, 15 minutes ago...I can't even imagine
what happened, I didn't resend that.
Sorry for the inconvenience!
Cheers,


Guilherme
