Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472793A382B
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 14:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790692435; cv=none; b=MBEs4S6GwDIm/T443AXQYAg+XU1M8zrrQe/k/9a7nHqB7Fq7SjudJ5VS4kY1GVdHAVF3n3t+GD0ecwKLnhf5rKuj3lEcANcfsEfSU4TPWcQTWg0+n2ioiXxZpS2uABR8f77S1LmsWqMU4zdDWlqVekSIq842lBO29J5sjOT2AHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790692435; c=relaxed/simple;
	bh=Ictfo6ayTgeVzDX16BAuhDJZt7+ZVbpOljn2/hm1F4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M77RKO4EgXddvkkoJYXqvBvlqaN4VUrQ6WR+FQtK29dtR6ObRze3buVXmV88bZMEhbzeS/XE+Qaj7+5EQ2+07Y7+Ru+PL1tOsvLl38Lzq6kIiytaPDKEG+4MgyeeXuBBo8pcWAb9+SlCodBag9jZEBW0ICfTnA9KAMUVNW2NIgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqqqOADG; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqqqOADG"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d04d73b8so1639763a12.1
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 07:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790692433; x=1791297233; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=43/3dmeDG8ZHEWDYTwQfHePyNi6D0sJRBJ/5pN8ksjc=;
        b=VqqqOADGK6buDD9+YdT2fixb8lVGHvp3cKk7QAzHyXYdA8vECGq3PGXJYbV8TuPLiE
         bql1PUi3LBcRrpJgVxElHsQu9EZKzFyPt1RXXJ2/On/2OC5N5GFvvRub+gc2q8u/KpPr
         q/uBw5f++mbV3baaqeWv2dGapSDGOdByBbE/E96XOB8x7ypOI5qvrH14aH8X9e6wvrG/
         TPMQA3IjGZ+AHIXeBOMMw9lS5PWRKqaYfbsTi8RIj4A5R4blk8EWg3ozH44hRZ+QZuev
         PXZcrLMqDGfDCEfqndU0xo4plN/R5W7rYfcpLa4kztm7oIqK673+V+SCfO+VJqlylPrW
         MVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790692433; x=1791297233;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43/3dmeDG8ZHEWDYTwQfHePyNi6D0sJRBJ/5pN8ksjc=;
        b=HuCREkoKUTbAv9l/dsZioKsDG7hNDYCOJg+f17wAko6rxUwPDwo67VC7FXx/UrWVPk
         d3QaYFX1p3sRPkFVL47hlvzieEj1ubIHJKqZHayr9PmRCIWfpiKitofwgv7tQCdyi57/
         qzq9G2wGpWvrBcGRoATY5nlw4kqcUaWHKlW/SvB03fNZLTi1RVWgVpnd+FqQOsdFJsKu
         S4Rpl2hkVuXjlLkuRRuFSUThqERorVKf+PRlGalAwTaZETVHBDlkr10rsS6qKrD3nMTl
         m06ZmvN2E1nAwPWUV20PSmp8w0Kb9NMgYKFNG/84SNtuhOsECbbkP50HbXdd2YbvDHcX
         NdkQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2tagCUHNBF+94BUw1fXjNYYXAKXycV3XiNDeM4W8zhzvR9x6hpwAPEACC8qVcpsMFwBUKNwiBtw0=@vger.kernel.org
X-Gm-Message-State: AFuF++natC1QAFtYhsOw4d9Ka3DW5M4wpasBV6mPuoFoPetc+LKxh1kG
	OgtE3bBv2SkiOY1vy/xWD9cvKt8iJqAhx/HuKO+xCVaoSlY8Q1XMx506
