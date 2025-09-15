Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C80D1E49F
	for <linux-doc@vger.kernel.org>; Mon, 15 Sep 2025 12:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757940038; cv=none; b=cf6x3NTJOylPW1nYsWPX1thBUDPrYCwOHawQ4ZKPLFd168NbIBsm+5rCbMS3w4CWLxoLwG5BPYS53SliR0f9joAR0DW4vfWaRbzC4OUUlTGVZ7LXfQs4NoqOlYbADkgoz+P6/RA6BQiILYE7lqJVL1FUK0vWIz2wFuehxK46+hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757940038; c=relaxed/simple;
	bh=dNJnJsH0bwlUv9iv5mm0gr5b4wshCly50clBeI+rCXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hpZvURD1e7+Bh+Ibk6IImb+B8ViCyKOMLetJAbIRuLPzvxey/TYzIbJ7b182fW7QALHFx0MdY9dYsa5z8wrtwAedHeU26y4YQZmCDSuXtepJUzBzpJWd8IMGWeEvdxuKtbp/7Emh5kJ9IAItwUnTNBXkYfXwBDMESe1l06uGxtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2sISqCN; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2sISqCN"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-266fa7a0552so6975055ad.3
        for <linux-doc@vger.kernel.org>; Mon, 15 Sep 2025 05:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757940036; x=1758544836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dNJnJsH0bwlUv9iv5mm0gr5b4wshCly50clBeI+rCXY=;
        b=I2sISqCN0QdjPoe/B/DieEqe0D0/p/1imHlfUY3RxRhmq0g9CNuPr4BUWSUUI//aoj
         mrFnXxolSZ3AKVPZxC8JvIocAep6zTzEA4Pj6FdLq4y6FQl4e6uJkIdKU/g6N26pQ4p+
         v747gQot8tviWtnowB+/EfutA6Mp/9cOFvnWGO1POOjoZFnjeXqbd+r65aT0klJG3Mn2
         JSsmHFqtbZT0Y3kKh/F9OASFUi7cZUrQFeDHpHCxol32NxwJZK1xOhG0KADaZD3NxkW5
         PqWEE8mAf/suuN+l+opg7qBnuLiyRx6xsIhCQ7/KPWr/OgKGEJbX1ZwY708qKY4eAB1O
         NfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757940036; x=1758544836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNJnJsH0bwlUv9iv5mm0gr5b4wshCly50clBeI+rCXY=;
        b=oxLnQ6Xikjf+ef7SNRzkKXz1LDP9l0yyRxDcx7cw3Xan3X1+BwxE/epwKbeAZo0nV8
         CUw/cN11D3luQ1iuctMqBKzXtuxE2n4HuQIBwTM3moRocng5m0V5e8FI+UMYSA3Lix/c
         mx7F9/JO+dxNaWcMhv9FgqHhUgzIP72st7DXaO3l/dXRVk4vf8WVGHmEHdKTvFurfIrw
         bu3/lnJiCVow+goYLafHFDKjnc/tz/Pn66AOUyc84R+1LQyVKvf2QbnIC2nxIO/I45W3
         pQqi0WrhleU/jOCJv7eusWfU+WZ9lJONY+F/k4Q1OjDCcoYqvTYReRdEfG2rHgl/DkIV
         VPjw==
X-Forwarded-Encrypted: i=1; AJvYcCWlrn+ZFWfkpUh1v9I3AaSyuwocKY9Lcfa6YQ2vHSVQviPlrbJSxHIUjChehW+HafdGIET3Yq1OuGc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1pdsZ9KSOgGHdGieULAhRFtDTlJ83pwM/z3rtnvETeH2DbSyr
	JJYuKwaIWlcJKZ2yg5pZtgt8Uc/X4DIiacgVicPAioKM/WhIVr2aVb3z
