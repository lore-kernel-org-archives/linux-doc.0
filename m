Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795453096;
	b=CxYg5Bn6yemKYPw6vOUdfF2c527TNAdJT9wkVFs9G72WSGaDcUWDkNvZ7CEPMEQY+Ziw
	 JrWzGkXl5QeDV8etod9OxNU86QynGGEGNh7jLLS8hjZ6LNhv3pnvdTxuyS5Tb8ym+Hi28
	 iM0WunVimcmBnxDo0T3iRFIjS9spJg1Jj6B+4fPKAABaBj2xPe1KLorSyGz+VfW8FLlnU
	 ySRNbr7mjOikNLaSJkjbHpUuHnd5a9xa38aY7oOC0HYk54OApKWZ7BTUZZbSPLn+hCpRl
	 O755XJNeJIQWDyIAIxL8/bNYtWsfsVSuk2EolrYf+eQOvDKrWz0XuVfmDEk3sqj1Eig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=k8jKBIfQ5nNOWQOY+LEVg9HBdFbaaXrpreLqMbfabtk=;
	b=1Nev7iKGR2KCOG6krGkE8MJnL5YtN31OjhkpwR1X5VUjqZ3OvrnYVTBx3hmdJ6jmxIxM
	 zv9r21b4W9LPfYu1Ad0fITfIBnmjlxMRS+n+pBMf+4Drx06YdZLtUe7St9emNpNC6hYfF
	 5IY915UjuuFMjXp0bsUiRGHqqmzrl7IwpcA4g0WpIV4y6bifs2i8WW/Hg9akO+ZNWUs6J
	 vjv5DeM+U5eFrqaiM9Gnjj0JD5RfzwXwcvPa/C8oVtADhBgizl8vuKxT903a7VhyB7q1N
	 tobR88eo405vVZWE8xPdPqu5sj1W53U6qT/WXkJ0PLaAl6AW5ZWUjIMLTrj5EbgbaaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XGaOmIX6;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF7B606A31A
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 16:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCF7B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XGaOmIX6
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so1958347a12.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 08:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795453095; x=1796057895; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k8jKBIfQ5nNOWQOY+LEVg9HBdFbaaXrpreLqMbfabtk=;
        b=XGaOmIX6sapnbuOR1qSaGlE5t4IfnSGWJp4HhaLRoLFyeMPebugeddMUH4tbJ/1MDM
         ufIG7W71JFr1rF2cdLU8pPhYHbDguMGBWqQOikdBGkz9juKpW/SmH552WXapRw3F5m9R
         UUIBDLaKKcTFHdl7T5JL8OOr7dmTXY1vb8uLWWqp9DR95LtVVFOPYRjVtAK6158447yj
         gVQbFNN7NMZWPHOGsmHbTRZ2WaaA5lGs/yqpUo3NfuYX3vd7x06zwvrxoZpFXhgvfgal
         e1zh755cMHmTR3K/w7UVJMvZtP56zrrcLhmAbEJPynA19k5Zh3V1nvk+Y0CaEWX1O9Fl
         i09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795453095; x=1796057895;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k8jKBIfQ5nNOWQOY+LEVg9HBdFbaaXrpreLqMbfabtk=;
        b=JkI1QCTYiPddCOq37GJB3I+t3YyWESLLpBU29tutbN5gYYkIMag5NGA9Ick+r8dhkS
         b0ZAMQHz+nthm9csccHAxVN0ZjY+/Yp2m12/27qakENJcW6Q0TKI46pZH2DCT8DQyc2v
         cU1l/27XLe6E4y8VUvmK7p2RYVpK7piT5ZQgGEb2u4H28H8JRwEpWmDZWcI40vzxImB6
         btV/Nsw/3m3TlLPcsaIyWBfvH9swwTvJmbIrS2aYuuFlDOdi5ESoEi+RVdn3X6Y4tNYG
         ensGTPkkglFVsclgt8BWWkVDki6LbO9Npq12GkLxnxIxydtsm7oy/dozUEtzX4BIGS5B
         b7gg==
X-Forwarded-Encrypted: i=1; AL+hErFbeVu2ypDBr4FQnkLtb7a/WJQY8tUb8DdTBoAL59iI8rZNjhfF2ez+oyl54oABx63HFgiwC5PHHZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IVCIrmdi8LzawGW8Wsgmg0u+IZJosM+uFhIRYf8CEv4Ky562l
	RKzdqz4DWQ1TeKuPNjjSW3V9hozCXqDufxCAc3COTQVEQDfp+CjidKtA/1qW8yEO8JHRneMAILL
	eUDoNaphiao9euzhC8RpWvJJdImCt5KSEGQ==
X-Received: from pfbfi7.prod.google.com ([2002:a05:6a00:3987:b0:8a0:91b7:e7b9])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:2589:b0:3f9:797f:3869 with SMTP id adf61e73a8af0-4014d359938mr11683499637.47.1795453094794;
 Mon, 23 Nov 2026 08:58:14 -0800 (PST)
Date: Mon, 23 Nov 2026 16:58:13 +0000
In-Reply-To: <20261109215704.1852183-1-rathodpriyank@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261012-fix-aer-mask-override-v1-0-49a0d7aeaea0@google.com>
 <20261012-fix-aer-mask-override-v1-1-49a0d7aeaea0@google.com>
 <20261027230853.GA519764@bhelgaas> <20261028173038.292999-1-rathodpriyank@google.com>
 <20261109215704.1852183-1-rathodpriyank@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123165814.421924-1-rathodpriyank@google.com>
Subject: Re: [PATCH 1/2] PCI/AER: Make aer_mask_override effective for
 injected errors
From: Priyank Rathod <rathodpriyank@google.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, lukas@wunner.de, 
	sathyanarayanan.kuppuswamy@linux.intel.com, ilpo.jarvinen@linux.intel.com, 
	dave.jiang@intel.com, prarit@redhat.com, ying.huang@linux.alibaba.com, 
	terry.bowman@amd.com, corbet@lwn.net, jic23@kernel.org, 
	danielmaraboo@gmail.com, linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 09, 2026 at 09:57:04PM +0000, Priyank Rathod wrote:
> On Wed, Oct 28, 2026 at 05:30:38PM +0000, Priyank Rathod wrote:
> > Good point, thank you.  Would a shorter commit log like the following
> > look better to you?
> >
> >   aer_mask_override=1 is supposed to allow injecting masked errors, but
> >   aer_inject() corrupts the hardware Mask registers with "&= !" and
> >   restores them before irq_inject_interrupt(), so aer_isr() still drops
> >   the error as masked.  Emulate aer_mask_override in config space reads
> >   and writes instead of modifying the hardware Mask registers, and
> >   document the parameter with MODULE_PARM_DESC().
> >
> > I am happy to send a v2 with this updated commit message, unless you
> > prefer to adjust it directly when applying.
>
> Hi Bjorn,
>
> Gentle ping on this series now that v7.4-rc1 is out (both patches still
> apply cleanly to v7.4-rc1 and pci/next).
>
> Please let me know if the shorter commit description above looks good to
> fold in when applying, or if you would prefer that I post a v2.

Hi Bjorn,

Following up gently on this 2-patch series -- both patches still apply
cleanly on top of the updated pci/aer and pci/next branches.

Please let me know if the shorter commit description above looks good to
fold in when applying, or if you would prefer that I post a v2.

Thanks,
Priyank
