Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C03389E07
	for <linux-doc@vger.kernel.org>; Thu,  1 Oct 2026 13:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861170; cv=none; b=iGnLHCQYEZjc6tYRt4Nway99L6rb+qkFJvCSBdIaYwFjeDJtA0I+ol/h74qTBhBNVmPFllUpHAKsSp7VaJeTjUGMj/xhpGIn1rH9WrKQ25nD/pBTuTpbPNK69sEttYI7xxc+t6B5m6Bn/dFhTMXaOKF5vyaceW45+5OSQtKBRF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861170; c=relaxed/simple;
	bh=ASd1S1qQ49fEQp8HALzVs+yB7/ulU5Tcnt2/SJGQYMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JW9K16LmTkDWjHg2+EHnY1HPRbO5OLpdusg3HIxZeNKMvAKo52PUsfawfHDQtlVTMviasbXBOmsTQZQOdqJgWVH67BW4/XxO96mmaulWzzGk+2FYr6l3EU3LiDt9wergcXwkjQw+9Rb2d8xhEy9tGEaqT1hijLQhueozBBudS3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=LM4yJuLo; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="LM4yJuLo"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af9f88c95so903597f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 01 Oct 2026 06:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790861166; x=1791465966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1U7rCP2J1UR7XvChQyXqCJWaXLGRfuecEUSlZ8WyOlk=;
        b=LM4yJuLoNL6+u5IzkUooUlEr1vzWbopo0MxKOnmOoLle2O53r3hPVkGx0mEHOtkBzj
         +ypb7pZNIe/rTQTPYwmlSueAfykkmiW643NXszTqwcDEfLnEgNeSx+C+mpeWYWTWNnn7
         0r5y6Ku1VDFEpK1u7WAJIdyrR3n76v8w8vHIB2eZ4xrDcUKlf8VqpVxKZyNibTszNICL
         vkxJtT7PgKWFP7xPdbi7kVjuT69PG8NX0FgN+x6mI+9yhadzmJl5Mj49h2OMs46s8YzX
         l1ja4Dmemy03+Xc4Y0W4TZETspPcuyqlWNmbKtJppagFCfZw3zduoRvYRpx7C1n2D0Z5
         i2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790861166; x=1791465966;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1U7rCP2J1UR7XvChQyXqCJWaXLGRfuecEUSlZ8WyOlk=;
        b=tXLq57A5FEzDNIAWTOuokHR6BrTpdLcjhecGGSQq+CsiM0AoynZLzLMdmvVzG+rwGD
         XAv4BIPKORNsnhbpJ5+0rEv5jsgspGjSyqFevYeZTz3aVP3mrJY+Sd28XBv9gPlKjTrt
         vb6cUN5GyY6p75qT+NUET8wl9J106T7wJvMBwrPWf8sMNSzDPdwYmwxJrlMVW46G30WJ
         yw6OuoF1adB5VVk5bXJv2q8Hr3PzUfWk3By04Q7IdxZ7JlLnV1kF6jdsE9HY3hzk11jc
         2kYk7g5rmh7WroFbM2kygw1Eh5DflehvVa8eOBv6VSquxQRu1V12iHMlmy4v4fwCsfiI
         Va/w==
X-Forwarded-Encrypted: i=1; AKwUvBwm9rE6wjBUoCQ/59c2zL92JlQcsMi4FFWEe5eBqRAuqyZpjyS/7u3qACDYT5oei+uXQLsdODuXsZk=@vger.kernel.org
X-Gm-Message-State: AFuF++n6RXrndXPHmHy546YiQ4sd/TP5kbXKOhK2ujfOLgV8tkc9paOU
	aHp1FnJNXztxAxWBPqO58jXUh1pRDS7mRGmzh/PmcuSSKyFmAYopLx6FDmXpamHtL+Q=
X-Gm-Gg: AYBFou1t7jM8GjLQFTOTZl3OnlfN7tImxWc9UmCQj6Dc23tfTmcUqq3mY9MZikHQhK4
	SfPEgrgPzrWy7EuMq9bsM71Nc5bCdciabK+ZF4JZmWCQfJ+iVNoD8DxbS014bwc59vH5rRLDxmY
	jp8sQA5FatjuX2EFYTJDUdfoQRGPlT4xhVLCQ9u7755xAK53bwwHPCZ2UuXrnwYIHziv8MusfZ2
	H4VjjyxE1o5KnOrCOryX7kkRNZxrIXsIiLPsjeNbVzsNWkU0nfcoB2GhOfcv+jNU0dh6Z3GHvXz
	y9I6sP+ejgTba6Z1sKKOKfD4jnIbNPNhD55UGYxTpp0+VC7Lt+cp6uEqIXJX9rONdotfPnrlLAC
	4kbu7a9E8pqJRdPi1zL343jWJRrYfz3AF+4nUBGDw5h9JuGg3GSFcTpyJ81QsxLozCX9fuzFv8H
	CLQ+Z1yUMF7t62rjUy8k3ZyxbVRyQse4MrOLXRPxlL9k3oofDqhJ0T4GehKUTywIIf3HvGiFWqh
	k711Q==
X-Received: by 2002:a05:600c:a107:b0:4a0:1ef1:b62b with SMTP id 5b1f17b1804b1-4a01ef1b7ebmr36180515e9.10.1790861166322;
        Thu, 01 Oct 2026 06:26:06 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c092:500::6:7dd1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f93ad0bsm47435175e9.4.2026.10.01.06.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:26:05 -0700 (PDT)
Date: Thu, 1 Oct 2026 09:26:03 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>, Li Zhe <lizhe.67@bytedance.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, akpm@linux-foundation.org, ljs@kernel.org, liam@infradead.org, 
	rppt@kernel.org, mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/numa_balancing: allow migrate on protnone reference
 with MPOL_WEIGHTED_INTERLEAVE policy
Message-ID: <ar5eC22VfSFlMw3W@gourry-fedora-PF4VCD3F>
References: <20260930121154.687586-1-joshua.hahnjy@gmail.com>
 <2e3f12b7-0dac-428c-b70b-07e1f63de028@bytedance.com>
 <ar0fURbLDPrphYMY@gourry-fedora-PF4VCD3F>
 <A005B05D-A85C-4153-A65D-0BDF9D8500DF@nvidia.com>
 <280965b2-c6eb-4f01-a0ac-c4fb7e518f97@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <280965b2-c6eb-4f01-a0ac-c4fb7e518f97@kernel.org>

On Thu, Oct 01, 2026 at 12:54:22PM +0200, David Hildenbrand (Arm) wrote:
> > If this is a initial-fill problem, can userspace set weighted interleave
> > initially? The program or harness can observe memory usage of the program
> > or related NUMA nodes and switch the policy to numa balancing via
> > set_mempolicy() or mbind() without MPOL_MF_MOVE after certain threshold
> > is met?
> 
> You mean: use the weighted policy initially and then switch to a NUMA-balancing
> one which doesn't involve the weights anymore?
> 
> That makes more sense to me. Although I struggle to see why an effectively
> "let's put random memory on slow and others at hot" is a good starting point to
> later let if be fixed up by actual balancing/tiering.
> 
> It all sounds a bit hackish. :)
>

It is a bit of a non-combo (Nonbo).  You're using weighted interleave
with the intent of spreading out the bandwidth utilization (and maybe to
offset some reclaim behavior? *shrug*) but then undo all the placement
with tiering.

But, in defense of the hackery - I have seen strategies like this work
to optimize startup times and then let tiering optimize runtime.  Phased
execution gets funky like that.

~Gregory
