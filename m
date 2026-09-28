Received: from mta0.migadu.com (out-153.mta0.migadu.com [91.218.175.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49134E50AC
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 16:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612484; cv=none; b=E5VDMW4nc+XVSoo/ZBGRidliebJj1NcLwauHrS9fWL0DaY1M9x59rNZUqupXGQjBl0CGGkJhN26hDvNRpD/ZEEBHeyEmO86vzYQh7KxatUQhvKX8XP184dnvgPM4v5Ctn6F5ekf9G9SACZdhqJeh22qq/1pnURHr5wU1adxPHBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612484; c=relaxed/simple;
	bh=c06SVugHWJJNDeT83SdkPtIHJEt16Y1SGd4fojskXEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lT+x3sFcKBpwqOqEleULA+off6vbiVAJQ7ffF6G8IeMzNNHepLF5aruz5a0px1ieAk9owp4gWT7dI4iOVugSBCNA+4hVIVbFLmg2M6XlLjvUNo0ossCN5w0IukAdG0VFjJoEeYWrE/9QurguIm2LLtjpt12tG9Vwk5nyzz01kug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ndWuDymy; arc=none smtp.client-ip=91.218.175.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ndWuDymy"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=c06SVugHWJJNDeT83SdkPtIHJEt16Y1SGd4fojskXEI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790612479; v=1; x=1791217279;
 b=ndWuDymye6pgEfFS4MGGwui4fe1+chJZdM3LxXhOAx2vwNetEdgsvod16RqLoGYgWaVM5i4/
 GDPLGetZytIfJzqKWsMgywv1eE7kS02XXKj39yPw+vSb5DeGGVl5T4l0aFHCkMM872JrUmpYqAp
 C0hsEUrhU4ZfyhcowQxF3FcA=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 87dccb8271cd9831;
	Mon, 28 Sep 2026 16:21:19 +0000
X-Mizu-Trace-ID: 87dccb8271cd9831
X-Migadu-Flow: FLOW_OUT
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6aafd2c326aso17860a12.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 09:21:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxiFgTnfxFOL0cYUKgb6YT7LBcyAlEzKWnAbCv5kT7JdPMlPbbED+OyiLMyTZl7p07zdeOaHrQRsAg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLquPvGtZInG7UrMLRkrxh3d1k8v2GrKkJFWNOEtd32qlIPsCrK
	2uaLfD4lIhnn8hI/RjLyfbYNvUbOx4ApxU3mmmKIiCrCEW5AnGHHXElQiQZVMk/H9TqG472c7m4
	iaAHedYExfh7WKHViUanm51zpJh47mBpPt27jjMaR
X-Received: by 2002:a05:6512:220c:b0:5ae:b726:5f1f with SMTP id
 2adb3069b0e04-5b8ef277c63mr220456e87.8.1790612128596; Mon, 28 Sep 2026
 09:15:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928152507.2116110-1-fuad.tabba@linux.dev>
 <20260928152507.2116110-2-fuad.tabba@linux.dev> <arqNu0rSxIz4-Mue@kernel.org>
In-Reply-To: <arqNu0rSxIz4-Mue@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 28 Sep 2026 17:14:52 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwiqsvxXV7fm8emQHWW7qYrQ79J4V+5Erot5Df2=YaLXQ@mail.gmail.com>
X-Gm-Features: AclHuK89NS8J3Mx20bby02ytOoblOsUcBV9_SKsrfeTNez43AkDgos1HN6Dw7f0
Message-ID: <CA+EHjTwiqsvxXV7fm8emQHWW7qYrQ79J4V+5Erot5Df2=YaLXQ@mail.gmail.com>
Subject: Re: [PATCH v1 01/10] KVM: arm64: Don't WARN on SMCCC filter reserved
 range allocation failure
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

On Mon, 28 Sep 2026 16:54:35 +0100, Oliver Upton <oupton@kernel.org> wrote:
[...]
> Eh, the warn is still useful. You could potentially add a check for
> -ENOMEM but any other return value is a sign of something wrong in
> KVM.

Ack, I'll keep the WARN and exempt -ENOMEM in v2 (or the new series
this becomes part of).

Cheers,
/fuad
