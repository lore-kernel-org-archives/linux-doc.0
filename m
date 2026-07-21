Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE6E30C148
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 12:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784638117; cv=none; b=brl+oAWEZAmwPT7Km1gEoBvR2v2oPAUDhRC4I3XM2V9DVrP4PP9mL+Ky7dfho/wyQIWNIuMTlAkd2ezA9j8h14nxwoPJ5jPw0+BgrmdqYFDWEwy/YKmKwykgVKLwDkEwuGArpLA/HQJqTi/jC5UgxBWN75v5hVF3nPhqObA1X2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784638117; c=relaxed/simple;
	bh=+3pPPzkN5vSN5uc06d/jwUE+LQ23KJmEngSIHcTZfSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IXd7yBiSudyEuzzwADz6zHY+K0aIfW6tJp5gHdr0JEi2SjJOvCPBB9yqsuFBH9SWPnZvm58Ipl2JZ/ouNU904veJubqSYOZEdVNdsQEgsHXzF0r63kT4A0l9xpd1Vv5jPayOBKJX4eNQ9Tue3R9r4OTGHJPqUmRkmMCf2NdHlPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kyyZpskx; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kyyZpskx"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6a168dc590cso437856eaf.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 05:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784638115; x=1785242915; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f9BdUyGIX1sBYdd4LfNbX4BHjyUWmMKKhhuvfWpGKTI=;
        b=kyyZpskxRIMFVzDhGWhVTDRIY3ucz1uBiZD5JhdQEBmfQtbVUuZfcpLhDbCnyAKW7r
         xgXNiSB1WFi3ZYQsbrh+SP/P+H4dS6YnluZ+vS3KqOeJcC0msl1TYlMbvZH4W8C20DBg
         ATMnMfrXr/+WBR8YpJ/chFVDDlBSE3Wfnf6hooPPflJ0zXYTOGvQmSdljeYvYYYw0t00
         96SlYwx6DDckhfFKkP8M3wVdu8rT+x+cbnnzud2LQ/QcEf9rxB9YhwEKj5xs/MT8ftmH
         isWba7m8yk68idBUVVFN0IP4Q0/Xtfers/POhHJclHVznig4yLcd/s1yVCbT/Jj46y/W
         LUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784638115; x=1785242915;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f9BdUyGIX1sBYdd4LfNbX4BHjyUWmMKKhhuvfWpGKTI=;
        b=l1FEGgtAuVRCZe90A6QoJvHZogqDIzuEAGZB6j1cR+XEmPcuGw7aHLHyaQOKW6i1s0
         NNhpg/81aK1y81EjNSJboIIX9xGAcorCZXx2QRKMKzE/AKwgVlvREcem1mBD37q4tLcG
         70IAlehR/B14PfJGCQ7va9JWs9NrKat9OnmJ5mMURYR69Sg90Ff3rsTnAXcLgRUECHPV
         ueJDa9fJfm/scMzOD4UCkL3Lmj3EZetG3tiEHTZNbnzelvHAkltVAD7dwECh70nHUsL6
         8IVYnGXFoBiiaEZ89PqB70iItqXgCUlGk5X4BNrzKoH6Qr31/JUdWKzN9mjbTdnR9Q/O
         bLKg==
X-Forwarded-Encrypted: i=1; AHgh+RoOxxBH5DdupQa9bx8XehjFnlzzv/DMuy21HlUcvahgneSfm+C6/eIY5zAMnAb+ESvlvGv8fG6kqAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4B4zkykwij+Tb+1BT4j23PgOVok0Tp02oRbQTQg4n5qBwsF8W
	T4JrpV7hwpRSPx0dwbuM6mJpDTEUv6PKXKjWcYmlgFlxoKx9H3v7hdrU
X-Gm-Gg: AfdE7cnxkk5S21WIxGPRxg7z9zGrZ2tvhzdTBVmyAWPDUgk/1i2PUFTZ3yHDTEG9pD5
	v16VrKdEO/kl/P6/ShYRbxiFr+ozU1bUAsMcZBQtSD2PEivf1ZskfRA2nC/gKYHaVvuuY/5TvOL
	IG91X9Gm8W+tQFzbLwzUgSI/ZWU9hjmbPul27dupQSJXEKCzRS1uRjUUBv38kWC+tu+HIdDm8tp
	HH9GUnAGqaotv+tbYWbcnRiJR70fEXDCrzszz1xW5KKQyuHBGeaOOXwfl/L0YYlAoII/G829GEs
	+l+X5PuPTZaoiSAe/fKnVtdSJAWsBCC4TEXWScMyzrPNWzEe19lqbFnyVANmkzBI+fYMVYpJTb4
	SoeMT8flrcddfZKaljDj10EUUGD6o/FO+JbBfuejWKTA9sHKSWZxqOebTVs2QloVkfEr7yfC8y/
	+8YeI88A==
X-Received: by 2002:a05:6820:f02f:b0:6a1:8cd5:c9d8 with SMTP id 006d021491bc7-6a536ada646mr9327016eaf.68.1784638114876;
        Tue, 21 Jul 2026 05:48:34 -0700 (PDT)
Received: from [198.18.0.1] ([144.24.58.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4568e0bddefsm11251568fac.4.2026.07.21.05.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 05:48:34 -0700 (PDT)
Message-ID: <f23b0cf4-840f-4fb0-aab5-750dee42a7b2@gmail.com>
Date: Tue, 21 Jul 2026 08:48:22 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 00/13] mm/kwatch: dynamic hardware watchpoints for
 hunting memory corruption
Content-Language: en-US
To: Dave Hansen <dave.hansen@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin"
 <hpa@zytor.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 David Hildenbrand <david@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Matthew Wilcox <willy@infradead.org>, Alan Stern
 <stern@rowland.harvard.edu>, Randy Dunlap <rdunlap@infradead.org>,
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260717125023.1895892-1-wangjinchao600@gmail.com>
 <91f3486b-3b85-4b43-b099-0a5325643352@intel.com>
From: Jinchao Wang <wangjinchao600@gmail.com>
In-Reply-To: <91f3486b-3b85-4b43-b099-0a5325643352@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/17/2026 9:41 AM, Dave Hansen wrote:
> On 7/17/26 05:50, Jinchao Wang wrote:
>>  24 files changed, 2115 insertions(+), 63 deletions(-)
> Reading this, I wonder how many kernel debugging features we need. I
> don't even think we have a centralized list of them. They all just live
> in their own silos.
> 
> This one really seems like a super specialized tool. It has to be
> enabled at compile time and specifically aimed at a specific function.
> 
> Maybe this should live off on the side for a while. If folks end up
> actually needing it, they can point their friendly LLM over to its tree.

Thanks, Dave.

I agree that adding another standalone in-kernel debugging facility of
this size is not the right direction.

The motivation was practical. I have encountered several silent memory
corruption bugs for which I wrote similar one-off instrumentation to
identify the writer. KWatch was an attempt to make that technique
reusable instead of rebuilding it for each bug, and to reduce the same
setup cost for other developers facing similar problems.

This approach proved useful for localizing the dummy_hcd corruption:

https://lore.kernel.org/all/20260714064829.172098-1-wangjinchao600@gmail.com/

It identified the copy that overwrote req->complete and recorded the
writer's call stack. So I believe the debugging use case is valid, but
it does not require a separate KWatch implementation.

As discussed in my reply to Masami and Boris, I will stop pursuing the
standalone KWatch series and work with Masami on implementing the
necessary scoped watchpoint features in wprobe/tracing instead.

Thanks,
Jinchao
