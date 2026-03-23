Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77BA37F729;
	Mon, 23 Mar 2026 22:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774306253; cv=pass; b=mzWKT35iNfaiGwf+CIie0ZSgQGS+EW6EHY3B96i0IRRRnVsEDwFzRizTEBfJon3aa2d5AFtPnySSXkUVE/rCOMOSjeiiDzZ6Y57LijbAf7tYAo46BEBBoIJRKCmGVJKKcfDOO5OEuirFNd0Ki78R4s6Zu7n6kRbJXi2FjMc63RY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774306253; c=relaxed/simple;
	bh=QPlH5NfaWEm1Q32kGhYBI4nIzXMK/xT50KtgA8uaapQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:From:To:Subject:
	 References:In-Reply-To; b=qJLSpHgcxdGOTydwacDJnAHdCm9YsREBvO4nwDLFNjtzMvBhHKVZpA4+9qLpKmjxespTFPCbhpfWIXGyRhUNs98dPnBbUFOHPYxExz3AibrlRBUoVlISEhvLfxSXg9yTBTHFEgs9kcici2w6nYGvaSHRViBAjYfITbvgisPkdX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=nZ/vT2g1; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="nZ/vT2g1"
ARC-Seal: i=1; a=rsa-sha256; t=1774306238; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=U/951eOZoJpdozV83eExAwaKS7yPu3z6jBGV42vtWaCe4RIsbIaoLWDDuf/HtFcMr3UDB68rPmx/vFIL4X7LPaTGrLXGqGt2sSixu8lsbmUhhuXSizauUaXdJLVmWrVv8vjQfIqKPC1Psc8YcrFULxrS40IkDHVncqzYVHu8DD4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774306238; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QPlH5NfaWEm1Q32kGhYBI4nIzXMK/xT50KtgA8uaapQ=; 
	b=TFCrzinAmI623IWF7Np6Gz+FmM0o131hGyN5GNypqseCaGXSBVVntkVPa/M5zUt3SY5DFjer9RCWV8qIShJHr7RyIndPWcOSWHiLhMapMvrdsv9oSyeFwxZxUGMM2st7k/qcZ7UdELpLWZkIpzhaXaZjyA7O0+xAz8qHx+I+VxQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774306238;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:From:From:To:To:Subject:Subject:References:In-Reply-To:Reply-To;
	bh=QPlH5NfaWEm1Q32kGhYBI4nIzXMK/xT50KtgA8uaapQ=;
	b=nZ/vT2g1v4qP1WORul/E47/ND6q0osUG4cEE/IZicPeQHyV1VLctdULMIT513QpW
	HQpFJcJ0xzeREbrmCDxTRo8+lO4HpMfGm/Y2jYvdmvY1NT+OYOEMyEq9rD9P4WzqeYA
	Kxi9w4BKWp+XgR7LPttD+G0pRhksQot1FArfq0Q8=
Received: by mx.zohomail.com with SMTPS id 1774306236496477.96514634513846;
	Mon, 23 Mar 2026 15:50:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 18:50:34 -0400
Message-Id: <DHAJ2FE2Z4OL.ZUA8AQEMPC01@ritovision.com>
Cc: "Shuah Khan" <skhan@linuxfoundation.org>, <linux-kernel@vger.kernel.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Randy Dunlap" <rdunlap@infradead.org>, "Rito Rhymes"
 <rito@ritovision.com>, "Jonathan Corbet" <corbet@lwn.net>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] docs: add advanced search for kernel documentation
X-Mailer: aerc 0.21.0
References: <20260321181511.11706-1-rito@ritovision.com>
 <621b43a5-256b-4a82-b179-3cefe43d419f@infradead.org>
 <DH8UC6DVQE4P.13E9XDIRGJ645@ritovision.com>
 <6cbf9940-0146-4b4d-bf74-4142b18602df@infradead.org>
 <DH8WUB5VFIDH.B2WQGIM3163@ritovision.com>
 <4620a35c-5293-4973-aa71-49046fae9911@infradead.org>
In-Reply-To: <4620a35c-5293-4973-aa71-49046fae9911@infradead.org>
X-ZohoMailClient: External

I believe I identified the issue as a Sphinx version compatibility
problem.

I've been working on a more robust reroll. I expect to have it by
tomorrow, and we can test it when you're ready.

Rito
