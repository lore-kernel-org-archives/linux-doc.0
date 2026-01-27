Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0272ECD32
	for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 10:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769509087; cv=pass; b=QYJrBw0fqUla1/d1s/r/WLNyFWGnRKrzahM/n1VRPHzAbm070L5xvEw44Y0aeNTAD2jXHFZ3XPluTGspshvstniw76pjUw1XHyfHVzlRWbk07FR39IBvc2NwywW8qUYizrxDSXi1aaIw9seIxMzMajSlQ4FlkZ7clT8o/E46gRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769509087; c=relaxed/simple;
	bh=9eWZA1QTRdZDTddGYL8SlE552QBQW/sLGGoi37wJCfo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZPDqQ+ROpjASTLaLpLnCh9eI3bKCYqo9WpWL3Q1FvqoRA86xeX8Qs/6CGFuuwfrsY+BPkXN82IIUbK4o9DgyI1q9k/nTr85ki6kr8/Ozo6xHAh8AUgt4R9gwyv4xhZOsPdhiFdNnt9FRTD+0kelDVSTtOzFWI8OWNEa6QzOolcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0CBOsHD/; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0CBOsHD/"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12336c0a8b6so1801205c88.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 02:18:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769509082; cv=none;
        d=google.com; s=arc-20240605;
        b=g7u0XisrSplGaYAayx7Xoyuoyf0pgUvrPdZrWpLtoeF6tfCx90SlNNxhOWKUQrCbMh
         LOkSi/CCBrNRqRsaG54tCHDtAI8CdJzcgwGGaSXCRNS6Zfni0u0Vg/kpmazTKSAndDcR
         t97gSmmsHWXFbIyg2atzk1yu+4VMEZFEjeEOqy49t1kF2Iz8K9dZzSGiMSSHUd767TbO
         27gpZWJf6IybvktCJnPHbaRHmHf3v94OsL/TYoLCD28byOaD5Dncs/OlcoQPFjEo9OOg
         tIdqj3QiiLM+qgrLZ7W7Qp+4aGAYs72yrupPX4UXwBEKGD9yzX1sV51FFk2oOR+9eEPL
         96Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9eWZA1QTRdZDTddGYL8SlE552QBQW/sLGGoi37wJCfo=;
        fh=bFt6QTkK6Tv1GK655d6SuBrnhCSfwRzMT9v/tioVDNY=;
        b=iLhrDMyw7hap8/HT4LGYH+nwRGFXx+4ZHuZINb+SKjJuxa6xlxsCcoUO21cPIxtlov
         4w7bxPSoc2e2Ou+LR303zGupOfFZLZSAWTlLBJ+E4qrNlGSUGDa6+fPRI0MC5SJId1jV
         GTm3v/P+AwpBpJxIgaKnOwbwMeWYWE8ivlG13ba7hjm8ewcRg0P707kJQGD2ru3yUs5c
         TM91TLGQmmH6gT0GIgQedlDh4TsktqY3+wY6xd+QDaQiPZpZElLeK9PpBT0IeNSyZu5i
         xdYkEBd170WFd+7ZWFVOTQ7tMY3/c8KOvJX3NEqyVY35ToW8ZzY8vMaliMHw9okNT8MS
         Gf1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769509082; x=1770113882; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9eWZA1QTRdZDTddGYL8SlE552QBQW/sLGGoi37wJCfo=;
        b=0CBOsHD/uKOv95aR8OTAbtRyWBxyLJ6N1fESKzC2veqVx9JPRAR/Gsg+n8VRUW2Hp3
         EG6v3t7dFFHmx4Qe9/enHqvAYc/MN+zbW34Q0dIEP/dBnHyBwmTXLN/s4AgkzfrYowyK
         TS9/3JGwU153BB0kkOIvZ5Xtjd+Bp8Z4TnxiAJfhMEvuCB4na3T6n77gyhHa/UDpEb0b
         IgALtOGmCw2o5+TNyDxryyFP5U2h1On49wPhmsdnKC83ra3MXi1Xx96djhullUZFhEEf
         Bu8bIyKcXqPDpnJ079sq0S/S0xkr66rrSYp7sxWe3EDfxUs2fpKiC1ykKYevzeLX0nO4
         YmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769509082; x=1770113882;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9eWZA1QTRdZDTddGYL8SlE552QBQW/sLGGoi37wJCfo=;
        b=wrHr4QrtoHR94b2YVzweVaR8aS+jw8aeUYfSmqSTeBnPUf/Ri7QK2TdocvM5PNmwDX
         WLBtXomtctKUO5xVpuwLl62t+hSmemKpMG4bES7raWjwc2R0WsqT+5A5quNc2qrPjqLH
         m0NCScBX62bHi58t8lbK+RweqHWwdsvZY99khnDsidhecZLolZXYYanxvelBogvkfaAG
         mCjdDhcs5b/0SzCLXr4jn8xDav1/DRIUd8E2zGGCIDc/SoqaKJ2xLYl3NQsht4/iGMh4
         PecKcAufpRMc6ElOvIaqeLYgg/FpOJLlyGmcbXkwZMoDzqmjm56gtJlbOt+Tx/mNwV7o
         ohPA==
