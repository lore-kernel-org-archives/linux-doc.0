Received: from mta1.migadu.com (out-226.mta1.migadu.com [95.215.58.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8681A3AC0DE
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 17:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617647; cv=none; b=VYh67kp7FGJ5sthIcQLeY8YHHq5mpUyqQ1e/EtI5aduVE3cUp9hnrkqpRAbSPM1s/DZ/O7674pSM1+Ev1rso2ZnrgjOmPgnGQUpjFqhTScdDneXHWEhcIQlPqpkGZPxcCdVRxk0K2DYKIi5GhxyhlzdR/Z70Jqug9fnBe8e/IoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617647; c=relaxed/simple;
	bh=XyuHMcU9BbS4rZO3qSAgRdBv7BTX7Z9PJ3I+SxV2FeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sTrZHvYnroNbg/JP3WYvp9XLfLoJGPSRXVVjgQ9zMZe+QrCtuGdpuLyo3WfrOceoHOK2TS8bMqkdw8BLJqVlhiQIUevpAAcQUUkl7Kt3Aefit0jwzmqVqHVAocFveEA0tyXZpFnOuVN4DFGN4bGaVbIIv5VmPXDv59fjahdpjR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rG+cYlCp; arc=none smtp.client-ip=95.215.58.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rG+cYlCp"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XyuHMcU9BbS4rZO3qSAgRdBv7BTX7Z9PJ3I+SxV2FeE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790617639; v=1; x=1791222439;
 b=rG+cYlCpWA7YUysgTp+nJZS8DB0k3hg004QgeE6o77dfXykYd0WV2i9ocLruRHgghTEGY7Tn
 baTMLQXUYdTh2X2O1hxTJ7p8/gwUoB2Tlcdc4/xuS+zAXSv/9PQDTgKNCtCZgnyZZdMyztzkXuM
 i/2v3ZqOPBdsQR407E0kjFRA=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 197c225fab839f05;
	Mon, 28 Sep 2026 17:47:19 +0000
X-Mizu-Trace-ID: 197c225fab839f05
X-Migadu-Flow: FLOW_OUT
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6ab5386c105so1290a12.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 10:47:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByOwwPkTko6aIHVOoorcs8SzhAzdqWvmgRk12ll8hDYDa37XG+DG9fGAwfOTjOsoxx5DQFrTdfQgf0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLghGkPITRfTz/XPcNdIalpvq8LusQtYuG5BQYNbP23UN9Xl7GE
	XlmFaYEhKcL2JNAsdxHnJ+YWLalJUsYjv3q2cyJrPNVZypzJX2ux5Wr+6xUWB2oXCr6zA81gPQQ
	dKJN5AcbyBM4XQFeog1GchF0MLZwc9TKPHY17X9o3
X-Received: by 2002:aa7:ca57:0:b0:6a6:967c:3186 with SMTP id
 4fb4d7f45d1cf-6ab01ed939fmr94944a12.2.1790617638152; Mon, 28 Sep 2026
 10:47:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928152507.2116110-1-fuad.tabba@linux.dev>
 <20260928152507.2116110-5-fuad.tabba@linux.dev> <arqaNHGzVfMpVha5@kernel.org>
In-Reply-To: <arqaNHGzVfMpVha5@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 28 Sep 2026 18:46:40 +0100
X-Gmail-Original-Message-ID: <CA+EHjTz=sKCZpQzLkMaks0o5hR-R=ACKVinPgwzAiyVUubirxA@mail.gmail.com>
X-Gm-Features: AclHuK-Tq_Aet2hB71IGOYbMLUlrt7UHvVGW8T4ukejDyUoOFxO6nR4iiKf3Ohs
Message-ID: <CA+EHjTz=sKCZpQzLkMaks0o5hR-R=ACKVinPgwzAiyVUubirxA@mail.gmail.com>
Subject: Re: [PATCH v1 04/10] KVM: arm64: nv: Return a failed stage-2
 descriptor read as a fault
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jing Zhang <jingzhangos@google.com>, Karl Mehltretter <kmehltretter@gmail.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Oliver,

On Mon, 28 Sep 2026 17:47:48 +0100, Oliver Upton <oupton@kernel.org> wrote:
[...]
> Hmm. Rather than fixing these things individually, I'd prefer aligning return
> codes between the S1 and S2 walks. I agree with the approach; negative
> return codes should be reserved for host-visible failure reasons whereas
> everything guest visible gets communicated through s1_walk_result /
> kvm_s2_trans.

Makes sense. I'll bring the S1 walk in line with that in the respin,
with the Data Abort change on top.

Cheers,
/fuad
