Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0101F472C
	for <linux-doc@vger.kernel.org>; Thu,  7 Nov 2024 12:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730982906; cv=none; b=VMK7lff0VQm91QRfpPoj9j2iD4mutv8PlHJOCoIj61io9aqy+HBsRCRI5QW4Ve8Xj4rP3qVklxqoe3jckcqCtuwifCU+0vxIiV1AyXBtb6vr1ixFHmFXf1O9UhJGkaMY8A+r3DeYwUo6jfaNAADE/GLB5ZSk3oZv4MGwEOjEDmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730982906; c=relaxed/simple;
	bh=Esda7sxbhP4fmYNvQU/wAslDDgX06gVPKFPIdwfsU+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZOizMv5PLWw7q9XcYaeaANRYB4Puv9GZ73SIEiD6/ZmsgGinrPPIKdqWqTANqFyH9uVXsGfy1GGBtWm4iseLrabFlahNxT/gpnWg11UoCcP/GnuGLNvMfjFxK5+r6HMALBoxDdiCGjZuCOTTERMSUp59qLNnlFOKD8UwKDux71g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=T/i8KB/e; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="T/i8KB/e"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43168d9c6c9so7456105e9.3
        for <linux-doc@vger.kernel.org>; Thu, 07 Nov 2024 04:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730982903; x=1731587703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t1E1HnzW14p3ky9k8ykLp0FSr/w1f40YmC6K/07hNjw=;
        b=T/i8KB/eFyxCVOLSP5PKRigER5gise95lorYfWRq3a7ivXoa/8je4UVKYQ+GDhGUJZ
         o5FjBVw72GkKE82oknX9mHyl/hVCPQJOEh7Ao0M7fa/L4+e1FVaJjyyDOBJbr7KsoCZg
         EzKvM7yAgPG3ORpajHmifSdWODITFudOfntxFy/WeOJxV/hlBJu2Uc49f46l69uLvefK
         G+ha8qw2HKGsrMQ/VmNa9Axg0IppqFPvCSDmHrRSpBK8xS6tKo2p8Y4RYKDvHlTNGClb
         k6VnulrYWsmAXkAk6gej0TVQksuhYniHePVvPKNR3qma+TRlxveI5vmbiaHTaiEDn77Q
         NWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730982903; x=1731587703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1E1HnzW14p3ky9k8ykLp0FSr/w1f40YmC6K/07hNjw=;
        b=kyXnNAEr75HOGM6MuW8uwKTMOZkCS7VQ1pkA0lxIYgJEYNZlfWfb7fJZffxUmayAQf
         bzNzerGW8ULUVzD1UScO5kka2mD9BEU2mYFetYdavKZlQVypWNvMsnwN+Y2CbBYbsf/s
         N03Kh/I1jFcFxmYU9uaZbEp+rIt2YaSpEPK6W1jzMQwz7cB+C1w3tehfJc75wRzU9okv
         q1C7NPgo+pdXzZf3mkmWYfRCXRWgdME0X1/82CbLJ9YVl9S8ww03KC/cLFv6v6F7jMjx
         FbwMR59hh4NvghpJXzDL/sKIkavE4AVZXaBE9DW6CctW1n0PXhA/N/NAz8MYBgTFhw4w
         nv8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKK7dN09zF2j3738kW7EeerYuq+FixfveNNax2Ay3ZKfvDILeTdlmNyA2SsmJ37lN8R6DepE705ig=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJbYgN3oTRtrZs0SlrA6bv11a+/FBuDprPqoj8og583mOzUpkH
	qDszqWflje1E7cmDL/E9R+SRTwfE8Gwk6NKTtP7wAgPNHLUei+vLl5CZIy1wWdA=
X-Google-Smtp-Source: AGHT+IHN/1L/dUoeYcgUToN3r4u5BpldBQGtGvcGjc/Hw9fcK0iHSssfgI0Mi5Z6DtlW3jdu9v85TQ==
X-Received: by 2002:a05:600c:5618:b0:42c:cd88:d0f4 with SMTP id 5b1f17b1804b1-431a01782c6mr381936165e9.22.1730982902712;
        Thu, 07 Nov 2024 04:35:02 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed970d10sm1603880f8f.20.2024.11.07.04.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 04:35:02 -0800 (PST)
Date: Thu, 7 Nov 2024 13:34:59 +0100
From: Petr Mladek <pmladek@suse.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Fan Ni <fan.ni@samsung.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-cxl@vger.kernel.org
Subject: Re: [PATCH v2 2/4] Documentation/printf: struct resource add start
 == end special case
Message-ID: <Zyyz85FfUuLv_oo7@pathway.suse.cz>
References: <20241025-cxl-pra-v2-0-123a825daba2@intel.com>
 <20241025-cxl-pra-v2-2-123a825daba2@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025-cxl-pra-v2-2-123a825daba2@intel.com>

On Fri 2024-10-25 19:46:54, Ira Weiny wrote:
> The code when printing a struct resource will check for start == end and
> only print the start value.
> 
> Document this special case.
> 
> Suggested-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>

Looks good.

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
