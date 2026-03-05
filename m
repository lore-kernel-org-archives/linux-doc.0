Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F77139B4A9
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 12:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772714039; cv=none; b=DSyJDEMsEM9yTVShgZoOwj+SbE3Mn+g+jKi8HENQcgyvlY00mT0P8zGGhP7ddL+DmkAlQdD7UfMQADa9U1HTZYkHxckyLmo8x/ySEjlDujlwnbnEk05TY6zp+YS1fI6GeCUj0/D4inM3W/z5/PK8qGwoUuDPWeN1/J9C74OCcqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772714039; c=relaxed/simple;
	bh=bBMU2eq1b9VpHdnnbb9a9Ixp6lzEZOYLQ0CxuTv4hvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WPlPc2m7Zs+c/smTkuEctHkGpYSVKZQTAvX4Y3kJ1MMf4tCDQB2QzWmyOJP1Yh4tQ9bhUVYZvy5XTl4N1SIEAbrxAVnVtezBd2owRfrrMUEsf9ZMzrqAy4fWfnsrpQkF6gYrBWW19nbZU16/VKAr7RVqNOQxxuspXYUV+CE2ncc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ewk5wwW3; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ewk5wwW3"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-483487335c2so66671485e9.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 04:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772714033; x=1773318833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IAtyjRxqfQiyhlre0tqh/uCmfnBFujz89wTA1BKqRRE=;
        b=ewk5wwW3tEkKzNfDTrZuDfrY+sd6XdXEXZGJj1HJcy4PuQUgptnO1k8Yu+TyhYIIU0
         /j/EM33msisiUYXOAQUxQwlodnhMLDIueMmswU2RxpvFYU0x9zM2cUIoggsQTHwQhVpb
         d5zhs+bYIBeX8qszVrYj1gxVsDW7D4eBJidhHMSnzVgJOwAoOjQUn1yKobLdevyDdurw
         DDxbi3wsFAufmhs+Hdlae6Bz/daga6F+8u/AzLMqa2WhXQwy2fSdv2nl9SS3xkKUYe7t
         FskLuu+YjniiFNtdGpBREk8h7sQmeNIPAWy1V8gr3aTJs3Vtq1O+uI2Hn021bOtPwxRe
         X5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772714033; x=1773318833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAtyjRxqfQiyhlre0tqh/uCmfnBFujz89wTA1BKqRRE=;
        b=YHEM0CI79JyzFPaUtXDaDr6sMIRSn5U7RNhPONaeHFG7z13poUn271Qhv2XxNCmvns
         qDuZs0Z2XsgVdZ1v4V5tXRrbCyPTSdNhINZSdjr6IXqVQ3CGrb0OmpWulRDJm3s2dhOl
         hgjfz+qPmpubMKWh0x+e8HjhLhVqwvoRDFjF7shAsOfpWRTSWOLGO7GqyEORYpXhCHU4
         EBNI/Oml3DVUE0ZJnY48VS4L12ffzLJkUxzlyphF32cw+6DMAupZJQ1xkeZa2eRqri4x
         8LNjQ73DdSLFowhhc77U/k7wKWnHIdoMlVtBsEOZf3ydaGCECPZNRPhAx+J7DGGLD48b
         abJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVts3UK5UMIwlyx/b7ISP9UBkjGHSofA5QS4rpqwsJnXftVJ0sS/v/cy7cJnplgFqqs0GodhBG2a3o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCBjdfwgcR8AaVhcrC12fTA5MEWSFnFQdcXTGdye0R98bDVp8Z
	G/Rvclb1RdCmNY3tO+lzaWIdBg8JNhWG2HulRM9MtLdyW0Ui8uore+XEX9m9LCwMcc4=
X-Gm-Gg: ATEYQzxR0GBLDwwFi+D2Qy+dqxKlny430BXasFqF1yIY70hGiIhfejn2WnQXbmISlhl
	ECDoK5Def6qZOjCwsP7WtFozS/sqYE/OdkKucJ1ZxUA1qDqX7J7XK70/ifRk2QuWf3WjUbpby/q
	gdNOTcexyx5/qKSDDILkwEVg1+9CYZn5ZeAMepHODCt4V0J3FndJwVcW8fZLT0NV3tJdNOXvZqC
	XH0z0DdQoi37tG8el3JfBuGmXxP4YHf9cZeBDTsA4S/euNpMVDMPAqHzNT9bhkXRcq8w9tTavU9
	LkoppPmDQj3fKh4lvPO3ztwLX3GMBC2v+tYoucciclD9LfXR9D4ohIfHVGfW6as/49E6AH4Q4Dj
	qwsnPXA77SJUOECBTGKMOe6og0VN44ZflbCECrHGIezzklAh6Bu/RpksHQT6DLRAhbrUPgq3LjC
	RenZUYr6A74d6hl6um/ggOCBVrLw==
X-Received: by 2002:a05:600c:6487:b0:47a:810f:1d06 with SMTP id 5b1f17b1804b1-48519828e0dmr93690085e9.4.1772714033117;
        Thu, 05 Mar 2026 04:33:53 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fadeb5bsm55010055e9.5.2026.03.05.04.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 04:33:52 -0800 (PST)
Date: Thu, 5 Mar 2026 13:33:50 +0100
From: Petr Mladek <pmladek@suse.com>
To: mrungta@google.com
Cc: Jonathan Corbet <corbet@lwn.net>,
	Jinchao Wang <wangjinchao600@gmail.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Stephane Eranian <eranian@google.com>,
	Ian Rogers <irogers@google.com>, Li Huafei <lihuafei1@huawei.com>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	Max Kellermann <max.kellermann@ionos.com>,
	Douglas Anderson <dianders@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/4] doc: watchdog: Clarify hardlockup detection timing
Message-ID: <aal4LiOEpO3kDuaY@pathway.suse.cz>
References: <20260212-hardlockup-watchdog-fixes-v1-0-745f1dce04c3@google.com>
 <20260212-hardlockup-watchdog-fixes-v1-2-745f1dce04c3@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212-hardlockup-watchdog-fixes-v1-2-745f1dce04c3@google.com>

On Thu 2026-02-12 14:12:11, Mayank Rungta via B4 Relay wrote:
> From: Mayank Rungta <mrungta@google.com>
> 
> The current documentation implies that a hardlockup is strictly defined
> as looping for "more than 10 seconds." However, the detection mechanism
> is periodic (based on `watchdog_thresh`), meaning detection time varies
> significantly depending on when the lockup occurs relative to the NMI
> perf event.
> 
> Update the definition to remove the strict "more than 10 seconds"
> constraint in the introduction and defer details to the Implementation
> section.
> 
> Additionally, add a "Detection Overhead" section illustrating the
> Best Case (~6s) and Worst Case (~20s) detection scenarios to provide
> administrators with a clearer understanding of the watchdog's
> latency.
> 
> Signed-off-by: Mayank Rungta <mrungta@google.com>

Great addition:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
