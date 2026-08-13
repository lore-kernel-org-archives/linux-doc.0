Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C2F3CEBA7
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 23:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786664510; cv=none; b=FbblcKN3Ym3o4DdD+Rf/5LUYBwf/v0wYpRu1jQPUMEWEQtrLrpZdtXqwVE8OqQFCMrPzUBuTjOhDq/2z3mt+DaxWRzJUvsHkU+9EK/7pnYeNnhhTC06DQ858XrMV21aXL/dSlVjSvZTLrcK2P0KlKJfkrGqeAZYSzXuq5kx3Rk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786664510; c=relaxed/simple;
	bh=Z0sNBHIOmQ+LAPxEwPnnYy6MXsPBYrGxEjwX6hykY08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t4h7rg2PKZA2wltPxIuf1V059n2xcsPEmDyahsVN8UWjPPqg602YWsi1JVfmLRttx6tFUJzDDcES+FtYns1PDvxrzOCzVg0SEqelrytkYfYwNmrNZB4lwDnSgEC0nZ1mcrwWd8WOqq3oyUqfOB4gxpnhG/S1ZmBe6+enKQIXP8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJKyqxei; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJKyqxei"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so573285a91.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 16:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786664508; x=1787269308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iwC65MbtAmU0iZDgsw6jaeB5r1edUFdIvrYzSi6Yk6E=;
        b=GJKyqxeiz3CtGWIhgEQH1qeK39ENM2CnIg7bUKy5wEZyrct+l5dYj2apEQl/POqGD+
         F9eLvNRiqi/GAauzr/Bv59HHYbTW0Zd1TNVGAHyBNUtPAmVeS7lGic7EzGttTEVj/TbA
         a/vm6cY0H10aDB/IQagMRQSVDzZQK/Jk2O44bGTCt7Mvei1PXJYmtLnDK0dDlCVXMnYB
         kH0XZpdTX/NYUeYEwIL+XwKOUFvldPHM1w/H+GjybP7Qmh/iwxYw8qX3noB6gzxixMo/
         NbWnUFeVPaGB3jGTxwL94rZ9rTlC30FDsN1CrHx5ASIWDK48kEUoseNAWEkwpZvTh9ze
         cGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786664508; x=1787269308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iwC65MbtAmU0iZDgsw6jaeB5r1edUFdIvrYzSi6Yk6E=;
        b=cOtagJQfCSSFesINk+17ynKy2FVFbPxci+lN4KFm6jBuozywVh3Up9tTET7tEw628z
         owYUURcg7AyVaOy+imlv2lFEZFB7r5ppeYku72vnrCjfHby1krAOofigbSLljhT0etux
         g18mk1ODpZTHl7aCnEHKMqYfrQvJ2jI2L/EH8XwbrTagqJjT2P0vaxcYAafmV2iLKSNi
         ehQkSwVPA14Dp8CnsJ+M0VRVgXQbw4cgbhHVM3U9JHYxwZgVTjp3Pk1BiD1g7SbYRE7i
         XL7PluUjUEKc5YvILk2BntaLauibBGM7tLr2IhVTJEpGcIpdW71DDeOfU2ZunwcdGwPH
         mImA==
X-Forwarded-Encrypted: i=1; AHgh+Rq61Wug64DStIkNnWH+Szsbp5z7Nt49DCbrqhGxsarPUdHTcX01UUyutyZjx9i98YLO9JPLGBFf3T0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz951OSoBdbFXMnsONWUKDYMTU1Fi5k8LEz4a8x/AL9sQqcSrJ7
	VoeplLVhpoZlltKWuz5fUA2VBJ1hjCaCVNPW5j4UP5y6W8POEFpGVmLj
X-Gm-Gg: AR+sD10kWmfGGTjf3kxEamlfXy/vHZp01XdMX5V+GfSXQ5Rts4K+CYAVax42Z9VwLE4
	sr1xaIv5ptoo0JRaKRsovipsNOqPVbcD0ljsP2XXPDPhClUDUPvosV+o4dRuhAzxfsbg+uJP/b/
	qHEj4XzugNlxqMrz926oqQD6Ql4QN6e3Qv6DlV6E2KLMkZwVnmlU+khQrJVirAwoykt89Jdfua6
	YaHTDO5XrEYD8bO37zX1/sBukXd7cLNWgvQ3bKZi8y2VwC0GiWWw6nN0yqElaJk/+wqovqlxNXi
	En/mo1HFyrW8Kkdf7NeZyb0ew5IZbSPFIs1pL0w5ako2gHLqmuQEOK+nzMNY3ujuEd2xcIWX7su
	7FQG2Negq6CS+GyUgSq+7Cssm/fYLzVW3XOIIsi7+N/LCQ122xepsQ78OF07Pa7+cdENtOJvraU
	Wk2tLsprLWfZTV02/Buj0qBF3TMv3bvYqhEXlkxIhU9pmG9/LvhqZvrA9SxNpKIgGPA/Y9SG5d2
	IK8xIk=
X-Received: by 2002:a17:90b:2891:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-3933b8e1ec2mr1667028a91.11.1786664508220;
        Thu, 13 Aug 2026 16:41:48 -0700 (PDT)
