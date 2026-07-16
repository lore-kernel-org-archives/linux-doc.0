Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D84942A78D
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 17:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784222409; cv=pass; b=m5ugB9OVrzxBqnsAOQ6jw+TKseEoCFqzno6YoIRCHimM7HaB2fHj9Ie/k7hyqmso3o5HA4tU7AqYlhy3VFAejpsn6TZkMmCeIImI+TzfBQEd+7f5JklqK/7ZxQoLRwZeMJwhOR9kSJzKKot0MobcBqx4UA7d53fKUufeldTVpbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784222409; c=relaxed/simple;
	bh=WgNPTyzJP6h+/loXvXxBK9obj+cvdvHP8r+IDx+BJ1I=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+DZ3NBVnh4ctuQa2TLWPDqqatMh52zoQDO2M8tNX/iTK/wVa7m8s8RkEN8+DFqSMB4iXhRsS+oiYbrlAIE9hI9ApeJQOxAqy3X372KPdvuqipEntgqQ1inNRC3U5XoIDDtr5cUwx421zoT+OXjtMQMvYh5x+GwQrrsUhPdUz6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V5FFJtkQ; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V5FFJtkQ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ccf2360620so31439435ad.3
        for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 10:20:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784222407; cv=none;
        d=google.com; s=arc-20260327;
        b=IRtB8Kx9ZkHYxNCXvQ+WxU6XEeQzSRxt4afKesX2S1YnIyNl2NW8aTo4Fz3WkFGRh5
         N0kP02jMHLt6Bo9ShQcnvtctP1C7QTIdPfSamTsPi29wroHCZ3LqtCFkSxbN8vF6ci5Y
         qtjL7C7Rl4kGmpbAAq+C9uP45+GXV+TM1WnBeuT6pWJEgjpjBri01OpU4J60OvCT7H2Y
         13UAKNF0AYJsauei0YhRGWAd4N+m5uS1m69pn0jgJEZLppQTlnJTw8pm232zW8RS3mtu
         nskp0Ia81ISdvW9e+g3wGExg7BtaXGR3uRRkPryslx+X4+GF1hJxUdZ5J3bC8vMbEA6F
         57rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=hDpH4vLaInenlGkSSwc32ERdxUXfDeJnyW2zrivGsV0=;
        fh=aCBDWsh5MY8XEMAPdGvoc86Z3Jn5xKBXTfmBXaDeuEs=;
        b=dGY72hzLe6QdaQ4+/WIpH59FAQyEpbvuH/qyc48gkQZmZG2aiwddrZ1qB9nW1/5g8b
         irb8N2WqQTdzBitdLBmcgxeC9y6goURdEThLQFFHOERQdThRm9Rn2KSppjujI1+ZEBRk
         1J+kMogiMurWH59BjNTlSD9JC3ERl+ujZdB+DQyMu557PQWooUzqdhfJgoKAG3WWhwWF
         JqWKvRxxjrrDCt3cWCiCheXZnSLd6XEhf7MDDMzc4LHiehSt4yDr+Cb8iLoFFh965zXS
         IiYkighz90h17PJqJflxKlSZKEZNTBIzpf64d/rKwTaQ20iTdF0IcSurYetVAUgYI/CS
         SmZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784222407; x=1784827207; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hDpH4vLaInenlGkSSwc32ERdxUXfDeJnyW2zrivGsV0=;
        b=V5FFJtkQtJ5Of38LJ1sNYFN6lEt2zSeQlQhqKa7Eztd4arzlzvQYtO5vQms52mDfqW
         stQkSkmY79dewsm9D6RGU0g7NN2THOzuBAMSs0vUHPIpW/kDULG4x8kTaZLXeKjahtET
         hSmaCIzO/vzFMdUWrz9M44vrBs0Fv0XSLP8aSVWYsW+kxT7FnW9bu1b3++B73yUKKlEc
         IZWP4d8IXEcY8zl9qrszxW4PholUJthVAOkvtSrTXrwE/Am8Uxbsjau7q4gh199mfvg5
         PyD+eYQT890r3GNeGACnTDNovfBDuQrxrAcBNcpGGdx/yeSkTWLApNwfql7QSPVYJYfB
         7/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784222407; x=1784827207;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hDpH4vLaInenlGkSSwc32ERdxUXfDeJnyW2zrivGsV0=;
        b=nguZuhilNVWsbYk1EIJpkLJB1fAWWUcV1/B/nf3qkSmRCr/fXxbogunuS7a+VnrCSg
         1byAch/9ZpaEuGwi0vaGIXqV0xJHi4mUmYAWSw65Y0q1CYJKYb+/xryD5/tRJMuX1O+5
         lADgvERnyDbclkMXOQu+9S/LgQQ7YFjACpzH+a8Roiizl44+4rMWiVlsEHyXi5wAYLuq
         7YjPH1t5GlwNcCb45y0V7VS6rIfbSi/IzRVlZKOHss5XjQB7QMwMcbfrdWp556Hne7h7
         dS0o63OP9pJfEF0Gt6ygAPxvy7Ah+DCBi7eH23I+SmSsF7FoRqO/4HIXRk1gq9THUTmz
         T3XQ==
