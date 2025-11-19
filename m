Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5537F2E7F1E
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 21:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763587241; cv=none; b=h1qmLs+uMIwp/lRwuPhJOFEZKlJbZbM3rqkXPMqKVtDtqq8XhJ65l3LyFWfDuMxs8NLHixU82GjcffC3h+RxYlzCMmFHt6WrOExftdDdK+kwan44/PIGqKQZeTW2lIxHDQTWAXSnyYBDqmNurw0flvGh5tpznOzsCC1+y4M5nog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763587241; c=relaxed/simple;
	bh=5FMCYKy+e8kyhNpTIUKcyng1fuKvk1WBXqnTBDSSpjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WslkfCN2eimintSKcwhVaKz/duIWCOvxNkDpDTW1RG/tymW/SvbyTTgdlVdyghoSOu9+2ZdxbQR069iRhn0CqfVkC860LSJKw/2W/bEI8RFZF9rg3qF2tDcd7kuD7RC7wDWkNX59szQ68MN+BTmHy1i90m0o2xEjg7nc5bXhjuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CCrztLZi; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CCrztLZi"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-297d4a56f97so2986575ad.1
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 13:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763587239; x=1764192039; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=flj38gz4L08lc87dayRdAelLk1tJ7Y8JM+kGwy03iE4=;
        b=CCrztLZiIq+KtKjZ2GpSS0mrBf9kSXYu3VjmH8UoOnDjbwblXDLqyf0qkdbQuv1LrO
         xTyJQdlgcNVHSsLQtXoFs+cBI8n/thMqYCsIy7yQsPOPJHOBYJtcMwFHqB4WQYV8u7XO
         D16L7taQvez11c7IFn072fR4tcK9lKyOc5a/22SSwK/tP7Ds0CTRiJruIomf8fB9bn9Q
         2pS+6Akbqo3V/k3YndMwvmH4pc6LZ2nN4J1HkJ7OG7YRvezDG862nkuloyC8VjR8PAwi
         Up5fqzdF5OVydy5poBnXICoUb/Or+klkr2khwOC1kr59+c+zp9neJ/Og3NDC8LkawrXz
         unbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763587240; x=1764192040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flj38gz4L08lc87dayRdAelLk1tJ7Y8JM+kGwy03iE4=;
        b=S7cu6HXzI8YijvTY4YOzclmbWkdYmbI/HN4mczlYmnVvPhekVA3pzHOvfVBKZxorIt
         0lq3FUz0osPf1IH8FNLaVzS/oRh4pUQUeVsUm95/utGeUE2QQ76DuNTSR3ABni4YMjes
         eYitofQ1/fOihesWhsL18SzZUdBnaqe7AVnbuhfcCUNHyqcEd1SQPe7OM+RE03BFv4MI
         /7xChvVofWNJpHST1MaCGhfXK43itM1Y+yp+4Lw6C4Vp67NRPIN6Lr5x1ayRdfUV4V9o
         GMwxsBkzmFvZmCTgv7n6fSKLSxjGxEtYBW2ehiXhC97/b5Kch+A5w3PnT77SgQm33bOT
         O85w==
X-Forwarded-Encrypted: i=1; AJvYcCUj5+c2JoErPphUBpBhTwZ0eorrFITzqqILdp1BjloiI8NgZhKsDX1aOu7Gl9HaYqn9ZHRQcNcEscE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWf65iQMaPvn3uD781nkA1krLoGrD9f6SSXnN5nAbjO3864nle
	oati8u31ICpmHQ/lM11sVE7tbXQ5E/Grm0dmi2g9oXwbPxzF6SfgeNNgbW05vFDAXQ==
X-Gm-Gg: ASbGncuqUYiDOprpC4zhWpLc7BU2LCAqGd5O4avEXLq8RL5TYiTA9kIqE1U9+iWdhz2
	l8Wbk9wmhwFKXfFznStAnET4RbGvU5WZMuDZSZm5j50/mwPbdZcelM5zJJ3BJp6AWpOu1C8tfLn
	NgZg43OYCaoEwySpJLDIybzTEKwVZ+hlrjYxmBWhb+BQnSMLrl72voJGmNbSsu7zKizYh3xB4TB
	MpQOFlu2XtMo5/BYrTk4BMYwjrQ7J6m1zX2MVhvdZNzm8Pe1eXRKc+na5YpIcykEzQLXWviXHoT
	gUcfdKLf5aovxmFrX1RKO9FX6Oo3E09nBCu1mffhQQBnH+yrb+le+ie2B4DVU0SKVMEOxpf3nAA
	zhrunSRAzBsB2+uQ9hnszg5nGaGmBqPkKbMGAG2iTeQvUwJ2gaYT3qK6a4U4eFwTtHlqr+kNVyo
	2wDIsedFMmgfPWKtIRFZ4n1xyP/WpCXfduIrZK2FViEh1zYyLnwn3HYikl5TpuYkSHc6QohviIQ
	w==
