Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACC21FF7A1
	for <linux-doc@vger.kernel.org>; Fri,  6 Dec 2024 11:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733485514; cv=none; b=ZDMriUpGUTYHQqJijJuUqua9BTWHNeir+tC8kwehlcXj6wyxCVBcvBgwoCD/AlNiLfOSp9kOfbiQiYigUfaIYyNCdwbXPuB26SzaI6bpXJDXYiizdOMzck1UN1jdbrcYVjfhjRYm7Emn0NtTSb54Sx7vExGDPrVqjhhJ7ne7G/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733485514; c=relaxed/simple;
	bh=0vnHgmTteWwStYK2xueEcHJF8y7cqiqshwqveL6+ly8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HeOnyRoslk0pe+9VGoZLMORtgIcklH34pvU+n9r8TLxitWfCTTtydaYsV3efvdXFUQZjhFaA6/jwH4K7ZjrtKV9l+ebZowuTi73VQoaLHhlDLn7YfiUjtvLSfhIHotJrKoTu//i3qKJXsQErOElTEuVK2RvIbQaMjYTfJk4cPJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=txV1F18q; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="txV1F18q"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-434aabd688fso12989085e9.3
        for <linux-doc@vger.kernel.org>; Fri, 06 Dec 2024 03:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1733485511; x=1734090311; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0vnHgmTteWwStYK2xueEcHJF8y7cqiqshwqveL6+ly8=;
        b=txV1F18qwM1inlcZ4qHWWCvwUEnqoV46kUtwtpVwrfP7NcM8Tsl8TYV0iVP33XCzni
         QD5c9H5Jxr+LLfsZ/zqByDjgpD8sEneGngkEBu9RyKZ1hQ5NMmw5OQctw3wJONWOzpoX
         W13Vz+I2Ps3jL6oMzcxV2S0Nelid/7bye+mpZ+WxEQU27+vAy/4P8Xe/5myTnrF4/GBT
         VfYBqIibp6qkNfd1tKAmeH0OvRWD+vG8gAD5cGtHN9/s3g7Hm4LmOebi/HZw65bq9OwF
         QxbaxCJcp0ToIDtVx5970WPtlgTkk84CX1UeB9m2tikSV2eEykEz4n2TRUOf9TV+uwKB
         2Jeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733485511; x=1734090311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vnHgmTteWwStYK2xueEcHJF8y7cqiqshwqveL6+ly8=;
        b=IksK+/ooMqcW/AO/L3rnj0sJTjKMjGBPLu775APZebUYW104/gBIdZwocxxxv/A8h+
         J/H7Mo6bjoTlr5wy+NF7CacYYNOWvoors9vujB6jBIqoEDSNpp5AZG1He0LcMPIqPHnF
         JIT93/K+RW+R7e4KJ8V88AQYm7O/ZFzZFODlsvuPU9T7R23vRcDCpFsiM+OASZonTCGb
         4+sPO69SPQukRwnDaI0uNbJNYJkS2trMCJxaqfvFuZF+YesBNkW/y0ocMH7Mz7oSbWr1
         vpqB+F3APIhlAhQGYgQ5lq+Ho+nut2MznRP4Tciebv6B2qwIosh1H2dTiswcc3gcsdON
         Y/gQ==
X-Gm-Message-State: AOJu0YxueBNvyBnaYaQGFHj1X+x++YkkjEHJloEDVI2rGlhYyZdG6VET
	kQu2iVHwNIsKMfBolTu46wq5aeBJDamT54OjpQLW9aLxAOtDGPGyO6B+1y4gR4U=
X-Gm-Gg: ASbGncudGZjRFgWO8ShPQ1pIXzJ3/xQj5vvF38Pmc806z4VShrUzPBLmPJEJND6VAZ+
	SxcpSZuwOsD/9ihwFRU+P8R+e2GrjGyNzKYdfS35b/XNvWTAfuwQQzJGx6/by4zKg6pXE9XLaQi
	ZAxAXY+CI/0Jyc9Z+QYc7TrtXSchn2BWPxP8oOQ0tCe9JNNSvcUauNvG5ve//dCHl2csEeZo7TW
	VOcSu81bDtFzmbbg04SZOlkv0GMBcvtX2J2AjiCzy3TbT2jlJhWWUYgLSVt0jRoCexwekq96S93
	Oy2Hl8c4hirPAPIiVE34D0wVRiGzOXRx
X-Google-Smtp-Source: AGHT+IFbfiIP2KuUea3jGE5UkSPeOtMPPzWfBogEPMLNzQHpsRB7OE3HGfnqUX4rWOqyvsqUfHyK7w==
X-Received: by 2002:a05:600c:1f8c:b0:434:a1e7:27b0 with SMTP id 5b1f17b1804b1-434ddeb5379mr21659095e9.11.1733485511137;
        Fri, 06 Dec 2024 03:45:11 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52cbd16sm90040795e9.41.2024.12.06.03.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:45:10 -0800 (PST)
Date: Fri, 6 Dec 2024 11:45:08 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
	Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <danielt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-debuggers@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net, Alex Shi <alexs@kernel.org>,
	Yanteng Si <siyanteng@loongson.cn>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	Andrew Morton <akpm@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: move dev-tools debugging files to
 process/debugging/
Message-ID: <Z1LjxHHbFl1qQfIn@aspen.lan>
References: <20241206003100.38142-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206003100.38142-1-rdunlap@infradead.org>

On Thu, Dec 05, 2024 at 04:31:00PM -0800, Randy Dunlap wrote:
> Move gdb and kgdb debugging documentation to the dedicated
> debugging directory (Documentation/process/debugging/).
> Adjust the index.rst files to follow the file movement.
> Adjust files that refer to these moved files to follow the file movement.
> Update location of kgdb.rst in MAINTAINERS file.
>
> Note: translations are not updated.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Sebastian Fricke <sebastian.fricke@collabora.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: workflows@vger.kernel.org
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: Daniel Thompson <danielt@kernel.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: linux-debuggers@vger.kernel.org
> Cc: kgdb-bugreport@lists.sourceforge.net
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Alex Shi <alexs@kernel.org>
> Cc: Yanteng Si <siyanteng@loongson.cn>
> Cc: Hu Haowen <2023002089@link.tyut.edu.cn>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-serial@vger.kernel.org

Acked-by: Daniel Thompson <danielt@kernel.org>


Daniel.
