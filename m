Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9BF3A6B8E
	for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 13:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778507369; cv=none; b=M2fXZBNaVzBS6BkGBWiCrI8XERde3uflAfb4yQojm4aFuAUFHvTvNGswEP7DNY3egdH3Rx2YEQ17VTgeLdPUoGbI2VMpExzoYRcZ/zzd+wQsbNcjdjLYsuXNYuk+nNIqEAaZbui5puJf7Mquq7EJ6iQjss+XXYmG79JmFKEY4sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778507369; c=relaxed/simple;
	bh=7ZUKOz2Tx9obpiEaBnPx2HLjlEm6lGU6cxX8h89V1hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K6/LmfS5SeAi9t1ZfrRfF5Pf3P6Su7WaqXQa6efgBQR3fzdEgbhiR0ZjFEX9oY6gXgZ8cj/Uz1bFf/+/PWf5B1fro4DMPz+FAYtrbnwvJna4bYsmDZDdXTSK0DNmnlVaeFlWlYzEytZMRl4Z+0nr2p4HFOBfDcVuEydZ1uk5vo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MQgh6f5z; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MQgh6f5z"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44e1ebb3122so2247370f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 06:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778507366; x=1779112166; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SCQ8Pz9y9YmgscDZb6MkYXZ00mYkeK75zPxgqibVrmc=;
        b=MQgh6f5zw/gLRtHd/yDZawXr87t2SrR7t3V+slf0AwqXXc16h6wvNWBqSUS1dRR3B2
         Pq4QGqWfeOPy1cprqT9T+nwu9MMl6YKFFQa5jFdJq0l0IFjh0fiC8TVlN5cbzIKFn94m
         iLhj09+pMiHJiKuJ3qoQSucqzVGcpPQaBmo0PXuoaIhq92Pto5JtEg9EgznR15bHnSOZ
         VxYLQqgJJt61EOrgnvH0UZ53gmz1SGaNemohE26d3tf8aqDG/1Ayzk2yIr1xUBSTz7CL
         OQKOu79F2GGsw6EXQLfSdMwtngAyj6EwfKmDFS+6YOwEwqe3zHUqKizGIQuKEeN/ZE4U
         zH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778507366; x=1779112166;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SCQ8Pz9y9YmgscDZb6MkYXZ00mYkeK75zPxgqibVrmc=;
        b=Dgpq6ua7SLMt7752jzp6CS1CBw227FFjRp1fxhfrdYxIofECpJ+qHpyrdzKG4iAgA6
         Carb8J9MlcPPLXwiaDSRhr4D9O6hxT086ogbWDPoHkdSlHaTUSTgLP479EPNA8ynrFZG
         0b/uJEglIECQnn92w1TZjVQIfDfbKH7yOG6DpfAeUcjEXUZC1SKkaQkH1GCHCYBa5QC4
         Gld4klJxtnph5PG5YGQPkqGDCaRcl0zOzipnfKBMBELi5uqjguTfl/R5tmi7BehztZzX
         6ACzbPlIOQ4GXlqOfv6K9ilwo1iRuxhtgBBdzriYKuBOd+WnzEKgUy3qUSHv7HmvqRYc
         mhCA==
X-Forwarded-Encrypted: i=1; AFNElJ+cSvZfzArQ/+/b18uAhSCXlUqcjlTdM5EL6kXBM0+zL8H1uy4TGYeJZOQt17uGviNW3cIPmqFORh8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVnPDE6ofKf0RhW9AHW2w4zqVxa7EH22bqMaX4xx9U4XITSYjw
	BDsJi1bTnAtdD4x2+y/QaP0lYhx1Jjyci1ipo92AT+Ne5yhMxIeQ04dFYLK0OkXSq44=
X-Gm-Gg: Acq92OGk7kFhUaVCOB60WinqrlHAM9EB/PIn25vG3kkcyt7O82RJMnR5tSWoduRNCaJ
	jybMbo+lMwU5oGA6DPRhriPm8mmehO6btlBJthkDujMbWP1BJU1dL+jbZf2fF4u4R4HMU8uFWqL
	vlQobba1JK5W+fxh9mh/j0OOik+fO8vo6974tlTTdVwJzoMyE41h7yen4CSNMk9bWmQ26DSf3YA
	XHzgasDmiVp6+uRpFfSRvAkxujfyMYzsiIVat8ohD+H5G4j/qkyqk37AI1ZbUV5J3O0V7U+YrSS
	PiTjbn0dlyIvgZrlWA2/+WYtIDl7jWLqQjhajbZr8yoDF2s0eTi4imtCqWLYX1kr1bHnIxnp1Qp
	Td8BOl91aWELvZohoh29KBygys6dn16tn5PEn71JlO33ksvZ8K5G0ff4r4E5hx35Ii5SdNXj+7L
	AFtc8ZuxUvsBYMbcPvof9DJ2cnwGV8tkLgUJ4x
