Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BC73FC2
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 00:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763424397; cv=none; b=BYR6do4xMf87LLDh9gC+5Pu8midxY5giv4kL+egFPSQ7w1iZcWmFj6U/GncnV2T526GFyqHgez7Kx0J+9sxtt4ylcAOb9h/7va2V2wGZ5GGMZxec38zNL0Hx4isCDKhSJw3xJtIQCxyjHQiVHsB7aUCLZKo/m0Y1sGpKwIh8baE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763424397; c=relaxed/simple;
	bh=rk9BkAFB9pdLx2olw5XHN6msU0jlCk1qBAL54eaWXh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jMpxH/gCSv1x8UgNb9vN8ntxpzsMr2L44G2HPM2AnEe7rnjZjGrF12Xt9jIeoIE/21sdH2v3DY1RpMlCLyZR11WVlYGSy5/xGGmO8bXqabekSCIgm17+F2/LZ4/LY1dYQrtgS14S66h/wdIVbsxUIoo2wkFi2SFCHrFExBzaRLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3qgVtAJ3; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3qgVtAJ3"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7ba55660769so3164006b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 16:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763424394; x=1764029194; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1v4fRZdVLhKe/ktZvpTDlH6fFhc+2rF0aLfRAFXmPdc=;
        b=3qgVtAJ3lvQRcYfWoRq16P3YXc5lv2KdpdEBCVnTc76+vq3jnAQ5/Xb869vp0ltXgn
         ZhfxgUDMpZfOOJJoMyMsXVUsV+u3ohEWeR6b0S3+GSqlsNi/SZmk+POZ48b7jlDdCTI+
         N+wB3ezS9PmMBZVSOSkh3Xf8kSIagm1Z3t3mxk2BtHy1zOuVp3kg+/nRO3JwnGsYiM1w
         HaSRhz4bEo7mtvYnagaLWI5gCu/3bftl//4Ev9kzy4L6aoE3fJp1WK/1v62Jo81osa1P
         7u5CumnDkhogztvL0KQyLnuiJUZ1xUqabpET3vqkOZaGSUBRqaTDvzXsEdnP0TtTl75d
         qcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763424394; x=1764029194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1v4fRZdVLhKe/ktZvpTDlH6fFhc+2rF0aLfRAFXmPdc=;
        b=i//il8uSMuCaCjdJ9spUowCSrXivrY8gD0wjax/uZSvFxUesdJE/yjj6jEvEzYaG+T
         tBv6SjL4trhvTkia7rQm9Ycyx1tiDtvMLjh8IfCPObBoBMmFe+5h7PMuEy0l4KjscUxT
         yHkHYlyRCcC0GVWZLciBU1OGlSAnPyNKL+rE+Epuq6Ya1oS6vk3JWqq1NOly3vpnzj4c
         5uNOb6cZFE3RSAfGwhUw8Z+gfWzKilJKuUzTTclZDSetqD1ZWo5pGcHTHGHjvZ5TFM79
         Cng7fKV4ojZYEE2CGIPfyt+xtVOHjI4iyVQlCci33GsEnCci3sdg7IL7nDnU2eior4cY
         qr+A==
X-Forwarded-Encrypted: i=1; AJvYcCU755tcvTeDGLitZv3AWGSrHo1ljaxbmt/jPX2t2PoeFFMYJidcBLWieF6wLD0ktuI8+/qttEylGvg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0bydxVeEU3fjXXnmj408fXZ87oVknr1w7+6OASKMIjhfZpmrp
	uISvU/v660t8x2DxJoeaMsKwUkLUCoPRdE+vIbNkfCeRsLMIlPRLDkhCb2PQPcOsVA==
X-Gm-Gg: ASbGnctNkZwxGdVj2GOaR58T4ohD6X9iUee9cjguWbWrWwahXo/KGiBDAtwmFqslFV1
	MQrci6WNzsdS51nosdXJ5wJgoKo6abCkeoc9iUIl6mr6Hro062953OxklrS4Z3Q0q0YrTdRgeVJ
	vaJsGDWpmifBBmCAL9fjPknSsi9Nl4fZ1CUpfn6x4ydsr2GTre+IMdl9Dufr4bOCZYQaWkNC/80
	xC+4nVSYmL2M+yhibSXXzNGifMEPD7m6tUni4qDdCw0XsWFLqbpjnjReJqfQfs2hQcj6RUyNBrK
	PCZd3whB4QkyFcYmVZM2M+uh1Glb5E3ip86XqkisIdno0RHdHvr3vZDZR/LqUSwxPh+YSUVOv5A
	BDUt0Z1pKwmaP0Q7KfZXaFpywsUELhM04iJoZRAzPj/WQzxP2hLz/8ojQ6kmtH5JKn8eFNGpgR+
	zSdV2Z1w7IrAJUg5xu2c8ynIQQsZj/9WCSmiIEav2PHukBFedP45TXVCJJz6DgOTU=
