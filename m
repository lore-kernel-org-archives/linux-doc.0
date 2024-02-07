Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89F7134AC
	for <linux-doc@vger.kernel.org>; Wed,  7 Feb 2024 04:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707279731; cv=none; b=rO+ud+6Qg9ig3jzKmhnvDsYWn3HkpeVkKq4L20FRPCoCFCZuMioW5d51hm5Rc2RlUg4Dm3H0azVdQjcI3OWtDCc+1lLarLlMC54jFNuaTQ3W6EmfkuZEmkJ1SIAF+tjmQWzxFtxvqbqY+mTTUGIBL8/tcBnDRKWLIrj2dMLc0xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707279731; c=relaxed/simple;
	bh=9VS6dX3vejT17HLI0RS4sbhWiyTVkZ69bwjNPvcSZcc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ju/SvtvNdheleEhrh2onyaswOV54BnJNPBZHS9yWFJT+IR2WRxnAgkamZkEQ4uF1W+828Uq7CgIF/CyUDOzUSOlJAni/ooAGt8N1QUOJ06NyH2/9M3RYOEe4gwg+IS8ReAznaMFwgbPLUm1aDALUDJhS545K5CUcP/y4/CI+5S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ntYdyWVP; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ntYdyWVP"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1d9c1d53de7so2790065ad.0
        for <linux-doc@vger.kernel.org>; Tue, 06 Feb 2024 20:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707279729; x=1707884529; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UIV0mbrXPEMDte4kg2qFs+Leb8e4ZrEXg++2dGUvO/A=;
        b=ntYdyWVP1MEfLcLN8EE/MIxLKwMBZqR1xdEHoyGZRtJodODpZhd2iSw/16BBjyumg7
         aA4slRjThGELC5a4VqIJNofYhuthfOhFfUxYDQsleb9N76Ogb8d+WktjY8AY+kMdALuG
         W6862Nwb1w8vIBiHFJmT3Sh/YJDIAre09ukjr4lciSsjma12sAy9ieOK1HFuHGsgOD1u
         uX3jJk4qxqNSx0DG2TdokCR90NuoVGLvbzSIu/gpxUKM1fmm8/jrYNW4HTaAi5oZUwOE
         tAyBLfJjRH7m9pTq3rx3snImAMEEOQcbdNWlHMpN4+PS1OLTuBIxQxmhGnDeJPCtEdhO
         /ulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707279729; x=1707884529;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UIV0mbrXPEMDte4kg2qFs+Leb8e4ZrEXg++2dGUvO/A=;
        b=t9C6KdSiQm25yubEx4FDID6GnL8islG/W84zze8Ma6faQagilKcfc4V8zCvVDq7M0o
         tpqUflGof3L0MCb2itjWt4t0pCawWBPaSrzL7P9XeOK8DkfT+qfXULyhiB6KXutWH34L
         UqKnDNqB/5upVmBF1IOSNdvAOsd0Aofuy52MnyM5+1DFljuBnRrFuYbkiyE+3zhfM6q3
         gDK7A5rLuDMpiGFjqHSnTrxa31rvAz2nPKR/uSH07BscakLRplhwHAvwD3BqlTFak2VX
         WTdKOGcDjHCP1zAYka8NOcjDxEY2kbPHWiGmVRgxM7k8LDexX+SfXd0C3aKvyMnck6/H
         rang==
X-Gm-Message-State: AOJu0YxccXwGm5Nqg6MDLIkzTy09SF+c/exqGsanW+zHGpjItcUx1pv9
	yA0pGaPTPY2hXIxB+FKeMWUyTvKI8Vn1s31X+MvOBHRM4hernA2NeTlTAO0daxiKJOep5ZeEpSG
	4fg==
X-Google-Smtp-Source: AGHT+IF2jG6kLrMaPXZQm1JXIhdeLR4SvrnjVMMzjgLIFlT89OV2ZEWImiADQAmkUtay2rkJDPFqiz5yycw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f90d:b0:1d9:5928:6895 with SMTP id
 kw13-20020a170902f90d00b001d959286895mr9675plb.5.1707279729156; Tue, 06 Feb
 2024 20:22:09 -0800 (PST)
Date: Tue, 6 Feb 2024 20:22:07 -0800
In-Reply-To: <20240115125707.1183-19-paul@xen.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240115125707.1183-1-paul@xen.org> <20240115125707.1183-19-paul@xen.org>
Message-ID: <ZcMFb1epchA7Mbzo@google.com>
Subject: Re: [PATCH v12 18/20] KVM: pfncache: check the need for invalidation
 under read lock first
From: Sean Christopherson <seanjc@google.com>
To: Paul Durrant <paul@xen.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, David Woodhouse <dwmw2@infradead.org>, Shuah Khan <shuah@kernel.org>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Jan 15, 2024, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Taking a write lock on a pfncache will be disruptive if the cache is

*Unnecessarily* taking a write lock.  Please save readers a bit of brain power
and explain that this is beneificial when there are _unrelated_ invalidation.

> heavily used (which only requires a read lock). Hence, in the MMU notifier
> callback, take read locks on caches to check for a match; only taking a
> write lock to actually perform an invalidation (after a another check).

This doesn't have any dependency on this series, does it?  I.e. this should be
posted separately, and preferably with some performance data.  Not having data
isn't a sticking point, but it would be nice to verify that this isn't a
pointless optimization.
