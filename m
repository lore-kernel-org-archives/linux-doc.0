Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6965A3BFE41
	for <linux-doc@vger.kernel.org>; Wed,  4 Feb 2026 09:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770199017; cv=none; b=pkxeqDgmwQ0piw7SjG2J3nZN6m75a71JqJQFQFQwrdSnXsBC9an4d2H6mcwf8dQ9UF54IbNx3jRU02IJ/4Pi94toKG6dxnyntS1Iz/XhSp9/0jbR/4BBNr1sYkukl1+/T5kCDH+SdHErDvH8n5mdmNqY6CbzBPX0n0LIqWNJdBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770199017; c=relaxed/simple;
	bh=c0SSiNKESavwRZtHeDYtsFbwwGk+w/EGhOCZVlQW4wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iYyrJIjVT1mRNb89pntbsBAYIlZ9iwA1+qtytdAcate8kHvakNol+Q+nO6wsodNCQS6NYvDvxF9PUSqC9Jms8ZHYlWP8DbnYygjT/V0/ZjkmkVm8qVRAeV1qtMkcYR+tf3hQT5qFvccwyjEwE7vJtL7xLBD9fCx1J0T9E0kDarw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=yQXnBIkG; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="yQXnBIkG"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-480706554beso72214245e9.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Feb 2026 01:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770199016; x=1770803816; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TaBsez7vELTsNb/sMEe0+EHGenrpZkeztrL57KkgMuE=;
        b=yQXnBIkGW0ElIC/OXWcyplPwOOU0IIyJdg2coACLZBwEAL3kAFpLZpCqnTmfDTPtiG
         2zVbqzDrgzqlUL7Ja9XWDQV0ujbRrO5KZL3G5M0n+dPQwbNMj3+CF+EZfFliCM6N5Txa
         rJDqCgzxoFgzjS0did4KHpryRo02BpSKDJ5y5T0VqSbZTfwlHO0/fFwwV2T0Vf4EIVlY
         rIOegYO/OE1z3Su9rBc5No3IDgGWqcEHRb9NeGDzU+kEenwKqvCoQoQKtdcWRsUgtQPp
         lisED1YCVMCvDSG0056FrhEsGYv8OwiFcsE5MZXwmgR35UH9O7JhFcEvjVLyvS3s3WjO
         DT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770199016; x=1770803816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TaBsez7vELTsNb/sMEe0+EHGenrpZkeztrL57KkgMuE=;
        b=T3QKvArCLrmyTjE0kM8yPwk7MeywZW4poGu458j/1MrxrEI4ooAwpU5siiTLQnvwHW
         Cy7681/31UIoEN3SNu7jMc4IczzLek8UKWXjA6+lQHYenpP5ADA1IIm9BjALTTjWFYHe
         sb4NorcI+houaWaNPlucEbB/TqEPR7nWXyOVlyvb1UUOfKknaFN/LenO8nm2RfRshgJq
         Dvnk9uDzqZBHTw/Mg/r8TkWQ/sE8OUfLxv+2p/TxvJer3tk4JUeT6VzsElUi3ijZwgv8
         1QJgub0Ev7swn9VLQA3aEppFkzYVtSfO4kIgUSf8OsT58IYJBiNFv+nSha7oJMJSOZ8V
         9W/w==
X-Forwarded-Encrypted: i=1; AJvYcCVhdHKyfpcJ/ZS2WJAQzFZ0cxdubiRhNMQQzLaXFW8rUI1g0Pul6rhCPW/KVP5eSNirzB+r7zLZg+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKt4cOGsw99OoEOUSTKP9ecAfF111YIMt2E4Ep7d6W6zHiuc4U
	Ij0QnzFl/pZFnPAW2XfO/Trg2Ilp5Ywh+ePu/m+DFeWYm4M4TizZ3wul518Tjopm6Vc=
