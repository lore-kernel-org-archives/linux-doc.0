Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDFB5234
	for <linux-doc@vger.kernel.org>; Fri, 25 Oct 2024 01:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729820017; cv=none; b=QUVdBhpf/F6bwvQR4fpuRQy/Ldap7UigMp/NlI0e1ReypamRqpX5T3Krp9OTWSpW2UFS0A0HIx1Bw54FuZVasUFO0PuDGKNZ/p1+TCsHXXUtuV3nbfEgVjLA1LItyubGoRC7WJl9S22bLWAt6FHKpPI/BWtyeg8noSUlf3AdfYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729820017; c=relaxed/simple;
	bh=52QRq8hygu5PMDKS2MH6a/Y24KdWAkWnn2hippVQ7Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzr6iG+hIX1Ly/cbaY7+HxCpbWi7R69rg2O6vRtD4c2WRTnKq0DKlJoJVhgByoOPTe6PshGNrCNHFJMMGP5l0uKdv26F/Ha7xf7q1Ahj46me+J5GV8WNkfOcxH4TBIDWmiirkyh4kV8eW0cBulf6pLPvK57vED5H29WSmkeS0Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RGmI6tKR; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RGmI6tKR"
Date: Thu, 24 Oct 2024 18:33:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729820012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w3cyFDDl9Fn7myhSdVnKeGIMsM9Cumy3wrd3akiTWoU=;
	b=RGmI6tKRO283K/VPcEyaGbgj6d6o/79ispGa/A4c/lTmtS+WTBqQ+UGcPGb4fBSRUIZgOI
	IFHh4PFjVOPE9ppsaV5R4c+rqgECVqvpcRuJezz78x1C3oxSTlw5XXyOok2IhVQFgvSI/7
	3p7/Rl7oWOD3WDoUSn/9dk9FFc1R8b8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Hugh Dickins <hughd@google.com>, Yosry Ahmed <yosryahmed@google.com>, linux-mm@kvack.org, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Meta kernel team <kernel-team@meta.com>
Subject: Re: [PATCH v1 0/6] memcg-v1: fully deprecate charge moving
Message-ID: <isidrym2cm6qshx2t6v5vvatd7vmyrd7ve543rgy4ddx4csiej@x72hqvpkkwfi>
References: <20241025012304.2473312-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025012304.2473312-1-shakeel.butt@linux.dev>
X-Migadu-Flow: FLOW_OUT

On Thu, Oct 24, 2024 at 06:22:57PM GMT, Shakeel Butt wrote:
> The memcg v1's charge moving feature has been deprecated for almost 2
> years and the kernel warns if someone try to use it. This warning has
> been backported to all stable kernel and there have not been any report
> of the warning or the request to support this feature anymore. Let's
> proceed to fully deprecate this feature.
> 
> Changes since RFC:
> - Writing 0 to memory.move_charge_at_immigrate is allowed.
> - Remove the memcg move locking in separate patches.
> 
> Shakeel Butt (6):
>   memcg-v1: fully deprecate move_charge_at_immigrate
>   memcg-v1: remove charge move code
>   memcg-v1: no need for memcg locking for dirty tracking
>   memcg-v1: no need for memcg locking for writeback tracking
>   memcg-v1: no need for memcg locking for MGLRU
>   memcg-v1: remove memcg move locking code
> 

Please ignore the patch at [1] as it was resent by mistake.

[1] https://lore.kernel.org/linux-mm/20241024065712.1274481-4-shakeel.butt@linux.dev

