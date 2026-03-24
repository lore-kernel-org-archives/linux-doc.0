Received: from sender-of-o59.zoho.eu (sender-of-o59.zoho.eu [136.143.169.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD8E285C8B;
	Tue, 24 Mar 2026 17:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774372823; cv=pass; b=MEVjf6kpSk8fTIY9XEGQfwKT+NTQX491gzWNo49d6hDftmR6sOhnCQ/kD+4LMoYEsSZwjpZylHwZzAVPPrO7L/8nLol7sfq25SupLk9M/gLYCrcP+Gkthi8KcQjfeUMlTExK+6BNj3NmVhmAhV125y358goCZGmuovgfJBE1Y9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774372823; c=relaxed/simple;
	bh=Z0358DOsh93KacMERJJgUvJQRxF/8LAFIyW3ZeC+vkw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=kGheK1nWM5ArWFJK9EdKOGsRgeybWaIl1vHRzObAs/IaOC4aWKigIiaom7zMiAf0sQNYx7nAdt26K4mHYGxQg/ZQCDQP7a/zr7uN2JUQNoSFt8dcv5YmBFcB9O4SY4cvaq8J7Fxr74T4ctg+2ni9Uotsg7p+5tJZ8VvsjFrLh40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org; spf=pass smtp.mailfrom=objecting.org; dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b=ZRE/Nm/o; arc=pass smtp.client-ip=136.143.169.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=objecting.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b="ZRE/Nm/o"
ARC-Seal: i=1; a=rsa-sha256; t=1774372802; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=f9JGY4ITaqGGVpbHQc0ldbVMPWky+iiCO0/wXWGG4aNgWG0+VVHIF5GmfpWF2vA5Zj3hjTk4c5z7NKvKDosKpnEvcSm/G4tHAW6eY/MNQjJaJCwvNLGu5qIIe48MtRBb8EX7eUcV0MWiI6JhtFSVD0IWovw+zRB9oOBRsfqABEI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1774372802; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OLugSuZDmcFWxzdAA91TlBi0Snolk+9vle1ArJEoPQM=; 
	b=BtVz5PN4lh+RT0X3/pUA14GfJ+LXenOjivRjoTBtqT71KXgHO5mX7p/GzcyYiIwmf+cYscJeQdH/lwkQD5XIVFy/hyw0ffAzyqtSM11Sa9uw3/HSr4w21/8YrmC/PKscbXqd1NMtkSLCBjg/tDNaQGug4QqiHRlEq+XnIbLkUb0=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=objecting.org;
	spf=pass  smtp.mailfrom=objecting@objecting.org;
	dmarc=pass header.from=<objecting@objecting.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774372802;
	s=zmail; d=objecting.org; i=objecting@objecting.org;
	h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=OLugSuZDmcFWxzdAA91TlBi0Snolk+9vle1ArJEoPQM=;
	b=ZRE/Nm/odFjJaQZThCJQimORl26Zqbv0eQV8CwGjQAaLGcxEWfdxpvYJwUXo29xh
	hmjQ5UpFXFf1lgG+EhzJYZ2YuqcDlW9AOwINvojuHZNAAVdKtte+BLNREv8vZjI8d6j
	qNRe9xk+FuQkLDQXbqSvxWd81Vx3xUoPg0FnFcok=
Received: by mx.zoho.eu with SMTPS id 1774372799495326.81536068303853;
	Tue, 24 Mar 2026 18:19:59 +0100 (CET)
Date: Tue, 24 Mar 2026 17:19:59 +0000
From: Josh Law <objecting@objecting.org>
To: Jonathan Corbet <corbet@lwn.net>,
 =?ISO-8859-1?Q?Tom=E1s_Pando?= <tovictakamine@gmail.com>
CC: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3=5D_docs=3A_driver-api=3A_fix_6_s?=
 =?US-ASCII?Q?pelling_typos_in_Documentation/driver-api?=
User-Agent: Thunderbird for Android
In-Reply-To: <87a4vxtaqa.fsf@trenco.lwn.net>
References: <20260324163604.5710-1-tovictakamine@gmail.com> <2F84DD09-2880-45E0-AA98-204F10848F85@objecting.org> <87a4vxtaqa.fsf@trenco.lwn.net>
Message-ID: <A54D6856-52DB-4914-BE50-A86EA76733CD@objecting.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External



On 24 March 2026 17:10:05 GMT, Jonathan Corbet <corbet@lwn=2Enet> wrote:
>Josh Law <objecting@objecting=2Eorg> writes:
>
>> Acked-By: Josh Law <objecting@objecting=2Eorg>
>>
>> Patches like these are good clarification=20
>>
>> Keep it up!
>
>I'm all for encouraging contributors, but an Acked-by from a random
>contributor to a typo-fix patch, without having even bothered to trim
>100 lines of stuff, is not particularly helpful for maintainers=2E  What
>is your purpose here?
>
>Thanks,
>
>jon
>



Apologies Jon, I just like patches that fix typos, because when maintainer=
s (or others=2E=2E) have to read the code in let's say, 10 years, they will=
 be able to understand the code easier=2E

V/R

Josh Law
