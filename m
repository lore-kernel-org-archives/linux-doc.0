Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A201B040E
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 22:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738968294; cv=none; b=t0k4M8eTsBu9THoMbVooZensAWKCrum02zDObduWt4+T7ZiJL2hol6Q2luYE9af+M86gfYNzwSgfW6dTkbb5E2GRetiunIhslloNz95CDd88J83JsAGgan7sxfxpl8bCNinkdB8q/jWCJVAGTwVVl3KUrpXesgV3yc+zU9TYUPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738968294; c=relaxed/simple;
	bh=xER+J0rwCJQXKyznu3AhTqAUumvPqCAq0oO+l0T+4Ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQxQS/lMLM3mrneypBEkgfcW2ZYLkggCX9uNVQmqHQPO2wWXr5StT5xwlLvrH9WmMhmnBlHg2g0fuparPSBPDqDztJ1ShFGMkoqFge8tefmsWUdrR1KKS3I7B29sMCEvNMqs9GRiV9rj0c1QBqZWYZZV9DkK1K+ZACZSfCz+s5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=w44qH0cg; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="w44qH0cg"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21f464b9a27so38664365ad.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Feb 2025 14:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738968292; x=1739573092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aaVupd8VUc45i80fdS121DnyNihJxKhlS0yfklFXjf8=;
        b=w44qH0cg8smdRVacaHUWJ5+JluQwJAzwMJL91s/9wbzyha0lRsaqsycVXXoBmLXUmf
         8GBGut8+xCexykHdzbfg8uWLz8BoCR17Wu6PMbncbjJI+AN+b0MB94siQ2R6grODGb8X
         y72ThrRxw2rnVprrZ0sXWnk5zdEt7Ch/po0RBwPwAROkxtO1o6WfPAtZpQ4dClYxil2d
         g2K6Iteft2lxPUNkbmorHFb3oyNyGOIgBQM1AMh4WBUp7parZPwvldP41mTdgcKx3O4z
         hQNGfa9/tNb0tv1JinKn6aMWDm8ZhtTh7rFzTNMdufnquS7kcs/KbLJMDQp3Dz9SlswS
         bJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738968293; x=1739573093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaVupd8VUc45i80fdS121DnyNihJxKhlS0yfklFXjf8=;
        b=cZGi71zjGFH182GkXM1R3Bi3FxqnBsAwW0e/qBphWue2CI4Jq2hqEwE5/5YnEFqTM0
         UyPpP28Y8Y/JOyuffPDHnKqCzyGzuCrlIA+S+6H6x5aRKFTLXF3EhPZT1ewC/RiMCGRd
         MNkY1WbGxEEu1U4/44U3ISFUHqtxoQ1RkNgJWsIS/zK5sWLp/SnXuxMoQeroG9Le+hpl
         udptPVj7HVdLpflRTInyE9Z8l8oPPfe3W616NP51XYtGPLfbeNtCh1DjDlbGG5XxJjpO
         JihhKXD0QBv2RZBUGfEEAVQS+xcA5TyPiJo8SdOsueZz1FtLWRrDi5EAWdFGIMItWyrT
         f+RQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvRy29jJbDQxCkEjbAiPopGdZ2lfl1q1Hu8eoTTfSJXapaSH9lbdpMFSY1J2BlrPnpTh9QVKI7p8A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+lrWe3ELLrNW9Q7H3oUkx/w7wovPoU0DynZH8d6uNeIfxdtmD
	G/p9rwi5pf8Pi2biJD3LJJkFvvc6Yjg8FKMVyET/rPQoppkB5+if4c5eASZYAIw=
X-Gm-Gg: ASbGncuTXQHKZh3a0f96cOCiQ81k1scIsxeWUXYsDJGW415qnLzcYE5kjo6/vpnwaFj
	p+iSga+DtKndkuBWYpRrN+dgepTD5HWBR0K8MqT4bhcQwmME97+f5t3mJhCpa/1FxYrT77PBScW
	cv5oPxQt64qkA0rqGTFJ1AiMA0R3afdx2wLKS6ZV+VVE/VZG9yj/tgLLgbIq1cUNtcS/htTnllR
	sIqkazAtqE95ood+5OCtGdRSFdYKBNTgkLhlpafZvXKje4Q5Waamgo1yZSorT2YHbRvTmL7XZv4
	kAJi9P6KZw+WhRjsPCBKpLEzEQ==
X-Google-Smtp-Source: AGHT+IGTbu0BMzwMN01MWsrhsIOFLeTlIMVdLcXc0KHhDWapExjSRgm5VmEl2B4ZBoi8LJRoMaWbIQ==
X-Received: by 2002:a05:6a21:7a4a:b0:1ed:a578:127a with SMTP id adf61e73a8af0-1ee03b70c91mr10868884637.40.1738968292668;
        Fri, 07 Feb 2025 14:44:52 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51aeb8d9bsm3508358a12.12.2025.02.07.14.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 14:44:52 -0800 (PST)
Date: Fri, 7 Feb 2025 14:44:48 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Mark Brown <broonie@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, rick.p.edgecombe@intel.com
Subject: Re: [PATCH v9 01/26] mm: helper `is_shadow_stack_vma` to check
 shadow stack vma
Message-ID: <Z6aM4NZyJSGLwIPr@debug.ba.rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
 <20250204-v5_user_cfi_series-v9-1-b37a49c5205c@rivosinc.com>
 <6543c6b6-da86-4c10-9b8c-e5fe6f6f7da9@suse.cz>
 <5708c19d-240a-466a-b17a-d51b26ab95e6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <5708c19d-240a-466a-b17a-d51b26ab95e6@sirena.org.uk>

On Fri, Feb 07, 2025 at 08:06:59PM +0000, Mark Brown wrote:
>On Fri, Feb 07, 2025 at 10:27:10AM +0100, Vlastimil Babka wrote:
>> On 2/5/25 02:21, Deepak Gupta wrote:
>> > VM_SHADOW_STACK (alias to VM_HIGH_ARCH_5) is used to encode shadow stack
>
>> I see that arm GCS uses VM_HIGH_ARCH_6.
>
>That'll be bitrot in the changelog, it was originally VM_HIGH_ARCH_5 on
>arm64 as well but we had to renumber due to the addition of
>VM_MTE_ALLOWED while the GCS series was on the list.  The changelog just
>shouldn't mention VM_HIGH_ARCH_x, it's not particularly relevant here.

Yeah noted. Thanks.
