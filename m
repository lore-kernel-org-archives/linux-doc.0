Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7A532E720
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 15:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763134776; cv=none; b=GSTUf9fP7YeD/lhhC4JQhIQETOaZi8HWlEDXVXsTHdGOLgKGs+NoetGs7Msj4yRefOIctCHZa9WMXI5jC7fNiLucQCbkAY8jFPvBGrwwBzC4nuCksi+Yeu+FoYks5yOubtrEehI5dAarr6sgM2+YFjaAb3PUxGzJ70eh0VDQmvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763134776; c=relaxed/simple;
	bh=RGmra2lFC9P9lNK/GL9ZldkH3tN7480aSv8fVUblrX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mr/yI6JXmq9EnvznK8OJXa/EhLefBl5wNsQOoXunT9TZS/DaUud5tPvEfhQmi5fvj0WhciSVPLGQtZ2SEJznbVyIUfKZAZvcNzOUOsBs7LIrlghkORUG2nLLCQYu6ZnQsfHrlyj4RTa3Fvkgk7mh/sVJlgTZnfYETZ2Q3YuXXK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rkkjzn0F; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rkkjzn0F"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-297ef378069so20953305ad.3
        for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 07:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763134774; x=1763739574; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GRAMmO6N0Ms4VG4KlIicRsHqLBZGgrqgz9sU8YWYtnE=;
        b=Rkkjzn0F6AjTEBgrbVD4GD+32/lk6CaeTIzI0FmzYWePBbilPJwuh0WRyl6y+eO1DG
         Dsgz6nYToBuJrTLsm+Mkr1FYdJ3/iAUH6a2pIpgING8v+Ym68Qsf11ILQPpElYOJ6GoL
         +ErFGAffC+/87BCaM4DGIry7v7wf0ZUy4bn8Bz/UZ+4ZUi+0j+mP3jcTWTXXCqPmrBCp
         6Ol2YczQF/MgQcN4N9/sa15hdzEq5jwszaCBLknkXKbxqjxdOrstE1kEchQcu2eWGnmT
         nMUbVPRrp3MICxELAUbSeSjzoptKvQJ3JLCGYaAZ+QXAA2ix2dlOVwtzj9gY05uzQBKQ
         W1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763134774; x=1763739574;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GRAMmO6N0Ms4VG4KlIicRsHqLBZGgrqgz9sU8YWYtnE=;
        b=UJODzTMa04LSUxrpgrtFHy3nYkbuFGBvJkiSiNT7P0WSu7wH8XtdcqBYybsKfkhzFt
         5q2OfixY8i640RCr9HksKlySQ5ze/zCjSLlj1dvKdM0iOWsz+pEjwn2+Du/RmqFph81W
         AdWgrxUa5RIAm2Od9RVjuu0fXSpT9mjSTKjh91OWGQYd9ipRvynKzPqLSBiccdSOIiZp
         sJnKWN+1/uVbCxdGmVnIKvllZzeHqjfElrmg9nQPiea8EPaq7BBGGPW+CPupNtYvKE6q
         eCoXOBboDOwGPYz8NKDMGEEHsyXfNhXO0cSnL2VpLmcIax+Ibq6roVZ6yQ3bNg8jTzuh
         mxhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiIuWNZ4rZIUxHuHSfwRqyVPwmnEkGT0SZy7gfpwTUUzSswLewzRS175vhWX04XEUvgfdOB2s5y0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuDCYcOJE5qmZ6palCCFyVxi8B0UXeJ/TTS0iqjEDLXehkLnp2
	55xnW6jYy+CSaclwdGh00aKg8lSS4ePnURooDfatVnhl/qU860Krjo/VLLKK2PONsks=
X-Gm-Gg: ASbGncuMDHm2lLio1NIAaem/O4aCsK0spEGa5EvKJ/8KsQZnfSGVtD5k3pG8rVf8uHi
	bER0/E4IelW9b7eVhlb2AHxPsu24F+S8gEiJO29ckFnXiPFVW7R1hh6X1N1JqRSSeid0GN7lRwt
	fuqoo17rpEE5+eKsUwdLqq5CeOPbTL6/SAwO/g13WFDnf2ru90u8XizW3w8j1w8ANb7gQQxWLVw
	mEFPAFQTVT4Ein2mVIc4P047Ip1SlPsdIay8hYX+Dcm5n8dHO4OYXLgB6KJCKZzD6Ai/8i7B7GK
	BxCg4qJg0yAhYMVSgCo4sBflqOC1oeP6UVhz5tvHgK1FXgulKk1ISgC3nIJx10f7yK/3nNLcl8V
	3nBYLq5gzDky5oW2B74xu1mGkqaQYMGkYjI7OdKpDIE2zp0ETW9RtGDXeSeysoTxvzEuY+6wmQQ
	FG387PFWqQUtyLNBvi0ndV1P6c
X-Google-Smtp-Source: AGHT+IEKKOcScQRFd2v86pYNutTp+VD4tsfO62nLVd6fmfaJHFBxnvd+5CCmg+FyG8DWccPQTGITTA==
X-Received: by 2002:a17:903:380b:b0:295:6427:87d4 with SMTP id d9443c01a7336-2986a752b52mr34175245ad.50.1763134773922;
        Fri, 14 Nov 2025 07:39:33 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:734d:a808:2eb1:a1ea])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c234889sm58702195ad.13.2025.11.14.07.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 07:39:33 -0800 (PST)
Date: Fri, 14 Nov 2025 08:39:30 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, corbet@lwn.net,
	andersson@kernel.org, dan.j.williams@intel.com,
	cedric.xing@intel.com, pasha.tatashin@soleen.com,
	kevin.tian@intel.com, skhawaja@google.com, yesanishhere@gmail.com,
	taimoorzaeem@gmail.com, linux@treblig.org,
	arnaud.pouliquen@foss.st.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	rdunlap@infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH 2/2] Documentation: Fix filenames for remoteproc/rpmsg
Message-ID: <aRdNMtfgftNPVJDU@p14s>
References: <20251114065746.901649-1-daniel.baluta@nxp.com>
 <20251114065746.901649-3-daniel.baluta@nxp.com>
 <aRcEoX9saonpQuvf@archie.me>
 <CAEnQRZC7n127nMaCo+UFnfvKHsRZJTMrmNq4FadfzDJa=1UUnA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEnQRZC7n127nMaCo+UFnfvKHsRZJTMrmNq4FadfzDJa=1UUnA@mail.gmail.com>

On Fri, Nov 14, 2025 at 01:33:57PM +0200, Daniel Baluta wrote:
> On Fri, Nov 14, 2025 at 12:29 PM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> >
> > On Fri, Nov 14, 2025 at 08:57:45AM +0200, Daniel Baluta wrote:
> > >    This document describes the rpmsg bus and how to write rpmsg drivers.
> > > -  To learn how to add rpmsg support for new platforms, check out remoteproc.txt
> > > -  (also a resident of Documentation/).
> > > +  To learn how to add rpmsg support for new platforms, check out remoteproc.rst
> > > +  (also a resident of Documentation/driver-api).
> >
> > I think "also a resident of ..." can be dropped, since it's redundant (it's
> > already covered in remoteproc.rst cross-reference which transforms into
> > the link when you build the docs).
> 
> My point here is just to move the patches to a better location without
> any crucial modification.

I agree.

> I can send a follow up patch if this is fine with everyone.
