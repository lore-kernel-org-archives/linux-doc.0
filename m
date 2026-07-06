Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFC617D6
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 00:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783296434; cv=none; b=pZAtS7TnDoKN+CP4ydMu5evS2vuK6a3tMyn6W8BndM8W8zwbHDgxUsukjtatVTSONq2KdnD//2yo81cYDHKnIw/YPxUWsHKmVCuyZAjThryFdrMtBMD0kCofbtP2BCYSpyllLh2wol+VkOPEo9zMC4BVc6dKrTn1cjbzfiFotRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783296434; c=relaxed/simple;
	bh=Jaq9z8gaU2ajSSKS1KVf2jLna/+t3Ab/5sQnmbmJW2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UeW88cMnrAF0PE8RaTDgMP2KFtVFaEKPcWPGVFGRGmU8ThkV1UcbFt/x7t7Cp6hMMvV8lYuc5D5j3Y1znCARoCbnvD75jKBOvEDsHHmKdVCOrRbtYMbeN32dvUgxvksci2AGS1eJiCNEwA4oAMA8lw0ShZyhH201E7dG7jRIO2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=TgATax70; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="TgATax70"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e5d6f35c1so215766885a.0
        for <linux-doc@vger.kernel.org>; Sun, 05 Jul 2026 17:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783296432; x=1783901232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hdj3HltkSnhczrsi4vjmTn5rkigSJkrozmpJRtCa8Xo=;
        b=TgATax70oxYa859/t387KKiSHXijTIaCNnx4nWZ5VFMix218cF7R/2/j5M+VCI9oEA
         fqAmW/hd1RloOxVC8VBvk8OTtawizQvBc+WSG6/B29h3x4hNi5vLU8/IR25BO1JpPsc5
         4ORf+JhtGS+AI3a1q2TSQlnaam0qJ3qF+H8KSa0hRMSx2n8f/zUyA98GhiUoub7ZiHKz
         okD+sIOgwkKRiBbHG1zdac4B2ocr8GZH3WuswVoqEV/WF7tmJ4fEWf73bBLGb7oVNVJF
         J3zS03/9SZwStv9PmTLlc/JXF4eJJ/3ByIXF0b49takfq5akXw4IGTJk2nmIcTIoWkgG
         b5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783296432; x=1783901232;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hdj3HltkSnhczrsi4vjmTn5rkigSJkrozmpJRtCa8Xo=;
        b=D9IDCWALU1eUWCK9D8zfHY4QX7lHt6IDF+0QeThtAvSpiplSMbSLtzADz5g18iT7vg
         FEjZcuAw+ILHe6G6tNA1GGNjzqSt7kPPxNZgwbc5Q12RDbe6aKksiYr3kv95AdVdhHtg
         VygLuBGEAwWJb9BrFU1sn9tb/8CKdSE+vygmhw0qZb5g8o4zJvQb9XUdyAG5eu6dMmD9
         /sW7uTN2RxwcK8DN/zNUKQsJBMkXW8gbEyFWh0fVxnXOSL79wtB8sHY+GrdCjylEJMPx
         fTZSFpQCtU8VaMDD/g+3FNz5wfD65uPIatzD8u1sxzmqh5wIDgm7AYsf0R7WH1uSyExw
         cR2Q==
X-Forwarded-Encrypted: i=1; AHgh+RqbvwmBBrtJ+rqOM0zZ8N45FO5faPKUCyudjlFQJ5Pq1DWsheJmgaImzVBq3pIRBofi7+stk/0UziE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWxsS0SQnczWhgg6WkW5YCj/fESfxRuVeozZ5jVRniaUN2PKN0
	h3NgHd/4HAW1P//2HzQanQadQC6NQiUiTr6KlgULBAIHzu2vXzs0lz3+595edH121/4=
X-Gm-Gg: AfdE7cmXpN6MlSFQwASexLD+viJoR8B51v3e+Ouv+ZMouilnU8eavQ5gxMWLGnQp2L/
	MM+VvyfOwYrIBeIRqnr8CLj0Dut1oTYs7dAZdC1TaLp14aunmsCF+TRpawVqvLH5KydMuKDLEHS
	48TY9JNN78X6ephHX2Ut77zpOVmfTc/+z+OZjp74VNfZMYgw7TAYCOTU8WitJblJj85dKkds/46
	xMQy84sIss655my9p+bJ5AuDfgu/fD11neHEqYfSNntvdat3/9BMGvaVnPJcym82UPEaix30McR
	S+ciCzVQAQejRMdtteOQur3NUynA5A5z0AlMccdDOiRi8+k6DQb7oRsIThS/S+WcBW5l4m+VWXR
	Q0bZc/CS2m/Xl2s6rD8Nis7rgncZJujFv0vofbipnH97MrJJ0ldsuG4M0NTI9m6q3bSRC7pDJ7X
	IKWxg=
X-Received: by 2002:a05:620a:4503:b0:910:87f4:9a26 with SMTP id af79cd13be357-92e9a419085mr1177703185a.41.1783296431517;
        Sun, 05 Jul 2026 17:07:11 -0700 (PDT)
Received: from fedora ([172.56.218.236])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90b804dasm771697985a.1.2026.07.05.17.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 17:07:10 -0700 (PDT)
Date: Sun, 5 Jul 2026 20:07:07 -0400
From: Gregory Price <gourry@gourry.net>
To: Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, peterz@infradead.org, luto@kernel.org,
	akpm@linux-foundation.org, feng.tang@linux.alibaba.com,
	pmladek@suse.com, lance.yang@linux.dev,
	marc.herbert@linux.intel.com, kees@kernel.org, leitao@debian.org,
	joel.granados@kernel.org, lirongqing@baidu.com, nathan@kernel.org,
	xur@google.com, lukas.bulwahn@redhat.com, ryan.roberts@arm.com
Subject: Re: [PATCH v2 2/2] syscall_user_dispatch: add
 kernel.syscall_user_dispatch sysctl
Message-ID: <akrxq2lHD0mP4WWP@fedora>
References: <20260704015859.536580-1-gourry@gourry.net>
 <20260704015859.536580-3-gourry@gourry.net>
 <87ldbpjhtv.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ldbpjhtv.ffs@fw13>

On Sun, Jul 05, 2026 at 10:35:08PM +0200, Thomas Gleixner wrote:
> >  #include <linux/signal.h>
> >  #include <linux/elf.h>
> > +#include <linux/sysctl.h>
> 
> It's already not ordered correctly, but the rule is that we fix up the
> include order to alphabetic ordering when we touch it.
>

ack.

> > +#ifdef CONFIG_SYSCTL
> > +static const struct ctl_table syscall_user_dispatch_sysctls[] = {
> > +	{
> > +		.procname	= "syscall_user_dispatch",
> > +		.data		= &syscall_user_dispatch_allowed,
> > +		.maxlen		= sizeof(syscall_user_dispatch_allowed),
> > +		.mode		= 0644,
> > +		.proc_handler	= proc_dointvec_minmax,
> 
> proc_dobool() exists for a reason.

ack.
