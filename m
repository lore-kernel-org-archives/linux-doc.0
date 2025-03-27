Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D8620B20B
	for <linux-doc@vger.kernel.org>; Thu, 27 Mar 2025 08:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743065862; cv=none; b=SqiEd2JQRvpKpuekgidl3s75AqtChihhT32fUKLphPVb4UuUmLc3sToheb1fnlJkB9BfS2exs9GtW6I3fNl+ZWE6hyvoEW1/7gDTQr82X7aoL+c5jCV2cktRptot3XYYP3GVHwRBn5hZqeoWajcS58pLi7f1X+M83oUsk5ZjhJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743065862; c=relaxed/simple;
	bh=zA3DMC1VmWmNMDN8cvaRBASwF4IuKwVTadBoBZ7jbhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4SzgDtBUyGgKBOdRGVi7rfiSE3TkamwRCppDM0s0w9RbR1rYL8i/gwH1VT/yqPjmhRe9EDDxbkXt3ZK18uD8i3CavvgeSGeerYak/JWk7MKaj/lFllJ7mqW0DZMtI1b65m2S3ER9fQ7PIU0Oxki5mXIuYd6DevLVadMIZvROW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LXWs4mA0; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LXWs4mA0"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so4706935e9.1
        for <linux-doc@vger.kernel.org>; Thu, 27 Mar 2025 01:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743065859; x=1743670659; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ILDVNVv1RvawRizYUQVDbq/vojCQOenZ2+2HfMuJMPA=;
        b=LXWs4mA0uf+uDk4bcBJAuIDVZK93dzIF36ZSSclJol+62HdH2bDQ2uM5N48zBSoDD0
         BXhU7/aqYgtc3XWyWQcwoO9X2nkxXNfnxleeWmPaidYraeGHPUUAvgG7IBCElLSluP/l
         TSgnIjfmM8/D0OY2KLboLc/51XGXtLjAS3s+m+C0tW6UZGsQ8pZRJcCxHiu44RfD4un5
         aXmeq6eBNFU0Bk+PkRRyqmxV0mIvpBugD2nXrwApqbW71MYo9dg6RxZJVZP5oitnPRKs
         M24NVse44XDvw3UYqpwRgfmxrJV0bJtgr/WZV6YIdfgsHOquzi5p1HdhdXN+t3Rk6Dg6
         AXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743065859; x=1743670659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILDVNVv1RvawRizYUQVDbq/vojCQOenZ2+2HfMuJMPA=;
        b=gghO10Z4LKQdYev3Zyq73blFlO6RrcDfBsxh5pH2JeqtUqI5l+d/zG1BAgUvhp0MlR
         4xez9u0H9l7zGxuhIS4h4Mmgz4E2LfusgLLnuJ0NkL8kH/Ya9GEBXVo8QRRJnUEO/dIr
         5qtEnI+8jVrBldqYHSa/Xaqu34/rbObZ9KO1sHp9oFnrAeYSl29A4hciJbqqv6H7VfaW
         UCy0v3qjyvJrZTfhuwL32z3LDEMDwCbx7oqZIfVt/q7bTAsVAoXpAxiiBVTOHZOD1Mzv
         WSf+wdkF4wJtSyYQ0a+a5RJb+87RF8W4YihM6FQLvNBXM+SCnf5SNkExJO8mNBgn3bRM
         uijQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxyBiFrgctc/R00BBXPLWcjRl2mnqqKSYL1i8IwGHShAhbUt+ovPGOfnoCOdOM/bFoMfEpZcmPHYg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG/HzWj7J/6j8JnB96/5S627BVGbXeIAK+YqoHH/BJo8wK1Vs5
	irRiP4ids6dCwCtmMv2GwrR/SQGRSKdgfSnb1yQrBB1+y15hH6p4j/NnaZyzaZY=
