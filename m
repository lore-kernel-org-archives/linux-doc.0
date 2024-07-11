Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC1C1607AD
	for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 13:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720705775; cv=none; b=tUTMpnWQji7zP/0AQ0w4LC2EZwnPhak6gSdIRG+KGTlFMWV3JTbvRbBYVHywKehO++x1odoCZjWeht+ZVDsf9JdnCT2V2rT/cxLlmMEpGdlnpwuTI7BnRd8gPnpe3deyv44BMlagXp304qqlAT9/W3OUePQPiF0F/jXijp1tXIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720705775; c=relaxed/simple;
	bh=+3RA/WCEZOLvNp1kfnEI1aI9/Vj5N0p7XqouO3rUMnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D6y7t4hdZa3LBLGAa2hrVlaQRt0XsIo7MJ5vuhmc403PI1KUBm7FcaEOdCb4tj52F8ZNJWRu4LcvFNJdsDxQxct1I1s7EMHUQOZdG0ryWGzrjuqfAgxLf8RD8aB3awsKh6oJOVoS99H2RhkvPwyN+1ZfjpwdC6iY1z1f0cmfrHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=A+MukzNr; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="A+MukzNr"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7a05b4fa525so69670985a.1
        for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 06:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1720705772; x=1721310572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4c/thh0gX3Wuy0Qhdv01QxrBoTYgtRK1bsGV9IACHGk=;
        b=A+MukzNrL8Sk1y0udzdaX/RHYy4Ys5oqxxPuqsjU3dNC7hF90THiWfJp7fsXsDjNVz
         /uLmAmprzkMpOuN3T59Fu7nvJXneA8Jc0ls1Yf1AQBscX7xCShPrQ71/sWtl2GvuDDDe
         JeEVx6VFSNGCrpK9ZN26h7pSqAMpvyDvytEPFVG8YkrouQV06VVDAIrOeEws/no26G4Y
         QAhonNFkPDH9St3lEfd9oKmE7aAWRmurVhKMsmEg/+0/r8dd+LkdTNgiHBmPjQTO8cAl
         4O27JgpgRz3+i7rMpsKblD5XESq5TS3ADqDyp5Ld1sw1+PLg5DlPlI6HcshEPx5T8gnZ
         kiFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720705772; x=1721310572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4c/thh0gX3Wuy0Qhdv01QxrBoTYgtRK1bsGV9IACHGk=;
        b=EcujXoL4Tw7EjquGKWPcVGYMxBAQAJo+KssslpEDTbLZCjdUjPOqdx5yehsWVWpKOY
         DCZBEgCMICClSGuCOSXXePvNhzoOsPtHsC/46AMXgNFVpjn/2blvEe4QPIVLVw8I2gkN
         R3LuGjzpQ8ii1Yq2gvAKX8IC3BTRaeId97zkJTNNz8JreTDuYKrJDURvjItB+R9UKcnX
         AIuZy6ogUq4I9QDl8EhGhDd6Ugzz86k5po4d8TLS9tHWshtgeYr8HObOo6Uw6J+7e27N
         81Mt6qu4M3CcodKsNy8PWhNUjnoSjH4bk3vwQokVokEKHAtFjKpdpiLFVI74ah7Uqj0M
         FQUg==
X-Forwarded-Encrypted: i=1; AJvYcCVZkzum9OKXQ3CsHQtqow5c5iArnuY1OZsk1/pqY0yQTqTRH7Wr+XIeh+s8U+gvrH2Puor9/I8Yp9xU72bAjhnOKxn+oVWdiCzG
X-Gm-Message-State: AOJu0YzHwp4pHltwo5nNTa9f2YxcKvP7q9fRcTlmW3QQEIZiEM5TcndM
	VJ1+jv+CfzbS5iPiI3uF+hnhlEXfwx7sCL6qK1BvbnEGO/RPWLNH5AA906ArmfA=
X-Google-Smtp-Source: AGHT+IHwEOYVfSWxKEQP0w8KFn4k/nB2bnIk+/F2DNotqRksDFSC7MbAwOqVXy2Rh4H9nIWY4EYR3Q==
X-Received: by 2002:a05:620a:4723:b0:79f:e0d:e052 with SMTP id af79cd13be357-7a1469bce11mr482286985a.9.1720705772260;
        Thu, 11 Jul 2024 06:49:32 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79f190b4468sm291254485a.128.2024.07.11.06.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 06:49:31 -0700 (PDT)
Date: Thu, 11 Jul 2024 09:49:27 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Waiman Long <longman@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
	Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kamalesh Babulal <kamalesh.babulal@oracle.com>,
	Roman Gushchin <roman.gushchin@linux.dev>
Subject: Re: [PATCH v3 1/2] cgroup: Show # of subsystem CSSes in cgroup.stat
Message-ID: <20240711134927.GB456706@cmpxchg.org>
References: <20240710182353.2312025-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710182353.2312025-1-longman@redhat.com>

On Wed, Jul 10, 2024 at 02:23:52PM -0400, Waiman Long wrote:
> @@ -3669,12 +3669,34 @@ static int cgroup_events_show(struct seq_file *seq, void *v)
>  static int cgroup_stat_show(struct seq_file *seq, void *v)
>  {
>  	struct cgroup *cgroup = seq_css(seq)->cgroup;
> +	struct cgroup_subsys_state *css;
> +	int ssid;
>  
> +	/* cgroup_mutex required for for_each_css() */
> +	cgroup_lock();
>  	seq_printf(seq, "nr_descendants %d\n",
>  		   cgroup->nr_descendants);
>  	seq_printf(seq, "nr_dying_descendants %d\n",
>  		   cgroup->nr_dying_descendants);
>  
> +	/*
> +	 * Show the number of live and dying csses associated with each of
> +	 * non-inhibited cgroup subsystems bound to cgroup v2 if non-zero.
> +	 */
> +	for_each_css(css, ssid, cgroup) {
> +		if ((BIT(ssid) & cgrp_dfl_inhibit_ss_mask) ||
> +		    (cgroup_subsys[ssid]->root !=  &cgrp_dfl_root))
> +			continue;
> +
> +		seq_printf(seq, "nr_%s %d\n", cgroup_subsys[ssid]->name,
> +			   css->nr_descendants + 1);
> +		/* Current css is online */
> +		if (css->nr_dying_descendants)
> +			seq_printf(seq, "nr_dying_%s %d\n",
> +				   cgroup_subsys[ssid]->name,
> +				   css->nr_dying_descendants);
> +	}

I think it'd be better to print the dying count unconditionally. It
makes the output more predictable for parsers, and also it's clearer
to users which data points are being tracked and reported.

With that, and TJ's "subsys" suggestion for the name, it looks good to
me. Thanks!
