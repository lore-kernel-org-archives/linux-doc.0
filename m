Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA9F44C9E
	for <linux-doc@vger.kernel.org>; Mon, 22 Jul 2024 21:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721682892; cv=none; b=UUoMsOU6C5BKf+ZLHYhN8daMZVdIs7z7NduX4axFDFZXPym5ZfdoLOAInzJrLhFJTcg4h5Umkp1X+PsKpBSpmwRYMO0dohGU2eGxSr7LRggPz0ujoWKSQswumJxu5OBkKy1R8oD53YHhwCIvggZ67Lxhvp+8xshI1NJZn4amcvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721682892; c=relaxed/simple;
	bh=1lagUwf3RC7JZReX5Mnpd7A0gWXy3u+C9i+YHhmoyxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WHmERsytzErqkq3p4i/cials+GcDBuJp7LAs7h+gWklrNcYdjJrxAo8I4CQNH0b3Nvt92W5V8nDym7wdvLYB8iuETiHvTEnEmqb/NkQmOp+JwIFRCHcgLBHOSTs79pPFC2WORSz89746iCLzuQMyjN35j7b/X5weJeVeVyqNpXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=PHlu6V+Y; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="PHlu6V+Y"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fd90c2fc68so798635ad.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Jul 2024 14:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721682889; x=1722287689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=re4a/549teXfpxRZzb1IT6fF6eSAFMvkPvsA5nTBSEI=;
        b=PHlu6V+Y1tSVP4PYEI+aO1Y5Vhvotnse984CQjdRHMQmysJnhxRkkpTU4Ma3NA+xAZ
         XLCt/MIBou5dG4gsbvB0+RqFYiXwsuI5Lt7NC6j3co0V+i0SCmC+AGJn2JQar49XPQ4L
         h4xyARp8Ja2IQBQGlXlO4oUfKbd8sRNsj2XqcVtmfJGYEKVZZ5OY+v5RdXg/zd/ulsQf
         wIyGr3MtHBh6LnOU1EXiQzRdz5PQrMlwgTIlHhRPQSVNDhdmrCF8M/DX4gmEgBQxd+zU
         gE5KdMaGu6kuEzwNwt7+1guX3B37fVCWVeIq7jbvJHMUn+o6AJ9EsjRx4BFdoYcqwlxF
         rFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721682889; x=1722287689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=re4a/549teXfpxRZzb1IT6fF6eSAFMvkPvsA5nTBSEI=;
        b=KyUqn7lMvuQBZeMVEyHCBpIoNyJk4f6eu6IP7NDjRGanPkxWUatfsWxm91/l8FLQ07
         tNJ5PuS6MOVj6giNesMEgqrKG6Z+Ee6wVr5OqvKi1e9e1NCwFliZxGCyhw/G9z+FpeVO
         ceY3LUepP0hjT4fkurLVrUmep5IFJiTSeLsdkl4QZJ6v0T0OVliHCkgHfBNUfNeeArjn
         Bvn4w7mQ/6iKtHsq4biWkqiwJpALcgiNOTVKpZORnGUA0FXzcIov6lLSxO3Lu6RjMZdw
         QoBWJzHxCs5bum79si3qU7FaBvFg+KWztsbbS6shcUDZvJFCVQhwOGQduA51cyISDADA
         596Q==
X-Forwarded-Encrypted: i=1; AJvYcCX/O0Nj3UrGBl9rPxF0aEvdudu4zd93FOb9ln+6pGzXZjdU848EsbOE7sVDeZY1alUtdEx5YPYXLqO0vzX1yE+DSukbORuEadoc
X-Gm-Message-State: AOJu0YwFOgZnYbgdH+uv5glQ3FO7QkZUVY+Un+vlJPYwWD0yA6S9c3pI
	3AO0b2I75K716jR0z/ILFqC9cSzgQ/6Z4iK71kKCDflb9RUYDDe9vVV99PpVXZY=