X-Forwarded-Encrypted: i=1; AHgh+Rol7JMhbKwHimy80ytI6gwKhfyeTlQICkofF9/aC7WvGQ552BaPtd3yjpppeSZQzJ95wuqXVSy45pY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmiWIKWIjK087HU2AOpCqOOkW4Ezx9P9CBRfh6JHzFeDR5ALpg
	W7oUdAUpHyKmGdWl4kORGksZhNQSrTRJTflGxVvDN8wYcY8sZpfUdlHi30Fq74xGPUeiv4Dgw44
	SavNLyLCTxXgamK9VsRc8Y7mxev2CK/ll6i5BzhCA
X-Gm-Gg: AfdE7clxWEx3W51ADg6+xLeBW9b/+2mgsSc9ZFE/evX+Q0uye3o+TjhAkhoBWyx5q5A
	LssA5rq2IEFbcLbEMQZ4TcM8FGMlITQwpo7eAEebMiRpZN/40YXrW2cvAIoFNKBtEiMQOZKKCAO
	zU/q3wPdmS07/8/n7FQGckjp0cDv5XuNFxRqeUCsOV6VycXfWUug0ZOJ+5NORH0SvcmtLT7Hgel
	zRELUy+9mQtjFlT3wyF/088/JY/w3JfSnnLI2yhB0pT3rXy49Us8oS8v65k3r6FWaGWTa4b7PdW
	Vwfn/Um7NNoUM+T8efBpLPLFro3Bnw5UAdQdtqhvADITfc14
X-Received: by 2002:a05:6a21:7482:b0:3bf:6c08:2b2d with SMTP id
 adf61e73a8af0-3c3a5e7a4fdmr21247637.53.1784222406715; Thu, 16 Jul 2026
 10:20:06 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jul 2026 10:20:05 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jul 2026 10:20:05 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <1b59fec2-a464-4429-8532-880394912af5@linux.intel.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-9-9d2959357853@google.com> <1b59fec2-a464-4429-8532-880394912af5@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 16 Jul 2026 10:20:05 -0700
X-Gm-Features: AUfX_mxBIq-fm92f37AIysrX2Jjvm6RrlF5jRh7Q3ctlrGsM_3yjDZToekOalgI
Message-ID: <CAEvNRgEjPA5pi1RqpQWgp_hH2HmSnGhWaNiXtVBJb_VVdKD7qg@mail.gmail.com>
Subject: Re: [PATCH v8 09/46] KVM: guest_memfd: Introduce function to check
 GFN private/shared status
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Binbin Wu <binbin.wu@linux.intel.com> writes:

> On 6/19/2026 8:31 AM, Ackerley Tng via B4 Relay wrote:
>> From: Ackerley Tng <ackerleytng@google.com>
>>
>> Introduce function for KVM to check the private/shared status of guest
>            ^
> Nit:       a
>  > memory at a given GFN.
>>

For v9, I added the "a" in the commit messsage body but retained
"Introduce function" in the header (save characters, and make it sound
like a headline).

>>
>> [...snip...]
>>
