Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3871DC734
	for <linux-doc@vger.kernel.org>; Mon, 28 Oct 2024 14:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730124021; cv=none; b=Vc4M9n3HnSIQQ4F471BEilt/fzSKegKEZrcFXr3gEkLwNyUNKHsMd0+DMtfF9e3cS/+gB0ghc7Z2/gmv6ODc2Vm/IbNZB+GCGBBCaj8XrgK6cu5GhsewaGuq5wUmoQwgp+PIcn6+rUuVsxU8QdV8zyktOYAdX+ygGgnk8ZObgSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730124021; c=relaxed/simple;
	bh=v2HK0A45xfCW6LF3YFD2TPmEq4ihQfGG/Qxy38acCAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ss/nPKXM1y/IhV2OE3wM6uoxlB8Rq8GNz0Xr+YVmnjkNklJYV15nzdE3D/xCh6SbFpEixsfiJkBVFkAkYKxUPD0XMM48YrwpKJOXb4hz2WXwKHsURAOF3vh73zhg3G1/F2XTsGjHIOrE4aOdGvq97d8Y+AQoPRsZ8UYLDS9xvWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=aNe4lK9f; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="aNe4lK9f"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3e601b6a33aso2494769b6e.0
        for <linux-doc@vger.kernel.org>; Mon, 28 Oct 2024 07:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1730124018; x=1730728818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FihaM4IoEI/TwOyPoeUguS8WS7IqmB9x82K637EGe5Y=;
        b=aNe4lK9fRYs0brgi0ZiIPyRw8NmUo0obkPXCawojqJlIMKj/ka38Ak0yvj7cXS6rn+
         Aslkr30lDPMowwatyN1o8R6nLDEE2Iptq+JvpIfHgLQ06WztZ0Ej91IjhGRXMVgmazth
         1c2ru7VoW6pOEf5n6ho4RLcA3aoOMuDdAYB5rH++aZ7+F8DDM2X2StdcJ0ksAbBzH/g1
         TUp13wwYymwEa/oGDc5avaEQWbQxAef4xkIgSUgqv2r2gt4LSjduLYpbjEca8iXgWNJw
         nyc0XOw1SgCyV99O5388VKEtKVun3p9OtdOpB1C8nQPUobFjmcceqSz4QTtz3YVHsHLz
         odhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730124018; x=1730728818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FihaM4IoEI/TwOyPoeUguS8WS7IqmB9x82K637EGe5Y=;
        b=GjVYuIXc0LlIvKPfBWowsezP4xye3qglEskXFot+5l+bmNMkbgEA/3J8qze54lBHl1
         fXiN/qg1L6O/c3lVI52JVxTQGKlDDv8EMpHpcPjVmWxH3VqDaIfsPGpmnSNHmg1DYVph
         V6wr0YroHE6gSjXxtaefZKe/MG9Fp7ieLXsRHuPBD3GGl0dksHJdbERDETANy7z69iVd
         h33wga9aiafGvwEV1vPS1c5wOrGZYqEW28AQbf55lNGZs1QQxURioxp7Y11tA/S1LQDU
         7AzhhUuqmHXi6yaTgAishCbj/jvOBoUhV9k5hDc7xy9Q74eR4TvSVUaCyx6ZNUxCeP1i
         biLg==
X-Forwarded-Encrypted: i=1; AJvYcCWu2EwknriG6G4lEgqliSU8ziACKAbLUagE32fkZoQoa7Dd1KuhxfKmt/Buuf2N0CAbmfDEMSBUaOI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYBWJaS6+xFPlqtX7wjBOTwoaZJ1XJriRWsadBUojGMVoKb51m
	Zh/dgJEHRG/LYMS/XRg8Ug3pQa6MR7wYCikovKexM2X3pF4yJdMFD/fNK3eOkQY=
X-Google-Smtp-Source: AGHT+IH9co64vboTin+h8OS63UgFbBeD4w6rdjM3nCxgpXXvLvMDezoy7l2Ep0U63nuT2u+Cay9MJQ==
X-Received: by 2002:a05:6808:444c:b0:3e6:4c48:8942 with SMTP id 5614622812f47-3e64c488acamr1321455b6e.35.1730124017959;
        Mon, 28 Oct 2024 07:00:17 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d17972f5d5sm32494226d6.23.2024.10.28.07.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 07:00:17 -0700 (PDT)
Date: Mon, 28 Oct 2024 10:00:16 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Hugh Dickins <hughd@google.com>,
	Yosry Ahmed <yosryahmed@google.com>, linux-mm@kvack.org,
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
	Meta kernel team <kernel-team@meta.com>
Subject: Re: [PATCH v1 3/6] memcg-v1: no need for memcg locking for dirty
 tracking
Message-ID: <20241028140016.GC10985@cmpxchg.org>
References: <20241025012304.2473312-1-shakeel.butt@linux.dev>
 <20241025012304.2473312-4-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025012304.2473312-4-shakeel.butt@linux.dev>

On Thu, Oct 24, 2024 at 06:23:00PM -0700, Shakeel Butt wrote:
> During the era of memcg charge migration, the kernel has to be make sure
> that the dirty stat updates do not race with the charge migration.
> Otherwise it might update the dirty stats of the wrong memcg. Now with
> the memcg charge migration deprecated, there is no more race for dirty
> stat updates and the previous locking can be removed.
> 
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
