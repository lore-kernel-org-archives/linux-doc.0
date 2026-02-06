Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A4D35BDAD
	for <linux-doc@vger.kernel.org>; Fri,  6 Feb 2026 09:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770369674; cv=none; b=Q3i1NkObe5b3Kk/68L+fPL9XI0W5e8fyoxDHQSvW3jxvSQLZjusw3QqgehwNertKkF1zO2vnxp1KznZ1esf5bFgEa4430fdRm+pOloK3933aJI3j4DWcndMZIAdmOpOPd+JcPURt7hJoNLMEz8tJ0S4NIBnxKEjduzTqHUhVZo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770369674; c=relaxed/simple;
	bh=uYHqopYroroGJu4jPezMwlTHDcRYczudf62+B8v8YAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dE8NqqkdmXA629mOEEcjZI5ePa33RLS5fsnHkL1ClfBrf0kALCiN+hg/kUxcEu1kRzACK+wOHD6kdwql5S8VAY43FO8vdQ+0u14Tf3DDIkizZ6HQZwJ4Y8v1XoiP+hW9/R6J7UOVqhyPnwX4FXIsUilMJ3+Hes486u3qND7n9Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=1SD7lkyc; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="1SD7lkyc"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so14092335e9.3
        for <linux-doc@vger.kernel.org>; Fri, 06 Feb 2026 01:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770369672; x=1770974472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uYHqopYroroGJu4jPezMwlTHDcRYczudf62+B8v8YAg=;
        b=1SD7lkychrBCkUtZgs7PjPm5kuQs14E0On+1DH2AAOVRkYXUmDkdt62pIjvCyEtsTB
         BDOkASCgvFWvIWLPjSmmRq+37Dcl7/RAl3s8OVFyO8BhVQSeIGsKyfIQKkUPPrO8G6EL
         gcBeQDKJadLj9buu7DIeEcHmiRCSS5NaQ9dV7+BCbYyzAcrMFQCmsTrPxdftsYdikH6e
         EgLSTygeRc1ju1n97ukBjdnWsThiAiM0yQi1IOjJnypPP6Xo6rVqNrSoKneyC0JHG7X/
         kNK7I3JQqD1e9wUinelrzX3v50EZTsU/RHiEr3oczDNWqJMeCYsHkOCXAS6U5QeFgMlU
         KfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770369672; x=1770974472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uYHqopYroroGJu4jPezMwlTHDcRYczudf62+B8v8YAg=;
        b=EUfOQntDzvOfDm/28cWUKhPq/gUgABZasO4A3Iii3ymaWfbEX0rJZ7Jhjd6ISqZLN/
         BRqZjcG1hTd52Dl/T241yxIeqI63r0OvHQoD3Gay0irL6NoxLP+CT/FPmUnYpaEIgg6D
         BJibKbRHd89RwoRt441rkvWHPdAoInzUJh/eLbZSDWZrl1/ftC++u/KelCxtTtG3Zfvg
         i9Ob9mrG0Bw6UO0NcjJtbDFSBCA4quM2S9AyLHmpS+eqhMIIh/lEdHh8m83TKGZnEhAm
         9Mx2xO8gjEWd6N5Un+sLeBy6n75sn4zl/Cy+ocGndkZK84sehSpDZ3/xyKOLZb7KO8JS
         ysrA==
X-Forwarded-Encrypted: i=1; AJvYcCVzf6ZcdW1aX9oHDIxQdVWZGpf83c5CeV6GCWMXyQFwLWFXSjta4RQBBqNrNZr40dV5YBadiXuL55U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGyY3ZZ5/QIIaq+jcwQKNmVXI042vdlkdV8Cztz7wIaZxzqfYA
	KHQ5zcG7t0mo+Y3aPvwFvutXd0t83ayHr9K2Rb8y9AUHaaTmB78qBVwELpSMv8cncWc=
X-Gm-Gg: AZuq6aKW1vS/Wsx5rkuV0UtwbgoFgeSmm3sRWNDREAJjxkfPjekfPWmlWurKsxeBs0m
	bA+cplN7qLfYCAnjVI4LI73krHRGbxiOWgqAO7TA9mxqSzxOHh/Jt51GTRHEOMThco44Sy1oAUV
	+a4nnWRHIa9P/9uQygD7bgu+lZbj1Lh4Cm9gfQAln2W65nBRLsShzLGfkL0I8qmGChacLjm0wzK
	oFUn0k/absedKehv53GNCS4qQoa32N4Zq3WPSENCjeKrW8IVm4mXlp1ewxLXt23Ng05ZVmQooPS
	iJuNIx1DejtHegCkUZ9TPWpVy8XCvFUBYtE+RGLFJ+euRTETr9CSXce+Wql/AA43r8cQMFp6xfN
	TKvEUDdgpSrfRbc9ZR0Felh2RU97474b7uSJkVMBfuX9hOHuDsDKTv4EGHaD+gYNHh55/SepouY
	WlB5fdFONZWkPW7VeaJSyoXcMNN9/aAg==
X-Received: by 2002:a05:600c:8b57:b0:479:35e7:a0e3 with SMTP id 5b1f17b1804b1-4832021d9b3mr30466725e9.30.1770369671987;
        Fri, 06 Feb 2026 01:21:11 -0800 (PST)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d8341csm109643915e9.13.2026.02.06.01.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 01:21:11 -0800 (PST)
Date: Fri, 6 Feb 2026 10:21:09 +0100
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
Subject: Re: [PATCH net-next V2 2/7] devlink: Add port-level resource
 registration infrastructure
Message-ID: <oh6xvllidmtqx7wmsbmvghc7zeokvvgwkj2kbt7erwhn6jt7r5@gl4knllsp35u>
References: <20260205142833.1727929-1-tariqt@nvidia.com>
 <20260205142833.1727929-3-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205142833.1727929-3-tariqt@nvidia.com>

Thu, Feb 05, 2026 at 03:28:28PM +0100, tariqt@nvidia.com wrote:
>From: Or Har-Toov <ohartoov@nvidia.com>
>
>The current devlink resource infrastructure supports only device-level
>resources. Some hardware resources are associated with specific ports
>rather than the entire device, and today we have no way to show resource
>per-port.
>
>Add support for registering resources at the port level.
>
>Signed-off-by: Or Har-Toov <ohartoov@nvidia.com>
>Reviewed-by: Shay Drori <shayd@nvidia.com>
>Signed-off-by: Tariq Toukan <tariqt@nvidia.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
