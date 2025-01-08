Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C421F76D4;
	Wed,  8 Jan 2025 10:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736331585; cv=none; b=DQBhVXDKxzyk6RKcI12mXOXs2jk/o5eauX+7PdtDN/uebB4F1ICCHnpb7dT8EfkrMv5d2kOZZz1MGl2IQCatX4oeAvn87QsdRAHj4F0Rpqj2Br6niAXN3DIMH0rc3CXjsdQbzhSizseon46xi+24BqghBFvFI/Unckp8XCOh3Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736331585; c=relaxed/simple;
	bh=2F1NrFzFunGtkEPuCgh3gTbxu8JlwOElD4NMwPMw67A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LnX91Hd4BQaGgcT1J1qlcloQyW8OlCjaGFCeJO28F2XvT8v1TsXH1eKEYnV4v3kHfUDPGWokCTBlSHt6hC5PaCvOeYLf8q/divfdZuelNlKlV8Pxm0YOQ7qUElYVYGn4GgPMYONhNeuUv/68QFiS4RW5OaZxwOlJgi5DDrH6W+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ckOeQpx3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ckOeQpx3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CACFDC4CEDF;
	Wed,  8 Jan 2025 10:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736331584;
	bh=2F1NrFzFunGtkEPuCgh3gTbxu8JlwOElD4NMwPMw67A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ckOeQpx3w5mjprCv5AV/IH16AL96ahmq6Hj0lHRYHNlsrg/TbNLS60vqF2Mmy7X49
	 vlp12ql28ghZCV3hrVC9rzeHOZVSEP/bcALI7uU/FH2DEmAPKA1JVgPHkSrHG7Fcx4
	 pLgBfary+k6KLNV6iFIOpXzyA6JGqovw2VhHOPNliRbZRl9D75U5tt93omiZ/25QXi
	 GObV26ziRRStjVHELkFRDbZmw/sSG04ASlPwCJZVg5YquDmEMkvCrB6EQt/4FM2283
	 ac4io9IIsm0DGeyOUDLihHQ3+r7X7W5xcg/9bBqGxbSH/8ghmmJ1XI2giKA9ZJ9G38
	 RJXfZCXGYvIrw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tVTA6-00A65Z-C0;
	Wed, 08 Jan 2025 10:19:42 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mostafa Saleh <smostafa@google.com>
Cc: corbet@lwn.net,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3] Documentation: Update the behaviour of "kvm-arm.mode"
Date: Wed,  8 Jan 2025 10:19:38 +0000
Message-Id: <173633157442.11636.146865542234649551.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241025093259.2216093-1-smostafa@google.com>
References: <20241025093259.2216093-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, smostafa@google.com, corbet@lwn.net, will@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On Fri, 25 Oct 2024 09:32:59 +0000, Mostafa Saleh wrote:
> Commit 5053c3f0519c ("KVM: arm64: Use hVHE in pKVM by default on CPUs with
> VHE support") modified the behaviour of "kvm-arm.mode=protected" without
> the updating the kernel parameters doc.
> 
> Update it to match the current implementation.
> 
> Also, update required architecture version for nested virtualization as
> suggested by Marc.
> 
> [...]

Applied to next, thanks!

[1/1] Documentation: Update the behaviour of "kvm-arm.mode"
      commit: e8440c1e2d23a9ca5e0af1a18be637cbd5a5d44f

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


