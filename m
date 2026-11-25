Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630961;
	b=0ep0LhqIGJ29fL4KvhDfhpMqwUkhpVP7YVS207RgkN+DhSjaYj1jhYcGxctAxpqOR+VP
	 CZOMTv0pfeIo2hXkvsETQovNWJbsCJZttfR3Ywp0akBythXlBRvzlBJdQWyAfLr5el1D8
	 ginTyva8x8ciHJctBcxncE29qbws/n92b8VTxq0KVuU6WcghiYSHDslY6eXQo+gjkjhH5
	 xM3gRkq45wKXrZKjtyEfVhGrFjQFbpV3Rdila0dTcXace2xGoNBPhwFZvoqu1/goD7HH/
	 PjBhRpt5HawmTdw0/P2rpJ7N9LR+OunS13BqD1Z4Zj0xQeIhv1/AVVaxn8H9S1yfxdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=sfEVlacBV97ie02thpjOgM2D6cDC2tSVCZoWDEnfrKo=;
	b=xegiQ1xRry8ErvI0dJK687bIPPFsB8/ynyCf6+vyC0vb2NsN0flfisj8zBRAZnD0HDOE
	 VNwsY7VVekAuL0gAw32R8fCOSlDCNSakcNL1PVQxuORUvBdY/llYvboFLC8lS+1PzujUL
	 6TdX6bXX3DDFAB8262RpQ84IeWi2q4SDqhTSjyhZ2gPsipEdSd1xYEMxefOGNd/0Cme7b
	 bkBs/KBavhFVpZ9KSuL9Tb/Ck7aZTZ18YiFscm6sF2/hlGHzWAaDULkm9v4Yy4xtFup7X
	 KNHVsgvEqR2sdR6WnHUnqBlCpuPFpXaqPhGI54wjOLsw2ty6QxfLLmeTevkDKMo/CbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XltHJeJc;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E509606A334
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 18:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E509606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XltHJeJc
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f053f9631cso70353335ad.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 10:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795630961; x=1796235761; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sfEVlacBV97ie02thpjOgM2D6cDC2tSVCZoWDEnfrKo=;
        b=XltHJeJcafnoz7rWSdh67DNM8cUVU33Kf/95Saqoq1SakVT7WitG6OsBqDZPGchsCE
         y/G1PGTFqEJu0lBEmJpEIiHh2bs+IcYU8n5pRQb6MCXjpvL2vVXWyjr78fxLTeBKFKQH
         LbZNOzgfAlbMrtPg3br43/a0SJZBBByAaTgwqOI1btWwBNj5Ty//bbU2AK1YZTsmpv+P
         Rx1sqeQZDnE6Me/PAQ2VZSIlCF1Pj+UVs+co5YrbldjuVaIcAFJ5jyFNTi9XJNwyBgom
         juH/Li+nPLPJ/sXNQ9fbhC3+mMLejxLcvsDBSkMQCDsTkfuIdqvNpOGCTIPpHqYCNwEs
         6FOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630961; x=1796235761;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sfEVlacBV97ie02thpjOgM2D6cDC2tSVCZoWDEnfrKo=;
        b=ajVvkU0oybaSb0374Y6M148nhs7nrjN3nH9pvxPJoLPJKTPl07ZrG254Jv3AP9NVzg
         1Ju9/fgCVEOPm0mw4DvOCOSGz6bftogc9ZTiE/d+tygw/WLXQ2w8m8V/79MC7u5/QfSX
         u2iqkjar26GqxqxPqk732RXPj+bYWX3Pt8BC3vtlyfXGidSCvqtBYhjTfRhLtMbSqOpq
         vUReD3bijL6SzDPsslsYp7WiG9pu78OzhfwYOLjpoOGu7rSC5Ucu4S+c0le4I+WCb/sK
         YbhNwclSMqZXEzf1YSVUG5iNtfWksEBjEzXXSzLUN+kTR+omsYQApAIwIRou3/5Q1ucF
         W76w==
X-Forwarded-Encrypted: i=1; AL+hErGi+MyV9F/6AaXkDaPgIbu+vqpvRklmIqc0yS8sXBlPwZFg9zln5k6MQ73+XN5phc97ZVcS7d0NvV8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ObycW57OtdrPTelErphpjwicHH5TXq3vfZOZpfgPMXtd+mi9p
	xUxmW6OlLlxguE+GzfXSn94pJuaIOQ3vnQphvNn8qBAfHA4hmRqAQjwR6MEmvMp8JtlzVhTdRGA
	X5FYTeKO8jG2VzYMY8Aey+HkgeSLZ+a9i2w==
X-Received: from plau5.prod.google.com ([2002:a17:903:3045:b0:2f0:349:b3a4])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ce85:b0:2f0:3e44:4761 with SMTP id d9443c01a7336-2f03f25e801mr195497385ad.54.1795630960732;
 Wed, 25 Nov 2026 10:22:40 -0800 (PST)
Date: Wed, 25 Nov 2026 18:22:40 +0000
In-Reply-To: <115e024d-f49b-256f-550c-7a64b546a076@linux.intel.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125-pcie-link-endpoints-v8-0-19d49c17c05f@google.com>
 <20261125-pcie-link-endpoints-v8-1-19d49c17c05f@google.com> <115e024d-f49b-256f-550c-7a64b546a076@linux.intel.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125182240.2292209-1-rathodpriyank@google.com>
Subject: Re: [PATCH v8 1/3] PCI/ASPM: Add internal pcie_aspm_inhibit() helper
From: Priyank Rathod <rathodpriyank@google.com>
To: "=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lukas Wunner <lukas@wunner.de>, Manivannan Sadhasivam <mani@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-pci@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ilpo,

Thanks for the feedback.  I reached out to Manivannan, Bjorn, and you on
the ASPM thread to check whether Manivannan has a v4 in progress or if I
can take over finishing the core ASPM changes cleanly first, and to align
on the per-state counter API details before implementing it.

Also noted on avoiding bullet lists in commit messages, and I will fix the
port->dev lifetime issue in pci_lmr_release() that sashiko-bot flagged on
patch 2/3 when preparing the next revision on top of the ASPM prerequisite.

Thanks,
Priyank
