Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662081F9EBB
	for <linux-doc@vger.kernel.org>; Mon,  2 Dec 2024 09:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733132543; cv=pass; b=DM+mrQXXUq/aoUmxh4L5dazWPsa1+U+eT1LWHg+n6VUVNOruv+LwgdXmW9jEwErDIGccCgbgjE4Gij9PuQ0r7w93AG+IeIp7cYt4taBvcgQvjXlVqMxYLxgPqCeQ7NRYkecADjD3p9gnHjIrFpbcA4dF5CmfhEGPDVgyAthMdFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733132543; c=relaxed/simple;
	bh=1gAVFW30ApUN9s7Gt6XUWWW5CEvBagyIlA/OiPPwYvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GmsFFlapCHhjakbqliu3Rmni911dKw+wDy3eZAqu9CFvYHHup6qHRfFUVtfkgYwuU6Yyf7wIjgr9No+HKYcmcc+Sn8zKXafXbyQlqparH4xoeB+9zyJ6Tcn98m5iVpIDpplFTcJy9R6xhmPvBldWyrUsmD9OsTWmgzDv/b0z1tk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=NueOdzOl; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="NueOdzOl"
ARC-Seal: i=1; a=rsa-sha256; t=1733132523; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LOpUsA6RHZMeHsnldb8mdWIsLUwJ32IqqYNQlpYtKbV5OQL6wQDwGqhsE6mO3DsDc4HO/QTTLao4rToGlO9fwj3QiQ6FY/6DiL3oiYF5ly3s05txr7uwfb9r1UDhovaRjocVbUowoW07kb6T30rUd0rZWhilFZMATRCyPH3imIo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733132523; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oqNOw96nf0FlEzD+Y7kteLaGzFXpVYv4dtSXl7+cLgI=; 
	b=dQSLSZfPn2abW95NIVjU8ArjzudIfFN0C55D5OYqINGsMz3/8C0e0ncNNY00Zr8NnZ4uat1lgFG4Eyk/cgGEBac4h1KYXd0x93YxcQAzNjaWn9QU1kpZTkbwqYvwc5GSyPgQufolvIc3akiHA8laGtfjrEV/nlzBAblchsSbc70=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733132523;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=oqNOw96nf0FlEzD+Y7kteLaGzFXpVYv4dtSXl7+cLgI=;
	b=NueOdzOlO/wmGV5QvvoaK0TUeB7fZpjs2xRSCG2EVJowaEUYgC+NZuU+GGLmBPTZ
	wmwBxLAyE5WKWye0bG0gfKOdMQYZBUdu8TRhm7dRJZv57iN6Nz59kZX82PRCqc+Zdrf
	iXkF2JM7HAI3rXhhU/WR8b/ZKakj+IgyHE13Q0lc=
Received: by mx.zohomail.com with SMTPS id 1733132518577661.239391839636;
	Mon, 2 Dec 2024 01:41:58 -0800 (PST)
Date: Mon, 2 Dec 2024 10:41:54 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: move kgdb.rst from dev-tools to process/debugging/
Message-ID: <20241202094154.3yrbqiinlpkqn65b@basti-XPS-13-9310>
References: <a81c6e57-46ff-4347-9ddc-2cf566065b11@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <a81c6e57-46ff-4347-9ddc-2cf566065b11@infradead.org>
X-ZohoMailClient: External

Hey Randy,

On 30.11.2024 00:10, Randy Dunlap wrote:
>Hi,
>
>It seems to me that documentation for kgdb should be in the new /debugging/
>sub-directory [or that all of /debugging/ should be under dev-tools].
>
>Same treatment for gdb-kernel-debugging.rst.
>
>Any comments about those?

Thanks I have overlooked these files, but yes I would say these are good
candidates for the new debugging directory. And then we can link those
pages into the userspace debugging advice guide.
>
>thanks.
>
>-- 
>~Randy

Regards,
Sebastian Fricke
