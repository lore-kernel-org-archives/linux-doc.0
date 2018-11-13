Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B9F9A7D089
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Nov 2018 02:03:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbeKML72 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Nov 2018 06:59:28 -0500
Received: from mail-pg1-f172.google.com ([209.85.215.172]:40987 "EHLO
        mail-pg1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbeKML72 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Nov 2018 06:59:28 -0500
Received: by mail-pg1-f172.google.com with SMTP id 70so4905136pgh.8
        for <linux-doc@vger.kernel.org>; Mon, 12 Nov 2018 18:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=subject:date:message-id:cc:from:to;
        bh=1fAHEY+0fxnM7FTjRqYpC/P9+fOazoZhOKZ35CFExHQ=;
        b=dSw61gOj7P1Wa9xWm7CdQW/kMV/8+6cd7yVtQKMHw+ryp/cgVC5BrBmihFAdYa6toB
         7cJwSWFPdRkOKJ+rkqmQp27h1uZ0D0fIRsoWfVByN9C60wXKONwjucgfZqkPB9LTRTwq
         TK7sNdTa8R72VWPYl9yocjOGyflct4iauOR6iil+SOKIlJB7BHCHMsS/EO9yztE3YrrX
         aUPTRH+9p5IeK062AheFedAkI8nHmv9Q1l//YMXIv/+R6ic12kIuetgqOvpHtoelbDcI
         e3xTDsO3nvWoHSEHwL8N+WKnI9Em/J2vPwlEQ5xwGmNyIjtHJH9LjNPg2xedHe5nQRdA
         JUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:date:message-id:cc:from:to;
        bh=1fAHEY+0fxnM7FTjRqYpC/P9+fOazoZhOKZ35CFExHQ=;
        b=XD6WXdi3SEX6q9CgIhvaF3D4hyA99rmhg9e6dCfhEYgs7YuPZHgIFhAbgbnhEfufDB
         r1f14xbf393m78dXVq4PW+dzc0Jx/bf08DiojR1QU27FqrACFIbRVty/7q7q5wloJ3s4
         Ahpq9RTbWnc0b4rOyGFE+5iLji3e9Mbe/opYSw9p2CSGpNvu7ixRVQD5SPsXH8+itN9G
         nyCfJiaDrbJmb61GhbxEVUF5Bo5hddLjPGVoBh59wg5vhEN3mkflvHKXKZX42krOkke1
         Oc3ojLSSoYap+41d+ezTgL1SuHMIx/j05vsXYPkF5Io4ugrbBgpPKLitVTe3xK3/CF8j
         FsTg==
X-Gm-Message-State: AGRZ1gLVrL+RlsnjIa7zJ2o1QAbMh03ZypExwRrcidILN1u+9fL9fVw0
        nS6gSR/+JP+eLq0S4TemOCfo3w==
X-Google-Smtp-Source: AJdET5eYXjkt4E9EC7AQl8EyZIP90RUidSQ0lhYRPfz4K2bSw/XWIdRu4scBgiU3lkBNkNfOmEXCcA==
X-Received: by 2002:a62:6547:: with SMTP id z68-v6mr3134744pfb.169.1542074616542;
        Mon, 12 Nov 2018 18:03:36 -0800 (PST)
Received: from localhost ([216.9.110.11])
        by smtp.gmail.com with ESMTPSA id t4-v6sm18744623pfh.21.2018.11.12.18.03.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Nov 2018 18:03:35 -0800 (PST)
Subject: Re-run features-refresh.sh
Date:   Mon, 12 Nov 2018 18:01:06 -0800
Message-Id: <20181113020113.29640-1-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
Cc:     corbet@lwn.net, Palmer Dabbelt <palmer@sifive.com>,
        aou@eecs.berkeley.edu, ren_guo@c-sky.com,
        andrea.parri@amarulasolutions.com, Arnd Bergmann <arnd@arndb.de>,
        jhogan@kernel.org, dhowells@redhat.com, jcmvbkbc@gmail.com,
        keescook@chromium.org, yamada.masahiro@socionext.com,
        mathieu.desnoyers@efficios.com, mingo@kernel.org,
        rmk+kernel@armlinux.org.uk, Will Deacon <will.deacon@arm.com>,
        jglisse@redhat.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        david.abdurachmanov@gmail.com
From:   Palmer Dabbelt <palmer@sifive.com>
To:     linux-kernel@vger.kernel.org
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I didn't even know this existed until David submitted a patch set that
included updates to the documentation as a result of some features he
added to RISC-V.  It looks like there may be a handful of other people
who don't know this exists either, so I figured I'd just mail out a
patch set containing all the updates split out as well as I can.

This smells like something that sholud be automatic, so if I'm jumping
the gun here then feel free to drop this.  If nobody says anything then
I guess I'll submit this as a separate PR to Linus from my personal
tree, as it's not really a RISC-V thing but it seems like it's worth
having docs that match the code where it's trivial -- I assume that's
what this does, I didn't actually read anything but the diff because I
never trust documentation to be up to date...

I feel compelled to say something like "maybe this should be part of
checkpatch?", but I'm definately not looking to learn perl :)


