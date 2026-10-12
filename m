Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FEF4E8DE0
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 20:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791837814; cv=none; b=MCvFhCa14H+BTi/Hlk273cLSNiRJz4kDa3xHTPfIgJEvYL21/zM84/NGaf/b7bwLvGpx8PUua2ToWXunN42mwbE69kiFyvLxgsuw2v0coRzjIqp/aZvZhGEQibN2Cezq0VxPyrJlo/FOAfn1jBaS96sVrIqxu/ac+Rp5wg1M9XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791837814; c=relaxed/simple;
	bh=SWVAfflsvR7uwsFRFLUgJMbObCSKiB2/FdyOcDm66zE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oqhUKCIG5shi3Vxz3Q3u+t1T/o63SEozbew/yQUGN2R1JxE0H+g+u3/LmpWP7A8RgWdzNBXCVwzHOtYcYqGVTNCpAN+6AprFwmH0bJeCW+ateprk1cbLxrcolL7N6beauGKiwgO+F7PCrKN1akNUY3oZ+3CW7RpFZZ8aCTVgtw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=dGLzxKc1; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="dGLzxKc1"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so13679185e9.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 13:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791837811; x=1792442611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XK+SEB+e/GS3thSnPWg9ZaAuDfBuOx8piTMr3Esm78A=;
        b=dGLzxKc1JirYvojo0RObX1aFxRnkvO/Alo1BeCnN6QbXoLPOqWh+/mCb+wi7IgUu05
         StF00gmsypnUd7iKBzYy/HE4RrxAt9r8KFAbb7X+kmKU0I8VTn1h9giWAsfeMXcjOtjA
         R9KpNp8rIV9zXnFzlaqUTzdMUsUMyYk/KfZOJbuTH4H7zJAy+xo053cyKY2nA9MB8YbT
         2ougQHSFyOg1LsUTfVlJDNNpk7Lyx2aYSX+c5lU2Yh68Z/BbkOM+ShopVC+D+bdXKFrF
         pR3ZIj9zYISTReJE/dNgp4MnImaINnSl80R619cqP5PVDejLOhtB/UaqZBoTV69FbkWf
         pbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791837811; x=1792442611;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XK+SEB+e/GS3thSnPWg9ZaAuDfBuOx8piTMr3Esm78A=;
        b=Atft8gcpTkBfK85+AopZI8N8vOJO/hPnRPcJuwaU2AWbNeEbZDyz+U+VleaKXkRhtV
         fI6NlX1VXyo/lm0gRk49MhSpkUTSAsZqFRsAod3Rd5/k5hEE2mXPw0oSSoNCvYCljhJp
         TVnqRPa44Z+yGJ4jX2YxIbUGyOv0TZaS+ZyBVmkbzPwU0IaSKzKQcFiZNf67AJwhokT1
         dXq6ivB7mrwHTDCv4y0EvaX2cuDmd8nK0W8bGAXp1phZSSxt2i+aACeBP++f16wbN8OI
         PrZJ0U+qFykfpol33s/rCkZ62bbzuroRPzMkTokUSNMXiCMxe7XkBzneHFf9oPCXV9md
         olIw==
X-Forwarded-Encrypted: i=1; AKwUvBzx9+jl1egSJhJTlB9DwmiJtyUHvFl5RbEom0JqEoFjYd33BTUkc0A15+h1v8bRucA59vIXDIB9aeY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiSj21sLATwC8QsuIyj+cIFOVktaYol+KYoOctmA0TcF823+FP
	GXjHrqsy069vTNmO2jikPrV8Ut9+lNrBSu6zKUynUpSRriVg+V03aCoIwB3HBDc0Bck=
