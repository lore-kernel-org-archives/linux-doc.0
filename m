Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6616BFC0
	for <linux-doc@vger.kernel.org>; Sun, 23 Feb 2025 04:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740285833; cv=none; b=B4/jcM5PBB4itLBgK/PDIUI9T5+kmTNO1kHZAUPOq+8OYNy0QJefbWR0TLWn1ioPIAEF4aFlNohw8o4N7NTmJO1lARq4vlaZr2GXaJtBDTAn32zgtLBLFjxuytdMDSRz1gaO5x3XDlk/T/ZwginunuwoO2FqgMh7QbvsHSgbyKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740285833; c=relaxed/simple;
	bh=i9tHIKyqmu0Q7kpPH0LVIjeCVdtrwPNfa6arnASFBz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gotUlSC2fqZF7s4MxhB2P4wisX1hre6a5ZKhLlahlTX4VVz50ejNY/wc7+AlWVW3qDN31rQgQYc6Pq6tl3JA65Slx79JM6WfIs+EC9VVnqI6VPTb1eCVCXWw3dRrLF0fPr6ByZkt2a6hAXX98PUDaHmqSXSA0ydONEAkF3nLrf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hztEzTdd; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hztEzTdd"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22128b7d587so64418815ad.3
        for <linux-doc@vger.kernel.org>; Sat, 22 Feb 2025 20:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740285832; x=1740890632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2+tMJ1ZcQLlSRLqu/hmuLSa31oLRYWLyKNWd9xYEiwU=;
        b=hztEzTddYJKFl/051ATaXKmQV78gm1xrARE6Fi2113xUgbv7/n0ZmNHkHcBwEjFi8u
         mwqxOUYvtFq/xYhkrMpGPmoX2nQmb1q2mZJ47Ph1Qm30ZT3cQ4MO4sK8BT9xPZWrb71B
         gbuHrtW1ojlzNi1epoLwn9xiwGtvZDm8XcWonvDUV0OXhYOE++3oo2qPcYwOmAfXF2f+
         8yp4ptb8yfcmesFHXCLz0leo6UszuT3XzGrFGakLrC6zkUJGK3fWjn0hiegtRtnLfHbQ
         ua/xu3Xapt7BwIj6iDN6XLnSlCeko2Hb/YF76OmMneurZGm0g6NwAqn0HcLG9mRU3quf
         zV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740285832; x=1740890632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2+tMJ1ZcQLlSRLqu/hmuLSa31oLRYWLyKNWd9xYEiwU=;
        b=Z0fKreRP5jiXDMNrG/tEsEDiRZ9YSfzgp636y9BY51MHK2HxCYFmb3wVUUopUBLkss
         H2eQt7AwniqAxIMWJr1wQytxGPOk9k98R77nKZYF2iJYqzpkIuAvgIMjJMDd8MSQny2m
         +6RbygYbrg2Hr4K7tSS/piLBHfQZE81li0Iku0PcTZiSQuU8qPN2/T29BM/xYzChN/sB
         s2ICt0N4vxN8LWa45hWp/K6pJPwTIQlOb1Qignmn+I5OG0d8N9meKcOJMqnrdnwt3RyN
         O585MvacMCarRmbch2xrrCK48CtCOl/ZZ5ti+UrsR1kRibeiyB1iqZ3ppc4C0orKGBcs
         3c5A==
X-Forwarded-Encrypted: i=1; AJvYcCV68x6pLBmfxzmcJRRXGy1IrZ7O3n0r4VWOpJH7ume47NRPhybcQMFmm96BddqKSHHDY1qYkgoM8hM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHyAi9GKXKUYSieutjey4kfClL4jXHJGMu74mic2gLWY4Mkijk
	H1r5nSWBAEQ4Bsx5xiMDm7ATeZInP0hoc5AYqEWIAH1mXbthaEHl
X-Gm-Gg: ASbGncv/YNRhlCc6qyeeFZLNqYlk9OD2T/o/F7o17I7vmzcpkE2gvUoSpY0U9dfgBNJ
	m5VgRyNYe51Uz55CBLeRTRe6VEFHh4A3yOBTsS12PyhFZ1GW3ZBKb2gsYBbsroWzbKLaNrh7UMn
	hkIEoz3WkQWq76M6I79RlNbjAqknPNM3CHE4RD/X4FstLvkDV6tQ4AI6WYIq70fvyLp2NqcQ8Cq
	UVvKVFtbrBIlbf7TnPVXB+A5z51kVOMDBp8vhXb/iWfEUJjpbpt2ESLWB/JE5NijRtwuMHhzWaN
	8SZ9gfvuiT8AWOjbUgrUYS2u1oi2RF3M5zxqIB2odotof5j5dMHdxO+kcSnz3pGwOz6huy5y
X-Google-Smtp-Source: AGHT+IHW0UWNrtPqy+uW3vUwFT6Cz5UXiypn/MgMNrqL9tryxo0RgH/IXZyhOQm2aOmk7QgXSNwIyQ==
X-Received: by 2002:a05:6a00:ccb:b0:72f:590f:2859 with SMTP id d2e1a72fcca58-73426ceba37mr14386101b3a.13.1740285831611;
        Sat, 22 Feb 2025 20:43:51 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73261ca7831sm14959437b3a.104.2025.02.22.20.43.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Feb 2025 20:43:51 -0800 (PST)
Message-ID: <22a3bb4b-e21f-42e8-918c-aa841afb3c73@gmail.com>
Date: Sun, 23 Feb 2025 13:43:51 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [lwn:docs-next 66/70] htmldocs: Warning:
 Documentation/translations/ja_JP/process/submit-checklist.rst references a
 file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,
 Tsugikazu Shibata <shibata@linuxfoundation.org>
References: <202502230433.CqluCtW0-lkp@intel.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <202502230433.CqluCtW0-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

kernel test robot wrote:
> tree:   git://git.lwn.net/linux.git docs-next
> head:   76a6782284dff53a08b688fdead3e46f22236e71
> commit: 991dabb24232d94c04053955af8e85df72a1e2b9 [66/70] docs/ja_JP: Convert SubmitChecklist into reST with belated updates
> reproduce: (https://download.01.org/0day-ci/archive/20250223/202502230433.CqluCtW0-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502230433.CqluCtW0-lkp@intel.com/
> 
[...]
>>> Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist

The obsolete path is in the comment block at the beginning of the file
crediting the prior translation effort.  So the warning is false positive
and I don't think there is anything I can do about it.

        Thanks, Akira        

[...]

