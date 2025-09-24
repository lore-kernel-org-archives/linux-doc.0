Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BD523504B
	for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 14:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758724974; cv=none; b=mYzPipybbLc4mKa/62zX2VQ6M1oswDEeDRVusvijBqz50HLcMBE3iQvw6nt+CDTmiS6B/Vj+abWFTJkcz1dCp7uZkEBQA7FJ2g4oQxkrjYNsjoRxbuAzhTxSbyTjjR5Ln8/I4beg28yOq0IvqqXfSmJLkKx5ED0F4oCQxVs039U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758724974; c=relaxed/simple;
	bh=Qi99wGIzKeaUad3sDiEcjysh7dML+0H6SlWCfVtNMOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9v3ros02gizm6hlOfnYfan3cYTEtXMDVLw/ihPN48ISEGarU2+WsH1yDAqZAbW4ezeNWrCGirOoz6Y+jpvOc+1MTbJmI6gmoHMTCPfxZkSJOlfPWgertLKPv9seW8PaDvo4VZHOmZqbIrcyVub3r2/j9SGQjbebaVW6HaEWDK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTVQnFUU; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTVQnFUU"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-77f1f8a114bso1026825b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 07:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758724972; x=1759329772; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qi99wGIzKeaUad3sDiEcjysh7dML+0H6SlWCfVtNMOQ=;
        b=PTVQnFUU79O8vzgqZhmtnLZh5W+Pt0eadQ4Fi8HeB4uItw4NdFzlljwmzYjmsKgXI6
         WTgCJj88wWhKOQ2XbFxeVvb3onp87FKVMSZ+JcSs4IQ6/eQEwlE6bds3Lrl+Kp0SFnmb
         ZMAbEvESwCROzyLqD2AQtWSBg+Op/MaZoIkU3Gp5GSM3aKSuVWm8d8y5nOclV8/gJY+b
         W+C9uQIe3B0tPsjt9gfFcUHUcu5qAtqGyKrAHGUv4SCSQZnFaZ01Qj83wX0Q40DKixif
         l4G5DSXEALcIIL9sdDAsGIWHk8Y7Ot51SDcGMhF/4ElwxCbAg5vrcZOlFNnm6nwIqVBz
         yKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758724972; x=1759329772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qi99wGIzKeaUad3sDiEcjysh7dML+0H6SlWCfVtNMOQ=;
        b=jfImjiV26bMmPf9KFBHk8fnoB8rMga9B8WQZeiHGHS3XgMkqi6nqROG2gnznOzVtik
         CrO+7pBdBEFc2X4DAEaCP6jkGsAO/s8ZbluNkuVQxgmuxmkUyXWzNgKEziO56/RwF1+V
         6NlTvQTtK82/MoITv2ttYxNy7RNVOKiS5N3HxsfTrsSl1M6At0+7eqWADEoqAdbHduUU
         0nb2sTVga2K2rfXTpB2uhIIofwFhDipKrMW9WMlqGpuc5uwBq8zvBpVg88LLnwK7N+fe
         lk3KsS6xjadtsqrfRQoPNezXGJiPdKtiboPdAER7fUeorISHyxe7JJ20Npw6lNy3sSyP
         pZIA==
X-Forwarded-Encrypted: i=1; AJvYcCXoESDTTaWK2kMomlGLKu/ITugdu+b8+NIzVgJFDsLGViLeszWuBbZ4c/r/iXUApO/f7ZsIxuGx5gk=@vger.kernel.org
X-Gm-Message-State: AOJu0YybpMgIng/GL7BxuNJT27IgnGQ61rNxC+ijkk1/6ytmtjUdrZ5y
	j9XbwZYjYtzGyh4CxdrmupP7zFSq0vdTHCkgI8vqKYUC120VZRZv3Ad6
X-Gm-Gg: ASbGnctOZlvlfrYgcUg4MIazwgODeBotk5e0Z//ifUwci7AY1pgQkSp3rtkVYCv52N/
	CC8hWANPpYyAN13cVKZ3CbcVgYyY7Oa6KqGO5H7XRVa+bEqVFQPjXKmLaoGC0qOTI3K5wGFUEnF
	GXrgmcRmx3lIK5jLWiRD8VvN5Jv54+HiTSrlhuoCbvxWQE+bz3BHqbjDwQbexv83IDW5xW5KUuW
	UJXL7eXYyp/vt9H6tZFbTqWS9jp26R1NVshE0/cQvFEWoPopcpTer5lhMzKsXCijdBQ52f1MjLO
	Y9WuaA8/X3yfuR1pUO8T9tnfo9rOUqBElXVANA2a2rjXPQKHkla17txGe+521waBGQwVYxlkRVM
	0eFmJGqIdKMQMoMlXXpx6BCRes/0OJPdipdo=
X-Google-Smtp-Source: AGHT+IGh3h0E81Q1ukwkM0pUlfPxVBz9FgZBOD0oJJn4La63+Ve2DMvTsoHX/t4ygfBSH0SK7iio+Q==
X-Received: by 2002:a05:6a00:2344:b0:77e:eb28:c59d with SMTP id d2e1a72fcca58-77f697803ecmr2756206b3a.5.1758724971968;
        Wed, 24 Sep 2025 07:42:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f61ce72ecsm3233549b3a.23.2025.09.24.07.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:42:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 07:42:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
Cc: corbet@lwn.net, jdelvare@suse.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, wyx137120466@gmail.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: add mp5998 driver
Message-ID: <5f651f3e-202b-4406-b438-421489b874db@roeck-us.net>
References: <20250923090926.619-1-Yuxi.Wang@monolithicpower.com>
 <20250923090926.619-3-Yuxi.Wang@monolithicpower.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923090926.619-3-Yuxi.Wang@monolithicpower.com>

On Tue, Sep 23, 2025 at 05:09:25PM +0800, Yuxi Wang wrote:
> Add support for MPS mp5998.
> Signed-off-by: Yuxi Wang <Yuxi.Wang@monolithicpower.com>

A separate patch was submitted adding support for this chip
to the mp5990 driver. I applied that patch instead.

Guenter
