Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A475C7D089
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Dec 2018 09:27:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727347AbeLEJ1I (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Dec 2018 04:27:08 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33163 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbeLEJ1H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Dec 2018 04:27:07 -0500
Received: by mail-lj1-f193.google.com with SMTP id v1-v6so17671633ljd.0
        for <linux-doc@vger.kernel.org>; Wed, 05 Dec 2018 01:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=austad-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QkdJwMvUK5e6A9VSfqPjhaNWcf3F+LQDu3vCqBsXJsE=;
        b=1NL8Yh4i3jtJhnmOO08sqBWQMBbS3eHQZ6IkOUyyCsYc+WkP7juYHKNCraH718zGoc
         7bbZadeceWYE8qY9gl/e/41w1WF0Id8ai0y9zFr8qvQhgRMNRveIEgIBlLjOdNmgya0e
         0wS06IRo9tUFcaS4wmk8f1mPgNcxiFZuaHydFJnA7Xdt92HjlFVqKv6kExNuSO+68lYw
         lZ6r3ENo5DguMPQ8ciNMXJKaqlQ7PSM0F0jvduhBfEaNLRynbU0NRz4i1RhUjjaysddM
         LEM3CbPWwYgm19nfmEz2bw03cy/pQINVl+2Q63WCF+3elbrJI6gW63ELNV2T7alhjKBT
         9ong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QkdJwMvUK5e6A9VSfqPjhaNWcf3F+LQDu3vCqBsXJsE=;
        b=CacUZCjWOwIlVCZwgbLD2iCuK84w0H1C1xMYoSs4t2Fwbi7PIRUfYyOooJxRdEG3iY
         4RNmHZEhnNUrxGs9fWJALBJXtQiUCgWvTihWcOTYmHmsjz42SL9/mv0x6E1T2rmq4iGO
         B7ZQD6vLipDPyJZ0GKUnPggivFmw+EeIqYRFGOkFyV5E3k/OY6DCfNmvyDcdEeTwbrlg
         LY+B7colPtSLyUlWWDnb9JktcN1ZtlcCHhR0Wze84MBR4lnCX8snXf+CSJhdyG+WeVfb
         yzVXwO3Y8lHn+As2MVkkSIgnLKxHI/1Z2OvdmmbCOXWnridiSXuwaW3pT/MMS3tdp008
         DVKg==
X-Gm-Message-State: AA+aEWa2x0+0UCRK6O+OIE+66o6174AwxD/BRv5Yd/VIJ+EGP0SJi+cJ
        X48hwb4y+ANJTshXiXtfOnzJjw==
X-Google-Smtp-Source: AFSGD/WsP/bZlpTrcUvH3FAW2QAaYrnscobObdDy23O321hR/pDEjcMvtb/rOgMdARBVMVzLDQguIw==
X-Received: by 2002:a2e:9c52:: with SMTP id t18-v6mr12790515ljj.149.1544002025208;
        Wed, 05 Dec 2018 01:27:05 -0800 (PST)
Received: from sisyphus.home.austad.us (11.92-220-88.customer.lyse.net. [92.220.88.11])
        by smtp.gmail.com with ESMTPSA id c14sm3527311lfb.40.2018.12.05.01.27.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Dec 2018 01:27:04 -0800 (PST)
Date:   Wed, 5 Dec 2018 10:27:02 +0100
From:   Henrik Austad <henrik@austad.us>
To:     Jakub Kicinski <jakub.kicinski@netronome.com>
Cc:     davem@davemloft.net, Jonathan Corbet <corbet@lwn.net>,
        oss-drivers@netronome.com, netdev@vger.kernel.org,
        jesse.brandeburg@intel.com, dsahern@gmail.com, jiri@resnulli.us,
        stephen@networkplumber.org, linux-doc@vger.kernel.org
Subject: Re: [RFC] net: documentation: build a directory structure for drivers
Message-ID: <20181205092702.GA1121@sisyphus.home.austad.us>
References: <20181204014328.14424-1-jakub.kicinski@netronome.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline
In-Reply-To: <20181204014328.14424-1-jakub.kicinski@netronome.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 03, 2018 at 05:43:28PM -0800, Jakub Kicinski wrote:
> Documentation/networking/ is full of cryptically named files with
> driver documentation.  This makes finding interesting information
> at a glance really hard.  Move all those files into a directory
> called device_drivers (since not all drivers are for device) and
> fix up references.
>=20
> RFC v0.1 -> RFC v1:
>  - also add .txt suffix to the files which are missing it (Quentin)
>=20
> Signed-off-by: Jakub Kicinski <jakub.kicinski@netronome.com>
> Reviewed-by: Quentin Monnet <quentin.monnet@netronome.com>

Looks good to me!

Acked-by: Henrik Austad <henrik@austad.us>

-Henrik

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlwHmeYACgkQ6k5VT6v45lk4PgCguTK+AX+tnrtsytRd8KAhkPzO
t9UAn2zqgvVv3NH5ed4aSc6fTRULLVaV
=CjCB
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
