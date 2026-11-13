Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559054;
	b=dCSwna9cP0g7BsV8wurFPRCEnmWZ0G0OEFGXiuPGBcPAuccMb0YHOJYXk351wad54C/f
	 i/W3CpqBWY7WoVz7eM1vAVtgEZkyHvwVk9Zo7Ap/YvIU/cBQJ6yjuzak4XiHkSrD/Dgdf
	 46gSYwMIQ+Tli8mUpbksEU7YxK4DrnmLM56Je7cYhbSRpcpM7rR/k3Nt3en+KSARJmyjT
	 COtKt6OUSoUqswucd2Bfz65bCPNGNeUufQs5eX4VzF7GoHd7iph3kixorCwaZh7r4/q5F
	 2hzziUk6eh9iSW3jm8rkbTCLH8Z3XldcT4A6+Y0+vfo6uhjXmJaFUGJZ6t46GLEUTtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=yst+eH4qPHKZ+Mz1qLQUp8ASMlTj1NxEgEqc21eSWaw=;
	b=YMtJJGYCy4RcVX+ggFhigE9vNj5IxUgAGWsovblrZyP3mJy5D1+UobLlkmzplB6ah3C5
	 rWkwX0V8NEVdaTj+lUq4Rds7ItFzAu2AKKIkermgLkZ16yV7lx+G/y+N0Cf1D+Iz4E34B
	 SYk6DmNd1dCRzdSWi5bY2/cNsk9CP+SEvXAySyTxLKXrhelIHUJ9ntusZSph7Ad02dhqH
	 gV41BxV6e8jSRkMh+qGQDq6nHGLqQFzDTmOkLM2VzMPDturcp2yB5N3YAFPswJk5QUcYB
	 RRvgi9z6SSCI4L4hemhQBC2OFb9AYTzb/Zlqnfv7EZ/PDiVhcMNCIFI/WG/zpS84nvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=mLALE3hD;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FC360A5BC6
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25FC360A5BC6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=mLALE3hD
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e9ae391a05so3618865ad.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559053; x=1795163853; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yst+eH4qPHKZ+Mz1qLQUp8ASMlTj1NxEgEqc21eSWaw=;
        b=mLALE3hD0yOFh5RAN/jg1xLgT0bpSd2jsokmAxPWJwdtWtNzJUJKHU8ZSCDP+t0Son
         fWbCv113pOpx4EpYvH0tfNYXl0bSPzFTvxf4T+Cwn2jFeJ0Q6iQAPTRusHye8tA95AIw
         V3dDJFkUeKTBVoT9GYH9LXXDXMfZ+c6qqfyrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559053; x=1795163853;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yst+eH4qPHKZ+Mz1qLQUp8ASMlTj1NxEgEqc21eSWaw=;
        b=pq002fTy0iIqSSEei6e0vbB8UlkirFiSDVIet92MiUOJiIBElOE501hfbPAVw5pqYp
         EpwGP2u4oY1F9liIbMSBLvCRBPv2mvrm8+R9LhfMEqS+twdcoXraK6XJrfVcjyAqj1K/
         /IC8DkcdGf/vcPXmFAmeHWg+/3xR/Py2kB6aVDQRR6J1xBtUY4puLBxbqrch5oyw8dAc
         DpksgwRT5VcGQtwkouxMeMRerzLpBsVUIHcLo+WOxn1K+w5jdbgBHsiBbfR7jyA/80y+
         V4MmL25jMaaGDxU5NpOvgD8WVd7N2nSrsGULcVxZW43+ihxlOiRPUQ7kyxc4IWmy34o7
         91bQ==
X-Forwarded-Encrypted: i=1; AL+hErGQ6hj0xzW+BlcOn9vXhMXpijYKTumpkWznAE9GVUHVwzOoR5GwrNyXajiryDiU5WkB50WDXjCrJx0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WoXY7B35cqnXDGjvnQHNme+kRaaYGBBWv2KrtQP0osM9KafSL
	1jhOpy2QMhqUrOByl8lRCW3LuxG/bC07XmeexNJ+1zwMgOCaxnvI1/A+jEn6/IeYBqQ=
X-Gm-Gg: AYBFou1cokeHEHULXQMhQZ7O3DIzVBVMdo1Be7+bQ3gwhnzvtz9ClcKMw8AV2kDTEdf
	Nd8RUeZIhh1Ua/2Rvec90BsoMTFJuBgm+TBDjXEbdEGvZdwRdf/SBWiikWsIkTUlNZ44a9PK+bS
	nfrynyMpTvS8frLZxkUG5D+tBEt4jzcgHcHiTGIZqztnDGd6wfpkhldmsS6O+ak+a1gyJAVV838
	HdHIhriuGYwcblpmdFvhDtVAjUOdu0Uj/Hl5cMQwrcEW39NoP8Ls3uNHsDTsMFd2K9gUd8UxsAG
	i8mSYf8uy17n8n7xIwTvBcUkA1Ax/oEUBPV7XKm/lvCQvjjq/hYqjDZNZsAZt3Nh4/UCIRnkDm+
	sl6Yo5x97iVSsmMup03h02sIM+7jD+qC23qa70dn+nEIsDC+nMJDHuJDSp/+DEs8BfWB2YgadFR
	Z4MShYtOsI6Xfm3RgjimLMDVXHGfGhwk4rZClNHczr9FvMgJUXXWJ2l9VntXVKfcMdtkxAcWhpL
	n+vIeJYfPFajltMJ5TMJQRjiv4xVE8MN0HmUkkvq0ntLE5/pIjbmzI7+nkSD73BaHGFIdUptLLc
	X0e61SWhZteHWFmYxOQjqTyOGQ4/ss7eepG9667wQWb4iQdThJMGyMGxFBt3mmSJgRuFUHP/DBd
	yGsesy+V0KVUmZ1+qSnarA9AckenoWB0FATWzBC2VQoyvYCCUaa43jmFyIk2ND/zlTn+dfVE6k4
	K+C7yflKp1Oh6CDDO3igrwnHZWUEtH9IpWERwQ63Cq5aq5vXARglQJbPsVze9bgG8mGFn7Q18ij
	QGgI/sU
X-Received: by 2002:a17:903:3c6e:b0:2e9:8202:508a with SMTP id d9443c01a7336-2edf1ed6cdemr37400075ad.16.1794559053599;
        Fri, 13 Nov 2026 00:37:33 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75ebbcsm6475845ad.26.2026.11.13.00.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:32 -0800 (PST)
Date: Fri, 13 Nov 2026 00:37:31 -0800
From: Chris Down <chris@chrisdown.name>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Kees Cook <kees@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 2/3] sched/core: Add sched_stack_end_check= boot parameter
In-Reply-To: <099dc59b-0699-4c2d-875e-289cf6d32cce@infradead.org>
References: <cover.1793082868.git.chris@chrisdown.name> <3d2bb6a8508b9d801878bb82c88165a1b1ff5f40.1793082868.git.chris@chrisdown.name> <099dc59b-0699-4c2d-875e-289cf6d32cce@infradead.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261113003731.5754ed6732d351dc@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Randy,

Randy Dunlap writes:
>This error branch should return 1 since it handled the command
>line parameter -- it just didn't like the "value."
>
>Returning 0 causes the option string to be added to init's
>environment, which is not wanted in this case.

Good catch. I've fixed that for v2.

Thanks!

Chris