X-Google-Smtp-Source: AGHT+IHkJBvRbGUG30Kr3T5gR1UjB+qV085NIT1CUVV/7jNIJcaOzKed5XoscCfn8280NZXc0GRAQQ==
X-Received: by 2002:a05:6a00:2d1e:b0:7b8:c7f7:645e with SMTP id d2e1a72fcca58-7ba3c07eeebmr19714686b3a.17.1763424393959;
        Mon, 17 Nov 2025 16:06:33 -0800 (PST)
Received: from google.com (132.200.185.35.bc.googleusercontent.com. [35.185.200.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924be37fbsm14602912b3a.1.2025.11.17.16.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 16:06:33 -0800 (PST)
Date: Tue, 18 Nov 2025 00:06:28 +0000
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
Message-ID: <aRu4hBPz2g-cealt@google.com>
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

> +/* Stage 1: Executed before the kexec reboot. */
> +static void run_stage_1(int luo_fd)
> +{
> +	int session_fd;
> +
> +	ksft_print_msg("[STAGE 1] Starting pre-kexec setup...\n");
> +
> +	ksft_print_msg("[STAGE 1] Creating state file for next stage (2)...\n");
> +	create_state_file(luo_fd, STATE_SESSION_NAME, STATE_MEMFD_TOKEN, 2);
> +
> +	ksft_print_msg("[STAGE 1] Creating session '%s' and preserving memfd...\n",
> +		       TEST_SESSION_NAME);
> +	session_fd = luo_create_session(luo_fd, TEST_SESSION_NAME);
> +	if (session_fd < 0)
> +		fail_exit("luo_create_session for '%s'", TEST_SESSION_NAME);
> +
> +	if (create_and_preserve_memfd(session_fd, TEST_MEMFD_TOKEN,
> +				      TEST_MEMFD_DATA) < 0) {
> +		fail_exit("create_and_preserve_memfd for token %#x",
> +			  TEST_MEMFD_TOKEN);
> +	}
> +
> +	ksft_print_msg("[STAGE 1] Executing kexec...\n");
> +	if (system(KEXEC_SCRIPT) != 0)
> +		fail_exit("kexec script failed");
> +	exit(EXIT_FAILURE);

Can we separate the kexec from the test and allow the user/automation to
trigger it however is appropriate for their system? The current
do_kexec.sh script does not do any sort of graceful shutdown, and I bet
everyone will have different ways of initiating kexec on their systems.

For example, something like this (but sleeping in the child instead of
busy waiting):

diff --git a/tools/testing/selftests/liveupdate/luo_kexec_simple.c b/tools/testing/selftests/liveupdate/luo_kexec_simple.c
index 67ab6ebf9eec..513693bfb77b 100644
--- a/tools/testing/selftests/liveupdate/luo_kexec_simple.c
+++ b/tools/testing/selftests/liveupdate/luo_kexec_simple.c
@@ -24,6 +24,7 @@
 static void run_stage_1(int luo_fd)
 {
 	int session_fd;
+	int ret;
 
 	ksft_print_msg("[STAGE 1] Starting pre-kexec setup...\n");
 
@@ -42,10 +43,17 @@ static void run_stage_1(int luo_fd)
 			  TEST_MEMFD_TOKEN);
 	}
 
-	ksft_print_msg("[STAGE 1] Executing kexec...\n");
-	if (system(KEXEC_SCRIPT) != 0)
-		fail_exit("kexec script failed");
-	exit(EXIT_FAILURE);
+	ksft_print_msg("[STAGE 1] Forking child process to hold session open\n");
+	ret = fork();
+	if (ret < 0)
+		fail_exit("fork() failed");
+	if (!ret)
+		for (;;) {}
+
+	ksft_print_msg("[STAGE 1] Child Process: %d\n", ret);
+	ksft_print_msg("[STAGE 1] Complete!\n");
+	ksft_print_msg("[STAGE 1] Execute kexec to continue\n");
+	exit(0);
 }
 
 /* Stage 2: Executed after the kexec reboot. */

> +int main(int argc, char *argv[])
> +{
> +	int luo_fd;
> +	int state_session_fd;
> +
> +	luo_fd = luo_open_device();
> +	if (luo_fd < 0)
> +		ksft_exit_skip("Failed to open %s. Is the luo module loaded?\n",
> +			       LUO_DEVICE);
> +
> +	/*
> +	 * Determine the stage by attempting to retrieve the state session.
> +	 * If it doesn't exist (ENOENT), we are in Stage 1 (pre-kexec).
> +	 */
> +	state_session_fd = luo_retrieve_session(luo_fd, STATE_SESSION_NAME);

I don't think the test should try to infer the stage from the state of
the system. If a user runs this test, then does the kexec, then runs
this test again and the session can't be retrieved, that should be a
test failure (not just run stage 1 again).

I think it'd be better to require the user to pass in what stage of the
test should be run when invoking the test. e.g.

 $ ./luo_kexec_simple stage_2
