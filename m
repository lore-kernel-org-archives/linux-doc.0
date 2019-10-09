Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BE20A7D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 Oct 2019 11:22:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727657AbfJILWe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 Oct 2019 07:22:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41429 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727219AbfJILWd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Oct 2019 07:22:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570620152;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fSxt4vlw0RrCjrUOMeZ4WTD/1koGsyolXMub27Mf3ik=;
        b=Mokdz7yU/gaINM5NnWdla/6iCwHDCvJYfkwqh2uilSxWr760MU82kkHO/+o4SeAAolx1r7
        T4xdZSqVCLYarSS94xnyAbHUV4auqYNMBQ4osZOy9nftH3DGXEqPbuPtsbJHSzCwa3jjnC
        zPjcwP59npUOJkan2mwzbAWEnqpm/Z0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-M0F2j2i5OFGvD1X16PG-oQ-1; Wed, 09 Oct 2019 07:22:29 -0400
Received: by mail-wr1-f72.google.com with SMTP id f3so949163wrr.23
        for <linux-doc@vger.kernel.org>; Wed, 09 Oct 2019 04:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Eew1CqsB5Kurpo7mgW6HjC4gIkz4FQUu+JSkbHqlln8=;
        b=lH4hHi6fbmp25WE1jJVgYGGtmGBJB+10eI9qs1xCTHMFaxKalSW6L9RTJcSkhpgNOy
         QUBY7235RgHFUvgRz/3LPidA7nrE2oJOAgoWYlaj8HezujKIVXPushgFeblYzuMarVeC
         1f8EFNyv1J49fs2OKlPpqwZjIbWHOW49nf4ghGwQt8oBUuulGuubtnvBKEBMt/cliqNt
         mkmbuRXDZtfpcIE8wkOCvRr4/9+q460hOAMg042nShNYVk/jIjVt0J+3GtGxaPyy8kwd
         aQngRh30blgQWmmLcu2k0cAI6ZPeRSF5LJhM8H0BCxDQCedP4B1mxNntb+MVPZ4TAKF8
         4GEA==
X-Gm-Message-State: APjAAAX/GGsXO8K06gpDGOnb6t3Rp3Xy+cnMYelOMffqxXmisqvoDgVt
        sYlI+xdrC7S9QfsLjOmnFlUs/WGbXF2WBcqgpeTH2FwbXNLDYId1sCdubIRspu7ne6f6akFrzDq
        nop+BZSFsFGJTW5cQbRhT
X-Received: by 2002:a5d:670b:: with SMTP id o11mr134154wru.31.1570620148244;
        Wed, 09 Oct 2019 04:22:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzyDH2yB45oDJuaeMzYuAzPHkv+uoWcEOBdzCqvL0hQ3GLQFyhYxwGywmUes44prwkkxN0yjw==
X-Received: by 2002:a5d:670b:: with SMTP id o11mr134132wru.31.1570620148012;
        Wed, 09 Oct 2019 04:22:28 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id n7sm1839941wrt.59.2019.10.09.04.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 04:22:27 -0700 (PDT)
Date:   Wed, 9 Oct 2019 13:22:25 +0200
From:   Oleksandr Natalenko <oleksandr@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Ingo Molnar <mingo@kernel.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        Quentin Perret <qperret@qperret.net>
Subject: Re: [PATCH] docs: admin-guide: fix printk_ratelimit explanation
Message-ID: <20191009112225.tspuot7sstybqeud@butterfly.localdomain>
References: <20191002114610.5773-1-oleksandr@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191002114610.5773-1-oleksandr@redhat.com>
User-Agent: NeoMutt/20180716
X-MC-Unique: M0F2j2i5OFGvD1X16PG-oQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi.

On Wed, Oct 02, 2019 at 01:46:10PM +0200, Oleksandr Natalenko wrote:
> The printk_ratelimit value accepts seconds, not jiffies (though it is
> converted into jiffies internally). Update documentation to reflect
> this.
>=20
> Also, remove the statement about allowing 1 message in 5 seconds since
> bursts up to 10 messages are allowed by default.
>=20
> Finally, while we are here, mention default value for
> printk_ratelimit_burst too.
>=20
> Signed-off-by: Oleksandr Natalenko <oleksandr@redhat.com>
> ---
>  Documentation/admin-guide/sysctl/kernel.rst | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/=
admin-guide/sysctl/kernel.rst
> index 032c7cd3cede..6e0da29e55f1 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -831,8 +831,8 @@ printk_ratelimit:
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  Some warning messages are rate limited. printk_ratelimit specifies
> -the minimum length of time between these messages (in jiffies), by
> -default we allow one every 5 seconds.
> +the minimum length of time between these messages (in seconds).
> +The default value is 5 seconds.
> =20
>  A value of 0 will disable rate limiting.
> =20
> @@ -845,6 +845,8 @@ seconds, we do allow a burst of messages to pass thro=
ugh.
>  printk_ratelimit_burst specifies the number of messages we can
>  send before ratelimiting kicks in.
> =20
> +The default value is 10 messages.
> +
> =20
>  printk_devkmsg:
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --=20
> 2.23.0
>=20

This is a gentle ping. Please review.

Thanks.

--=20
  Best regards,
    Oleksandr Natalenko (post-factum)
    Senior Software Maintenance Engineer

