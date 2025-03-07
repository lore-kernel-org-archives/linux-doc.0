Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7FA23BCF2
	for <linux-doc@vger.kernel.org>; Fri,  7 Mar 2025 16:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741364642; cv=none; b=cWB5QKGQ3kcc7aw5RGu1Fp5fYgFTe0Bsc1in1W/wjp6WW6LAMa/xhZfBm602zy+4ofu1QdejJa9d7cqzl6m2nox3WJzW3yW8+VJtxfGQF8+pzheDN5tv0w48+hpYWIOQmLX2hiX2PY7pBrYLQJzBqdh9L0tpiD8hA+k8eWNLKp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741364642; c=relaxed/simple;
	bh=mXtKy6AqPJTsyZQnFb8LDOzMrVCF8Jxpd5iGHDtoCGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKbUpD5+NI3LAVM3AAaYXmage/5WgPq86X26VY66NQG4dCZ3ehgOPI2o+BwHzv72HOP3WnYJfnw+XczIXZZvGB/USUak8KReqoidceIVnY4LT9od73jLFDoMcq0wCvBzgUWKQcgta+MVEPRVpiNU4Szb6oH6HGyhIIFaz6UZnNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Z3h62ObV; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Z3h62ObV"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-390effd3e85so1864158f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 07 Mar 2025 08:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741364638; x=1741969438; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qFC22TuZGe+bG1f5l5pg/Qemq+Rum0/SnOpCdO9V/4E=;
        b=Z3h62ObVMeGJPieKQt3rx0AECyQt8nD55EakDE6+10CK8l/oDR6j8n17mRlyav5VaK
         +J5PZcp1zeIuKoJi/IF0pcT6axroQOsFpJu3B6XlNAbTbZ44VL2UPmiGXI4atPvMUPvw
         k7W39V/KdvELNNYVOnwBIAVHaeL0k+w48aPMkpYJq1q9bPMc24PISlA3jE/JUN3izZNJ
         g4tarfag2/SWykLqOeCt/qhJ4AoA5qGz0FmMexxqszHLiaqxEZ/SqFA46AtnRRorecmV
         dGgc7stlZ4eSivUucXSGKHRoXwLWB3ruT/HrZld3uOGjySHpHx2k36IqToUcdZW4SXFw
         qinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364638; x=1741969438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFC22TuZGe+bG1f5l5pg/Qemq+Rum0/SnOpCdO9V/4E=;
        b=amk1O8jrlAYklRHcnJ4DP1bTlgKpu5/pcSJrfq6iw6IwJ/7cdcnMKvpTsqMMwZGTHp
         obSlw45AsqXyHFh/wQ+vEJsVzHpCcCn7TZRDPNJyB9nhQoyMatACLI8ffbRSCwueH6fh
         Ln3uqTEWoOj3oAHCfwx0dGQbXhDOFUV3YKm5CfaMjFb9v6MauE7+b5O+zXUPOnhq1/xZ
         FA8jN6pZ9wMxGT/lrFNFNACsyAthi9BhmD2lnPmo8X82IOmsONTaNTa4fZM18o7Cf7bG
         xGZodjP5uiTKJ4c5DiaP7CjyeIQt8m56i4dEt9prJqXUUT6bHe5ZBzuCGuhtY0fpAiBT
         G3Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWKkgT8Wm9nZiyT4rP2FfiQZK0oUQOw0pW2fsgIT61Kmk1ihxb8ZfCmIjUtpOgAKjY6wCMdziMv094=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLSYEL7deYAMC0yMKnb0YeZV6swEvLi+AXy8elaJWnpNLCBIvm
	wYu7T1tAVfg2N7UVOhUnDxQbJktenoenOiy4QBpVxxGD/of0fYb06aRp0YjNT7g=
X-Gm-Gg: ASbGncs78i6A/QwAOs3AzMucGrr7VWnxBjGzKA3R74valJLC4aHv+KzG2yLfOklEauF
	rwMxyI48X787X3YaiO0lof3YwJdiIwoBZGz9fqKmbmxhWx0UbgqIF4dxIQahceplnAMcsofsjv+
	jMiSDvD6Iy+9dgevsqeISwlo0Qf+2LzXSRU0qAJShmHH7+RxMa//WNSOsoIFhPPT1x8gduH5y6N
	zr1rxpVA1v2aPyEihkjMmZ3wqdOyyfR0slc+0UnVVyEGHARN4DnVtYZ92sOlykaAHlFZVOEIvPQ
	iBqWTh0vDIhdTO8VlLfSWIqgdxmxbzjXldwcSLRGvr+ahWs=
X-Google-Smtp-Source: AGHT+IHn0r2Cn/E3lALMkI80pL0QtaTbm6Rd+OGBd1NolTMQ0z7qv14g2CG0Lk8XXwV55vp2Eib2dA==
X-Received: by 2002:a5d:64ed:0:b0:390:f55b:ba91 with SMTP id ffacd0b85a97d-39132d4e369mr2759140f8f.14.1741364638354;
        Fri, 07 Mar 2025 08:23:58 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c103035sm5731100f8f.88.2025.03.07.08.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:23:57 -0800 (PST)
Date: Fri, 7 Mar 2025 17:23:55 +0100
From: Petr Mladek <pmladek@suse.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>,
	David Gow <davidgow@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 3/3] printf: implicate test line in failure messages
Message-ID: <Z8sdm7Nhk4h3hoUq@pathway.suse.cz>
References: <20250221-printf-kunit-convert-v5-0-5db840301730@gmail.com>
 <20250221-printf-kunit-convert-v5-3-5db840301730@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221-printf-kunit-convert-v5-3-5db840301730@gmail.com>

On Fri 2025-02-21 15:34:32, Tamir Duberstein wrote:
> This improves the failure output by pointing to the failing line at the
> top level of the test, e.g.:
>       # test_number: EXPECTATION FAILED at lib/printf_kunit.c:103
>   lib/printf_kunit.c:167: vsnprintf(buf, 256, "%#-12x", ...) wrote '0x1234abcd  ', expected '0x1234abce  '
>       # test_number: EXPECTATION FAILED at lib/printf_kunit.c:142
>   lib/printf_kunit.c:167: kvasprintf(..., "%#-12x", ...) returned '0x1234abcd  ', expected '0x1234abce  '
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Just for record. I like this improvement. But  I am going to wait for the
next version of the patchset which is going to add back the trailing '\n'.

Best Regards,
Petr
