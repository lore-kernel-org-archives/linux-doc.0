Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88CD32E6AA
	for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 18:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764095491; cv=none; b=ah3oAwrV/K0mpPpcKuX9O3eNkqpVkq2GBr7Vq+IUxHpgfvu1Yqdp3wu0NvceuVQV5EUMzxlKeH1lkBHCvBaaCx/EX9NSlKkyHOpl6qsOCk41StnXN4NRgWL9bkqBiYQ+kAC3A5XispYwGXrotw9imSlaM+A/FPVlUhJsAg3NcOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764095491; c=relaxed/simple;
	bh=5tz2aAHBD7vTNYLjZkzJH3s9gWYpFddvilCC/4yN7Zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AWwnDd5ps+CzQpMchXERwHSA5IcW38qNX7mb/49a2Mv794dgDnaJGsxJ1WMZqz1FZLTP6xgld5aUqI8znJ5gGW3ci2o+XUk+7Zm3I3CGfEhz0Sh57dwIbXiaKW0zaVhY6w0V4/RBxa18OVZ9n3VV7hT0w8fDBrVQr9/HpZYC2sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aYGZ5fqB; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aYGZ5fqB"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-29555b384acso73208265ad.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 10:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764095483; x=1764700283; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7O4GSlYSAloya2gWAKt06Wd2oP8bRALkgcDobg98SWs=;
        b=aYGZ5fqB44pcrFVN8TRn947PWEw4614zXbXiJ67T3hNxZYwAWtkslkYq+4QZAL9ZHU
         Xz2/Kb/GUjT/9T92647u39aYnmz30z3PMv4eSjIcimJbMlc5YfdGxkD9iQJUmzpo7YAk
         PoEtFVfyeHuMFC1znRZrd6Y82Mg5WtEVct9WxztFv3T86rPp/MPuVMvq2MsZp47Io6RH
         Uxa8LWtwTSUi4Mac1UDbAbpjUbyIKHp0OPMKw//ygq16YYazGu7ZsaehloVTbOXe6NYY
         39SbxX6P7TAsIyRlooEfamSOE/nL6mzozue0sa7zLXvBkZyNP6io1RQQPRFp8nC6J7Fh
         /l/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764095483; x=1764700283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7O4GSlYSAloya2gWAKt06Wd2oP8bRALkgcDobg98SWs=;
        b=qa9CfTBaGRaWS78W8X2EIk+k5A2HKMC0/nflaZSgy+5WX8n49v5EJ1WHPxz4ERyY0O
         I9rzibqgHof6KeLpxK9Qi47zvwNP/fNGZ0qbAPLh14gQBSYTlMxkDF162vHSabhJJHnB
         J0KYFMX5DmrA8uA5oMQEA3CrQF8VbwJikSl/cYDS11zc5AY1xtp3XToEYxKhrGgtddFp
         mucHnX1Bv7vPWhApk6g7wA2dYhOEmcWRD38ZtF1AQq+PWWqW0uhiJyxcp7BXWXKZ5iWv
         0meUFh0J15UbsDt7VzRFdIwHZLfBXUOwHgJEpw0FdVDnGdazBmvsVyJ2qZr8yx8SPPca
         lUiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsDxrr1pe5m5ShqdbxhSoF/dVLBIcxDIcsa9rHcRKiHxY8wY4ar+fCeRS8QZYXCKSNFXT6hDiWwIs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjAfMuDhcNDcG+UCP6EF9PKCk4/yhU7FhvVo1Z9OXtLfA6BqBm
	R+/Hlys4h20KUWLsEDIddGd2s1JimYdPqHb59hAfHHgAu4dhd+1Z4khzPI3JkKcmPg==
