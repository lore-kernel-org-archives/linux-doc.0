Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FCC230BDB;
	Sat, 21 Mar 2026 23:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774134938; cv=pass; b=OnLqtAst8u+2YvPuJFgtk9hvQ77JH9eZAHgW3ZRifnSWN3QKnbn2/2ucj7jQZyDKHPSuf8DoHdAkbLgcdSPsbV6ui+WR/Upp0UJ6FYwsEkSI2wLUMtOV9d/+9ClchUoE6hUxoKPYq3EPE+oq+cotC4658qWhXuTRqfyC1eDGY2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774134938; c=relaxed/simple;
	bh=+Q15PFHHgTD7955Cg2X8NgriFQb54xYxE5K7+cXIoSA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=ZO2YPyfqU404JsoDkQ+kRBnUbwm6fPKKZHgRZ/ZBPX0wocuExDAY8d+7kwGkcZiVxDDosUUYO/MB6YFS3IK0LdJhviA+4fqNfJvc9y7OjDmwsb8orhDERTc1aopi4O5dtWOLvho5txZ9lAYWGFO8q9rbieWOugmLYVlGlw2c8ho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=mwpaY+6G; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="mwpaY+6G"
ARC-Seal: i=1; a=rsa-sha256; t=1774134915; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OYlUeGx30y/KMsp9puPcErg9rh3BTls0dA1EJ2/Lb4wBwPtkRnu/cPRndWOXCmK6KdtpxNGQteRuvj9jmmgmHrEKC0q0p8IOGfHafYdZXhesjjOYDAc631fiDulkWwjtjPrxs/5CBJYOQeEa77VD9iL/xyw6DrHyJdSx22sZm68=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774134915; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+Q15PFHHgTD7955Cg2X8NgriFQb54xYxE5K7+cXIoSA=; 
	b=PxVXeYgM+NAMTz5plHbp+lRQt+ETX3LC+sgguXCPXKiirwW+oN01YEv947eCBSkdudvLqf7t13lxcLlpH9eMHjB2ACDb5/wUePvF+KirmoLjStBAXrhvUapqHHzKvDy+F0Eri4hTY//UYJYRc9rV6O1Vx00qc3HceYiR6xtzMRo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774134915;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Subject:Subject:Cc:Cc:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=+Q15PFHHgTD7955Cg2X8NgriFQb54xYxE5K7+cXIoSA=;
	b=mwpaY+6GoqJJXewtfL1LHqCoTS/l5H80noxuSAp2dd7JijMIXemgaNkUaXDgmdRq
	l3TrHurBcbjo4369MZH8ObGcoFdoxmKqfqxPA+G5Q6DOmXP71sx9Xn6AUpi1YAX3bGH
	jGJiEsrz4OXiyA22/xFLSsrGLH5xbtYanM8mlzNo=
Received: by mx.zohomail.com with SMTPS id 177413491394080.5619252504057;
	Sat, 21 Mar 2026 16:15:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Mar 2026 19:15:10 -0400
Message-Id: <DH8UC6DVQE4P.13E9XDIRGJ645@ritovision.com>
Subject: Re: [PATCH] docs: add advanced search for kernel documentation
Cc: "Shuah Khan" <skhan@linuxfoundation.org>, <linux-kernel@vger.kernel.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Randy Dunlap" <rdunlap@infradead.org>, "Rito Rhymes"
 <rito@ritovision.com>, "Jonathan Corbet" <corbet@lwn.net>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, <linux-doc@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260321181511.11706-1-rito@ritovision.com>
 <621b43a5-256b-4a82-b179-3cefe43d419f@infradead.org>
In-Reply-To: <621b43a5-256b-4a82-b179-3cefe43d419f@infradead.org>
X-ZohoMailClient: External

That is not expected.

On my side, searching for "futex" with the default advanced-search
settings returns exactly 232 results.

I just tested out reproducing the steps you described on
Chrome, Edge and Firefox desktop on Windows and the results were
identical across each.

Let's debug here:

Which browser/version are you using? What OS?

Are you running with JavaScript enabled?

Did the browser console show any JavaScript errors?

How did you build the docs? In particular, was this from a fresh
rebuild after applying the patch? A stale generated asset or a JS
parse/runtime failure could match the behavior you describe.

Rito