X-Forwarded-Encrypted: i=1; AJvYcCVoHfGaG/2L0U4s+hGQ2UBvOrG+qrvcpp6oSsOX+VxSb1GgKSNfl6CRvTvQ5PSXtKMH3tpRtWIfVio=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCzce1oeK68iqpCnQxiYoRhEyOp/TssvLiq/JbNsKnPwOGHS1o
	BPQkLmKJ+6sgpcDSdXx4KBMIUo0HMX5LotY9E0rflVJXwdFhvQvf7wNHd+zIJ+ruJKtnwFHUfnx
	lH3V6PtAkurKVtjJb7dCAQzS0LqWaYt6ujUr92RI0
X-Gm-Gg: AZuq6aJYW83sRbs/U2CyuKN8QyQcpN2F/mPNZLTRa0EyE5JQHA668Heawl4+HEckAak
	u+gHYWgaDwYO26MNJJ1Hf0pce1mdXSwBfNxb7eVoWBNq69bT7dVg4Z30IT7g5jvb5OoMLH+e/jL
	TqHLT9nY5SXvcWpnskT1fhC0LeT9HWbLzza9AHlZiP8EeIpvjm+fAo4UXdz3/ZnxccFeIqOqEWw
	D082Vqyl3J7xG/2ruAPyke47SIL6k8kyb2mBLmB+IafIPmEy4v31atfpyzrluX71Wa6oYwX302G
	ns8XUSqo5dkH1c8NjEzB2x/gMw==
X-Received: by 2002:a05:7022:6985:b0:11e:f6ef:4988 with SMTP id
 a92af1059eb24-124a00cd55dmr806676c88.36.1769509081547; Tue, 27 Jan 2026
 02:18:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251219154418.3592607-1-elver@google.com> <20251219154418.3592607-7-elver@google.com>
 <0c2d9b69-c052-4075-8a4b-023d277b8509@lucifer.local>
In-Reply-To: <0c2d9b69-c052-4075-8a4b-023d277b8509@lucifer.local>
From: Marco Elver <elver@google.com>
Date: Tue, 27 Jan 2026 11:17:24 +0100
X-Gm-Features: AZwV_Qj2UVNnjgQTvKRMxq0N2rMz8K4yMXQyPWTkZbJrWul7iRYbem2vd2u4cZs
Message-ID: <CANpmjNNHmOzaCSc9hQJNuzNVHXA=LRgXB4Q69FNk6wBuuJGdAg@mail.gmail.com>
Subject: Re: [PATCH v5 06/36] cleanup: Basic compatibility with context analysis
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, Bart Van Assche <bvanassche@acm.org>, 
	Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Johannes Berg <johannes.berg@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Triplett <josh@joshtriplett.org>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <kees@kernel.org>, Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org, 
	Sidhartha Kumar <sidhartha.kumar@oracle.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Jan 2026 at 11:14, Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> +cc Sid for awareness
>
> Hi,
>
> This patch breaks the radix tree and VMA userland tests. The next bots didn't
> catch it but it seems now they're building the userland VMA tests
> (e.g. https://lore.kernel.all/202601271308.b8d3fcb6-lkp@intel.com/) but maybe
> not caught up to the issue this one caused (fails build in tools/testing/vma and
> tools/testing/radix-tree).
>
> Anyway it's a really easy fix, just need to stub out __no_context_analysis in
> the tools/include copy of compiler_types.h, fix-patch provided below.
>
> To avoid bisection hazard it'd be nice if it could be folded into this series
> before this patch, but if we're too late in the cycle for that I can submit a
> fix separately.

Thanks, I saw. I have a more complete fix I'm about to send.
