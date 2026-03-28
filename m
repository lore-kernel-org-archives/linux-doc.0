Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9CF36BCC3;
	Sat, 28 Mar 2026 20:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774731505; cv=pass; b=La0bzSDbdjtEwqBWl1gPjH7x0AIRQSy9KbadFP1a9Qg7FjVRVL1+W4tpVwsuJZHTHdprg7W2Yq5WIfTCyegM3R/wlGeZbSpgg/G9OxweGCu94oyHSCeiabuP83GnZZhYH+1DX/ZSC2m7sDNkUtbCuequcDelx2GYEtgHPtjBnqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774731505; c=relaxed/simple;
	bh=lmCilbAJMd+cOa+m8z1c+d+7EFO+SOQEVOS6L0Lz0Ic=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=qK9ifmVd4xR0aecaRM/ih82ntq5+VgQxWLFHjVdGly6uRcUs7RSOcjNmWYCZcDmwb+rM6allAxNanW6mvp87NyqY2bSTqvVFtgED06t5g9IRul7XiDkD4B9rOjY8kCM16IS2e76aOFe5EfejJf7c4NZ09n6N1C62IJdVUy8PYNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=FuvqOKAe; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="FuvqOKAe"
ARC-Seal: i=1; a=rsa-sha256; t=1774731334; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aDc/hWRay29k5VPvnXNMz9zl3nOBDvmXl+cau80vRULOWLE2tQ9MIHOlFRB8E8ZCS6V4Y2O8RjMgE+LgUv0lIqC3dS8nhHf47PYKcgc+R6YHHocxM32PbIlJHXqbbAkpc5GNmQ4Tkw9pYLzjdJfao2Hy7OG+3NMk5YUbvow42fA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774731334; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lmCilbAJMd+cOa+m8z1c+d+7EFO+SOQEVOS6L0Lz0Ic=; 
	b=mlQwJLUlU49nYcBWjeDR2v1GEkAcU12SZVS/kCstuAG0VOA6HmjEy/6Y6+wHxuJQyWd4RtuRs3RJ5tEpWUvBlSDZp0w0wqYvoFS2olU8+tvu+BfJ77B8+njgPh4B6Zamn87tpld88vuw00NFTEntg7xNIEIIeOb/MK86I+BCHDU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774731334;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Subject:Subject:Cc:Cc:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=lmCilbAJMd+cOa+m8z1c+d+7EFO+SOQEVOS6L0Lz0Ic=;
	b=FuvqOKAegRUKyyRNfkOnNuUkOCSydoRI+d7YfwZOk9uqV48PlembJpNClcFwDsu2
	KH0UwA6nOY5XAvMvhZET08BrO1hDTYPMDAjM3Oe2uChsx0b5HLVZxWbfVL7UzTAUatg
	7foI0RFL3qPZtQMUVdyaDehctKvp3eeWgaC6pYyI=
Received: by mx.zohomail.com with SMTPS id 1774731318003649.0065012998886;
	Sat, 28 Mar 2026 13:55:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Mar 2026 16:55:16 -0400
Message-Id: <DHEPQVGLQKFM.5A8IWSUM3GTS@ritovision.com>
Subject: Re: [PATCH] docs: add advanced search for kernel documentation
Cc: "Shuah Khan" <skhan@linuxfoundation.org>, <linux-kernel@vger.kernel.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Randy Dunlap" <rdunlap@infradead.org>, "Rito Rhymes"
 <rito@ritovision.com>, "Jonathan Corbet" <corbet@lwn.net>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, <linux-doc@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260321181511.11706-1-rito@ritovision.com>
 <621b43a5-256b-4a82-b179-3cefe43d419f@infradead.org>
 <DH8UC6DVQE4P.13E9XDIRGJ645@ritovision.com>
 <6cbf9940-0146-4b4d-bf74-4142b18602df@infradead.org>
 <DH8WUB5VFIDH.B2WQGIM3163@ritovision.com>
 <4620a35c-5293-4973-aa71-49046fae9911@infradead.org>
 <DHAJ2FE2Z4OL.ZUA8AQEMPC01@ritovision.com>
 <04294157-7833-4dfa-b41a-457cbd8750a5@infradead.org>
In-Reply-To: <04294157-7833-4dfa-b41a-457cbd8750a5@infradead.org>
X-ZohoMailClient: External

I'm still working on the advanced search reroll. It's turned into a more
substantial update than I first expected.

Rito
