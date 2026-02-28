Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEE82DFA5B
	for <linux-doc@vger.kernel.org>; Sat, 28 Feb 2026 01:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772243519; cv=none; b=MN0KxMZrkDsnSb1jM5AJ/PrIRtqO4gkYL6sGDhBfY233rnYRgVVHiiu2muHyCgCCmExIl1f4bBCpku1KO37O7has8Pu2QjzZ2+AH5pYzTf2fszGzxLSi98wjvCGCC45P54WgPfZSAXoN4TqWJOVs3VwlcIY2eh3Xwz9jqwFKAaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772243519; c=relaxed/simple;
	bh=p84/9c+lfZlazK4tZjfQ3UP88youLp7IknBeopFaKlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+7PZ9zz3Pi6ZCut7R89TFAzfakFvsc7Bv44jRH7LB3pM/7HhXmCQ3IkgKkb0/yBBWibVUjPJY7f5b06nUMZd+NoGof503OzdtDTIClZ5QI/i5nN2TKDXNA7y3oVh7r1wf7WgtpHO+apZiiUoquIKlyYh7L9O8Eobllvvm3/SNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbOyvab0; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbOyvab0"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-124a635476fso3222067c88.0
        for <linux-doc@vger.kernel.org>; Fri, 27 Feb 2026 17:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772243518; x=1772848318; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DxpD5YhuPnDwvCwH7jLspwJr53qOub2weuQCgq+RP8s=;
        b=LbOyvab0mMG/nexCqSDr/oWQHj9zaGPfgZndJTOHAj2iyBy5NsJU+cmwoNgV0w4kYk
         p8GggKd735F8EPEVfJruGMJGl3vOywRqfXrUBF+ozdsyPwamlcXp/Fy5eMeglWhSCl3w
         FWt/izFciF8PJF2YptVYTuJKfwtlRUhm1+qESuLkMReHaTB2qTmhLwo8pcgumW3l/eQX
         VXIJLNNPjjgFO87tU8bKUe6769AaLFgzkQbtrFivPeG5ir/zNsnixsFLBH60IR1lVkDO
         axDYmPQLZXyi09z727BRFZpBK8+Uwny8ksBiIR5jl3l1iOZrCF0Z+QNjtJgaCjT08GhS
         Flwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772243518; x=1772848318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DxpD5YhuPnDwvCwH7jLspwJr53qOub2weuQCgq+RP8s=;
        b=cb5OHYbQ/HimSf2pOX+SavnWtME8rC9+lD/AOsPiMPv10XIrZ9Q4HRh+gPCms5r/Cf
         u/1FmFa+3iMQ384ZX3E3mmFornOEKUM61V0GHJ2fA/vBotE6Ujx/DWJyf1njki2v51+R
         N2EUeYAD3RYSHxvQJQ/NxowOV8SWx4D9bwXBoshcL9Q4MS1Jb2OM1UrPkEc0+HFYTa0m
         gdsW/rG/Mewv0iPcUSI4GHSSBTB2NlJL9LtlqPM80sYW/kuW30UO22LtGQpYe3IbgzII
         OVdqjO6ZoOCYoeY05aOvw7F9lzMu0ad83bVl04qEa8jz8YX8kppuMvmpYdGRIOG6vmLO
         kvtA==
X-Forwarded-Encrypted: i=1; AJvYcCVjHX+AcCW/o+/L3NFHFEYnsRMte0afzeOUrD79cmnE/dxcIBSswlO0/sX0S6yPzZOq/1BbPN6SNNo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbQwZkVDxK/roVt2nqkaK+lhVmgysfyLTDfr2XAZ7U1DPIj5ir
	FFWMZ4P0YfLMQOHovzY1H6QgcecMU83VLnAAVSeEy9ciK68oyHwqXwEK
X-Gm-Gg: ATEYQzzDWAjYFaC+dPYH++OgahXv3/YzkmnP/07XHlREO576Bd2X8xrDAhR7hNJQ9Og
	XBVhJNx1HQAtENjNZTGWnveKjmfzNO3bobquyJFG6C4YTqsruoyJuQzqLtgPMR9V5NoV9rw2vyg
	7nX3sgQRc38y8SCu25EvG0IwYMfIQuy8MOAoBwbMj6zi6Lhtq4+RFETFTU33GOUlcUJZq8efknf
	s+D9GvsdzdrVbTNVCDvy5extuTtFOmN4NIJNqkU5QvetpmXIau0lHOIXlQlXVA4XZ9jKuo7eK/i
	EZP28Km+DhZlUU0kEKpfGZ2tL4e3GjCuBNmpkJRVmnspDBsPGtZYLbNhrpV6XDL7v0zj+BE94zE
	pInGgfQeNHoMM1DEHtGHb57HDQtyQVKdf+pO53V9foPI28pXw794J68wviv8e6U59OinwIEDXYV
	CZN8Xui6ouS9xoHad8FsM5zyVdEl9JNNJsp9Zh+WRQs8BVxVk=
X-Received: by 2002:a05:7022:4591:b0:122:345:a944 with SMTP id a92af1059eb24-1278fc1f72dmr2016517c88.29.1772243517474;
        Fri, 27 Feb 2026 17:51:57 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127899dfc47sm7200767c88.6.2026.02.27.17.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 17:51:57 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 27 Feb 2026 17:51:56 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/5] docs: watchdog: pcwd: fix typo and driver info.
Message-ID: <bf38c59a-a719-4599-b1c6-802d06722e29@roeck-us.net>
References: <20260228010402.2389343-1-rdunlap@infradead.org>
 <20260228010402.2389343-3-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228010402.2389343-3-rdunlap@infradead.org>

On Fri, Feb 27, 2026 at 05:03:59PM -0800, Randy Dunlap wrote:
> Correct a typo and some technical info for the pcwd driver.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
