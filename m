Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802871CDA16
	for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 08:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736842736; cv=none; b=XBzk2CFZEjxpq0/BFsRrSjNcZJUt07ZkibNPiboZ3KenurY2QVQ7bUEL0aGKSswaROvpxrloBHJ+NhHfhHW6VxdX6prDhIFFEuLqjLH9XY54OY9zjHnUzxl28EXVN0Cr/ZwodYTsfPhxCCDeORDpEB2xf5hkEITeU6U7PLxaLIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736842736; c=relaxed/simple;
	bh=9OES9u7ndNTg23exjKFmEKlMuJuMh2Yru16mozYIZAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uK7Bg5bX8zz4UsbFOhMCG6s25nRM2RhA6KgSzok/vspV385V9K/HinBXJHO4S1cKtqgwvTTo17P2S5DNiagL86CIfJ/+aD64T8PV5Eodk7+QHVgTnLFru03KOiLXRnW45lM7qpA/0KET0vrzIZC6J3tOPQLQr9emywvbeqANwfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=jS0sTSf8; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="jS0sTSf8"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab322ecd75dso109805266b.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 00:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1736842732; x=1737447532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=919mq0lvhQt4eDMddsUOvRjvpMDPaCDvxvPkUhR1Wjk=;
        b=jS0sTSf8bYH7YeTL/gdmwdvvGGN/ivXOcTBzpvE8Bd66OIu13Xm5SeCOhLNb5C2cvN
         zjvdUyNunOE5SHCqC36al0rxKLHdrOuD3Ye3RRaC+6/yBQ7rrslskMrySOkCDpeb3wgG
         QyeCcDd+lfqbhV1iQoU6gCLCyK9K5YfMfXSsg+JY3vTc7aX2c5idrks18r2gdpRrwyNe
         W/GpAIlhXEdE4ZJbHwJ8gHhu+kU0gBSWM8o2Op6bURzgYO6GyaydAcvUMBM0t0c68FRL
         Tta8lBJsAgoTMqlFvUW8CjCcQ82Q6/6o5+GcPsgXfwgdyDS4fXSbKwHCadJyoeISqJ5A
         7EXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736842732; x=1737447532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=919mq0lvhQt4eDMddsUOvRjvpMDPaCDvxvPkUhR1Wjk=;
        b=lJXLwoj+thbp9KS6aZ1ZFy0kaDlCKfFxpxKBgS/S35mh2Opb9DvPYRHrbyoC1tLDQE
         2w2FyCryNf2+eQcnfdy48hP+alKNTJM8Oo9t/xraUO9zLqmIHYSAul9WbrhgYUYtgVlR
         AdaRvU2ltoNYzVofsb3Ctds0eHJg4jqrww3TaPkRooxcRB5tn3m/F5jyzPwzd+JVAGPc
         nzcupax/bXjf8xtf5E9D93EKxMWMwXTm39r2AE+E32cif2Fwpz9ymTatZSa6yz/ANic0
         0Uisw0BXBoakOkRfLgVfURS/gGRJjGSf5Ln1hkkGVGcp5rzNM4wucMGfuOZ4MWMhmN3W
         B4cQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbfkBETWi5fbGrfrCGO+x3Y5jp5rzJuap7gyf8SaIc3+9CxzIS+qGtKkqIh3o4OWC4jZ809SAB0GQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxClNZIEUfulitrF0CGJ029it2rTvrdo4NpSY8F1HlC6b8W7rr4
	+SqX8wLXQ/OWmCtD9wMjcQlAf1cMdIegc/OYvIjk3s+bg6dCfUj8jJUFjN/7gP4=
X-Gm-Gg: ASbGnctqDEHQgjiaoalMNHcE//EVDR5hXzBcf+Mr0fdBwVpE/WQDzJjdjh6qL7a/Zin
	eitk8X4uHJVKHbjH7o3yr0UZPZagxQQMHP89yI2SDap/LsxknqPugLz2UWHBLW4nxt8urG7Ny7+
	BXHSvS+OvECLVMdE511qn0CIdtRwuFTfTCT+nX9Dp1R0NXXOridYXTmk5/RZ0i31VNyzWFPtHQ7
	FBugQXvXNO7dRqe/Qnf7UhUCgvj+0SMYE1pIA2ZT1FViifGqFCmEZH+PdtYq+hD9lw4dVvfGugZ
	jua5nWfMmhR3FdnYJgmK2ib6z+hWSqI/Ql68bCw+hw==
