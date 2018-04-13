Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_TVD_MIME_EPI autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8A0EB7E22E
	for <lwn-linux-doc@archive.lwn.net>; Fri, 13 Apr 2018 16:50:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752669AbeDMQuZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 13 Apr 2018 12:50:25 -0400
Received: from sauhun.de ([88.99.104.3]:48912 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752235AbeDMQuZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 13 Apr 2018 12:50:25 -0400
Received: from localhost (p54B338AE.dip0.t-ipconnect.de [84.179.56.174])
        by pokefinder.org (Postfix) with ESMTPSA id A8B9F2FDF3C;
        Fri, 13 Apr 2018 18:50:23 +0200 (CEST)
Date:   Fri, 13 Apr 2018 18:50:23 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Sam Hansen <hansens@google.com>
Cc:     linux-i2c@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] Documentation/i2c: whitespace cleanup
Message-ID: <20180413165023.mcgqrpk2lm7ftjoe@ninjato>
References: <CAP9bUy7rONNHYeRkYtaWHcfqoZcGKXJz-JocED26zBj9n+-ZbQ@mail.gmail.com>
 <20180413164405.127522-1-hansens@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7rv7xuuz5mixqzw3"
Content-Disposition: inline
In-Reply-To: <20180413164405.127522-1-hansens@google.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--7rv7xuuz5mixqzw3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 13, 2018 at 09:44:03AM -0700, Sam Hansen wrote:
> This strips trailing whitespace in Documentation/i2c/dev-interface.
>=20
> Signed-off-by: Sam Hansen <hansens@google.com>

Looks good to me. But please send new series as seperate threads.


--7rv7xuuz5mixqzw3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlrQ388ACgkQFA3kzBSg
KbZ8AQ//UgA2+3uOk/wwPpgY4WI2HMZu7uFngK9ysyyM2LzPdMao1TfeRwEh71aR
iKszVNNl1yYeOSMDqL5uWxkc6M3lMfVZseC1JzkAT4JLD8CHtwGYU+LUpG2MpYPC
T+XrHMeApw7NacCA+PIX3roagdqfbEHdA+gFaNKwKOoSvtEZcgq4OfbcJfdeHnJ6
tM+AYG8DfaAZH++P2w5QNZrDoja8P7aiJNZS1zLaFmjOLFz9yrs3dZWZtdjYRSVV
Pjp+55Cb7cajgzmH72hUosoOoK+kqZyq4xm44fXtjxUZ8ukihychDPIgLdKMei2t
G2jknEgeKez93ms87DD3oEgLBe2unU+UKZCgLlIBz5xFMROfPWyoTA5p7BNcJhmQ
3cpuU2gTFTcmnSfkY0p+d3iPQ353yg+otXpARtyQo0HWYdXuwLop7MwIOILxZTw4
6cyPUw7okyFr+d1BsIrPpRyaqoe6/ImQmqok6MoutUgBz5MCK/6752JqmJtfRN9y
+OwpLzVA3Z7WZgoocnhvFgkzdHbefBCnhQ+L2w2uiZZ16w2T6u2A/8lKOM8SbPy9
IkFYFN57XjwcFc+Iz5NLhR6MqErPMSj4233YpvbCjuGBzzaDkpL0SoCd/w41XNWH
9AIqkNeHLiZexm762tiqLE/hhzDS7wpzqN0xksegqCbUKhdSQcA=
=lTtR
-----END PGP SIGNATURE-----

--7rv7xuuz5mixqzw3--
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