X-Gm-Gg: ASbGnctGSziaVcu3+RZmDhyMrJ5HQ2MZ3IIA+KQ0IZzRyBo6fh9XvkvUHhh+MzDIWcv
	7kn3LS+oIb93dEwhC1FwoRbXu97Eh0zdrWi7FL+H6U4iUCM6bcuf8SmF5dw9f7mhT5gOAwl0yQJ
	1M7vw4Icuuol0Pe70tgmhrmPVCTEmG0wKihNOWCszd6ri3mdYSwl3Nunp2mC6Vhb7QoL+vZSeCg
	O4hPDGalOeFopv6Ll5B6JZUg3srzfng8zJiNPutOaKgp8cnZXhXSlw2BeU06jLsEA0qTlOWXEyt
	1vMGrlnoel0x+hBKRZlJmK5xbr3SFr1uJMpvFWZMmcn8rCgKEuHxCNl8PknSCQRhRf4/wvA9qdn
	+4F12HRKuQ/k03t0fADGf/IhtfFtkjLRmYeyezigEnwmzTbzOS6JfvWeEL1HkgIOLq1/PziC65g
	yvm4jXBz4JEJOefZui6XpK41GCX3B092ns5GOCQT0NxzdwgXQ=
X-Google-Smtp-Source: AGHT+IH53ckBol+4yeTGTxnoskxcelqMTn+43AKcIW+arxac7wzKqrO4rD1ChIviUV6IKHO85b4pJw==
X-Received: by 2002:a17:902:f691:b0:295:68dd:4ebf with SMTP id d9443c01a7336-29b6c3e3c48mr197452115ad.16.1764095482759;
        Tue, 25 Nov 2025 10:31:22 -0800 (PST)
Received: from google.com (28.29.230.35.bc.googleusercontent.com. [35.230.29.28])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b26fff4sm176035005ad.68.2025.11.25.10.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 10:31:21 -0800 (PST)
Date: Tue, 25 Nov 2025 18:31:17 +0000
From: David Matlack <dmatlack@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com,
	rppt@kernel.org, rientjes@google.com, corbet@lwn.net,
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com, ojeda@kernel.org, aliceryhl@google.com,
	masahiroy@kernel.org, akpm@linux-foundation.org, tj@kernel.org,
	yoann.congal@smile.fr, mmaurer@google.com, roman.gushchin@linux.dev,
	chenridong@huawei.com, axboe@kernel.dk, mark.rutland@arm.com,
	jannh@google.com, vincent.guittot@linaro.org, hannes@cmpxchg.org,
	dan.j.williams@intel.com, david@redhat.com,
	joel.granados@kernel.org, rostedt@goodmis.org,
	anna.schumaker@oracle.com, song@kernel.org, linux@weissschuh.net,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-mm@kvack.org, gregkh@linuxfoundation.org, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, rafael@kernel.org, dakr@kernel.org,
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com,
	myungjoo.ham@samsung.com, yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com, ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de,
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com,
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net,
	brauner@kernel.org, linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, saeedm@nvidia.com,
	ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com,
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com,
	skhawaja@google.com, chrisl@kernel.org
Subject: Re: [PATCH v8 00/18] Live Update Orchestrator
Message-ID: <aSX19cWypvh1mKWM@google.com>
References: <20251125165850.3389713-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125165850.3389713-1-pasha.tatashin@soleen.com>

On 2025-11-25 11:58 AM, Pasha Tatashin wrote:
> 
> Pasha Tatashin (12):
>   liveupdate: luo_core: Live Update Orchestrato,
>   liveupdate: luo_core: integrate with KHO
>   kexec: call liveupdate_reboot() before kexec
>   liveupdate: luo_session: add sessions support
>   liveupdate: luo_core: add user interface
>   liveupdate: luo_file: implement file systems callbacks
>   liveupdate: luo_session: Add ioctls for file preservation
>   docs: add luo documentation
>   MAINTAINERS: add liveupdate entry
>   selftests/liveupdate: Add userspace API selftests
>   selftests/liveupdate: Add simple kexec-based selftest for LUO
>   selftests/liveupdate: Add kexec test for multiple and empty sessions
> 
> Pratyush Yadav (6):
>   mm: shmem: use SHMEM_F_* flags instead of VM_* flags
>   mm: shmem: allow freezing inode mapping
>   mm: shmem: export some functions to internal.h
>   liveupdate: luo_file: add private argument to store runtime state
>   mm: memfd_luo: allow preserving memfd
>   docs: add documentation for memfd preservation via LUO

I ran all the new selftests, including those that require kexec on an
Intel EMR server, and all tests passed.

Tested-by: David Matlack <dmatlack@google.com>