X-Gm-Gg: ASbGncs6we7/rM8HMTWkMeLUbqrimqcPyq3cQ4EpXrZ2tLgQiIOj91PP/i2WSPBqC5X
	OQNrZiEED9gppm+RAKTccbLF5lQwzXMN6pMnNxCP4EevuoSpabZcK4eS5GH6yNDq6nBlVH2CR6V
	NmIjhHXa6mJdW0Qn4EiYPF9zG3h5rE5rDH58n1Qk4TS0uCC8v0yLULEEpvpEqprH3leXAUD/1c7
	S6nlSMjmeKmYR1fqQuOQAE8Ium1XGE5sA9vpJRoUI4e9ioQvsqT9X/zlATyIVoBiP2xOBDQN26B
	1W5t+I3KDqzjSaaviedZUTNAe6q3bQ9BLHT/hpUMwOTENDpqdijLslGEbawfDrGQovZvdEbXkrq
	WWlFPvzTbfL/go9+zV1QtF8JemP3QYgbWB/ee
X-Google-Smtp-Source: AGHT+IHhTD9B3Sdd7GngwxsOkjj4gaAYEGinNPhIKE81JuyUWnx5sHsOsSR6QPKASvI6Pv3nndfZjQ==
X-Received: by 2002:a17:902:ef46:b0:246:bce2:e837 with SMTP id d9443c01a7336-25d271485a2mr163639975ad.49.1757940036320;
        Mon, 15 Sep 2025 05:40:36 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2635c79cd21sm55033945ad.49.2025.09.15.05.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 05:40:35 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id CB28B420A6BD; Mon, 15 Sep 2025 19:40:29 +0700 (WIB)
Date: Mon, 15 Sep 2025 19:40:29 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux cgroups <cgroups@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Andrea Righi <arighi@nvidia.com>,
	Johannes Bechberger <me@mostlynerdless.de>,
	Changwoo Min <changwoo@igalia.com>,
	Shashank Balaji <shashank.mahadasyam@sony.com>,
	Ingo Molnar <mingo@kernel.org>, Jake Rice <jake@jakerice.dev>,
	Cengiz Can <cengiz@kernel.wtf>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 2/4] Documentation: cgroup-v2: Add section numbers
Message-ID: <aMgJPWETGVt_AE9i@archie.me>
References: <20250915081942.25077-1-bagasdotme@gmail.com>
 <20250915081942.25077-3-bagasdotme@gmail.com>
 <duppgeomaflt6fbymdk5443glmw7d3bgli2yu7gx6awb7q2dhn@syjq5mmia6pb>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aPEdF1//wg19KKDS"
Content-Disposition: inline
In-Reply-To: <duppgeomaflt6fbymdk5443glmw7d3bgli2yu7gx6awb7q2dhn@syjq5mmia6pb>


--aPEdF1//wg19KKDS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 15, 2025 at 02:20:59PM +0200, Michal Koutn=C3=BD wrote:
> On Mon, Sep 15, 2025 at 03:19:25PM +0700, Bagas Sanjaya <bagasdotme@gmail=
=2Ecom> wrote:
> > Add section numbers, following the numbering scheme in the manual
> > toctree. Note that sectnum:: directive cannot be used as it also
> > numbers the docs title.
>=20
> Erm, so in addition to keeping manual ToC in sync, we'd also need to
> maintain the section numbers manually?

Right.

>=20
> What about dropping the numbers from manual ToC and sections? (If manual
> ToC is to be preserved.)

Nope. To be fair, we also want section numbers for htmldocs readers, though.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--aPEdF1//wg19KKDS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaMgJNwAKCRD2uYlJVVFO
owUWAQDOV37Jt9sGtdMfo9OFbV+SKpl+FM7rQVpTGqsGX5TCAgD/YCIODJf7QdFr
0241ELSDVsy6ZHhshkKBKhCObdEmkgw=
=Y3IF
-----END PGP SIGNATURE-----

--aPEdF1//wg19KKDS--
