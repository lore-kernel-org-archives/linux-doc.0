Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D56EF7D982
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Aug 2019 16:58:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbfHTQ6a (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Aug 2019 12:58:30 -0400
Received: from mail-ed1-f99.google.com ([209.85.208.99]:40866 "EHLO
        mail-ed1-f99.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730088AbfHTQ6a (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Aug 2019 12:58:30 -0400
Received: by mail-ed1-f99.google.com with SMTP id h8so7122460edv.7
        for <linux-doc@vger.kernel.org>; Tue, 20 Aug 2019 09:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ooh6mwKy6a+QGfw+7zbwTx9DfsC355+UrHQNcQkfTs0=;
        b=BhcXerCrnXh4oBs5RY9tU4cITmzxhF/rNKDpiDxyNrMtcrR6TRGK0h3I6ZaqOyl9qb
         O6kOQJuoFwiU2DudUk3KVwncDFcg8k7h15PYCHqFBUMpOBbTKakiLXJMV3PmkEgH0web
         Hg0vUTsviOMggJBqccXW09rrUtWhrABmtu4Xp8SsBWoRR4llAFQL59o0eqMEbqTfyr7C
         AnYpHIvRyyoVMIX9MvtP9fDayQX4lNCDTPDDZr/vnX4f257pt8Dc+aSCMrmauQ8ukcxA
         WhoYEe+To4GRiCbWDMc2DhfQ09tDIrM7IVVBaClwlNmYoNJLcH1qTYu9VQvys0JTxvgr
         wdQw==
X-Gm-Message-State: APjAAAUohfoxdwa2ImlgBfiGkISG7YNf4zuCp43wmLDlDEJUY7Tv+IrM
        /8jq7KyV9FkJWzg9H1Or3NEf2XUZBGT8P8NB24dKAz7dG5oOCtNPK+bSKOQ18CaMvg==
X-Google-Smtp-Source: APXvYqyXYDITnerApjnV3yhEXbC8CsmwtSNn7YEC7TwQ4jD0UiOEEoErm4RuMvwy8jf2prlgJYaGQRrquonj
X-Received: by 2002:a17:906:4d19:: with SMTP id r25mr26660999eju.125.1566320308261;
        Tue, 20 Aug 2019 09:58:28 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk. [2a01:7e01::f03c:91ff:fed4:a3b6])
        by smtp-relay.gmail.com with ESMTPS id u11sm303737edq.8.2019.08.20.09.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2019 09:58:28 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1i07Sl-0002xT-Q6; Tue, 20 Aug 2019 16:58:27 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id BB8642742ABD; Tue, 20 Aug 2019 17:58:26 +0100 (BST)
Date:   Tue, 20 Aug 2019 17:58:26 +0100
From:   Mark Brown <broonie@kernel.org>
To:     John Garry <john.garry@huawei.com>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
        "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
        "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
        "richard@nod.at" <richard@nod.at>,
        wanghuiqiang <wanghuiqiang@huawei.com>
Subject: Re: [PATCH] docs: mtd: Update spi nor reference driver
Message-ID: <20190820165826.GF4738@sirena.co.uk>
References: <1565107583-68506-1-git-send-email-john.garry@huawei.com>
 <6c4bb892-6cf5-af46-3ace-b333fd47ef14@huawei.com>
 <9b074db7-b95d-a081-2fba-7b2b82997332@kontron.de>
 <ab2d3c29-982f-cb13-e2a2-e6d8da8f1438@huawei.com>
 <b2a475eb-58e6-e7c7-7b8f-b1be04cf27c0@ti.com>
 <c5e063e8-5025-8206-f819-6ce5228ef0fb@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NGIwU0kFl1Z1A3An"
Content-Disposition: inline
In-Reply-To: <c5e063e8-5025-8206-f819-6ce5228ef0fb@huawei.com>
X-Cookie: It's the thought, if any, that counts!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--NGIwU0kFl1Z1A3An
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 20, 2019 at 03:09:15PM +0100, John Garry wrote:
> On 19/08/2019 05:39, Vignesh Raghavendra wrote:
> > On 16/08/19 3:50 PM, John Garry wrote:

> > > About the child spi flash devices, is the recommendation to just use
> > > PRP0001 HID and "jedec,spi-nor" compatible?

> > I am not quite familiar with ACPI systems, but child flash device should
> > use "jedec,spi-nor" as compatible.

> Right, so to use SPI MEM framework, it looks like I will have to use PRP0001
> and "jedec,spi-nor" as compatible.

> My reluctance in using PRP0001 and compatible "jedec,spi-nor" is how other
> OS can understand this.

Last I heard Windows wasn't doing anything with PRP0001 but on the other
hand the idiomatic way to handle this for ACPI is as far as I can tell
to have what is essentially a board file loaded based on DMI information
without any real enumerability so there's no real conflict between the
two methods.

--NGIwU0kFl1Z1A3An
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1cJrEACgkQJNaLcl1U
h9CKegf/diFxbL9O/cQMcq2uRUNMNl4gLgGHjuKME4Zo+1sQkFrJNR27rNlGsAh2
mulo2giJlmEzVN1m+nQouojKPegOQjt42Oj8UDF1XOg9LKisfrXp4JMQ7mmQ2Joh
B37OCYGAZPzjJk6MpPwRGUD94v/BE9H6Ma5cqdL+HKTx4dIgMMdvszTG7gwsGDoP
S+BjjyCx/Y/qByOr0w4VxAuMYo/D43tfzvIgcE1YnhPtnkPBIDx7qUa0gWEWVqjF
q8AqdEPcJyLL3Wu+8OBPFdFRWlbjXtLwoCXy+nsC9285sqc8uF+ppJ9UyFP3FgFW
J5/itNaPyZUXNmFPziim/nbgI43BTQ==
=Hh41
-----END PGP SIGNATURE-----

--NGIwU0kFl1Z1A3An--
