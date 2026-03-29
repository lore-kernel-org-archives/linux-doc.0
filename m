Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6C13815C3;
	Sun, 29 Mar 2026 16:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774803270; cv=pass; b=pkLKuh7UZ1D21ScyzIR34ipeh6CJUocGeuSqtaulyIc69ezSJgjQHN/e/oac26QgF14Ka0AE9z62C2ZkPUqTfT+cAxHCSvwm5pCp0oDKREXIkeIv7VhLC8TqNpQ36UL15cw58c0Luc38EjnKpeYnO79cVePRJ0nk5PUwBh10MnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774803270; c=relaxed/simple;
	bh=IalbIaXjmDb4VIRMZtIFSMzqkPtgTenD5gFTY43Law0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:From:To:Subject:
	 References:In-Reply-To; b=T6Q+yWPbT40wjMKBs3EVSc2RpJvM6yexDiTgndCELPKG33A0Bn/IRdDYf1yTFRwyWPt87S/+opZbpo4RjukvAg5ea8obE5xSqxWW0HRunT1Qj14qnSryl5FyvMLTD1mpuw0XKCSAtBXkY9jk3c1SS3UR4RrPrNmQpFAXrhv/KVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=Y8H0lB5L; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="Y8H0lB5L"
ARC-Seal: i=1; a=rsa-sha256; t=1774803262; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=B69YBhdWna/7HIu7zVL+U3Vth+YFBTFroqzQtLJ3J4ijpi6G6csqDVwAehlNPcYZT5o41ArvngCMusNsd/M7WPnpbj49YUJShlaD8oD0JJsAHz3JkoLamvfbkUYxJeFp4adZq9j7fc3w6l7aCG978vlrp+yM9fr1qoMQTd00SXc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774803262; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IalbIaXjmDb4VIRMZtIFSMzqkPtgTenD5gFTY43Law0=; 
	b=JJGWuEQULX5545SxZi12yt5WQXFspCHBXWyQXFrQCxqcd7BHAmeX4OM3e7KFO/Sn8FHD8w6lcW8052G7LVtq+6GxCOAZvaBbTA3R1xB6TlkR+sgXL/Y1U0cXQh5lAD5t3f5tQKKNyXwFPB8dFODvo2BmEDwOmKi6Q4HzuMz3DOA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774803262;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:From:From:To:To:Subject:Subject:References:In-Reply-To:Reply-To;
	bh=IalbIaXjmDb4VIRMZtIFSMzqkPtgTenD5gFTY43Law0=;
	b=Y8H0lB5LcYnH1i+o+ZVRZTUwK+rPJrMTA3pUMTmQ2bO4x8sSCOCb/q+7S+fo300a
	L6QCAWpfjUbZmih5K/VPGQXYqrlolJlPKMCSumZMEP+mDHi/8GxazUi/jzFQothVrsD
	xsVUyIKoEz6W5vHPAMP+ndW748zObLn6vgQuAH+0=
Received: by mx.zohomail.com with SMTPS id 1774803260377756.2557376463045;
	Sun, 29 Mar 2026 09:54:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 29 Mar 2026 12:54:17 -0400
Message-Id: <DHFF8WQ9Y587.18HSE8KTKYCGP@ritovision.com>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Rito Rhymes" <rito@ritovision.com>, <corbet@lwn.net>,
 <skhan@linuxfoundation.org>, <mchehab@kernel.org>
Subject: Re: [PATCH] docs: generate a static 404 page
X-Mailer: aerc 0.21.0
References: <20260329152047.5736-1-rito@ritovision.com>
In-Reply-To: <20260329152047.5736-1-rito@ritovision.com>
X-ZohoMailClient: External

I=E2=80=99m going to reroll this for proper multi-language support.

Rito
