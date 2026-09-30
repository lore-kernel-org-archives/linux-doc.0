Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E843B19C6
	for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 12:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790771135; cv=none; b=gPSfF4S3+gHRP9wuDfPGm8/xCOTq4m6jiQZYFO8fY0/qsCLFnAXLexLlK9dxsTDrbTPe4I2n2829IQlL5yW9tw1A+uQY8jZD2yV6dsT1ZogncZ2f4IT2yFljnrwT2vxT2Mn8mY+6VF8I0AjwB5EywfK5n5KG27jUMeTTujhYnf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790771135; c=relaxed/simple;
	bh=zebZfUoPIHJt+rmMkSu7Jx8Y7uL+tCkoh8Qa3svfgI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OC559Ro0pLop0zpZGtg8uL0cnaRiiLXQwa1Il8FfFbACmAptWZmbkH8F3whoMHb2H666HkvDRlBKe6I1KBuTM6IGODbOouEWfDmjmigUZpVbr2eIetD+Frw2vPaWR0a2mBqEF6reWJO9GTGtORAiUBvqNFn8lsPqsFK/C7seFBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=dfimvSPf; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="dfimvSPf"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f6cf16bso3326004f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 05:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790771131; x=1791375931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AE3TJ96gqAayN6Olyj2FbVbcdzFNDjBGHX1lD/f5unU=;
        b=dfimvSPf0uU7lIqKTkdW3k+RzuVlsk2cZDqYR1JlXA+Jf1EDt8eHg7PnbGc0yiY4OO
         eQkpcbxYCBdRc1Z6TgKGPl+1cefpKtth7z+Vdb5cOCnjcaoSk4wW37zyqlKqxQUq/x3c
         5wXaYqc3yLM5sD+cH5+9vpXgGl5oVlC7OmaLWdvmhCDlfciB6N4riOw9gIcIMc40XptB
         qOnVB+xKnHHd2M/rHjN7ANu5qMe/VCcGD9+48XB3JmPsvQO/J+2V8xnbDuZxO7dProQz
         dN71Vsuo1LmMFtx/ErpIOuVpaeg/Exq0KSEPoZifn9WcCf17XIJ8jKfz3KTd4SLfgmcL
         kVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790771131; x=1791375931;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AE3TJ96gqAayN6Olyj2FbVbcdzFNDjBGHX1lD/f5unU=;
        b=BMLXSr4HUIdBq+O9deSczrt6GPG6/V+D4550VgR8UPnpyFnWOf1DkKf7agMmOdbH5+
         jWRt5qYj9hJh8g9B0+wU9oSBV8h3ysGSIsAJXn0NTtRrzpCSQZ7c/vCcQp71gfVkTCWZ
         77ISYgSVtl5mXap/rdl3R5mO14j0sZiVfLcYWiyL+CkHJudr7nUmyEHcEX74J5+KuGFN
         2xGWJtmkpUoiadGRm5BW3CUQr8qFaUzmQAcheqmDNAtYVMwKuVdj4AIDmgrL/Snb88+x
         SjzEojchMBqocywHgBYIAPKM7En5J+Pqnm9gHrS1GSmZ1FMbe62B0b9Qbe4XU7mK8J1r
         3ptQ==
X-Forwarded-Encrypted: i=1; AKwUvBygtIx+6470jkr3I/LcqXIBVim58KYVDhW8m96rIyw/jWJSdra+eldHQFyCtRYXnWezYsrVE1OCmQk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiJxrVg1I3zteS3WDyyqd263NrTSWhoq+Szkm75tRchpFQkSCO
	TuXH/ePKFMVLpevllO20tP2TVTaUd8igrabdTxxfmeFiTjfODX0FMNfzCOSNwayU7jE=
