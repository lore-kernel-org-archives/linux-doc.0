Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A03399352
	for <linux-doc@vger.kernel.org>; Wed,  5 Aug 2026 03:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785901244; cv=none; b=T7uQBUjklg81ucwKvgueRS7oTzGBRDvMhC2bjmW7wRIEEWKn2aOlKztMPlpdzKu505EMfYHPB8aLU7tIHQsRmVs4PhajvRVeqSD42Qcf5VZjD2Fkx7QNx0/XJUkth8P6wSGPzQ5S+A8/crUYEolSYuo9u2373e8fSp61/eg2XwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785901244; c=relaxed/simple;
	bh=9bRo+Ywi3z6M397Ttk8WJOCfNaXfPL/cDqxTv2yA2Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AhfUde/DKxxplpPH+jiFuSIw+sSkZ9zrAlpxNUIfaZIC3zmxNHDJ1fnpQbfY2WC7CCnWo5sT1X9960Q0NSg3Afq1zOBNzBHedLM8eOFfudYOCaserkbPAZ1AGoGogFXZYfQHNDkc28s+oIlrbO62zDb0nO3Mg5OYQCfSWdcH9fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d6n+AYVx; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6n+AYVx"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cf50c6f235so6798115ad.0
        for <linux-doc@vger.kernel.org>; Tue, 04 Aug 2026 20:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785901243; x=1786506043; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b3uhTNsEfEA4V2HM2KbClDOzdBojungNZKQ+/eKrllo=;
        b=d6n+AYVxTgvuQaBP3tvTDmtUa+BufNiI0QFRb7MP6o5tWa1v92kxKQT9945R11vRvV
         9VhSZ1XJU26KUnSXR6CiwcBYyEKReDh2DM467CincLHDeBSQEe/lofMxioEFa5Lpdx/7
         c1lRENYeL0mOFpM7yq7yjVmPrcr33CENBNBXZALnao8XzhA6GqBD9v/nGUCGIDp6m8ot
         ogVgV/L2xuCetRLMuf9T1A5LoMJM/jIXuyqTva6ElqGGZGqOO/cvYXpocS7i76TZR/5r
         v6ieGIoSr+4xFK7Oig+LKiH+P/s93d6uiRuZePE//UfhG0B/74aBN2bKMLR6OW8rFpfj
         bAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785901243; x=1786506043;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b3uhTNsEfEA4V2HM2KbClDOzdBojungNZKQ+/eKrllo=;
        b=I05GkdEMhKZE53ZTbTP81Ui6HV9mljK+ZpNJHjEic3q9du9sEJV2n5u7fozqnQCRjb
         GXyJ0uK3HWItQuXpmHrU9ELTVKr+Q0nRs9hJiie0e6ODkbw/PdEouMUfEtVe+xAQOPn4
         T9Ni9uUMKrGl/K8/NwySGrQ2OJzy9+0Yv3Lu2TTynuMgIFIL/Ennz1WmyNx677UUFA+3
         Pu8hayVEEcawu+VjmNXPa0vgizTeRqgQw+tJHDQEHBNoIylThax92e4iIluMNk/bKIxA
         FPq1GyT1I0+x1u07l+Kao8wwhgojRCMStY6ZvHidhAad7xNHnaGRlzyml4FwiN6cDQRv
         eJeQ==
X-Forwarded-Encrypted: i=1; AHgh+RoagTnOZH/XAFrWyF4jW3qZnVkKuqYDbpEEw+fW4UET1w4AbyPlBH94NxqD44yGaN2j10sBbOgZw7E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD8JhG+tZJ1EPVd8YIbwnCjIZzrooHlhs0kuld5sww/gVdiRLQ
	canJbqUiVA9nd9+J2gr4dINz9Foee6EnFt8CgFeY1xo8hb90XLQdX3TY
X-Gm-Gg: AR+sD11icDdJ+AINAAV9O1Y/U4l00CulOJMY2/Uph+XS4em4v+cMWuqi760ykjqH68F
	dtFU/U/XslM74BL5eyufA37ZWda1KChKJo+YsKSQ/TCTFY5gBVyLIurQzE3el9BOfEd8rBTpIT1
	JOEaOWdjUcy3tqmpgbTRpowt8teHWtq8YB0NOozJFMHY3VpWfwrW9g1gJdcyPAswCC/b272ZmuT
	fdDZhUJ+blmTx4atmHQZTLYziviiWDgePyh6z4RQ/wcvY2gBFmebzHLlS5ya9+lEW6DHOqOU1aX
	AzLr8tqTZlysxID7EHglQLBZQu4poXoJTSbn0kCpgzdxSyyCCgWQUVCC82kl0e5VYtWG283Sh2E
	xtAtdBfFTExTrm3EEp1FsyYdsUD7Iu6JcsWQ6y3dWmKChpjhjNRO68pfHVrzRzQdZqUeP6/J6DO
	PoA+lhykela5GwD7oLrSLDta09cV+vYvbF6e5Nm7FrCfxt/PGzH/qlu6QhjQ==
X-Received: by 2002:a17:90b:1811:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-3903bb0ab77mr3022104a91.0.1785901242802;
        Tue, 04 Aug 2026 20:40:42 -0700 (PDT)
Received: from x1 ([184.3.251.152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903917a5d0sm1534085a91.6.2026.08.04.20.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 20:40:41 -0700 (PDT)
Date: Tue, 4 Aug 2026 20:40:39 -0700
From: Drew Fustini <pdp7pdp7@gmail.com>
To: Paul Walmsley <pjw@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Newman <peternewman@google.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Tony Luck <tony.luck@intel.com>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
	yunhui cui <cuiyunhui@bytedance.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	x86@kernel.org, devicetree@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 2/8] riscv: Detect the Ssqosid extension
Message-ID: <anKwt4llzgwySljb@x1>
References: <20260729-dfustini-atl-sc-cbqri-dt-v6-0-7c22b05d461b@kernel.org>
 <20260729-dfustini-atl-sc-cbqri-dt-v6-2-7c22b05d461b@kernel.org>
 <c38f0bfa-54fc-d141-c166-7355901d8ad1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c38f0bfa-54fc-d141-c166-7355901d8ad1@kernel.org>

On Tue, Aug 04, 2026 at 08:47:04PM -0600, Paul Walmsley wrote:
> On Wed, 29 Jul 2026, Drew Fustini wrote:
> 
> > Ssqosid is the RISC-V Quality-of-Service (QoS) Identifiers specification
> > which defines the Supervisor Resource Management Configuration (srmcfg)
> > register.
> > 
> > Link: https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0
> > Co-developed-by: Kornel Dulęba <mindal@semihalf.com>
> > Signed-off-by: Kornel Dulęba <mindal@semihalf.com>
> > Signed-off-by: Drew Fustini <fustini@kernel.org>
> 
> Thanks, queued for v7.3.
> 
> 
> - Paul

Thank you for queuing patch 1 and 2. Can Patch 3 also be considered to
make the Ssqosid CSR handling complete for this merge window?

-Drew
