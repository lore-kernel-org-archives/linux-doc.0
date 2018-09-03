Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 63BEE7D2EE
	for <lwn-linux-doc@archive.lwn.net>; Mon,  3 Sep 2018 20:32:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727627AbeIDAx5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 3 Sep 2018 20:53:57 -0400
Received: from mail-lj1-f179.google.com ([209.85.208.179]:36626 "EHLO
        mail-lj1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727510AbeIDAx4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Sep 2018 20:53:56 -0400
Received: by mail-lj1-f179.google.com with SMTP id v26-v6so1329038ljj.3
        for <linux-doc@vger.kernel.org>; Mon, 03 Sep 2018 13:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=austad-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4Io1qT+qXXptYjpKmHi2VlaVG143Dv02mojjf1V+lOk=;
        b=0zbvydU977VcCBDOVkIkzRGbJ10bGbisgbewkoUyIFlMvy9EZXrVN1HGXmf/B34J9z
         rMrJ7acs4/rmLnkh1iMnN/HM077558C2EAsxO0SaKvFueI9M5eaQdapEgtuvAR4JAnpE
         mWAINonTiaCt6He8QH/nc6wWNTNOodojvCI6QQiRZqv2/KDsmGoX92xk1uc0yEMnNjM3
         BN0B0B6eIKCBtF9UidrwX6HbGqss1oa3k2NQHmC5cnymmZZgaTRqEQvQeoyKX0l7Y6x4
         PHr+YQsikHwc6Vu1F5Qavk5KO0A1MX7U87JVo3cfOMH5qkB43ziJIwmXMQ1vuGZKXnYs
         9QkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4Io1qT+qXXptYjpKmHi2VlaVG143Dv02mojjf1V+lOk=;
        b=YuHRQsv/LLWNwdcUxhvsaAtEpht/LUlpnhNB8CDwK56uZ2Ln4WikmuHTJ57XvBwlHz
         lWeKg6AXJsySDgtDc+O8ORJwuokW8sb/8n5aPnKWLnMU2DE/bT+cGTXwr0XaRpka4jYp
         iloc6JS45O7K9WO+ir9hMrNuWLcHh/aVxtaq47hdYjt5yNw7cH1W5j7QlsO5DwGslRQ0
         rXXrhzoHsuiwriD9NOsR0bxPbLXElodVg1463MULVNPgkK874XISL45elWct9JeMgaFH
         4LPw8TtCH5Y3KE/PiMVnFMhda7VMPh2TLvtss0wl1PFSEplLSqobeZtyO0y4WhMQWwOp
         1PIQ==
X-Gm-Message-State: APzg51C+bW7cXCZ8QM7tSIb+XE4mWCmwZ0LGN3toanwFTR1VnLc7dpX1
        gLt2AqeTXWrW+d8XL38eqGnxJQ==
X-Google-Smtp-Source: ANB0VdZgMPuThSihRf8wpv9btB/sXA+GvCsuQ64EfN5YkeJOweYts3N5/gZXVPaQrOkBD0ID+9UllA==
X-Received: by 2002:a2e:9b59:: with SMTP id o25-v6mr17858359ljj.132.1536006724605;
        Mon, 03 Sep 2018 13:32:04 -0700 (PDT)
Received: from sisyphus.home.austad.us (11.92-220-88.customer.lyse.net. [92.220.88.11])
        by smtp.gmail.com with ESMTPSA id j135-v6sm3654460lfj.91.2018.09.03.13.32.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Sep 2018 13:32:03 -0700 (PDT)
Date:   Mon, 3 Sep 2018 22:32:01 +0200
From:   Henrik Austad <henrik@austad.us>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Joe Perches <joe@perches.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [RFC] Drop all 00-INDEX files from Documentation/
Message-ID: <20180903203201.GA11920@sisyphus.home.austad.us>
References: <1535545728-8402-1-git-send-email-henrik@austad.us>
 <58648986219ce0173ff45d34def0da9f9f34b55f.camel@perches.com>
 <20180903105542.GA9485@sisyphus.home.austad.us>
 <20180903124545.089ead51@lwn.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline
In-Reply-To: <20180903124545.089ead51@lwn.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 03, 2018 at 12:45:45PM -0600, Jonathan Corbet wrote:
> On Mon, 3 Sep 2018 12:55:42 +0200
> Henrik Austad <henrik@austad.us> wrote:
>=20
> > On Wed, Aug 29, 2018 at 09:20:30AM -0700, Joe Perches wrote:
> > > On Wed, 2018-08-29 at 14:28 +0200, Henrik Austad wrote: =20
> > > > The 00-INDEX files are supposed to give a summary of all files pres=
ent
> > > > in a directory, but these files are horribly out of date and their
> > > > usefulness is brought into question.
> > > >=20
> > > > A few years back it was mentioned that these files were no longer
> > > > needed, and they have since then grown further out of date, so perh=
aps
> > > > it is time to just throw them out. =20
> > >=20
> > > Good idea.
> > >=20
> > > .rst is becoming more common and these 00-INDEX files
> > > are unnecessary and occasionally misleading. =20
> >=20
> > Ok, should I respin and clean up all the other files referencing 00-IND=
EX=20
> > and send to a wider audience?
>=20
> Wider audience might be good.  I've not yet decided whether I think this
> is a good idea or not.  We certainly don't need those files for stuff
> that's in the RST doctree, that's what the index.rst files are for.  But I
> suspect some people might complain about losing them for the rest of the
> content.  I do get patches from people updating them, so some folks do
> indeed look at them...

Yes, hence the RFC. As I said, I'm happy to update the 00-INDEX-files, but=
=20
if we decide not to keep them, I rather not spend time on it.

Let me respin and add a few references to 00-INDEX from other files and see=
=20
if we can decide what color to paint this particular bikeshed in a wider=20
audience :)

--=20
Henrik Austad

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAluNmkEACgkQ6k5VT6v45ln0WwCgmKksT4bQj0By6L5voXaGo5Ds
0kAAnAxYRqh+FL9uea9kygyTUz8Rz4mN
=vC82
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
