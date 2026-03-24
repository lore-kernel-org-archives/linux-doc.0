Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924AD3AC0C6
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 06:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774332942; cv=none; b=owHygU2oTTenkGJtdBXLmYOkDhnaZUtk3+iFED/Y5SkyTMGUgVFaUDMsj2UA+mHQ2k602yugep9HyYyFW50ac0sLxhiqlX+2VMEQa4zNxNm6MKooy0EyYdatqyZNpqmTQ5EeqAho8ftPEdSqTYWxiaLFR/IFutG2kpS9Q6yo8Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774332942; c=relaxed/simple;
	bh=yu3nC6vhpzZez3hZu5WSDBz9l+V7URi8BT2ABBFXuP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WGO34SKRTkZRam7/qXqJV/mfBWCfG7lY7EmPKlZDUpHm5VmgyucZr8O193WMBxX/u4MUhZINyBdQerVwA9vl8G4UvFTNXqPTA+4jsAOJiI4ktGZRP5t6nEnME4kwJe+LuNDG79cpSqMU5tG5AvKriBr9OwdyfZVKYkwh+zJG7NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DKYgr/Mz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKYgr/Mz"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-487035181a7so18794275e9.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 23:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774332939; x=1774937739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mifv6lV/1vhl2tnAgC+pUhj48DLTv7wevR0+F6OEtI0=;
        b=DKYgr/MzsqhaJNVAVJS4cG1jw/uMJhzMwOUA9Ww7W+9y/lplLAW+v3xVYiPpi2iw1n
         wFycdoOVjTYGZo4+7pRrFIdkUNfvMgi98HbqOoNk96n4MKsdtZW/leHJWxbWRb0yA6P/
         QgA2jS00cSJip6Lv6AlKdRjlSPKttK8ogy7r13O3pAblU5gfu0+AMCvbLeFB9rSkDdCI
         Ujjj6RMxsUnORpIqgzt52DK4NIOqJYOFyvdRRfGe9FIX+dHM7IEs3w6I0xXP/zf+Jysj
         EJZGqti/6LEUZ4tHeb2YkmovL/sypU4LK4ZVMPkN6vnAMPxntIMOAkvHHIAq+vnmsBXg
         p5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774332939; x=1774937739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mifv6lV/1vhl2tnAgC+pUhj48DLTv7wevR0+F6OEtI0=;
        b=CsxgNNVU+Ferde9yEREUVKUpwTpkhVTeV6Mzi0fMvwemtPz/mCRgENuohEW1omboq6
         0WT8eCtBCAVI7nYB4owKrEEo0EBt0Rl1ee6iR/rGD2rnqOptV3fhhaLnL0yYheiEHzJ9
         9B/LzYYmSYbd6F1LscwtMfbLRGaI2UF004tVkoWRjbCJQZs5Cms6xMMiGXTOPWTS3QPg
         vEKJ6oWLLvy4qHSdlrKJhswrv7RyPPlG+rUmxOZzh7bSlJng3dVTPx1jS/IDTd3WCdEQ
         GMrgxviIRh9IS6ezQUl8rw9Qf5kQIufwJcdDx/hJM4bFTcN56o8b6RW1zWYqr72tU8ad
         aw9A==
X-Forwarded-Encrypted: i=1; AJvYcCXJmOKk7UZWVv0mSkt+Ifk1SXt8vbWNxhW7DyRCZkrZ+FskHZZt2tGwjMFmml0PBimyYoJQglq+KiE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6/D2Niftws3BzO3gwgHGz431TFZT+J0nx7LFD7Czenwl9e83n
	ttQOaWE3/7M6DdpSQ7gyzkgEcqfQVqyCBOYZrYkhFye15Q00rAJNT7qf
X-Gm-Gg: ATEYQzwpLpDHoMAtqHSqUiSBU1AaJxjhq7nbrOyh/CqftzkOdhXIMLRly93B4CW73dF
	w2guH0j0UQOKyDU0c2UU+zDaf03MU1+vKKRctY/ag+9tCuwV48Gck5BmTyjDmTk8JsbzLP9FYwK
	Moeawi0n3nw+VFUI0gpFV6WYxp2TTRquAX0suFH1e+Iuo9V9Ivmg6m57pqVdIBYnjFEyOdgic/b
	DjDel0ltfC4WaYBYT/BSXTbJ3vHU94NXsqIXb40lIHggrRlHbDYApbVOaiSlwq19Zfxx0upadTG
	BxvjGc9n2DVwHYKWrBY+JZiCA/kvIBjkgt7IQZB3VPXfidHlzOykzOfXjMlSSThWEwS+ghV1ghR
	l02mSpPIC1CP13VitNoVhdeKmux8jTrjA6VVTH3lzhU+jdJCxkjFi0e1H+74cOu83T1ZM+btxQP
	jsPEX68TRnSHX/yFKnI2o=
X-Received: by 2002:a05:600c:8b25:b0:480:6bef:63a0 with SMTP id 5b1f17b1804b1-486fee0d8cdmr212926635e9.21.1774332938609;
        Mon, 23 Mar 2026 23:15:38 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48710fe6f86sm13091615e9.6.2026.03.23.23.15.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 23:15:36 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: babu.moger@amd.com
Cc: kvm@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v2 00/16] fs,x86/resctrl: Add kernel-mode (e.g., PLZA) support to the resctrl subsystem
Date: Tue, 24 Mar 2026 09:15:31 +0300
Message-ID: <20260324061531.3221932-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773347820.git.babu.moger@amd.com>
References: <cover.1773347820.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please, remove me from CC list in future versions of this patchset

-- 
Askar Safin
