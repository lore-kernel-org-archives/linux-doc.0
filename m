Received: from trent.utfs.org (trent.utfs.org [94.185.90.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C14332EBB;
	Sat,  2 May 2026 11:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.185.90.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777721571; cv=none; b=QUr/EC2swK6blo7bmwlW5BoNSzMOEU1PEPuEZAkfDFvzm/TtzkQZHHNDVyoPzUsn8kU0Yk6Pdd1VlN1hecdYs8BSLL/9N5jjdws71gk4rDKHZmqBqeieQOmjdjwGvk2hmF92dJF8bofmlJnDPLpbYGZbhSwh0jFCTSm9wEQ45Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777721571; c=relaxed/simple;
	bh=+Brfu399QW/JZ+ggvO509sgz+qhBCEKH8HmrOYDucsU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lslfVD0QHqEzwSzvvDCKe6VRi6Y7SezJCXny1zJcIZZXN7OwSoPKQ/wdfRme99Z5zsWEbsNjOn55j8gEr4qSTvGo1hYS6wasKiVmbKKgeqbIDMTqOBjEZnKHl1ZzVzLAAZgQqUOgy5UQQJhiG/NWkd2PlQZwTI30wm3baqXwW8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nerdbynature.de; spf=pass smtp.mailfrom=nerdbynature.de; dkim=permerror (0-bit key) header.d=nerdbynature.de header.i=@nerdbynature.de header.b=t8OKGJer; dkim=pass (2048-bit key) header.d=nerdbynature.de header.i=@nerdbynature.de header.b=bye+H9Jc; arc=none smtp.client-ip=94.185.90.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nerdbynature.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nerdbynature.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=nerdbynature.de header.i=@nerdbynature.de header.b="t8OKGJer";
	dkim=pass (2048-bit key) header.d=nerdbynature.de header.i=@nerdbynature.de header.b="bye+H9Jc"
Received: from localhost (localhost [IPv6:::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by trent.utfs.org (Postfix) with ESMTPS id 4FD815F92D;
	Sat, 02 May 2026 13:26:21 +0200 (CEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=nerdbynature.de;
	s=ed25519; t=1777721181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ao1NWjD7qTJ5+9aMRqk8nDkbefL8DW6JQVDbgDJX9Ck=;
	b=t8OKGJermSFlAr4VXIjCcbfXYWwjcSOMQOmdsKu+v2bMeOEsdJXidjUA//OhQAt//tUNEy
	yfSjo7zFm4brLbAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nerdbynature.de;
	s=rsa; t=1777721181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ao1NWjD7qTJ5+9aMRqk8nDkbefL8DW6JQVDbgDJX9Ck=;
	b=bye+H9JcGM+I1M8bUZfpAS4DvkxlrfgobmHoaAwXCbCpd6+1nyMQGi2xrgpPC+Np6isD1K
	ev1dAOB0fG90hV3qiiZV5eSjHeGvYvtB9htwWwcsAYtKMcBzX/H6mUPHqqS/t+nGgsH8yO
	kQbjTZCAURntHHQXgppXe27SmAeSJgyKUdC2GzdNGW+FrZFFElOenNlMW+0/F0J+CKNPMo
	o42iz8Fs0exwfa1cMhIntW6MymfGea5rEMQclfJnQUCD9ckAH0YIAi+FEmdgrvNUOBSi4d
	zq83gzUTMfmu94G8Dr89oW3vulypMhw7vzKwASb0IE9y6iNr3tyNzpyuBvWOpQ==
Date: Sat, 2 May 2026 13:26:21 +0200 (CEST)
From: Christian Kujau <lists@nerdbynature.de>
To: Wang Zihan <3772548978@qq.com>
cc: linux-doc@vger.kernel.org, federico.vaga@vaga.pv.it, corbet@lwn.net, 
    skhan@linuxfoundation.org, carlos.bilbao@kernel.org, avadhut.naik@amd.com, 
    linux-kernel@vger.kernel.org, torvalds@linux-foundation.org
Subject: Re: [PATCH] Documentation: translations: Fix "Linux Torvalds" ->
 "Linus Torvalds"
In-Reply-To: <tencent_A111D365F88A0FF724E809970A094533B206@qq.com>
Message-ID: <e50f4688-2c80-50e9-b3d8-b4ef85a3c719@nerdbynature.de>
References: <tencent_A111D365F88A0FF724E809970A094533B206@qq.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Sat, 2 May 2026, Wang Zihan wrote:
> Fix the misspelling of Linus Torvalds' first name in Italian
> and Spanish translations.

Haha :-)

There's one more:

$ rg -l "Linux Torvalds"
Documentation/translations/sp_SP/process/2.Process.rst
Documentation/translations/it_IT/process/adding-syscalls.rst
Documentation/translations/it_IT/process/submitting-patches.rst
fs/ocfs2/namei.c

And that looks also wrong:

$ rg "Linu. Torvald "
Documentation/translations/it_IT/process/2.Process.rst
56:Al termine di questo periodo, Linus Torvald dichiarerà che la finestra è


Maybe include it into your patch, or add a [2/2] to it?

C.
-- 
BOFH excuse #394:

Jupiter is aligned with Mars.