X-Google-Smtp-Source: AGHT+IFrxTck/ibRPggmaOfoFEHngZ9j3Wi19/Cn4ktJjoxdrVE4GnzBiziuQnyIS9dFi1fhtFrseg==
X-Received: by 2002:a17:903:11c5:b0:294:fc77:f021 with SMTP id d9443c01a7336-29b5b13a8bbmr9665255ad.49.1763587239033;
        Wed, 19 Nov 2025 13:20:39 -0800 (PST)
Received: from google.com (132.200.185.35.bc.googleusercontent.com. [35.185.200.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13e7e6sm3965405ad.40.2025.11.19.13.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 13:20:37 -0800 (PST)
Date: Wed, 19 Nov 2025 21:20:33 +0000
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
Subject: Re: [PATCH v6 18/20] selftests/liveupdate: Add kexec-based selftest
 for session lifecycle
Message-ID: <aR40oVOxZ-dezpy0@google.com>
References: <20251115233409.768044-1-pasha.tatashin@soleen.com>
 <20251115233409.768044-19-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251115233409.768044-19-pasha.tatashin@soleen.com>

On 2025-11-15 06:34 PM, Pasha Tatashin wrote:

> diff --git a/tools/testing/selftests/liveupdate/do_kexec.sh b/tools/testing/selftests/liveupdate/do_kexec.sh
> new file mode 100755
> index 000000000000..3c7c6cafbef8
> --- /dev/null
> +++ b/tools/testing/selftests/liveupdate/do_kexec.sh
> @@ -0,0 +1,16 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +set -e
> +
> +# Use $KERNEL and $INITRAMFS to pass custom Kernel and optional initramfs

It'd be nice to use proper command line options for KERNEL and INITRAMFS
instead of relying on environment variables.

e.g.

  ./do_kexec.sh -k <kernel> -i <initramfs>

> +
> +KERNEL="${KERNEL:-/boot/bzImage}"
> +set -- -l -s --reuse-cmdline "$KERNEL"

I've observed --reuse-cmdline causing overload of the kernel command
line when doing repeated kexecs, since it includes the built-in command
line (CONFIG_CMDLINE) which then also gets added by the next kernel
during boot.

Should we have something like this instead?

diff --git a/tools/testing/selftests/liveupdate/do_kexec.sh b/tools/testing/selftests/liveupdate/do_kexec.sh
index 3c7c6cafbef8..2590a870993d 100755
--- a/tools/testing/selftests/liveupdate/do_kexec.sh
+++ b/tools/testing/selftests/liveupdate/do_kexec.sh
@@ -4,8 +4,16 @@ set -e

 # Use $KERNEL and $INITRAMFS to pass custom Kernel and optional initramfs

+# Determine the boot command line we need to pass to the kexec kernel.  Note
+# that the kernel will append to it its builtin command line, so make sure we
+# subtract the builtin command to avoid accumulating kernel parameters and
+# eventually overflowing the command line.
+full_cmdline=$(cat /proc/cmdline)
+builtin_cmdline=$(zcat /proc/config.gz|grep CONFIG_CMDLINE=|cut -f2 -d\")
+cmdline=${full_cmdline/$builtin_cmdline /}
+
 KERNEL="${KERNEL:-/boot/bzImage}"
-set -- -l -s --reuse-cmdline "$KERNEL"
+set -- -l -s --command-line="${cmdline}" "$KERNEL"

 INITRAMFS="${INITRAMFS:-/boot/initramfs}"
 if [ -f "$INITRAMFS" ]; then

> +
> +INITRAMFS="${INITRAMFS:-/boot/initramfs}"
> +if [ -f "$INITRAMFS" ]; then
> +    set -- "$@" --initrd="$INITRAMFS"
> +fi
> +
> +kexec "$@"
> +kexec -e

Consider separating the kexec load into its own script, in case systems have
their own ways of shutting down for kexec.

e.g. a kexec_load.sh script that does everything that do_kexec.sh does execpt
the `kexec -e`. Then do_kexec.sh just calls kexec_load.sh and kexec -e.
