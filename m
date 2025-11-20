Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212D333EB11
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 14:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763650553; cv=none; b=NaR7WgKaJ5geS6BY8cu5QciWzoIWox/7JvA+EA7zAGoOaOuczaeRsJkErCigeXSHc/+VpeoTLvqv5t2QsLZmgWYIu5r35Vh1C0sQRWYmScoihzihynsMier3AJJalVCyfpaqCJ6nXmAJvbCNgiO6ci9Acw9/9WF/hkCx9//XVvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763650553; c=relaxed/simple;
	bh=/vmdzwx7YN43hL9gWUoErNciVUby5yb1OVF6bW03qbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O5i/PcitQSkExdlPgtRqSN13PlnBlV8GE/qL1mGZY7LxVkanNejnbw6E5FTPVr4ROyAD8lvBiQ2ZKblA/7GNYnFyf7Bj0qICcdMCJ0RYp+78/fLDjpZVY5dztkPB8js1vH3mVj1v6hp08RSEStwgJXxQX4vTyA8CJl24h1S7450=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=fqj9j1Pn; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="fqj9j1Pn"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b735e278fa1so200556266b.0
        for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 06:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1763650549; x=1764255349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tB3yAJnsR+u7PKfvNjCtD0cHNrMrenN9Rj7f1nqALY4=;
        b=fqj9j1PnjwlnVl8sVigH81WqTfw5pwX+zCldx/6jekvsGCpJihckhoDrJTZBJ7gZor
         sZtVtmdEKLlyXl8dBNZ5LAZXmjq6KQAHJQBZjWrMsfxNqFehbbnxmOmzU7mV9zNFyIBy
         VbPQYw+AmeKJGCanD7qlrWQuUKht7PuzFNfy9s/vEbPP6oMw4hisOHczkDO9yNiNQgRK
         bLNorx0c3qFFGqDmkJY0MxAXvIboSPGhWFsGL6XFee2fh5dgqmbkYDdSQYmA+a/0zUF5
         He6IpAbAcNWsRsX697nIxgvE8UkEwTW+58DeZ00zvlKPdsfBsXGE+DRhKIW3Fz5xc90y
         Y6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763650549; x=1764255349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tB3yAJnsR+u7PKfvNjCtD0cHNrMrenN9Rj7f1nqALY4=;
        b=iPkCykPQpfaQ7fqRZ8zMYCcbJz4paKeywWmMO94ROCbznoPFdS4RJoZso0auF97e43
         vXZXgNduesFwF+wqM36uWZFLbBzGLI78P+7YQeMAgFDr9UfAlBgvTMTBeZoDAj2jAXYh
         7PIeJwuUSi+zke6mkNnRXjGCkR1+5iqtQJiXaHsPO4cqCtYSO+zVZBAwyUDMIgYPTkI8
         aORpFaQk9JfakTOExIdRNfq0Ptnr8BEFE5DMYakxPpfQXpwSow1oGHArk8x9gIImKSm9
         /RCtZ7+ZH32LL4TVYmtk96m1iVC2rSvEdjK9dGvu50sG1M6UHYZe35Uls/wpyzE05ZnU
         mCqA==
X-Forwarded-Encrypted: i=1; AJvYcCWAvxSTK+1SImwMrWyrxcEx+TmuNKd0Ty0yHvXnKhclnWAHhArTNqmMIb1wydVFZoCLltvp20Az4vc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+WDLytz3n6YJZBac0W07FKzJGyJtNNXixZbmG0lNV32sAYfmi
	XuldczXJT8Q7OvDaSwF0y4y8xI+yMz0UMgDnjU2b1lV42EGOPz4hsbcfd+Yj8d3PHTU=
X-Gm-Gg: ASbGncsVPlEqbQh2VTfQuQWseKRJpLHd28ixlzUhH5gQqmeIYt7scY0FIj9HAXUWtbE
	5LCkYCqtB9bz3nemu3N0Qg/KBPJWqHaowB4yvG0Z+Q1VM6RLrhf4o4rWkI17aawdfZFA1FKzQat
	lnCxFnX5kosMqUiM7VE/83ysatMvUykU8Xnl5AMNP6MRrZE7t2BS7bzH6IDNkA1oVZFcxnCGOvt
	QSDBvmvrP4hxnAFjqn4QQtcR8UBn/AdqIxp+6qEJDA9iXwzkKyLFpyuRFHVCcKTfaKc0ZC1JmBw
	lUuTcLUaEPaDWyNPZcFT8MH08J1p7n0nakF3lJe2xEKHzjisYflcbyOjRSVwL7fSxeXkmJjKLMz
	SKrtpU3U46t9iO9nhRCmhar5C4lmxbv3Oe7etSPOFI1YGj+43NeVe2cpjWmQh1LujB6gd4O1cJA
	F1JT56PiUvqosG3cjGeQY=
X-Google-Smtp-Source: AGHT+IEkw3ELDAFGw5UHVPLRHfnwkakgGWj/7LG9KJyXkQ6oXNY/brkJ9zjTpg5jWHAWPcFd74rMYA==
X-Received: by 2002:a17:907:3f0f:b0:b3f:cc6d:e0a8 with SMTP id a640c23a62f3a-b7654de0690mr359237366b.17.1763650549210;
        Thu, 20 Nov 2025 06:55:49 -0800 (PST)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd4e6bsm221729466b.34.2025.11.20.06.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 06:55:48 -0800 (PST)
Date: Thu, 20 Nov 2025 15:55:47 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-rdma@vger.kernel.org, 
	Gal Pressman <gal@nvidia.com>, Moshe Shemesh <moshe@nvidia.com>, 
	Carolina Jubran <cjubran@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>, Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH net-next 08/14] devlink: Allow rate node parents from
 other devlinks
Message-ID: <cg4wyb7lvawxouogcnk3dgoeielcfpsbqycadp5ohaaifgjbtn@fyvhyk2zj32e>
References: <1763644166-1250608-1-git-send-email-tariqt@nvidia.com>
 <1763644166-1250608-9-git-send-email-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1763644166-1250608-9-git-send-email-tariqt@nvidia.com>

Thu, Nov 20, 2025 at 02:09:20PM +0100, tariqt@nvidia.com wrote:
>From: Cosmin Ratiu <cratiu@nvidia.com>
>
>This commit makes use of the building blocks previously added to
>implement cross-device rate nodes.
>
>A new 'supported_cross_device_rate_nodes' bool is added to devlink_ops
>which lets drivers advertise support for cross-device rate objects.
>If enabled and if there is a common shared devlink instance, then:
>- all rate objects will be stored in the top-most common nested instance
>  and
>- rate objects can have parents from other devices sharing the same
>  common instance.
>
>The parent devlink from info->user_ptr[1] is not locked, so none of its
>mutable fields can be used. But parent setting only requires comparing
>devlink pointer comparisons. Additionally, since the shared devlink is
>locked, other rate operations cannot concurrently happen.
>
>The rate lock/unlock functions are now exported, so that drivers
>implementing this can protect against concurrent modifications on any
>shared device structures.
>
>Signed-off-by: Cosmin Ratiu <cratiu@nvidia.com>
>Reviewed-by: Carolina Jubran <cjubran@nvidia.com>
>Signed-off-by: Tariq Toukan <tariqt@nvidia.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
