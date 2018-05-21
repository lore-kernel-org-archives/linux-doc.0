Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_TVD_MIME_EPI autolearn=unavailable
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 258C17D085
	for <lwn-linux-doc@archive.lwn.net>; Mon, 21 May 2018 20:49:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751526AbeEUUt3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 21 May 2018 16:49:29 -0400
Received: from www.zeus03.de ([194.117.254.33]:38706 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751050AbeEUUt1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 21 May 2018 16:49:27 -0400
Received: (qmail 21987 invoked from network); 21 May 2018 22:49:24 +0200
Received: by mail.zeus03.de with ESMTPSA (ECDHE-RSA-AES256-GCM-SHA384 encrypted, authenticated); 21 May 2018 22:49:24 +0200
X-UD-Smtp-Session: l3s3148p1@4ZDab71sQqAgAwDPW8cyAAId4P/+oMhl
Date:   Mon, 21 May 2018 22:49:24 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
Cc:     corbet@lwn.net, andy.gross@linaro.org, david.brown@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        evgreen@chromium.org, acourbot@chromium.org, swboyd@chromium.org,
        dianders@chromium.org, Sagar Dharia <sdharia@codeaurora.org>,
        Girish Mahadevan <girishm@codeaurora.org>
Subject: Re: [PATCH v5 3/5] i2c: i2c-qcom-geni: Add bus driver for the
 Qualcomm GENI I2C controller
Message-ID: <20180521204924.4ldbke6udjshdz2k@katana>
References: <1521836461-6515-1-git-send-email-kramasub@codeaurora.org>
 <1521836461-6515-4-git-send-email-kramasub@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="g6y5tzxhgcwm5btd"
Content-Disposition: inline
In-Reply-To: <1521836461-6515-4-git-send-email-kramasub@codeaurora.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--g6y5tzxhgcwm5btd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 23, 2018 at 02:20:59PM -0600, Karthikeyan Ramasubramanian wrote:
> This bus driver supports the GENI based i2c hardware controller in the
> Qualcomm SOCs. The Qualcomm Generic Interface (GENI) is a programmable
> module supporting a wide range of serial interfaces including I2C. The
> driver supports FIFO mode and DMA mode of transfer and switches modes
> dynamically depending on the size of the transfer.
>=20
> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
> Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
> Signed-off-by: Girish Mahadevan <girishm@codeaurora.org>

Is one of these people interested in maintaining this driver? Then, an
entry for MAINTAINERS would be needed, too. (Same goes for
drivers/soc/qcom/ IMHO, but this is not my realm, so just saying)

> +static const struct geni_i2c_err_log gi2c_log[] =3D {
> +	[GP_IRQ0] =3D {-EINVAL, "Unknown I2C err GP_IRQ0"},
> +	[NACK] =3D {-ENOTCONN, "NACK: slv unresponsive, check its power/reset-l=
n"},
> +	[GP_IRQ2] =3D {-EINVAL, "Unknown I2C err GP IRQ2"},
> +	[BUS_PROTO] =3D {-EPROTO, "Bus proto err, noisy/unepxected start/stop"},
> +	[ARB_LOST] =3D {-EBUSY, "Bus arbitration lost, clock line undriveable"},
> +	[GP_IRQ5] =3D {-EINVAL, "Unknown I2C err GP IRQ5"},
> +	[GENI_OVERRUN] =3D {-EIO, "Cmd overrun, check GENI cmd-state machine"},
> +	[GENI_ILLEGAL_CMD] =3D {-EILSEQ, "Illegal cmd, check GENI cmd-state mac=
hine"},
> +	[GENI_ABORT_DONE] =3D {-ETIMEDOUT, "Abort after timeout successful"},
> +	[GENI_TIMEOUT] =3D {-ETIMEDOUT, "I2C TXN timed out"},
> +};

Please check Documentation/i2c/fault-codes for better -ERRNO values,
especially for NACK and ARB_LOST.

Rest looks good from a glimpse.

Thanks,

   Wolfram


--g6y5tzxhgcwm5btd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsDMM8ACgkQFA3kzBSg
KbZTAxAAtVdlLzlBafWFZ3jFJN8U2+SgJhML+/z85BIQjZaD1WOKSwTzXd698lx1
+1oeiTn5PUuZFrxA68mHSTuI5keucWZFwgvLmbU/L05jQI77oxWkIrXIVEiwQKR6
74FYcqqpEEgR9hK4v2GDYziHMEovI/3fP2OWpi0Zi7JJIIfolC8TDyL3M1MtoXux
zeyPPwjd+jakFNYcCx6hZ8Da1Id98bdwI7mzGGrCRusp8hKHG4o8mGnf2ll6Sk4K
T+VQ+t87CAvP4lTxEtMmDmZSk3uJHo0HOqgcA2vPbcfrgGzWt1Ve9omS/5KZM2yG
uPSsknq2rqgw8dtikb9AzV9gECJwk/a6WoPhWip27SyurKgA6HpiGMXO9TafWHeD
B1v1/t2LCY2FIwCMu4LdBAUtEngnmUEhExJBfP75RRfcX+x0+UQdul2Yz8spOHzq
fqRHIO+pAn0HJL6dd5xb0FFsRUGqSK3OHNLAaPIFLVdOG5R4mwtW/ewsI+gEz3Vr
Dm27Ze2eumC+ndTTQ+aPzwcZ1+ZbisONu5ctpMiDdxsZ6vwsZOQ5KB3bayzNPO9A
2aoEzRDl1JU1R1FkOWUaT0PvO5NrlOzLkmSspOPg+GojXOPbLTUa7TGjQwhrG/zM
YbNBfWeRNlk69oPLnUndFb4Podgb/vxt7s+A/+xpQOVX5kne8wQ=
=7vPe
-----END PGP SIGNATURE-----

--g6y5tzxhgcwm5btd--
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
