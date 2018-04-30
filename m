Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID,T_TVD_MIME_EPI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BD56F7DE79
	for <lwn-linux-doc@archive.lwn.net>; Mon, 30 Apr 2018 09:52:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752501AbeD3JwF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 30 Apr 2018 05:52:05 -0400
Received: from mail-wr0-f195.google.com ([209.85.128.195]:46351 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751513AbeD3JwD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Apr 2018 05:52:03 -0400
Received: by mail-wr0-f195.google.com with SMTP id o2-v6so4535238wrj.13;
        Mon, 30 Apr 2018 02:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wT74rgCsD1mNwP5LYNX6hwgUMiGnfTDE1Mk9TZ12klM=;
        b=GsLv83/WgplR4EEcsrv8+spjgZsrJig4Vn+n8sn6mL6NVEvdDTOkZD0FQchFXQvg4F
         iDg4aOGXOGJqYNbI70LLX4mS1YcwZXZAyv0W5wff1hvhLXZpKAZc3DapatM4bgPnt8tf
         nMSOyPdjCQCylE4IilXCyGmRKPWIPk0uGerVfGc4MWQD1qjT2yNL+T3jGGlc/yFGDdOb
         kdJbe+c9Wr+x45dke46o9XP1s7c1qsRRzIhPnbEVlW5aITDU2TlL9uvSO1KUVR9meMdl
         kTdJzrHqfpcgIWIJbSdsC/hIsFUQ6x9EVLRTgWnkFK/Nqchy2FYLopOSn4dDpskzcJSl
         C8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wT74rgCsD1mNwP5LYNX6hwgUMiGnfTDE1Mk9TZ12klM=;
        b=FXd/rRzdxyRz5doF3bImIyxwhjiE52U1SSdyK0JtC0JGvjuYmbPCxiJDJiI4ykB0Dr
         Uho40mYLISuKhNWOkuia4LhCkuyiGrx6DaRtEKKHkSEKGIiA7O/+MsEGj6Jz+oS7Uh8a
         +0TXYAdEF4Y5ss/OJwUsaI52AUUVyGD3DC/vtNI6vhRS+Ll7oDAaBram5qwVRMMtcr1e
         Z/o9JTT/DW0XMbA/aEfcDBx18CuoGb4jMfWuw607vKB6sjvp8IsH60LLse6k0FCIEfv+
         pKwuLQzwolK8ebPw3tJ8aYzl+/oxC5GnqfFeeh1AwXN3+myJUBEfK4kjOGtePF43k4ve
         tDSg==
X-Gm-Message-State: ALQs6tCYonhR2n3h0ElcuGEzxdezqnMmLk8rZQm26QggqCTh5dgEekG/
        hu3lA7ffi++5j8+TTA1WQl8=
X-Google-Smtp-Source: AB8JxZqjkRatoThS6f8A7TvuGDJlcDG9CSgN+lURYRBO4Kg+67ZVdy+zeVvXa5loHgKNyXq5rTDaMw==
X-Received: by 2002:adf:adf0:: with SMTP id w103-v6mr8860635wrc.101.1525081921346;
        Mon, 30 Apr 2018 02:52:01 -0700 (PDT)
Received: from localhost (p200300E41F041C0032947E635CB49D15.dip0.t-ipconnect.de. [2003:e4:1f04:1c00:3294:7e63:5cb4:9d15])
        by smtp.gmail.com with ESMTPSA id u8sm6897913wmf.3.2018.04.30.02.52.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Apr 2018 02:52:00 -0700 (PDT)
Date:   Mon, 30 Apr 2018 11:51:59 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rajkumar Rampelli <rrajk@nvidia.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com,
        jdelvare@suse.com, linux@roeck-us.net, corbet@lwn.net,
        catalin.marinas@arm.com, will.deacon@arm.com,
        kstewart@linuxfoundation.org, gregkh@linuxfoundation.org,
        pombredanne@nexb.com, mmaddireddy@nvidia.com,
        mperttunen@nvidia.com, arnd@arndb.de, timur@codeaurora.org,
        andy.gross@linaro.org, xuwei5@hisilicon.com, elder@linaro.org,
        heiko@sntech.de, krzk@kernel.org, ard.biesheuvel@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, ldewangan@nvidia.com
Subject: Re: [PATCH V2 1/9] pwm: core: Add support for PWM HW driver with pwm
 capture only
Message-ID: <20180430095159.GD2476@ulmo>
References: <1521607244-29734-1-git-send-email-rrajk@nvidia.com>
 <1521607244-29734-2-git-send-email-rrajk@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+B+y8wtTXqdUj1xM"
Content-Disposition: inline
In-Reply-To: <1521607244-29734-2-git-send-email-rrajk@nvidia.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--+B+y8wtTXqdUj1xM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 21, 2018 at 10:10:36AM +0530, Rajkumar Rampelli wrote:
> Add support for pwm HW driver which has only capture functionality.
> This helps to implement the PWM based Tachometer driver which reads
> the PWM output signals from electronic fans.
>=20
> PWM Tachometer captures the period and duty cycle of the PWM signal
>=20
> Add conditional checks for callabacks enable(), disable(), config()
> to check if they are supported by the client driver or not. Skip these
> callbacks if they are not supported.
>=20
> Signed-off-by: Rajkumar Rampelli <rrajk@nvidia.com>
> ---
>=20
> V2: Added if conditional checks for pwm callbacks since drivers may
>     implements only pwm capture functionality.
>=20
>  drivers/pwm/core.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> index 1581f6a..f70fe68 100644
> --- a/drivers/pwm/core.c
> +++ b/drivers/pwm/core.c
> @@ -246,6 +246,10 @@ static bool pwm_ops_check(const struct pwm_ops *ops)
>  	if (ops->apply)
>  		return true;
> =20
> +	/* driver supports capture operation */
> +	if (ops->capture)
> +		return true;
> +
>  	return false;
>  }
> =20
> @@ -495,7 +499,8 @@ int pwm_apply_state(struct pwm_device *pwm, struct pw=
m_state *state)
>  			 * ->apply().
>  			 */
>  			if (pwm->state.enabled) {
> -				pwm->chip->ops->disable(pwm->chip, pwm);
> +				if (pwm->chip->ops->disable)
> +					pwm->chip->ops->disable(pwm->chip, pwm);

This is not a good idea. It means that you'll be able to successfully
configure a capture-only PWM channel for output. I think all of the
output configuration functions should return an error (-ENOSYS?) for
capture-only devices, much like we return -ENOSYS for pwm_capture() if
the driver doesn't implement capture support.

Thierry

--+B+y8wtTXqdUj1xM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlrm5z8ACgkQ3SOs138+
s6GW/A/+MImm7BmQSd+UOQUP4N0vddntkXN9FGKsxb1wIZPQBPMKfmH5xpBzfb61
hz1s8KLWOpgqEZQVs7eVp2ICQEOXNgwKdCWbHPsHIU+FUf5zd1ESd7rNu9IrddhR
ZM2lU8YGaREnIFPt2dFpjLVuXA8ak7id02RdeoylpLRaTlgcdE3q1AEY5ewnTNRn
JLI4eEroYAfwtJVC5PSvdZvD5Diq2H+ASe+McYSAbTg8+rHQ3w4KMmTIKoEiv4Us
UCwF89+zCm3K+AVcvdCe2jBSc2OtZm6QXY9BrhIBnGf4D9fGWBTQ0cmZpHtcxHhf
YOqyb+tM1rFgZutFgcrJ2fmFRZp2wrJjGByilhwEWfrdM57zrCQSLPWdnELOIETM
4aGyI1cmKc2DIdXI4Ksv7PRN3LBvvxq8H0Revozmi1MfNWrcB2Qr7sgvBNYTHTfi
T5TWD8oWJ6rs9E+JUJd7SU2fimoDft7i7bbA26mKFN65Y+i7jgCi3d/lTDhVMMA0
nby4wCgKDGnTK9vXsNK93WhUB5R3d6jXAgOePb3UotYIcE2z4hUv8I0Rp24PJWh4
s4zL38OPugoEI0iPfTodURu1m7F1QK2wOdd48OzQBRiQ9nFXywm8KLVxVLZoSck6
xsY1+I848Lu/UNHULnbaCY163rDTcM9/PJwRFrnuCA2Lpr/9M/s=
=yusN
-----END PGP SIGNATURE-----

--+B+y8wtTXqdUj1xM--
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
