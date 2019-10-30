Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 09A037D910
	for <lwn-linux-doc@archive.lwn.net>; Wed, 30 Oct 2019 21:59:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727390AbfJ3V7S (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 Oct 2019 17:59:18 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:37912 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727127AbfJ3V7S (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Oct 2019 17:59:18 -0400
Received: by mail-io1-f67.google.com with SMTP id u8so4356724iom.5
        for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2019 14:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S7mK3Uoiwaws9OYl+5bVE084OvHB6LGX6Sfc0eSAjwc=;
        b=aKsZ4bdZUSBifwnA9EI/sfdmKnP62vGSwIqzhbMUiTCUkHM2p7iqF53Jzgdv5kXvv6
         GBFkJoqdRYLQIybUp5uZd8C9F7L2xM/7BvH0VitcMonLl80SQX9+/8cxz1Pb55faR4eW
         W84909D8+2Y2GxJriYNmqjYg9MaPiledZHFQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S7mK3Uoiwaws9OYl+5bVE084OvHB6LGX6Sfc0eSAjwc=;
        b=UEivzNyH17HrGgwarI+r3s2R472X/O9xOLowJ0jZnnEm9cjCkmRjlHTa14ZozXiS4N
         TPddlVw4EFG8CrvG8N5qs6u5Rz9qmgghzZI84NA0ujR0nGaxRGekGdcjQLv5/DzNGoMz
         BPdq+EPjuAqRcID5Go7gbgZnKgTTVyOFOp+OTs9D5v879TVrXkZ0M0lym1InKYdoW8tf
         eB52dYjvAs5Kpbepu/vLK6g7nTd6fCh7LkOh4i08S9tRQ4IgR07UUsp9Xj8fy74ubtSZ
         rY8KIZpFQdPnvRGPm2NNuBYZNXClvYeRDJ87ygxuwEtjHmKphyHmHcaspkogLtE/DVKv
         Eqow==
X-Gm-Message-State: APjAAAVGXE/VNZgYiYC5Ce1QowzDdVrSottdOhzaJwfhazT7Am9wj0YR
        5AyyTXfW6IqNZ7isItUayLXpFoIZ7us=
X-Google-Smtp-Source: APXvYqwkzh0E1eTdKN0Jlm7NP+SNi+qAhVV839mRYKTYHiC1wWhoY9jTdOW68QzqgFBb9EbF3rEkrA==
X-Received: by 2002:a05:6638:533:: with SMTP id j19mr363694jar.33.1572472757562;
        Wed, 30 Oct 2019 14:59:17 -0700 (PDT)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com. [209.85.166.169])
        by smtp.gmail.com with ESMTPSA id c14sm221356iln.52.2019.10.30.14.59.15
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2019 14:59:15 -0700 (PDT)
Received: by mail-il1-f169.google.com with SMTP id d83so3547662ilk.7
        for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2019 14:59:15 -0700 (PDT)
X-Received: by 2002:a92:ba1b:: with SMTP id o27mr2484026ili.269.1572472754921;
 Wed, 30 Oct 2019 14:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <20191030100618.1.Ibf7a996e4a58e84f11eec910938cfc3f9159c5de@changeid>
 <20191030173758.GC693@sol.localdomain> <CAD=FV=Uzma+eSGG1S1Aq6s3QdMNh4J-c=g-5uhB=0XBtkAawcA@mail.gmail.com>
 <20191030190226.GD693@sol.localdomain> <20191030205745.GA216218@sol.localdomain>
In-Reply-To: <20191030205745.GA216218@sol.localdomain>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 30 Oct 2019 14:59:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X6Q3QZaND-tfYr9mf-KYMeKFmJDca3ee-i9roWj+GHsQ@mail.gmail.com>
Message-ID: <CAD=FV=X6Q3QZaND-tfYr9mf-KYMeKFmJDca3ee-i9roWj+GHsQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "ext4 crypto: fix to check feature status before
 get policy"
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     Gwendal Grignou <gwendal@chromium.org>, Chao Yu <chao@kernel.org>,
        Ryo Hashimoto <hashimoto@chromium.org>,
        Vadim Sukhomlinov <sukhomlinov@google.com>,
        Guenter Roeck <groeck@chromium.org>, apronin@chromium.org,
        linux-doc@vger.kernel.org,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        "Theodore Y. Ts'o" <tytso@mit.edu>,
        Jonathan Corbet <corbet@lwn.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
        linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Wed, Oct 30, 2019 at 1:57 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> FWIW, from reading the Chrome OS code, I think the code you linked to isn't
> where the breakage actually is.  I think it's actually at
> https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/master/chromeos-common-script/share/chromeos-common.sh#375
> ... where an init script is using the error message printed by 'e4crypt
> get_policy' to decide whether to add -O encrypt to the filesystem or not.
>
> It really should check instead:
>
>         [ -e /sys/fs/ext4/features/encryption ]

OK, I filed <https://crbug.com/1019939> and CCed all the people listed
in the cryptohome "OWNERS" file.  Hopefully one of them can pick this
up as a general cleanup.  Thanks!

-Doug
