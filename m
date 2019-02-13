Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D28AF7D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed, 13 Feb 2019 17:11:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732309AbfBMRLt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 13 Feb 2019 12:11:49 -0500
Received: from newman.cs.utexas.edu ([128.83.139.110]:34279 "EHLO
        newman.cs.utexas.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729760AbfBMRLs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Feb 2019 12:11:48 -0500
X-Greylist: delayed 312 seconds by postgrey-1.27 at vger.kernel.org; Wed, 13 Feb 2019 12:11:47 EST
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
        (authenticated bits=0)
        by newman.cs.utexas.edu (8.14.4/8.14.4/Debian-4.1ubuntu1.1) with ESMTP id x1DH6XfJ012475
        (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 13 Feb 2019 11:06:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cs.utexas.edu;
        s=default; t=1550077594;
        bh=1QlJIQtxfwERiZJ9qKHWBnmsxzTVuktds1zC4B3Ikbw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hB+AZ69uLzElebAz33e+QGcOZ6tyD4xnbZisydJYv2Md+gK/m52P8FmhKjrL4BCSb
         gK/D4fTDMViZA0DOYnMvhs581b6XTyxvRxfN4TmozCKZGzigG1gQ9khdraE0D4oihj
         yBE9DS+h15NftAcz7TXhJLfC2mgqX5B90nzHysPw=
Received: by mail-ua1-f54.google.com with SMTP id s15so1020105uap.6;
        Wed, 13 Feb 2019 09:06:33 -0800 (PST)
X-Gm-Message-State: AHQUAua8UPQJc4TUmJRZbMZUNi/X/wd7YVFMp/PSRdfPhffKBHHhfcuq
        NEw1ZmKNQ/DEkQHTAFPYQUwndWbc7B3T70cUl2g=
X-Google-Smtp-Source: AHgI3IZ9gpJ+Cu7Ep/pik8G8wTdvsH8LZfvSTy6yttAx2xTkOV9mEzIUZJfItn76mTkE8OoPrqphfk8VK1y/OmogGxI=
X-Received: by 2002:ab0:3259:: with SMTP id r25mr592923uan.108.1550077593352;
 Wed, 13 Feb 2019 09:06:33 -0800 (PST)
MIME-Version: 1.0
References: <CA+EzBbDyoPF8=mZyG8HQAoHTm4h4MSCe=5WX_SBqRwPej=4uFg@mail.gmail.com>
 <CAOQ4uxh7OayzbGFk0cxoZf_t9jGxesv9k6zPPOA=+5MDsqWOzA@mail.gmail.com>
In-Reply-To: <CAOQ4uxh7OayzbGFk0cxoZf_t9jGxesv9k6zPPOA=+5MDsqWOzA@mail.gmail.com>
From:   Jayashree Mohan <jaya@cs.utexas.edu>
Date:   Wed, 13 Feb 2019 11:06:23 -0600
X-Gmail-Original-Message-ID: <CA+EzBbC5c-O0ZBuC+UaL7Ftp2Vh8K8d46_6HTBWetY2Otd=tiA@mail.gmail.com>
Message-ID: <CA+EzBbC5c-O0ZBuC+UaL7Ftp2Vh8K8d46_6HTBWetY2Otd=tiA@mail.gmail.com>
Subject: Re: Documenting the crash consistency guarantees of file systems
To:     Amir Goldstein <amir73il@gmail.com>
Cc:     fstests <fstests@vger.kernel.org>, "Theodore Ts'o" <tytso@mit.edu>,
        Filipe Manana <fdmanana@gmail.com>,
        Dave Chinner <david@fromorbit.com>, Chris Mason <clm@fb.com>,
        Vijaychidambaram Velayudhan Pillai <vijay@cs.utexas.edu>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.3.9 (newman.cs.utexas.edu [128.83.139.110]); Wed, 13 Feb 2019 11:06:34 -0600 (CST)
X-Virus-Scanned: clamav-milter 0.98.7 at newman
X-Virus-Status: Clean
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Amir!

Thanks for putting across your thoughts on this. Your suggestions
definitely make sense, and we'll compile these information and submit
a patch for review.

When it comes to strictly ordered metadata consistency, to the best of
our knowledge only xfs claims to provide it explicitly. In ext4,
delayed allocation and fsync of a file not persisting all its hard
links[1] are examples of violation to the strictly ordered metadata
consistency right? And for btrfs, they don't seem to explicit about
providing such semantics. Look at this thread[2] for example, owing to
the lack of specification, btrfs does not commit to providing such
guarantees.

Thanks,
Jayashree

[1] https://www.spinics.net/lists/linux-btrfs/msg77340.html
[2] https://www.spinics.net/lists/linux-btrfs/msg76957.html
