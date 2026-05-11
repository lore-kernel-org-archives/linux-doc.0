Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58D734E744
	for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 13:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506070; cv=none; b=qgBsoQp2GMsR3WCTFEwkNhdsCHlIWkeidGgxUg5Vrndn4c3vjc75al65pyGiHkler/FQTzTazEODd6JukNXdWQV5OArO+uIjYDZ3g/c4qz3WKHGnDu0q6zJoXOAZZvHqr4g/WM40uoVqy1FpyNOVLI9CE5zZiw6ZQn4akUXFX0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506070; c=relaxed/simple;
	bh=lJECCfxqTC84+TRfNfK1WjSKb5OBfQHZ4y7RrlS2S04=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AXiP5V/MjfZuUs/IOKb5WC9cAr4fERL6vNb3qj9ZwOH9MSFpBtnUWelLpTMnffyN8FcCErYfEfWM1cnW8w4x84DlzSZgD8OlycgEOpHXnQ7wiUajCWw/WfOFp0FUwfoj1sqs6OUi8En2XLF1rrZ6AljQ7ykbaBoVYp+cklcgxpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MflJn9us; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MflJn9us"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so24809945e9.1
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 06:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778506067; x=1779110867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIqj3PJ8IFkl3jV3tX7I8ABRXAJUOvr2KgrwJ/yHDUM=;
        b=MflJn9us+kizAim1TVv7ZqnuDf4OEjp13+NZvSHomJTLL/hYWZLJKn9khobOSLPKxZ
         ya/uy2fWwtue4LDEk9jtQCIsvpl713Z5A3zdE0jBmUSjD2JxMf6E4UubKj87ApWL8p0C
         qjNIgdzZ2TISGb/cIehD3afKcf5cGbhP+efi5SRImgwPovGbjUCnkTImBFKjUVzOTmEm
         8Uk/anzY34+GQFl10Z8Wi/gre5LBxYm3BkCowpSMOIwAYzkVn/MecnUnNVAlk3wpgv1p
         mac8ZaAzjG+/ItMFDVuSX4kdLu7WPVrLiqtaAjuwXHyHxMlnf+DoY5PFhg84GJvYITJ2
         Facw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778506067; x=1779110867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iIqj3PJ8IFkl3jV3tX7I8ABRXAJUOvr2KgrwJ/yHDUM=;
        b=F1w8D4uUk/uBVbzvpxj+3U9oEJLJEoCKFVklUXJgcWdr0e0AtOfsCRKlJHELo0Bbp+
         9Hjd3KQzQQcCmY6XRmGAyrSn7GQHzO87lydLq9jpeVh7oOFvFEyZ39V0HZCYFFGy92pQ
         nkeVrFQUzR+GBxe+AXH1X5mS5qWlprUugxGRVKhzlgbfCThT1IQz/i0SVOpjnP427uVw
         XoPYe9/swGg4GAnRPq+6GmyeBbJTguMoGYb6YYYG893QYM/vzMLepkDCP8DwkO5YFLh6
         kwFT5hNxbxW8vFpcrTYuW2Hd5//KcotQBjurLuuoPB2kHy8LiWNMrVD+nDwA5XduOsqy
         T48w==
X-Forwarded-Encrypted: i=1; AFNElJ97uExpwk/ZXTHA0tr2xfTZkor4g6DKhsye+zUJw3R2PQ1Uj+RxvIctvNHGUASa4OZbRFC9hQgtkEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMqZX7bQS8feSIBoKJ1u5sb7EzTSDrYNXTWb5RHLnnZBaZ+Xc7
	2w2nKgma629SivvbeChbafyHnlcnMKinPfE+oeaB49MGEKtf8cjjPJSf
X-Gm-Gg: Acq92OHHbi/VVY1KdP5qfjMvIISq3yaAHiGLpeTJT9DRlQ7k3DOBaWSUZWS4IZ+XWTL
	OVDxlGF9H+IKMZTBQKu0U8zsrnWrPNiejsdn8MRNz6gOrjy6+BqMMrPlYXGEtn9n09dLtHCF8BQ
	1TkoZafRXt+DDHtn1f8M+I6waWCaCPnEzcbSTjsN/gjaHG3faZNWzxL+KW5b4u0xnXLJFi4ljq9
	RZ4GFl6WWSlKkg3O/jC9QX6JWfR+HlVc1HcBMBBmwMIiB9TBovpbu07CGjJcCIVS4AQjtGx7ATv
	FFphyhtVLRo7BdnhjaOOt52ket+mf7U5JzU6uMPeT/3HwSN0JR3p7xoOGucuAuSb1iqcnTQ+413
	JL2w3w13mxlFlHNMw6P6O+ZFSiMnjB7ztMEA0EgCx3GBNU2pLGLQCf0ZASPuWW8rui+24gNgb92
	TrxUQeN0mCt+YNQ54WgSt+cd576wLebI/P+zF3t1a3mVkB6m/phbdQJOrQCj/k
X-Received: by 2002:a05:600c:17d8:b0:488:a797:f0ac with SMTP id 5b1f17b1804b1-48e51f46abemr229099115e9.28.1778506066819;
        Mon, 11 May 2026 06:27:46 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a6470sm22087839f8f.7.2026.05.11.06.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:27:46 -0700 (PDT)
Date: Mon, 11 May 2026 14:27:45 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Manuel Ebner <manuelebner@mailbox.org>, andy.shevchenko@gmail.com,
 apw@canonical.com, dwaipayanray1@gmail.com, joe@perches.com,
 kees@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 lukas.bulwahn@gmail.com, skhan@linuxfoundation.org,
 workflows@vger.kernel.org
Subject: Re: [PATCH 2/2] scripts: checkpatch.pl: add warning for strlcat()
Message-ID: <20260511142745.7757b1b2@pumpkin>
In-Reply-To: <87a4u6w3ez.fsf@trenco.lwn.net>
References: <20260510164907.57176-2-manuelebner@mailbox.org>
	<20260510165649.57880-2-manuelebner@mailbox.org>
	<87a4u6w3ez.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 11 May 2026 06:12:36 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> Manuel Ebner <manuelebner@mailbox.org> writes:
> 
> > add a warning for strlcat()
> >
> > Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> > ---
> >  scripts/checkpatch.pl | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 0492d6afc9a1..ca1a8e67d529 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -7085,6 +7085,12 @@ sub process {
> >  			     "Prefer strscpy over strlcpy - see: https://github.com/KSPP/linux/issues/89\n" . $herecurr);
> >  		}
> >  
> > +# strlcat uses that should likely be
> > +		if ($line =~ /\bstrlcat\s*\(/ && !is_userspace($realfile)) {
> > +			WARN("STRLCAT",
> > +			     "Prefer seq_buf_printf() over strlcat - see: https://github.com/KSPP/linux/issues/370\n" . $herecurr);
> > +		}  
> 
> Using seq_buf_printf() requires switching over to the seq_buf API in
> general, it is not just a simple substitution, so this advice may prove
> unhelpful to many.

And I'm not sure the external url is a good idea.

> 
> jon
> 

