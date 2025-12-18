Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4CD1DF273
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 20:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766089102; cv=none; b=Xf3kXtJKfv9gsOsBmg+wX/8bnHC2/T4440/Q5nqEBPMwM0QLdwR4iKkxvUA3/kjDWLMylQIGPkfn2eLVQeue4EexifZy1UP5jY/Heu0JA4cz8ZFxSLWHlDAIVulGM8aYqDbMqOshtWPq8G6uqL4bM3VU4p7WfolJABwtE+ee8uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766089102; c=relaxed/simple;
	bh=U3vCMMInYTDkNHFporKJMc5V3f7gN6mNypdV65rCfVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UdiA7IjlHA+WnYB7SnSzPqyRbPfM6jy0VjYeHqqa3FcuVOJdnBf0pa2FbzVmscs/Heeg9cCu0hca1JJt9agRtSacszBZW24k/byI8dVXqDxR/y4ooT5yTawt3KrewoqWQ8VS6tBSogn/rEXWDf4dALIN/xIj3fTqO1XEirM6ynU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ffq+6XIP; arc=none smtp.client-ip=209.85.222.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="ffq+6XIP"
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-8bb6a27d407so96046885a.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 12:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1766089099; x=1766693899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WSAHGn/yIoOk+6tov/10LcI2FCLjvMFDYZWfNzCQ85E=;
        b=ffq+6XIPuTEFoPPpBNiw6r4eq/ksjOK26Uv1JSXxOuRdiOcHzOAgpxYbRTw/wIH6Eq
         rSdlYPYsdGpQr25ZTDxPOpQ7mOUB2TAWBGIG0Ewv4DIzh8iCjQcMyPUu8PAmU5XkydWo
         UFkhVNt788iIJLO/bUA513gZ6wE9PFVEsqjiPo89r/SKY6dJOJ4F95zgcXcjWQoiA3nR
         fc+51aBXGnBwYg8rWUVKzqmzZUOOCvoCWVEGqF5Mxr3VucOiOFNNWSsOsfCpfhNs8Gsr
         49WG1YeNbhbuLebze3Llsu3wBwIGtKiSDk4Gda4ec29kowS3BrVf8WvvwE5p45oh2SSn
         9x7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766089099; x=1766693899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WSAHGn/yIoOk+6tov/10LcI2FCLjvMFDYZWfNzCQ85E=;
        b=kg3aY6ezJNAnMRU9awOAk9ae8lzhuelU4zLL3sSwpb8MlZQ+GJLLG0R+q92AXqDdfu
         zFpdl4kcg6xyVoZmpbn0y+5tI8j3wABCbW9cxrKoc7+YyYOaloOHc50bXperiBzEAeMp
         YyDs87lvWE6L52Rfjx3giOz0fXnfGj+nRJ1bZmoMxN9ymWCT3EXzV7vFfKJIn8zkQo4Z
         qFQy2Ic//tuxTXIKKFJ3kcB+IHqdgQdG1I8k+XZElcd2psgYfYtEKRYWoECcjhX3bMyJ
         CriXuD1irczkUiJL7jfxZSVxeD6OUlIpC+lxdNhyJ9mzoFej6ljOz8hANhcfiaJqxWU8
         NMjA==
X-Forwarded-Encrypted: i=1; AJvYcCVpWjsUYtVJQg0QXf1OKd6VLLSZVEseU8JIoczNRRCGqYAuY/oENvgPpjUj68ZRxCDjEnyq6aNSJuc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5PlvutD7pc5DvL4b1jSK11E0RfqsLLnUgj77TzijewKJDMQ/2
	oVz5UmpizwlGvJcRw0S/NQmABBNLUdnvihh1amwNdAL7p6YAPbD1av8EvhQkKWpGmWM=
X-Gm-Gg: AY/fxX7FuTmSzW69HdlokRQ/O9/dwW1sQ+zCHpe/rk3npNCKkC6WlBi+vzossOLbiq9
	0P3+Yfrc06nrEybWyinB9sy93z2vgzwr+6cvJXSHlNnCA2bjhvmqnLOeT7arEA0GcnXkmP/gf9w
	d+tKSvwht8j25RUjVr8x20e9GpsrXXl0ORrRpPce+uSTeYJdZ4SbeMmLkYQ87s6uOTQEM+nT7QL
	Q+ZDDt/4v0OZ7Dq8x756KzzbzGnMpwK5frgfQVbheNlRILVs1M/arrNrm0/KoruN2zkgabp9wIC
	c0GHsPBTpvDOnnobPZvP9PWWeP7rXAQGAapl0ASEJbmWGCNBrfYYyw/m+3Ij4iQDATfz1Sr3Xh2
	lmTYCXsuQ6L87nGMD3JE5pO40S+DvWsZPubxISicvtmICmLBUW0h4JFYdQeDWb/Kgtz0pAYQhDh
	YyIvbtOJtJVzA3hevTHx2jYElwvJM+OJii7R6q2i23CzZ05UZCw8NcgP6X8/hvhCljE8hYB4HxK
	ZGjcPq/
X-Google-Smtp-Source: AGHT+IG5rhOFiiC0ACso9zoPvELl3akp8DiIdPO/2I7poSmegoCjqVfJHhEZPmrB+VBmLbvlM/aGng==
X-Received: by 2002:a05:620a:470e:b0:8b1:ac18:acce with SMTP id af79cd13be357-8c08fbde56dmr154199185a.28.1766089099432;
        Thu, 18 Dec 2025 12:18:19 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c09678393bsm22563585a.6.2025.12.18.12.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 12:18:19 -0800 (PST)
Date: Thu, 18 Dec 2025 15:17:41 -0500
From: Gregory Price <gourry@gourry.net>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	dave@stgolabs.net, jonathan.cameron@huawei.com,
	dave.jiang@intel.com, alison.schofield@intel.com,
	vishal.l.verma@intel.com, ira.weiny@intel.com,
	dan.j.williams@intel.com, corbet@lwn.net
Subject: Re: [PATCH v2] Documentation/driver-api/cxl: device hotplug section
Message-ID: <aURhZQalIBu8-KhR@gourry-fedora-PF4VCD3F>
References: <20251218170747.1278327-1-gourry@gourry.net>
 <efc86f10-3255-4132-bae3-8fa6c6dc924b@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efc86f10-3255-4132-bae3-8fa6c6dc924b@infradead.org>

On Thu, Dec 18, 2025 at 11:36:41AM -0800, Randy Dunlap wrote:
> > +To add or remove a device to/from an existing HDM-applied interleaved region,
> > +that region must be torn down an re-created.
> 
>                                  ^s/an/and/
                                     doh.
> 
> and one note: There are several places where you use one asterisk for emphasis,
> e.g., *statically*. This means <italic> in Sphinx/ReST. If you happen
> to mean/want bold, then use **bold text** (double asterisks).
> 

I did intend italics, but if you think it should be bold instead given
the contents, happy to change it.

> Otherwise it LGTM. Thanks.
> 
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> 
> -- 
> ~Randy
> 