X-Gm-Gg: AYBFou2wfq9PDIOpjB/9y8j8ahFFqV2cZzLi/4SXKhbs/Cr1Iji/abiMBYJloc9CM3q
	g6ctPPFzQKACAalwAVy/jT6E9tW4hybAZNa1JppyzopPYR0LjH1WRj5PPplfT7IQSyR5vQ0QooT
	kgzYzx4KvLYv5dk6c8d9Ko4JjQLQQBNlCqVH8mLgDPDwv0TrXICgTDgJNAhEJBf9rwoEGdsv8qA
	qpMEjoc48Y6aDdxccHSeuX5HYYz+pRC3cKC7XlJLgP6viG8JYLkCm43KUOrKNQH1enS+QeX6p+4
	ZQGV0PmFcbz4J94OhBuUm+qDxk0Lc73x5UzWRTacHi7izHtX+g3pIjZJ3WkvzaR8KxwlmhJPviR
	BKock6n4TgsUglRZWz4Vohjkz1srRWFhK0h3XvBcX5cTspljO0FC1Rxmsw0xm8oa+T1E0nx1mJc
	MzDlJclWZmnqmQVqTfqHHDeOb+S+pHUBTKG8uZFpQ1lyUzUuLv7iellpV6vD4Jaa5OSRjrNMk=
X-Received: by 2002:a05:6a21:6089:b0:3b2:a809:1000 with SMTP id adf61e73a8af0-3de0e6f07edmr15049574637.3.1790692432560;
        Tue, 29 Sep 2026 07:33:52 -0700 (PDT)
Received: from google.com ([118.150.148.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7a3bb2d5asm4339524a12.17.2026.09.29.07.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:33:52 -0700 (PDT)
Date: Tue, 29 Sep 2026 22:33:46 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, ast@kernel.org,
	daniel@iogearbox.net, eddyz87@gmail.com, memxor@gmail.com,
	andrii@kernel.org, gerg@linux-m68k.org, rdunlap@infradead.org,
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, bpf@vger.kernel.org,
	jserv@ccns.ncku.edu.tw, marscheng@google.com, eleanor15x@gmail.com,
	Daniel Palmer <daniel@thingy.jp>
Subject: Re: [PATCH v6] m68k, bpf: Add initial BPF JIT compiler support
Message-ID: <arvMSjbC23bPf3l-@google.com>
References: <20260927205501.672807-1-visitorckw@gmail.com>
 <CAMuHMdVcpHrxg_Kb1vpguSYbRg4CU4DxNuPAv3UqHNHZTNk33A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVcpHrxg_Kb1vpguSYbRg4CU4DxNuPAv3UqHNHZTNk33A@mail.gmail.com>

Hi Geert,

On Mon, Sep 28, 2026 at 02:15:43PM +0200, Geert Uytterhoeven wrote:
> Hi Kuwan-Wei,
> 
> On Sun, 27 Sept 2026 at 22:55, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
> > Add a BPF JIT compiler for the m68k architecture.
> >
> > The JIT generates m68k machine code targeting m68020+ processors and
> > coldfire parts with an mmu (ISA_B/ISA_C). It excludes plain 68000/68010
> > and non-mmu coldfire processors, as it relies on 32-bit branch
> > displacements (b<cc>.l) to handle large bpf programs.
> >
> > Tested with the test_bpf.ko:
> > test_bpf: Summary: 1061 PASSED, 0 FAILED, [1049/1049 JIT'ed]
> > test_bpf: test_tail_calls: Summary: 10 PASSED, 0 FAILED, [10/10 JIT'ed]
> >
> > Tested-by: Daniel Palmer <daniel@thingy.jp>
> > Co-developed-by: Greg Ungerer <gerg@linux-m68k.org>
> > Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> > Changes in v6:
> > - Fix kconfig sort order for HAVE_EBPF_JIT.
> > - Update eBPF-JIT/arch-support.txt
> 
> Thanks for the update!
> 
> Are any of the issues raised by the bpf-ci bot valid?
> Thanks!
> 
Yeah, I'll address those and send out v7 shortly.

Regards,
Kuan-Wei
