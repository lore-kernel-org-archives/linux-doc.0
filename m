Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531AE3E9594
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 06:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774334584; cv=none; b=EPg4za9u+OiPXkRZ4ott1G5QMOy5UestNRqflvneXKVwedGV32R+5ghw47Q69lsigRlKBg1lmQMwAoedmKNoR3SRjMPpsrJPSljG7aKNr5iVhYSskuLTB2wNMdEfreAQjUVz0pZz758bJyakRNWQajvxf9mFONPoq46mFh2wQak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774334584; c=relaxed/simple;
	bh=yu3nC6vhpzZez3hZu5WSDBz9l+V7URi8BT2ABBFXuP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mTsYysvW6BynZr+pcRbeSI8LmimdsJDSy7lytiBLwN0ZniIGAY7HwquYqz/K5apwl2BRsw7Rlt5B2eBirxUYgM93J5FmJCLelatEhsZignBhgHj+qZRXrnjkCO51nCm//YKA8Hzmei72lOb1QMC1cIzV8xpsPyyRIHkp931osls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BgBSwq0X; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BgBSwq0X"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so5984145e9.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 23:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774334572; x=1774939372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mifv6lV/1vhl2tnAgC+pUhj48DLTv7wevR0+F6OEtI0=;
        b=BgBSwq0XGX55XxIPHkyReappFqNPHlYbS9wRox59BhY2ggelsZwG3qm3tAES+H8Wo6
         xUxtExLkAphLnNdwGId6ojdg6SNgtgBBoWu25lX0PL7BglUtngFLRhI/95DV+Dp8nYav
         Z1USzY0G8VLWMwimeg+bCFqrnrjOfYk99G9fxAxj9BqAF+lEuR/MRzxu6NXgpynfFwNm
         6X7KzIHSkh//xhBxNDrv1kroTDXtZUaMw3uhbGltsaCATeqsKT7VglrUHHUWpsi/vBAt
         QisqXy8QtY+5GTVDlCgt1n4pipKTAmbiCOXtOPi0V+8X3CDeK8CpNOVTc5Nsw5JmDM4S
         ZPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774334572; x=1774939372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mifv6lV/1vhl2tnAgC+pUhj48DLTv7wevR0+F6OEtI0=;
        b=cnagAEKwnL8yZJxD5Pxrgs351rQ7DZXdS8vZCZp8vRz62wClJrXrU9/U1IgyhqpQhQ
         gVXAaTPRtT9jZNM+ckFLxPs64NiYWtJatfUwYXdFGHn82JjYzu+/N7E5vCpSWAFL2QQF
         +cZArlTfsbOBxyMeKvhlTBfYu9CEvlW0Nm5kfAetqEV7vN18aPR7j/d9poYbqCT4QDqY
         t1uICnR9ITSdF3UwLLxwhjS3yDFoo8lfaz7M8XgVCr/q5sLo9cHlysftf7laf6p8wm38
         JTkNtak0znseYYE+qFEthpw3WsWMWpGtZ/dnUtpG29WXo8GbGrUanffMCCFnfSQ44zcB
         tOJg==
X-Forwarded-Encrypted: i=1; AJvYcCUIljjbJLLA/4rodWkwf/SRLwOpaN+quHCx8mr/Schk+CqHHgFG1EZO0twJiZNkessv64wtlwfHpjw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0feaoqSIuZv9MASqahPN8BWvVq+5UCKqDAhWGr2upE3MXoiKH
	AHrQtcvwDTI0EOPtyAvTbzRouaAaMs4nlZc7Vma/qH4+aJ7p5K6khyC+
X-Gm-Gg: ATEYQzxV0chHpbPwU9kmtyH4kqrpu6ksrZnFLXMiSyiCAk+wbNHaJig8jLo0gSov4Ae
	6NKjQTEmObzb4IDEZuNJPuKORNKfMOTwiZKudPRdC2eI6dEVlQd3a1WXwzVbgFf1IENcnnmwf+/
	PsAxLOCn7/j1g+sRfLOXuOaWhEPvHGgz0KCC5oPGboa9nzSRUEsb3Xj9Q2Gkj2LQfAMruGDFD5v
	LXFjdx/mfs6z0mZeMfAVbi930Yj+BJrbEPFe+TAFM+AuHBpxUrSIo7RE5ahkfQ2YoLmLgjZ2VZ4
	RqQu9yH8QFqz5JhCw/iyFAsPROdwZXXSIdOtHB5ed366N5oMlGExW+bpYgWdokGmBwFUaypzqEO
	aUKiPBYny6pSoTZAssXIwgm3DDhi8XBG4iKIrc7XRipnjZMS/e8NaId2trrAOcgw45TlrB3Ylvh
	OF9xAxrlaaUwVhlOqTCVs=
X-Received: by 2002:a05:600c:8b31:b0:485:9a50:3369 with SMTP id 5b1f17b1804b1-486fee304c4mr210200845e9.29.1774334572299;
        Mon, 23 Mar 2026 23:42:52 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48711116cbfsm10881105e9.35.2026.03.23.23.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 23:42:50 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: dmatlack@google.com
Cc: kexec@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v3 00/24] vfio/pci: Base Live Update support for VFIO device files
Date: Tue, 24 Mar 2026 09:42:47 +0300
Message-ID: <20260324064247.3271583-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323235817.1960573-1-dmatlack@google.com>
References: <20260323235817.1960573-1-dmatlack@google.com>
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
