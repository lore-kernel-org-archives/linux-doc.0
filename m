Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DAB349B19
	for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 07:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790407916; cv=none; b=fLEKfUMPpEcChn0CGBFQbQltmAO9Caf4nk3OyLhQf1pfkxICmf5yQDvmoIN7eKdEFSrcNeqIJ79+lDb9GQzcpiR7YKzA64y3wR1kJwSEmJAgJ5ounNJ4AUJ6fT1jZ5+brYs3GxDjHH6ZviUc72ddYiP/XWf4tR8B88ke4B5JwOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790407916; c=relaxed/simple;
	bh=kzU8QNWm28e2y70xXRJErhWUPUtjovS2IQKpU+gp4tU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JeeldGsk5X9S0tGHe7kYONvfPRVWnX/VZbOHh3QL6MYpTKvEMXbQTTa09+ba1KAKIF/i2WGKg72tH7gEfTyNzgWXDSwdoYG30SvHLOGQdNibnUbtXI3Hi0CMtqdoe4kh6nS9UwH5tLNE6iXMoW5ajaT0nCsUiI8L5D/Ktnh1RG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=smQxpmTb; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="smQxpmTb"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71974de4so922655e9.1
        for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 00:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790407912; x=1791012712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RkvDHiMHE95iZAf8lTowG72tJREbCH/YatR07v+AyBo=;
        b=smQxpmTbpnHEyouNNbn8fPqFph9iroQCrpJ3A+18pARzvTOU07uGilo298BZ8CuxbT
         CPoTJZWz2J1sLjXC7kWyFcoyWYii0Mu6UsZnaFObQS1dU9kKs6kV+dFRarNQe0Mk7Zwe
         9X1IGHDBrzhvmP3bYOdwQoH2rO5zEC6IV2oDRVVM1lnKzwv/n6OjqwFLAMoWYVNIShaK
         1xB7bWc2LFIBKJjRAEkmFjlpN1dpSVd0jQ4GU8jMAyVpUclwW/8tFXnBuKKtJ97vbJzd
         mkxftbhBGnNDDUn6xMWI0S9hY285thCe1KPeAMfyl4wL11Af3wK+qp/kS+kerhZZnG1K
         fgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790407912; x=1791012712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RkvDHiMHE95iZAf8lTowG72tJREbCH/YatR07v+AyBo=;
        b=1gLBbd9I2ezjsJohX/cyIQ4xyjGMiyCyjcfzxCccBU3FWJgRvHXwjhnjDCdSWYDT+Y
         h0ZIDmaOa67pG8y3thgJ9XTPv2V4TUOm3zfD/w0BxUm+ZIdSmbmBnd+/cPT62FQjRoAF
         nIvo5C6Er8asiJHBQIBCwY3RO/tEMXlxPHk//ifcWAPQf2st1G2XJ+G1Cp9Ta72mkgTp
         ayd/RG2cRTb+TdsCDzVy6s0XIVH9w3+5pkPaMwahCGyGdcYLI9Xleu2GoxweyxnXA15q
         rk9MnQa7WhPrU9BZluDjuumueswjXSpStlE3Vrsx7Jevo+sADXfToZkdBfKKF5MtELsH
         lOdg==
X-Forwarded-Encrypted: i=1; AKwUvBw1Vw1IyPqdrzvs6795b9knI1uL7d46dPL2a3YDtyK8DhFOGKWJF9hQ0YqTamhow98K3MqE3Oe9SZM=@vger.kernel.org
X-Gm-Message-State: AFuF++nDCLun0AE0qHZl+t8vxs8SWdXvKgBNuoJaSq701vr1GpWhub7N
	q2cGvm709On8opCO9pC2Xflv6X+CNQ8FeN5yhzi8jHc6z8gJCu4VkS9i
