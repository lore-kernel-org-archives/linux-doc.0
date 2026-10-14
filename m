Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8CE515973
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 13:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983812; cv=none; b=W1PVSvhf4lBlamUX2IbG2WJh8UoQHXPSVYOyXwJM156TwHk6uRaQlHC5AY6qGayzonRevNokgDIiou4YEVN+rO/DFFkbqNwqk4TJycqWbtdWB64DuE7nyCSQhgApMifShJHVBIP04sOnipSSDOUkl13qz5lrE7HSt8sASUqT8sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983812; c=relaxed/simple;
	bh=QwHHeZMXneJxSDoksv1dJPugBvPcayKnfUfOI3k3wGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrHyhToSb+n291mi/MUcX2xQMeNzTkz05CjjkMp5PBps8oMauXAg6hxPiaduXbsi8hEjv/Alp6qEXRs8XvoIuKp7/0I4FybCeTeLX145Ry8t6+zkB4QBlYj7aUkZ4EZ/MW8L0lQPunAM+XRXlp0nRAttJ682heL9ukx71jQjYUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=XeCnh2PL; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="XeCnh2PL"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-535f9de49fcso2216581cf.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 06:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1791983809; x=1792588609; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dCpsW6YU/0L4WqTH5RPpEDwn9rrogta3oLm9yXxgjmg=;
        b=XeCnh2PLoONHDYxryRhvWdMUOKOjW+uECasyvGDWLIw9SN3tuSGp4/rHXOrfkojrHf
         UoPsWVRBpeBn0CyRo2BBPAThhFM33SduMeE7/dfq749HPc3iKzbwGAKxIzijWOo8C7iS
         IOYbSFaQxAVZOJ1ERyXZMccEIZbae2xHCWBvROapCoUodOKEWIjUPuO6Ls/4XywYvbWw
         P6nn6ZL82x4ipV766rUq3ylvilYCO5HfuYbaafMEIKcH95CuhaHWU+xUHstTffG0+Yij
         kDNnN7zEDgJT1QZjUMkSWkfe5el2OXRuQGewibfF+8SPiB0ErjmM4v7GerMv3BdfdXHn
         jjzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983809; x=1792588609;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dCpsW6YU/0L4WqTH5RPpEDwn9rrogta3oLm9yXxgjmg=;
        b=qxwfxa09BbPEJCPJtAlLFMINlpvv32J9x90lFiBbcRshQjZgZC8CI8c13W2bfRp9wZ
         W0amjxs1KZgb2BA2luOXgEfB57Dm4z+chahLHZXsCV5UyXbq+/nwNAA8/wqqYFfq9RAg
         Jd3ONyWIx1UsNDkp1X2bT19Bw4fQcVOQZOPr43yHNQfRfmifL3QXUd/GUdyaI9ZUUggh
         AMiUtiPMsR9rcY7CWEwH8NbEvcUQXm5l/JnwoQm71maCXRKFa0qrtQGKpSbBIWF1DZ+z
         B0QDC+ObrEkbVu7DAzgIrORgt4d5CumMquqkYXOyX2TXo4PinuO5RZ8YqodnJ66/l6S2
         6z3A==
X-Forwarded-Encrypted: i=1; AKwUvByBUkHMSm6Qpjp8rUz0hSnhfd/MY6S1swLBFz8PyPBxQ2tuIBQa4A3bzullkYy75EzlE9GoaMLfib0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpIr4/fyzgEkaMux8jWxdSkk+uzsbsArBmhjsUgZUzgTFE1On8
	hZs4b3XnBAboDgFU+3zqetInYyRu2OOy6djB31oq0MRbkXxjSLq1fZwiYjqYb6eRqYg=
X-Gm-Gg: AYBFou0ThoX1GYjFRtZXmytiR0g5ZTtY53iPq4f7LRUaNPyk+uMGt5lFe1PT9XuXGgh
	CEObHDDHTMCoadvA28Zogftw7x16303XACUJ6wD6V95HZDOgsGxFlDHQsFE+xo21XPUQLCr7gJP
	ns+rgJFYjSbeJRG+K1Uq4DKTXfn+1AC/bVIpnzyeOldRo7SSY7NYRvd4hDj+/Af7G7jGa8qXrgL
	qoWCKej1fhZW4QCX9tppMpxFkWaIt+qB5B1M4cqM93cbD3s44jI1/8pXDdH1NBeQSTUVQbFWXcZ
	07JWIiwAs3vWZrEXLyMaebYHBAvvuzx+N9Wcvi6aMSTFt/DUZjwmqTxvTTtEzo5vGNSE5p1WB67
	NThPpuSksBKQChAhvi9QUvzxpIaAKui0bBmd8CC5g5UDXs+D5zazp3ibITFcPQGwL52J7q/nnAb
	dlXBrEiktqhsPAWR8udpRDTbv2598ZW3QP54qCPe1C/8Kznm4lqJBa4vaUdgiGaHuLuYUFCHO2U
	jSx3LzNpVjLyuutm9ynmsDhvep+gbIN53p4w/kckNJkrxMyjDh2tR0=
X-Received: by 2002:a05:622a:999:b0:535:958:b9c1 with SMTP id d75a77b69052e-5359f46f32bmr248930831cf.11.1791983809565;
        Wed, 14 Oct 2026 06:16:49 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-535f4eee7bcsm30668321cf.30.2026.10.14.06.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:16:49 -0700 (PDT)
Date: Wed, 14 Oct 2026 09:16:46 -0400
From: Gregory Price <gourry@gourry.net>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	joshua.hahnjy@gmail.com, ziy@nvidia.com, mingo@redhat.com, peterz@infradead.org, 
	mgorman@suse.de, riel@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 4/6] sched/numa: make free-space tiering promotion bypass
 configurable
Message-ID: <as-AV04p-AZ45-mw@gourry-fedora-PF4VCD3F>
References: <20261014094347.99157-1-lizhe.67@bytedance.com>
 <20261014094347.99157-5-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014094347.99157-5-lizhe.67@bytedance.com>

On Wed, Oct 14, 2026 at 05:43:45PM +0800, Li Zhe wrote:
> Memory tiering normally promotes any recently accessed slow-tier page if
> the target fast-tier node has enough free space. This preserves the
> existing policy of filling available fast memory before relying on
> hotness and rate-limit control.
> 
> That is not always the desired policy. Some workloads may intentionally
> place memory across CXL-attached memory and DRAM to use aggregate memory
> bandwidth. With the free-space bypass, cold one-shot accesses and bursts
> of hot accesses can refill the fast tier and pull the workload away from
> that distribution whenever DRAM has free space.
> 
> Add kernel.numa_balancing_promote_free_space_bypass. It defaults to 1,
> preserving the existing behavior. When cleared, enough free space in the
> target fast-tier node no longer bypasses the normal hotness and
> rate-limit controls.
>

A global switch for this is a poor solution for this problem.

Also, if the memory was spread out intentionally, it presumably was done
so with a memory policy.  In that case, if the user did not set
MPOL_F_NUMA_BALANCING - that spread is already protected because the
mempolicy overrides the numa balancing fault and no migration occurs.

I don't think this is the right direction.

~Gregory

