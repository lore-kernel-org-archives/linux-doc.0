Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793274912;
	b=rXOXxx5YQ3pEOpulf6Qep5cu9bZR/RQx/oV2yK75lnQvMXs0iWgxjYNBBpspp+7inaQJ
	 TXETB1JeMBxFapZGJGWTeiBXnUeZmQM8qNOJAJ4RsB+sFaLOyr6pRAZpITr26U8btSW/R
	 2tV197dTJUXqbPGIJKmOlJDBql7TWADHsMk5ICpL4842DR5sxGpj/79A8LMW3bOh44fS7
	 jWSD8bmMrXEOEzfDCbF+PWNYInjpN1D2pJQsTq+AfEhEcesy0UUS60uLnLTrRZtMGMiH1
	 6fNrfNWhoVfJoSrqPGE90K8brdyT85f/jJMfo2Vg+j3FMBudQ9tpfkLVUsrbevmyAfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793274912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Original-From:References:In-Reply-To:From:Mime-Version:
	 User-Agent:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=3VY7aUW6rjKEecWzoHgMRcesnfYCNorLy5OBPK7xTbg=;
	b=uJ7DXuj2vG+a8uRfpQePyGhnuoXha4O0dt+ZjbPXGz+9Bxhk4pG6RUQKPpRrvourZFCM
	 5FMUlaJ6m598hgxaP4MoI4PHySCCnkzupwdvK68qCvEoK3Cpt0DI7GFbtmAbnX0I4S8nA
	 i8GezdLrni9gqfGyT+g6kHOOFK5HWD39E/GW5OXgVnXDj+LdkCYOoB8f/OKqaytZTLDxV
	 8SvlygtXDT1xqn+p5RC9NkW8jr7u1QvgXfqSYCzNZr4Be1GDVE32nVCLtOvj8iupJcVMP
	 wJs0tDZA9gEpvRSLfBUjzDOx/SKWj6MOL/iWD/JBVJ+09Nq3f+XZ00pZNYJbnrOzUKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=CuuMj9g2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4B6606A31D
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 11:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F4B6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=CuuMj9g2
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso2514722e87.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 04:55:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793274910; cv=none;
        d=google.com; s=arc-20260327;
        b=bXMBUpqqpzgZjinzYgiWijbpHItv76/IFo96l4+yw06k70YNSo9WUUOn38gNxXf975
         +H5sp6JmP1OgQFiWVCA4/Yvor/MoW2+ZQd7TsC5uj6wojqgZszgXXuV19BkbbmObEUh5
         eBr1dOztUUMIuMPdQb9FAnsx5Hd0HrrZ5+qdl0kpKe36+jqlpNAIADHNp0MErkgz7bC9
         7pRv4wMYqKbrOWVA1RsMCtcbKJnWGQBMNiwYpeuFe+jRfG9MSlnU8klj2kdBAdcn3BXT
         WPFVBNW7JH8nKi6/gYzC6VlwBbW0FJXT38L8efOATrPGu1nWbeRqCWNj83+Nx8xGmIs/
         58dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:user-agent:mime-version:from
         :in-reply-to:references:dkim-signature;
        bh=3VY7aUW6rjKEecWzoHgMRcesnfYCNorLy5OBPK7xTbg=;
        fh=3VG19ont4LNBT3m+qumCg7hueeRHBio2uzx3/8L8xQw=;
        b=Xq5BPKs6MPLOOZVQLaL+cjGsfIJKQuh2twvAg335+31PzFtP9YqY3SjOaBFd78LIwX
         uhE5KQjymbXdgLJbCK2JjDMFK1tJw+33zlNlJNllJ8pW55bAlzB60efSd3Yw/ZvNuK8i
         j+jfzbgUytKcTPrRXnzNeNzAHNDwQjVUqBwgX6SB4oKKA9Ep+7oVs6JTfPQJzkFpGM4r
         xLwzwrIFmaJ3KNCIuIpDhD/HVUhju+C3nWO2F9cyokd81Abkprw97zdiUsvDmJ5vRBt0
         8I5DEg+Eacub4yjrmnDKDloMJzlupTIow82sQKSM4987wZht4XaZYzReA3scIF7g4USz
         he/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793274910; x=1793879710; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:user-agent:mime-version
         :from:in-reply-to:references:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3VY7aUW6rjKEecWzoHgMRcesnfYCNorLy5OBPK7xTbg=;
        b=CuuMj9g2Ph+v1MKWI7x/Ma1dHL0Yr4KokjmTvuzJuVaafCQww2WgpuyLSHPlgWCcD/
         +Gk+X8VA79TI3jaY6nC6/lgeOAgqapOhP0c8xZPuPpkSYomeOdNEBwQni95Grcwd84fk
         0zgQpy67pQE35kAeiaEWruBgLx52yWqsp3rGJqwcEiJRwTDz4zDYRzRbxk9SEsvxX5lS
         7m8CGcZU0pOzrhooYnyOmP3atBJQ+M78Uk59VVZtrrTUdGOndQtrAHVOH2KcLXppmQaf
         8uTqekRKs9XNH/7t1+8VISE0bfe3CZPTREigA+N8q68VSTgdF5IN3ggNxT9g9ztZTP0H
         pojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793274910; x=1793879710;
        h=content-type:cc:to:subject:message-id:date:user-agent:mime-version
         :from:in-reply-to:references:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3VY7aUW6rjKEecWzoHgMRcesnfYCNorLy5OBPK7xTbg=;
        b=XTbeBbiQ76E43M2rP2tf+u5GN9AHwkC51IoAIbH9JpwCFyYu1ng1U1pC/FjgRT7UEd
         CWyh0+wSPGLsFbgxKXmD2VA7xuPM+pU3QasTIEAw2HEqddDSKREAwJjCobh5Vc81Xizx
         2BP2Yul+exHfFSMDo4x7TRLAF5ohf4Bp6s0WMKoL8kb3pJUQ48GQpzgEB8uZciqyHO2M
         o6kRSGsHyCdEk0lAO42UYXs6HFOkhbI0R4AKzLf7NRH6QBCf/mltkS1LaqDaBae2om0Q
         pyt+QZWthJr3YCFRtjfxtexPwko7gH0v1HotQ+SZc8k4PS/VlNio4tHuYUEvaZyFDW+y
         X+4w==
