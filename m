Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EC8CC7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Mon, 30 Sep 2019 15:58:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731459AbfI3P6i (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 30 Sep 2019 11:58:38 -0400
Received: from mail-pg1-f172.google.com ([209.85.215.172]:33296 "EHLO
        mail-pg1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727767AbfI3P6i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Sep 2019 11:58:38 -0400
Received: by mail-pg1-f172.google.com with SMTP id i30so7659339pgl.0
        for <linux-doc@vger.kernel.org>; Mon, 30 Sep 2019 08:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=3RL4o8bRPImudw7CQvzcT+YBXMyJ+AlSz5qfi3PPCys=;
        b=ivnpetFB+oHMwDuH+cVtA7L0bMQ+eRBWGiVUEddWoXkaoellSDumRcok80srZdH9NZ
         EqI67Ixxhq7ScRNphq0svN6Ec7SQ7vyg9WC3vaIX8m1w7F5XK2vy82zC8xIXYnP+YTTv
         gNttseLWwSKInpr2Rn9KMWMga+NBJIiGneAFstX11DmezjmfI5Q3vk1IOlO+i4wiPeJF
         83dnmMJNG5FB5s0aohupM1kI/fKpCCbn5G3RzrctSlKs+YAOXxB6hCjtYCMwrzrGTpaC
         BAr9LamveWw1ARpzvnEYXnibezIaug7Mk6jVPu2751G0Ob5DjxHnr2m6ZFuJtk38ISlk
         7x+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=3RL4o8bRPImudw7CQvzcT+YBXMyJ+AlSz5qfi3PPCys=;
        b=gB5lcKYoh5lc4ftX0HL1On0czW5fSZYzbPf9BX8XUHshnJyHBOee/zzfX8DK3VJess
         6ex8Lqp1T5K5zas8bvr404jJb0OSmIcu+bAiox8EZuG3Q6byoq4Yels9H4dUGW+fZKKd
         +u4BjUg90S4bVqN22P+SqLB+7GZOh4KAYXrdwwF2bPdLbVXotSUe1v+faWjcITFdMN2L
         A5sgwnbuHNM/Gzs6yv+QbFwS3hK3dNgsWY+00cWNHNIY1rDZ1RleizruVe87VFYAydBK
         q/MQHzsT/HCVzN+aQv4SQwL0mgZds+8yOpjqsKEorpVOBhf9B1ZJCv5hDPBTLAq36Bq7
         arFA==
X-Gm-Message-State: APjAAAW2//MhLHohJ3981J5apaLAe2ZnvCn3FSOAuoDFq8r04M65tx6l
        jjn/C4KR4+pI1cNQ05JaNn85ZTTJ/mE=
X-Google-Smtp-Source: APXvYqyJkaHGc1Ln5lK86D6UNjkvnamYQ7pLTH56ITa9th6reV9+bt4sx+7+p8h3MrR9yTB/3WGh3w==
X-Received: by 2002:a17:90a:3748:: with SMTP id u66mr27511998pjb.4.1569859117434;
        Mon, 30 Sep 2019 08:58:37 -0700 (PDT)
Received: from Slackware ([103.231.91.38])
        by smtp.gmail.com with ESMTPSA id l22sm2758387pgj.4.2019.09.30.08.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 08:58:36 -0700 (PDT)
Date:   Mon, 30 Sep 2019 21:28:26 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-doc@vger.kernel.org
Subject: Why no section for "Kernel/Linux Documentation" here :
 https://patchwork.kernel.org/
Message-ID: <20190930155826.GC27688@Slackware>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/e2eDi0V/xtL+Mc8"
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--/e2eDi0V/xtL+Mc8
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

 Hi Randy/Jon,

 Why that page missing a section "Kernel Documentation" ?? OR am I
 missing the title there....not sure...there must be some reason.

 Thanks,
 Bhaskar

--/e2eDi0V/xtL+Mc8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl2SJhwACgkQsjqdtxFL
KRUHNQf/agYCVg+d4b/PZ44K2nJxJP+Br9nWZTkpS0Ap1NB6Jfq4oZ6sqJvwuHes
Cis09V0QE+3xvCcOWQPgZMonswbKFBF5r2d/M6MuowySzNMQIkcAi7p9w2XOaXDM
Cr0SkvOZaPlPyRTmnohc3MMbrXXOPD1bQDrKWwqG1D/HGI3BRzi4KH0nE2dEy++Z
p/2o4828FLILFkaVR46NMWq4LtzBKKtJZz9GcDwz8MjLDPZbSLr+dMQ6xt0VTtQ4
Kmu68n1eKfSKw+IFQFoIQoSDUCBaHkx6VN+yurROoByp8Cf5MrIb8elxvWY4Kcjh
ksbxnzmU+QGrVLFBsryNFMLjlukR2A==
=YNBV
-----END PGP SIGNATURE-----

--/e2eDi0V/xtL+Mc8--