X-Google-Smtp-Source: AGHT+IFKx1euNh7eZXgY8ADD17X9tMwi3Ip5exxpfz1uFMj+6SCvgp55q/e2kn/pYQTg+l9juFf97w==
X-Received: by 2002:a17:907:94d2:b0:aae:f029:c2ec with SMTP id a640c23a62f3a-ab2c3c8288amr1583403466b.12.1736842731745;
        Tue, 14 Jan 2025 00:18:51 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90e8888sm596883166b.80.2025.01.14.00.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 00:18:51 -0800 (PST)
Date: Tue, 14 Jan 2025 09:18:50 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: alexghiti@rivosinc.com, andybnac@gmail.com, aou@eecs.berkeley.edu, 
	charlie@rivosinc.com, cleger@rivosinc.com, conor.dooley@microchip.com, 
	conor@kernel.org, corbet@lwn.net, evan@rivosinc.com, jesse@rivosinc.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	samuel.holland@sifive.com, shuah@kernel.org
Subject: Re: [PATCH v4 3/3] RISC-V: selftests: Add TEST_ZICBOM into CBO tests
Message-ID: <20250114-675adccdafd17f716f345b1e@orel>
References: <20250114021936.17234-1-cuiyunhui@bytedance.com>
 <20250114021936.17234-4-cuiyunhui@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114021936.17234-4-cuiyunhui@bytedance.com>

