Received: from mta0.migadu.com (out-84.mta0.migadu.com [91.218.175.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE66E3BED78
	for <linux-doc@vger.kernel.org>; Wed,  7 Oct 2026 06:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355569; cv=none; b=kdZnz1w9y/bbZA2uaHCPPikK3kDCmHs7j8w7mc3jlyVo5xph+HI/uEeSm0xt317q9goyJMMWwvoX5GK4hWRu6A47rG41VDj3YXsO8HV2qU2CgbdhqTM2DBMy4Fy31eXLoswem2OrwN+9sqwpjX+GLLIK/yKkdPRZ6LQEmrgJECQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355569; c=relaxed/simple;
	bh=nWznkk9Fjq/D6EuRqmF/M6hW1RRZAYuOo1VRXMA0j/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bxpS+8OlPst9VtTo3KEVbswkifFu+LUa43Yt5eRPlqdE9GiWeQxQD7FE89bZLyhuVNBkZpXLWfRxxBSHctSaMByr/u0w1Tu5etm9fExzzjaggjfM2a5Vsl2DEv0/6bDfpxf/EpQ+NyYDIn1R9En7L/f2h17IrzoH0qByuRTma9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ft22gWYq; arc=none smtp.client-ip=91.218.175.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ft22gWYq"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nWznkk9Fjq/D6EuRqmF/M6hW1RRZAYuOo1VRXMA0j/o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791355565; v=1; x=1791960365;
 b=ft22gWYqTbR5Z/P6ghUoLkuaYKifTvfnmMTnLYRvOFoEmreiQ5ShXGWcO4ZkJIIteczy6xoY
 R6h372nmqImNm939AuhEjdgiMdyb9w/bapl7WL52lU7Ik9fGepBA/botEbO9ebCJs6Ceq6jAYoV
 1NdIzFFb8CP0/b/MpoUXC2Tg=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ccadc650095864e0;
	Wed, 07 Oct 2026 03:24:23 +0000
X-Mizu-Trace-ID: ccadc650095864e0
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5ba40832934so2854e87.1
        for <linux-doc@vger.kernel.org>; Tue, 06 Oct 2026 20:24:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxyNfZWTVYal8Bl38zUJhGhNijzDi5hytcOtcCs2NaXgu9/Te7OxtSpKQZzYKp3P40zbo1z8ABC5Yc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvabikrgSOFMPpw+BZrhXSvKA1PK/jF7Jrh07bBBJCW7tevs2G
	KTqcwJkTDp7CcailUxJC5LHsAy6GobBA+l11qkZGnbcvzsk3KiCN5lyTe3Ue3Pa6qC8/tJuhF5r
	gqRAcbHPQ7plJbg7Sp1yN+5lciVS9zIC8PGszrWCb
X-Received: by 2002:a05:6512:33d3:b0:5bb:ff6f:b4bd with SMTP id
 2adb3069b0e04-5bcca66e395mr244231e87.14.1791343458771; Tue, 06 Oct 2026
 20:24:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915084441.3846947-1-fuad.tabba@linux.dev>
In-Reply-To: <20260915084441.3846947-1-fuad.tabba@linux.dev>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 7 Oct 2026 05:23:42 +0200
X-Gmail-Original-Message-ID: <CA+EHjTwqmQrLz5aDsCo1JFE2H6mz_dWDf=fkLsNup0cgenMCbg@mail.gmail.com>
X-Gm-Features: AclHuK_KSLUhfLp6Pl2z-XBsxbeEyfCpN3TL9UgSgX_CqN7OtwApebc1PcGPn3k
Message-ID: <CA+EHjTwqmQrLz5aDsCo1JFE2H6mz_dWDf=fkLsNup0cgenMCbg@mail.gmail.com>
Subject: Re: [PATCH 0/3] KVM: Replace VCPU_RUN with KVM_RUN in comments and docs
To: Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Will Deacon <will@kernel.org>, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Oliver Upton <oupton@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

Gentle ping on this series.

Cheers,
/fuad
