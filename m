Received: from mta1.migadu.com (out-32.mta1.migadu.com [95.215.58.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FA6376A06
	for <linux-doc@vger.kernel.org>; Sun, 11 Oct 2026 07:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791703587; cv=none; b=UjnsKVYycRzc801Z8CCD2KJqhcN1cOBoPy1XpQMiHLgNBJ7OyZCG/PzEijM8HLhJyHlAGgq/OHbW8zaji41KJLOfdBfR10sUXxLxoSxD/9jnfWCTSa2G5lMNhJMZTI9KR84NQIFO81vdSb6e3872oSN55l35F9AufeuDg3w/Tvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791703587; c=relaxed/simple;
	bh=zeYhOKLAEK6plYt1ei/97MDQNIKutEUyTKAyLEF+q9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SrDB68VQnCR6ffK5kumYhuaijbWL47/T7YY6laxiKNsDwG/GIVLHtHVkhvvkz7PPDEuX0bw2tSIQ2+hIi5MWim5+wiw/NkXpY58kQFpsaayl8RFooxsjHBBU26WsRk1PJwRDXZmmwhxgH2leAQS/f8e8CUHUTBbpVxStlXbzzZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VO+EyQMf; arc=none smtp.client-ip=95.215.58.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VO+EyQMf"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zeYhOKLAEK6plYt1ei/97MDQNIKutEUyTKAyLEF+q9o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791703583; v=1; x=1792308383;
 b=VO+EyQMfkdoCAzZRmZ8Q1gzeNbt2A1w1Qihdx9B6DOJ0ha5zWAz8ayJz5O5gcYCqEFXXoa5o
 5ulxgtOWHUhYpFPOxVDBF3wyfeRAnt9hbhlCjaweLu+Jvu4vQ321wKPL26A6vRMgYtUsAcIVcbN
 wa0IwO3jWcHI564/cHO74XrM=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d16cbc721758f4e6;
	Sun, 11 Oct 2026 07:26:23 +0000
X-Mizu-Trace-ID: d16cbc721758f4e6
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5ba40832934so2451e87.1
        for <linux-doc@vger.kernel.org>; Sun, 11 Oct 2026 00:26:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzF32jNkm2wM1WCDCUdZ/LGPPyR37OCTgdaYpkUDSXcYZYhFevsDPpbtax7wWjtTbcQ1FTXGNqf5io=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2/c4o6eUpLQzaeK/xBLe/GN5z7lliL4cQIwWjYPTzn6smxQ8H
	Dzbx4gVBk/3sH2czIT3PEWxzYyGYWnxq5W44NztuNttYguKhEUsxvVRxigNzd/NEpSHcp0kTDsG
	ahUzEPTbtt4f1EyPqb9nQKUbTiQF06VvNjPQQpJH9
X-Received: by 2002:a05:6512:3b11:b0:5bb:ff6f:b4bd with SMTP id
 2adb3069b0e04-5bcea610359mr46362e87.14.1791703578480; Sun, 11 Oct 2026
 00:26:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928152507.2116110-1-fuad.tabba@linux.dev>
 <20260928152507.2116110-4-fuad.tabba@linux.dev> <k6hsxo35ou3b5bcdo5xiew56zo25c4dmxqocnxszjvuqd7ct44@owruwfstprrh>
In-Reply-To: <k6hsxo35ou3b5bcdo5xiew56zo25c4dmxqocnxszjvuqd7ct44@owruwfstprrh>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 11 Oct 2026 08:25:42 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwe73HZ5u3LWgeYjDC2t1n4aLdwF=r-on5hSzCeTg+WPA@mail.gmail.com>
X-Gm-Features: AclHuK-7n7d2SMrcaEI2aS0U2QLkxfWQsDtE5UfiVO1913-p3Vb7V7WrGlc9y-0
Message-ID: <CA+EHjTwe73HZ5u3LWgeYjDC2t1n4aLdwF=r-on5hSzCeTg+WPA@mail.gmail.com>
Subject: Re: [PATCH v1 03/10] KVM: arm64: nv: Don't loop on AT S12E{0,1}{R,W}
 with an invalid VTCR_EL2
To: Kajetan Puchalski <kajetan.puchalski@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jing Zhang <jingzhangos@google.com>, Karl Mehltretter <kmehltretter@gmail.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

  Hi Kajetan,

  On Fri, 09 Oct 2026 17:30:59 +0100, Kajetan Puchalski
<kajetan.puchalski@arm.com> wrote:
  [...]
  > Currently we just clear out the upper bits of an address larger
than the IA size and proceed, but
  > the architecture requires that to cause a L0 translation fault.
Not that it's a particularly common case.
  > That is to say, I'm suggesting something like the following:
  >
  > + if (input_size > 48 || input_size < 25 || (ipa >> input_size) ||
  > +    check_base_s2_limits(vcpu, wi, level, input_size, stride)) {

  Thanks, I'll add this to v2 as its own patch, since it's a missing
check rather than the loop this patch fixes. I'll add
  an at.c test for it too.

  Cheers,
  /fuad