On Tue, Jan 14, 2025 at 10:19:36AM +0800, Yunhui Cui wrote:
> Add test for Zicbom and its block size into CBO tests, when
> Zicbom is present, test that cbo.clean/flush may be issued and works.
> As the software can't verify the clean/flush functions, we just judged
> that cbo.clean/flush isn't executed illegally.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  tools/testing/selftests/riscv/hwprobe/cbo.c | 66 +++++++++++++++++----
>  1 file changed, 55 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/testing/selftests/riscv/hwprobe/cbo.c b/tools/testing/selftests/riscv/hwprobe/cbo.c
> index a40541bb7c7d..dec510291ab8 100644
> --- a/tools/testing/selftests/riscv/hwprobe/cbo.c
> +++ b/tools/testing/selftests/riscv/hwprobe/cbo.c
> @@ -50,6 +50,14 @@ static void cbo_clean(char *base) { cbo_insn(base, 1); }
>  static void cbo_flush(char *base) { cbo_insn(base, 2); }
>  static void cbo_zero(char *base)  { cbo_insn(base, 4); }
>  
> +static void test_no_cbo_inval(void *arg)
> +{
> +	ksft_print_msg("Testing cbo.inval instruction remain privileged\n");
> +	illegal_insn = false;
> +	cbo_inval(&mem[0]);
> +	ksft_test_result(illegal_insn, "No cbo.inval\n");
> +}
> +
>  static void test_no_zicbom(void *arg)
>  {
>  	ksft_print_msg("Testing Zicbom instructions remain privileged\n");
> @@ -61,10 +69,6 @@ static void test_no_zicbom(void *arg)
>  	illegal_insn = false;
>  	cbo_flush(&mem[0]);
>  	ksft_test_result(illegal_insn, "No cbo.flush\n");
> -
> -	illegal_insn = false;
> -	cbo_inval(&mem[0]);
> -	ksft_test_result(illegal_insn, "No cbo.inval\n");
>  }
>  
>  static void test_no_zicboz(void *arg)
> @@ -81,6 +85,30 @@ static bool is_power_of_2(__u64 n)
>  	return n != 0 && (n & (n - 1)) == 0;
>  }
>  
> +static void test_zicbom(void *arg)
> +{
> +	struct riscv_hwprobe pair = {
> +		.key = RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE,
> +	};
> +	cpu_set_t *cpus = (cpu_set_t *)arg;
> +	__u64 block_size;
> +	long rc;
> +
> +	rc = riscv_hwprobe(&pair, 1, sizeof(cpu_set_t), (unsigned long *)cpus, 0);
> +	block_size = pair.value;
> +	ksft_test_result(rc == 0 && pair.key == RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE &&
> +			 is_power_of_2(block_size), "Zicbom block size\n");
> +	ksft_print_msg("Zicbom block size: %llu\n", block_size);
> +
> +	illegal_insn = false;
> +	cbo_clean(&mem[block_size]);
> +	ksft_test_result(!illegal_insn, "cbo.clean\n");
> +
> +	illegal_insn = false;
> +	cbo_flush(&mem[block_size]);
> +	ksft_test_result(!illegal_insn, "cbo.flush\n");
> +}
> +
>  static void test_zicboz(void *arg)
>  {
>  	struct riscv_hwprobe pair = {
> @@ -129,7 +157,7 @@ static void test_zicboz(void *arg)
>  	ksft_test_result_pass("cbo.zero check\n");
>  }
>  
> -static void check_no_zicboz_cpus(cpu_set_t *cpus)
> +static void check_no_zicbo_cpus(cpu_set_t *cpus, __u64 cbo)
>  {
>  	struct riscv_hwprobe pair = {
>  		.key = RISCV_HWPROBE_KEY_IMA_EXT_0,
> @@ -137,6 +165,7 @@ static void check_no_zicboz_cpus(cpu_set_t *cpus)
>  	cpu_set_t one_cpu;
>  	int i = 0, c = 0;
>  	long rc;
> +	char *cbostr;
>  
>  	while (i++ < CPU_COUNT(cpus)) {
>  		while (!CPU_ISSET(c, cpus))
> @@ -148,10 +177,13 @@ static void check_no_zicboz_cpus(cpu_set_t *cpus)
>  		rc = riscv_hwprobe(&pair, 1, sizeof(cpu_set_t), (unsigned long *)&one_cpu, 0);
>  		assert(rc == 0 && pair.key == RISCV_HWPROBE_KEY_IMA_EXT_0);
>  
> -		if (pair.value & RISCV_HWPROBE_EXT_ZICBOZ)
> -			ksft_exit_fail_msg("Zicboz is only present on a subset of harts.\n"
> -					   "Use taskset to select a set of harts where Zicboz\n"
> -					   "presence (present or not) is consistent for each hart\n");
> +		cbostr = cbo == RISCV_HWPROBE_EXT_ZICBOZ ? "Zicboz" : "Zicbom";
> +
> +		if (pair.value & cbo)
> +			ksft_exit_fail_msg("%s is only present on a subset of harts.\n"
> +					   "Use taskset to select a set of harts where %s\n"
> +					   "presence (present or not) is consistent for each hart\n",
> +					   cbostr, cbostr);
>  		++c;
>  	}
>  }
> @@ -159,7 +191,9 @@ static void check_no_zicboz_cpus(cpu_set_t *cpus)
>  enum {
>  	TEST_ZICBOZ,
>  	TEST_NO_ZICBOZ,
> +	TEST_ZICBOM,
>  	TEST_NO_ZICBOM,
> +	TEST_NO_ZICBOINVAL,

nit: TEST_NO_CBO_INVAL would be a better name.

>  };
>  
>  static struct test_info {
> @@ -169,7 +203,9 @@ static struct test_info {
>  } tests[] = {
>  	[TEST_ZICBOZ]		= { .nr_tests = 3, test_zicboz },
>  	[TEST_NO_ZICBOZ]	= { .nr_tests = 1, test_no_zicboz },
> -	[TEST_NO_ZICBOM]	= { .nr_tests = 3, test_no_zicbom },
> +	[TEST_ZICBOM]		= { .nr_tests = 3, test_zicbom },
> +	[TEST_NO_ZICBOM]	= { .nr_tests = 2, test_no_zicbom },
> +	[TEST_NO_ZICBOINVAL]	= { .nr_tests = 1, test_no_cbo_inval },
>  };
>  
>  int main(int argc, char **argv)
> @@ -189,6 +225,7 @@ int main(int argc, char **argv)
>  		assert(rc == 0);
>  		tests[TEST_NO_ZICBOZ].enabled = true;
>  		tests[TEST_NO_ZICBOM].enabled = true;
> +		tests[TEST_NO_ZICBOINVAL].enabled = true;
>  	}
>  
>  	rc = sched_getaffinity(0, sizeof(cpu_set_t), &cpus);
> @@ -206,7 +243,14 @@ int main(int argc, char **argv)
>  		tests[TEST_ZICBOZ].enabled = true;
>  		tests[TEST_NO_ZICBOZ].enabled = false;
>  	} else {
> -		check_no_zicboz_cpus(&cpus);
> +		check_no_zicbo_cpus(&cpus, RISCV_HWPROBE_EXT_ZICBOZ);
> +	}
> +
> +	if (pair.value & RISCV_HWPROBE_EXT_ZICBOM) {
> +		tests[TEST_ZICBOM].enabled = true;
> +		tests[TEST_NO_ZICBOM].enabled = false;
> +	} else {
> +		check_no_zicbo_cpus(&cpus, RISCV_HWPROBE_EXT_ZICBOM);
>  	}
>  
>  	for (i = 0; i < ARRAY_SIZE(tests); ++i)
> -- 
> 2.39.2
>

Besides the nit,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
