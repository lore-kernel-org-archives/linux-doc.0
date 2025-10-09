Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FFD2D248B
	for <linux-doc@vger.kernel.org>; Thu,  9 Oct 2025 09:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760001181; cv=none; b=RBacShAqh/ClKP+qTJVoyac+uZ3l1og6VxYZdCCP++wKLhVg1deJWyNnylZBOJaVEPA4GAYRfGYSUiG/vYt0IgsEyTqk2TfUSjUmDoQ/i3qMAhtBKb5OEkOaCSP13v5KqYu3C5UwSQL9dLCkXrAamaJZy9djZsqQk2BvF8NqUI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760001181; c=relaxed/simple;
	bh=7ov7X+H76YZ2kZPkU1rlQnIlT1HTKwdYcsZHXhrLcLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWFG9koA99Q8P5e5qk16/dA+72Vhgcfsmce7gYp8nc7XsATeWfGKnFhdZJVpgEnmCvvuYl9TGfZOUY8nbstfUtg9p3MnVKc3yS0i6vZjKQvPhyJzKrFp6kpzMYify8mtko202iei/lOy5HMcpoFzlQE2+PWBZl+DiORMXPJih10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nW4/S7E3; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nW4/S7E3"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-27ee41e0798so12112795ad.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Oct 2025 02:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760001179; x=1760605979; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=noGJIDsEGpbT4mVPtLItOHBIizt5I7YMxK5vpTBOvYc=;
        b=nW4/S7E3mJPgJ6jQdfxNFdKrAE20n0t2gB7AcVgIox9uLACU6iJgIHPZO+oPqwtKXE
         s1SHyT8RJPJ6IqzyjYpr/aS1Y7/6wP9n9ZofH9QunBe8uVE7De/4g6pEc+jG3IYNNKBx
         LlyFJ3EpJoUMYtr6SFRcbuisd1psr3+7y4lhCYh/IRELHsfyEQ7tn/GH8HzolaKSBjpX
         wxyumOy/PhI4FwjHTsNBJV/kjPcFwMloZhZjpySdwyr3cJn4j9HMO+2ftCnvuJd3mRKU
         P+JB08ekaTf08VpgDviak6LkMEQ5rsuOC6KcnEJ+hb7IbWu3HzPOlwo7IkYAGGz1WB+e
         LzVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760001179; x=1760605979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=noGJIDsEGpbT4mVPtLItOHBIizt5I7YMxK5vpTBOvYc=;
        b=fqKdSbI1RIHCUR+8sQfqboB2MVOF5zIbtUzcMF7p4yDj8Q+dT8Qce8QGHa1SQck8fj
         tY0JUeL3HjrgvLIH3hKmeWJNGLo+pe7LlLd86xoiBgX/1+mWt0S5OKM45OWHv9Z0C6J1
         6b+sQo/aYCse/RqBtTf/EFKaVoRaozU7R24uzxxavndF9lCCTOdq8kBzyWUIPtzA0xyw
         xzTL5/qY5AgjaHvS1jpSfyxr74SFoJvXpyPckzWil+osQMUgufwFWFFVAHI1RenBZNay
         90Z2dPq46yxdhliZicceGk7JciskB+MFtLevMJy9FoDQbAd3/zZQ3oHhzM0yuNLISRoC
         1DqA==
X-Forwarded-Encrypted: i=1; AJvYcCVCXyd3RXJLp/6U4aIcHFCuDHu8jzWVe37f3DjkTa/NAmAJyGgJhr/cInFMLRtFLuTYd+rGK5W9FfE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5GhSu4yt8ZOG4kXLbyJ1W6C9z0m/xMCqP/gLQAAScrnpjnewn
	tcfi4XJQUYlSSdDoydy+BCy8OEQTKR+IP+5LNTGjvKM7NDlMcjBu8Lbp
X-Gm-Gg: ASbGnctfj2itTTHDagOzTGFiixZn1WeAv7vJj0E8snRhbk3RPZCJqHe3ekJ90RM1ICl
	R1NYCa1EZzYp1I4+2D4Iz0SKYc1ZFBROV3b40o1QMIuJHXjrXuFTNs1gfGM0z+zQPPzgn0D5Dby
	1e/pq+VYW8LiajxS6zH4vCQELSMyn/AfkhUe766nq7jtvyS46gEBh3KjOyQvnxRK1iumlGfC8p8
	vcxSN7HceEV4LKqt8fZLffvYDyYbD93QOONtaq2TGq0CzGB90o+eoSAyKpGUrFKnsf9EGAmGVsR
	A67zM1R+Qrsl9T6nwMUuKx4xhshmLEiz6Mga4NyeB1RaJ7/apHuYnrhnOJLtVu6Wxn47FH+3gYo
	OnJURBwht0cnos6wQjF3Hms7t4ia+E92SI3C6lp7JEwHWC/aXqAlvCmBSu6uNKg==
X-Google-Smtp-Source: AGHT+IGgc722wX6cnZ4WMCp7pNtwV85yDs1WMyb3Ue3/XLDo0+KBsbutwCUcBiVTue/uMgVkYBWZbg==
X-Received: by 2002:a17:903:8cc:b0:267:9c2f:4655 with SMTP id d9443c01a7336-290273ffcf6mr78713905ad.41.1760001179036;
        Thu, 09 Oct 2025 02:12:59 -0700 (PDT)
Received: from localhost ([45.142.167.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f3de4asm22026565ad.92.2025.10.09.02.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 02:12:58 -0700 (PDT)
Date: Thu, 9 Oct 2025 17:12:50 +0800
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Jonathan Corbet <corbet@lwn.net>,
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
Subject: Re: [PATCH v6 23/23] MAINTAINERS: add entry for KStackWatch
Message-ID: <aOd8kvWYIROq99vx@mdev>
References: <20250930024402.1043776-1-wangjinchao600@gmail.com>
 <20250930024402.1043776-24-wangjinchao600@gmail.com>
 <3913273d-12e2-426f-aec7-263b7f49008a@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3913273d-12e2-426f-aec7-263b7f49008a@infradead.org>

On Fri, Oct 03, 2025 at 01:50:43PM -0700, Randy Dunlap wrote:
> Hi,
> 
> On 9/29/25 7:43 PM, Jinchao Wang wrote:
> > Add a maintainer entry for Kernel Stack Watch.
> > 
> > Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
> > ---
> >  MAINTAINERS | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 520fb4e379a3..3d4811ff3631 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -13362,6 +13362,14 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git
> >  F:	Documentation/dev-tools/kselftest*
> >  F:	tools/testing/selftests/
> >  
> > +KERNEL STACK WATCH
> > +M:	Jinchao Wang <wangjinchao600@gmail.com>
> > +S:	Maintained
> > +F:	Documentation/dev-tools/kstackwatch.rst
> > +F:	include/linux/kstackwatch_types.h
> > +F:	mm/kstackwatch/
> > +F:	tools/kstackwatch/
> > +
> 
> Add entries in alphabetical order, please.
> 
> >  KERNEL SMB3 SERVER (KSMBD)
> >  M:	Namjae Jeon <linkinjeon@kernel.org>
> >  M:	Namjae Jeon <linkinjeon@samba.org>
> 
Thanks, will be fixed in next version.
> -- 
> ~Randy
> 

-- 
Jinchao
