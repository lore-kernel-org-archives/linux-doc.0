Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541741;
	b=sxzUMPj7NxLhWKPiEnyfrTZmZcDI79t10UM/vFajfbgE50jdGJWr/PEDG+d3dS+2ou5g
	 xpJrAdvbeFGm6yxSP5gnCpA6iaolzyUyO/fp141XIzlwpjHNirdtLvuf9awTwCPAHSqBK
	 lwpZU0+21rAbBMMSyEf6o+DtiU0KWNR7wXhx5PupSqjSJpY5fVU4iTQMMFmOHPcsCUg5p
	 dMpBrlxeZV06vFqAFHeec60Ofl+NKdgbs6bGdXut2wDoRmrpdX0ThPaIVWviLUm1N9Y+v
	 /nyHIl5b8m87INnwiT+r1UxhiAE2+KaNdx3Pr6m3hyd3eoYobAVhH9w+SfZLJs6v9JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Cerw/Z7KIbXX4bOl2Vw1MF/BZKr852ZbBEpPnDE+6mw=;
	b=4cZKJAAaWXIumQhS9vuZvlNdXz4fEqAPD4B684mMlYeQc3j07stmVeBualH3HSXJbVym
	 CX3ka41Wm011vP0H1XmaY/2uCMpqbAy5TMVw6sxJImv3lvW3pcrrmYJobmQqQAkzI3kzZ
	 8HXytTLKM2aV/Mkk4oW+NvYFy0TdHNdyTsG3L2ESNifyFkdT2ZVtmlXvLapG66GeCJZEN
	 BR0hwacoclfhnaYEbaewRA/glBwbQFA8AxSq68W2h3EMtkbwSwNiKQr7bvDKXtWq2Ncb/
	 mwmRHJ761p065X/KfeMrwkxfsOL8Ya4cgg/v05jOLjOM0T3/trkZ4hTHo4gH6MRq3Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bD8uc4vF;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0544606A333
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 17:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0544606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bD8uc4vF
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-491971ac844so4399412f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 09:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541739; x=1796146539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cerw/Z7KIbXX4bOl2Vw1MF/BZKr852ZbBEpPnDE+6mw=;
        b=bD8uc4vF8J9geK8iH88yaXJBF/maPWDjivN/U9G4xSaoBmWPAOsXoLld6tJg7fXty3
         haMkXbr/fKxihHDLmWFA9i136CGI8AQXavJ2jZmOGAQ5M4cq90284QmA1euiXzwxBhcy
         /yvLyPAHaa/6vqfizpyrfCiKT7kCY2Wz8ZQifPdWEpRIrXP4KReRnI4LFnIeEDvY7sJT
         t7MS4LyIbjYh8drWTGpjynNun+6KlHWr/lEq+GclIE4mo92jBQGnnlDZlNT51UGJ3qXx
         GYsYh102xj9SDAoJuSdRgdJPhbXLryRfHGO7ytr3PJNzUfrNka7SvGGIheWJL7uiXCSU
         q7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541739; x=1796146539;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cerw/Z7KIbXX4bOl2Vw1MF/BZKr852ZbBEpPnDE+6mw=;
        b=eWfYtDJX+P5Br/c9UGK+/WOL8pActJrE62XjuA6cnRhK+V9vnvteNDn5CmY+b4KZsN
         YBDbzPvZzQtOApZu//vyG1IaAdbb3L19cudKV8TF+79gaCjQXfgJqlNyWNvWoL5ih1NZ
         1OWIAGveI4rW4j0UJeJMEWYcCqK02/3wHG+exqIUgkv0zotnxJqTL0camwkAWk3bjHwH
         lsTl3Jrv3rp6xV6yxnNBAcUEcXW7eHamL2h3WxEX0DKROP6+5HC4U/Rj8qCfkn6uPa5U
         LYMeVe2bAqgwu43TNoDLntZS1d+raaZHFXiqC7z8wWd2ASZh+FH0oIYdV3Ugq4zjWZvW
         TkTA==
X-Forwarded-Encrypted: i=1; AL+hErGj0WBlvaPN/Gg6QpNBZyEDfzzPMioACG7gGiHY8nZIeAteHnCzBm4W0v/ptE4hWUKxXeRvmjVswB8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jwTB9RMyDLreZXjELJkRPyTJzQKXwN/i3uisG+rj+VzwXXDW8
	sqtaAE8LB7ED6rR66RVIaiP1BO/B+gZHrnOcfesv6W3oGcZlqOpymelt3muhBMePiTI=