X-Gm-Gg: AYBFou2nTKO4DqDDXpGWd+eNqKu+U/PUgFLPs7dRn4KaMsAPbKW/kxTG61qyfzwscQM
	D/9mqzmbK0As6nvu7Q7dQOdNnzNYNzK6r60MltcDN1OD+mjFy0Ur6goaDyaaijQYh1f2702UEsb
	z5Vhr80E65aTRMwHo6D7TAYuBPMin+Ol5JBKgjFa/oDF/Vf67E71vmXDY4NEnoF0OvYG5fXuPsk
	4jbZsST8tFMzf51El5ZWH11hPw/+nv8HWa8VV/YlFXQhe/Txs35XmC55SZKUUVw+j6+4qgQjZFY
	b/oWeXruVlNd1Erp+8o9Ow5aisvYezfPDIlabH9tACtLrKkVzlq8XQVnJkYwar+yBQgwfB4zUvf
	7NcJJwo6EulSkqL9l/tqpldSHHFLPhC48yFlw8lAEH2TZZpVxopPvsg0nshP6x3AKTRdtznKzKl
	1nJwswj8UhcQRfYFaDAfXFCXEj6E12CqmPEreOqcYKd8yT2n+MnglQ1Gi545c5vc6gfdk=
X-Received: by 2002:a05:6000:471e:b0:488:5fca:a837 with SMTP id ffacd0b85a97d-48b024d96a3mr2492614f8f.20.1790771130871;
        Wed, 30 Sep 2026 05:25:30 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c092:500::6:13b8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029bf85dsm3449812f8f.13.2026.09.30.05.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:25:30 -0700 (PDT)
Date: Wed, 30 Sep 2026 08:25:28 -0400
From: Gregory Price <gourry@gourry.net>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, rppt@kernel.org, mhocko@suse.com, corbet@lwn.net, 
	skhan@linuxfoundation.org, ziy@nvidia.com, joshua.hahnjy@gmail.com, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/numa_balancing: allow migrate on protnone reference
 with MPOL_WEIGHTED_INTERLEAVE policy
Message-ID: <arz-iKWj1gRO3ALw@gourry-fedora-PF4VCD3F>
References: <20260930072617.64665-1-lizhe.67@bytedance.com>
 <arzLw18RiTN6Hmey@fedora>
 <7df34f77-2c52-47a3-a495-d782009ab543@bytedance.com>
 <arzR_QtoMPtM5kUB@gourry-fedora-PF4VCD3F>
 <e195b784-8a78-4bbb-97ed-168dd86b3d89@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e195b784-8a78-4bbb-97ed-168dd86b3d89@bytedance.com>

On Wed, Sep 30, 2026 at 07:22:10PM +0800, Li Zhe wrote:
> Yes, that makes sense to me.
> 
> I do not see a reason to keep the MPOL_F_MORON handling limited to
> specific policy cases. The flag already means that migrate-on-fault
> placement should target the accessing CPU's node, and the nodemask check
> is the common constraint we want for all policies that opt in to this
> behavior.
> 
> I will rework v2 to handle MPOL_F_MORON before the policy-specific
> switch. Then the switch can remain responsible for the non-MPOL_F_MORON
> misplaced logic, while MPOL_BIND, MPOL_PREFERRED_MANY, MPOL_INTERLEAVE
> and MPOL_WEIGHTED_INTERLEAVE can share the same migrate-on-fault path.
>

I do think it's worth breaking this up a bit, we can decide whether we
want to apply it to interleave separate of the larger change.

there is also slightly different behavior for task-mempolicy and
vma-mempolicy, because vma-mempolicy applies interleave via index while
task mempolicy does it based on a rolling counter, so you'll want to
think about what happens on repeated faults

i.e.

1) fault in a VMA interleaved based on idx
2) a bunch of tiering and pageout/swap happens
3) we fault a page back in based on idx - that means this page is
   forever-faulted onto that location rather than taking that as an
   indication that maybe it should be local

Maybe we're ok with that, but we should probably think about it a bit.

We may also want to limit this based on NUMA balancing being in tiering
mode vs normal mode.  This only makes sense in tiering mode, in my
opinion.  In normal mode i'm not sure it makes as much sense - and
that's probably where this all came from.

tl;dr: If we want to change this behavior for interleave, we should
probably give more thought for how it should apply more generally
instead of just hacking on support to one or two modes.

~Gregory
