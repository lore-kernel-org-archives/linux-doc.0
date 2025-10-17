Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB7E332EA4
	for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 11:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760701111; cv=none; b=FXNiYZYJdzHQZ3WEYlknkt4YAIkGjyB9fUh5sxS/4ElDOdnhFfG0KOsfSMtiJMG4JYNLK7xct4ZrLIsGW3aP9D1BenMnv2iNtqACxDoBP6IO3+vtcQVKsdS5v0s+zzgwYEGtur4qlXBOfDQrj7zs4OdMMC5FHZ9dnegJNkhXnc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760701111; c=relaxed/simple;
	bh=9msVu+SUBbsb9PBWG/xro47qnP6i3+BAjZkvCCDx/DM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VXX+wf0CBIA/QlQ7Ew8APJbx/XHqmJNktLnDD7+t30J4VeScxB9fkxjDJGa0Xt0qZyhFJdmH157t72I16vYQB5KwokhOfh5XbXPxSADt/VrBbaKtXTLQ5nhMfFNJPwYUzYtW4I7KXzA8SNXKjNwHfoyqOVss2eNpJZrNjdPl0GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RJh6R/sE; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RJh6R/sE"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-426edfffc66so1237095f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 04:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760701107; x=1761305907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oSsGSmsIxqB5hm0PfffZYkH5rW/rAwPHgsZUjkbnJ5U=;
        b=RJh6R/sE10jnJYI2cU1wwkRhFzykzZGWp9LPdHSEeeO96YDrImRezsdFp0mpwRSrhT
         YTWf4kEhpI9aZMm3tM6qEuT62PTCfww9U0oLE1bpm7mX4tXFV2O/letJd1H1wfraACHu
         VlOgURQfsjHEwZW/xvOdo/IPjgaW7+OA9X1ZnrXmoHWtO+eUYnZi1w2Vr3jbmsVKvn7B
         INMZr+jl7DRRvYfzY9qtQJVcIBWBu2yb3YEbw+3elRRC9gxNo88HuefbEYi8mZBaCA6U
         FzcWW6VQEGWW3s8q3Mmo866xxrUtL/shOgc/P7H7y8GH/9Dj6g6gT02h4F0qxPITEnkc
         1gGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760701107; x=1761305907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oSsGSmsIxqB5hm0PfffZYkH5rW/rAwPHgsZUjkbnJ5U=;
        b=QQosnzQzPmg29ZZN0KTjzM1gguZQ+jeUnRHhEeM6E1HS0NL5GQCBgdNCLKn2dDnIxB
         4vgeh/d/wc2p8bIk4zmBXjKn82Dea0bH8OpFdJWAg8P2ZdeE0EHPv/boVA9QD1dla3c9
         r+ZOatwRL+Qz+p7087RrjdHmqsrTn6bldnF3dW5WrhkwM5D2tBKUxaNb3tNvHKJoqB06
         JDRDnVrswMHz7fny9bPocoMhyqiVY+QFxC+Gy1FiOZVm2Q/TPYmd/bM3mK9jfXloXrqM
         8wsOIy1P84ZgTY1b2imp5wC6ZbNuUg9lVP+om2xd8Mp05rC7739c8aU+MVZsUVPZlfzW
         EQpA==
X-Forwarded-Encrypted: i=1; AJvYcCWO+XGxCfMqKV9cmuRdtBYnUU83hV4/s4Mky+bBpNGhF+OA2GmZ2ECPwgD7QaxJjiWC6Td2uL4O/Xg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSi2iHTCfIQ5eVUJQfIBuzn9h9uep7NnbRRBO+BdX/s+BwsIhj
	iENzCic3+tpe2wiL+5AE8tS7u4Mos2yrEP3CYejK81h8+wrSODKogPB2pOqLMoK6GUI=
