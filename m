Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0EA2BCF41
	for <linux-doc@vger.kernel.org>; Tue,  4 Nov 2025 09:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762248100; cv=none; b=soTLsv1H5zY0vm+1xqNTyijLx4yKW3y5t68UXhkJli4fMQNQit+TY+L/BQULoInR99Pos5yLc/xcOg/GLpt37HV4cwOXXgaPwGaSZYLqRFnypeTtarY3UAIqgdgPA1FAAnnWREi3gwrq6qpl0XHqTGSEEM3S5quT6giBxNTB+10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762248100; c=relaxed/simple;
	bh=qWUGGQt5BOBYCU7cJdvg7HLtAGyl1naRvP7koMC91kY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GUBX/YXhU9x0v0iXscJnORrOIBxTcFLkhbQKojv00KLS7oH54Qjownj+LAzr+91O1noYrPcmQtdL0gAyYYKSVpbGb4AubNnjSbWKi1H0ke1QJBZzpZy48WEC9L9TrztGKLJ5Vz0EXnJ/mu30ta3T2b+q1q96Mx9hfn6jWJAaCQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PASA8VN6; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PASA8VN6"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-429c8632fcbso2203634f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Nov 2025 01:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762248097; x=1762852897; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N3yPk3l2QmZ5sg7FNMBQuG7a498LlywoxhRJU9RTRgg=;
        b=PASA8VN60LWvBEA+Zf5lTNSO1D4/omSdR/JPG2Jme2M+HEmg5I9cj55UsEqRJkmUSA
         Kwq1JpCDqNGtrqlPfU3s4Z5WhmxUK4bA4gY1KT0MK1avaeYdLZmK2oDMNtW2zpVPJl1O
         pbuRhriTmljFDbNJxgdsxxLhZhH6V/cLud2yfAdjEjgH9Bn/edGdd512g4IJPQZEQN5R
         Hc5Trnw6CkRQTDcCqyCrVggi+0cbD8MJi0IwXmE6EZm3UzACEsm28o+nWyMXSR2W2pwL
         lquiRe1hqQgnZ2+zn2D0gVt5C8vtP6GlLMBU6lFtL007nrGBO/X06cLP5AX/7EOUN/0s
         NTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762248097; x=1762852897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3yPk3l2QmZ5sg7FNMBQuG7a498LlywoxhRJU9RTRgg=;
        b=l9CwFEoaAQZzIJT0untfjhvLjv8NgzVkiGgmIbjFknQU0Vxyljr4eOjlk+zCTDdQxI
         ijrEOeUg0fmv9reGTfVywN6DJu2NTak8ax2oj+b8lKNCa73N3NXRxqW3FSJnhFHUsQcT
         zmiH1lVwYLZIffdyFULHNBOTLUpf1YTSPd9ZsfPeKzvfVjwkRYsUSQKrxdxHsRkTQbd9
         EsrPpDYS6HYiKbsGFgYuP3SXEPRH8ZkJMKqwDVC1yheVQKfGTR369xu1ZrL1nW0VEDyv
         kUERVNi+Jluc0Ld0HqJSyQi7/PU44hDduqKhFjXw9fi7AB7jjaIAcoVm5qZIhsJMO7E9
         wxxw==
X-Forwarded-Encrypted: i=1; AJvYcCVgm+BNc/o3Y8oOI5wDf5hQOGFG3x1b/2Fkf/ejfsQj3sa7G/qbVZk+AF1blZtYmrqEC9Nd5ZCJx6k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz17CNbbufPjgZ0u5kdmghLHEdAsfrP//BUcG3soreDGeBfr7x3
	LftSI3xA9Bcl/bT3VCNPpoy9A3fmxruzynb+DZ6bvkCLsnfzuRpdbgKqv8qsANL1vvQ=
X-Gm-Gg: ASbGncsLuOij31tBC/2IZJNpgUrFm57l8aK++nElrjy8Cg1GmfOllTyV5uMZJvnv5LM
	QSj5YkFSg6J5BlDnpQrLqZU7ainJwm86Jg0v/7FEezTU0MVF+7+L885NfILKkRZt2bennZxNDCF
	DsEDq3kfiTjEQbSyOKBEFXFOThgBZnS/0dwANRFdzrweN/MT1xFiGNMwfEQZ0YECkEfsgu7imj0
	oPNSwdM3TA03QpAtrGZF68LhpN8nK+J4j6yLkdYuRJQ2WN9xosuhMfuLpaaxBMEWV56OY1lAZlL
	UkLD5vUvsVgLPxzXyIRAdvWfwgipxL61wtuDjPZUNw5AAU8PRn1qBmhe22wXFgqQSKctQS3VIAU
	r7wdZWolIRMWUWcWlCSZi5VArccgaY4fNHO/IMPppaxRUMuQyJDIe3uMqPQF4k7sD2iBy16FBOI
	J58iqsr0Tm
X-Google-Smtp-Source: AGHT+IF4ZP/JaUkTNJYjSED1IManQD1UidWfm51jaGkLr6fndksIOYSs9Z4q0DYHoyvlN+ZlPJfjhQ==
X-Received: by 2002:a05:6000:1acc:b0:429:d40e:fa40 with SMTP id ffacd0b85a97d-429d40efbe6mr5041355f8f.45.1762248096882;
        Tue, 04 Nov 2025 01:21:36 -0800 (PST)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1f9d33sm3569518f8f.36.2025.11.04.01.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 01:21:36 -0800 (PST)
Date: Tue, 4 Nov 2025 10:21:35 +0100
From: Michal Hocko <mhocko@suse.com>
To: Leon Huang Fu <leon.huangfu@shopee.com>
Cc: linux-mm@kvack.org, hannes@cmpxchg.org, roman.gushchin@linux.dev,
	shakeel.butt@linux.dev, muchun.song@linux.dev,
	akpm@linux-foundation.org, joel.granados@kernel.org, jack@suse.cz,
	laoar.shao@gmail.com, mclapinski@google.com, kyle.meyer@hpe.com,
	corbet@lwn.net, lance.yang@linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org
Subject: Re: [PATCH mm-new] mm/memcontrol: Introduce sysctl
 vm.memcg_stats_flush_threshold
Message-ID: <aQnFn6vPQ5D6STGw@tiehlicka>
References: <20251104031908.77313-1-leon.huangfu@shopee.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104031908.77313-1-leon.huangfu@shopee.com>

On Tue 04-11-25 11:19:08, Leon Huang Fu wrote:
> The current implementation uses a flush threshold calculated as
> MEMCG_CHARGE_BATCH * num_online_cpus() for determining when to
> aggregate per-CPU memory cgroup statistics. On systems with high core
> counts, this threshold can become very large (e.g., 64 * 256 = 16,384
> on a 256-core system), leading to stale statistics when userspace reads
> memory.stat files.
> 
> This is particularly problematic for monitoring and management tools
> that rely on reasonably fresh statistics, as they may observe data that
> is thousands of updates out of date.
> 
> Introduce a new sysctl, vm.memcg_stats_flush_threshold, that allows
> administrators to override the flush threshold specifically for
> userspace reads of memory.stat. When set to 0 (default), the behavior
> remains unchanged, using the automatic calculation. When set to a
> non-zero value, userspace reads will use the custom threshold for more
> frequent flushing.

How are admins supposed to know how to tune this? Wouldn't it make more
sense to allow explicit flushing on write to the file? That would allow
admins to implement their preferred accuracy tuning by writing to the file
when the precision is required.

-- 
Michal Hocko
SUSE Labs
