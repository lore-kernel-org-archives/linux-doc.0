Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDEF326927;
	Wed, 25 Mar 2026 21:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774474354; cv=pass; b=lAXNZERQCgXsuhfDo1itBKby4Kpg+Mn6IDJ8MeUx1cjLO4YffteGsCG01gpms5KHl9XNebSYDM98XHKgKs0FL07aAxCC/Aip7KI90E7WW9RADN6aYiih1J1U0zYS0eSURVhpHNE9tiRD0LvfzAdw7O94ywA1JnyoYTkRU8RZzMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774474354; c=relaxed/simple;
	bh=DACtqHmQpT9rRnDgVKQ+rMZY5XqXa6hwmW/+ZbaA9rU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject:Cc:
	 References:In-Reply-To; b=rRCI9zAKpTc70/CUHV445kypBG9+QpyuC/PZNkLsJ5kb5cvNEsjeiq1LS+YdeTDTd/4tDqv8cX++uVSTOqNVLKQc1Ij6SAqwE2AW/bqVPAnNZaDpFMJ8rcBHdJdRcjKQMqn/EVoe4jqxu7ZrEf5tMveMy/77Wb4IO5p30EfhVuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=VGOag0jV; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="VGOag0jV"
ARC-Seal: i=1; a=rsa-sha256; t=1774474340; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=M3I6ZPciHBEejP+fNMuPH+mEhYzm9/jAYX5vAV1nT19IcOU4g7MPMu0tV98E90SNiADJzJ9K6y3rXg6D6poox6+xnOWEOPbwtgC38x4qwSgv1TxugGinrtkNZ4MGkn9D94mSv/Js/W2JOYI70gty/vP8fQ+UKf2UpKOFuEKICwc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774474340; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DACtqHmQpT9rRnDgVKQ+rMZY5XqXa6hwmW/+ZbaA9rU=; 
	b=NAKC9b3fHQm78Sz9/poLmbyhYXD3tsk22RSSY2MwN9tjYQh1zLCqU5jBgolcdWLegVXSF3HCiFrpB8fHuGS0Ubjk2pid6pecydgRZHWlLWpvTjJGTqeZxVVt1cSRZEr5lt0DDstVX7ltPvzDwcvwqgVraChH0CgQz/MvVuJ0G6w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774474340;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:From:From:To:To:Subject:Subject:Cc:Cc:References:In-Reply-To:Reply-To;
	bh=DACtqHmQpT9rRnDgVKQ+rMZY5XqXa6hwmW/+ZbaA9rU=;
	b=VGOag0jVL5tys0GFKIxuWI9tnsZxkPuuOw5CtAFtxEJ23zMCQA1oJdmpvLLwOdDF
	Xb08WHcJsVZencDlvuiEOEPow3BIxaP2ZiH2AAXbBRdTh8iDaOw8ecP3R9/q3gHVwtq
	8tlpIszF7lo7Wc9ZfvZCk8Lpw1EB8CCW5KUgFeVU=
Received: by mx.zohomail.com with SMTPS id 1774474337173233.83102827831237;
	Wed, 25 Mar 2026 14:32:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 17:32:14 -0400
Message-Id: <DHC6NJM3JZJC.3EIT3YD7O8CDW@ritovision.com>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Jonathan Corbet" <corbet@lwn.net>, "Rito Rhymes" <rito@ritovision.com>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3] docs: allow long unbroken headings to wrap and
 prevent overflow
Cc: "Shuah Khan" <skhan@linuxfoundation.org>,
 <linux-kernel@vger.kernel.org>, <rdunlap@infradead.org>
X-Mailer: aerc 0.21.0
References: <20260321144855.30429-1-rito@ritovision.com>
 <20260323153024.32317-1-rito@ritovision.com>
 <87h5q3g288.fsf@trenco.lwn.net>
In-Reply-To: <87h5q3g288.fsf@trenco.lwn.net>
X-ZohoMailClient: External

One possibility is that the issue may not reproduce if the test is
being done by narrowing the full desktop browser window (rather than
the page's viewport with DevTools opened).

On desktop, the browser's outer window often cannot get as narrow as
many actual mobile screen widths (often bottoming out somewhere around
500-600px), so it may be too wide to expose the problem.

If you check it with DevTools opened and reduce the page's viewport to
a more realistic mobile range, around 380-500px, the issue should be
easier to reproduce in both browsers.

For highest fidelity, I find it most reliable to verify on an actual
mobile device and test the fix by binding the local server on all
interfaces then loading the page directly from the phone.

Let me know if this helps clarify the issue.

Rito
