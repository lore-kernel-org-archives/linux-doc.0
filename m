Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 01DDB7D08A
	for <lwn-linux-doc@archive.lwn.net>; Mon, 26 Nov 2018 19:33:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbeK0G3F (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 27 Nov 2018 01:29:05 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:39407 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbeK0G3E (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Nov 2018 01:29:04 -0500
Received: by mail-ed1-f66.google.com with SMTP id b14so16887692edt.6
        for <linux-doc@vger.kernel.org>; Mon, 26 Nov 2018 11:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Dhq9Wa8DxbKUhiU3QROo0wkZHkmKjBUi00KD1NSMmPk=;
        b=G25Upoqn4I+nd6KSceXUZR0X78iS6lZYv0F3w2AkkgAFyhD89slHzkaZ/ZPwbabHNB
         b3/Kw9J+ULBjPi+0AjRUADCicJbfgYqq4sLScOZPRswXRKE8IGmf9cf7Bg/LJ/T7fqh9
         FmWx/PYqXKAFbjO5u8x1ET4jb7gES2AWiUcto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Dhq9Wa8DxbKUhiU3QROo0wkZHkmKjBUi00KD1NSMmPk=;
        b=FHD8D1fomRZ9qcL1/4EaD6GAAqHO2YYLD3qcLcYgdrMAmj3OKmtspbfF82KRWJe8Wg
         6I4DjlO3K7TRqxOHkYjSOQ7+6FipFA4kF2CkCiKG9ANyUcReKRKGnfMHdFaPFf6ZHLyf
         slbhCresvSGr278ZAJhtsDT2Sl+ktaf8u3XuvPUyvQkUvXrPiRu0vqmwNdRujGed5UoV
         H+KotJ3+sZrSCFb33/qGrB7EDF3Nqo5CnSSZg/Ut8ZRtmJJYMn0MmpwI822m33kOfnal
         vidKa6sMBLOGh3rO8KA6C4+gkqoImvWURzmLH2WP+1TGuvmh9WlIwHDQ7F58MWj0TLxY
         Kigg==
X-Gm-Message-State: AGRZ1gIi8YwFb3sHKpR14vd4bUxxXzhrKDPlU7khwGwFuFOrLII9Naq9
        AiVxuMAzLFRMUOyljIDpKKdZmA==
X-Google-Smtp-Source: AJdET5e4BWNgwf3TBLNR4UD0ZZ+n4uZlMfVufKIcoINYntE/DqhpmDzpKwxMvV4YdFymNxt8ESg+NQ==
X-Received: by 2002:a17:906:32c6:: with SMTP id k6-v6mr21360129ejk.48.1543260835516;
        Mon, 26 Nov 2018 11:33:55 -0800 (PST)
Received: from andrea (dynamic-2a00-1028-8386-da8a-eacb-c188-78b9-634c.ipv6.broadband.iol.cz. [2a00:1028:8386:da8a:eacb:c188:78b9:634c])
        by smtp.gmail.com with ESMTPSA id w10sm384955eda.77.2018.11.26.11.33.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Nov 2018 11:33:54 -0800 (PST)
Date:   Mon, 26 Nov 2018 20:33:49 +0100
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     Will Deacon <will.deacon@arm.com>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Laight <David.Laight@ACULAB.COM>,
        Alan Stern <stern@rowland.harvard.edu>,
        Peter Zijlstra <peterz@infradead.org>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] docs/memory-barriers.txt: Enforce heavy ordering for
 port I/O accesses
Message-ID: <20181126193349.GA3509@andrea>
References: <1543251134-29867-1-git-send-email-will.deacon@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1543251134-29867-1-git-send-email-will.deacon@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 26, 2018 at 04:52:14PM +0000, Will Deacon wrote:
> David Laight explains:
> 
>   | A long time ago there was a document from Intel that said that
>   | inb/outb weren't necessarily synchronised wrt memory accesses.
>   | (Might be P-pro era). However no processors actually behaved that
>   | way and more recent docs say that inb/outb are fully ordered.

No intention to diminish David Laight's authority of course, but I would
have really appreciated a reference to these "recent docs" (section, pg.
or the like, especially if a reference manual...) here...


> 
> This also reflects the situation on other architectures, the the port
> accessor macros tend to be implemented in terms of readX/writeX.
> 
> Update Documentation/memory-barriers.txt to reflect reality.

..., IOW, what do you mean by "reality"?

> 
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: David Laight <David.Laight@ACULAB.COM>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
> Signed-off-by: Will Deacon <will.deacon@arm.com>

Please Cc me on future patches to memory-barriers.txt (can not speak for
my co-maintainers, but I'm inclined to say that get_maintainers.pl knows
better...).

  Andrea


> ---
> 
> Just remembered I had this patch kicking around in my tree...
> 
>  Documentation/memory-barriers.txt | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/memory-barriers.txt b/Documentation/memory-barriers.txt
> index c1d913944ad8..0c34c5dac138 100644
> --- a/Documentation/memory-barriers.txt
> +++ b/Documentation/memory-barriers.txt
> @@ -2619,10 +2619,8 @@ functions:
>       intermediary bridges (such as the PCI host bridge) may not fully honour
>       that.
>  
> -     They are guaranteed to be fully ordered with respect to each other.
> -
> -     They are not guaranteed to be fully ordered with respect to other types of
> -     memory and I/O operation.
> +     They are guaranteed to be fully ordered with respect to each other and
> +     also with respect to other types of memory and I/O operation.
>  
>   (*) readX(), writeX():
>  
> -- 
> 2.1.4
> 
