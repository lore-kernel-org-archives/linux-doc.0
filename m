Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F3024C669
	for <linux-doc@vger.kernel.org>; Fri,  3 Oct 2025 20:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759522610; cv=none; b=YWQtI5LcgqC6rWvyvzO7Gl6aI7j2i4qN3Pky5Am+WWpkBw8SAl9wa5XRJZPGog+V8v04ThZhGqUqqRhXMwVah23MBc/nbI0Cps2WrWaClq3JOmUv8ba8MlmqlM+mq/mlgUfXSmCia3TtKF0Wnr2nihfqE3dg96wC9oJuIO4T2ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759522610; c=relaxed/simple;
	bh=/IWiE/RhAElpq35FsJrpdQA7r7YbgyvBXs9jvKpEhec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BRh+S+hvCobfa3CsmN1FCB4NvPyQMaong5Pac+od/g5UQvPb8uEkHZ3BHvTa6pqDgJ30guRUUcOcLTfK03/f0JOJqhWQ+gBdz+oZHEZdkTbGByOIpPQTysVtsg75vnvWJW/m6wroCAjkUq7+/PC/eoJHwihv4u1yk2RgwQ5EB58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M27h8i5f; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M27h8i5f"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-27eed7bdfeeso34976475ad.0
        for <linux-doc@vger.kernel.org>; Fri, 03 Oct 2025 13:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759522609; x=1760127409; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cnSqhh3nVjPg1ysLaBq/Mv04H2RucMevN3V1v8YC3Ts=;
        b=M27h8i5fk7BkQWSbsDp1twCkzOQrqd6m+xkGzYPXOW/Ogo4aSw2vbMYaXfB60ztBdG
         I3FNWL8sFQsIXsOp/zRziOCPiC65V3cr2deq3eYcSI30IlHkOkDcHekwtfEEAoyVOEel
         1m9tPqszFkBTvaacTBnjR1r/BE1wcfRDl8hIICzyt6BT+sgt6QK+ZvgcY8Cut5HWYWMN
         sVRR9phJH7rIPUYtX8gNI79re2XUs4fdw9WJ1vkN+YM9ta13/FllsTBz9rM/f4fMIm5K
         ZSfme/BnQvjcUCysf8t8xw5uSX6BxriVcC6US27R6H5coi+jSURCxKujUbfFJ3mJOXY3
         kWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759522609; x=1760127409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cnSqhh3nVjPg1ysLaBq/Mv04H2RucMevN3V1v8YC3Ts=;
        b=k+0uKeYkeFMFMiLYJ8eWi5zmUEk/bhB2/JSdf702Cd6GGjpjTX0qF9HlxEq2BLDPK2
         hiPx7bdEiONw8JfgeSWYSuj4mzH/8uY6yHnLav3LuZRfxoedR50IGz9CfVHuNfTF2h5I
         lKCiKJLdTq/dCSqRtC8rLFOjN9xi28rn5hof6SAnJSqpsy7FwYBYMygzOBMNv7noCs5j
         GV7GPnC5GGoZ3wE3wE1kCsckQAYEYlO93ib/J70KKRsIzeF4bOzp0u6TJq4ddmkvlQwd
         E5Pybeplxvlc4hfzRYECg/GfECuwSmIdpz9Jl7Cn6ZIQGlrkrdVEVcDEvvveKOFdGowC
         p5eg==
X-Forwarded-Encrypted: i=1; AJvYcCUiUpMGGTuPLP9fmbtGHCWoRJJDBdgZO13ilBkDR3uhkgThzEnm1w7hEHmcnz5yzBrBtY/Ucp8A7kE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhn0lN/U5Mf36rM9C1/ZEQBGc/5u2mn5JdH6rPgWPmpgH6gWLA
	HaWjmXajnrqJX0HxGO5tfxqz8xv3aCCUqbuJYdKDpZS+dLi7vHIW4wf5w51WuWls
X-Gm-Gg: ASbGncta3cb1uJXBEb2xXDYXzuVpvXIGu0CTOBHjHbbZe8Cl/xEWZ0/jG7lNT2l67ca
	PG62FgmBlnMjRPGhkw4m6Z2s4SvWzgeBSKKM/OPjC3eATu+bytIMo7L6zfWO5LV1cvuEeOcmbNa
	SofEwZrMJqc1Pel/QfM+RdwLrT86VoaOBc0EuXiZW46RgWuKzUmzWqSioZGKuGJwyHgGZQqt+4/
	PTfkif9TzH6VeB5NBpT1GDnfilvZw2pRtwKWdi2WMt930qLT9LPlAxWtxIHm5McJfhJeBeOkL7C
	74upzd5+zUinOPltYGFTsG3vmEC4EPH88xTHILjDSneGCCzmiugU/Mj2Zv5iAGNJJfR/KJ95c2o
	53M8T+geWVrT5s3Gi6SaPuNipX/L7AijQZu0X87obpnn5VF6ttqQ2ui1PtScSZMFjNQl5Uw==
X-Google-Smtp-Source: AGHT+IFBDEunU77jVS2ValYwP9blJBMiAhw9k9jACRnAmsoi2kiPkVHtYHF+8t3GUbOdavDjlSNtLA==
X-Received: by 2002:a17:903:3c24:b0:24b:1585:6350 with SMTP id d9443c01a7336-28e99cc3b7bmr49861095ad.11.1759522608749;
        Fri, 03 Oct 2025 13:16:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d125e9fsm58541455ad.36.2025.10.03.13.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 13:16:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 3 Oct 2025 13:16:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Maximilian Luz <luzmaximilian@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (asus-ec-sensors) add ROG STRIX X870E-H
 GAMING WIFI7
Message-ID: <1feb709d-9c25-4c4d-8209-f84f5cb8641b@roeck-us.net>
References: <20251003081002.1013313-1-eugene.shalygin@gmail.com>
 <20251003081002.1013313-3-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003081002.1013313-3-eugene.shalygin@gmail.com>

On Fri, Oct 03, 2025 at 10:07:57AM +0200, Eugene Shalygin wrote:
> From: Maximilian Luz <luzmaximilian@gmail.com>
> 
> The board has a similar sensor configuration as the ROG STRIX X870E-E
> GAMING WIFI, with an additional temperature sensor header.
> 
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Guenter