X-Gm-Gg: AYBFou2BxY8kJANa5ynvdiGzzdyUvJsFmZnM5r6vdyZbYTr02Ybf1Xh7yJK+bE+yVbs
	gg5I/dfJJ7RSvPdrEj8qEZL8xmB79YyPESBE/7dcNuvqeyPLsbZXmiM7inbhWxfmcXVcpriCANP
	i+08CFXewW7BXmvy0+s6yMDxVMiWQsu+eqo6Lp7ERkosyQEq/RH2tyRD6OSGV9h0EZ7dbpBOIsW
	pdq6V0c0BCqEvUeg8HkA6u75xC3NHlXR9DrBNPy7uRsgkRS2MB4omTKEEPjr3Brwp9YXNSnwzEn
	roPRn0ubtfaYm3WxID1XyQgQwQ2mjmzuRLE0iOE0l5lze5ualzJjmJPmHTL7P9XRCfj3xeqdY6v
	6ik6TPSSmAVROj6Ec5Pg2nrDdqzLR2iqV2waJs7f7Jmq6Y/pfh39LUXOLLH9Mf60b7yxZYIyipR
	c2hmAB2CE3sxmRKThRbndMnpPMjTUpcW6Ikw/6LWLiWYScmtjurax+BtVDfKNykGovUZ6K8v2tU
	NY=
X-Received: by 2002:a05:600c:548e:b0:49f:f9d1:e618 with SMTP id 5b1f17b1804b1-4a18e4aa057mr205547665e9.17.1791837811442;
        Mon, 12 Oct 2026 13:43:31 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a199e5db12sm197660805e9.2.2026.10.12.13.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 13:43:30 -0700 (PDT)
Date: Mon, 12 Oct 2026 22:43:29 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Kishore Batta <kishore.batta@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
	Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>, Oded Gabbay <ogabbay@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	mhi@lists.linux.dev
Subject: Re: [PATCH v8 2/7] bus: mhi: Move Sahara protocol driver under MHI
 host client drivers
Message-ID: <as1F08YNeWz_1bre@monoceros>
References: <20261012-sahara_protocol_new_v2-v8-0-e12939d229a1@oss.qualcomm.com>
 <20261012-sahara_protocol_new_v2-v8-2-e12939d229a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k75v5fxmll73bi5h"
Content-Disposition: inline
In-Reply-To: <20261012-sahara_protocol_new_v2-v8-2-e12939d229a1@oss.qualcomm.com>


--k75v5fxmll73bi5h
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v8 2/7] bus: mhi: Move Sahara protocol driver under MHI
 host client drivers
MIME-Version: 1.0

On Mon, Oct 12, 2026 at 11:48:00PM +0530, Kishore Batta wrote:
>  #include <linux/devcoredump.h>
>  #include <linux/firmware.h>
>  #include <linux/limits.h>
>  #include <linux/mhi.h>
> +#include <linux/mod_devicetable.h>

Why? There isn't even a (new) usage of any *_device_id. There is a
mhi_device_id, please rely on linux/mhi.h to provide that. The main
effect of including linux/mod_devicetable.h is that the driver grows
many unneeded dependencies, so don't.

Best regards
Uwe

--k75v5fxmll73bi5h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrNRm4ACgkQj4D7WH0S
/k4JaAf+LQbc81GUcwrqUE1hp5/ZCb05DUb37f03Yl819y3z00pXYZgwXJDUTd9T
GxJKc/iB9t1KKUv41uObbdOWw/pX8fpB4QMUgZQ1hlt7cRumJE11HOvk3ieg5WNf
pb4dIHEZGziIGLgCybUc7cofDnbPzwRnzZHOM7ngjQ1pg6U7wFlwInyjQD9mkett
cBtgIfwxlb61WfBOpmn2HajtmR/jVHmrj28oEqs6rJYH4yqR5eDpna/VhGCLfSV6
/AGqL77ZVNBz+bljTJO/GmIXlHHKNMQ9siCwfbX8dqLVG+HqxQB9+07RAtKA7t3q
ehCntiPriE7DoQa/XfRDpRlCwDiqzA==
=+TQr
-----END PGP SIGNATURE-----

--k75v5fxmll73bi5h--
