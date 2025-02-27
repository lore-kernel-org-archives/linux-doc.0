Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABF3276D13
	for <linux-doc@vger.kernel.org>; Thu, 27 Feb 2025 23:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740700027; cv=none; b=bbCovDYOr4lj5vwh3/IGv8f1mCd47WoSKkTUDAPU/7ZFpWsS4hhxwGyyg4IkwOO08OHL9MZCXIGEQs88L7xv+GDidJ3/80qAeasjCFGY1+1iU5U5JY4j1zA8NyJuQsm4zF1ngyAPs0n981+Qs7jwtpk/tjnQMpbmo5DJDd0LFL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740700027; c=relaxed/simple;
	bh=riHV1seuhU1QdFaRL1G/6dr2DRR6gYV8e9VC0evPPeE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rD09kwyfwTLI38ruy9DENiN+bMbY0UCJ998HqMpxJBRpYuDyDRQoth7WUgrtgMgYq+tAptgkRuc3/m1uiJvi/wUzi1M3j7q1XcFk/HoIEoDn7CpbUFuWJvR6ie9qVhImU+868NLB/TXeTTDtzMsxdDtQCKjldl9KBShRGKBupM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LNNo4/4S; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LNNo4/4S"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2fe916ba298so3236651a91.1
        for <linux-doc@vger.kernel.org>; Thu, 27 Feb 2025 15:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740700025; x=1741304825; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nCWfQ233PSWAs37mz2wPN/QFa/6k1QMX79a/XCJWF9g=;
        b=LNNo4/4SxGoo4rspUheqP7rIDlwmrzx4g3SnThgVCwAqZEmcBCD5+CAwghpShTwSGr
         BwWIz82zkCX53x2WE/kUtW+v2rMzFXynW2+VVEjidyuZjwd/c5YpI6V23LFO1zKo+Hsp
         Qsdg0TNHv+RXQ8Ksvi1vu0cURqT83bqS2qtR+T8avINIrDBgSVykLN1sN437TBSt0Ftq
         L39bsEh5guRboe8zQIkUBGB2z2ezCE7lUMEqcipVa/0AgDuLMadfwCxSJF/tDahUzXpJ
         nEViEZkgtCLOKn6mfbSfi38Y1/0N1avTSnaaEZwkbzEzczxH8etvb4d/rZjzQpixsYfH
         UKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740700025; x=1741304825;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nCWfQ233PSWAs37mz2wPN/QFa/6k1QMX79a/XCJWF9g=;
        b=siMvEU5mDcgnHJoUJSPx9VnOOnohO1+bX/iLT+qRh8dBmob5VXVMbnwoAWe9txImgP
         DZJrXZdl+FSw5xFxwYV2mN+Cc0tAGks53JPnRftMMZ+zMpbyPetZCPARzJktpN5e+DE8
         WvOC0RjmB2GZ5asjuDrRPqiE0KMQF4aXV4K7gPOmXN9iMwJWRIob2Fb2k73SIU7BeGi+
         QGqWHW5Afq2KimJoAHbuTuvaMInraV5oAJ/1EgqRG4jvxqOcpbj6xbmn6UTvGxUZcClP
         q1cJHA5qnK4h+sm1EhSp++MsoPo6HSiQVDq4CWTZOi1SpNIHrC/UyuMH9C1y7irnZLlK
         dzPA==
X-Forwarded-Encrypted: i=1; AJvYcCWIWmwoluV+LywDzQD9ILAteT1pcY3eFpPjV6fck0PYWuJwciLr7wwfkhxdbFjGu87jMDcW5KnGPdo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPMAMSIkx6iy4w43x9ji+uDvVaV+F/8z+c/bx45s1IZ2/PrJ+N
	9DeA8kNnfPPL6+sJE58vrT4NdfpEAGGAuN9Y5oq92lQYmswd+GT29eme02G1nm8aqfWF1Z1n2Pm
	3Jw==
X-Google-Smtp-Source: AGHT+IHuJhugLoOALKL+bBHU8dYmihquWXJgCeAnlxsMLGlSruW3vsfZyq9aR+pdE7QTJi2WhpCLVWh7qaw=
X-Received: from pjbpd10.prod.google.com ([2002:a17:90b:1dca:b0:2fa:15aa:4d1e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1d46:b0:2f5:88bb:118
 with SMTP id 98e67ed59e1d1-2febabf19bemr1619311a91.22.1740700025364; Thu, 27
 Feb 2025 15:47:05 -0800 (PST)
Date: Thu, 27 Feb 2025 15:47:03 -0800
In-Reply-To: <7f2b25c9-c92b-4b0a-bfd9-dda8b0b7a244@amazon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <Z6u-WdbiW3n7iTjp@google.com> <a7080c07-0fc5-45ce-92f7-5f432a67bc63@amazon.com>
 <Z7X2EKzgp_iN190P@google.com> <6eddd049-7c7a-406d-b763-78fa1e7d921b@amazon.com>
 <Z7d5HT7FpE-ZsHQ9@google.com> <f820b630-13c1-4164-baa8-f5e8231612d1@amazon.com>
 <Z75nRwSBxpeMwbsR@google.com> <946fc0f5-4306-4aa9-9b63-f7ccbaff8003@amazon.com>
 <Z8CWUiAYVvNKqzfK@google.com> <7f2b25c9-c92b-4b0a-bfd9-dda8b0b7a244@amazon.com>
Message-ID: <Z8D5d85N3LJBJ2LD@google.com>
Subject: Re: [RFC PATCH 0/6] KVM: x86: async PF user
From: Sean Christopherson <seanjc@google.com>
To: Nikita Kalyazin <kalyazin@amazon.com>
Cc: pbonzini@redhat.com, corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, rostedt@goodmis.org, 
	mhiramat@kernel.org, mathieu.desnoyers@efficios.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, jthoughton@google.com, david@redhat.com, 
	peterx@redhat.com, oleg@redhat.com, vkuznets@redhat.com, gshan@redhat.com, 
	graf@amazon.de, jgowans@amazon.com, roypat@amazon.co.uk, derekmn@amazon.com, 
	nsaenz@amazon.es, xmarcalx@amazon.com
Content-Type: text/plain; charset="us-ascii"

On Thu, Feb 27, 2025, Nikita Kalyazin wrote:
> On 27/02/2025 16:44, Sean Christopherson wrote:
> > When it comes to uAPI, I want to try and avoid statements along the lines of
> > "IF 'x' holds true, then 'y' SHOULDN'T be a problem".  If this didn't impact uAPI,
> > I wouldn't care as much, i.e. I'd be much more willing iterate as needed.
> > 
> > I'm not saying we should go straight for a complex implementation.  Quite the
> > opposite.  But I do want us to consider the possible ramifications of using a
> > single bit for all userfaults, so that we can at least try to design something
> > that is extensible and won't be a pain to maintain.
> 
> So you would've liked more the "two-bit per gfn" approach as in: provide 2
> interception points, for sync and async exits, with the former chosen by
> userspace when it "knows" that the content is already in memory? 

No, all I'm saying is I want people think about what the future will look like,
to minimize the chances of ending up with a mess.
