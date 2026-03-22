Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7D7327BF8;
	Sun, 22 Mar 2026 17:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774200348; cv=pass; b=Xv/NC4CVXCBmKsvV25SMTrNSGxRKs6tdNrg4srD3kTgoV9JSFRV+lv5tDttGozjDkwa/vYyGpY1JqhBGag30ieSTDas+k0BQ8uz2NO1rxKWunB+i9IkEJlw1G+esz8V8a/lPcNP88kry9/MMbJ6513snAzYZjvWbJitAodeub34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774200348; c=relaxed/simple;
	bh=KWP2aL80QsmP42W+BhMggTmb2meBP5D+ixmutnq/qOc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=reP3xVpVQziZnzX0NUu4Dm1y7fDQZDsCX3bY1SBa3ZAiiR+IpFAmXDbXSXDlM6ZeS7KzS5mE+Kwr9PomrvqRbtpRqsIkCPlQvEhylg91PA3QniFJwCsKWHIVnQoBNv7wguCGFUzYxt5godbLJzSFcaEIvbv6oy6+ffPmEtTpTls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=nGWhCTZ7; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="nGWhCTZ7"
ARC-Seal: i=1; a=rsa-sha256; t=1774200340; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NUz3S/0Mo5H/x72xCIKbETlD1WHBItiHYkMdFzC3zsyy2Vh4uiTVKX3wS2ONQoNWYwlrLdCnpGB9lOd13OItVX533dBwmc7zWC3n4ESJwyM1PwZHGcLtld8XmNfbbZbCZPlsUbVE4BDlvPgBcM51J7VQ5ZV51iLzUvuzue6GM3E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774200340; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KWP2aL80QsmP42W+BhMggTmb2meBP5D+ixmutnq/qOc=; 
	b=PiAhPJHoGbT3/Lf2uqRWIaZu4FJl7rZXPvB7GlSjHrKnubPt85rHioTYBn9zfrK3ZJQ+w92vizi8D5yhdD0sEVljC9T4b4hgqKAiIA6X4xOa9SCbmhmUEU/4+CJyrSOoHrpWLntxTCdiCBsW1x3QEFfnTOER7BTaGAohE88rCFU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774200340;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Subject:Subject:Cc:Cc:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=KWP2aL80QsmP42W+BhMggTmb2meBP5D+ixmutnq/qOc=;
	b=nGWhCTZ7W5bZCA1P0hJhzBaQ1JLnxHs5GW6JTiOcMdauTVyGpcYaqzxRQxB3ZNec
	cr8qTnfRRfbU7BLWMTN/nFpUDdqyJCs4JztqwEoGpfcaoKFyltXff9NclCtWg2O+T2z
	GHgrrt8jipvQmRjqurmyJn5IKJnliZftU1j3Vej4=
Received: by mx.zohomail.com with SMTPS id 17742003380071018.2586470030504;
	Sun, 22 Mar 2026 10:25:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Mar 2026 13:25:34 -0400
Message-Id: <DH9HJ1RASR6K.3KNBVEOUZJBL6@ritovision.com>
Subject: Re: [PATCH] docs: add advanced search for kernel documentation
Cc: "Shuah Khan" <skhan@linuxfoundation.org>, <linux-kernel@vger.kernel.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Rito Rhymes" <rito@ritovision.com>, "Jonathan Corbet" <corbet@lwn.net>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>, <linux-doc@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260321181511.11706-1-rito@ritovision.com>
 <87cy0vetu7.fsf@trenco.lwn.net> <DH9H5TPM3W0J.2XCBEY9U8NQF6@ritovision.com>
In-Reply-To: <DH9H5TPM3W0J.2XCBEY9U8NQF6@ritovision.com>
X-ZohoMailClient: External

Also for reference, I have twice implemented an advanced search
feature for the OWASP Vulnerable Web Applications Directory
(VWAD): first for an earlier version of the site, and more
recently for its newly launched current version.

https://vwad.owasp.org

The kernel documentation search work here is a different system with
a different purpose, but it is adjacent experience, and I would
appreciate any feedback you or others may have on improving the
patch.

Rito
