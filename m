Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3631403EB5
	for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 09:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636030; cv=none; b=EdxgMi5VoWpTvPPefrFLSe957KwBEIOa5y8ahKdIk/V+wa676/WnvyVWun65hzMyUF2VNLYiLQ5Zwt3Mh+Yfy27rAe4DET5JzI/jTzDbhBZ0nB8WDNomnR5KuzkS13xI7zHwlaQuad3+qYpJsrqxKVoXGmn22YxrHhL8vAN+L4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636030; c=relaxed/simple;
	bh=W6DTvRWLmpIsiFAlB1cla3wKAoWr3XT+ojA5ZsdvDrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=opqf4QmcRjt6tDL8AqhjcvxLsJNx/kFw73YnKd971Mj8JURNSnn0lp10oKMn0X07OEcx9g1z3LBXAXCI2wu2NZKiHpU455yI15ZmujBsCbPgmpiChDQiLCwzfgjzQDSvZlk6T2xHzw7Ita4ciQKcUljzDTJ78SlUzsbORf00I+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cG4RECjJ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cG4RECjJ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso2360325e9.0
        for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 02:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789636026; x=1790240826; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jxbi13ouQTHyRdtBDlCDYfBDO36J/sfcBmF9VRStXnQ=;
        b=cG4RECjJ17+bcikV0X96lOtKHY1cwuunqUHAZoRCAMND3KD720QAH1vMtZtugQD+Af
         j+Yvio1WMCimAq0c6ZddZ7iaNLcyw3Uy/3PTSXn8Mwxu8cXX+bzZLCNGLgew4KSEfgWE
         Zs48XxpUB6AGZEhQ1YgcC4Kn7LsW7w7f6QJdvEiJq/IkagyixJ0WzbMhTZKZUqGFiDMs
         wdupwHSS8DMXoiDm9IFl36L2//M3W3XXfnE9WHb3WQk2+CO/drpHrkOssnjve7RScD+U
         yQnTPdhcmPAu3Dbgrkiv1EGr1sPVoGwnGA5PCXeeltKi4HlYqcmZfzMDo1YulvM627Hh
         CGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789636026; x=1790240826;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jxbi13ouQTHyRdtBDlCDYfBDO36J/sfcBmF9VRStXnQ=;
        b=Jhx8iKuisdxpsj+2M85v5QdCIwZrjSkcFHjJmDl1WoSzty/6gb0owNG9+XYI3/THum
         znerDKKb+29AvFNuybvTgSzRIeJ4Q2fIu5mKQiq2oIGPMWOaB2WN5B79H1eMr4ciXg++
         ffJsUUVxMjaHDQhShU6S7n2I55o3dLtlqF6k15s/93Wq2uYneuSwlubdvcBLNenwkM6s
         ypOzJLiDg9U7lTo7kIS7YlZLB50rAhrjRtB4+4VU5axIkg0d7zkVOg5wxeCr6mKKbloR
         dANJefnKqk5Nh1g/Kou5qNDhdUk1uBVJdYSByIZQxHvx7M0aAKRaAv2rF5aet702Ku54
         UkSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxs/uA55St3rJNqWfi1gY5hZFEvQyhmoYq4XztzMUA1uIQWhOnnRe/bTIzwb5FXRctVm4chTrSrE2k=@vger.kernel.org
X-Gm-Message-State: AFuF++k6KJBOYLQ3a1NcBTnpFiTloi6dfKAh85rVVzyzfxXH+cp8E2u7
	1nnr/MUXLwXwVghIGIyb686ICxDrfB6w6iPdZB8G38+QdYWgC1ULCLfq+T4cOpzQBbo=
