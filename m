Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237D13DB33F
	for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 17:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433018; cv=pass; b=SLeALLM+fSsa2Gg0DfZ+3Jrq1mSyf9rJahBESB8I/AeoRzKk2329tqvXNokxs5vJgYITR16qM6PrjtbLxog5TerT63VDIyUx/LzgOmJCEMowMqtIayVKh76vqNEX+DuxyzFl87ug7hQfu3aXIT0ZpfkpmpcI4jeHSIcDSgzU1a4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433018; c=relaxed/simple;
	bh=bEZVfjW3X/ZJJhJsMcL2gQZGx4De7c1nlF8QDVmWlMY=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ph4jhesV4vw7SoHWQt04Jo6VoAzThS/2qcBbPGp46W9j2Qg2G10lVm0U9AEx4T9im3X8BuDF++8X2l5Vp4hV3xGJDGwMzctIVYk5or+HN/ZRFM7GcUPCc3p4pWw/lw76nhZf+dS/kl27LYH7eGkurGhxGNX3RA/qJKvBSltkGnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cagJfX0F; arc=pass smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cagJfX0F"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso31878a12.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 10:36:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785433016; cv=none;
        d=google.com; s=arc-20260327;
        b=m6CpQzYvCuAx7iH2Ob7X97c55+0LC+sJ09IKmVMQ84t1lq2C/1/Vtne3NHOCONwnWJ
         OuJ/jO1GMNdFbbfNWMrrzlE29nZusq4hKpmZaJhxc4r8AVWAuH/E1uDxzGDnn6iNoWwq
         zOcnlWsKQLoKl2CvEBqTQwJ5cSnFWqYIyylKYURAI9CiLh+UjX8u89EQWbWHRI6M/pHd
         WSFLyTFB4bnFiRJF7f+L+h9EI62WS+oqb2BTze7cB1kgQv8ubzyN51suobBBYU97y/jQ
         7JJcFu1Nl4aPqPHmjwffDPk3/h61uijjz3f7XWCWjkTWxJ6g5xisvikc6Ik+nex0HMNj
         qGGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=cF6Glwk5JHPcXFLYP8vDOSrow7Ekc+sBztL/w45l/K8=;
        fh=Ti6UvyhYbAJdrDhOvfGoJ+ozeiBmowRklfuVHtOfJ4I=;
        b=bssXZXsZBUsiJSukbTrPuX+wUVz5Ficd5RL6/kSkL2nL83yCx0hCFpQlDaCbmEzgPF
         2H9++10DNuIqg5j7tqeUsbyQxZMwiAqy4mTcOZWFSUdAibkYGVuyJbmivVVWexP3r1/Y
         0+tyXvEA8a+phrvYsoK+DeaM/AqbnPL6GHvMdTbhwjCeX8Le9DLItTm8Vc9lkxlYDic/
         Ref7b3nxKF8xPDojzujbnuRvxIfRB8XR3CK95c/YEW3v5Z0Vf868u8tp6WfazL5E3UuP
         ZBDvxWjMCsNpOzitIwNbzGOdiyXVQmn29hxfZK2+CRIlZgSnFh8E1ywBX/VB20znBVnV
         ZLBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785433016; x=1786037816; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cF6Glwk5JHPcXFLYP8vDOSrow7Ekc+sBztL/w45l/K8=;
        b=cagJfX0FCSgk1ujuaijcW4jPR/t8fGWlyob+Gx8vyrAs18Wjrm/zgCJCz4fd5qUFYl
         d95wNBU20RdJe9VwhCkD9FRzlgChn8vRXrJJlxoBkTzaO+61XDz8ticDicbtZdyTP8vS
         EwzWdbDOk1akmjDje7XW3iX4NKCec3drxMv+LKHJFLBxTcVnFBBb2LzRLQ4qcpQ5/64r
         jgsxwUTpw7zQcs85u+bsR0TG2udwHua8VZealKkm1IA8BItSYdFmLMfrOITwvFQ8BY8k
         ykTxQyKuk35OUGY1nsMRUP1sNOTx8QEap+3AqMtr2wAyQV1h1PtXzWFqCDnJF8/RJJYs
         OJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433016; x=1786037816;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cF6Glwk5JHPcXFLYP8vDOSrow7Ekc+sBztL/w45l/K8=;
        b=QWwO6FTiNuU5HWiXzW/9HO+2dO/QRBZRnici3P73Mr89sJaZpbcI4lYMe2YcVHBjNK
         9IuXGhCS5Ye20vN+2fEOorUMS2sX48UER3PEndrnQvT4ftUMDhaihG3034TzzGW8E8zK
         1vFTdbMnkwEt+VgXftkJseahTacY6uqKh76RbA99MP1fGmSPyjCyZVzaQEZEH62xZo2f
         zqIDAI58cOxuw6lozbw7xPMMTewkNucWHmozURCFuKFvch3iWwFavF5YMf/z5E56R36k
         354xMxmAdVwOv9VDr31EZTvdWuiXnHuWawx36Hy+vLCTCd7cyOA/RVeXS3cg/z+sOyaI
         5cbg==
