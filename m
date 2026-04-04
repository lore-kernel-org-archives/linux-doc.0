Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81681531E8;
	Sat,  4 Apr 2026 07:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775289066; cv=pass; b=YPT11dJWF4wx6gJoqbWdmqFLe70GF/lXRanzuIqKzNtb5wlnap0gKg6pUJ7wiISFsq+oC+Wm3B2I7w6Ao98o84NsWQ2QBuq65z9x7b3DxE1YquABWSVOSTGwB0EM65j1GZBeIdWZUffsjwLJBvFAk5b6h8IoAexa7p/XyZhw+5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775289066; c=relaxed/simple;
	bh=6PZtCi0Prk4Sg1qzP4DNSyjQidhu2jQ8o4nQ1vPgsCg=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:Cc:From:
	 In-Reply-To:References; b=iWVNGyrnwhjmlwLhCBuvVH86zKRSYeSMchAenNlWEilgBKTH09Si7ZfdJgmu94bohmJ6gvHZbX6O8hIbhz6QHYCkMvAe5fP6QRiV2GIraItFQ/OGRtABTjswqWKEoZCzxDYCSfCP7SB/K9fw1MCdR7Jf1kZkAYr4F3RWwr1zIco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=bpE7BRGL; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="bpE7BRGL"
ARC-Seal: i=1; a=rsa-sha256; t=1775289047; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lPiAgzhpkuExfDxfStQaAiL2cKw91oQDrbR0rPj7gW6uYWN2Nc6OlPh4u2u3SYMrRTDSISlwtDV9CrL8gnkcxr0KaDHpM2syxY/UynPnFhaPKPerqBsJqKFkM23xjlw8x4zItpRLAp4BoFpxOwGwr6p1nZF1tL+t2Z40byfCg4c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775289047; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6PZtCi0Prk4Sg1qzP4DNSyjQidhu2jQ8o4nQ1vPgsCg=; 
	b=Fd7b2QC0xcmT+XDrkgTWL1lF4USwkUy9pcy/Dw2NdsUf+rr+4+1YLX0nTb5ZyTJgq8BpSSh5BhaN6yVUfVNDq8BPnejS7zNbvoLDRgfBTh0k6JRX37u2MjpyOrbpOE+uv+CTTox4vsMn2ZddtFncqDwsYBfVrL6ztlm+jNoYn78=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775289047;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:To:To:Subject:Subject:Cc:Cc:From:From:In-Reply-To:References:Reply-To;
	bh=6PZtCi0Prk4Sg1qzP4DNSyjQidhu2jQ8o4nQ1vPgsCg=;
	b=bpE7BRGLXNFNDykg9U4NnivToceGkIHWlpMNvFSmMp1HksvzajastZHT32qlPxvG
	i+nFAsVqbB6dqvXZji7luKiqWE4RZRVAd/dHzAb3v66PKb8SlHSiDVmkpyaThKjUy3C
	fTgbXzHY4pAs9lriK80NyGxYWuj9XGVReewUlY3M=
Received: by mx.zohomail.com with SMTPS id 1775289043903734.341021653271;
	Sat, 4 Apr 2026 00:50:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 03:50:40 -0400
Message-Id: <DHK7FY79AOJW.AC6LHU703AIR@ritovision.com>
To: "Randy Dunlap" <rdunlap@infradead.org>
Subject: Re: [PATCH v3 0/2] docs: advanced search with benchmark harness
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: "Rito Rhymes" <rito@ritovision.com>
X-Mailer: aerc 0.21.0
In-Reply-To: <20260321181511.11706-1-rito@ritovision.com>
References: <20260321181511.11706-1-rito@ritovision.com>
X-ZohoMailClient: External

Randy, I meant to include you on the v3 reroll; this new version is
intended to address the compatibility issue you hit earlier in our
initial test and debugging (among other improvements).

I believe the problem came from version-dependent differences in the
generated Sphinx search data, so this reroll hardens the compatibility
handling around those differences and the search logic that consumes the
data.

If you have time to try it again with the setup that exposed the
problem before, I would appreciate confirmation that the updated
version behaves correctly there.

I would also appreciate your broader assessment of the feature:
whether it seems genuinely useful in practice, how large the benefit is
relative to the current Quick Search interface, how many other users you
think would benefit from it, and whether you see any remaining issues or
obvious room for improvement.

Rito
