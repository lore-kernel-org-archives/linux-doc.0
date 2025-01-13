Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5E722A4CB
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 12:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736772178; cv=none; b=hJIsS6e8rMhmVoJkFmpUAXGaE+HcvH8BxGAGUTC7dN89PkipT7gnKHZGyn71ngyrtpJ1XwtUCUvFdB8pFt/DiXqximfdoTXpIfDmgauRPdxIqE6FludANqG9p/Uogsg44C0jemqrtYiTXrFav/LrOimusw5ceRAt/2udWo2F1b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736772178; c=relaxed/simple;
	bh=i6xH8DwaoL4kHA3LExZnEZe7nh3EsWsCvU+OC6SIozc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hEIknD0J2sceFhVAXPR4ssxjoNkU/+9DzlC5jK96GG+ctYNfMyVm2qNnpwEAGA6yPvtKZPlQFahH2o546WbP98xL7s6hrkYJUr79AtXyH4/rgUbOHxcv6SmUvhJhAyQjesOzbXP1fdhxFFB+prF78akItwj+Cqk56FjI0ObicE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=eyoR/naq; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="eyoR/naq"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso754939366b.3
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 04:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1736772175; x=1737376975; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sAiYWUvh1If93v3noS5+E3HP+RI1JtXuaeQPNUKjPW8=;
        b=eyoR/naqxB7kYvzJlgqZ6cguDQyDqzuvk5XzlhZLwwYYzU5dqfQ5T85tHOsogSVAyo
         ytgahRFaqBP25ZtW0rOYN/VjW9WIMUNz4cDMHG5NveaOPpiYELdV+CxFhYke43yGKak1
         SK+AM+D4+3d53DEKpBjWSMbouAfqydLnhHrpiZROn6JpakHu90KAp+ZMaC8pEsZ+Z+e9
         2zFnC/kS3oGeD5u0rUc7z8JIFyxI3REX34pRBlxeNugAk6nSNB1TrWu4g0eLiwdwXVTe
         5HFuITAU5cIjlAK8bJZyMU1GtmKUvT/giHaGQSkAC4z8lVEV585st+D8lvsWomBYVzBl
         KuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736772175; x=1737376975;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sAiYWUvh1If93v3noS5+E3HP+RI1JtXuaeQPNUKjPW8=;
        b=JkVXvWd28faXelDpUVmSQWNPPw63tb5XTGswp0JJtJGmAkxj+x7lMPob2QBkv8xi7N
         1BY2tsoE7S35NX5AosojbmGQ1wWOtBoaUHuc+jJ41A6aIJ+VNMiLCXtUmUaIdMQ5ZESJ
         43nkj0gaoqmpCcUA6Q4AL202Q6dHhCakgGfzjNv/HWiLhcdoemBv4eOm7BFOasKQyYM/
         d4cbfWykbDzbwgfOI1JnJcOcpKYPgcCyZq2L/oPGtzf40+8Jjgql1YHj+5WE2CuVlL26
         tw5eX6y+Ag3OnPoTuKDt1LvRZVGJzk2uKdRK3GuoNWgNKPWlf9trnHkUd539qmK4i3lF
         3Zcg==
X-Forwarded-Encrypted: i=1; AJvYcCX4AC19gFTCHZcuETe3Z1k4K3atZrWjNRl0bTuXJQ1HLmvUsWliZrW62HxWDNSzkc8Tw881d1kqLH8=@vger.kernel.org
X-Gm-Message-State: AOJu0YycLvuwfEzqRyJANhi53lH8tzS3fflj5CIS/raSKN+HKlbDPaRx
	wu7YckWauladuesCZPHPzSzRA2Apg4gJ8giKhHxvuE0yIfs/fZ5gU4v0QZj7aGs=
X-Gm-Gg: ASbGncsZZU7EBScgOwHFPeCzaaoT2ytNsZhF1XosZN9r0uZ1W8wiwYhWqdC6MK0q8e/
	GlyIjJYR6b57vnT4Py0W8x5nJduy/gKddGGvofN6U5kC22VG+6MbClfwxTzii7xJwq8wbFt+yBl
	sptPNaHziGAy5lF793q3Er+pdg1gohBxMEIof1D6IWJIv63CoaYbV7ZHBI3S/IfaicAuLRlj5CY
	Vo2cyF8qTBY/Y1JJ1YTiQMICxZGohEIgCEHX/uFaHoZjP+gKGbCBd/SW06YwHIxwoWP8oLimx1Z
	Hgc22fj0IJupf5CW5GE9aD5fmDRHR/vlRcsj4pieSQ==
