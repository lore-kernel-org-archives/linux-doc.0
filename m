Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1431D7D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 14 Jan 2019 16:56:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbfANQ42 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 14 Jan 2019 11:56:28 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45294 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726767AbfANQ42 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Jan 2019 11:56:28 -0500
Received: by mail-pg1-f194.google.com with SMTP id y4so9689476pgc.12
        for <linux-doc@vger.kernel.org>; Mon, 14 Jan 2019 08:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Vkwq3id0aiSy/vb74DJe2hbNKxSIPAis3Qrod7DHZQ0=;
        b=lyYVrL/nMjGWRQq1IqKhH+RRcKq8y5UvOTovpShB7RyKJ1o/hirWuzf8BxwnhT2zQi
         7EyWO35lPb4/GgfXYa/yJHyQDnI9LlTtuHqAX1q5Xo+dDw4wKCVV3l89VW0+fgdWeC87
         6DRFrxDXOTg3rFvzzhSygiBSR8tgjQVt/GW4EduO1mZHoIXgx1SnBx/p0v97Oj26ELtZ
         TppihwXBI01kMHpDzE1ktz9G3+HttV+YO6jb2/5zUMy37cezMu6tjL5GdOfx6FERFZjt
         lw0S/adX13551B41ywIVH5MeG+0qJ9tmpLmROCbBUm6GsJeUK7t5jMx8UvzrQ2fysNVX
         B4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Vkwq3id0aiSy/vb74DJe2hbNKxSIPAis3Qrod7DHZQ0=;
        b=jiNDlN742e0aIr7rBzwpIyyqvT8pEG8uGRjqyLRnBnrzJ2jH4cUmpLIvVkwHDA12p4
         XOq4D58Jt4lI96IibS4aqcXdE7nxOapQN7tQD8B06ngBM9bi0yftlCZL9HGHybCVf9TV
         ReOo2kwflnmxsPjWfPMG7Lvy5njBp15HH1G22cezfyT/eaUPIO4P5wCd9Lc7Y9MATjeL
         7Jpq08og+zH4AvA1a/8qK7BwRFWmQFrf2ljZG4J20HtoYHNsPltO8TQpMS6sACIK6+a1
         rOwKbFqxDfonwvFHxu4ZBjKhZpFL1gtzFOXOSH/aN+U146u5orjuJv9sl7vFXJ6BoKkI
         aXZg==
X-Gm-Message-State: AJcUukdwDTF4DaNiSZ8qhMIuoOoVKkKrHjzWoyrhjxdvKfeuZiA2xXQA
        s1Tk8N3AkrXuLrCtBzuHuAuFbg==
X-Google-Smtp-Source: ALg8bN6+3wKpyeAAmIcTMEhwbnGD9psTt39TSnaZ/LOOmkvbnlvqFowv2nBJwQX7Ju+E/MtwyQzljw==
X-Received: by 2002:a62:7792:: with SMTP id s140mr26138218pfc.26.1547484987383;
        Mon, 14 Jan 2019 08:56:27 -0800 (PST)
Received: from ziepe.ca (S010614cc2056d97f.ed.shawcable.net. [174.3.196.123])
        by smtp.gmail.com with ESMTPSA id x186sm2147168pfb.59.2019.01.14.08.56.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jan 2019 08:56:22 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1gj5XB-0006jE-Q4; Mon, 14 Jan 2019 09:56:21 -0700
Date:   Mon, 14 Jan 2019 09:56:21 -0700
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Joel Nider <joeln@il.ibm.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Leon Romanovsky <leon@kernel.org>,
        Doug Ledford <dledford@redhat.com>,
        Mike Rapoport <rppt@linux.ibm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] docs-rst: infiniband: Convert user verbs doc to rst
Message-ID: <20190114165621.GD22910@ziepe.ca>
References: <1547456451-7102-1-git-send-email-joeln@il.ibm.com>
 <1547456451-7102-2-git-send-email-joeln@il.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1547456451-7102-2-git-send-email-joeln@il.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 14, 2019 at 11:00:49AM +0200, Joel Nider wrote:
> Replace the existing Documentation/infiniband/user_verbs.txt with
> Documentation/infiniband/user_verbs.rst. No substantial changes to
> the content - just some minor reformatting to have the rendering
> come out nicely.
> This is in preparation for updating the content in a subsequent
> patch.
> 
> Signed-off-by: Joel Nider <joeln@il.ibm.com>
> ---
>  Documentation/infiniband/user_verbs.rst | 70 +++++++++++++++++++++++++++++++++
>  Documentation/infiniband/user_verbs.txt | 69 --------------------------------
>  2 files changed, 70 insertions(+), 69 deletions(-)
>  create mode 100644 Documentation/infiniband/user_verbs.rst
>  delete mode 100644 Documentation/infiniband/user_verbs.txt

Thanks for getting this going Joe, I've been mulling over writing more
docs for this area for a while now.

Jonathan/linux-doc: Can you Ack at least the build system parts of
this please? I can take it through the rdma tree, unless you prefer
otherwise?

Cheers,
Jason