X-Gm-Gg: AZFdTZchpLhGfPa4WvyRP7XHLY9sAAkrPtrAfaM9M+g3R63iWnEYe+Y1ZP3aORvEbX8
	g4BvRZvkl0XRE6JFxYQbNlttt5nit0lqVPdvpLmTyGaCJYCmUwBuwQB2FFbcD752AQ5NT/QJ+iG
	ihkT2W5aB7s6iCbjwn6CRQB6ZRhE5TcIOxh+xFnMo/Cl9ZzD31kWjjTD5hs2+1ZpfVce+sUAO9z
	GeAM5QM5bpaJ4wZcekAbjrRHjgbYZIYp0wHns2bcaXjKkTFft54YTV1PJxvPp5KWfEC61SiK1nF
	VKn7TbmXWItsRGpr8B0CcZqvZZwXMmvdQXYblYgYaQ18x68pdr0LbBGtCIfkOHak/sGObkikE/L
	nSks+A2nwDRusRlHdSsE21cbuSym5Vvd8sAT0VXkZvvI+vWhqwkkYtdKkU/iiCDbticXjnHTn1M
	kZPuqxWbZiSb/lMHMQtqKQocqQC+egeUyr16Wp/rPtF5U58oFFyHbWaf5za/YBAxmU85HNeZRVq
	oJrMhqV3al1H+9ZilhZZeJol6SzcVEbda+sRaEefb6Pe9VPSo9cZKHXvW3nPuico4ZqmMHCj2op
	JmyH8HEeuOaNN9PIPd8xJer9Aj13NiTmZD6aMP32fsMw/4rleMVc8U8=
X-Received: by 2002:a05:6000:990:b0:493:ec0:861c with SMTP id ffacd0b85a97d-4abb0c5d53fmr28875984f8f.16.1795541739288;
        Tue, 24 Nov 2026 09:35:39 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm28453844f8f.30.2026.11.24.09.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 09:35:38 -0800 (PST)
Message-ID: <fa4e19d5-2e66-4468-9860-19cd9f3ea8db@linaro.org>
Date: Tue, 24 Nov 2026 17:35:37 +0000
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/19] perf cs-etm: Per-thread mode fixes and snapshot
 wrap support
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org,
 John Garry <john.garry@linux.dev>, Leo Yan <leo.yan@linux.dev>
References: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/11/2026 11:44, James Clark wrote:
> This series depends on:
> https://lore.kernel.org/linux-perf-users/20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com/
> 
> Fix a few issues with per-thread mode:
>    - On nVHE, everything looks like guest trace instead of host
>    - Tracing multiple threads didn't really work
> 
> After adding a tests for those, it turns out there were some snapshot
> bugs not picked up by the other snapshot tests. That showed that the
> different snapshot searches for Intel BTS and Arm SPE were inconsistent
> and I think all tracers can benefit from using the same pointer fixup
> logic, so that gets refactored into the common auxtrace.c. Then SPE can
> just share the Intel BTS search as it was obviously copied from it
> originally. IntelPT keeps the more advanced duplicate data search, but
> in the future that could probably be made the common one and all tracers
> would benefit from using it (except maybe BTS if it always has a very
> small buffer, but I doubt the overhead of the duplicate search would be
> an issue). For now this is more of a refactor rather than behavioral
> change so don't do that yet.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
> Changes in v4:
> - Change test snapshot size to 128K for 64K machines
> - Put patchset depencency in cover letter text
> - Link to v3: https://patch.msgid.link/20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org
> 
> Changes in v3:
> - Keep the find_snapshot() callback instead of adding
>    snapshot_has_wrapped() and monotonic_snapshot_head boolean (Adrian)
> - Add auxtrace_record__default_find_snapshot() for the simple search for
>    BTS and SPE (Adrian)
> - Add auxtrace_record__snapshot_fixup() for any snapshot search
>    implementation to use to update the pointers (Adrian)

Hi Adrian,

Did you get a chance to check these changes? Sorry it took a while to 
send the V3 after your comments.

Thanks
James

