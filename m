Return-Path: <SRS0=+qdo=6T=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 264F9C47247
	for <linux-doc@archiver.kernel.org>; Tue,  5 May 2020 08:30:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38CF920658
	for <linux-doc@archiver.kernel.org>; Tue,  5 May 2020 08:30:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RuJhzyd6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726337AbgEEIaw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 5 May 2020 04:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725766AbgEEIaw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 May 2020 04:30:52 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63F3BC061A0F
        for <linux-doc@vger.kernel.org>; Tue,  5 May 2020 01:30:52 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id u22so489406plq.12
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2020 01:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gJpvT8Yv8rJeWYR6IwTHdWSarIN2Fqq4ejjwjIaJi8c=;
        b=RuJhzyd6mY5VIGmGdlMkOFKWokHDM8zf6eKM5jHoONgKCLpkM3nC8/YPclfKna3Jn4
         MzlVCJPensBsng5EgX+O6qqGIglrzoiYa16d0iMj4kuBhxudJstqRO62dMcdfD0iYAtz
         YbjUhJ5qXS8aqcOTnda7m7TJIIU1NRQPz8ma+OV7aP0GjxmVlMEzd3V7RaLB5ufiic/J
         9lZBdBoE8noXfAqCb097nOq1FWrLaUNUKbaRQghAqYuRTs/MytJXGATb+VkPd8Q4Pytk
         E0u/r3ID3ZkMMEoVtXUNVzdba1IsDWfg2TMtcpgTvrujcDbAwCA86vta22iAfXxoJ9l3
         6FPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gJpvT8Yv8rJeWYR6IwTHdWSarIN2Fqq4ejjwjIaJi8c=;
        b=hddO6hbyDNBY2FIOESbroym7ARutNIQ3QqYxT36B8wTm+SPuN+QyhwJTp9z6hV4h36
         zluojIOCL24+BpIgIWrvrZ5b8z/rUbB2EwBHN4BFG9m1xZYRQyCWEiw3pwqqsmlxCqRd
         iKZH3fzRRzPdAKmayCRb7ej6aYBsn9vEkHuZ7vq2wV58SwLo9kgXmSdL1WxMBd4ykrD8
         7wWKYGIqaJLh1uJu1XJrbjgeqUnR8PMy4wnmeRHYvDX3UB+0yR2ScoVPTZCYxano2cBD
         rut1am5HQ0s4n65Vnp1Y22+LlckF++qAtVyhhmGAJIpPiL9zi8FmzBikznCAY0l7LNvC
         wsDg==
X-Gm-Message-State: AGi0Pua0n8/uzj0nuw1MjUmwPU56DWDks42Mogjt/fInus7LU1POh9Gm
        9Zk2pzzcNYe4ZJTN/MVBRSoUS8es
X-Google-Smtp-Source: APiQypLrZYnQKsl+WYsDHZbjzUSQpAs1S9gmL8NjEUVTB6yBrJ/MWQgd4aYNdrO0sw1IMI2qF0bxlw==
X-Received: by 2002:a17:90a:d78e:: with SMTP id z14mr1699776pju.125.1588667451278;
        Tue, 05 May 2020 01:30:51 -0700 (PDT)
Received: from VoidLinux ([103.231.91.35])
        by smtp.gmail.com with ESMTPSA id z190sm1360023pfb.1.2020.05.05.01.30.47
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 May 2020 01:30:50 -0700 (PDT)
Date:   Tue, 5 May 2020 14:00:38 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     linux-doc@vger.kernel.org
Subject: Re: docs.kernel.org convenience URL
Message-ID: <20200505083038.GA2414@VoidLinux>
References: <20200504230449.zwythgphse4y3v5v@chatter.i7.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline
In-Reply-To: <20200504230449.zwythgphse4y3v5v@chatter.i7.local>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 19:04 Mon 04 May 2020, Konstantin Ryabitsev wrote:
>Hi, all:
>
>I set up a convenience URL for kernel docs:
>
>  docs.kernel.org
>
>Toplevel redirects to https://www.kernel.org/doc/html/latest/, but you=20
>can get a specific version as well:
>
>  docs.kernel.org/5.5
>
>You can also do subpaths:
>
>  docs.kernel.org/admin-guide/index.html
>  docs.kernel.org/5.5/admin-guide/index.html
>
>-K

Cool!!

--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl6xJCcACgkQsjqdtxFL
KRWR+Af8CSXvIyYwXegnPaPALX9TjKVLuPcDTcc2xTIdG83y+LWMHPIRR4uhgnOy
AeCyFOc10ZsbeIES4eLOZsdL1evxVReA4CYYFh2EO7y3dtDUW96ADzB/i043PxSP
uSutyDLihfI11EuboXjsvYzI2oZbJ3fMKqHKE5o9Jo7leklECRI1gEqoKMMXasUb
7QXzqACjHorDmt35OAH8XcrjMGC1hPnr0tII5agfYqfmT4IEMkH+igDqI7KcELmD
m8nh6TJ5qLtJw7bAqBMrY+yL0WCzy0CCp3U7/0x+z+WM0oDTixlCu0EkdkjkbHgA
EhcaRxjgEgNB2MrpkQJUJML8yJrfkQ==
=R1wB
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--