X-Gm-Gg: ASbGncsOX1P3ZWzVkLoeBvFbbUw5dfvjthyn0VT5n8oiXJFh620B3oMG5bu/7Q7H76F
	I6869JOvysx1VJUiuWJfDo8Dq2oSKvsYa5hTphj9KeGVnVKzOk322Sbf8XpFAgi0rafFc7tOylm
	rBCVpY0lQmJ0r0hZ8DHHAg7/Tna76yZ8QXOvVL+cm5zk2fqZLgbOAiLRFMxO96AWQBmyPejiYIe
	35uLd+j2yuUCqc4pLx2q0qjRCqLKQFo8q8TBCBCyuUXKyuB+YG2f8CcuCtLYi8Nmufr2Q/fyklV
	6F9T1qE6CpvGM/LQWASF2YyS3SZlkgLZ15o5ZdlhEtbXfPgBuKzRl/C9nKFSqHNQnyRv5f1zBZI
	ePUh6hu7Lg65FegPcAwk=
X-Google-Smtp-Source: AGHT+IF831tQlelv85SsABv3DgsXTx7KGpQ21LJbgFu8q9NZS/DONYGdNcdiUm3qsfAnp3/ISEkoUA==
X-Received: by 2002:a05:6000:188c:b0:399:737f:4df4 with SMTP id ffacd0b85a97d-39ad17583c0mr1910197f8f.28.1743065859078;
        Thu, 27 Mar 2025 01:57:39 -0700 (PDT)
Received: from archlinux (host-87-14-238-193.retail.telecomitalia.it. [87.14.238.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9efca6sm19475766f8f.93.2025.03.27.01.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 01:57:38 -0700 (PDT)
Date: Thu, 27 Mar 2025 09:56:26 +0100
From: Angelo Dureghello <adureghello@baylibre.com>
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Jonathan Corbet <corbet@lwn.net>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] iio: dac: ad3552r-hs: add support for internal ramp
Message-ID: <yxhvtline3ey3ekybqfe3k4y4sm6746wpqwpydxv2brryironl@u2ezr3sryqxs>
References: <20250321-wip-bl-ad3552r-fixes-v1-0-3c1aa249d163@baylibre.com>
 <20250321-wip-bl-ad3552r-fixes-v1-4-3c1aa249d163@baylibre.com>
 <Z-R3E23hWiUKDc6q@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-R3E23hWiUKDc6q@debian-BULLSEYE-live-builder-AMD64>

On 26.03.2025 18:52, Marcelo Schmitt wrote:
> Hello Angelo,
> 
> Patch looks good to me.
> One minor comment bellow.
> 
> On 03/21, Angelo Dureghello wrote:
> > From: Angelo Dureghello <adureghello@baylibre.com>
> > 
> > The ad3552r can be feeded from the HDL controller by an internally
> > generated 16bit ramp, useful for debug pourposes. Add debugfs a file
> > to enable or disable it.
> > 
> > Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> > ---
> >  drivers/iio/dac/ad3552r-hs.c | 106 ++++++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 100 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/iio/dac/ad3552r-hs.c b/drivers/iio/dac/ad3552r-hs.c
> > index 37397e188f225a8099745ec03f7c604da76960b1..41fe78d982a68980db059b095fc27b37ea1a461b 100644
> > --- a/drivers/iio/dac/ad3552r-hs.c
> > +++ b/drivers/iio/dac/ad3552r-hs.c
> > @@ -7,6 +7,7 @@
> ...
> > +
> > +static ssize_t ad3552r_hs_write_data_source(struct file *f,
> > +					    const char __user *userbuf,
> > +					    size_t count, loff_t *ppos)
> > +{
> > +	struct ad3552r_hs_state *st = file_inode(f)->i_private;
> > +	char buf[64];
> > +	int ret;
> > +
> > +	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, userbuf,
> > +				     count);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	buf[count] = 0;
> Shouldn't it be
> 	buf[count] = '\0';

Why ? I am zero-terminating the string properly.

> ?

Regards,
angelo
