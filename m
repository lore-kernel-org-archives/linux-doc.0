Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190152EC08F
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 11:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762772457; cv=none; b=kSvT9TCY/W8SXcDT1nC0MoUJ/8f8o6v7JS0D3yI4jiyMgUM94taD0VYeyxn2FBOyEGJeZDe5MglEmlcBBZ4lfYykXg1+YWHb5nwIZ5jT1RTbuLLiND0KpX6nOYsmzvf+TzbKS1NFY6djQ+jL6PsLBECJTZWnB2CK/3SA6vfP0P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762772457; c=relaxed/simple;
	bh=j/sDhA1BE/crBk5MB3jz5Gyqsa0mwcEpYJuOnY+51Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+U3p0DZ8T/iM2+dpjlemoKTKjVPxa3b4ddYfLqIz05XMbDaHpxwyGVi2Zvuf45CCYAwplsaaUJkZlbMsWs2uHzDoXSquGc6H/1d9KU3LaA/3w8NUfXALcE3q4dOidSiYVjzQyslzlvLFUVgzg1Uc00MoXw1uWU+6j/n/cb00PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MoITomXm; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MoITomXm"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-782e93932ffso2321404b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 03:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762772455; x=1763377255; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YrIRy6Lhq+4eE5yPFjSN9IOBDP8Cyczj9KXwJvvJFlc=;
        b=MoITomXmIdl0l9mMoc4ILl2St6hK1A4HMUb0F493E4DjqRtYRaaHWITxuqAxyq4ZMt
         Eux6VA/tuOY/Phh+AcSizGAkdWdmdFpuWDuTX4jh4eLo+zxAkadFZO+DnDH9dLRMMPvw
         KM5rJ8gPZho8vx/xWz9zYmHpGbiQ0u+pNqXNNOG+Ohb69SzBHy7dy9Deb0Mh1kyi6bDr
         BLIjiHLZZrloc2S58aturYja41JAsiGJcgCQg1UGb0GcsXEDi64d/pQE6WK7V4y/SvN6
         HDod5am68vwzf1U+U9hlWeSGUECILkPgFoMuE3rFPrySIu3Ue/zZb9jRtE69mO6FLLwU
         5Hag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762772455; x=1763377255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrIRy6Lhq+4eE5yPFjSN9IOBDP8Cyczj9KXwJvvJFlc=;
        b=L6N6P+gMVXy6e55uaqKEJczwQHeI1LSSwjms3RTtpM+4W4/sUVaK1NAKe2pAXgOHx6
         p7i2mjfk6u/vbhz9FPlaaT2/C86pAgJ/bVUZCOFF2HUrzfF55F4RxGeN2H/RQ9nd8TGc
         c+y5w2zObnNkffMZ3C32hlVy2D2qup/dA9GaOhKBuFUJOMTyJ4v7EPBVoFt/IeHcmT1y
         CU1CZ4ZktrSehdKv4JHcb2e5dhXoP8N9LFanGHmShWtxyw0RgYEVWxAX3aRj7Z5+PmGk
         F4UTyBzbEceR5ORSGsbFoMDSziB4pm0B+tmo6acHk9drOjbjT8TQqd65gdD5obWdGPQP
         LoTw==
X-Forwarded-Encrypted: i=1; AJvYcCV4mQJJ3Yv7X+Li2btcF/a99Oldb4YyphuGFyNxJVFH35OaYt9WhnuDOb7r7etMFSzD1cCa8HmV2Bc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqnSCsSLMxSeuPxS6TRq0lrdTPIOwn/v0Fwst5snHi9I3wGmyt
	5EcG1MOz361ZmjD3oKmMwmINi4h/Ei7UUd/7KQwtTnc0f5G2OVgjncvPDok4fOHiY4c=
