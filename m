Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35741103
	for <linux-doc@vger.kernel.org>; Mon, 23 Sep 2024 04:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727064509; cv=none; b=LWanpvGs2gp5hjKZlVjeFpXbQfsd0JpYFae7m433YWrrA5Kju+3IxRPCJJ1uCVuQHDcc/HKQD7rGWVMusQjPhUZyzhbFUMSwpr5vItw3jBEjg89Wn6Qn6Ls88mz+sUfmm/v+Qzhgz2VCgBeKUnAULCmO8OZZmiQYvPThRT/en8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727064509; c=relaxed/simple;
	bh=IAXrrR1bdvcCNjpWx4TFxMw2ilG6jrPZI9P+J75cyaQ=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q4r7YkkDN0rjpRKT8MMqeCb758sP3bz3PG2CLwGtqiCSJF5UBnEdQiUbCWZR/XDuzUdy+XTqxnf/IAogviNu7yUvKm93O8cYAPPhCHpGeKyLL9YkrntyCP37cAuPwnZTR3nHDAoCGjFvbAfiFJ3TY8M52UKUF/eSgyTQj4cq3eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTfFtVdt; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTfFtVdt"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2053f6b8201so33710765ad.2
        for <linux-doc@vger.kernel.org>; Sun, 22 Sep 2024 21:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727064507; x=1727669307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XQ3Ylc4/HRqYFFvYTagrb5osa5cNi/SQl1xgqVtschg=;
        b=XTfFtVdtlShJ3zfODnoqdngyd/LuwWy1fsOZA08wgxMzFGvncFTsp/+EWThfpVpJ4N
         tGmLfoFFOdHq8l9l1sLmm/BW8G5A+Qcw8StweFsrP7/CxyXrUMwWoZ3/XQpgdC5Hwe3M
         OCyPxQb2V7mCfQs7848EGCplnuj4uSetmoEKd/I4VRCOI3xgu3lW0ntkkuVj9GSdHhLi
         VjJbbyBJPgitp8ubw8UXntZf0E8M+9Yuq99xM9bOhvASkFEQi4KqwUmo4alI14fhemHB
         R/PVeqaKd1rPTH2Q7KPeUs5/ijO8SJJx9troqUWXjVYTvfka9D5nYGNHaGDnjx93rqS/
         KsTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727064507; x=1727669307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQ3Ylc4/HRqYFFvYTagrb5osa5cNi/SQl1xgqVtschg=;
        b=VxuC0cjQqJd6Pumi9sldlF6xR0w2fj0U8RM07K+Zj5df3AO5jd1BHf5tlfRb0iUxF7
         6OdDGDH5PE4ag10qZDipmKIN7NksPL1/oNVSC5zlAXM5YuwpxNIQaIkx4dSfeSYfdkQF
         ukidn/CXLakQnsUrZQ36WS+K8ctQXHEd/XSNKRbQOnS9R0SSJ2Nf3qIY5atZla/47bpz
         aZCfV0KtsLOJo/J6Yt+KkXcDTujVFuQ+opOUlxAkjx7zBqa2vFi4l2tHoROgNw9Vat3t
         guKkb1CKGTLMulKWE9yHtXYu0+vk/wK5gZgZs0BZXZGykbkUciVDaC0MEeLoLlrIjUqA
         s46w==
X-Forwarded-Encrypted: i=1; AJvYcCXF1ah0e8WkqyHafp4vbAr+GpvVPFWSbuC77fpIp4MOsCRY5TYCh54ximYLZ2ckqWYD98q4tCJQ+fU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9/6Vf9KYi1T4A9o7AI7rgsqVSooBwr0uqZrC32CCmuuZsNCS/
	mpSZIaNXksAOGt2GsMKFnlucAo7oUwAFZ+R9DKz6iX0Irf01+0At
X-Google-Smtp-Source: AGHT+IEoKkiK4UmzEqgkPieEGPuvQncBt5iNhN2dbWy1YEFi+0Jiys77GZTPEuAccU5xjyY7KId0sQ==
X-Received: by 2002:a17:902:d483:b0:206:aac4:b844 with SMTP id d9443c01a7336-208d97e3f78mr154096205ad.6.1727064507064;
        Sun, 22 Sep 2024 21:08:27 -0700 (PDT)
Received: from localhost ([183.226.245.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2079473d080sm125527165ad.284.2024.09.22.21.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 21:08:26 -0700 (PDT)
From: chenqiwu <qiwuchen55@gmail.com>
X-Google-Original-From: chenqiwu <qiwu.chen@transsion.com>
Date: Mon, 23 Sep 2024 12:08:23 +0800
To: Oleg Nesterov <oleg@redhat.com>
Cc: "qiwu.chen" <qiwuchen55@gmail.com>, corbet@lwn.net, mhocko@suse.com,
	jani.nikula@intel.com, akpm@linux-foundation.org,
	brauner@kernel.org, paulmck@kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] panic: add option to dump task maps info in
 panic_print
Message-ID: <20240923040823.GA3879@rlk>
References: <20240922095504.7182-1-qiwu.chen@transsion.com>
 <20240922131237.GB9426@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240922131237.GB9426@redhat.com>

On Sun, Sep 22, 2024 at 03:12:37PM +0200, Oleg Nesterov wrote:
> 
> Wouldn't it be better to export/reuse get_vma_name() rather than duplicate
> its code ?
> 
Sure, I will export get_vma_name() in task_mmu.c for reusing, and post
it as v4.
Thanks
Qiwu