> - Reword UINT64_MAX timestamp comment (Leo)
> - Fix disassembly test after rebasing onto exception sample fixes
> - Only take 'perf_guest' into account if there is no PIDFMT_CTXTID2
> - Improve decoding of old files by hard coding queue 0 for per-thread
> - Link to v2: https://patch.msgid.link/20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org
> 
> Changes in v2:
> - Remove stale "may be reset to -1 in per-thread mode" comment
> - Set CPU when queueing auxtrace fragments otherwise
>    auxtrace_queues__add_event() overwrites the queue's CPU
> - Link to v1: https://patch.msgid.link/20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org
> 
> ---
> James Clark (19):
>        perf cs-etm: Fix nVHE per-thread decoding
>        perf cs-etm: Warn for invalid timestamp option
>        perf cs-etm: Turn on context packet timestamps in per-thread mode
>        perf cs-etm: Use per-CPU queues for per-thread mode
>        perf test: cs-etm: Increase window size in disassembly test
>        perf cs-etm: Don't drop previous target for kernel samples
>        perf python: Expose sample instruction length
>        perf cs-etm: Use instruction length in disassembly script
>        perf cs-etm: Increase default timestamp generation period
>        perf auxtrace: Turn Intel BTS snapshot search into a generic one
>        perf arm-spe: Use generic snapshot search
>        perf auxtrace: intel-pt: Use common snapshot pointer fixup
>        perf cs-etm: Queue partial AUX records
>        perf cs-etm: Don't print missing buffers in snapshot mode
>        perf auxtrace: cs-etm: Capture wrapped snapshots
>        perf test: Allow infinite named_thread loops
>        perf test: cs-etm: Add test for per-thread mode
>        perf test: cs-etm: Test multiple per-thread threads
>        perf test: cs-etm: Increase snapshot size
> 
>   tools/perf/Documentation/perf-test.txt             |   2 +-
>   tools/perf/arch/arm/util/cs-etm.c                  |  34 ++++-
>   tools/perf/arch/arm64/util/arm-spe.c               | 147 +--------------------
>   tools/perf/arch/x86/util/intel-bts.c               | 115 +---------------
>   tools/perf/arch/x86/util/intel-pt.c                |  21 +--
>   tools/perf/python/arm-cs-trace-disasm.py           |  22 +--
>   tools/perf/python/perf.pyi                         |   1 +
>   .../perf/tests/shell/coresight/per-thread-multi.sh |  76 +++++++++++
>   tools/perf/tests/shell/coresight/per-thread.sh     |  48 +++++++
>   .../perf/tests/shell/coresight/raw_dump_stress.sh  |   5 -
>   .../shell/coresight/test_arm_coresight_disasm.sh   |   8 +-
>   tools/perf/tests/workloads/named_threads.c         |   7 +-
>   tools/perf/util/auxtrace.c                         | 145 +++++++++++++++++++-
>   tools/perf/util/auxtrace.h                         |  18 +++
>   tools/perf/util/cs-etm.c                           | 113 +++++++++++-----
>   tools/perf/util/python.c                           |   1 +
>   16 files changed, 420 insertions(+), 343 deletions(-)
> ---
> base-commit: 28ef93607ad52acc8f8be25199711153ba11a0c2
> change-id: 20260605-james-cs-unformatted-per-thread-fix-50e723aa7f0e
> prerequisite-message-id: <20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com>
> prerequisite-patch-id: 4ef889ad751e344ae47c1d75a2a2e6cb2eadf6e1
> prerequisite-patch-id: 636b39730334cbc5a76642c070e704ffe178e7be
> prerequisite-patch-id: fb58f6daebdf5a194f8aa56ccc4022f932a5a6e5
> prerequisite-patch-id: d240c10c6824f8ae6c3f10a1da01226a957f05fb
> prerequisite-patch-id: 17b291db261e32dcb0d6f1ab2ed0adb7e0411813
> prerequisite-patch-id: 45ae1d523c9e5c8c573309f1dab107a598f3d4f8
> prerequisite-patch-id: 39a3eb25b3a45f4481760c25fa270773bcfd94f5
> prerequisite-patch-id: 5723a15636c2a28ec40eb6b5c9836d162e971786
> prerequisite-patch-id: d18054b586fc38bc832ead185e8c1fbb0ce46f39
> prerequisite-patch-id: 6735b192189d7945613458abce3da871cb79b35d
> prerequisite-patch-id: 387cb2c6181bef8f45a8fb167e8ef86e4a54ff69
> prerequisite-patch-id: 50243a8d1739141aa24aa371a8452d4d2d078a99
> prerequisite-patch-id: 2ae6f1e7707ba0c71a0678331b02d738fb25cb3c
> prerequisite-patch-id: 1fa0a90cfbc904c4429c1427409125ac44b27aed
> 
> Best regards,
> --
> James Clark <james.clark@linaro.org>
> 

