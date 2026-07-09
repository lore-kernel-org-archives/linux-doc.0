Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368DA3C1402;
	Thu,  9 Jul 2026 21:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783633619; cv=none; b=cE0PCz1/ZnXSPovwgcGwJDiOJ4WNNiVPxMDwfV6rd965/c37BBgazDJSHwv3nX9AP5GgY15xaeVedcYmZPCg1/xagP6CA0/Ib6fE82dMrskpKLplc6EeaPGDeX/YGWE19PBWNc45oqQySedhpQ00yuKCYZj84/omWb/ziLYXTn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783633619; c=relaxed/simple;
	bh=kcnAtQsm2op7NRtVRRuiXyKwECaSEWuTBk2ImF4moDo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=KvRjrjE5Nj/QUYC+WeBencOL6Qxl1mlJncX49ILh7IN585jhU7PCEXbLSWMoja8M6TtEHHYWXY7oN5sFSkJtADtkZ2MNra7C2aOe7b4Rdb1ie/A5gpB0AbswZIP6NXJQxUFEyXhCo0lNuki1cpR+7Saqk6SJsxZWuSxRTipaGc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xqn+x/t0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xqn+x/t0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED9B1F000E9;
	Thu,  9 Jul 2026 21:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783633617;
	bh=kcnAtQsm2op7NRtVRRuiXyKwECaSEWuTBk2ImF4moDo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Xqn+x/t0FvGVHYhAICETQRYhf6PSo0QrmDqV6fxCpsd2yT6RvAEi0lKxYK7ZPacgN
	 9PUBIOpqdC08O32wDWS1AdZGKwjQYOR295xcoijNVRCRxymHfBHaz6jRow/QbU4nN2
	 dJ/ELnWy7ANMMa+rwlNU/pi55e+lPPJKNeEOk7S1KlhnhrB/ZU1aAjaKwFSAOEvWRF
	 UWRPu3IurUeKxHRHFTO2hEW5NzZvL8dB4tceEPtcBp9yqe/lgJHVNyr67YNfSQqg27
	 Xq8TRi5iCNdhnzZgxHmmIn0o16K75+Piwvbq5AASx0x6jRmpMsAMN5kS38+A6HIckS
	 nhkWXgTYcQrNQ==
Date: Thu, 09 Jul 2026 11:46:56 -1000
Message-ID: <1e9799a107d304282794ca51b13906a7@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Silvio Fricke <silvio.fricke@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: workqueue: Fix bracket
In-Reply-To: <20260709142939.404290-2-manuelebner@mailbox.org>
References: <20260709142939.404290-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

Hello, Manuel.

Applied to wq/for-7.3. I dropped the Fixes tag. It's unnecessary for a
doc typo and pointed at the wrong commit.

Thanks.
--
tejun
