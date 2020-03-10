Return-Path: <SRS0=92oT=43=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DDC0C18E5A
	for <linux-doc@archiver.kernel.org>; Tue, 10 Mar 2020 19:05:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 576DA21D7E
	for <linux-doc@archiver.kernel.org>; Tue, 10 Mar 2020 19:05:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727268AbgCJTFi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Mar 2020 15:05:38 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:54506 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726851AbgCJTFh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Mar 2020 15:05:37 -0400
Received: from mail-lf1-f71.google.com ([209.85.167.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <guilherme.piccoli@canonical.com>)
        id 1jBkC7-0007qc-FS
        for linux-doc@vger.kernel.org; Tue, 10 Mar 2020 19:05:35 +0000
Received: by mail-lf1-f71.google.com with SMTP id f3so1618110lfm.14
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2020 12:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TkV8UM14FmWKPCm47uTjcGb+2xm1o4k53lOL6TQAvbU=;
        b=uEjCk7CkSbURY80EpzVlLTm7r3VadMisuQ6QfZ1vwg7YO5v69h5zDPdVZr6gTJ4W1B
         9d04COERwxk/5guxkLg8++qTmuDl7QAxsBtjqZnpYPYRGDJpm2DkJ01MJViH0vSOrqlT
         ERUe3SSQfFkl5w4S3pB/b8JmqhtxrVuIWRg6NfdySG8e5xcfRQqwm8Zaa3icZi7rJSot
         ecoMdOCoiOEHeQr1UmBWmdhBMrJu/aaDnh7ujQo61n0cd64E/0SdlHVZ/horoTb280tM
         xsTQSvOd8L211FtBSVkg88xCZNsDAbOk1fc7gnMoBExkU9r3F47aWzM0jOWNI+XsaF4O
         gH1w==
X-Gm-Message-State: ANhLgQ2PbZTDLu4wg7JnTEGXMBLHgOsivqbhocVFmC1FZYd/oQrsVZi1
        juUTt38B9PiQydqdVh0k9TR+PJg5hR6GNnK/5cFy3PflqzgqGB0m8ndxUPQZONoHqJgMAnwTIR1
        Wj0dsbjQf9vs5hFX5tsHbk6Zz6G2Yu58f7VlWMKJq1GZxX6MNQ7CwnQ==
X-Received: by 2002:a2e:8e96:: with SMTP id z22mr413585ljk.2.1583867134859;
        Tue, 10 Mar 2020 12:05:34 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtHjE/uS5DhyDzG1HLUUAry+gnUpqxN9JYuDnp/ngMW8W4gXxm/s1Mt1vymubj7q6w90a72K8mMmrYJGR49pTE=
X-Received: by 2002:a2e:8e96:: with SMTP id z22mr413572ljk.2.1583867134587;
 Tue, 10 Mar 2020 12:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200310151503.11589-1-gpiccoli@canonical.com>
 <20200310110554.1fc016ad@lwn.net> <CAHD1Q_w26XP5fOcqW_toDLvEU0crt1dUUjiwCyWTn_U1-Nh=1g@mail.gmail.com>
 <20200310124923.58845026@lwn.net>
In-Reply-To: <20200310124923.58845026@lwn.net>
From:   Guilherme Piccoli <gpiccoli@canonical.com>
Date:   Tue, 10 Mar 2020 16:04:58 -0300
Message-ID: <CAHD1Q_wowq-v20Q_nyYJmBq0PSpbuedkfij9TZvcaK9F1d8KUw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: Better document the softlockup_panic sysctl
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        swood@redhat.com, mcgrof@kernel.org,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>, mingo@kernel.org,
        "Guilherme G. Piccoli" <kernel@gpiccoli.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 10, 2020 at 3:49 PM Jonathan Corbet <corbet@lwn.net> wrote:
>
> That's what the MAINTAINERS file is for:
>
>         T:      git git://git.lwn.net/linux.git docs-next
>
> jon

Heheh thanks Jon! I got this tree and was able to apply cleanly the V2
there (on docs-next branch), so I think we're good; let me know
otherwise.
Cheers,


Guilherme