X-Google-Smtp-Source: AGHT+IHqDWNUz/KeZigVP+2fBm6l9Rhdi8pdp5RkiyA5Lr4TwoY5aGNc8rpSMR3abpZ24Sr0716z1A==
X-Received: by 2002:a17:907:1b91:b0:ab2:c282:e8ca with SMTP id a640c23a62f3a-ab2c282e946mr1186491766b.24.1736772174410;
        Mon, 13 Jan 2025 04:42:54 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90d6838sm506052766b.55.2025.01.13.04.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:42:54 -0800 (PST)
Date: Mon, 13 Jan 2025 13:42:53 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: alexghiti@rivosinc.com, andybnac@gmail.com, aou@eecs.berkeley.edu, 
	charlie@rivosinc.com, cleger@rivosinc.com, conor.dooley@microchip.com, 
	conor@kernel.org, corbet@lwn.net, evan@rivosinc.com, jesse@rivosinc.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	samuel.holland@sifive.com, shuah@kernel.org
Subject: Re: [External] Re: [PATCH v3 3/3] RISC-V: selftests: Add TEST_ZICBOM
 into CBO tests
Message-ID: <20250113-28a67adb2827a1adea1c714d@orel>
References: <20250113083635.73826-1-cuiyunhui@bytedance.com>
 <20250113083635.73826-3-cuiyunhui@bytedance.com>
 <20250113-cb08bcb35bc8b6213fe89ecd@orel>
 <CAEEQ3wmOVKiy1FVdB+LggdX-7a_JMh+2A-bjG0XGF7nY0Goo2w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEEQ3wmOVKiy1FVdB+LggdX-7a_JMh+2A-bjG0XGF7nY0Goo2w@mail.gmail.com>

