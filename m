Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980662EFD9C
	for <linux-doc@vger.kernel.org>; Wed, 27 Aug 2025 20:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756326236; cv=none; b=ofURI6ITZamTDizNoATSVqsDc4qDDDuYJx1YyGxPgGDMGIsQ6BVRTToAWmvPwc8QgycylPZNxEtNg0z1gphc5f0yKnSIPuIRFaIpwR3gUSwgzoSRt04OfK0JVRIboV4hF3csFaDhZ6xc0GwUAhZkAk29jvfCtS4PQ6x6wXSyAGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756326236; c=relaxed/simple;
	bh=ympLIfd6q2uz8sPjeGy9ikp10Y5W46lxVKN2uHOkeSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a8c4j1ILOA4TK+63Q1gcfliPSW+6h4P8BA7b91uHc0dX+2stIDWMD35zNXdPA8NsACgslU4YK6zvMAfe8Hjo3DBmJyq6u/EkEtC63JKERJ28niF4hH0101viYT+UXc1+s57sqghkumls/cXQpl9S46TqmStaHXoMIE7K4CYJ6kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=XAp1zwaB; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="XAp1zwaB"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4b109c59dc9so2989921cf.3
        for <linux-doc@vger.kernel.org>; Wed, 27 Aug 2025 13:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1756326233; x=1756931033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tpOEDUkT9ltpYSIW5r16zrEEmzgxmIvdt7bvKP65LEk=;
        b=XAp1zwaBcG2G0oj7lT6srVEAgs3mPfzaYo1PhkUSfqCKtRI/izoWSZ51J5/QV+zDVe
         hmLqa2faEl2QRN6ij/lQu8KYm++FMzqsIA5f04CxTx3OtTVZk1PD1zPf8Ai4p6TzlcvX
         qzwAhLbl3MK29EZiCqX1XTCDA8PIfu0SNOlQEWx7oz8LEDDiEGERkJkcToQ7bwhpk60Z
         bkdqjoylDE4XFGRM/9MNTMFuA3knWE97s5rqrcDjvSmVh1lVBcfTJPxB6bCqAsF0932h
         fXXFWrjUg46gNcf9gYetZk30dQlJUTO+dotbsem0uT00RJMilnWrQt1t2icRiaIZRFxP
         KC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756326233; x=1756931033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpOEDUkT9ltpYSIW5r16zrEEmzgxmIvdt7bvKP65LEk=;
        b=UBMxkcYb5apf7efKgy5Zo+hXfbOy2C6G17tpvF6DtIXWdcQ10RgUGJjQnAnm6joAzV
         n3VkYw38EF/ZTkrlhil2i4KcdAN7P86I6tnqlplgDFM7Q8U0jCYk/OHyYZlDQThWNo39
         C9B5XNO/5v24UxKclAzTnlveSnq841+jZovHQiJCUPN8/34vslBtH5ZnkdKWy355pylp
         JlGQO4h2qEQtHHIxaF5mh6kWLlmklHw+EDyChfDXArDbGLBmdR1iyLL9UsnJxfRr+zHt
         tp7qPD6vqIzILj32abkVcRUYIlNIUf4fssUak9en/6P97CtoTlO+BsgWxjD+fBfT7EW5
         yK2A==
X-Forwarded-Encrypted: i=1; AJvYcCVeBxlh2i33Os37CSNdhPl3ROvYJyZNEruvJ6blmj4ObzL4W2BeWsym15yA5q8AtAaWvtYDVlMx0JI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdLPe4tJ5Cda3RJuL/r+nazlavk2Lpv+ecSOApxGNPz9Pbf1pf
	12B9IDAfrIhMsFZv+Awa5xYZRt1Z0ecmIfWicdbWjFx/gdZS3jwBwk3FoF3lV4cPgLA=
X-Gm-Gg: ASbGnctSHuZHapb5CTmO1DTOrrE8WkuVvzFxWJcZ+GORN2VkDNpNFDAhtDIkIB6p2aO
	5NDSIAzwh+q/xeH+3Gs/TNrcBhQg/XSD3hK3MqwZjjF9kKKflG/hRomU8cO0JR8oTQYbz5p16gF
	bWM/LmCQwySuFAxfI4qTHMFyNqQruvJji5tka3uXHJB7exLZXeD9L8O6ddukuRnRTK80FD8+SyP
	949gn6MJm6eFvSIgn2HJpGbN3YfENfzMMXDZj6EsoBCo+KUWpCnPN8h6fZ8IzP0XwF38WGdU6KB
	BGffBGMtjFmzmz3kKvtvzSr0XFZOa7IKxCkRhBE3SWD8Zsoea+e3kDGYomiSkVUWanr8M8DwCn1
	ls1bTaA5sofI8KkV/3qT+rUT9ptKXu/f9SLasglu59nXmQ+mjQ34zGJk2iHKyAG7+qkoD+4pXDX
	kazg==
X-Google-Smtp-Source: AGHT+IH2jvq0biwVj6G9Lb1igaYWxMehi3WpzeTMyFhLVTHvBbvwK5R7zTgvdDX6KlbQ3p+4Xa/pJA==
X-Received: by 2002:a05:6214:5098:b0:707:a430:e01b with SMTP id 6a1803df08f44-70d971f7608mr246666016d6.3.1756326229319;
        Wed, 27 Aug 2025 13:23:49 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da72ce510sm89559896d6.64.2025.08.27.13.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 13:23:48 -0700 (PDT)
Date: Wed, 27 Aug 2025 16:23:46 -0400
From: Gregory Price <gourry@gourry.net>
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
Cc: linux-cxl@vger.kernel.org, Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ALOK TIWARI <alok.a.tiwari@oracle.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v4] cxl: docs/driver-api/conventions resolve conflicts
 between CFMWS, LMH, Decoders
Message-ID: <aK9pUhETnNgs-7UG@gourry-fedora-PF4VCD3F>
References: <20250820150655.1170975-1-fabio.m.de.francesco@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820150655.1170975-1-fabio.m.de.francesco@linux.intel.com>

On Wed, Aug 20, 2025 at 05:06:39PM +0200, Fabio M. De Francesco wrote:
> +
> +E.g, a real x86 platform with two CFMWS, 384 GB total memory, and LMH
> +starting at 2 GB:
> +
> +Window | CFMWS Base | CFMWS Size | HDM Decoder Base | HDM Decoder Size | Ways | Granularity
> +  0    |   0 GB     |     2 GB   |      0 GB        |       3 GB       |  12  |    256
> +  1    |   4 GB     |   380 GB   |      0 GB        |     380 GB       |  12  |    256
> +

This may be a dumb question, but... how is validation supposed to work?

Like in theory according to the above something like the following would
also be valid:

Window | CFMWS Base | CFMWS Size | HDM Decoder Base | HDM Decoder Size
  0    |   4 GB     |   380 GB   |      2 GB        |     382 GB      

(ignoring ways/granularity, i didn't adjust those).

The entirety of the CFMWS would be contained within the HDM decoder, but
with carve-outs on either end.  This would be "allowed" according to the
logic here.

This would effectively allow all HDM decoder base/size values to be valid
as long as one CFMWS is contained entirely within it.

As a result, wouldn't it then also be valid to have an HDM Decoder cover
more than one CFMWS range (two full CFMWS described by a single HDM
decoder).

That seems like it could cause issues.

~Gregory
