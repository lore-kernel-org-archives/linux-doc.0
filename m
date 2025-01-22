Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4691B808
	for <linux-doc@vger.kernel.org>; Wed, 22 Jan 2025 18:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737568905; cv=none; b=nUEo+FEL59D9DoeR3MqQ1XV2+jL8U1meXBM/na6LbXZHSOh0wvAs7DX4syG3AE4cgUMMVi2wZcQ/KZRjCWPwgDeEet23nC8eypMHLgpURDtJNf8/NaE7jJfpUFItPYRE49RXHPgKRQ2c0rS5tmiwE+RB5ChHOuj5Rtpp1taDqD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737568905; c=relaxed/simple;
	bh=Phe81qI9iMw4UUpCRxadIHSys5+yaSYjlXS3n6RqgCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pMNciWM2eohAHd1P3xc5pnOsCw8WmNOpJKXwmUpnGLT6xGbe09Ql01/Z34KWIRfq2EddpnD4FI2/Uyrb9O6bKLSfGX0giDN9L2TUrhGJ6OvMe86Xd+fBkrxkkpHFYAIsbJedMqXWlA1EutPmHnMpekRTVgXJGPBf+9z2xiSiBVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=BRD2LGJv; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="BRD2LGJv"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7be49f6b331so665487685a.1
        for <linux-doc@vger.kernel.org>; Wed, 22 Jan 2025 10:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1737568903; x=1738173703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jmIlbgV3Hecq7oeRjm0yUIVGWs0+HJXd/BMQI5C4vVo=;
        b=BRD2LGJvb8GNLidBB9qpa/oEzmjfXI5hFe8DGWy/vsCYiaYdk4rIIcez9QVNjqdAA8
         pTMhB5PHMf+FAK+G3TfH8p3av+swjvaXxla9IY1v/K3IGcRYFjxJsino3+4m3CWwY3gp
         W97zu3WR4F84By3PhOhIP+7RctEROGv933UIYbuzummcyp2stW7gkkCrUpVdTPNJCA4m
         ZLFViJ6Nl9SPslnPGM9SJaUrEjNAR/Ad4DuD7vE4k6t3UaWBlBMF7631USVKBumYvvYo
         3ZUtoi+1FJLu2sv0Hy8ijjMps3eBNP7HPjR+ceYTZMGQOw55c6ELq9F2SYT2qlp+Duaf
         8Cag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737568903; x=1738173703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmIlbgV3Hecq7oeRjm0yUIVGWs0+HJXd/BMQI5C4vVo=;
        b=HUCE2z7Pahsi4Pdxwr1iWP7eK85iyfQdXiB/eQr/2shMk+BAcHCTW7JxCofucWWdwt
         FmPK/dDNI24CdZbbIYBtdAUItzhCvMJVWdGivBnTsqodlZ/4Q0WLZC5QQyRIwQ1ZFNv9
         PAAE+klSsorOpJKT6PkhoIEnV55z3lwSkCgbxJy302XnwbSV37jnoK8XNOJRRXRj0mlL
         z4dG/NKMYpEdSlrkVk4FFJrdzAKOmk5nI+3EljKuDT5J8kIFlxaOYSizM2nog1MEcZ4X
         EwYJJ2RLHB5l1vrpTMBcrJqyEWh7VfIxuYXIyF7ZzJWgARvupZNf/v5qz9n6F0/Yylsg
         9W4A==
X-Forwarded-Encrypted: i=1; AJvYcCWaWLuXK9kBxby2N9PQrO5FZtZp7cP8qZ9YJtDbE+ZkjAD9vR2NkoQR7xFSDLtQ57DAwPHl7rtsryU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjHq2XJW+eDUu88iurcxUEP8KovoUBe1H3lOZokK6/Z3tuPEjx
	2J3Hw60ee2b4jDzHWe2Qn2LCEqnZK37VDBptPMuolFSARyIG6fXxWO4XXuTa2PE=
X-Gm-Gg: ASbGnctzt2EiWN07LHOVlT1I8YdRSiBgvGytpcqYPiVdvcHJAYdSrKWBzbxLoxzqn+g
	6/rLnVczuIgK76RMOU9PWgYaDOhBXXdTZeiIbcGHyJXtmZuqztXNtBe1jTYbi94alltzns5+gGD
	B9ImxtoUcRcL4YaxlDUZ4hT9deXNqv2ia4ApLgpHOy01tid7/gThA2XMX2vP4HNRRb8Jkr3VM1/
	ZxsWOuhqIxhCbBp3D6Co2kiFzPc4nhIJPZYUoqU0uyThKPQz3DJ6SRPoN6PH5cQHfU/SlJDAZ6V
	bu9pe/ddpECPCKdRgxiUpz544zN7GRdK7Y03D6oSBGgIM58VJZUC
X-Google-Smtp-Source: AGHT+IHqa1xKG/AqmiY+AVDYMkRXO1guViKVB1zN+6qWK7JdtV6orWLAGz3awoN7Gr91E+h+yvFO0w==
X-Received: by 2002:a05:620a:410a:b0:7b6:d870:ca2d with SMTP id af79cd13be357-7be6321be51mr4107036285a.13.1737568902893;
        Wed, 22 Jan 2025 10:01:42 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be6148054fsm685446285a.45.2025.01.22.10.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 10:01:42 -0800 (PST)
Date: Wed, 22 Jan 2025 13:01:39 -0500
From: Gregory Price <gourry@gourry.net>
To: Bharata B Rao <bharata@amd.com>
Cc: abhishekd@meta.com, akpm@linux-foundation.org, david@redhat.com,
	donettom@linux.ibm.com, feng.tang@intel.com, hannes@cmpxchg.org,
	kbusch@meta.com, kernel-team@meta.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	nehagholkar@meta.com, nphamcs@gmail.com,
	ying.huang@linux.alibaba.com
Subject: Re: [PATCH v3 2/6] memory: move conditionally defined enums use
 inside ifdef tags
Message-ID: <Z5Eyg58jl8YqkU_j@gourry-fedora-PF4VCD3F>
References: <20250107000346.1338481-3-gourry@gourry.net>
 <20250121043355.177611-1-bharata@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121043355.177611-1-bharata@amd.com>

On Tue, Jan 21, 2025 at 10:03:55AM +0530, Bharata B Rao wrote:
> I don't think moving count_vm_numa_event() to within
> CONFIG_NUMA_BALANCING is necessary as it is defined separately as NOP
> for !CONFIG_NUMA_BALANCING.
> 

NUMA_HINT_FAULTS and NUMA_HINT_FAULTS_LOCAL are only defined if
CONFIG_NUMA_BALANCING

include/linux/vm_event_item.h

#ifdef CONFIG_NUMA_BALANCING
                NUMA_PTE_UPDATES,
                NUMA_HUGE_PTE_UPDATES,
                NUMA_HINT_FAULTS,
                NUMA_HINT_FAULTS_LOCAL,
                NUMA_PAGE_MIGRATE,
#endif

> In fact numa_migrate_check() should be within CONFIG_NUMA_BALANCING as
> it should ideally be  called only if NUMA balancing is enabled. The same
> could be said for the callers of numa_migrate_check() which are
> do_numa_page() and do_huge_pmd_numa_page().
> 

Really what i'm reading is that these functions are in the wrong file,
since ifdef spaghetti in *.c files is not encouraged.  These functions
should be moved somewhere else and given stubs if the build option is
off.

> Regards,
> Bharata.