X-Google-Smtp-Source: AGHT+IHNGpumvDD95UYgz2v1+PPZ4GlU1XFvLWIOWNaPJpQc9m08TfGb1igAHvmYgQ6MZbrThHXc8A==
X-Received: by 2002:a17:902:db02:b0:1fb:4b87:6e9d with SMTP id d9443c01a7336-1fdb5f6b95fmr9284455ad.42.1721682888632;
        Mon, 22 Jul 2024 14:14:48 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f485bd1sm59363665ad.275.2024.07.22.14.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 14:14:48 -0700 (PDT)
Date: Mon, 22 Jul 2024 14:14:44 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Jessica Clarke <jrtc27@jrtc27.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 12/13] selftests: riscv: Fix vector tests
Message-ID: <Zp7LxAWkDQMQhVLq@ghost>
References: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
 <20240719-xtheadvector-v5-12-4b485fc7d55f@rivosinc.com>
 <20240722-0940cd64c0d8bb03f2427022@orel>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722-0940cd64c0d8bb03f2427022@orel>

On Mon, Jul 22, 2024 at 01:47:29PM -0500, Andrew Jones wrote:
> On Fri, Jul 19, 2024 at 09:19:07AM GMT, Charlie Jenkins wrote:
> > Overhaul the riscv vector tests to use kselftest_harness to help the
> > test cases correctly report the results and decouple the individual test
> > cases from each other. With this refactoring, only run the test cases is
> > vector is reported and properly report the test case as skipped
> > otherwise. The v_initval_nolibc test was previously not checking if
> > vector was supported and used a function (malloc) which invalidates
> > the state of the vector registers.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  tools/testing/selftests/riscv/abi/ptrace           | Bin 0 -> 759368 bytes
> >  tools/testing/selftests/riscv/vector/.gitignore    |   3 +-
> >  tools/testing/selftests/riscv/vector/Makefile      |  17 +-
> >  .../selftests/riscv/vector/v_exec_initval_nolibc.c |  84 +++++++
> >  tools/testing/selftests/riscv/vector/v_helpers.c   |  56 +++++
> >  tools/testing/selftests/riscv/vector/v_helpers.h   |   5 +
> >  tools/testing/selftests/riscv/vector/v_initval.c   |  16 ++
> >  .../selftests/riscv/vector/v_initval_nolibc.c      |  68 ------
> >  .../testing/selftests/riscv/vector/vstate_prctl.c  | 266 ++++++++++++---------
> >  9 files changed, 324 insertions(+), 191 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/riscv/abi/ptrace b/tools/testing/selftests/riscv/abi/ptrace
> > new file mode 100755
> > index 000000000000..2b03e77b4dcf
> > Binary files /dev/null and b/tools/testing/selftests/riscv/abi/ptrace differ
> > diff --git a/tools/testing/selftests/riscv/vector/.gitignore b/tools/testing/selftests/riscv/vector/.gitignore
> > index 9ae7964491d5..7d9c87cd0649 100644
> > --- a/tools/testing/selftests/riscv/vector/.gitignore
> > +++ b/tools/testing/selftests/riscv/vector/.gitignore
> > @@ -1,3 +1,4 @@
> >  vstate_exec_nolibc
> >  vstate_prctl
> > -v_initval_nolibc
> > +v_initval
> > +v_exec_initval_nolibc
> > diff --git a/tools/testing/selftests/riscv/vector/Makefile b/tools/testing/selftests/riscv/vector/Makefile
> > index bfff0ff4f3be..995746359477 100644
> > --- a/tools/testing/selftests/riscv/vector/Makefile
> > +++ b/tools/testing/selftests/riscv/vector/Makefile
> > @@ -2,18 +2,27 @@
> >  # Copyright (C) 2021 ARM Limited
> >  # Originally tools/testing/arm64/abi/Makefile
> >  
> > -TEST_GEN_PROGS := vstate_prctl v_initval_nolibc
> > -TEST_GEN_PROGS_EXTENDED := vstate_exec_nolibc
> > +TEST_GEN_PROGS := v_initval vstate_prctl
> > +TEST_GEN_PROGS_EXTENDED := vstate_exec_nolibc v_exec_initval_nolibc sys_hwprobe.o v_helpers.o
> >  
> >  include ../../lib.mk
> >  
> > -$(OUTPUT)/vstate_prctl: vstate_prctl.c ../hwprobe/sys_hwprobe.S
> > +$(OUTPUT)/sys_hwprobe.o: ../hwprobe/sys_hwprobe.S
> > +	$(CC) -static -c -o$@ $(CFLAGS) $^
> > +
> > +$(OUTPUT)/v_helpers.o: v_helpers.c
> > +	$(CC) -static -c -o$@ $(CFLAGS) $^
> > +
> > +$(OUTPUT)/vstate_prctl: vstate_prctl.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
> >  	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> >  
> >  $(OUTPUT)/vstate_exec_nolibc: vstate_exec_nolibc.c
> >  	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
> >  		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
> >  
> > -$(OUTPUT)/v_initval_nolibc: v_initval_nolibc.c
> > +$(OUTPUT)/v_initval: v_initval.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
> > +	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> > +
> > +$(OUTPUT)/v_exec_initval_nolibc: v_exec_initval_nolibc.c
> >  	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
> >  		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
> > diff --git a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> > new file mode 100644
> > index 000000000000..74b13806baf0
> > --- /dev/null
> > +++ b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> > @@ -0,0 +1,84 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Get values of vector registers as soon as the program starts to test if
> > + * is properly cleaning the values before starting a new program. Vector
> > + * registers are caller saved, so no function calls may happen before reading
> > + * the values. To further ensure consistency, this file is compiled without
> > + * libc and without auto-vectorization.
> > + *
> > + * To be "clean" all values must be either all ones or all zeroes.
> > + */
> > +
> > +#define __stringify_1(x...)	#x
> > +#define __stringify(x...)	__stringify_1(x)
> > +
> > +int main(int argc, char **argv)
> > +{
> > +	char prev_value = 0, value;
> > +	unsigned long vl;
> > +	int first = 1;
> > +
> > +	asm volatile (
> > +		".option push\n\t"
> > +		".option arch, +v\n\t"
> > +		"vsetvli	%[vl], x0, e8, m1, ta, ma\n\t"
> > +		".option pop\n\t"
> > +		: [vl] "=r" (vl)
> > +	);
> > +
> > +#define CHECK_VECTOR_REGISTER(register) ({					\
> > +	for (int i = 0; i < vl; i++) {						\
> > +		asm volatile (							\
> > +			".option push\n\t"					\
> > +			".option arch, +v\n\t"					\
> > +			"vmv.x.s %0, " __stringify(register) "\n\t"		\
> > +			"vsrl.vi " __stringify(register) ", " __stringify(register) ", 8\n\t" \
> > +			".option pop\n\t"					\
> > +			: "=r" (value));					\
> > +		if (first) {							\
> > +			first = 0;						\
> > +		} else if (value != prev_value || !(value == 0x00 || value == 0xff)) { \
> > +			printf("Register " __stringify(register) " values not clean! value: %u\n", value);	\
> > +			exit(-1);						\
> 
> I think we should ensure all tests in tools/testing/selftests/riscv/ use
> TAP output, exiting with ksft_finished(), or at least exit with 0 for
> success. For example, vstate_exec_nolibc exits with 2 for success since
> it exits with the return value of prctl(PR_RISCV_V_GET_CONTROL). And
> vstate_prctl.c exits with several different negative values, which means
> it'll exit with several different values around 255. To figure what went
> wrong, one will have to convert those exit codes to the original negative
> values in order to look them up. Having these types of inconsistent exit
> values complicates QA.
> 
> Thanks,
> drew

I do not follow. I am using the kselftest_harness
(tools/testing/selftests/kselftest_harness.h) that does output using the
TAP format. vstate_exec_nolibc is not a test in itself but is a helper.
The Makefile for the vector tests describes this as:

TEST_GEN_PROGS := v_initval vstate_prctl

If you run the riscv collection of tests with:

$ ./run_kselftest.sh --collection riscv

You will see that the only vector test cases are v_initval and
vstate_prctl, which both output as expected in TAP format.

I do see that I messed up the return type of the is_vector_supported()
function, I had meant to change that to a bool from an int since
RISCV_HWPROBE_EXT_ZVE32X is greater than 32 bits. I will send a new
version.

- Charlie

