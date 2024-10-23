Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0641CEEB1
	for <linux-doc@vger.kernel.org>; Wed, 23 Oct 2024 17:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729704401; cv=none; b=bKGouu4y2m91yXzXbOfs6s00rso/kQPssqT4tW3MtRiEzo2HK+mIuV7XojH2AWBTPCFQ5f3Uuq4uSYsZBGSTLB+VqlFSWXhtDgtWTSpeWt0erKak7MlZ0QR+zmq7S3x2s5GXYgOmlRrDjXiRdiXa/IpTVFAD4S8xyQeedVGwdDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729704401; c=relaxed/simple;
	bh=AWFBW7FfgrM+D0zC+8M4nTbfzWykLXKE0+MpT5ILXww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uoPJI+W54UaatpLQtP+o+ACkWvbPNwBK+4h9EFbte+IIqQI/543xNMG90RWg5C+C5G+VQxlHolC8/1ZWMFxXY8Z6PmFYkiw0ddUKTeUU4xeGws4LwyHwvJwQ6aDCPC5miZm8jBh74tGPs/yz0msJKHFeXhy6i3aVT8Fq1VRK6XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=EnZu6QES; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="EnZu6QES"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3e6005781c0so72325b6e.3
        for <linux-doc@vger.kernel.org>; Wed, 23 Oct 2024 10:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1729704398; x=1730309198; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWFBW7FfgrM+D0zC+8M4nTbfzWykLXKE0+MpT5ILXww=;
        b=EnZu6QESoIdhW8vlu4RqzQbCSGfT6mqSvKiUVX/7AbTn/7Qn7jmPyu2tR65YwQiZ0n
         vpxclIUM5l6EpwBi8OM6lAaJ59EzLVTJmhwUhdNTUtXovMg/6k9uK1ODp68YEdnMLH94
         e1J1Nw98Svz6TUev/GE0LX/rUcLlErJ0kZ5FU6xvsARVRb8z0zDhEDD8+HFw73lXdaQ7
         BzlMdN6VCfaOrxWGUWdu58cHikN3Rd9EpfzZ6jIo1cPV3mN6e26bEymqFleDDdAQTCRX
         ggUOaNqw3z7XO0eC8hzToHqUTdqAsCXhkSlKZ94E7guFlVlrMASXmklyjUcl7SYUDDie
         0h+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729704398; x=1730309198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWFBW7FfgrM+D0zC+8M4nTbfzWykLXKE0+MpT5ILXww=;
        b=SYtymUQkGXh9rdnWC7kB2aVfunkJWwBxHBDRF+7xaI03JOs7l5+jEY8bivaTyWyFq9
         Js1dcz/R4zl4lFH/QOFcSJaf5CHAyIGS05KkS5D09EnAneE/j7lJFHNRNzQ5wJNpb8Rp
         mWahgJ9Mi/sVNpqvfG3uTWRJ6DUocLhof/bo6P+ZBczTlOWts2CKY+HUypDq5yGR4z3J
         9w9d8HlaP4p7ML7uYYPzpzrlZX5AOls9tyHKmwinurMMh6Y5xV099xNIy6GBzmDPOxxv
         pht4x5dUNjF8MHxg4fyDUC11d0eideGReuDmMNms/rMStNfyljT4rx8lt0KigTrxw+hX
         SjGg==
X-Forwarded-Encrypted: i=1; AJvYcCWUyObTwG0oolT3uEcGjun3JBWw2n2N+sj3XduZvguHIWCmj90NzJLbvsNfuLdpbeEdD7qyHGXpI7w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0g8QIE7n6FxR2XKN8ptxNbRuPpZZ4Gy+MbAOXK4x3gpUNai6A
	y1vmujL0+Fh0srYflIVnO1dCyjTA7PhdnwUA6BCA8D4wOFSqeH2yOPwURyDF/irVOzNra5dzxON
	XDpuCaCsCGUvEc5HHZy2+Fnhl9HC1WK7UrYcxVg==
X-Google-Smtp-Source: AGHT+IGckBdU29o3tk+wYPFoKwsMk5i6ERT8sORHYNIiU6+p/6iCZVXQYympbyvyWVcQV7nCYD9zoCsM5F2gZ83otEQ=
X-Received: by 2002:a05:6808:3991:b0:3e6:23fb:b391 with SMTP id
 5614622812f47-3e6244eb667mr3799063b6e.2.1729704398543; Wed, 23 Oct 2024
 10:26:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023170759.999909-1-surenb@google.com> <20241023170759.999909-3-surenb@google.com>
In-Reply-To: <20241023170759.999909-3-surenb@google.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 23 Oct 2024 13:26:01 -0400
Message-ID: <CA+CK2bAZ4K+1ZZyFwwZ43Q9SMPzSr=9r=OvqjNK16Ai3E92jtg@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] alloc_tag: introduce shutdown_mem_profiling helper function
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, corbet@lwn.net, 
	arnd@arndb.de, mcgrof@kernel.org, rppt@kernel.org, paulmck@kernel.org, 
	thuth@redhat.com, tglx@linutronix.de, bp@alien8.de, 
	xiongwei.song@windriver.com, ardb@kernel.org, david@redhat.com, 
	vbabka@suse.cz, mhocko@suse.com, hannes@cmpxchg.org, roman.gushchin@linux.dev, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	souravpanda@google.com, keescook@chromium.org, dennis@kernel.org, 
	jhubbard@nvidia.com, urezki@gmail.com, hch@infradead.org, petr.pavlu@suse.com, 
	samitolvanen@google.com, da.gomez@samsung.com, yuzhao@google.com, 
	vvvvvv@google.com, rostedt@goodmis.org, iamjoonsoo.kim@lge.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	maple-tree@lists.infradead.org, linux-modules@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 1:08=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> Implement a helper function to disable memory allocation profiling and
> use it when creation of /proc/allocinfo fails.
> Ensure /proc/allocinfo does not get created when memory allocation
> profiling is disabled.
>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