X-Gm-Gg: AYBFou119Tp6aLK2mml1P3+BPQWy2PTQTHCvOe1ju2LMnJ+5Q7DdaBBZZ9IJA8zPkqy
	Il3dpLTc34LCwhwKmdKnZwTcj0lmMJ57lw3ZutSzd2mPzZGoC453q7BZAnXZgWRB0TPX5WFsUHZ
	H7t59bGAUplCiUTZBnLNngzhakgg5LKPRStEK9k8t9bQyRgPbOyI09sl42kp8mJuwI2hy9kaT9/
	72AmIIpxTFK3NhN4vWMFNItmzDgQUA66FU98tXwhDW2hcm/K3iuqKrynDZze22GoB1xcmNqPfTk
	jlnVbhXfGvrnlPFK+y7Wd6yTrqnnxKmfElQmjHU1rqdhKEhdYlAQyb+h8jpaRuRMxGmW9zsortQ
	CPFt4nrImMPbmrKTD2YViIRGtL0b7QmEm1t7LBuoKm8vcpGkvTi9tVVnOIeebBK1EsRLWSBIHZg
	PuVjnTvy6CTQlo25wFILOLteJTNfPcEL/tzj6btjcfMSC5S8wM1bwTyJbGShRn7KsfNd8WT1gU
X-Received: by 2002:a05:600c:e555:20b0:49d:27ee:79c9 with SMTP id 5b1f17b1804b1-49fbd1c4afamr25264695e9.8.1789636025806;
        Thu, 17 Sep 2026 02:07:05 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fad3sm12476177f8f.12.2026.09.17.02.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:07:05 -0700 (PDT)
Date: Thu, 17 Sep 2026 11:07:02 +0200
From: Petr Mladek <pmladek@suse.com>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Borislav Petkov <bp@alien8.de>, Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org,
	Joel Granados <joel.granados@kernel.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH v1 4/4] x86/vmware: Run panic diagnostics before kdump by
 default
Message-ID: <aquttpMVKX8e6zGB@pathway.suse.cz>
References: <cover.1788414671.git.zack.rusin@broadcom.com>
 <7487011dfb95aadda9515b22a5852680df1982c5.1788414671.git.zack.rusin@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7487011dfb95aadda9515b22a5852680df1982c5.1788414671.git.zack.rusin@broadcom.com>

Adding Guilherme G. Piccoli into Cc.

On Tue 2026-09-08 14:07:16, Zack Rusin wrote:
> The core panic path enters a loaded crash kernel before running kmsg
> dumpers, so the VMware logger cannot preserve the panic in the host log.
> Set crash_kexec_post_notifiers during VMware platform setup. setup_arch()
> runs before ordinary core parameters are parsed, so an explicit
> crash_kexec_post_notifiers=0 still overrides this default. The 0644
> parameter also remains writable at runtime.
> 
> VMware exposes no capability bit for this behavior, so the default changes
> for every VMware guest. Running the logger first adds work to the panic
> path and can reduce kdump reliability.

AFAIK, the quality of the notifiers is varying. Running all notifiers
might reduce the kdump reliability even more.

I do not like much the hack with crash_kexec_post_notifiers. It is
an all or nothing option.

Also it was introduced as a quick hack so that users could decide
what is more important for them. But it is not longer a "user"
decision when some platforms enforce the ordering because they
depend on the notifier.

panic() is problematic and it is about compromises. And we need
to balance what is important, what is safe, and what is optional.
This is why I suggested to introduce more notifiers some time ago,
see https://lore.kernel.org/lkml/YfPxvzSzDLjO5ldp@alley/

Guillermo implemented this, see
https://lore.kernel.org/all/20220427224924.592546-1-gpiccoli@igalia.com/
But it has stalled because it touched too many subsystems and it was
hard to get an agreement.

Maybe, we should start with something simple, and introduce
one more panic notifier as a start. It might be called either:

  + "panic_hypervisor_list" because "crash_kexec_post_notifiers = true"
    seems to be primary set on hypervisors.

But I would rather make it more generic and call it

  + panic_pre_crash_kexec or panic_pre_kdump because there might be
    more notifiers which are either 100% safe and useful or are worth
    the risk before calling crash dump.

We could put there x86/vmware notifiers as a start. And we could later
move there other important notifiers.

How does that sound, please?

> A full log transfer uses 1027 low-bandwidth hypercalls; three checkpoint
> attempts are bounded at 3077. In vmcall tests, a maximum-size transfer
> took at most 7.47 ms; three complete transfers comprising 3081 calls took
> at most 21.58 ms.
> 
> The crash report remains suppressed while a crash kernel is loaded because
> the host may terminate the VM inside that call. A future report from the
> crash kernel or kdump userspace can restore the event after saving the
> vmcore.

Best Regards,
Petr