X-Gm-Gg: AZuq6aKxyqCxhgLZ1pGfbJ2UPyxIsGaRUHAKAm3gEm6qdjH/sRU0r/qWgcJBTBNwYW0
	3l+zZ7y9tn8H5tLpwioLCBjqdo97bDHN9FLSc8Lpo4tkPa24KNK/ud+LyLUjQ8uTdsd8Ut7EO7r
	CLHpynjNXFjF648sw6h+4QudUYiQSEEUEMfNdC4Tv/sXKMLCA9XUFpRGENZ5pUIfbms8jklrlXf
	7+rU+3tdRX/VrS7PTLMJ/E1SgCcVzay1JlsLASeM72tMy/8mGjBd+eCajxdcKxWdxNev/1dmoDP
	THhd1uJRT49OdY3Vnz0p4PQagsVTwCDCPQ5StXflGVPxyuqfeXwmE7cnFT9f7LXHORBjbq0kf1G
	gDHoGZbEUBnix6HEa714viiNCg/m1w5gYx9Tmw4OceYoEFUprg7SBnJ9hodkOmPbdKcvISbmFnZ
	t/duwojcCskhrz0lBaRmU=
X-Received: by 2002:a05:600c:34c3:b0:480:1a3a:5ce6 with SMTP id 5b1f17b1804b1-4830e93ddd9mr31664665e9.14.1770199015702;
        Wed, 04 Feb 2026 01:56:55 -0800 (PST)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4831089d547sm44206485e9.14.2026.02.04.01.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 01:56:55 -0800 (PST)
Date: Wed, 4 Feb 2026 10:56:53 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, Gal Pressman <gal@nvidia.com>, 
	Moshe Shemesh <moshe@nvidia.com>, Shay Drori <shayd@nvidia.com>, Jiri Pirko <jiri@nvidia.com>, 
	Or Har-Toov <ohartoov@nvidia.com>
Subject: Re: [PATCH net-next 5/5] devlink: Document port-level resources
Message-ID: <ew6f3nuo3u7cwegwadlmqotxl6ns7c6pa3h4ljbuxkqbq3xxe7@sy74qkffcpze>
References: <20260203071033.1709445-1-tariqt@nvidia.com>
 <20260203071033.1709445-6-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203071033.1709445-6-tariqt@nvidia.com>

Tue, Feb 03, 2026 at 08:10:33AM +0100, tariqt@nvidia.com wrote:
>From: Or Har-Toov <ohartoov@nvidia.com>
>
>Add documentation for the port-level resource feature to
>devlink-resource.rst. Port-level resources allow viewing resources
>associated with specific devlink ports.
>
>Currently, port-level resources only support the show command for
>viewing resource information.
>
>Signed-off-by: Or Har-Toov <ohartoov@nvidia.com>
>Reviewed-by: Shay Drori <shayd@nvidia.com>
>Reviewed-by: Moshe Shemesh <moshe@nvidia.com>
>Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
>---
> .../networking/devlink/devlink-resource.rst   | 36 +++++++++++++++++++
> 1 file changed, 36 insertions(+)
>
>diff --git a/Documentation/networking/devlink/devlink-resource.rst b/Documentation/networking/devlink/devlink-resource.rst
>index 3d5ae51e65a2..4cdfc1dce180 100644
>--- a/Documentation/networking/devlink/devlink-resource.rst
>+++ b/Documentation/networking/devlink/devlink-resource.rst
>@@ -74,3 +74,39 @@ attribute, which represents the pending change in size. For example:
> 
> Note that changes in resource size may require a device reload to properly
> take effect.
>+
>+Port-level Resources
>+====================
>+
>+In addition to device-level resources, ``devlink`` also supports port-level
>+resources. These resources are associated with a specific devlink port rather
>+than the device as a whole.
>+
>+Currently, port-level resources only support the ``show`` command for viewing
>+resource information.
>+
>+Port-level resources can be viewed for a specific port:
>+
>+.. code:: shell
>+
>+    $ devlink port resource show pci/0000:03:00.0/196608
>+      pci/0000:03:00.0/196608:
>+        name max_sfs size 20 unit entry
>+
>+Or for ports of a specific device:
>+
>+.. code:: shell
>+
>+    $ devlink port resource show pci/0000:03:00.0
>+      pci/0000:03:00.0/196608:
>+        name max_sfs size 20 unit entry
>+
>+Or for all ports across all devices:
>+
>+.. code:: shell
>+
>+    $ devlink port resource show
>+      pci/0000:03:00.0/196608:
>+        name max_sfs size 20 unit entry
>+      pci/0000:03:00.1/262144:
>+        name max_SFs size 20 unit entry

"max_SFs" vs "max_sfs", be consistent. Better to copy-paste actual
command output :)



>-- 
>2.40.1
>
