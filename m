Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_TVD_MIME_EPI autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EF8E47E22E
	for <lwn-linux-doc@archive.lwn.net>; Fri, 13 Apr 2018 16:50:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751789AbeDMQuD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 13 Apr 2018 12:50:03 -0400
Received: from sauhun.de ([88.99.104.3]:48898 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751775AbeDMQuC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 13 Apr 2018 12:50:02 -0400
Received: from localhost (p54B338AE.dip0.t-ipconnect.de [84.179.56.174])
        by pokefinder.org (Postfix) with ESMTPSA id BE7CA2FDF3C;
        Fri, 13 Apr 2018 18:50:00 +0200 (CEST)
Date:   Fri, 13 Apr 2018 18:50:00 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Sam Hansen <hansens@google.com>
Cc:     linux-i2c@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] Documentation/i2c: adopt kernel commenting style
 in examples
Message-ID: <20180413165000.2svg2j5ozdd2egbd@ninjato>
References: <CAP9bUy7rONNHYeRkYtaWHcfqoZcGKXJz-JocED26zBj9n+-ZbQ@mail.gmail.com>
 <20180413164405.127522-1-hansens@google.com>
 <20180413164405.127522-3-hansens@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pttm4h4pxs432wix"
Content-Disposition: inline
In-Reply-To: <20180413164405.127522-3-hansens@google.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--pttm4h4pxs432wix
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> -  int adapter_nr = 2; /* probably dynamically determined */

Such comments are actually OK.

> -    /* ERROR HANDLING; you can check errno to see what went wrong */

Such as well.

> -  /* Using I2C Write, equivalent of
> -     i2c_smbus_write_word_data(file, reg, 0x6543) */
> +  /*
> +   * Using I2C Write, equivalent of
> +   * i2c_smbus_write_word_data(file, reg, 0x6543).
> +   */

This is the only broken one AFAICT.


--pttm4h4pxs432wix
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlrQ37QACgkQFA3kzBSg
Kbb8phAAlunAC0S+3NuaC4xXkaJGt/5gM4CKXPpL7LyauKyz5J4MD1fPAYDgLwBM
VWFbr9/MRB57unWdYw5/0qCKq/X+R8wPm+05cP7V1hSxUk2aTexKjPDRAfsA0rH4
1/wygiCybrBKXf5Bcado2jTxPYhRBNarLlhiAPsvGIyYqY0cf8Y2CZsAony9fssa
trCLbaljHWm2EEiZVIp5Uvt5nOJ5dSkNppA+dv1Uxx74Lo9/3Blj6GvSYqtJkwek
qNqCTIcLw7QuDVb2qPlGpJ1wxpaXt9HPQsJu2RIuY31qIC2NbIw6HPDYJm7cLGul
X9rhSZZFX3MjI2pulkQ23ofEY7OfHCVZ/g0JkPAl3AgEMnRejc0DDfkL4cqp7D/y
QKICf/jMW52mvfDqtFahAQCezgXxrB9j19Bw9RRVyJmGJudvP3J4GJZes6If1BSc
NJL6ya8p0vqgToRwQPBdYKMrX3HM0hkrpzjV4UX02YhrArInHDb0DR0cd4+2dRHI
9P0ZwYqQ8HhqAFek9VrsLPbroaoJ6Ff3et6gIddObCzHEHhtAVJ46UIlIhzWNvGC
Q336caSDFht0+IXuFZ9RUom0DMMzoKXA6KfydsHTigAJzm4dExXz/HaF4nRWgS0/
vMO8q+5hhGo/XIB183F2zzgj0YYnnB1yQGhmFY8Es8phD802xMo=
=HnGa
-----END PGP SIGNATURE-----

--pttm4h4pxs432wix--
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