On Mon, Jan 13, 2025 at 07:49:39PM +0800, yunhui cui wrote:
> Hi drew,
> 
> On Mon, Jan 13, 2025 at 5:18 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Mon, Jan 13, 2025 at 04:36:35PM +0800, Yunhui Cui wrote:
> > > Add test for Zicbom and its block size into CBO tests, when
> > > Zicbom is present, test that cbo.clean/flush may be issued and works.
> > > As the software can't verify the clean/flush functions, we just judged
> > > that cbo.clean/flush isn't executed illegally.
> > >
> > > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > > ---
> > >  tools/testing/selftests/riscv/hwprobe/cbo.c | 49 ++++++++++++++++++---
> > >  1 file changed, 43 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/tools/testing/selftests/riscv/hwprobe/cbo.c b/tools/testing/selftests/riscv/hwprobe/cbo.c
> > > index a40541bb7c7d..b63e23f95e08 100644
> > > --- a/tools/testing/selftests/riscv/hwprobe/cbo.c
> > > +++ b/tools/testing/selftests/riscv/hwprobe/cbo.c
> > > @@ -81,6 +81,30 @@ static bool is_power_of_2(__u64 n)
> > >       return n != 0 && (n & (n - 1)) == 0;
> > >  }
> > >
> > > +static void test_zicbom(void *arg)
> > > +{
> > > +     struct riscv_hwprobe pair = {
> > > +             .key = RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE,
> > > +     };
> > > +     cpu_set_t *cpus = (cpu_set_t *)arg;
> > > +     __u64 block_size;
> > > +     long rc;
> > > +
> > > +     rc = riscv_hwprobe(&pair, 1, sizeof(cpu_set_t), (unsigned long *)cpus, 0);
> > > +     block_size = pair.value;
> > > +     ksft_test_result(rc == 0 && pair.key == RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE &&
> > > +                      is_power_of_2(block_size), "Zicbom block size\n");
> > > +     ksft_print_msg("Zicbom block size: %llu\n", block_size);
> > > +
> > > +     illegal_insn = false;
> > > +     cbo_clean(&mem[block_size]);
> > > +     ksft_test_result(!illegal_insn, "cbo.clean\n");
> > > +
> > > +     illegal_insn = false;
> > > +     cbo_flush(&mem[block_size]);
> > > +     ksft_test_result(!illegal_insn, "cbo.flush\n");
> > > +}
> > > +
> > >  static void test_zicboz(void *arg)
> > >  {
> > >       struct riscv_hwprobe pair = {
> > > @@ -129,7 +153,7 @@ static void test_zicboz(void *arg)
> > >       ksft_test_result_pass("cbo.zero check\n");
> > >  }
> > >
> > > -static void check_no_zicboz_cpus(cpu_set_t *cpus)
> > > +static void check_no_zicbo_cpus(cpu_set_t *cpus, __u64 cbo)
> > >  {
> > >       struct riscv_hwprobe pair = {
> > >               .key = RISCV_HWPROBE_KEY_IMA_EXT_0,
> > > @@ -137,6 +161,7 @@ static void check_no_zicboz_cpus(cpu_set_t *cpus)
> > >       cpu_set_t one_cpu;
> > >       int i = 0, c = 0;
> > >       long rc;
> > > +     char *cbostr;
> > >
> > >       while (i++ < CPU_COUNT(cpus)) {
> > >               while (!CPU_ISSET(c, cpus))
> > > @@ -148,10 +173,13 @@ static void check_no_zicboz_cpus(cpu_set_t *cpus)
> > >               rc = riscv_hwprobe(&pair, 1, sizeof(cpu_set_t), (unsigned long *)&one_cpu, 0);
> > >               assert(rc == 0 && pair.key == RISCV_HWPROBE_KEY_IMA_EXT_0);
> > >
> > > -             if (pair.value & RISCV_HWPROBE_EXT_ZICBOZ)
> > > -                     ksft_exit_fail_msg("Zicboz is only present on a subset of harts.\n"
> > > -                                        "Use taskset to select a set of harts where Zicboz\n"
> > > -                                        "presence (present or not) is consistent for each hart\n");
> > > +             cbostr = cbo == RISCV_HWPROBE_EXT_ZICBOZ ? "Zicboz" : "Zicbom";
> > > +
> > > +             if (pair.value & cbo)
> > > +                     ksft_exit_fail_msg("%s is only present on a subset of harts.\n"
> > > +                                        "Use taskset to select a set of harts where %s\n"
> > > +                                        "presence (present or not) is consistent for each hart\n",
> > > +                                        cbostr, cbostr);
> > >               ++c;
> > >       }
> > >  }
> > > @@ -159,6 +187,7 @@ static void check_no_zicboz_cpus(cpu_set_t *cpus)
> > >  enum {
> > >       TEST_ZICBOZ,
> > >       TEST_NO_ZICBOZ,
> > > +     TEST_ZICBOM,
> > >       TEST_NO_ZICBOM,
> > >  };
> > >
> > > @@ -169,6 +198,7 @@ static struct test_info {
> > >  } tests[] = {
> > >       [TEST_ZICBOZ]           = { .nr_tests = 3, test_zicboz },
> > >       [TEST_NO_ZICBOZ]        = { .nr_tests = 1, test_no_zicboz },
> > > +     [TEST_ZICBOM]           = { .nr_tests = 3, test_zicbom },
> > >       [TEST_NO_ZICBOM]        = { .nr_tests = 3, test_no_zicbom },
> > >  };
> > >
> > > @@ -206,7 +236,14 @@ int main(int argc, char **argv)
> > >               tests[TEST_ZICBOZ].enabled = true;
> > >               tests[TEST_NO_ZICBOZ].enabled = false;
> > >       } else {
> > > -             check_no_zicboz_cpus(&cpus);
> > > +             check_no_zicbo_cpus(&cpus, RISCV_HWPROBE_EXT_ZICBOZ);
> > > +     }
> > > +
> > > +     if (pair.value & RISCV_HWPROBE_EXT_ZICBOM) {
> > > +             tests[TEST_ZICBOM].enabled = true;
> > > +             tests[TEST_NO_ZICBOM].enabled = false;
> > > +     } else {
> > > +             check_no_zicbo_cpus(&cpus, RISCV_HWPROBE_EXT_ZICBOM);
> > >       }
> > >
> > >       for (i = 0; i < ARRAY_SIZE(tests); ++i)
> > > --
> > > 2.39.2
> > >
> >
> > The test_no_zicbom() test needs to have the illegal instruction SIGILL
> > test for cbo.inval moved out into its own test. So, even when we have
> > zicbom we still test that cbo.inval generates a SIGILL.
> 
> Do you mean moving cbo_inval() into test_zicbom()? Then does
> cbo_inval(&mem[0]) also need to be tested in test_no_zicbom()?

No, I'd create a new test named test_no_cbo_inval(), which should always
run regardless of zicbom/zicboz detection.

Thanks,
drew
