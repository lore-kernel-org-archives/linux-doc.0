Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E9832C94F
	for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 18:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760725024; cv=none; b=YUzW1Kgh1d4mPECw4jdU3gKoDsuivnNvG7QIAnQvrU8Ow+6TFK3WCZ8M8tN2+89adJCHh4ZafnXHBiBEJ6qtIeaomp/I+3DXvH4SoCOmTMY+rxh7MQxhHZnGyrbeRMUwkmGn2DbnCT3TP4GT9Jm3b7oBfq937V98uXwxIA7DXWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760725024; c=relaxed/simple;
	bh=rJvNrY02s+ZucFNBz2Jl9T4sf21+yp9XMDRTutLQMTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r8Hu5CsQ/zdzLJfNeAjyxcGpMSVZrHzOjev9jUFO0qGC7DQdK8cE1KLSsULphSaPnqOc1I3Y3vrZ8nPTsg626yQMZ6ur4rpnx8eGJPdjS11L8nIMl/fx9lWSSRqE0Sjbm/nlJEIC9/Lk4K+CsU05kw2nbMz0rou1a8B+U6t5Mik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=yonch.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=yonch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-3c97b52b031so1142169fac.3
        for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 11:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760725022; x=1761329822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cINqQqiT3g7xyevR8+vmcEschd9JtkqaiiAdm399BSs=;
        b=iaZ1bbn+7Ck6yUw/QdCHAzDQnNawaU7rmIfTdMadRsej6WyM0+hHm9GbVuff2NL9wA
         ZTSTaxPqc0miRpT5belK847Silg1Cvh6QC4/OAb3gzctpHJZdAJjaJDudXO/e69Bb34w
         ErQSZBVWge1NRdzWSX4mZBUSVwBjUBtJ4ezF8Y93rtGw24TB0vDmV0cj21eCd3Sk/SGO
         flax84lI3HIOvoX6Rms5IYLnqV56j1GmFwaO5YG5TNYuuvBDvP0Stuz8Xa57fAEObK7p
         SKe5I4zRfcUZTvkhafbnMQeAiWGAoLyiZBV8s7BGNi3GiJ2Ezs3GIHBq2r8oIqnoBVoU
         9Q0A==
X-Forwarded-Encrypted: i=1; AJvYcCXdZ88+wCuQQ2gG0f5IUY3px65Pe10J0t+dD5eO+MCkxKOeZhfnaHwwJWhzu7XBIpdNEb6tjmJL/bw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKiUYXKElKmjjqloyoiDTC6domFkm1rsxq9F51Pj9at4JFsqpX
	71PE1Q9HPCMjatP0AVNZTN/iRL3r+jLOBSQx9OFpy5tkun0nCvB5ZtxI
X-Gm-Gg: ASbGncvclozOtL63dqy+urlHE+5CbbA9aeNScnZoEDFVMK/Ou+gN0ocgTiakfqlYKkc
	tafbQiHZlPW8VvcRR0FxFb48ZhMYUPqND6ij2/KMaZPhvgGSDnk3ht+LgF4XpManQy6HhLf1jG2
	hqDK1h5Rc8nng4Z8nXsNPAZUaciEaserY11WSHrx1jyAEtA4wjhsjI53uk//OmMojsQpTMUgiin
	Bk30EwNjDMuxrmxtT0sLRWynC0ig5tF1gikIlydFGPdw7klByREp48xsTrtu7mbeL9KI8KvNo1x
	G/7bFe23PwimOGfvYgIdjAM5tkf0xEaNd6zE6qXNc4TD1x7i66YRHVp5cY9cwrd+vSm3qke8Dg9
	47nXpsG9bep3+/w4mrEsoQkTQTpHMB5/uOXYygiZGVQ+fn1/AjSLXej+6eV3g5VD/ZpW29YuCWu
	p7BYEIFXHtE4Svv4QKFYA2qTi2K4L+nXs+ZiGv1j7XLmoxoJUDilYfs+bvwFJUxdiihRs=
X-Google-Smtp-Source: AGHT+IEkYynijOfioNXgVBL/J+ORYFf4SqheuHgsScwjHWbPv0aCz+9813qwbla3Zfgt+qTr9snjaA==
X-Received: by 2002:a05:6870:71ce:b0:332:3a47:9a05 with SMTP id 586e51a60fabf-3c98d0ac503mr2005539fac.26.1760725021852;
        Fri, 17 Oct 2025 11:17:01 -0700 (PDT)
Received: from localhost.localdomain (syn-067-079-108-173.biz.spectrum.com. [67.79.108.173])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3c9aefc4f9esm75178fac.7.2025.10.17.11.17.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 17 Oct 2025 11:17:01 -0700 (PDT)
From: Jonathan Perry <yonch@yonch.com>
To: tony.luck@intel.com
Cc: yonch@yonch.com,
	corbet@lwn.net,
	james.morse@arm.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	reinette.chatre@intel.com,
	romeusmeister@gmail.com
Subject: RE: [PATCH 0/8] resctrl: Add perf PMU for resctrl monitoring
Date: Fri, 17 Oct 2025 13:17:00 -0500
Message-ID: <20251017181700.62980-1-yonch@yonch.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <SJ1PR11MB60837F4BB475207D990C8293FCE9A@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <SJ1PR11MB60837F4BB475207D990C8293FCE9A@SJ1PR11MB6083.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > > Motivation: perf support enables measuring cache occupancy and memory
> > > bandwidth metrics on hrtimer (high resolution timer) interrupts via eBPF.
> > > Compared with polling from userspace, hrtimer-based reads remove
> > > scheduling jitter and context switch overhead. Further, PMU reads can be
> > > parallel, since the PMU read path need not lock resctrl's rdtgroup_mutex.
> > > Parallelization and reduced jitter enable more accurate snapshots of
> > > cache occupancy and memory bandwidth. [1] has more details on the
> > > motivation and design.
> >
> > This parallel read without rdtgroup_mutex looks worrying.
> >
> > The h/w counters have limited width (24-bits on older Intel CPUs,
> > 32-bits on AMD and Intel >= Icelake). So resctrl takes the raw
> > value and in get_corrected_val() figures the increment since the
> > previous read of the MSR to figure out how much to add to the
> > running per-RMID count of "chunks".
> >
> > That's all inherently full of races. If perf does this at the
> > same time that resctrl does, then things will be corrupted
> > sooner or later.
> >
> > You might fix it with a per-RMID spinlock in "struct arch_mbm_state"?
> 
> That might be too fine a locking granularity. You'd probably be fine
> with little contention with a lock in "struct rdt_mon_domain".

Good catch. Thank you Tony!

We might be able to solve the issue similarly to what adding a per-RMID 
spinlock in "struct arch_mbm_state" would do, but with only a memory 
barrier (no spinlock). I'll look further into it.

-Jonathan