X-Gm-Gg: ASbGncvr9tw2sZ0FPzegJhb5wTQT/hVeOXJqn8hr9iPKVfTWYFTlWBZH1GUdJNcXzuM
	6XIC26KV36EUMrmpapB1hXMhURgw7LjW5Pg5Ig2lr1UtESxt75dpzdNTc06EjPgxmTgOY5fN1ds
	13nqzjE7T5ZuS7AtWw3WGAuZ5+DsL8SbVZGoryhTn7sYX6D0qpxtMzji6BZ5MLKpM6PmjnL19Qe
	XMRA1i6gw7rusYW7WgEizT9jEmgzHk4vuKl/LJ3k2OXtCJefuWrIjRJgAx7E7Ggrx/HaDsGeulU
	boSvoPYSurooGIH1LT+TE4Wg+OylhYVH+4Yh/9aICBt4VNflAs77myeZfsRdUFtQtxTySHfDfJv
	YICH/c6oYcLwmvS9pW1+7o4oFHaeZOhJksVfea6z/vy6c0pXwKhYJb3MaoYRET8uYUgQw3NtSb6
	saSGdv+/NsSo4=
X-Google-Smtp-Source: AGHT+IGOFDbu7mquDmNhSqV97BdY6cG6MLgvb5Xp7QodBHXn8La7j+gNEL/xmdVl7cozIyrmwIAy9g==
X-Received: by 2002:a05:6a21:3291:b0:350:1872:7023 with SMTP id adf61e73a8af0-353a4163b2bmr9937463637.55.1762772455121;
        Mon, 10 Nov 2025 03:00:55 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c963586fsm11304602b3a.10.2025.11.10.03.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:00:54 -0800 (PST)
Date: Mon, 10 Nov 2025 16:30:52 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sumit Gupta <sumitg@nvidia.com>, pierre.gondois@arm.com, 
	zhanjie9@hisilicon.com, ionela.voinescu@arm.com, beata.michalska@arm.com
Cc: rafael@kernel.org, lenb@kernel.org, robert.moore@intel.com, 
	corbet@lwn.net, zhenglifeng1@huawei.com, rdunlap@infradead.org, 
	ray.huang@amd.com, gautham.shenoy@amd.com, mario.limonciello@amd.com, 
	perry.yuan@amd.com, linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-doc@vger.kernel.org, acpica-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, treding@nvidia.com, jonathanh@nvidia.com, vsethi@nvidia.com, 
	ksitaraman@nvidia.com, sanjayc@nvidia.com, nhartman@nvidia.com, bbasu@nvidia.com
Subject: Re: [PATCH v4 0/8] Enhanced autonomous selection and improvements
Message-ID: <hjrcoq7dapqcodk3iiyvjeuq3cwvyccqr4wnlcoi6eduqg5ahf@tszrjvfnkjux>
References: <20251105113844.4086250-1-sumitg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105113844.4086250-1-sumitg@nvidia.com>

On 05-11-25, 17:08, Sumit Gupta wrote:
> This patch series enhances the ACPI CPPC CPUFREQ driver with
> comprehensive support for autonomous performance selection, expanded
> runtime control interfaces and improvements.
> 
> It adds support for below:
> - Expose sysfs to read/write the Minimum/Maximum Performance Registers
>   using frequency (kHz), with internal conversion to performance values.
>   Also, update the policy min/max accordingly.
>     /sys/.../cpufreq/policy*/min_perf and max_perf
> 
> - Expose sysfs to read/write the Performance Limited Register.
>     /sys/.../cpufreq/policy*/perf_limited
> 
> - When toggling autonomous selection, synchronize the policy limits
>   by updating the policy min/max.
> 
> - System-wide autonomous mode configuration via 'auto_sel_mode' boot
>   parameter. Mode can be switched dynamically on individual CPUs.
> 
> - Generic sysfs helper functions to reduce code duplication.
> 
> The patches are grouped as below:
> - Patch 1, 2 & 3: Improvements. Can be applied independently.
> - Patch 4: Sysfs to update min/max_perf. Can be applied independently.
> - Patch 5: Sysfs to update perf_limited. Can be applied independently.
> - Patch 6: add sysfs documentation. Depends on 'Patch 4 and 5'.
> - Patch 7: sync policy min/max with auto_select. Depends on 'Patch 4'.
> - Patch 8: Boot Parameter Support. Depends on 'Patch 4 and 7'.

Beata/Ionela/Jie, any feedback on the CPPC changes ?

-- 
viresh