Received: from kira.gmail.com ([2601:646:9e01:94:1485:6f2e:d5d8:e3ac])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387af4adsm2357778c88.1.2026.08.13.16.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 16:41:47 -0700 (PDT)
Sender: Mark Harris <markh.sj@gmail.com>
From: Mark Harris <mark.hsj@gmail.com>
To: tchiu@tenstorrent.com
Cc: Mark Harris <mark.hsj@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	bergner@tenstorrent.com,
	kito.cheng@sifive.com,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	"Andrew Jones" <andrew.jones@oss.qualcomm.com>,
	"Guodong Xu" <guodong.xu@oss.qualcomm.com>,
	"Aleksa Paunovic" <aleksa.paunovic@htecgroup.com>,
	"Pincheng Wang" <pincheng.plct@isrc.iscas.ac.cn>,
	"Xu Lu" <luxu.kernel@bytedance.com>,
	"Yao Zihong" <zihong.plct@isrc.iscas.ac.cn>,
	"Jingwei Wang" <wangjingwei@iscas.ac.cn>,
	"Deepak Gupta" <debug@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/3] riscv: hwprobe: export the availability of vector to user
Date: Thu, 13 Aug 2026 16:38:54 -0700
Message-ID: <20260813233854.86799-1-mark.hsj@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260725001614.2578617-3-tchiu@tenstorrent.com>
References: <20260725001614.2578617-3-tchiu@tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Andy Chiu wrote:
> Userland IFUNC resolvers use hwprobe to decide whether to dispatch to
> vectorized routines. But RISCV_HWPROBE_KEY_IMA_EXT_0 only reports what
> is present in hardware, not what the calling process may actually use:
> when Vector is disabled for a process via
> prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_OFF), it is still
> reported as present. A resolver that trusts this and runs a vector
> instruction crashes with SIGILL.
> 
> Add RISCV_HWPROBE_KEY_EXT_ENABLED, a positional modifier key that carries
> no value of its own. Within a single request, keys placed after it report
> extensions that are both present and enabled for the calling process,
> while keys before it keep reporting hardware presence. This masks out V
> and its V-dependent sub-extensions when V is disabled for the process, and
> lets userland obtain both views in one query:
> 
>       [ {IMA_EXT_0}, {EXT_ENABLED}, {IMA_EXT_0} ]
>           present       modifier       enabled
> 
> The enabled view depends on per-process state, so it cannot be served from
> the vDSO's process-independent cache; requests carrying the modifier are
> deferred to the syscall. Unknown keys are still reported as -1, so the
> feature is detectable and existing users are unaffected.

Currently, each key has a value and the order of the keys does not
matter.  If the interface needed to be extended to support
process-specific values, or thread-specific values (the prctl() is
thread-specific), I would expect either new keys to retrieve those
process-specific or thread-specific values, or a new flag bit to
indicate that existing keys should be reinterpreted in a new manner.
Using a key as a modifier with no value and changing the keys to
be order-dependent seems like an unnecessarily confusing ugly hack
that we would have to live with for decades to come, just to slightly
simplify code needed in the short term to handle older kernels.

Additionally, the approach of falling back to the syscall whenever
the modifier key is used could lead to each check for the vector
extension, in an ifunc resolver or almost anywhere else, having to
perform a syscall.  Callers wanting to use other extensions may
even use this modifier when checking for them, because given the
choice of knowing whether the extension is potentially available
or is available, the latter sounds like what they should be using
to be future-proof, even if there is not currently a way to disable
the extension.  That could lead to a syscall for every extension
check, defeating the vDSO cache.

On some non-RISC-V platforms glibc allows its own use of specific
CPU capabilities to be disabled through tunables (e.g.,
GLIBC_TUNABLES=glibc.cpu.hwcaps=-AVX2 ./my_x86_64_program), and as
of glibc 2.44 tunables can also be set in /etc/tunables.conf and
applied system-wide, even to specific programs.  This is more
convenient than a prctl and it would be nice if RISC-V extensions
could also be disabled for specific programs through tunables, for
any use where its availability is checked beforehand (in an ifunc
resolver or elsewhere), without the need to go to the kernel for
each check.

Because ifunc resolvers may not have access to external symbols
beyond __riscv_hwprobe(), it is really attractive to be able to
obtain extension availability information using the same function.
But that doesn't mean that the kernel has to be involved.  The
function is in libc, so it could call the vDSO function and then
optionally modify the resulting values according to its own
process-specific information about enabled or disabled extensions.
This extra information would ideally come from the initial hwcaps
(which reflect the vector prctl) and any tunables, so it is
process-wide, can support arbitrary extensions, and can be checked
without any kernel syscalls and without callers having to know or
care whether a particular extension can be disabled.  If the prctl
was used to re-enable vector in some thread that may not affect it,
but that seems like the desired behavior, at least for ifunc
resolvers, since they are assumed to produce the same result in any
thread and at any point during the process lifetime.

If implemented using a new flag, the libc __riscv_hwprobe() function
could just call the existing vDSO function but with the new flag
masked out, and then if the flag is set, modify the resulting values.
That would probably be the simplest and easiest to understand API
and would not require kernel syscalls.

 - Mark
