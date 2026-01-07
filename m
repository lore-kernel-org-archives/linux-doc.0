Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C427034C134;
	Wed,  7 Jan 2026 14:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767797602; cv=none; b=GWe0TPnFrin5ztRtc73FftWVtDW3Ql/ESOd3xuDmC++e2X9A8TCUl41s2QphXtCK3Hc7UNtrr5tHXQa2a/PBEO76M2NsMiEYWVB7xPgh0oQKsUeVP1Yt/3nXoQV0Jvx8AboZogTOx/C5BYulKBYsFsoHxgGgkt3jRe3juXwctxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767797602; c=relaxed/simple;
	bh=oZKQXA4Uess6u7UzTu57aLvzxwOHcNWAgrEBGcjPMHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W46hJmi/PdZ3VOqGUAef4ueSO+HfKblZKDV/iOr1JTrgGlmLgmNoTZ+OFWLpthmrwLs9uN18TbNZgjT17HQGBCtmdolj056m2SXMhSlBO+91AcQHOHTPsD6AmTCckA3dAj0zq7kdtohcgoNBB105SvIgsVAeaF+KtRSqLUHloc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (0-bit key) header.d=alien8.de header.i=@alien8.de header.b=WJkwrhLy reason="key not found in DNS"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=alien8.de header.i=@alien8.de header.b="WJkwrhLy"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2268340E00DE;
	Wed,  7 Jan 2026 14:53:16 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 9k7A3SBZ2udD; Wed,  7 Jan 2026 14:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1767797591; bh=PK307vC3V+92EBFtSH3dXZ1lbQBbjr5tS/ML70eN/1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WJkwrhLyO2exwZwgXzN8J82TbJoOz6yr57pU4FBKYPCi4gPfRS3a1vMJJyjzqfBDE
	 DrXGciYTjd9yIrFlkGftpcEfYSGuVOUKPXP4gp4ZwrFCwYgXtELWjY8CnPfpA7nVaS
	 46Q48yNeNpzSTf59D3u6JNwoYvtBhAh4gRTMB/LWb3UPQezTc+S3MLGD5hej/DhkZR
	 yHGacD09NOAqZIRKjH38a75pZucoJJCKE5ydv496CcHr2xY473ekkRyOW3B5d07YnX
	 kxohLYUJ5iJ65BEoi4xxg19sbyRtyK/EfFmLryJ+M5UVai1F3hHAv23ug3NbQSZZa7
	 CbTOVwVOHtq2a2owBxo4JKNzJyj/t2AeOFOwichyLGa1Dz+q2XRuba65Gj5IxDp8nH
	 5XTyqDpShkfB6kzzy1Ni7Tk/WuothBmplfRUF1VzH0SFBDlmD//+QxDYO5DoEE1+dV
	 WQDmLFflDQA3BpKX5GXJQr4N0/qpPYfQQsU7mC539ICkZjnuGJ8QqILKpa5R551Xbi
	 7++0IzGDbsalagrWxJSsaPvossLd8JwbxqwS0Jp4e1VaX6eW/DFlmfA287Bs+P12P5
	 lTVugy+J6HLc6G7FUwlO9BV4TMeyKyXyG9HSeHdhJz5NrQI2T51lsnfNN7DidSncrv
	 dcPvo4uli8bWE30XsHWMLwx4=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 6438F40E00DA;
	Wed,  7 Jan 2026 14:53:02 +0000 (UTC)
Date: Wed, 7 Jan 2026 15:53:01 +0100
From: Borislav Petkov <bp@alien8.de>
To: Richard Lyu <richard.lyu@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/x86: Update AMD IOMMU specification locationi
Message-ID: <20260107145301.GDaV5zTU0a6btE25Q_@fat_crate.local>
References: <20260105150548.73422-1-richard.lyu@suse.com>
 <20260105151959.GAaVvWnyEonFSjilB_@fat_crate.local>
 <CANC36oUVpEF1r3JK8Po6a4RwxRQ4qGMLvmWzxn-Zf=W2tF9-eQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANC36oUVpEF1r3JK8Po6a4RwxRQ4qGMLvmWzxn-Zf=W2tF9-eQ@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 06, 2026 at 12:10:41PM +0800, Richard Lyu wrote:
> I completely agree. Corporate URLs are fragile and lead to constant lin=
k rot.
> Using persistent metadata like the Doc ID and formal title is a much mo=
re
> robust approach for long-term maintenance.=C2=A0
> I'll update the documentation to use these stable identifiers instead o=
f direct
> links.

Thanks.

Btw, I see you're new to this. Please read

https://people.kernel.org/tglx/notes-about-netiquette

about how to do public mailing lists and also:

https://kernel.org/doc/html/latest/process/submitting-patches.html

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