X-Gm-Gg: ASbGnct8sc3Rx36NTXYzQB3qGTqzOXcLD7pK/GzXRuH68O/gsSXeT9Ndy9sL5pMr87U
	7q9xiU//bKH5KM7WdHaIRtfE+RMf+8k69o0H91F9MB1su6A4EWF3mYz80l12/GgcM0uFz7zj8hw
	QEncMCTaedoyflma654yAivmueJfFt294B3/fM6irC7lfj3G6LAL05UjOYzj6vvi+d8PMKw+wG8
	ywwm0A7EdD4uTZYoZIQvFZaOzwkfFjSvjVm/knXcFmpBxfhjtIhRBtVDTJuLVf3sirqNCw9Ucf5
	e5OJpnRCRfCusJ8kCRaHwPR4ZBylrM0do2k4Xv+Kc0Zq1hTLQskIbuANuvoFg0/soqGg2Gfdvjb
	TpSVuNxxraghDEZGpL2KUQdztUNvKlyu1EOURy9Srfsr7KnuD/2/zQqZLvyXvMJLWwk2TYEmREO
	4m2bkRzDOrvCjvUX9LtphF
X-Google-Smtp-Source: AGHT+IEvltr4XQUBvXbO5/DAcfM0KgT+zHuTMTdsx4BX5yj88NzF+xLsMdBh0+sxiVD7nd1L1YhGYw==
X-Received: by 2002:a05:6000:2287:b0:425:7e33:b4a9 with SMTP id ffacd0b85a97d-42704a62705mr2909583f8f.0.1760701107569;
        Fri, 17 Oct 2025 04:38:27 -0700 (PDT)
Received: from [10.100.51.209] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426f2f72e18sm19030555f8f.0.2025.10.17.04.38.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 04:38:27 -0700 (PDT)
Message-ID: <c58152f1-0fbe-4f50-bb61-e2f4c0584025@suse.com>
Date: Fri, 17 Oct 2025 13:38:26 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: ABI: sysfs-module: list all taint flags
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org
References: <20251015221348.1125295-1-rdunlap@infradead.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20251015221348.1125295-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/25 12:13 AM, Randy Dunlap wrote:
> The list of module taint flags has not been updated lately as the
> taint flags list grows. Instead of trying to keep multiple lists
> updated, just refer to the list of kernel taint flags since they are
> the same.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Luis Chamberlain <mcgrof@kernel.org>
> Cc: Petr Pavlu <petr.pavlu@suse.com>
> Cc: Daniel Gomez <da.gomez@kernel.org>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: linux-modules@vger.kernel.org
> ---
>  Documentation/ABI/testing/sysfs-module        |   10 ++--------
>  Documentation/admin-guide/tainted-kernels.rst |    2 ++
>  2 files changed, 4 insertions(+), 8 deletions(-)
> 
> --- linux-next-20251014.orig/Documentation/ABI/testing/sysfs-module
> +++ linux-next-20251014/Documentation/ABI/testing/sysfs-module
> @@ -52,14 +52,8 @@ What:		/sys/module/*/taint
>  Date:		Jan 2012
>  KernelVersion:	3.3
>  Contact:	Kay Sievers <kay.sievers@vrfy.org>
> -Description:	Module taint flags:
> -			==  =====================
> -			P   proprietary module
> -			O   out-of-tree module
> -			F   force-loaded module
> -			C   staging driver module
> -			E   unsigned module
> -			==  =====================
> +Description:	Module taint flags: same as the kernel taint flags.
> +		See: :ref:`taint_flags` in Documentation/admin-guide/tainted-kernels.rst

The module taint flags that can appear in /sys/module/*/taint are
a subset of the kernel taint flags. By looking at the calls to
add_taint_module(), they are as follows:

Present:
TAINT_PROPRIETARY_MODULE
TAINT_OOT_MODULE
TAINT_FORCED_MODULE
TAINT_CRAP
TAINT_UNSIGNED_MODULE

Missing:
TAINT_LIVEPATCH
TAINT_TEST

+ potentially TEST_AUX.

Since this text specifically documents what can appear in
/sys/module/*/taint, I think we should still maintain a list of these
flags for accuracy.

Additionally, Documentation/admin-guide/tainted-kernels.rst provides
taint descriptions for the kernel as a whole, which can be misleading
for individual modules. For instance, for TAINT_LIVEPATCH, the document
says "kernel has been live patched", but in the context of
/sys/module/*/taint, it means "this is a livepatch module".

-- 
Thanks,
Petr
