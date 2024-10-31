Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E167D1A08BC
	for <linux-doc@vger.kernel.org>; Thu, 31 Oct 2024 16:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730390960; cv=none; b=Rl6bYwXUVU++2WAIXZNTJOqQTNqSiMQvs80oCMtY7RzjgsS5LiFG8PaVFufwGzzU263ZTe55Te7DghgAsZIUcBvUF9lSNQj18pfzlL8ROTOVHL/814pRQqC6HsbVJN/o0yVOPl1zs346uaELf1waqXADdlgFmG8vz/c/nodBw2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730390960; c=relaxed/simple;
	bh=0MP1EJU+2Idek3AiA2s9w530Zbh818fE5dZH3t/ZqUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jazI7TZwWjka/IXrOjFn3qphQulK/1TxsUn55MgKL159ubfJMacZZirfR54zFn2qqmz2OGNlrBqCdeGsiOlF7C/iI+WR6gAt1W3I9DhlRoKSaYvNIYuCRZtOf6v6lkjiB1MJkQFHwmkhoy6qhkCZYBmF0kKugvrZFdZw5efbwdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=LX4Vkoml; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="LX4Vkoml"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7b1b224f6c6so75732285a.3
        for <linux-doc@vger.kernel.org>; Thu, 31 Oct 2024 09:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1730390957; x=1730995757; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0MP1EJU+2Idek3AiA2s9w530Zbh818fE5dZH3t/ZqUU=;
        b=LX4Vkomldp3PlS2TddkaLUebVvBZA+L+UFx9PV32mXmz/a47f44I1SQQz+1gCPqwe4
         2QLoTRQGpsEGbzT1NZAx3prKe9QFG8/ui21iK9E9X/3OTOhurcCIywv/ms5nvusmnfa8
         n5z08vZJCSxSdHje8P0qvmE+X+I7ffrpaR4eryL4i7tf4LaJbv7e+JopUpB4ohUJjhRH
         IKKImh/aL3C9/H6BhNfhHEh4BcquV6jhB7reKqmIzU6PqKneroUhQoGPl/DTiKWa8KGa
         eNVrFse5rGv1pcM22mfHEcb2EpM0nmRy4T3Vs77RDBDBhrqVp3pmtEivSy74EYe+joIS
         jlXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730390957; x=1730995757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0MP1EJU+2Idek3AiA2s9w530Zbh818fE5dZH3t/ZqUU=;
        b=SjZ6aupjs3fH+Tnpc6o6ekPRz/ef+J1vysLxjJgwNAQm3xCHsEVieTc6y3+NrKEcWn
         2Uq5olOhi0rPWjHDqWU1Ka2wrKedCY4jat0Q655BIY7kFd7PA0nAIvXIxchNr81s1+la
         aC2p+4HZ+wTpJQh/vYN5vSez6MGXHBL67+vW2XOZ4yGVIQ8QuWMzunG616sfdhNvWLHn
         y0HCQeNwzuDnNw95rmLA1wXOngKOl0ehcr49bVYCSGKCrVXHUwx77BdKvZ4/jOdQ2miB
         v+lX4YnbDT1hn5RaL9qyjRyplhjPuPO6Cl16SLffClnYtcvQeTBjz3Ew2whdASu3uFQK
         Ybyw==
X-Forwarded-Encrypted: i=1; AJvYcCXAw4FRA49rRHqC5swB0fmIi/D27v+nG3nKqtQHIP05O4uJY5MYU93Fd0VjpOd0csfjBpLNqK5m3ds=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4puiA5J1SzhEAmu97zrckYzoRg1yVXt2xvsOD2Ccyozk6wmtk
	s9zaNFrtGxi+VOY3nKM7shOD031V/168ykxfJGjt/luXggaZ6fDpGQtQpNq8hu0=
X-Google-Smtp-Source: AGHT+IEnjifKtBJHoQrQwgD4KdMGYeT83HWXRNYBXlmFZgg8SK4wbJtKEMJF5yR99revJMvIDc8S8g==
X-Received: by 2002:a05:620a:4108:b0:7b1:5089:4867 with SMTP id af79cd13be357-7b2fb9bfe02mr17647685a.62.1730390956566;
        Thu, 31 Oct 2024 09:09:16 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b2f3a708c6sm81355185a.91.2024.10.31.09.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 09:09:15 -0700 (PDT)
Date: Thu, 31 Oct 2024 12:09:11 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Michal Hocko <mhocko@suse.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>, nphamcs@gmail.com,
	shakeel.butt@linux.dev, roman.gushchin@linux.dev,
	muchun.song@linux.dev, tj@kernel.org, lizefan.x@bytedance.com,
	mkoutny@suse.com, corbet@lwn.net, lnyng@meta.com,
	akpm@linux-foundation.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v3 1/1] memcg/hugetlb: Adding hugeTLB counters to memcg
Message-ID: <20241031160911.GB799903@cmpxchg.org>
References: <20241028210505.1950884-1-joshua.hahnjy@gmail.com>
 <ZyIZ_Sq9D_v5v43l@tiehlicka>
 <20241030150102.GA706616@cmpxchg.org>
 <ZyJQaXAZSMKkFVQ2@tiehlicka>
 <20241030183044.GA706387@cmpxchg.org>
 <CAN+CAwM1FJCaGrdBMarD2YthX8jcBEKx9Sd07yj-ZcpDxinURQ@mail.gmail.com>
 <ZyM7_i1HFnFfUmIR@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyM7_i1HFnFfUmIR@tiehlicka>

On Thu, Oct 31, 2024 at 09:12:46AM +0100, Michal Hocko wrote:
> I will leave up to you whether to add above paragraphs but I believe
> they clarify the intention and the implementation.

Both seem reasonable to me to add to the changelog as well.

> Acked-by: Michal Hocko <mhocko@suse.com>

Thanks!