X-Gm-Gg: AYBFou2jc90kpodGwivT83R9qc58gkW8NiH++0ASEiLz2axmz1jgO+5j8+LqdTL1wUL
	cBSuyBumGN1UtLjhklsFUrd3RHJI7oBfOv85fLYdp5rb6DxOY5jbU/39TrKQrvru9yq2ukhPa4S
	bVUOQt+yRjMGWreMD6/vy/gw5rhI5e4fcUYFGL9zLhnsAlmIfoj3uo/r/KktXeYIA/ggBfeF/vD
	S6rZkCiKsGd9Rqof6vHjTIN6XCB10dDtyXDbCP8+XxCsNlEruSQ+a9eFwqZrnpPs9sGIGFxG7P9
	ZAIUsKLhDt62HELol9gE7/twdQS5aMW/hxcr1coWgmEhfiVOqjR9Ouet/gZccKBsXV+fCknBt6o
	up6i+1o8PBWp4nhrOrFI+6jVhMtL7RX7beN6YEyTz4h3F6JKAQ8GVIkC2CmX09PNDswOldrf+1I
	7jVE90wgWpxMS0wqXUZIsGarhhXqy8AU+dcUlvY7FiDH2HADg0XnWLutgODWdLlPJVvoO13YgjR
	9vm83F6Sly3BP1gQICQN0Xp1g==
X-Received: by 2002:a05:600c:1c2a:b0:49e:7cc6:ec88 with SMTP id 5b1f17b1804b1-49fedddbad9mr107313315e9.1.1790407911686;
        Sat, 26 Sep 2026 00:31:51 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349fa1sm18198789f8f.8.2026.09.26.00.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 00:31:51 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: sshegde@linux.ibm.com
Cc: arighi@nvidia.com,
	chleroy@kernel.org,
	christian.loehle@arm.com,
	corbet@lwn.net,
	dietmar.eggemann@arm.com,
	frederic@kernel.org,
	gregkh@linuxfoundation.org,
	hdanton@sina.com,
	huschle@linux.ibm.com,
	iii@linux.ibm.com,
	jgross@suse.com,
	juri.lelli@redhat.com,
	kernellwp@gmail.com,
	kprateek.nayak@amd.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maddy@linux.ibm.com,
	maz@kernel.org,
	meted@linux.ibm.com,
	mingo@kernel.org,
	pauld@redhat.com,
	pbonzini@redhat.com,
	peterz@infradead.org,
	rafael@kernel.org,
	rdunlap@infradead.org,
	rostedt@goodmis.org,
	seanjc@google.com,
	srikar@linux.ibm.com,
	sunlightlinux@gmail.com,
	tglx@kernel.org,
	tj@kernel.org,
	tommaso.cucinotta@gmail.com,
	vincent.guittot@linaro.org,
	vineeth@bitbyteword.org,
	virtualization@lists.linux.dev,
	vschneid@redhat.com,
	ynorov@nvidia.com,
	yury.norov@gmail.com
Subject: Re: [PATCH v13 01/13] sched/cputime: Add kcpustat_field_total helper
Date: Sat, 26 Sep 2026 10:31:46 +0300
Message-ID: <20260926073147.140907-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909135617.871006-2-sshegde@linux.ibm.com>
References: <20260909135617.871006-2-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Weekends...

> Provide a new helper function which sums up a given type of cpustat
> over a specified cpumask.

> This allows the caller's code to be simpler and avoids duplication.
> For example, subsequent patch in the steal governor use this exact
> same pattern when calculating steal time.

> @@ -207,16 +207,12 @@ static unsigned long hd_calculate_steal_percentage(void)
>  {
>  	unsigned long time_delta, steal_delta, steal, percentage;
>  	static ktime_t prev;
> -	int cpus, cpu;
> +	int cpus;
>  	ktime_t now;
>  
> -	cpus = 0;
> -	steal = 0;
>  	percentage = 0;
> -	for_each_cpu(cpu, &hd_vmvl_cpumask) {
> -		steal += kcpustat_cpu(cpu).cpustat[CPUTIME_STEAL];
> -		cpus++;
> -	}
> +	steal = kcpustat_field_total(CPUTIME_STEAL, &hd_vmvl_cpumask);
> +	cpus = cpumask_weight(&hd_vmvl_cpumask);

nit. The cpumask_weight() change is not mentioned in the commit message.

Thanks,
Kayra :>
