Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C02330D32
	for <linux-doc@vger.kernel.org>; Fri, 13 Feb 2026 08:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770971587; cv=none; b=WABJXHLUmhH0wRZjyaomcC2yfit4Y9xsFGeYZ74u6VbvL2b85/YU7IIQVSLXjLy7rbY1ScOapyfTWSDM12ToD3IOJce3nYLtmn2yB3uLtNLRJ+Li5omqfUHKCnMS8qvh2kU4CggtRCSvhvUGqJQ4tir2tCw6GrcVtp1JrPRR1dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770971587; c=relaxed/simple;
	bh=nXZoHUWVjEUyII1McfruTyRag9MfWxveBwZ8zh7/etc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OHdsnjZ9JvUp4Nm82xkjLP6s5xzwCEbrpgwLrgTgPN7ZvUe7tXeqH91r9BSy9KV2T+/ycNxEaOtPlKrvA5M0PUl5aDw7Sh7zyll97m4OYIwkSFGCWQVG2iqmkL9TX5VOQzMlnSvjQRxV9WZeRg4NAp3vTTUEsJUF86uuo0YZrw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cRMJOYaS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cRMJOYaS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C76BC2BCB2
	for <linux-doc@vger.kernel.org>; Fri, 13 Feb 2026 08:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770971587;
	bh=nXZoHUWVjEUyII1McfruTyRag9MfWxveBwZ8zh7/etc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cRMJOYaSJ8VsgdomSLOU4uKE1sFNkf0yhfVISVjNbWFGWEDJXxIDNk7WnmWjEp2sy
	 YWbVHh06q4Tes4Q19mSZXb4zdEG8V5IrE3dqqrtgewwEN9ZVjaFT4HPOpiZTP9qjOn
	 8ex9p2l+Sufq9Fl/tgaJcYkPOi3tKmNqeOHN0uaMU++YCqSunyvZKI5NezgTD6OtiK
	 +aHOrsXPVnEA6NpO5D3F6BV//hHN581L/3IwEstN+tdk/WuW2JaSEqSrBJYlO2oXRQ
	 Xt/bycERlOzEeRBq343SjQrSQ8F/8kfTxtvXtYaOYMS7wGoRjzraNm3+Qsl/2DbQ9C
	 JfbswkCu7Q2OA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59de66fda55so718413e87.3
        for <linux-doc@vger.kernel.org>; Fri, 13 Feb 2026 00:33:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXL36tg6rugiL9Lhidj66DV/21DA51TuUdCq3sBl6D6oe+90aMzLNUJxSqdcu7nY42HRHgps1b3c6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQI2GUaG9F37rlYEsChppmCZ5a1uJfj4AatjH3XUkO8txdl0o7
	5wgc5XPslLBX1gqtDI51olfOKrSvMc7/U6cnTktShsK8A3j7blyAGDLXVL8jfZRpdKm0qxKcgfP
	dTlY6PA8EPnfYNNiwPvD0inkna2sGBWxM5tv2YbB+Lg==
X-Received: by 2002:a05:6512:b85:b0:59e:49f3:657e with SMTP id
 2adb3069b0e04-59f69c2f94amr344348e87.21.1770971585033; Fri, 13 Feb 2026
 00:33:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260204142849.22055-1-johan@kernel.org> <2026020624-buddhism-clavicle-7a90@gregkh>
In-Reply-To: <2026020624-buddhism-clavicle-7a90@gregkh>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 13 Feb 2026 09:32:52 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfV+pWCffgNDfS+9QuuJKBDBJG7qOzxfCHf23jERMv+5g@mail.gmail.com>
X-Gm-Features: AZwV_Qieg6Mm5EyS0y-cOySf3Nt2-cCWUht_PKgNMLPL7qf18siBiJX1v-dptkI
Message-ID: <CAMRc=MfV+pWCffgNDfS+9QuuJKBDBJG7qOzxfCHf23jERMv+5g@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Revert "revocable: Revocable resource management"
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Dan Williams <dan.j.williams@intel.com>, Jason Gunthorpe <jgg@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 6, 2026 at 4:17=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Feb 04, 2026 at 03:28:46PM +0100, Johan Hovold wrote:
> > I was surprised to learn that the revocable functionality was merged th=
e other
> > week given the community feedback on list and at LPC, but not least sin=
ce there
> > are no users of it, which we are supposed to require to be able to eval=
uate it
> > properly.
> >
> > The chromeos ec driver issue which motivated this work turned out not t=
o need
> > it as was found during review. And the example gpiolib conversion was p=
osted
> > the very same morning that this was merged which hardly provides enough=
 time
> > for evaluation (even if Bartosz quickly reported a performance regressi=
on).
> >
> > Turns out there are correctness issues with both the gpiolib conversion=
 and
> > the revocable design itself that can lead to use-after-free and hung ta=
sks (see
> > [1] and [2]).
> >
> > And as was pointed out repeatedly during review, and again at the day o=
f the
> > merge, this does not look like the right interface for the chardev unpl=
ug
> > issue.
> >
> > Despite the last-minute attempt at addressing the issues mentioned abov=
e
> > incrementally, the revocable design is still fundamentally flawed (see =
patch
> > 3/3).
> >
> > We have processes like requiring a user before merging a new interface =
so that
> > issues like these can be identified and the soundness of an API be eval=
uated.
> > They also give a sense of when things are expected to happen, which all=
ows our
> > scarce reviewers to manage their time (e.g. to not be forced to drop ev=
erything
> > else they are doing when things are merged prematurely).
> >
> > There really is no reason to exempt any new interface from this regardl=
ess of
> > whether one likes the underlying concept or not.
> >
> > Revert the revocable implementation until a redesign has been proposed =
and
> > evaluated properly.
>
> After thinking about this a lot, and talking it over with Danilo a bit,
> I've applied this series that reverts these changes.
>
> Kernel developers / maintainers are only "allowed" one major argument /
> fight a year, and I really don't want to burn my 2026 usage so early in
> the year :)
>
> Tzung-Bi, can you take the feedback here, and what you have learned from
> the gpio patch series, and rework this into a "clean" patch series for
> us to review and comment on for future releases?  That should give us
> all a baseline on which to work off of, without having to worry about
> the different versions/fixes floating around at the moment.
>

I think it's a good decision. I definitely want to see it upstream but
it needs a serious rework and I think it should go upstream together
with the first user. I'm fine with it being the GPIO subsystem and
happy to help with reviewing and development.

Bartosz
