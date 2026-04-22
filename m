Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE923542E5
	for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 10:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776855418; cv=none; b=ETUVzse5t108aEtGJq8XwYmfAdeUwonOPLPRbYI+b4Mbo6AFX8bk/d2sICfSxUWv8r+CJxTFck1wTWFZfkYqOP32fTvrv+eeg2uHFvNfdsDTuzLjBlVe6rzM/Kz2koaf7Z/lJ8Q1zYF8Zl8RBDAqGorQb9+IVChzEEXQaJaqSeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776855418; c=relaxed/simple;
	bh=NeTOuANkhILj/td45DFPdp3bc112EYJucS9kkaR9sA4=;
	h=Date:Message-ID:Cc:Subject:MIME-Version:Content-Type:From:To:
	 MIME-Version:Content-Type; b=YClwI/wcH/ul6VcaNhf+IJHDnXIckprjXMFosQSE1rSCVevFjvMLkX5aojK1yFRILv6bAUZtj86qu8UoMg5w3u/2w7yXewH3eUrJXcjSzjO0+JA8KNlRpYqB3HVudZPZlX4MHkXAX1EpdZgfeICmkyWAFbVxk0jh2FsLzzaD07g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=CIUGRtxO; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="CIUGRtxO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:To:From:Subject:Cc:Message-ID:Date:Reply-To:In-Reply-To:
	References; bh=NeTOuANkhILj/td45DFPdp3bc112EYJucS9kkaR9sA4=; b=CIUGRtxO4WJZTc
	HWaLbyPmw9CEmXDXTPaOGiaM8aQhN/AgXff+VZ5k+AT7r4ybpwBQlLZHEiJcu9SRPNSyLTxs2WS9e
	nLhFzo07xkrQUWLK7cpGoR0oJcxO7ejrGR1e/6I7ujbjPDiVRRCq34l0+BPTQydqS1WjEByHj141z
	PQ+qVrWh8xxGr/Izq+i9O/vbDonlXMSTThc5YNb4EBBAvI4CAFgNdyUvRUVSaEwTHYkh0j92Eoxa7
	oqxnzu9wXxp3Nvi89v0no0t8mBoER96JyFYatTxsFfR/2tPUVzZQvIKoJtyoIiJisDq/PGmrK5FKI
	nKnDZHMh3tcPrfidCv6A==;
Received: from [109.54.146.98] (helo=localhost)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wFUvP-0090eg-8K; Wed, 22 Apr 2026 11:35:19 +0100
Date: Wed, 22 Apr 2026 12:35:18 +0200
Message-ID: <403330813c60b650873c54c68042e066@codethink.co.uk>
Content-Transfer-Encoding: 8bit
Cc: Matteo Martelli <matteo.martelli@codethink.co.uk>, Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: docs: Stale website link in trace/rv/monitor_sched.rst
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
From: Matteo Martelli <matteo.martelli@codethink.co.uk>
To: Jonathan Corbet <corbet@lwn.net>, Gabriele Monaco <gmonaco@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: matteo.martelli@codethink.co.uk


Hi all,

I came across the Documentation/trace/rv/monitor_sched.rst document and found
out that the link under references is stale as it points to what looks like a
scam website.

The link was added in [1] together with the first version of the document.

I'm just reporting without a patch as I don't know what the new link should be.

[1]: https://lore.kernel.org/all/20250305140406.350227-9-gmonaco@redhat.com/

Best regards,
Matteo Martelli