X-Forwarded-Encrypted: i=1; AKwUvBzRFfNZjMg/v02BgLiBd56of4SXOdos4KFZyBZjqr9XGNgeQEPl15KZsoS7gJj5lJkOJdf9XazKRuk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsIDfpQqGfqd/nXNH0GsfUJ2JpKBo/3FQPrxYLTPHD/5tBNZ1r
	w6VxhQxjpr47T6gZea65wAU27rYYZbyoqohNbixSxYinXg5KxtqD/V5j6Jb2VScuZqR4mggLp7U
	TwLJY0rb723qJUEDU0utPWxlU6YV/zMTloQ4ODdPYlA==
X-Gm-Gg: AYBFou06ka9uTP1ucvXB96LJAvAHRV/l4nAOtdhtHfAvRpQuFc18LgjxTxpPHN0H4jG
	HDdSAXMoauZ/9Z0nAETurpL6cPJqhQT/KDU86P7I7JRlu5RUzULUcQdMlLJChnCPu12xxAo3X8r
	QARKvwFC4C7A6OOWgfYQx9r/T3VpUGJOL4QrxTOPIKn5OKKlR0rjmrXdcEzgnaJW9rasKfggx97
	tvFJD+BZUsISFNGqDzWyjOOIyvzc/MiJRUhEOyCrxkU6h2ZQKMyRN5eu+TFzWwo3K/zhUb6YWRe
	t1/VCrJ0h2lFzrnsH/SH85tzzgHOBzEIru/ZSrsq1sO76fCks+m07cdN70/bqTK/tK8hKOH7qmg
	2Ymcndv5Zluz2c8x7suiW7LKcvBFwDyZKC21rjg==
X-Received: by 2002:a05:6512:1592:b0:5bf:a209:f81f with SMTP id
 2adb3069b0e04-5bfcad27d03mr1811204e87.37.1793274909843; Thu, 29 Oct 2026
 04:55:09 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 06:55:08 -0500
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 06:55:08 -0500
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com> <CA+Ht8=YtrKJxr7YLO2z1389NPDnws8hSppAzVnYYJp5K1duvOw@mail.gmail.com>
In-Reply-To: <CA+Ht8=YtrKJxr7YLO2z1389NPDnws8hSppAzVnYYJp5K1duvOw@mail.gmail.com>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
Date: Thu, 29 Oct 2026 06:55:08 -0500
X-Gm-Features: AclHuK9_AGd24eF3VOAo28szXNgJA0RFlLmIywua3jpx-rZ6jgflVyqTuZQeovM
Message-ID: <CACnXVncN5yT7Dmqom6m1SaFO0_MjXeoScTRfGUZ4RVdZKhAnHw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v12 00/11] riscv: add SBI Supervisor
 Software Events support
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor@kernel.org>, 
	Anup Patel <anup.patel@oss.qualcomm.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Yunhui Cui <cuiyunhui@bytedance.com>, Atish Patra <atish.patra@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, yuanzhu@bytedance.com, yang.yicong@picoheart.com, 
	yang.susheng@zte.com.cn, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Himanshu,

On 10/29/26 7:38 PM, Himanshu Chauhan wrote:
> Hi Zhanpeng,
>
>> [PATCH v12 00/11] riscv: add SBI Supervisor Software Events support
>
> I See only 8 patches out of 11.
Oops, I ran into a Gmail smtp system error. I've resent the last 3 patches.

Thanks,
Zhanpeng
