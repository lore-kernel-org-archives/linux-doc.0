Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366001A2C04
	for <linux-doc@vger.kernel.org>; Mon, 15 Sep 2025 02:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757901796; cv=none; b=TsOWAcQ+ZUeoCZromcGYq1cu0kf5Q+tSdgI1xr35y1RT+Gt4o6RRPFdL/8S6+yqGiGgcS7Yl/4+W2n99SV89oHGNS+CF/wwutGkeTjqBygCSjkoBljQVQxdaBkfVNdP/BWyB2N748Dz/TOeNxH3WHLepzxDa7Rszbg4NAjODzQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757901796; c=relaxed/simple;
	bh=dwEnk+JUy+plSH589xKHA8fu3lw4UwydsjYzisg/b04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hwa2V16luiLWx60/7GJOaEKZ1T2vzfjabluFRZFcBQ5relmwLryYK+mYQE7d4gq/63oIAx0FJ+Dcc6/Z9EF46HnIscCmComlMcCzDJGOOlkn74+PbmZbobUFrlOifjWdc3SW2O/NiiO/iPERLL7HQ6aLHRSkguJ7NBdcyu6pEzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rv6Idl0y; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rv6Idl0y"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7704f3c46ceso3116732b3a.2
        for <linux-doc@vger.kernel.org>; Sun, 14 Sep 2025 19:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757901794; x=1758506594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JOygL22yeiI/c6chOsAL099+jLfX4ygYuBDAjkKbT5k=;
        b=Rv6Idl0yeeUOlPmqKUtz99fVG07ZJdK2iN/x3ppIkVirqgGRBiGaAJsS/gnAgadRW0
         2auYQj+tMxYTlIoF3pS6eG7e4fykWm070s/MSdZ/vDGvnpg956lXJVdmuhc4Wl9x7Wm9
         p97QO3U7X2RALUZCRBXTtpvco+axu40xlvQX/k6D9rgIs4ontpY2Y+Wn9phfKhloIfZj
         D4qOOF1XTJeACiU1dS9iPRHGY9FLSoiTd/iHGFQ9g7o5iJ0CzwZvxLWs5LtZ2yx7az1c
         e3Lbn16MUqWOppXSDk+aAcgRD5/dzkXnBnkinscXYgLi4he3Gml1pJBGjnX6HSF+JgwA
         8Xbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757901794; x=1758506594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOygL22yeiI/c6chOsAL099+jLfX4ygYuBDAjkKbT5k=;
        b=HnZukhQDUOkvYTrzFuTOqsXTz9SXTMwmFv+3vX0COAge7QHpboooon3F/pG1HDJQAF
         KuUQYuiTNQivl672lbazVCPtuj8ZVSp1GsLuzV2GFWoXEyNXWESfDSaic4MtLWDpqtY8
         zgW4lJAf9p2OkmWUQkoocjNU3W+fMM7NCB33BDT5R6WJbT1+CL8BGvmtLjnwyVa5Xhwz
         CToxg7gu/9uh78Xo54WeXyxP9F8KhmDgxMyaY0VLwjffXOejSAwhO3bXKbFoSuNBI5MY
         R0IdQ6DrO9Vcx0kfroDv9Zc87azbLWCahOuvTlYJAZmjIngWFwRClPsUXf563s9nLWR1
         A2hw==
X-Forwarded-Encrypted: i=1; AJvYcCVMcE4cSFZhnEth0PFq8dM+GQDXd5KWuyyCxmMkjfWl2W8i5p9OvRX/lhjQJ9A2Sbkf1A69vvJZoQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVCXJstNr8Lm7BYJnDUhKqby3FvoiwsLZXXxI0bG9jmWTBfQOf
	g9v9qKt9GO9oqxRkMyLbJa07zRJ2TNpquBoRvup7HRFJJsCxVll3/xxW
X-Gm-Gg: ASbGncvSZa1dEdzkOkc5xJ1xFixVvKX9eh1G/bvu7sCAU+ZKz1Z78mJw8bOcjl1vFX3
	N1vuo00jJuo9kdYHUHK7a27RgZjIxIEOuKftmfE2uyE+sNuk0hl4Sv/8OKTETbPwpj63GMqHj05
	GSTs+rhUNS2BMxtea9WNiDQm/5MoLd3cBK36eCdrVgEYyla7G59utwwnf37EHx/9t6oGtaZdTJF
	dv2wS9aVE6jbCASPsYBHSt8RzgpdrIBYTJOPxmcTTz+HDetC8C5Ac62nJaujeKKOhG2W257Q5wy
	7p2b0DNuuJSY8f2jr2SEt2RsLd/0r+BJyV+EYp/vO0j5543A2st6EiBMqCpRy9mtIlopaujBcFT
	WvPPuOmMk/VcTjF3S9ehqL22CuPYGWkIzsaSK1jY=
X-Google-Smtp-Source: AGHT+IEeqkh40QJM9zjJ8HL43W+1enVBlgkaCaBCrqZXNAUnxXXVQNA79eZr3zdQ3nIBlPPQ1opd6Q==
X-Received: by 2002:a17:903:f85:b0:260:5bab:8cad with SMTP id d9443c01a7336-2605babb245mr90876965ad.29.1757901794287;
        Sun, 14 Sep 2025 19:03:14 -0700 (PDT)
Received: from localhost ([185.49.34.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-261333a972dsm51596705ad.75.2025.09.14.19.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 19:03:13 -0700 (PDT)
Date: Mon, 15 Sep 2025 10:03:06 +0800
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>, Rong Xu <xur@google.com>,
	Naveen N Rao <naveen@kernel.org>,
	David Kaplan <david.kaplan@amd.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>, Nam Cao <namcao@linutronix.de>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-mm@kvack.org, llvm@lists.linux.dev,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com, "David S. Miller" <davem@davemloft.net>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v4 15/21] mm/ksw: add test module
Message-ID: <aMdz2gMb5YC3G3md@mdev>
References: <20250912101145.465708-1-wangjinchao600@gmail.com>
 <20250912101145.465708-16-wangjinchao600@gmail.com>
 <69198449-411b-4374-900a-16dc6cb91178@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69198449-411b-4374-900a-16dc6cb91178@infradead.org>

On Fri, Sep 12, 2025 at 09:07:11PM -0700, Randy Dunlap wrote:
> 
> 
> On 9/12/25 3:11 AM, Jinchao Wang wrote:
> > diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
> > index fdfc6e6d0dec..46c280280980 100644
> > --- a/mm/Kconfig.debug
> > +++ b/mm/Kconfig.debug
> > @@ -320,3 +320,13 @@ config KSTACK_WATCH
> >  	  the recursive depth of the monitored function.
> >  
> >  	  If unsure, say N.
> > +
> > +config KSTACK_WATCH_TEST
> > +	tristate "KStackWatch Test Module"
> > +	depends on KSTACK_WATCH
> > +	help
> > +	  This module provides controlled stack exhaustion and overflow scenarios
> > +	  to verify the functionality of KStackWatch. It is particularly useful
> > +	  for development and validation of the KStachWatch mechanism.
> 
> typo:	                                        ^^^^^^^^^^^
Thanks, will be fix in next version.
> 
> > +
> > +	  If unsure, say N.
> 
> -- 
> ~Randy
> 

-- 
Jinchao
