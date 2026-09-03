Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4714A499E
	for <linux-doc@vger.kernel.org>; Thu,  3 Sep 2026 13:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788441747; cv=none; b=TjzHYTV3PuSFvCPK4To2VJdpy2+ZQYRmdGYrDrZxRFBkHDfonC8X46vxeZg5CvcHVocStxcIZb0i8qOCM5wBF7cYFgcVyRdLzRcecTsGAHNmicfSGYgXji5Hw9TQRHkAvHLr6oOtBAtJAImV8s+WSdfJFtnkj5M9lLRhbZzs/Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788441747; c=relaxed/simple;
	bh=fBeMkFaC1Cs7R3UZ2FEIJChYmhbI/KTvKfsZ3VllDtQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hsqcHdL83diXSaCi7gVaHSoLhkZNfw8JM9VgjViCvV6Pe1r89xxWOmWLh+hJbDPPRGh7JlkN4L29leSEYtvxTG9JbUR8VDqdGBtjWF8e9ybLmroD+aZlVGRMGwFCU+hsZOPSe0N+KDk+tV0KUQ0O0jFE/k1rWaUhsUS4cDeZF64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqZFWulg; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqZFWulg"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-381b831d535so3806186a91.0
        for <linux-doc@vger.kernel.org>; Thu, 03 Sep 2026 06:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788441733; x=1789046533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fBeMkFaC1Cs7R3UZ2FEIJChYmhbI/KTvKfsZ3VllDtQ=;
        b=SqZFWulg7KvcXlqEnA4Lw6rZd480mwzZMQ5bt05xAUmms0+5HvMJwskTIzh377Em2R
         2cdJgjV/FAUdd0FhH3G7v4uJcWoo3R8fJjPKrJ6U121eVEBGDyhkkK/bwG5B6DdO3yXx
         mCuX59Nb+IW0esKBCg1ccJ/Kq4B6YLt5dpbxahhWG876Q/biKids7bDiP39jU0xzz5L5
         q35LThB18mcFz1TcyQTjq0TQOZHTRZDgqkKxJDnSlbJmC/naWFxpBGLzv/fWr7WW+LFk
         BWZ/omuQQ/Vmypxl4mkYfLb5Swg0VGDFEAz7PSFsRbpPp6S24JD0seJBrsvl9iDqy/mf
         ++jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788441733; x=1789046533;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fBeMkFaC1Cs7R3UZ2FEIJChYmhbI/KTvKfsZ3VllDtQ=;
        b=ZD+cuc/CvSKm+lQXUfcmLs8nRChuIdrwii5ARSgtxM+I/yHq3+GzKjeJDfEtPmASn+
         2nQXfvExRm/hlU9yIh+Qkkh7zrQn/fGsUI0G2K/qOqFxt3aCRIscJoJincft6wL0nCM3
         VM8gEPrS6N6pYPqgdD6MGFF4C3UkvEo9ojd9tY7IDQXJoSuDkvQNJP2CV7r7dPsimDKn
         4E0DhCKpk1ICZ3n/adKc8dDGVZqDKSSd1ITBrrwnlz64/Ana0FpMmsfc84R8yUKzBrca
         FhEbb5483t7SWVBG5U0/KabFIZtoBHDEH4tK6OFGi/ExmhTtK+llmY5cpGttbzvs1fI9
         Nfqg==
X-Forwarded-Encrypted: i=1; AKwUvByjUOjzXqSQ9O1UxwZQfAmerNqZ/+GhiF3Z6yyeIV9oAutyiJ4cXqvf1geVgl2xhrngvprdc+y5jss=@vger.kernel.org
X-Gm-Message-State: AFuF++k6VB3/33mFzLaGwlSrSDo03zTdeOPPSD80BD4Je0Yx+Y/1nnRj
	rTJq0dgrUT5XFmNmKpNU5uaCjdd43LFD9QGV93kJagpVlS1yeVk8v079
X-Gm-Gg: AYBFou0SPTalfFAQtQKae0oerpOIBp1x39W2I+ETJ3qH0/28/ntSkwGG7z4SbsgiyvI
	+hmeRFqq6f/nDl7GajLoWDtJoRK6VN8DsJH/i1EYGUAb5E3dNXZ4sV6jHUJSElASr9p7fVTk9DF
	dikMjcrFyd8f9j6qS9c/Gr/Qo1ETbzLjdZLDoR38Lw/yQXgiPJVUWI8t8aLipnK3EjGBjogwndC
	kmLdLHMJXS3Xrje4xCcu2hcEbFlKbP8N6I4q6WtYBw0rgICqQ9ufplNuzwVu/shmlJSIgvS3tKJ
	Dbf8fGRMbbs/rQ0YWPSMcLwutMzQI48Co5CIN6IVjqj+yDZrIVXKLVOmQv/3DAmjJxpxnutBya5
	1hzXL5YGO4kuUuYUSqWcJs909yUpbW3FW1R86RlCDqUR5v4rNDRe4M4nosHnaM5lJhgmHEPBrfi
	YdODLi8sCuk8uPZqystYn0PQ7aEx5aRJhP69amSm/mUUqY0LAmgw0ffRpvk43B58O/yrske12zI
	Tk=
X-Received: by 2002:a17:90b:2808:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39aee1c63b1mr20007782a91.18.1788441732646;
        Thu, 03 Sep 2026 06:22:12 -0700 (PDT)
Received: from localhost.localdomain ([2408:8607:1b00:8:d43b:6dcd:a4e9:1d79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b07b197a9sm5407729a91.0.2026.09.03.06.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:22:11 -0700 (PDT)
From: Pengfei Li <ljdlns1987@gmail.com>
X-Google-Original-From: Pengfei Li <lipengfei28@xiaomi.com>
To: sashiko-bot@kernel.org
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v5 2/3] trace: integrate stackmap into ftrace stack recording path
Date: Thu,  3 Sep 2026 21:21:50 +0800
Message-Id: <20260903132150.253372-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902065433.2D6361F000E9@smtp.kernel.org>
References: <20260902064242.28606-1-lipengfei28@xiaomi.com> <20260902064242.28606-3-lipengfei28@xiaomi.com> <20260902065433.2D6361F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 2 Sep 2026 06:54:32 +0000 sashiko-bot@kernel.org wrote:
> Could the commit message be updated to reflect that the buffers are not
> cleared?

> Does this code unnecessarily export tracing_reset_all_cpus() outside of
> trace.c?

Both are real. Fixed in v6.

The commit message was left over from the stricter reset design that
was dropped in favour of map-only reset. It no longer claims the
trace_array buffers are cleared. ftrace_stackmap_create() still takes
the owning trace_array, but for a different reason: the text and
binary exports run stack addresses through trace_adjust_address().

The export was indeed dead. With the ring-buffer clear gone,
tracing_reset_all_cpus() has no caller outside trace.c, so v6 restores
it to a private static helper and removes the declaration from
trace.h.

Pengfei
