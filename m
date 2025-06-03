Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368E222B8AA
	for <linux-doc@vger.kernel.org>; Tue,  3 Jun 2025 12:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748955495; cv=none; b=A0FXY0J2w64fMPFRn5WSkNWbNXxr1z1ZEyJQpCIeyNvrRz1WPQRuIb4OZ/ZfeycW/osxoR7i0bKo5GBMXCg1bmOxWZUcAokiAaVWLoB9KFR1PoS2p5O4yHw3xzxFlXaRodGD/nBU2l8/QndLbNAoybiKD9zmOpsT83Jown/aa0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748955495; c=relaxed/simple;
	bh=p4JnDlOmih0OzX+pPsxvMIp+zh45nssxugve+wFbQE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HV8UEP07ajHbhKodEEEMBarwLjrhcDSpSL2Oy/mb5WomPZLBdjaFz4vdi/+GJgWTypg1lCHbPB7laXGwPlT7T5eqxv19fWP4G7pnbiJKXaGJPH0yjtfRnKlh8n7ycALK2SCvgaOOxBCsKmIP0e25nrX5xJBhREoJfUJLJhKIrzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=s1Y/Knqr; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="s1Y/Knqr"
Date: Tue, 3 Jun 2025 14:57:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748955490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BpANthuvMveJrREHZgfh7mmlUdbLls+qAEWmysf/Nwk=;
	b=s1Y/KnqrCgBMqWFnr5b2Zl2S5G4rE/wu9u8eyrfpGqot18JTMAMoksver2AFlHZhZ19sdI
	VfzH02+kbbXQez064YoLe5m8vy/V0itDqSF1AZOzvSfmsjUQGPA8sfIKNldrwZW7ZZVAve
	9kuPMaax1q8o2W7aRQrzyZba6HnHE0o=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] kbuild: set y instead of 1 to
 KBUILD_{BUILTIN,MODULES}
Message-ID: <20250603-hilarious-rare-sponge-af172c@l-nschier-aarch64>
References: <20250602181256.529033-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250602181256.529033-1-masahiroy@kernel.org>
Organization: AVM GmbH
X-Migadu-Flow: FLOW_OUT

On Tue, Jun 03, 2025 at 03:12:53AM +0900, Masahiro Yamada wrote:
> KBUILD_BUILTIN is set to 1 unless you are building only modules.
> 
> KBUILT_MODULES is set to 1 when you are building only modules

T -> D: KBUILD_MODULES

Reviewed-by: Nicolas Schier <n.schier@avm.de>