X-Forwarded-Encrypted: i=1; AHgh+RrmxNa+mGcu8Wgnf00SnbInJWi4sr6EnRfGHQIP6/qM2/cYzbJxR6/YUNPzT34mp7GXjv2u/LPSx6U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPgySILshcX5Eb6QOZkoDGvTwy/kkLnIqIyLSn6pbFem+qUu4Z
	7xLFSQTx4rvbjPwJEpfmCyYmj9f+1xaTBH1SRuCmLPJLnMJmQt2xpUo8Plp+DX6JB6bEuygBOXn
	lI9JsdgYQWzfZznsCn3Dqr4V2Dus5kYXFJOestzoK
X-Gm-Gg: AR+sD12H54r7tNwMGMCGhN/hUc+ywqlCbB6V2DDk9Seu3UapdazGSX7a7AizHdq8o7c
	jaGlFVA3O5afPmVSF/xP7ZbXzatTTsYqD2V2UR4xYNlhQilyRqN1wSX5wa6RfDAruy5pRqZit7I
	eltfMorRK7o74V9knTqv8Z1IzWkgDgArRSNszE5XgWHzsV5wznLcCfdlFg4ciI3Y3V+KlzongwW
	SrUNx6XZ1wXksyn4gI/Xgi/PqY7p5u2QMahjwN8MYO2nZ8+c3uCUh+4XPkKDalqpn4eXAeN7me4
	m2D+BnGB70g/4D6uRr3QP3ePePr1D26rb2vwenGE/hmH6pwSTi8cn1QzlXV9AklBl3Llu+Ze4+u
	mVS4Lb7AlRO+9DxGDLtDMZOlQiFjzCtXv/Q==
X-Received: by 2002:a05:6a20:d805:b0:3c3:8651:b302 with SMTP id
 adf61e73a8af0-3c90072a2acmr3423693637.28.1785433015659; Thu, 30 Jul 2026
 10:36:55 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 10:36:54 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 10:36:54 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260728121138.1103610-3-tarunsahu@google.com>
References: <20260728121138.1103610-1-tarunsahu@google.com> <20260728121138.1103610-3-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 30 Jul 2026 10:36:54 -0700
X-Gm-Features: AUfX_mwFoYwitx3VhlqJDH1-k0l0ItJ6i-x625ej1dYBsVgzkh7R-MZiFMgMH5w
Message-ID: <CAEvNRgGazT2D-G7sEem4RD5nUEj7dmcg8vx2=3bpatS_o5uE+g@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] KVM: Introduce kvm_create_vm_file() helper
To: Tarun Sahu <tarunsahu@google.com>, fuad.tabba@linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, seanjc@google.com, dmatlack@google.com, 
	Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, david@redhat.com, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, sagis@google.com, 
	Paolo Bonzini <pbonzini@redhat.com>, Mike Rapoport <rppt@kernel.org>, Alexander Graf <graf@amazon.com>
Cc: linux-kselftest@vger.kernel.org, andre.przywara@arm.com, 
	michael.roth@amd.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	will@kernel.org, vannapurve@google.com, maz@kernel.org, fvdl@google.com, 
	kvm@vger.kernel.org, oliver.upton@linux.dev, kvmarm@lists.linux.dev, 
	alexandru.elisei@arm.com, skhawaja@google.com, aneesh.kumar@kernel.org, 
	linux-doc@vger.kernel.org, David Hildenbrand <david@kernel.org>, yan.y.zhao@intel.com, 
	kexec@lists.infradead.org, suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"

Tarun Sahu <tarunsahu@google.com> writes:

> - Move ITOA_MAX_LEN to kvm_mm.h for reuse by upcoming kvm_luo code.
> - Introduce kvm_create_vm_file() to wrap kvm_create_vm() and
>   anon_inode_getfile(), providing a unified VM file creation API.
>

I think these should be 2 separate patches.

>
> [...snip...]
>
