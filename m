Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5AB797D2EE
	for <lwn-linux-doc@archive.lwn.net>; Mon,  3 Sep 2018 10:55:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbeICPPY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 3 Sep 2018 11:15:24 -0400
Received: from mail-ed1-f47.google.com ([209.85.208.47]:43310 "EHLO
        mail-ed1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbeICPPY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Sep 2018 11:15:24 -0400
Received: by mail-ed1-f47.google.com with SMTP id z27-v6so441362edb.10
        for <linux-doc@vger.kernel.org>; Mon, 03 Sep 2018 03:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=austad-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=p7KFU43OQrls4/QfxBbLdv5/PevcI01eV4kwDLmUkyw=;
        b=T2SjQ29lARDFCmnpit85dUABMa8mgvXTaVMdLRK+89sFodMxB7QzFx8ng8muxtcnHo
         pGXN72waxHwTdvLQrZryXpibxMLKCrSVhZ37j15qruieq9k2Velg8rjdZXF20Mfde6wo
         XdN6ZA8GwokglGXfNndnw688W/uja0D9IRL+8x5WSUeKm0+6+6PZa0kOvEeiiKQ0cSPX
         erxdyLK5bdDzN1NUxRztuyetq7/dH+v1BUP4hW98YHjuwYXO9UYxMvRrnrrRHGMuXhZR
         +vAN5U3Qb/ruqL5nYgDdtZYn5/qpg/w/7Ry9etOBFUn08RIWLNu46CNNG7OAWOm6Pi0+
         ZcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=p7KFU43OQrls4/QfxBbLdv5/PevcI01eV4kwDLmUkyw=;
        b=CoRjZKKCf/caqtpHOPel+Pn55cPKeJ612MZD1Qo87E5FrBhHeHA9/ZrAdYTxNtW2WG
         4iRcT1QbXfCneuWDiBo0JresSgSEgv9YhViHfZtwz9NS10OVbvOU0F6yoh6wkuVCZ3Op
         AQPdTXiZ1y64HP3zVsJAPc+zVUiTZE7pQnM6i1zuutPjoI0p14YCglj++hIR/WknQW08
         Xmkd25jubnZqVbT8Vsu25lKv66+2zZXHpF98e0Gj4dAHK0zZ9pp6dEpaWBMQ0dv1rzpm
         jOLqavLQX+Cvdc6HEEWsDpTBDpkijPwASGsLhOOEZYBew3y4nSr4SVvo8BZ33WSs1W2t
         v2Wg==
X-Gm-Message-State: APzg51C0LLMbsV5WHF5W2rgZkuCB0TmWUSTjq+uo+h6sr/bL9M0zLnRF
        gzvqHGMeajq6KNTzAe5JiPm+tQ==
X-Google-Smtp-Source: ANB0VdYFAcsRoRqzECoTVtMyv+yeKhW47B9hp9g5oZfWir4b0Jen0m6LvoDoNCpnkvNZXVKC86NAMg==
X-Received: by 2002:a50:8c06:: with SMTP id p6-v6mr16076771edp.282.1535972146032;
        Mon, 03 Sep 2018 03:55:46 -0700 (PDT)
Received: from sisyphus.home.austad.us (11.92-220-88.customer.lyse.net. [92.220.88.11])
        by smtp.gmail.com with ESMTPSA id c15-v6sm11135751edm.21.2018.09.03.03.55.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Sep 2018 03:55:44 -0700 (PDT)
Date:   Mon, 3 Sep 2018 12:55:42 +0200
From:   Henrik Austad <henrik@austad.us>
To:     Joe Perches <joe@perches.com>
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [RFC] Drop all 00-INDEX files from Documentation/
Message-ID: <20180903105542.GA9485@sisyphus.home.austad.us>
References: <1535545728-8402-1-git-send-email-henrik@austad.us>
 <58648986219ce0173ff45d34def0da9f9f34b55f.camel@perches.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline
In-Reply-To: <58648986219ce0173ff45d34def0da9f9f34b55f.camel@perches.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 29, 2018 at 09:20:30AM -0700, Joe Perches wrote:
> On Wed, 2018-08-29 at 14:28 +0200, Henrik Austad wrote:
> > The 00-INDEX files are supposed to give a summary of all files present
> > in a directory, but these files are horribly out of date and their
> > usefulness is brought into question.
> >=20
> > A few years back it was mentioned that these files were no longer
> > needed, and they have since then grown further out of date, so perhaps
> > it is time to just throw them out.
>=20
> Good idea.
>=20
> .rst is becoming more common and these 00-INDEX files
> are unnecessary and occasionally misleading.

Ok, should I respin and clean up all the other files referencing 00-INDEX=
=20
and send to a wider audience?

--=20
Henrik Austad

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAluNEy4ACgkQ6k5VT6v45lm4xQCeIAlT+p1j4970HZd6G8qh0EOo
qY4AoNPTDOKsaS7zRi81RZ7MqaLZEynh
=+zV2
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
