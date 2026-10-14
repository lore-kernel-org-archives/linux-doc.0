Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDE352FE53
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 13:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984666; cv=none; b=tEwxyUnPUUKfV2AWLWACDj0V9iztqBTHcSwFYsNAXLGJ/dW0AqeCIPW6d06fyISIPdNBD0KTqQ8YQ+5AX3tC1MqxcGO++BQhhdrn7azUzBIYVy6h0FmP/wdhY3+NxSFzJTJS4pPgBcEmBpx5vKVHBxZwl9C7kDT8BcsjOCCn1qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984666; c=relaxed/simple;
	bh=kcR/y+XC6oHFlqawXzCOGRhP8B7C74cHje0W8OEDkG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INM7jea+KE8pUfFuz8UdLCFdHTyUnJ3rLI44/j32SlvL8Ha5LN6ZN9LSxAEdckXk7ahgMdDh0jELKadlLJ/LcOuM64bcyoQzHn0cIRujceZD60wpNaTy/W98kGVDI+bZbyQkrRXZqCI6ASC5a4kNhfufyoOqbtrsaRQLVKhGAdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=gvqYi2LH; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="gvqYi2LH"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-53394bffe0fso11117351cf.1
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 06:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1791984660; x=1792589460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yl3/HcMxKzbLRx25aj5CEBdDsA+AcBSsOvkZ317Rc8o=;
        b=gvqYi2LHG7Kuw4Mp5hmi2XN6tXQAmMRTqdD2l2oGH/yerDm0B6958prVJs5xJDrMv3
         1V0rwrTyx8Cppw4cUSBtslR4aoTTeOJSIhsZB9my04Bn8m40Ff7b+g09DSqM7gA5YT1p
         J5M7enDaoVQaXUSGbL6w+2m6EW6SNWJW7bh262yw5nXkGjO5pEgVYvEWniR+rpRSr/uo
         Sbfw5ljOTbSo5ZiQAcnJZrStiHOx55Ar+txdGiNP04SAcsnb2LCeiDtbpHmxxC5wqtdP
         Nia7G+OHfE9Iqz8j8XHQtgwVJVRNDfUp7g1G7ZVGD1CsqwCCpatOj5SHShooqUnzvtV/
         sqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984660; x=1792589460;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yl3/HcMxKzbLRx25aj5CEBdDsA+AcBSsOvkZ317Rc8o=;
        b=ayhVtJRJGCoGJHdSr2hSdelPrOPxt10zrRFJ5RsFkwq4YSZZJSAzU92N95ia82/Rbu
         yRKnNWOtsgD3zRPPQivONAfhHlCz5lm2cLPXTobQ0GqmjkoFmPHLg2BnYh3wA7haJMNv
         fSAdRrc0Ssxee2e5WjEOQjJZKeaiiPynqHihXA7KzQEku2RSU4PVYeqx5Fhh90MvDkkK
         /DVW/rYpKzbmoOTM2oTe4IEAiUPdfvWeHS7aTHEFHAam4Mv39BeGhcEZA7YCRIdK4KtZ
         tyVWpQ885EneJYhXNXzr83+uiytdeEfGuIyrpK6yt+bUTm75Wz9OpHIilIwEt2EuomND
         t9aA==
X-Forwarded-Encrypted: i=1; AKwUvByObqbEgapnqeuH0jXmIWL724DHU8qZKUf/giKYMT9U/iOr4jvizilYZRqi0ZoLMLr696XdfkkgQ48=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZziYMPIq1g6qv+0gTu4mPdFrJycG/avChuHGcl28oCb36vfnt
	dPwIn8VprKXwpAobyxMJjlbAfo66Q1prrJMl8kNqvTl4agMUVmBDt5M7hR4qxCaoHGk=
X-Gm-Gg: AYBFou3pyx3Ltxvw2FiAot2hHUCfJRiIEK8hgem1lv20BMdHCEWAJZoFJgsg3uzpNPW
	WPqfczbQJKC1MFIIMkVolBU2SViNUyvEje9otjQ61r2U/qtHyb1ZVYKvSFKPp3S7Y+0coTL4Ral
	pQBYlnKN74/2FtpW3ky+gVuqR9cxlwSw4AmnP4xXEp0LMHdS4nw00fMhSmIOnS6hegXSpxk+80H
	uzoPd7K4CJW+eifi6wug8JvrVou/zrGW+nV9Gs4qa2V96AFLLdwazYbUECVPCNpPM5DvCHk3nNm
	eKS596k3ZxrYVJL/mr2ZHmG6r2i2HAMYl4vP+bbvwNn9/vz4RQviEzMhewZSZFZmqlYKGII/UIz
	XexUOgpUZusBJ/3c1B+YablLkx7SM2Zp4dWwA8QliNPJ1dFdEiHB5LElcMakwgr8w+drz1hBcf2
	ctJcuzsLfBpKsRFjy8U4UFsL9IjzhFOp4eYlT/cHlzS8cH5EfPfjTORnPPVwHY/VhaNl4s3EyWh
	wEQLeKpegPDeZ06KRG/jk8VRaiII4zwMYRdXW9Wunl+xLKXlnTQMv8=
X-Received: by 2002:ac8:570b:0:b0:535:70b3:fa0a with SMTP id d75a77b69052e-535a6294b31mr232930981cf.38.1791984659743;
        Wed, 14 Oct 2026 06:30:59 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53607e1b801sm9569991cf.21.2026.10.14.06.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:30:59 -0700 (PDT)
Date: Wed, 14 Oct 2026 09:30:57 -0400
From: Gregory Price <gourry@gourry.net>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	joshua.hahnjy@gmail.com, ziy@nvidia.com, mingo@redhat.com, peterz@infradead.org, 
	mgorman@suse.de, riel@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 6/6] sched/numa: ignore preferred nodes without normal
 balancing
Message-ID: <as-D8ff7oXKX_CwF@gourry-fedora-PF4VCD3F>
References: <20261014094347.99157-1-lizhe.67@bytedance.com>
 <20261014094347.99157-7-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014094347.99157-7-lizhe.67@bytedance.com>

On Wed, Oct 14, 2026 at 05:43:47PM +0800, Li Zhe wrote:
> numa_preferred_nid is normal AutoNUMA task-placement state.
> Memory-tiering-only mode uses NUMA hint faults to drive page promotion,
> not CPU placement.
> 
> Even after tiering-only faults stop updating normal placement statistics,
> a task can still have a preferred NUMA node from earlier normal balancing
> or from previously polluted state. Several scheduler paths consume that
> stale state when the NUMA balancing static key is enabled, including
> explicit NUMA task migration, sched-cache preferred LLC and scan CPU mask
> selection, load-balance locality checks, fbq classification, and wakeup
> group selection.
> 
> Add a small helper for normal NUMA placement being enabled and use it to
> ignore numa_preferred_nid when NUMA_BALANCING_NORMAL is disabled. Keep
> the preferred-node migration retry timestamp update before the normal-mode
> check so accepted non-normal sysctl states do not leave stale retry state
> behind.
> 
> Keep the rq nr_numa_running and nr_preferred_running accounting unchanged
> so runtime mode changes do not make enqueue/dequeue accounting asymmetric;
> the load balancer simply stops consuming those counters while normal
> balancing is off.
> 
> This does not clear numa_preferred_nid and does not change memory-tiering
> promotion decisions.
> 

Same feedback - need to present user-facing performance changes to show
the impact of this change.

Sashiko also has some correctness feedback.

~Gregory
