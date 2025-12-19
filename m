Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2296333B955
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 21:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766179734; cv=none; b=WanPo6n7LF9+qKxob6lncsOm2x4KGsef8mznnhi0qhSLGgeymr8WijE8Wo9v2LCAXBa/kfnAmkl0DzjDVmMT09W+wMxm8Lmvp/4I3YyN/9H+x+4JSnahN7JmB16OhiNLAdSxx1Tr/zYxt+pS9vrFRCTKuNDPe9j1REFx114jeHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766179734; c=relaxed/simple;
	bh=9qdyLYhk6D9KpgNEc9lTRHJNMgr66Y5zIziSEMCrXTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AyiiP+lcKI9VoPhyOHfSNvQ/jfgazDJ5y+2ft85t7ibIJ00CQy9/hyvJIXyCEiRfZkjn6xQpOYcsk3mRCL1keDrf4W0yfOlSxmJtoLkFPs6cfXBPk0l3I3wYeU1Q18mvldexc+/VMGU0W74EK5ISND31rEEOf/Zm2NEVKonHSkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMtyxVaH; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMtyxVaH"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2a0834769f0so21291755ad.2
        for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 13:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766179731; x=1766784531; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9qdyLYhk6D9KpgNEc9lTRHJNMgr66Y5zIziSEMCrXTM=;
        b=RMtyxVaHlb4x5czCBEyOx56xfjT+RNoyzgmUIOLM8rQyyjHAn8b14RHWVg+U9yECU2
         DNet9BX2LSDx+fbfhj2eagJwVgKFUN3paA/J0jVpzr17MqrPGIkC8uWMpzr25M5n/Svh
         riLL7VUKYl3lLur1iiIDnUxqZzSyVldJOlWErwA4BYTCmBjZa+IIIv/4tggBwnPyd5N1
         4sP+EomK5LaRfaouO3drpoA8BG7gNbSc2L4KFhFCx08iZDlPsih1J+3De+KvkTA6nBjx
         xSBUnB9EV5NlQAOueOI5ovsh9ZrpK2mKI2rYqZMt2HvppVyMTV6Z5xJIcetFL+mvKY9C
         JWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766179731; x=1766784531;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9qdyLYhk6D9KpgNEc9lTRHJNMgr66Y5zIziSEMCrXTM=;
        b=Mi7kc5oDk1HRlH4Oz+TTYA83/bdSViVJd7KSyvk8C3xuDaeVU0x86NTDmY/YJVEeg1
         UzWpA+Y0Qi4PPdCiTePebX6i6+0/We2+s8NRNZ56eSCECA0seJQENqSY+Z+PvYGF+bpx
         BvpdC5ZDidkDb43yKum/iDFl2iP6qmBS2xY8p2d9Kgcx/scCvfKlPsstgxP+h3SfPOsx
         GDyoaJ2ln9Dbi8CHHHU8jp9YlEHrHZgvFu3vO85VIFkSUaR5IslB5xh6yqUQUEF2j3lM
         i0iMkgZ/VAYLZe1rOR9j/MUaZWEuWvCgqwK9SOdsk/+U2XIZq/AYDuXZog+0kRZsvsGA
         WAQw==
X-Forwarded-Encrypted: i=1; AJvYcCWqcaDM/CDouqvJzoKsNNzHemQSJyg8wXlqhnaOQK3gPp3rxZWSF/69O160oCysZm8uF/VEXF08esI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuTrZi0M746uI3OwzXBqEiDz2iWrEHajrnvorSMb3YMtjGpKDR
	lat6Q3pnD8FkjRlQ94VCRNTT9eK5pBclEl5eAXEuobtzLngrBlqxD73U
X-Gm-Gg: AY/fxX7q0htuqRPy839cohTX6JCnf50pT3LCM3bkeOZtfq8f1WZBtFUbb2msw61EFdL
	6FnMXvg++9OnfnFXekPldUjf5ord5FY7pMmFmLBND3UfSxnZK4c00mmQxnTkgs6F51GI/QPBFXi
	DCl2JAl7FcJIJlPUJII8L6m5RAparHsuJbhfzMheXE2L0IM/9sNYmKpzRN28rtHdbAl1EYCQ5r0
	OQgAOmYI1gWIozePMakBhW8SN2wWw9jfEHl1Q8qCwLTvAsptZxpk+TVIFAuFIC5by31rl/yTViG
	g9WXe6A8Bid5naB6XqlD4UvK9ZybsML3KNxFykV7yUkYQfRW8maLNWIYn6r+A8ILI2tUDJW2Ajz
	io+PMq6qRXRciOHmQN3NYQWc/BDM2x74J+2Uh+YoklpwFl46putYmvC/oSg4aow9ADGf9eflzNn
	mpnH0RzizU38A+2laMZCvpQH2K/rfuEgN+8hN5vgkjtmRF7MLP3SRoTnx4cMoUc5mvk0l98stwV
	lRGwVbrlpPKVf6CauGsCJKQWjFyjXiHmnN7KlRjeIFLwTOMM3rofIJ+kByNYKPaSPa3H/Byv/x/
	DqE=
X-Google-Smtp-Source: AGHT+IFntC97OMoIKW8iak4Csi+Sa/wJHZS2qz46SkDovenEuEnw3BILL/ha2LHm12T/rhrLMeYBbA==
X-Received: by 2002:a05:7022:6988:b0:119:e56b:91ed with SMTP id a92af1059eb24-121722e01c2mr4354548c88.30.1766179731046;
        Fri, 19 Dec 2025 13:28:51 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:5874:79f3:80da:a7a3? ([2a00:79e0:2e7c:8:5874:79f3:80da:a7a3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254cd77sm12305503c88.14.2025.12.19.13.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 13:28:50 -0800 (PST)
Message-ID: <ecb35204-ea13-488b-8d60-e21d4812902a@gmail.com>
Date: Fri, 19 Dec 2025 14:28:48 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/36] lockdep: Annotate lockdep assertions for context
 analysis
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Chris Li <sparse@chrisli.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>,
 Eric Dumazet <edumazet@google.com>, Frederic Weisbecker
 <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>,
 Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Johannes Berg <johannes.berg@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Josh Triplett <josh@joshtriplett.org>, Justin Stitt
 <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
 Kentaro Takeda <takedakn@nttdata.co.jp>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mark Rutland
 <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Thomas Gleixner <tglx@linutronix.de>, Thomas Graf <tgraf@suug.ch>,
 Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>,
 kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
References: <20251219154418.3592607-1-elver@google.com>
 <20251219154418.3592607-8-elver@google.com>
 <cdde6c60-7f6f-4715-a249-5aab39438b57@acm.org>
 <CANpmjNPJXVtZgT96PP--eNAkHNOvw1MrYzWt5f2aA0LUeK8iGA@mail.gmail.com>
Content-Language: en-US
From: Bart Van Assche <bart.vanassche@gmail.com>
In-Reply-To: <CANpmjNPJXVtZgT96PP--eNAkHNOvw1MrYzWt5f2aA0LUeK8iGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/19/25 2:16 PM, Marco Elver wrote:
> It's basically an escape hatch to defer to dynamic analysis where the
> limits of the static analysis are reached.

That's not how lockdep_assert_held() is used in the kernel. This macro
is more often than not used to document assumptions that can be verified
at compile time.

This patch seems like a step in the wrong direction to me because it
*suppresses* compile time analysis compile-time analysis is useful. I
think that this patch either should be dropped or that the __assume()
annotations should be changed into __must_hold() annotations.

Bart.
