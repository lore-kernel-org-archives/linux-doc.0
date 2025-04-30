Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0AE25D8F6
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 14:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746022130; cv=none; b=P1Y8zAkkmQ+egU07tABV5FfetMUt9YGDzhvnUZTGuxsUugOWzcOtLSVAroT4D6aBxI+1qvdxv22zh5/yKckWQiVUm6ANJal736e+ZV/8cB1eXITlV8zM0h9u+JY1eGe2LjRBxB+nXzR+x9Z2jG2j27hPVoasAcxRERFU4iL7M48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746022130; c=relaxed/simple;
	bh=nKrVXdFYKMFM9Hem9wdZl/eLQy0Q5+LZKJyIDlAU+yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DTvmFYhPPLFHgJnC9B8sPX24ESxE4whKHvnE/ajcwNyC0Lf9N+bGQkpz5fCosMJlYv1owHTBYU/3irvoRKzTWfaTuadN67hskmPxi7pif4YlgyGTDzfROs52HJ0G31iyRQnYR1S20EkJ/jc++9/1ae4Vj2FP4AosUyswkfWetcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=tgM3DU7V; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="tgM3DU7V"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-476977848c4so97418511cf.1
        for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 07:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1746022126; x=1746626926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M07YW4+B8fPuXiIo1oP46Lyh2gl/rW1yV/4vvxhVFu0=;
        b=tgM3DU7V/yiErgPmL3sYrc+/gJcBnmdQtqLpiG5ZzpUTO4nB0qhB97tO4t1AeFFjxE
         Uz0RBwvu4FnogpjCgKsXAux8lCljr0Egzz71oPfl4J5uQJM2HUxurHhxlVQBPOb4wEXw
         rlCG3TSL4wm1BaZ2GTXB6rh4n6G6ThCHfOEJPpFeYLouR6QUYZrR7L1aNhSQnjPEEHma
         W1l0fSz4lUnA4INQMUYFEv9jLTS1Kh54xg+/Dyw5YrYCNbx9qLcVJS/0S69kHlC9gowK
         8Uc6FUkfRWkmd0ud/GHUP1HYVyHr/nZ5O2DFbWE3TOkDUYtts1NrXF33PPtETZWEewaF
         iTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746022126; x=1746626926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M07YW4+B8fPuXiIo1oP46Lyh2gl/rW1yV/4vvxhVFu0=;
        b=Dq9qDk7gX+fJ6PIOakIDtF/ROIwSNHiGVlvv8/IGbumUC4Sie4ZNVeyfgZtpnF0rr7
         xMDeFOQKLND2gai7mqGnOHABXl2l3AuZZeUwNHHkhGRjp2yphX+0Ah17bqTzzj62oE0Q
         3zSjiF5Nae0g3I6H8XTxF9hvS5Dn6VJkoEJKRfYMAuSKy87PpMALI1IGtb08PunTTMmY
         I41pa4ep4TFZQzTzWrMIWoj8Fekv5dfljeuV3MUYYof9YwujJEG23ynuKD3x08PL4tgr
         39lOW6w0VWQTU2+RmGcO+GdfspdIklQ1gAmBeUHtYMrGquSwO1G/imd+33K5lrW1nF3x
         g15w==
X-Forwarded-Encrypted: i=1; AJvYcCX5u0zMn39BISAFkR+mta9AQoxDB/mUe8Vq+rvlIWKcc2cBuJG3sV+qZ4nxZzmtreoa8nfxyWUSlZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM4J3LD5F+jrK/Dsydy7X7pTs8crTq613rS9mIcWnxmz0Rl0Bg
	bUD2o+7Unrf+MVXTwhkG5Kw43C05B+v1pLOnlFAuRiVbwEQTYOOb6+k7HVMf1mc=
X-Gm-Gg: ASbGncuyrqBpRbcgem0mBu8EzJc+cXUyh5w8DHdLYB1trGEl3Bpnh6PfTiOEypO4157
	5PTt9M1ZO3yTJG+wLVxzX39HUl4m04aEv+NnM928zmDbBHwUSLpKnxa3BGdcUfCUUklhEhXERSd
	Wj452IZSSQu/EL7AtM5hVHaNEW5Eh1xAx1Ru/pDZaxAvQ+l3uXQhOBWV8G7eOT0a2y7Udcypng0
	ATm6TAdmtwJ1q6tEPM7FtFV1IdfirotAqpzYs2PXDbhkDrXKqOAZFRIxqXaskbuozmxkhhmPHIK
	sftJVY6zsUPIV8fugM2StupER6qrSgjlJQ23MeJ8b0CXJwYm6CwyKDNcXp71eMafGObkmQU5+8W
	lIWEBrLGhiMucN82gMeT8ZD4=
X-Google-Smtp-Source: AGHT+IGv0sXD0ASi/qBfVsdcjg2k+/HQRGhRXeFIhGMFVJWk3UVygxCgFNpA8YzRL2WI7xwLxkotqQ==
X-Received: by 2002:a05:622a:1b16:b0:476:9017:bbf1 with SMTP id d75a77b69052e-489c5701716mr54622501cf.46.1746022126427;
        Wed, 30 Apr 2025 07:08:46 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47e9f7ab516sm91730101cf.38.2025.04.30.07.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 07:08:46 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:08:43 -0400
From: Gregory Price <gourry@gourry.net>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	dave@stgolabs.net, jonathan.cameron@huawei.com,
	dave.jiang@intel.com, alison.schofield@intel.com,
	vishal.l.verma@intel.com, ira.weiny@intel.com,
	dan.j.williams@intel.com
Subject: Re: [RFC PATCH 02/17] cxl: docs/devices - device reference and uefi
 placeholder
Message-ID: <aBIu63MPnZ0bGyIp@gourry-fedora-PF4VCD3F>
References: <20250430001224.1028656-1-gourry@gourry.net>
 <20250430001224.1028656-3-gourry@gourry.net>
 <87o6wdltic.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6wdltic.fsf@trenco.lwn.net>

On Wed, Apr 30, 2025 at 06:32:27AM -0600, Jonathan Corbet wrote:
> Gregory Price <gourry@gourry.net> writes:
> 
> > Add a simple device primer sufficient to understand the theory
> > of operation documentation.
> >
> > Add carve-out for CDAT with a TODO.
> >
> > Signed-off-by: Gregory Price <gourry@gourry.net>
> > ---
> >  .../driver-api/cxl/devices/device-types.rst   | 169 ++++++++++++++++++
> >  Documentation/driver-api/cxl/devices/uefi.rst |   9 +
> >  Documentation/driver-api/cxl/index.rst        |   2 +
> >  3 files changed, 180 insertions(+)
> >  create mode 100644 Documentation/driver-api/cxl/devices/device-types.rst
> >  create mode 100644 Documentation/driver-api/cxl/devices/uefi.rst
> 
> I'm glad to see all this documentation!  One little nit...
> 
> > diff --git a/Documentation/driver-api/cxl/devices/device-types.rst b/Documentation/driver-api/cxl/devices/device-types.rst
> > new file mode 100644
> > index 000000000000..e8dd051c2c71
> > --- /dev/null
> > +++ b/Documentation/driver-api/cxl/devices/device-types.rst
> > @@ -0,0 +1,169 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +Devices and Protocols
> > +#####################
> 
> If you could stick with the section markup conventions we have
> established in Documentation/doc-guide/sphinx.rst, I'd appreciate it.
>

Will do, mostly wanted to get it out for content first. Will give it
a once over for formatting now.

~Gregory