X-Received: by 2002:a05:6000:2995:20b0:43d:762e:76c6 with SMTP id ffacd0b85a97d-4515b05738bmr29206378f8f.7.1778507365866;
        Mon, 11 May 2026 06:49:25 -0700 (PDT)
Received: from localhost (109-81-87-110.rct.o2.cz. [109.81.87.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491e94c0fsm26646490f8f.32.2026.05.11.06.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:49:25 -0700 (PDT)
Date: Mon, 11 May 2026 15:49:24 +0200
From: Michal Hocko <mhocko@suse.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Breno Leitao <leitao@debian.org>,
	Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <agHeZPA3eHhJHIsQ@tiehlicka>
References: <20260507070547.2268452-1-sashal@kernel.org>
 <20260508135630.a380e3c187b59e4c04e6f358@linux-foundation.org>
 <af5Z2IvtS5pVorSl@laps>
 <agG_PZ3qcl6TwLnL@gmail.com>
 <agHUp8ulaWJ75WU5@tiehlicka>
 <agHcFCRVSn5ra5Kc@laps>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agHcFCRVSn5ra5Kc@laps>

On Mon 11-05-26 09:39:32, Sasha Levin wrote:
> On Mon, May 11, 2026 at 03:07:51PM +0200, Michal Hocko wrote:
> > On Mon 11-05-26 04:41:38, Breno Leitao wrote:
> > > On Fri, May 08, 2026 at 05:47:04PM -0400, Sasha Levin wrote:
> > > > On Fri, May 08, 2026 at 01:56:30PM -0700, Andrew Morton wrote:
> > > > > On Thu,  7 May 2026 03:05:45 -0400 Sasha Levin <sashal@kernel.org> wrote:
> > > > >
> > > > > > When a (security) issue goes public, fleets stay exposed until a patched kernel
> > > > > > is built, distributed, and rebooted into.
> > > > > >
> > > > > > For many such issues the simplest mitigation is to stop calling the buggy
> > > > > > function. Killswitch provides that. An admin writes:
> > > > > >
> > > > > >     echo "engage af_alg_sendmsg -1" \
> > > > > >         > /sys/kernel/security/killswitch/control
> > > > >
> > > > > It certainly sounds useful, but what would I know.  How do we hunt down
> > > > > suitable operations people (aka "target audience") to find out how
> > > > > useful this is to them?
> > > >
> > > > I'm not entierly sure here... If folks have suggestions on folks to loop in,
> > > > that'll be great!
> > > 
> > > I work with these issues at Meta, and this approach would address a real
> > > need we have.
> 
> Thanks for the feedback!
> 
> > > While livepatch could theoretically solve this problem, it's less suited
> > > for rapid mitigation for a couple of reasons:
> > > 
> > > 1) Livepatch rollout is inherently slower due to the blast radius if a
> > >    bug exists in the livepatch mechanism itself.
> > > 
> > > 2) It's common to run hundreds of different kernel versions across a
> > >    fleet. Since livepatch is kernel-specific, a single CVE suddenly
> > >    requires building and deploying hundreds of individual livepatches—
> > >    far less practical than a simple sysfs write.
> > 
> > LP is certainly a more laborous solution. I guess this is quite clear.
> > It is also much safer option as it deals with all implementation details
> > like consistency. All that is not done for fun. I am really wondering
> > how admins are expected to a) know which kernel functions are ok/safe to
> > disable and b) when it is safe to do so without introducing unsafe
> > kernel state or introduce an outright bug that way.
> 
> In a similar way to how they would know if a given livepatch is safe to apply -
> ideally it would be communicated by the vendor/distro/kernel team.

You have missed my point. KLP takes an extra steps to make sure patching
a particular function is safe to modify or to put the change into the
effect.

> "On Debian XX.YY, use the following command to mitigate CVE-AAAA-BBBB:
> 
>  echo "engage woops -1" > /sys/kernel/security/killswitch/control"
> 
> > Thiking about this I can see how waiting for an official LP can be time
> > consuming and sometimes creating those is far from trivial. But would it
> > make sense to have automated LP creation tooling available that would
> > allow to return early from a function and relly on the existing
> > infrastructure to do the right thing?
> 
> This would definitely help (and in light of how the last couple of weeks played
> out, the case for livepatches definitely increased), but not all
> vendors/distros provide livepatches.

The point I've tried to make is that you (as an admin) shouldn't depend
on your vendor to provide you with an official LP just to disable a
certain function(ality). That is/should be a trivial case where the LP
should be ideally generated automagically if you have a tooling
available. I might be wrong and overlook some complexity here.
-- 
Michal Hocko
SUSE Labs
