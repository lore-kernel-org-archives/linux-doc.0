Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7082745B
	for <linux-doc@vger.kernel.org>; Tue, 24 Sep 2024 16:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727195120; cv=none; b=T6BEmRkr7Zm4QA+6Pwccmwk8kMfLwD8W3M48e58kqn+aAUkZKgK1+ELkp6o6mEvfZYj2zuKho17FxoABluI7XXFmx9gYEgbh+NbvsiozH8eoy8gXGbE8inwsFlagoqLtHBfEzCCLyM+BNdGH31Zp45Ot5f6B1t6Vdt3VfEbqtNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727195120; c=relaxed/simple;
	bh=KL27rgoZ3wP4pGsCfA1Ow4ijZvgGX1PvV3gbwxQmTMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OJZnG6rwiY9k2yPaxDRL6v0EupgRRnfPeUUE5N8RL2KWd4rWgVpUKvggnrGEy0ZWfyC9u5qWCjDjdqz4cgamgG7Ymn/AIeOlEJterwIz4ojrnL6VXuyBhSsKmm29v6OpYNqgzlxPzTs/IYTjbmt7oUCArWMUNI3hJXi/9L41m8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o4i/1w4r; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o4i/1w4r"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c25f01879fso7259918a12.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Sep 2024 09:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727195117; x=1727799917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OGzXyCyIU+gpdL72mkYPID0DqYKw9jMm9jZJoxAZdU=;
        b=o4i/1w4rNix0MG7+ibo3N40L0fMHivoHA1gcD1ZUXRiv3S1S6ylSUoUZ4QW6j0nIBt
         JWG+XCvthpbc7iT+pRvuMSotbRsVdMdsbfYXPyeubYTQg/Ggb+UlNDnL2EOpxRd0bOkY
         kwZ+NzmDAcWVA1HQPnYLE+MoTbRQpcQhfVY25/jF0+81CMoeBclc1yw3lxo/kTNIC1O7
         qzDPImF8aTmpzkvnjLJIJBjBvhsXDyvmWjw8LAkUEvLRstPahn8tIzAZ3qJeNaam70YD
         BwBT1CUbN5DKYEpVpNUe3zUEZVvPTsWU8BZGNVd5XEZhzkhX0bSkSuFZ6wrRVHmgOn0i
         dhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727195117; x=1727799917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2OGzXyCyIU+gpdL72mkYPID0DqYKw9jMm9jZJoxAZdU=;
        b=Jx5rl4pVMvyVkpOEzWCEyvAL/tY6tkwD9yII9eFf0fLjJvnxg4i02ez03qcPyYK8QG
         M167JprcFSvYMU34E3FN3W4cMjDNfB+I9YemIP/zxSahRf/N7Ocoi0jDSNdynhQnIkL/
         r57VD94leUTZWEKrA813ymBXCYb+3omwlfSQNp7PejJfc7I7jVoQfdUXFAcR63D2Fx3u
         ZvucgY6RlxGwTl4o3aFHJ2AI733bbfJ5s5k+3Pj15tpfAfNPkSfHiicdSZ+IENRID2g2
         Iy62C6EiGMBbbpAccylJW2+k9QEQxZ+BV93WXGMuCqpVvkd6WtuBYM2Bo03DXOB66H1e
         8KEA==
X-Forwarded-Encrypted: i=1; AJvYcCXtJhadb+d9mOAxn+MPrHUAHkJGnjooVOh5E7rZnG/uwg27jKP0IXHK50Z3jl5luQLwgbt4YXWjEUo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/07kk2s2t/nJIHFRG+bcxjKUDmDOHgWqhdeSevv+FddgweZ5W
	S4N/mFTNoMFBSTSrWj5JdRIQ0ewfNsxijfq/BPB7imt40Y1YDJ+nqDR7iYwrELx0f8yOISUAcrJ
	/2kYjGlrhJrWpfcz6WBWvbVj9xRgcY+9OkMSi
X-Google-Smtp-Source: AGHT+IGSoSsFkK796I2+DdE4o7j50yWb0SAdaqMH3jXpmPjzF7P9uS7HuwQVYvqGjDSWnJ6hxq4EuiKtJWeeDRd3TIg=
X-Received: by 2002:a05:6402:e02:b0:5c4:1437:4159 with SMTP id
 4fb4d7f45d1cf-5c464a5d4damr13913001a12.28.1727195116491; Tue, 24 Sep 2024
 09:25:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1725488488.git.babu.moger@amd.com> <a94c14653c29e89bc76727addfcdf1f9c164b95d.1725488488.git.babu.moger@amd.com>
In-Reply-To: <a94c14653c29e89bc76727addfcdf1f9c164b95d.1725488488.git.babu.moger@amd.com>
From: Peter Newman <peternewman@google.com>
Date: Tue, 24 Sep 2024 09:25:05 -0700
Message-ID: <CALPaoChn+dkHNTMdCwCqH=zwtBr9jJRV4jAGWeWnNOBZ1f+6WQ@mail.gmail.com>
Subject: Re: [PATCH v7 09/24] x86/resctrl: Introduce bitmap mbm_cntr_free_map
 to track assignable counters
To: Babu Moger <babu.moger@amd.com>
Cc: corbet@lwn.net, fenghua.yu@intel.com, reinette.chatre@intel.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	paulmck@kernel.org, rdunlap@infradead.org, tj@kernel.org, 
	peterz@infradead.org, yanjiewtw@gmail.com, kim.phillips@amd.com, 
	lukas.bulwahn@gmail.com, seanjc@google.com, jmattson@google.com, 
	leitao@debian.org, jpoimboe@kernel.org, rick.p.edgecombe@intel.com, 
	kirill.shutemov@linux.intel.com, jithu.joseph@intel.com, kai.huang@intel.com, 
	kan.liang@linux.intel.com, daniel.sneddon@linux.intel.com, 
	pbonzini@redhat.com, sandipan.das@amd.com, ilpo.jarvinen@linux.intel.com, 
	maciej.wieczor-retman@intel.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, eranian@google.com, james.morse@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Babu,

On Wed, Sep 4, 2024 at 3:23=E2=80=AFPM Babu Moger <babu.moger@amd.com> wrot=
e:

> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index f11d6fdfd977..aab22ff8e0c1 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -187,12 +187,14 @@ enum resctrl_scope {
>   * @num_rmid:          Number of RMIDs available
>   * @num_mbm_cntrs:     Number of assignable monitoring counters
>   * @mbm_cntr_assignable:Is system capable of supporting monitor assignme=
nt?
> + * @mbm_cntr_free_map: bitmap of number of assignable MBM counters
>   * @evt_list:          List of monitoring events
>   */
>  struct resctrl_mon {
>         int                     num_rmid;
>         int                     num_mbm_cntrs;
>         bool                    mbm_cntr_assignable;
> +       unsigned long           *mbm_cntr_free_map;
>         struct list_head        evt_list;
>  };

This looks global still. Will only all-domain (*=3D) operations be
supported initially?

Thanks,
-Peter
